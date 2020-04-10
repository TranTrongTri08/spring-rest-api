//Jenkinsfile (Declarative Pipeline)
pipeline {
  environment {
    registry = "181296/spring-rest-api"
    registryCredential = 'dockerhub'
    dockerImage = ''
    imageTag = ''
  }
  // Specifies where the entire Pipeline, or a specific stage, will execute in the Jenkins environment
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/TranTrongTri08/spring-rest-api.git'
		echo 'Pull code successfully'
      }
    }
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
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
          echo 'Push image to docker hub scuccessfully'
        }
      }
    }
  }
}