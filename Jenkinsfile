node('java-docker-slave'){
    stage('build') {
        sh'''apt install nodejs -y'''
        sh'''npm install'''
        sh'''npm i -g pm2'''
    }
    stage('direction') {
        sh 'cd /root/workspace/demo1'
    }
	stage('release') {
        sh 'pm2 start index.js'
    }
}
