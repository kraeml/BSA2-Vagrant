clean-all-vms: destroy up halt startvms

clean-gw: destroy-gw up-gw halt-gw startvm-gw

startvms: startvm-gw startvm-pc1 startvm-pc2 startvm-pc3 startvm-pc4

startvm-gw:
	VBoxManage startvm ubuntu_bsa_gw.rdf
	sleep 15

startvm-pc1:
	VBoxManage startvm ubuntu_bsa_pc1.rdf

startvm-pc2:
	VBoxManage startvm ubuntu_bsa_pc2.rdf

startvm-pc3:
	VBoxManage startvm ubuntu_bsa_pc3.rdf

startvm-pc4:
	VBoxManage startvm ubuntu_bsa_pc4.rdf

destroy:
	vagrant destroy --force

destroy-gw:
	vagrant destroy gw --force

destroy-pc1:
	vagrant destroy pc1 --force

destroy-pc2:
	vagrant destroy pc2 --force

destroy-pc3:
	vagrant destroy pc3 --force

destroy-pc4:
	vagrant destroy pc4 --force

halt:
	vagrant halt

halt-gw:
	vagrant halt gw

halt-pc1:
	vagrant halt pc1

halt-pc2:
	vagrant halt pc2

halt-pc3:
	vagrant halt pc3

halt-pc4:
	vagrant halt pc4

reload:
	vagrant reload

reload-provision:
	vagrant reload --provision

status:
	vagrant status

stopvms: stopvm-pc4 stopvm-pc3 stopvm-pc2 stopvm-pc1 stopvm-gw

stopvm-gw:
	VBoxManage controlvm ubuntu_bsa_gw.rdf acpipowerbutton

stopvm-pc1:
	VBoxManage controlvm ubuntu_bsa_pc1.rdf acpipowerbutton

stopvm-pc2:
	VBoxManage controlvm ubuntu_bsa_pc2.rdf acpipowerbutton

stopvm-pc3:
	VBoxManage controlvm ubuntu_bsa_pc3.rdf acpipowerbutton

stopvm-pc4:
	VBoxManage controlvm ubuntu_bsa_pc4.rdf acpipowerbutton

ssh:
	ssh -F ssh-config/config -i ssh-config/id_rsa_insecure_rdf BSA2

up:
	vagrant up

up-gw:
	vagrant up-gw

up-pc1:
	vagrant up-pc1

up-pc2:
	vagrant up-pc2

up-pc3:
	vagrant up-pc3

up-pc4:
	vagrant up-pc4

up-provision:
	vagrant up --provision

up-no-provision:
	vagrant up --no-provision

PHONY: up up-provision up-no-provision reload reload-provision clean
