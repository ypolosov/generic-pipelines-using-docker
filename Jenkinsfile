pipeline {
    agent any

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
            }
        }
        stage('Build') {
            steps {
                echo 'Hello Build'
            }
        }
        stage('Test') {
            steps {
                echo 'Hello Test'
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

