// Badge will be located at http://localhost/buildStatus/icon?job=demo&config=flake8
def Badge = addEmbeddableBadgeConfiguration(id: "flake8", subject: "Style errors")

pipeline {
  agent {
    docker 'python:3.7'
  }
  stages {
    stage('Badge Creation') {
      steps {

        echo 'Cloning git repo: $ssh_url'
        git changelog: false, url: $ssh_url

        script {
          BADLINES = sh (
            script: '''pip install -q flake8 && \
                       flake8 . --exclude .git,__pycache__ --count --max-line-length 120 \
                       --max-complexity 10 --exit-zero --ignore E999,W291
                       ''',
            returnStdout: true
          ).trim().tokenize().last()

          Badge.setStatus("$BADLINES")
          Badge.setColor('blue')
        }
      }
    }
  }
}
