pipeline {
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
        stage('制作docker_image') {
            steps {
                sh 'docker build -t hexo-blog .'
                sh 'docker images'
            }
        }
        stage('运行docker_image') {
            steps {
                sh 'docker run -p 4000:80 -d --name hexo-blog hexo-blog'
            }
        }
    }
}
