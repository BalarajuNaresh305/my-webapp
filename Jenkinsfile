pipeline {
    agent any
    stages {
        stage('Checkout Code') {
            steps {
                git credentialsId: 'your-credentials-id', url: 'https://github.com/BalarajuNaresh305/my-webapp.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image with the name 'my-webapp-image'
                    def app = docker.build('my-webapp-image')
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container on port 8081
                    docker.image('my-webapp-image').run('-d -p 8081:8080')
                }
            }
        }
    }
}
