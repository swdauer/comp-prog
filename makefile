PROBLEM=greetings2

create-hs:
	mkdir --parents $(PROBLEM)
	touch $(PROBLEM)/main.hs
	cp --no-clobber makefile-template-haskell $(PROBLEM)/makefile
	touch $(PROBLEM)/input1.txt

create-c:
	mkdir --parents $(PROBLEM)
	cp --no-clobber c-template.c $(PROBLEM)/main.c
	cp --no-clobber makefile-template-c $(PROBLEM)/makefile
	touch $(PROBLEM)/input1.txt
