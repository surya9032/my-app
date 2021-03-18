node{
   stage('SCM Checkout'){
      git credentialsId: 'git-cred', url: 'https://github.com/surya9032/my-app.git'
      
   }
   stage('Build'){
      def mvnHome = tool name: 'm2', type: 'maven'
      sh  "${mvnHome}/bin/mvn clean package"s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'mybucket1forjenkins', excludedFile: '/webapps/target', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: true, selectedRegion: 'us-iso-east-1', showDirectlyInBrowser: false, sourceFile: '**/webapps/target/*war', storageClass: 'STANDARD', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'FAILURE', profileName: 'jenkins-s3 ', userMetadata: []
   }
   stage('upload artifacts to s3'){
      s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: '', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: false, selectedRegion: 'us-iso-east-1', showDirectlyInBrowser: false, sourceFile: '**/webapps/target/*.war', storageClass: 'STANDARD', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'FAILURE', profileName: 'jenkins-s3', userMetadata: []    
   
   }
   
   stage('email-notificaiton'){
      
      emailext attachLog: true, body: 'jenkins-build', mimeType: 'text', recipientProviders: [buildUser()], replyTo: 'suryateja.donugu@gmail.com', subject: 'jenkins build status ', to: 'suryateja.donugu@gmail.com'
      
      
      
   }
   
   
}
