node{
   stage('SCM Checkout'){
     git credentialsId: 'git-cred', url: 'https://github.com/surya9032/my-app.git'
      
   }
   stage('Build'){
      def mvnHome = tool name: 'm2', type: 'maven'
      sh  "${mvnHome}/bin/mvn clean package"
   }
   
   stage('email-notificaiton'){
      
      emailext attachLog: true, body: 'jenkins-build', mimeType: 'text', recipientProviders: [buildUser()], replyTo: 'suryateja.donugu@gmail.com', subject: 'jenkins build status ', to: 'suryateja.donugu@gmail.com'
      
      
      
   }
   
   
}
