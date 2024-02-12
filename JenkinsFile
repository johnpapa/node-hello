node {
    stage('building-package') {
        echo 'Building Node.js application...'
        sh 'npm install'
    }

    stage('testing') {
        sh 'echo testing passed as no npm test found'
    }

    stage('publishing-docker-img') {
        withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
            sh 'docker build -t mannnish/nodejs-hello .'
            sh 'docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD'
            sh 'docker push mannnish/nodejs-hello:latest'
        }
    }
}
