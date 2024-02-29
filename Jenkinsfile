properties([ parameters([
  string( name: 'CLUSTER_NAME', defaultValue: ''),
  string( name: 'REGION', defaultValue: ''),
  string( name: 'WORKER_MIN_NODE_COUNT', defaultValue: ''),
  string( name: 'WORKER_MAX_NODE_COUNT', defaultValue: ''),
  string( name: 'WORKER_NODE_SIZE', defaultValue: ''),
]), pipelineTriggers([]) ])

// Environment Variables.
env.region = REGION
env.environment = CLUSTER_NAME
env.min_node_count = WORKER_MIN_NODE_COUNT
env.max_node_count = WORKER_MAX_NODE_COUNT
env.node_vm_size = WORKER_NODE_SIZE

pipeline {
    
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_ACCESS_KEY_ID')
    }

    agent any
    
    stages {
        stage('Git Checkout'){
            steps{
                git branch: 'main', credentialsId: 'cred', url: 'https://github.com/Dhruvin4530/EKS_Jenkins'
            }
        }
        stage('Terraform init'){
            steps{
              sh "export TF_VAR_region='${env.region}' && export TF_VAR_env.environment='${env.environment}' && export TF_VAR_env.min_node_count='${env.min_node_count}' && export TF_VAR_env.max_node_count='${env.max_node_count}' && export TF_VAR_env.node_vm_size='${env.node_vm_size}' && terraform init"
            }
        }
        stage('Terraform plan'){
            steps{
              sh "export TF_VAR_region='${env.region}' && export TF_VAR_env.environment='${env.environment}' && export TF_VAR_env.min_node_count='${env.min_node_count}' && export TF_VAR_env.max_node_count='${env.max_node_count}' && export TF_VAR_env.node_vm_size='${env.node_vm_size}' && terraform plan"
            }
        }
        stage('Approval') {
            steps {
                script {
                    def userInput = input(id: 'Confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'Confirm'] ])
                }
            }
        }
        stage('Terraform apply'){
            steps{
               sh "export TF_VAR_region='${env.region}' && export TF_VAR_env.environment='${env.environment}' && export TF_VAR_env.min_node_count='${env.min_node_count}' && export TF_VAR_env.max_node_count='${env.max_node_count}' && export TF_VAR_env.node_vm_size='${env.node_vm_size}' && terraform apply -input=false myplan"   
            }
        }
    }
  }