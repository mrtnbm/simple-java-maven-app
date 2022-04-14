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
                    branches: [[name: '*/master']], 
                    doGenerateSubmoduleConfigurations: false, 
                    extensions: [[$class: 'CleanCheckout']], 
                    submoduleCfg: [], 
                    userRemoteConfigs: [[credentialsId: 'github_creds', url: 'https://github.com/mrtnbm/simple-java-maven-app.git']]
                    ])
            }
        }
        stage ('Build') {
            steps {
                sh 'mvn clean install' 
            }
        }
		stage ('SBOM') {
			steps{
				//sh "npm install snyk@latest -g"
				//sh "snyk test"
				sh "syft packages dir:. --file ./sbom.json -o syft-json -s AllLayers -vv"
				sh "grype sbom:./sbom.json --file ./vuln.json --fail-on high -o json -s AllLayers -vv"
			}
		}
    }
}
