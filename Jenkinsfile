//Jenkinsfile (Declarative Pipeline)
pipeline {
  environment {
    registry = "181296/spring-rest-api"
	// This get from jenkins credential for Docker Registry
    dockerRegistryCredential = 'dockerRegistryCredential'
    dockerImage = ''
    imageTag = ''
  }
  // Specifies where the entire Pipeline, or a specific stage, will execute in the Jenkins environment
  agent any
  stages {
    stage('Building application') {
      steps {
        sh 'mvn clean package' 
        echo 'Build app successfully'
      }
    }
    stage('Building image') {
      steps{
        script {
          imageTag = registry + ":$BUILD_NUMBER"
          dockerImage = docker.build imageTag
          echo 'Build image' + imageTag + ' scuccessfully'
        }
      }
    }
     stage('Pushing image to docker hub') {
      steps{
        script {
          docker.withRegistry( '', dockerRegistryCredential ) {
            dockerImage.push()
          }
          echo 'Push image to docker hub scuccessfully'
        }
      }
    }
  }
}
