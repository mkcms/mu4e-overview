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

clean:
	rm -f *.elc
