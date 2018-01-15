pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
    }
    
  }
  stages {
    stage('my') {
      steps {
        build(job: 'ddd', propagate: true)
      }
    }
  }
}