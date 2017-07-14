import java.text.SimpleDateFormat

pipeline {
  agent {
    label "test"
  }
  options {
    buildDiscarder(logRotator(numToKeepStr: '2'))
    disableConcurrentBuilds()
  }
  stages {
    stage("build") {
      steps {
        script {
          def dateFormat = new SimpleDateFormat("yy.MM.dd")
          currentBuild.displayName = dateFormat.format(new Date()) + "-" + env.BUILD_NUMBER
        }
        checkout scm
        withCredentials([usernamePassword(
          credentialsId: "docker",
          usernameVariable: "USER",
          passwordVariable: "PASS"
        )]) {
          sh "docker login -u $USER -p $PASS"
        }
        sh "docker image build -t vfarcic/docker-flow-hub-docs -f Dockerfile.docs ."
      }
    }
    stage("release") {
      when {
        branch "master"
      }
      steps {
        sh "docker tag vfarcic/docker-flow-hub-docs vfarcic/docker-flow-hub-docs:${currentBuild.displayName}"
        sh "docker push vfarcic/docker-flow-hub-docs:${currentBuild.displayName}"
        sh "docker push vfarcic/docker-flow-hub-docs"
      }
    }
    stage("deploy") {
      when {
        branch "master"
      }
      agent {
        label "prod"
      }
      steps {
        sh "docker service update --image vfarcic/docker-flow-hub-docs:${currentBuild.displayName} infra_docs"
      }
    }
  }
  post {
    always {
      sh "docker system prune -f"
    }
    failure {
      slackSend(
        color: "danger",
        message: "${env.JOB_NAME} failed: ${env.RUN_DISPLAY_URL}"
      )
    }
  }
}
