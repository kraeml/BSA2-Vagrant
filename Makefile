reload:
	vagrant reload

reload-provision:
	vagrant reload --provision

status:
	vagrant status

up:
	vagrant up

up-provision:
	vagrant up --provision

up-no-provision:
	vagrant up --no-provision

PHONY: up up-provision up-no-provision reload reload-provision
