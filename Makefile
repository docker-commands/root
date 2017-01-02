skelton:
	mkdir $(NAME)
	echo "$(NAME)" > $(NAME)/README.md
	echo "======" >> $(NAME)/README.md

	cat Makefile.template |sed -e "s/##NAME##/$(NAME)/g" > $(NAME)/Makefile
	echo "#!/bin/sh" > $(NAME)/$(NAME).sh
	chmod +x $(NAME)/$(NAME).sh
	cat Dockerfile.template |sed -e "s/##NAME##/$(NAME)/g" > $(NAME)/Dockerfile
	echo "FROM busybox" > $(NAME)/Dockerfile
	echo "COPY $(NAME).sh /$(NAME)" >> $(NAME)/Dockerfile
	echo "RUN chmod +x /$(NAME)" >> $(NAME)/Dockerfile
	echo "ENDPOINT [\"/$(NAME)\"]" >> $(NAME)/Dockerfile
	echo "CMD ["-h"]" >> $(NAME)/Dockerfile
	echo "- commands/$(NAME)" >> README.md
.PUNNY: skelton
