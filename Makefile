demo.cast: script.sh
	ansible-playbook cleanup.yaml
	asciinema rec --overwrite -c ./$< $@

clean: .PHONY
	ansible-playbook cleanup.yaml
	-rm demo.cast

all: demo.cast
