# terraform-hcloud-desktop

Small tool for building a easy to use remote linux desktop machine in Hetzner Cloud.

Steps for deployment.

1. create ssh keypair in `.ssh`:
    - ```ssh-keygen -f .ssh/hcloud-rdp -t ecdsa -b 521```
2. create `.env`File and put your Token into it:
    - 
    ```
    export TF_VAR_hcloud_token=<YOUR_TOKEN>
    export TF_VAR_hcloud_ssh_private_key=.ssh/hcloud-rdp
    ```
3. edit user_data.yml and variables.tf to your taste:
    - First we need to create a password for Login. This is done with mkpasswd and then inserted into user_data.yml:
    ```
    # mkpasswd FOOO
    $y$j9T$gE.SfpQCKHgcndlATr8xb1$CnqXkcLSXZ1ajIeE3MRByUz9NpjcOJVIAAMv0y3Pa6.
    ```
    - user_data.yml is a normal cloud-init manifest and we can add all other parameters to our tase
    - next we have to edit variables.yml. we can select location, instance size according to our needs here. Refer to the terraform provider docs for valid values here.
4. deploy the server. for this we have to load the `.env`file, init terraform, make a plan and apply it.
    ```
    # source .env
    # terraform init
    # terraform plan -out=rdp.plan
    # terraform apply rdp.plan
5. this should give us an output with the IP of the server:
    ```

    Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

    Outputs:

    web_servers_ips = {
    "rdp-server-1" = "42.23.42.23"
    }
    web_servers_status = {
    "rdp-server-1" = "running"
    }
    ```
    we can then connect to this server: `ssh -i .ssh/hcloud-rdp  -o StrictHostKeyChecking=no root@42.23.42.23`
6. to connect to the graphical frontend we installed the nomachine nx server. We also need the client on our side to use this. If everything is ready, you can connect to port 4000 on the IP of our server and authenticate with the username '`devops`' and your password created in step 3.

Happy Hacking!