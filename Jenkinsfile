node{
	def buildNumber = BUILD_NUMBER
    stage('SCM checkout') {
        git 'https://github.com/Jaas090919/Arun.git'
         }
    stage('Upload to JFrog') 
			{
                rtUpload (
                    buildName: JOB_NAME,
                    buildNumber: BUILD_NUMBER,
                    serverId: SERVER_ID, 
                    spec: '''{
                              "files": [
                                 {
                                  "pattern": "$WORKSPACE/POC/*.war",
                                  "target": "result/",
                                  "recursive": "false"
                                } 
                             ]
							}'''    
                    )
            }
	stage('Build Docker image')
				{
        sh 'docker build -t bhanalliarun/poc:$(buildNumber) .'
	    }
			
	 stage('Push Docker Image'){
	 
        withCredentials([string(credentialsId: 'dockerpwd', variable: 'docker')])
        {
        sh "docker login -u bhanalliarun -p ${docker}"
        }
        sh 'docker push bhanalliarun/poc:1.0.0'
    }
	
			
}

