node{
   stage('SCM Checkout'){
      git credentialsId: 'git-cred', url: 'https://github.com/surya9032/my-app.git'
      
      
   }
   stage('Build'){
      sh 'mvn clean package'
     
   }
   stage('tomcat'){
      sshagent(['tom1']) {
        sh 'scp -o StrictHostkeyChecking=no target/*.war root@65.1.86.141:/opt/tomcat-8.5.64/webapps/'

      }
   }
   stage('upload artifacts to s3'){
      s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: '', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: false, selectedRegion: 'ap-south-1', showDirectlyInBrowser: false, sourceFile: '**/jenkinsfile/*.war', storageClass: 'STANDARD', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'FAILURE', profileName: 'mybucket1forjenkins', userMetadata: []
   
   }
   
   stage('email-notificaiton'){
      
      emailext attachLog: true, body: 'jenkins-build', mimeType: 'text', recipientProviders: [buildUser()], replyTo: 'suryateja.donugu@gmail.com', subject: 'jenkins build status ', to: 'suryateja.donugu@gmail.com'
      
   }
   
   
}
