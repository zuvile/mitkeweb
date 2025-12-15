# Gemini Project Context: mitkeweb

This file contains instructions for building and managing the Hugo-based website for a fantasy writer.

## Prerequisites

*   **Hugo:** Ensure Hugo is installed.
    *   macOS: `brew install hugo`
    *   Check version: `hugo version`

## Common Commands

### 1. Run Development Server
To start the local development server with live reloading (including drafts):
```bash
hugo server -D
```
Access the site at: `http://localhost:1313/`

### 2. Build for Production
To generate the static site in the `public/` directory:
```bash
hugo
```
*   The output will be in the `public/` folder.
*   This folder is what gets deployed to your hosting provider.



## Project Structure Highlights

*   **`hugo.toml`**: Main configuration file.
*   **`content/`**: Markdown files for pages and posts.
*   **`themes/poison`**: The active theme.
*   **`static/`**: Assets like images (`static/images/`) that are copied directly to the build.
*   **`public/`**: The generated static site (do not edit files here directly).

## Terraform

This project uses Terraform to manage Cloudflare resources.

### Important Notes:

*   **Never run `terraform apply` directly.** Changes should be reviewed and applied through the CI/CD pipeline or by an authorized maintainer.
*   The Terraform configuration is primarily for defining and updating Cloudflare infrastructure setup.

### Common Commands:

1.  **Initialize Terraform:**
    ```bash
    export SOPS_AGE_KEY_FILE=~/.config/sops/age/keys.txt # Or your preferred method for providing the SOPS key
    source terraform/.envrc
    terraform init
    ```
2.  **Review Proposed Changes:**
    ```bash
    export SOPS_AGE_KEY_FILE=~/.config/sops/age/keys.txt # Or your preferred method for providing the SOPS key
    source terraform/.envrc
    terraform plan
    ```

