emacs ?= emacs
FILES := mu4e-overview.el
ELC := $(FILES:.el=.elc)

ARGS := --batch -Q

ifdef USE_SYSTEM_MU4E
COMPILE_ARGS := --eval '(add-to-list '"'"'load-path "/usr/share/emacs/site-lisp/mu4e/")'
endif

compile: $(ELC)

%.elc: %.el
	${emacs} ${ARGS} ${COMPILE_ARGS} -L . -f batch-byte-compile $<

update-copyright-years:
	year=`date +%Y`;                                                      \
	sed -i *.el *.md -r                                                   \
	  -e 's/Copyright \(C\) ([0-9]+)(-[0-9]+)?/Copyright (C) \1-'$$year'/'

clean:
	rm -f *.elc
