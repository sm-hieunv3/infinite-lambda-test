pipeline {
    agent any
    parameters {
        string(name: 'GIT_URL', defaultValue: 'https://github.com/sm-hieunv3/infinite-lambda-test.git', description: 'clone url')
    }
    environment {
        AWS_ACCESS_KEY_ID     = credentials('admin_access_key')
        AWS_SECRET_ACCESS_KEY = credentials('admin_secret_key')
        aws_registry = '201690130869.dkr.ecr.ap-southeast-1.amazonaws.com'
        app_repo = 'devops-app'
        dockerImage = ''
        aws_region = 'ap-southeast-1'
        TF_VAR_database_password = credentials('database_password')
        AWS_DEFAULT_REGION = 'ap-southeast-1'
        bucket_web = 'nguyenhieu8790-web'
    }
    stages {
        stage('clone given GIT repository') {
            steps {
                script {
                    checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: "${GIT_URL}"]]])
                }
            }
        }

        stage('terraform  plan') {
            steps {
                script {
                    sh '''
                    export PATH=$PATH:/opt
                    cd terraform
                    terraform init -input=false
                    terraform plan -input=false -out tfplan  --var-file=terraform.tfvars
                    terraform show -no-color tfplan > tfplan.txt
                    '''
                }
            }
        }
        stage('Approval') {
            when {
                not {
                    equals expected: true, actual: params.autoApprove
                }
            }
            steps {
                script {
                    def plan = readFile 'terraform/tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                }
            }
        }
        stage('terraform apply') {
            steps {
                sh '''
                cd terraform
                terraform apply -input=false tfplan
                '''
            }
        }

        stage('Building and Upload image') {
            steps{
                        sh '''
                            cd app
                            docker build . -t "${aws_registry}/${app_repo}:${BUILD_ID}"
                            docker login --username AWS -p $(aws ecr get-login-password --region ${aws_region} )  "${aws_registry}"
                            docker push "${aws_registry}/${app_repo}:${BUILD_ID}"
                        '''
            }
        }
        stage('deploy s3 bucket web') {
            steps{
                        sh '''
                            cd s3bucket-web
                            aws s3 sync . s3://"${bucket_web}"/ --delete
                        '''
            }
        }
    }
}
