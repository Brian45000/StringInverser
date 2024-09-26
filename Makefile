pipeline {
    agent any
    stages {
        stage('Clonage du dépôt GitHub') {
            steps {
                git branch: 'main', url: 'https://github.com/csurqunix/OSDetector.git'
                // Lister les fichiers pour vérifier la présence de Makefile
                sh 'ls -la'
            }
        }
        stage('Build') {
            steps {
                script {
                    if (isUnix()) {
                        // Vérifier à nouveau la présence du Makefile avant de lancer make
                        sh 'ls -la'
                        sh 'make'
                    } else {
                        bat 'make'
                    }
                }
            }
        }
    }
}
