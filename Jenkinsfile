 pipeline {
    agent any
    stages {
        stage('gitclone') {
            steps { 
                git 'https://github.com/barathtech/hello-world.git'
                sh 'rm -rf .git'
            }
        }
        stage('Deploy') {
            steps{
             sshagent(['ssh-key']) {
                sh """
                  scp -o StrictHostKeyChecking=no -r ${env.WORKSPACE}/* root@10.0.138.24:/var/www/html/${env.JOB_BASE_NAME}
                 [ -f ".env" ] && scp .env root@10.0.138.24/var/www/html/${env.JOB_BASE_NAME}
                 ssh -o StrictHostKeyChecking=no root@10.0.138.24 pm2 restart ${env.JOB_BASE_NAME}
               """
                
              }
            }
        }
     }
 }
