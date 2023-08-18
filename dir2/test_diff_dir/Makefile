###############################################################################
# Only the following section needs to be changed

BINARY=main
SOURCE_DIR=.
INCLUDE_DIR=.

# DEBUG or RUN
CONFIG=RUN
###############################################################################

TOOLCHAIN=g++

DEP_FLAGS=-MP -MD

DEBUG_FLAGS=-g
RUN_FLAGS=-O3

ifeq ($(CONFIG),DEBUG)
	CONFIG_FLAGS=$(DEBUG_FLAGS)
else
	CONFIG_FLAGS=$(RUN_FLAGS)
endif

CFLAGS=-Wall -std=c++17 $(foreach D,$(INCLUDE_DIR),-I$(D)) $(CONFIG_FLAGS) $(DEP_FLAGS)

CPP_FILES=$(foreach D,$(SOURCE_DIR),$(wildcard $(D)/*.cpp))
H_FILES=$(foreach D,$(SOURCE_DIR),$(wildcard $(D)/*.h))
DEP_FILES=$(patsubst %.h,%.d,$(H_FILES))

print:
	@echo "DEP Files: $(DEP_FILES)"

all: $(BINARY)

$(BINARY):$(CPP_FILES) $(H_FILES)
	$(TOOLCHAIN) $(CPP_FILES) $(CFLAGS) -o $@

clean:
	rm -rf $(BINARY) $(DEP_FILES) main.d

diff:
	@git status
	@git diff --stat

commit:
	git add .
	git commit -m "$m"
	git push origin HEAD 

-include $(DEPFILES)

.PHONY: all clean diff commit
