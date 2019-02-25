# PlatOps ansible playbooks

# Requirements

## Control machine

The machine running this ansible playbooks.

- python 3
- gnu make

## Target host

Machines listed on the inventory file *hosts*.

- python 3
- python3-apt

## SSH

Ensure target hosts are running ssh server:

``` bash
systemctl status sshd
```

Upload your public ssh key to hosts:

``` bash
ssh-copy-id -i ~/.ssh/id_rsa_hmrc.pub platserv@192.168.160.193
```

And add the following snippet to your ~/.ssh/config file:

``` bash
Host optiplex7010
   User platserv
   HostName 192.168.160.193
   StrictHostKeyChecking no
   IdentitiesOnly yes
   IdentityFile ~/.ssh/id_rsa_hmrc
```

Now you should be able to ssh into it:

``` bash
ssh optiplex7010
```

# Usage

``` bash
make help
```

Credentials data is encrypted using
[*ansible-vault*](https://docs.ansible.com/ansible/latest/user_guide/vault.html),
if you use the make tasks (and you should), then ensure the password
store file exists with the password used to encrypt that data:

``` bash
cat .vault-pass.optiplex7010
//password used for encrypting vault data
```

# Notes

## Password for user

Generate hash to be used on role task:

``` bash
openssl passwd -1 -salt 3Zdze7Vx changeme123
$1$3Zdze7Vx$vvdELH54NG.Sie9xJOwAi/      // hash to be used representing changeme123 password
```

# License

This code is open source software licensed under the [Apache 2.0 License]("http://www.apache.org/licenses/LICENSE-2.0.html").
