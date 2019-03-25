pipelineJob(jobName){

  description()
  keepDependencies(false)

  parameters {
    stringParam('id', '')
    stringParam('ssh_url', '')
  }

  triggers {
    genericTrigger {
      genericVariables {
        genericVariable {
          key("id")
          value("\$.repository.id")
        }
        genericVariable {
          key("ssh_url")
          value("\$.repository.ssh_url")
        }
      }
      token(jobName)
      printContributedVariables(true)
      printPostContent(true)
    }
  }

  definition {
     cpsScm {
      scm {
        git {
          remote {
            url()
            credentials()
          }
          branch("master")
        }
      }
      scriptPath(folderPath + '/Jenkinsfile')
     }
  }
}
