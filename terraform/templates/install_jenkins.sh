#! /bin/bash
  sudo yum install -y java-1.8.0-openjdk-devel

  curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo

  sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

  sudo yum install jenkins -y

  systemctl start jenkins && systemctl enable jenkins