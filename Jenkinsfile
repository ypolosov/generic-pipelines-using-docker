pipeline {
    agent { 
        docker {
            image 'node:lts' 
        }
    }
    environment {
        PROJECT_DIR = 'app-1'
    }
    stages {
        stage('Config') {
            steps {
                checkout scm
                echo 'Hello Config'
            }
        }
        stage('Ci') {
            steps {
                echo 'Hello Ci'
                sh './agnostic-pipeline/stages/01_ci.sh'
            }
        }
        stage('Build') {
            steps {
                echo 'Hello Build'
                sh './agnostic-pipeline/stages/02_build.sh'
            }
        }
        stage('Test') {
            steps {
                echo 'Hello Test'
                sh './agnostic-pipeline/stages/03_test.sh'
            }
        }
        stage('Archive') {
            steps {
                echo 'Hello Archive'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Hello Deploy'
            }
        }
    }
}

