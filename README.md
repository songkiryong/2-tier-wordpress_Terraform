# 목표
Terraform 과 Ansible 을 이용하여 2-Tier Wordpress (apache2 - wordpress - mysql) 구축을 자동화 합니다.  

# 아키텍처  

![image](https://user-images.githubusercontent.com/73922068/132995729-a51ae8b7-0d0c-4404-aa93-bb240b1f3a2e.png)

![image](https://user-images.githubusercontent.com/73922068/132995747-760051de-0a6d-40c2-95a9-c0db9470d43e.png)

# 작동순서  
## Terraform  
1. terraform init  
2. terraform apply  
3. backend.tf 를 terraform 디렉토리에 넣고 terraform init -reconfigure  
4. terraform apply  
## Ansible    
5. ansible-playbook deploy.yaml -b --private-key "~/.ssh/id_rsa"  
