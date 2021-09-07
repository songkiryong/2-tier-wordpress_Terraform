# 기본 아키텍처  

![image](https://user-images.githubusercontent.com/73922068/130666057-0206f2a6-723b-4054-81b8-2bde539f44e5.png)

# RDS#1 장애 발생시  

![image](https://user-images.githubusercontent.com/73922068/130666910-13c3d7e9-39d4-427a-a960-b8c87c7a3051.png)


# 작동순서  
## Terraform  
1. terraform init  
2. terraform apply  
3. backend.tf 를 terraform 디렉토리에 넣고 terraform init -reconfigure  
4. terraform apply  
## Ansible    
5. ansible-playbook deploy.yaml -b --private-key "~/.ssh/id_rsa"  
