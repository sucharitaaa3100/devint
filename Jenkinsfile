pipeline {
    agent any
    stages {
        stage('Clone repository') {
            steps {
                git 'https://github.com/sucharitaaa3100/devint.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh './deploy.sh'
            }
        }
    }
}

