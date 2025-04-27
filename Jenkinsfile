pipeline {
    agent any
    tools {
        // Specify the Docker installation defined in Jenkins global tool configuration
        docker 'docker' // 'docker' is the name you assigned to Docker in the Jenkins tool configuration
    }
    environment {
        DOCKER_IMAGE_NAME = 'my-webapp-image'
    }
    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/BalarajuNaresh305/my-webapp.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image with the name 'my-webapp-image'
                    docker.build('my-webapp-image')
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container on port 8081 (so Jenkins stays on 8080)
                    docker.image('my-webapp-image').run('-d -p 8081:8080')
                }
            }
        }
    }
}
