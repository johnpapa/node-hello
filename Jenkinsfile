
pipeline {
   agent { label 'node1' }
   
   environment { 
	   
	DOCKER_IMAGE = 'nodejs/app'
	   
	ECR_REPO = '007293158826.dkr.ecr.ap-southeast-1.amazonaws.com/nodejs'
	APP_VERSION = 'unknown'
        APP_ENV = 'unknown'
        //TASK_FAMILY = 'unknown'
	   
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
   }

   stages {

      stage('[NODEJS] Build') {
         steps {
            echo '****** Build app ******'
            sh '''
            docker build -t ${DOCKER_IMAGE}:${BUILD_ID} .
            docker tag ${DOCKER_IMAGE}:${BUILD_ID} ${ECR_REPO}:${BUILD_ID}
            '''
         }
      }
      
      stage('[NODEJS] Push to ECR') {
         steps {
            echo '****** Push docker image to ECR ******'
	    sh '''
            export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
            export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
	    export AWS_DEFAULT_REGION="ap-southeast-1"
            export AWS_DEFAULT_OUTPUT="json" 
            
            ECR_LOGIN_STRING=`aws ecr get-login --region ${AWS_DEFAULT_REGION} --no-include-email`
            
            eval ${ECR_LOGIN_STRING}
            docker push ${ECR_REPO}:${BUILD_ID}
            '''
         }
      }
      
      stage('[NODEJS] Deploy to staging') {
            when {
                branch 'staging' 
	    }
            steps {
		echo '****** Deploy to ${BRANCH_NAME} branch ******'
		sh '''
		TASK_DEFINITION=$(aws ecs describe-task-definition --task-definition "nodejs-staging-task")
		NEW_TASK_DEFINITION=$(echo $TASK_DEFINITION | jq --arg ECR_REPO "$ECR_REPO:${BUILD_ID}" --arg APP_VERSION "${BUILD_ID}" --arg APP_ENV "${BRANCH_NAME}" '.taskDefinition |.containerDefinitions[0].image = $ECR_REPO | .containerDefinitions[0].environment[0].value = $APP_VERSION |.containerDefinitions[0].environment[1].value = $APP_ENV  | del(.taskDefinitionArn) | del(.revision) | del(.status) | del(.requiresAttributes) | del(.compatibilities)')
		TASK_VERSION=$(aws ecs register-task-definition --cli-input-json "$NEW_TASK_DEFINITION" | jq --raw-output '.taskDefinition.revision')
 		ECS_UPDATE=$(aws ecs update-service --force-new-deployment --cluster nodejs-staging-cluster  --service nodejs-staging-srv --task-definition nodejs-staging-task:$TASK_VERSION  | jq --raw-output '.service.serviceName')
		'''
            }
        }
      stage('[NODEJS] Deploy to production') {
           when {
                branch 'release' 
            }
            steps {
		sh 'echo "Here is target branch ${GIT_BRANCH} "'
                sh 'echo "Deploying release branch ${BRANCH_NAME}"'
            }
        }
   }
}
