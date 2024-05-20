emacs ?= emacs
FILES := mu4e-overview.el
ELC := $(FILES:.el=.elc)

ARGS := --batch -Q

ifdef USE_SYSTEM_MU4E
MU4E_FILE := $(shell find /usr/local/share/emacs -name mu4e.el)
ifeq (${MU4E_FILE},)
MU4E_FILE := $(shell find /usr/share/emacs -name mu4e.el)
endif
MU4E_DIR := $(shell dirname ${MU4E_FILE})
COMPILE_ARGS := --eval '(add-to-list '"'"'load-path "'${MU4E_DIR}'")'
endif

compile: $(ELC)

%.elc: %.el
	${emacs} ${ARGS} ${COMPILE_ARGS} -L .                                 \
	   --eval '(setq byte-compile-error-on-warn t)'                       \
	    -f batch-byte-compile $<

lint:
	file=$$(mktemp)                                                       \
	&& ${emacs} -Q --batch mu4e-overview.el                               \
		--eval '(checkdoc-file (buffer-file-name))' 2>&1 | tee $$file \
	&& test -z "$$(cat $$file)"                                           \
	&& (grep -n -E "^.{80,}" mu4e-overview.el `# Catch long lines`        \
	    | sed                                                             \
		-r '1d;s/^([0-9]+).*/mu4e-overview.el:\1: Too long/;q1')

update-copyright-years:
	year=`date +%Y`;                                                      \
	sed -i *.el *.md -r                                                   \
	  -e 's/Copyright \(C\) ([0-9]+)(-[0-9]+)?/Copyright (C) \1-'$$year'/'

clean:
	rm -f *.elc
