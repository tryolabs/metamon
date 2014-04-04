chmod 600 keys/vagrant
ansible-playbook --limit=dev -i hosts/hosts -u vagrant --private-key=keys/vagrant site.yml
