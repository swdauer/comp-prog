PROBLEM=quickestimate

create:
	mkdir --parents $(PROBLEM)
	cp --no-clobber c-template.c $(PROBLEM)/main.c
	cp --no-clobber makefile-template $(PROBLEM)/makefile
	cp --no-clobber readme-template.md $(PROBLEM)/README.md
	touch $(PROBLEM)/input1.txt
	