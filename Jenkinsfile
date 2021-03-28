node{
   stage('SCM Checkout'){
      git credentialsId: 'git-cred', url: 'https://github.com/surya9032/my-app.git'
      
      
   }
   stage('Build'){
      sh 'mvn clean package'
     
   }
   stage('tomcat'){
      deploy adapters: [tomcat8(credentialsId: 'tomcat10', path: '', url: 'http://3.6.91.245:8080')], contextPath: null, war: '**/*.war'
   }
   
   
   stage('email-notificaiton'){
      
      emailext attachLog: true, body: 'jenkins-build', mimeType: 'text', recipientProviders: [buildUser()], replyTo: 'suryateja.donugu@gmail.com', subject: 'jenkins build status ', to: 'suryateja.donugu@gmail.com'
      
   }
   
   
}
