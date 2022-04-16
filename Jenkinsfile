// old
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
				sh "curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -"
				sh "sudo apt install nodejs"
				sh "npm install snyk@latest -g"
				sh "snyk test"
				sh "export PATH=$PATH:${WORKSPACE}"
				sh "curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b ${WORKSPACE}"
				sh "curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b ${WORKSPACE}"
				sh "syft packages dir:. --file ./sbom.json -o syft-json -s AllLayers -vv"
				sh "grype sbom:./sbom.json --file ./vuln.json --fail-on high -o json -s AllLayers -vv"
			}
		}
    }
}
