# PlatOps ansible playbooks

# Requirements

- python 3
- gnu make

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
   IdentityFile /home/jm/.ssh/id_rsa_hmrc
```

# Usage

``` bash
make help
```

# License

This code is open source software licensed under the [Apache 2.0 License]("http://www.apache.org/licenses/LICENSE-2.0.html").
