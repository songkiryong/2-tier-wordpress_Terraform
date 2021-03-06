# 목표
Terraform 과 Ansible 을 이용하여 2-Tier Wordpress (apache2 - wordpress - mysql) 구축을 자동화 합니다.  

# 아키텍처  

![image](https://user-images.githubusercontent.com/73922068/132995929-cd2e028f-1e5c-41de-953c-d27132b2737f.png)


![image](https://user-images.githubusercontent.com/73922068/132995747-760051de-0a6d-40c2-95a9-c0db9470d43e.png)

-> Terraform을 통해 AWS의 Route53, EC2, RDS, 보안그룹 및 S3를 생성합니다.  
-> Ansible을 통해 EC2와 RDS에 apache2,php,wordpress,mysql을 설치하고 연결합니다.  

- s3 : .tfstate 파일을 원격 저장소인 S3에 저장하여 파일의 유실을 방지합니다.
- dynamodb : .tfstate 파일을 동시에 작업할 수 없도록 lock을 거는 table 생성  



# 준비사항  
### Terraform  
 - terraform.tfvars  
    - public_key : ec2의 public key  
    - local_ip : ansible을 실행할 컴퓨터의 ip  
### Ansible    
 - private key : ansible playbook을 실행할 때 EC2와의 ssh 연결을 위한 개인키  
 - static.ini : 서버의 ip   

# 작동순서  

1. clone  
``` 
https://github.com/songkiryong/2-tier-wordpress_Terraform.git 
```

2. Terraform  
``` 
terraform init  
terraform apply 
```

3. Ansible    
``` 
ansible-playbook deploy.yaml -b --private-key "~/.ssh/id_rsa" 
```
# 삭제  
1. Terraform  
```
terraform destroy
```
2. Ansible
```
ansible-playbook remove.yaml -b --private-key "~/.ssh/id_rsa"
```
