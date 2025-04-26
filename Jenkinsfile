pipeline {
    agent any

    tools {
        maven 'Maven3'
        jdk 'Java17'
    }

    environment {
        SONARQUBE = 'SonarQube'
        NEXUS_URL = 'http://your-nexus-server/repository/maven-releases/'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-username/my-webapp.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh 'mvn sonar:sonar'
                }
            }
        }

        stage('Upload Artifact to Nexus') {
            steps {
                sh 'mvn deploy -DaltDeploymentRepository=nexus::default=${NEXUS_URL}'
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                sh 'curl -v -u tomcat:tomcat --upload-file target/*.war http://your-tomcat-server:8080/manager/text/deploy?path=/my-webapp&update=true'
            }
        }
    }
}
