pipeline {

    agent any

    environment  {
        CONTAINER_NAME = "nestjs-container"
        IMAGE_NAME = "nestjs-image"
        EMAIL = "priyanshukumar7979@gmail.com"
        PORT = "3000"
    }

    stages {
        stage("Clone REPO") {
            steps {
                echo 'CLoaning the REPO'
                git branch: "main", url: "https://github.com/priyanshu-kumar01/nestJS_CiCD_Jenkins"
            }
        }

        stage("Build Docker Image") {
            steps {
                sh "docker build -t $IMAGE_NAME ."
            }
        }

        stage("Stop & Remove Container If exists") {
            steps {
                sh """
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                """
            }
        }

        stage("Docker container Run") {
            steps {
                sh """
                    docker run -d -p ${PORT}:${PORT} \
                    --name $CONTAINER_NAME $IMAGE_NAME
                """
            }
        }

        stage("Send Email Notification") {
            steps {
                emailext(
                    subject: "NESTJS APP DEPLOYED SUCCESSFULLY IN EC2!",
                    body: "Nestjs app deployed in http://52.90.218.158:${PORT}/",
                    to: "${EMAIL}"
                )
            }
        }
    }
}