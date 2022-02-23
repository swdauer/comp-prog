PROBLEM=heimavinna

create-hs:
	mkdir --parents $(PROBLEM)
	touch $(PROBLEM)/main.hs
	cp --no-clobber makefile-template-haskell $(PROBLEM)/makefile
	cp --no-clobber readme-template.md $(PROBLEM)/README.md
	touch $(PROBLEM)/input1.txt

create-c:
	mkdir --parents $(PROBLEM)
	cp --no-clobber c-template.c $(PROBLEM)/main.c
	cp --no-clobber makefile-template-c $(PROBLEM)/makefile
	cp --no-clobber readme-template.md $(PROBLEM)/README.md
	touch $(PROBLEM)/input1.txt
