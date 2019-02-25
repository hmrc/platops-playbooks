help: ## Print this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

setup: ## python virtual environment
	python -m venv .venv
	VIRTUAL_ENV_DISABLE_PROMPT=true source .venv/bin/activate;\
	pip install --upgrade pip;\
	pip install -r requirements.txt

clean:	## delete generated files
	rm *.retry

vpn-aws: ## transform openvpn configuration to read credentials from file
	sed -i 's/auth-user-pass/auth-user-pass auth.txt/' sensitive-data/aws-hmrc-vpn.ovpn

run: ## run main playbook
	VIRTUAL_ENV_DISABLE_PROMPT=true source .venv/bin/activate;\
	env ANSIBLE_FORCE_COLOR=true ansible-playbook -i hosts --vault-id .vault-pass.optiplex7010 -K monitor.yml

ping: ## test ping against optiplex7010
	VIRTUAL_ENV_DISABLE_PROMPT=true source .venv/bin/activate;\
	env ANSIBLE_FORCE_COLOR=true ansible -i hosts optiplex7010 -m ping -u platserv

