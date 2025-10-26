pipeline {
  agent any
  environment {
    IMAGE_NAME = 'demo-fastapi'
    IMAGE_TAG  = "v${env.BUILD_NUMBER}"
    DOCKERHUB_REPO = 'nagi1112/dsampl_fastapi'
  }
  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('Build') {
      steps {
        sh 'docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .'
      }
    }
    stage('Test') {
      steps {
        sh 'docker run --rm ${IMAGE_NAME}:${IMAGE_TAG} python -c "print(\\"ok\\")"'
      }
    }
    stage('Push') {
      when { expression { return env.DOCKERHUB_REPO?.trim() } }
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
          sh '''
            echo "$PASS" | docker login -u "$USER" --password-stdin
            docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${DOCKERHUB_REPO}:${IMAGE_TAG}
            docker push ${DOCKERHUB_REPO}:${IMAGE_TAG}
          '''
        }
      }
    }
  }
  post {
    success { echo "Built ${IMAGE_NAME}:${IMAGE_TAG}" }
  }
}