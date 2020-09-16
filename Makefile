all: status_demo.cast squeezer_demo_80x25.cast squeezer_demo_90x45.cast cli_demo.cast

%.cast: %/script.sh
	asciinema rec --overwrite -c $< $@

squeezer_demo_80x25.cast: squeezer_demo/script.sh
	ansible-playbook squeezer_demo/cleanup.yaml
	stty cols 80
	stty rows 25
	asciinema rec --overwrite -c $< $@

squeezer_demo_90x45.cast: squeezer_demo/script.sh
	ansible-playbook squeezer_demo/cleanup.yaml
	stty cols 90
	stty rows 45
	asciinema rec --overwrite -c $< $@

cli_demo.cast: cli_demo/script.sh
	asciinema rec --overwrite -c $< $@

clean:
	-rm *.cast

.PHONY: clean
