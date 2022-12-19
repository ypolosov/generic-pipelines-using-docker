pipeline {
    agent { 
        docker {
            image 'ypolosov/agnostic-pipeline'
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
                sh 'whoami'
            }
        }
        // stage('Ci') {
        //     steps {
        //         echo 'Hello Ci'
        //         sh './agnostic-pipeline/stages/01_ci.sh'
        //     }
        // }
        // stage('Build') {
        //     steps {
        //         echo 'Hello Build'
        //         sh './agnostic-pipeline/stages/02_build.sh'
        //     }
        // }
        // stage('Test') {
        //     steps {
        //         echo 'Hello Test'
        //         sh './agnostic-pipeline/stages/03_test.sh'
        //     }
        // }
        // stage('Archive') {
        //     environment { 
        //         DOCKER_PASSWORD = credentials('docker-password')
        //     }
        //     steps {
        //         echo 'Hello Archive'
        //         sh '''
        //             export DOCKER_PASSWORD="$DOCKER_PASSWORD"
        //             ./agnostic-pipeline/stages/04_archive.sh
        //         '''
        //     }
        // }
        stage('Deploy') {
            steps {
                echo 'Hello Deploy'
                withCredentials([sshUserPrivateKey(credentialsId: 'ssh-private-key-file', keyFileVariable: 'SSH_PRIVATE_KEY')]) {
                    sh '''
                        echo ${SSH_PRIVATE_KEY}
                        cat ${SSH_PRIVATE_KEY} > ./key_key.key
                        chmod 600 ./key_key.key
                        cat ./key_key.key
                        export SSH_PRIVATE_KEY=`cat ./key_key.key`
                        ./agnostic-pipeline/stages/05_deploy.sh
                    '''
                }
            }
        }
    }
}

