pipeline {
    agent any
        parameters {
         choice choices: ['apply', 'destroy'], description: 'Select any one option', name: 'terraform_Infra'
        }
        options {
           buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '10', numToKeepStr: '5')
        }
    stages {
        stage('get code from source code') {
            steps {
               git branch: 'main', credentialsId: 'git-details', url: 'https://github.com/Digsingh86/tool.git'
            }
        }
        stage('terraform init'){
            steps {
                 sh 'terraform init'
            }
        }
        stage('terraform validate'){
            steps {
             sh 'terraform validate'
            }
        }
        stage('terraform plan'){
            steps {
             sh 'terraform plan'
            }
        }
        stage('terraform apply'){
            steps {
             input 'Do you want to proceed ? '
             sh 'terraform ${terraform_Infra} --auto-approve'
            }
        }
    }
}
