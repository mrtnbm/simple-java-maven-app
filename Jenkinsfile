pipeline {
    agent any
    tools {
        maven 'Maven 3.8.5'
        jdk 'jdk18-lin'
    }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
            }
        }
        stage ('checkout') {
            steps {
                checkout([
                    $class: 'GitSCM', 
                    branches: [[name: '*/main']], 
                    doGenerateSubmoduleConfigurations: false, 
                    extensions: [[$class: 'CleanCheckout']], 
                    submoduleCfg: [], 
                    userRemoteConfigs: [[credentialsId: 'github_creds', url: 'https://github.com/mrtnbm/example-jenkins.git']]
                    ])
            }
        }
        stage ('Build') {
            steps {
                sh 'mvn clean install' 
            }
        }
    }
}
