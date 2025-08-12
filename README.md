# Infrastructure Engineering Challenge 

 Design an infrastructure of a production-ready website using AWS services with Infrastructure as Code concepts baked in. 

##  Current Implementation 

### Architecture Overview 

``` 

Internet → CloudFront CDN → S3 Static Website → Route 53 DNS 

``` 

### Deployed Solution 

- **Static Website**: An S3 bucket is configured for static website hosting. 

- **CDN**: A CloudFront distribution is set up for global content delivery. 

- **DNS**:  Route 53 hosted zone as well as domain routing is utilized. 

- **SSL/TLS**: AWS Certificate Manager is used for HTTPS. 

- **Infrastructure as Code**: Resource management is done using Terraform. 

- **CI/CD**: Deployments are automated using GitHub Actions. 

### Quick Start 

```bash 

# Clone repository 

git clone https://github.com/your-username/infrastructure-challenge 

cd infrastructure-challenge 

# Configure AWS credentials 

aws configure 

# Deploy infrastructure 

cd terraform 

terraform init 

terraform plan 

terraform apply 

# Deploy website content 

aws s3 sync ../website s3://$(terraform output -raw s3_beta_name) --delete 

``` 

##  Infrastructure Components 

### Current Architecture 

- **S3 Bucket**: A static website hosted with public read access. 

- **CloudFront**: CDN with defined cache behaviors and compression enabled. 

- **Budget Alerts**: Monitors expenses and sends email alerts. 

- **Security**: Encrypted backups and versioning. Secure management with strict IAM policies. 


