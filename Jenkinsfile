
pipeline {
   agent {label 'node1'}
   
   environment { 
        //app_version = ${env.BUILD_ID}
        app_environment = 'staging'
        docker_image = 'nodejs/staging'
        //AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        //AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
   }

   stages {

      stage('Build') {
         steps {
            echo '****** Build ******'
            /*sh '''
            docker build -t $docker_image:${BUILD_ID} .
            docker tag  $docker_image:${BUILD_ID} 007293158826.dkr.ecr.ap-southeast-1.amazonaws.com/nodejs/staging:${BUILD_ID}
            
            export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
            export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
            
            ECR_LOGIN_STRING=`aws ecr get-login --region ap-southeast-1 --no-include-email`
            
            eval ${ECR_LOGIN_STRING}
            docker push 007293158826.dkr.ecr.ap-southeast-1.amazonaws.com/nodejs/staging:${BUILD_ID}
            '''*/
         }
      }
      
      stage('Publish') {
         steps {
            echo 'Hello Publish'
         }
      }
      
      stage('Deploy to staging') {
            when {
               ${BRANCH_NAME} == 'staging'
	    }
            steps {

                sh 'echo "At branch ${GIT_BRANCH} "'
            }
        }
      stage('Deploy to production') {
           when {
                branch 'release' 
            }
            steps {
                sh 'echo "At release branch ${BRANCH_NAME}"'
            }
        }
   }
}
