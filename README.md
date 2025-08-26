🚀 Kubernetes Demo Project – Terraform + GitHub Actions + AKS
🎯 Goal

Automate the deployment of a Kubernetes cluster on Azure (AKS) and run a sample Guestbook app inside it, using Terraform and GitHub Actions.

📂 Project Structure
.
├─ infra/
│  └─ terraform/       # Terraform files to create AKS cluster
├─ apps/
│  └─ guestbook/       # Kubernetes manifests for the Guestbook app
└─ .github/workflows/  # GitHub Actions pipeline

⚙️ Prerequisites

Azure account with an active subscription.

Terraform (≥ 1.7.0) installed locally if you want to test manually.

GitHub repository where this project is pushed.

Federated credentials (OIDC) with Azure linked to GitHub Actions.

In your GitHub repo, add the following secrets (⚙️ Settings → Secrets → Actions):

AZURE_CLIENT_ID

AZURE_TENANT_ID

AZURE_SUBSCRIPTION_ID

🛠️ How It Works
1. Infrastructure – Terraform

Defines an Azure Resource Group and an AKS cluster.

Run automatically inside GitHub Actions.

2. Application – Kubernetes manifests

namespace.yaml → creates a namespace guestbook.

deployment.yaml → deploys 2 pods of the guestbook app.

service.yaml → exposes the app with a public LoadBalancer.

3. Automation – GitHub Actions

Each time you push to main:

Logs into Azure with OIDC.

Runs Terraform to create/update the AKS cluster.

Gets AKS credentials and configures kubectl.

Deploys the Guestbook app manifests.

Waits for an external IP and shows the app URL.

▶️ Usage

Fork/clone this repo.

Configure the Azure OIDC + GitHub secrets.

Push to main branch.

Check the Actions tab in GitHub.

At the end, you’ll see something like:

App disponible: http://<EXTERNAL_IP>


Open the link in your browser 🎉

🔮 Next Steps

Add Ingress + Cert-Manager for HTTPS + domain name.

Use Argo CD / Flux CD for GitOps instead of raw kubectl.

Add monitoring (Prometheus, Grafana) and logging (Loki/ELK).
