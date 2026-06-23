# Enterprise Azure Platform — Simple

Short: Terraform + CI/CD to deploy a small web app to Azure App Service (Dev/QA/Prod).

Why this repo: makes it easy to provision infra and deploy the `application/` folder.

Quick open files:
- [main.tf](main.tf) — root Terraform
- [application/index.html](application/index.html) — sample app
- [pipeline/infra.yaml](pipeline/infra.yaml) — infra pipeline
- [pipeline/app.yaml](pipeline/app.yaml) — app pipeline

**Folder Structure**

Simple repo tree and short descriptions:

```text
enterprise-azure-platform/
├─ application/        # Static web app (HTML/CSS/JS) to deploy
├─ infrastructure/     # Terraform code and reusable modules
│  ├─ environments/    # Per-environment variable files (dev/qa/prod)
│  │  ├─ dev/
│  │  ├─ qa/
│  │  └─ prod/
│  └─ modules/         # Reusable Terraform modules
│     ├─ app-service/
│     ├─ app-service-plan/
│     ├─ resource-group/
│     └─ storage-account/
├─ pipeline/           # CI/CD manifests (infra and app)
├─ main.tf             # Top-level Terraform orchestration
├─ providers.tf        # Terraform providers and backend settings
└─ variables.tf        # Root-level variables
```

Quick file pointers:
- `application/index.html` — sample app entry point.
- `infrastructure/modules/*` — reusable modules for common resources.
- `infrastructure/environments/*/terraform.tfvars` — env-specific inputs.
- `pipeline/infra.yaml` and `pipeline/app.yaml` — CI/CD definitions.

Folder overview (simple):

```text
enterprise-azure-platform/
├─ application/        # static web app files
├─ infrastructure/     # terraform code & reusable modules
│  ├─ environments/    # dev/qa/prod tfvars
│  └─ modules/         # resource-group, storage, app-service, plan
├─ pipeline/           # CI/CD manifests
├─ main.tf             # repo-level Terraform
└─ providers.tf        # providers and backend
```

What to do locally (fast):

1) Serve the app locally (static):

```powershell
cd application
npx http-server -p 8080
# then open http://localhost:8080
```

2) Quick Terraform checks:

```powershell
terraform init
terraform fmt -recursive
terraform validate
terraform plan -var-file=./infrastructure/environments/dev/terraform.tfvars
```

CI/CD notes (short):
- `pipeline/infra.yaml` provisions infra per environment.
- `pipeline/app.yaml` builds and deploys `application/` to the App Service.
- Keep infra and app pipelines separate; require approvals for `prod`.

If you want, I can now:
- Commit this simplified `README.md` for you, or
- Add a one-page Hindi summary at top for your team.

File updated: `README.md`
