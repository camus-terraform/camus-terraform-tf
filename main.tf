# Busca la instalación de la GitHub App que hiciste en el paso 4.1
data "tfe_github_app_installation" "this" {
  name = var.github_org
}

resource "tfe_project" "github" {
  name = "${var.org_slug}-github"
}

resource "tfe_workspace" "github" {
  name                = "${var.org_slug}-github"
  project_id          = tfe_project.github.id
  auto_apply          = false   # apply manual
  speculative_enabled = true    # planes en los PR

  vcs_repo {
    identifier                 = "${var.github_org}/${var.org_slug}-github-tf"
    branch                     = "main"
    github_app_installation_id = data.tfe_github_app_installation.this.id
  }
}

# Le pasamos al nuevo workspace el token de GitHub que necesitará
resource "tfe_variable" "github_token" {
  key          = "GITHUB_TOKEN"
  value        = var.github_token
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.github.id
}