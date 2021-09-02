PROBLEM=yoda

create-c:
	mkdir --parents $(PROBLEM)
	cp --no-clobber c-template.c $(PROBLEM)/main.c
	cp --no-clobber makefile-template $(PROBLEM)/makefile
	cp --no-clobber readme-template.md $(PROBLEM)/README.md
	touch $(PROBLEM)/input1.txt

create-hs:
	mkdir --parents $(PROBLEM)
	touch $(PROBLEM)/main.hs
	cp --no-clobber makefile-template $(PROBLEM)/makefile
	cp --no-clobber readme-template.md $(PROBLEM)/README.md
	touch $(PROBLEM)/input1.txt

create-py:
	mkdir --parents $(PROBLEM)
	touch $(PROBLEM)/main.py
	cp --no-clobber readme-template.md $(PROBLEM)/README.md
	touch $(PROBLEM)/input1.txt
	