#!/bin/bash
# Commands to create GitHub repository and push code

echo "🚀 Creating GitHub repository and pushing code..."

# 1. Initialize git repository
git init

# 2. Create .gitignore file
cat > .gitignore << 'EOF'
# Terraform
*.tfstate
*.tfstate.*
*.tfplan
*.tfvars
!terraform.tfvars.example
.terraform/
.terraform.lock.hcl
terraform.rc

# AWS
.aws/

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Logs
*.log

# Temporary files
*.tmp
*.temp

# Environment variables
.env
.env.local
.env.*.local

# Node modules (if using npm/yarn)
node_modules/

# Python
__pycache__/
*.py[cod]
*$py.class

# Archives
*.zip
*.tar.gz
*.rar

# Script files (optional - remove if you want to include them)
create-infrastructure-challenge.sh
EOF

# 3. Add all files to git
git add .

# 4. Create initial commit
git commit -m "Initial commit: Infrastructure Engineering Challenge solution

- Complete AWS infrastructure with Terraform
- S3 static website hosting with CloudFront CDN
- Production-ready architecture with monitoring
- Comprehensive documentation and deployment scripts
- Clean website design without logos/emojis
- CI/CD pipeline with GitHub Actions"

# 5. Create GitHub repository using GitHub CLI (make sure you're logged in)
gh repo create infrastructure-challenge --public --description "Infrastructure Engineering Challenge - AWS static website with Terraform, S3, CloudFront" --clone=false

# 6. Add GitHub remote
git remote add origin https://github.com/santoshreturi/infrastructure-challenge.git

# 7. Push to GitHub
git branch -M main
git push -u origin main

echo "✅ Repository created and code pushed successfully!"
echo "🌐 Repository URL: https://github.com/santoshreturi/infrastructure-challenge"
echo ""
echo "Next steps:"
echo "1. Go to your GitHub repository"
echo "2. Add AWS credentials to GitHub Secrets (if you want CI/CD):"
echo "   - AWS_ACCESS_KEY_ID"
echo "   - AWS_SECRET_ACCESS_KEY"
echo "3. Edit terraform/terraform.tfvars with your configuration"
echo "4. Deploy: cd terraform && terraform init && terraform apply"
