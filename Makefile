clean: destroy up halt startvm

startvm:
	VBoxManage startvm ubuntu_bsa_gw.rdf

destroy:
	vagrant destroy --force

halt:
	vagrant halt

reload:
	vagrant reload

reload-provision:
	vagrant reload --provision

status:
	vagrant status

stopvm:
	VBoxManage controlvm ubuntu_bsa.rdf acpipowerbutton

ssh:
	ssh -F ssh-config/config -i ssh-config/id_rsa BSA2

up:
	vagrant up



up-provision:
	vagrant up --provision

up-no-provision:
	vagrant up --no-provision

PHONY: up up-provision up-no-provision reload reload-provision clean
