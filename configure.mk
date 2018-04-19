#############################################################################
# Don't touch these...
#############################################################################

this_makefile := ${lastword ${MAKEFILE_LIST}}
SHELL = bash -o pipefail -o errexit -o nounset
.SECONDARY:

# autoconf variables
SED = sed
# autoconf apps
autoreconf = autoreconf
glibtoolize = glibtoolize

# Use "autoreconf_flags=--force" to override cached values.
autoreconf_flags = 

all_files = \
  install-sh \
  configure \

#############################################################################
#HELP:Default target is "all". Targets include:
.DEFAULT_GOAL = all

#HELP:Targets include:

.PHONY: all #  build everything so that ./configure will work
all: ${all_files}

.PHONY: clean #  Remove things build by this makefile
clean:
	${RM} ${all_files}
	${RM} -r autom4te.cache

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# build 

configure: configure.ac
	${autoreconf} ${autoreconf_flags} --install --verbose

install-sh:
	${glibtoolize} -icf
	${RM} ltmain.sh config.guess config.sub

#############################################################################
# make help: this must be the last target

.PHONY: help #  Print this help
help:
	@ ${SED} -e '/^\.PHONY:/s/^\.PHONY: *\([^ #]*\) *\#\( *\)\([^ ].*\)/\2\1: \3/p;/^[^#]*#HELP:/s/[^#]*#HELP:\(.*\)/\1/p;d' ${this_makefile}

# don't put anything after this
