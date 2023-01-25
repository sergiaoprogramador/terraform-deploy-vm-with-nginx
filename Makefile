set-up:
	python3 -m pip install -r requirements.txt

run-ansible:
	ansible-playbook -i "IP" main.yml