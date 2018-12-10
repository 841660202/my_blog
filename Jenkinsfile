pipeline {
    agent {
        docker {
            image 'node'
            args '-p 3000:3000 --name node'
        }
    }
    environment {
        CI = 'true'
    }
    stages {
        stage('安装') {
            steps {
                sh 'npm install -g cnpm'
                sh 'cnpm install'
                sh 'cnpm install hexo-cli -g'
            }
        }
        stage('打包') {
            steps {
                sh 'hexo g'
            }
        }
        stage('查看环境') {
            steps {
                sh 'echo $PATH'
            }
        }
        stage('制作image') {
            steps {
                sh 'docker -v'
                sh 'docker build -t blog .'
                sh 'docker images'
            }
        }
        stage('运行docker_image') {
            steps {
                sh 'docker run -p 4000:80 -d --name blog blog'
                sh 'docker stop node'
            }
        }
    }
}
