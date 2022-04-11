PROBLEM=coconut

hs:
	mkdir --parents $(PROBLEM)
	touch $(PROBLEM)/main.hs
	cp --no-clobber makefile-template-haskell $(PROBLEM)/makefile
	touch $(PROBLEM)/input1

py:
	mkdir --parents $(PROBLEM)
	touch $(PROBLEM)/main.py
	touch $(PROBLEM)/input1
