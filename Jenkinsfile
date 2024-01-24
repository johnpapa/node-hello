@Library("myLibrary") _

pipeline {
    agent any

    environment {
        GITHUB_TOKEN = credentials('mahmoudanwer_github_token')
        GITHUB_USERNAME = "mahmoud-anwer"
        REPO_OWNER = "mahmoud-anwer"
        REPO_NAME = "node-hello"
        TARGET_DIRECTORY = "node-hello-dir"
        SERVICE_NAME = "api"
        BASE_BRANCH = "master"
    }
    
    stages {
        stage('Clone Repository') {
            steps {
                cloneRepo(github_username: env.GITHUB_USERNAME, github_token: env.GITHUB_TOKEN, repo_owner: env.REPO_OWNER, repo_name: env.REPO_NAME, target_dir: env.TARGET_DIRECTORY)  
            }
        }
        stage('Editing files') {
            steps {
                script{
                    sh """
                    echo "test" > ${TARGET_DIRECTORY}/test.file
                    """
                }
            }
        }
        stage('Creating pull request') {
            steps {
                createPR(base_branch: env.BASE_BRANCH, target_dir: env.TARGET_DIRECTORY, service_name: env.SERVICE_NAME, build_id: env.BUILD_ID, commit_hash: env.GIT_COMMIT, github_username: env.GITHUB_USERNAME, github_token: env.GITHUB_TOKEN, repo_owner: env.REPO_OWNER, repo_name: env.REPO_NAME)  
            }
        }
    }
}
