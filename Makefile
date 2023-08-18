SUBDIRS = $(shell find . -mindepth 1 -type f -name 'Makefile' -print -path ./.git -prune | sed -r 's|/[^/]+$$||' | sort | sed '/^\.$$/d')

# SUBDIRS = ./gpu/wmma-simple

.PHONY: commit targ $(SUBDIRS)

targ: $(SUBDIRS)

refine:
	$(foreach D,$(SUBDIRS),$(wildcard $(D)/*.cpp))

$(SUBDIRS):
	$(MAKE) $(MAKECMDGOALS) -C $@

# for implicit rules
%: targ

# for goals
$(MAKECMDGOALS) : targ
