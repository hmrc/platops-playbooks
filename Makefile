help: ## Print this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

setup: ## python virtual environment
	python3 -m venv .venv
	VIRTUAL_ENV_DISABLE_PROMPT=true source .venv/bin/activate;\
	pip install --upgrade pip;\
	pip install -r requirements.txt

clean:	## delete generated files
	rm *.retry

run: ## run main playbook
	VIRTUAL_ENV_DISABLE_PROMPT=true source .venv/bin/activate;\
	env ANSIBLE_FORCE_COLOR=true ansible-playbook -i hosts --vault-id .vault-pass.optiplex7010 -K monitor.yml

run-monitor-pi: ## setup raspberry pi
	VIRTUAL_ENV_DISABLE_PROMPT=true source .venv/bin/activate;\
	env ANSIBLE_FORCE_COLOR=true ansible-playbook -i hosts --vault-id .vault-pass.optiplex7010 -K monitor-pi.yml

ping-optiplex7010: ## test ping against optiplex7010
	VIRTUAL_ENV_DISABLE_PROMPT=true source .venv/bin/activate;\
	env ANSIBLE_FORCE_COLOR=true ansible -i hosts optiplex7010 --vault-id .vault-pass.optiplex7010 -m ping -u platserv

ping-raspberry: ## test ping against optiplex7010
	VIRTUAL_ENV_DISABLE_PROMPT=true source .venv/bin/activate;\
	env ANSIBLE_FORCE_COLOR=true ansible -i hosts raspberry --vault-id .vault-pass.optiplex7010 -m ping -u pi

ssh-to-raspberry: ## copy ssh public key to raspberry
	ssh-copy-id -i ~/.ssh/id_rsa_hmrc.pub pi@192.168.160.63

ssh-to-optiplex7010: ## copy ssh public key to optiplex7010
	ssh-copy-id -i ~/.ssh/id_rsa_hmrc.pub platserv@192.168.160.193

run-local: ## setup your laptop
	VIRTUAL_ENV_DISABLE_PROMPT=true source .venv/bin/activate;\
	env ANSIBLE_FORCE_COLOR=true ansible-playbook -i hosts laptop.yml --tags "configuration"
