Jul-2024 Update: AWS has deprecated their CI/CD pipeline that this project is based on: Cloud9, CodeCommit, CodeBuild.

# Elastic Beanstalk Follow Along

This project was based on [ExamPro Follow Along - Paid Lesson](https://app.exampro.co/student/material/dva-c01/1057).

In the above Follow Along, the video explaining the Dockerfile creation is missing. Use the AWS first-party follow along below to learn how to create this.

## AWS First-Party Follow Along

Be sure to check [EB-Follow-Along-Docker](https://github.com/ExamProCo/TheFreeAWSDeveloperAssociate/tree/master/EB-Follow-Along-Docker) directory to catch up and finish the section.

# Setup services

Create empty CodeCommit repository

Launch Cloud9 and load your codebase from CodeCommit

# Develop and running in cloud9 commands

## Start app
cd ~/ExampleAwsPipeline
npm install
npm start

## Meta v2
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
curl http://169.254.169.254/latest/meta-data/profile -H "X-aws-ec2-metadata-token: $TOKEN"
curl http://169.254.169.254/latest/meta-data/mac -H "X-aws-ec2-metadata-token: $TOKEN"
curl http://169.254.169.254/latest/meta-data/network/interfaces/macs/16:ff:f4:a7:1d:4b/security-group-ids -H "X-aws-ec2-metadata-token: $TOKEN"

## Open port to public
aws ec2 authorize-security-group-ingress \
--group-id sg-00fa4c55bb3629850 \
--port 8080 \
--protocol tcp \
--cidr 3.231.229.42/32

# Deploy from Cloud9

## EB app deploy and run
eb create -s -i t2.micro

## EB app deploy and run (if your Cloud9 instance use the correct user to deploy)
eb create -s -i t2.micro --profile AdministratorAccess-211125533

## EB app list running instances
eb list

## EB app stop
eb terminate name-from-list

## EB Roles (if not automatically created)
aws-elasticbeanstalk-service-role
(associated with Elastic Beanstalk)
AWSElasticBeanstalkEnhancedHealth
AWSElasticBeanstalkService

aws-elasticbeanstalk-ec2-role
(associated with EC2!!)
AWSElasticBeanstalkWebTier
AWSElasticBeanstalkWorkerTier
AWSElasticBeanstalkMulticontainerDocker