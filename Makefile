emacs ?= emacs
FILES := mu4e-overview.el
ELC := $(FILES:.el=.elc)

ARGS := --batch -Q

ifdef USE_SYSTEM_MU4E
MU4E_FILE := $(shell find /usr/share/emacs -name mu4e.el)
MU4E_DIR := $(shell dirname ${MU4E_FILE})
COMPILE_ARGS := --eval '(add-to-list '"'"'load-path "'${MU4E_DIR}'")'
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
