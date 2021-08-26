# cccr-Terraform  

rds : https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance  

예상 소요기간 : 2주 ( 8/21 ~ 9/3 )  

목표 : 3 tier app 인프라 구현 자동화  

# 기본 아키텍처  

![image](https://user-images.githubusercontent.com/73922068/130666057-0206f2a6-723b-4054-81b8-2bde539f44e5.png)

# RDS#1 장애 발생시  

![image](https://user-images.githubusercontent.com/73922068/130666910-13c3d7e9-39d4-427a-a960-b8c87c7a3051.png)


작동순서  
1. terraform init  
2. terraform apply  
3. backend.tf 를 terraform 디렉토리에 넣고 terraform init -reconfigure  
4. terraform apply  
5. ansible-playbook deploy.yaml -b --private-key "~/.ssh/id_rsa"  
