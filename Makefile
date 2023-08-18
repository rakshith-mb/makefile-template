# Find all subdirectories that contain a makefile
SUBDIRS = $(shell find . -mindepth 1 -type f -name 'Makefile' -print -path ./.git -prune | sed -r 's|/[^/]+$$||' | sort | sed '/^\.$$/d')

# Tell makefile that these targets should not be confused with filenames if they match
.PHONY: commit targ $(SUBDIRS)

targ: $(SUBDIRS)

# Iterate through subdirs to find all cpp files. Change to .c or any other extention as needed
refine:
	$(foreach D,$(SUBDIRS),$(wildcard $(D)/*.cpp))

# Recursively call make in each subdir with the specified target
$(SUBDIRS):
	$(MAKE) $(MAKECMDGOALS) -C $@

# for implicit rules
%: targ

# for goals
$(MAKECMDGOALS) : targ
