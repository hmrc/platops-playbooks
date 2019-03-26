# PlatOps ansible playbooks

Ansible roles used by platops team.

- sbt: sbt global configuration.

# Requirements

## Control machine

The machine running this ansible playbooks.

- python 3 -
    - **On the Makefile, we're using python3 so you may want to check the python version on your local machine is running the same**
- gnu make

## Target host

Machines listed on the inventory file *hosts*.

- python 3
- python3-apt (required to install packages on debian based systems)

## SSH

Ensure target hosts are running ssh server:

``` bash
systemctl status ssh.service
```

And from your laptop double check you can ssh into our dashboards boxes:

``` bash
// for ubuntu based dell optiplex7010
ssh -l platserv 192.168.160.193

// for debian based raspberry pi
ssh -l pi 192.168.160.63
```

Upload your public ssh key, assuming is name *id_rsa.pub*, to hosts:

``` bash
make ssh-to-raspberry
make ssh-to-optiplex7010
```

NOTE: if the ip addresses have changed, please update them:

``` bash
ip -o route get to 8.8.8.8
```

Setup ~/.ssh/config file, a playbook is provided to perform this
configuration but you need to manually override settings in
*group_vars/localhost.yml*:

``` text
username: your_username
identity_file: ~/.ssh/id_rsa
```

where *your_username* should be your LDAP username:

and *path_to_your_ssh_key* is the absolute path for your private ssh
key if it is different to *id_rsa*.

``` bash
make local
```

You should see something like this on your ~/.ssh/config file:

``` bash
Host optiplex7010
   User platserv
   HostName 192.168.160.193
   StrictHostKeyChecking no
   IdentitiesOnly yes
   IdentityFile ~/.ssh/id_rsa
```

Now you should be able to ssh into it:

``` bash
ssh optiplex7010
```

Test both dashboards boxes:

``` bash
make ping-raspberry
make ping-optiplex7010
```

You only need to run this section the first time. That's all.

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
