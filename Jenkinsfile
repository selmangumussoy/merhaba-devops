pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-id') // Jenkins’e eklenen Docker Hub credentials
        IMAGE_NAME = 'sgumussoy/merhaba-devops:v1'           // Docker Hub’daki image ismi
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'master', 
                    url: 'https://github.com/selmangumussoy/merhaba-devops.git', 
                    credentialsId: 'github-token'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(IMAGE_NAME)
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-id') {
                        docker.image(IMAGE_NAME).push()
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                withCredentials([file(credentialsId: 'kubeconfig-file', variable: 'KUBECONFIG')]) {
                    sh """
                        kubectl set image deployment/projem projem=$IMAGE_NAME
                        kubectl rollout status deployment/projem
                    """
                }
                
            }
        }
    }
}
