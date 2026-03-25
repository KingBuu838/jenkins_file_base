pipeline {
    agent any
   
    environment {
        AWS_REGION = 'us-east-1' 
    }
    stages {
        stage('Set AWS Credentials') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'JenkinsGroup' 
                ]]) {
                    sh '''
                    echo "AWS_ACCESS_KEY_ID: $AWS_ACCESS_KEY_ID"
                    aws sts get-caller-identity
                    '''
                }
            }
        }
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/KingBuu838/jenkins_file_base' 
            }
        }

        // stage('Testing') {
        //     // withEnv(["JFROG_BINARY_PATH=${tool 'jfrog-cli'}"]) {
        //     // // The 'jf' tool is available in this scope.
        //     // }
        //     steps {
        //         withCredentials([string(credentialsId: 'jfrog-creds', variable: 'JFROG_TOKEN')]) {
        //             // Show the installed version of JFrog CLI
        //             jf '-v'
                    
        //             // Show the configured JFrog Platform instances
        //             jf 'c show'
                    
        //             // Ping Artifactory
        //             jf 'rt ping'
                    
        //             // Create a file and upload it to the repository
        //             sh 'touch test-file'
        //             // Fixed upload command syntax
        //             sh 'jf rt upload test-file tf-terraform/ --url=https://trial7zoppg.jfrog.io/artifactory/ --user=mcdonald.dm.aaron@gmail.com --password=$JFROG_TOKEN'
                    
        //             // Publish the build-info to Artifactory
        //             jf 'rt bp'
                    
        //             // Fixed download command syntax
        //             sh 'jf rt download tf-terraform/test-file --url=https://trial7zoppg.jfrog.io/artifactory/ --user=mcdonald.dm.aaron@gmail.com --password=$JFROG_TOKEN'
        //         }
        //     } 
        // }
    
        stage('Initialize Terraform') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'JenkinsGroup'
                ]]) {
                    sh '''
                    export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                    export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
                    terraform init -reconfigure-migrate-state -input=false
                    '''
                }
            }
        }

        stage('Plan Terraform') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'JenkinsGroup'
                ]]) {
                    sh '''
                    export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                    export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
                    terraform plan -out=tfplan
                    '''
                }
            }
        }
        stage('Apply Terraform') {
            steps {
                input message: "Approve Terraform Apply?", ok: "Deploy"
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'JenkinsGroup'
                ]]) {
                    sh '''
                    export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                    export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
                    terraform apply -auto-approve tfplan
                    '''
                }
            }
        }
    }
    post {
        success {
            echo 'Terraform deployment completed successfully!'
        }
        failure {
            echo 'Terraform deployment failed!'
        }
    }
}