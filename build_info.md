Started by GitHub push by KingBuu838
Obtained Jenkinsfile from git https://github.com/KingBuu838/jenkins_file_base.git
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/Jenkins_pipe_webhook
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Declarative: Checkout SCM)
[Pipeline] checkout
Selected Git installation does not exist. Using Default
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --resolve-git-dir /var/lib/jenkins/workspace/Jenkins_pipe_webhook/.git # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url https://github.com/KingBuu838/jenkins_file_base.git # timeout=10
Fetching upstream changes from https://github.com/KingBuu838/jenkins_file_base.git
 > git --version # timeout=10
 > git --version # 'git version 2.50.1'
 > git fetch --tags --force --progress -- https://github.com/KingBuu838/jenkins_file_base.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/main^{commit} # timeout=10
Checking out Revision 17fd154f3029913e471f27c2ec3d80ef18482534 (refs/remotes/origin/main)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 17fd154f3029913e471f27c2ec3d80ef18482534 # timeout=10
Commit message: "test webhook"
 > git rev-list --no-walk 826a0e137ec3d08ff25b98a8c175fee9fc8d53be # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] withEnv
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Set AWS Credentials)
[Pipeline] withCredentials
Masking supported pattern matches of $AWS_ACCESS_KEY_ID or $AWS_SECRET_ACCESS_KEY
[Pipeline] {
[Pipeline] sh
+ echo 'AWS_ACCESS_KEY_ID: ****'
AWS_ACCESS_KEY_ID: ****
+ aws sts get-caller-identity
{
    "UserId": "AIDA52ZFLYANEDT5N5OM4",
    "Account": "950876749850",
    "Arn": "arn:aws:iam::950876749850:user/JenkinsGroup01"
}
[Pipeline] }
[Pipeline] // withCredentials
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Checkout Code)
[Pipeline] git
Selected Git installation does not exist. Using Default
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --resolve-git-dir /var/lib/jenkins/workspace/Jenkins_pipe_webhook/.git # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url https://github.com/KingBuu838/jenkins_file_base.git # timeout=10
Fetching upstream changes from https://github.com/KingBuu838/jenkins_file_base.git
 > git --version # timeout=10
 > git --version # 'git version 2.50.1'
 > git fetch --tags --force --progress -- https://github.com/KingBuu838/jenkins_file_base.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/main^{commit} # timeout=10
Checking out Revision 17fd154f3029913e471f27c2ec3d80ef18482534 (refs/remotes/origin/main)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 17fd154f3029913e471f27c2ec3d80ef18482534 # timeout=10
 > git branch -a -v --no-abbrev # timeout=10
 > git branch -D main # timeout=10
 > git checkout -b main 17fd154f3029913e471f27c2ec3d80ef18482534 # timeout=10
Commit message: "test webhook"
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Initialize Terraform)
[Pipeline] withCredentials
Masking supported pattern matches of $AWS_ACCESS_KEY_ID or $AWS_SECRET_ACCESS_KEY
[Pipeline] {
[Pipeline] sh
+ export AWS_ACCESS_KEY_ID=****
+ AWS_ACCESS_KEY_ID=****
+ export AWS_SECRET_ACCESS_KEY=****
+ AWS_SECRET_ACCESS_KEY=****
+ terraform init
[0m[1mInitializing the backend...[0m
[0m[1mInitializing provider plugins...[0m
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v6.37.0

[0m[1m[32mTerraform has been successfully initialized![0m[32m[0m
[0m[32m
You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.[0m
[Pipeline] }
[Pipeline] // withCredentials
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Plan Terraform)
[Pipeline] withCredentials
Masking supported pattern matches of $AWS_ACCESS_KEY_ID or $AWS_SECRET_ACCESS_KEY
[Pipeline] {
[Pipeline] sh
+ export AWS_ACCESS_KEY_ID=****
+ AWS_ACCESS_KEY_ID=****
+ export AWS_SECRET_ACCESS_KEY=****
+ AWS_SECRET_ACCESS_KEY=****
+ terraform plan -out=tfplan
[0m[1maws_s3_bucket.frontend: Refreshing state... [id=jenkins-bucket-20260325114609788000000001][0m

[0m[1m[32mNo changes.[0m[1m Your infrastructure matches the configuration.[0m

[0mTerraform has compared your real infrastructure against your configuration
and found no differences, so no changes are needed.
[Pipeline] }
[Pipeline] // withCredentials
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Apply Terraform)
[Pipeline] input
Approve Terraform Apply?
Deploy or Abort
Approved by joetolliver
[Pipeline] withCredentials
Masking supported pattern matches of $AWS_ACCESS_KEY_ID or $AWS_SECRET_ACCESS_KEY
[Pipeline] {
[Pipeline] sh
+ export AWS_ACCESS_KEY_ID=****
+ AWS_ACCESS_KEY_ID=****
+ export AWS_SECRET_ACCESS_KEY=****
+ AWS_SECRET_ACCESS_KEY=****
+ terraform apply -auto-approve tfplan
[0m[1m[32m
Apply complete! Resources: 0 added, 0 changed, 0 destroyed.[0m
[Pipeline] }
[Pipeline] // withCredentials
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] echo
Terraform deployment completed successfully!
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
