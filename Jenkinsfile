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
                withCredentials([string(credentialsId: 'ssh-private-key', variable: 'SSH_PRIVATE_KEY')]) {
                    sh '''
                        mkdir -p $HOME/.ssh
                        cat ${SSH_PRIVATE_KEY} >> $HOME/.ssh/id_rsa
                        chmod 600 $HOME/.ssh/id_rsa
                        export SSH_PRIVATE_KEY=`cat $HOME/.ssh/id_rsa`
                        ./agnostic-pipeline/stages/05_deploy.sh
                    '''
                }
                // withCredentials([string(credentialsId: 'SSH_PRIVATE_KEY', variable: 'SSH_PRIVATE_KEY')]) {
                //   sh '''
                //     mkdir -p $HOME/.ssh
                //     ls -la
                //     echo "$SSH_PRIVATE_KEY" >> $HOME/.ssh/id_rsa
                //     ls -la $HOME/.ssh
                //     export SSH_PRIVATE_KEY="cat $HOME/.ssh/id_rsa"
                //     ./agnostic-pipeline/stages/05_deploy.sh
                //   '''
                // }
            }
        }
    }
}

