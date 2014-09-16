#======================================================================
# Check and re-make redirection page.
#======================================================================

#----------------------------------------------------------------------
# Settings.
#----------------------------------------------------------------------

# Output directory for local build.
SITE = _site

# Jekyll configuration file.
CONFIG = _config.yml

# Default: show commands.
all : commands

#----------------------------------------------------------------------
# Targets.
#----------------------------------------------------------------------

## ---------------------------------------

## commands : show all commands.
commands :
	@grep -E '^##' Makefile | sed -e 's/##//g'

## ---------------------------------------

## site     : build the site as GitHub will see it.
site :
	 jekyll build -t -d $(SITE)

## check    : check that the index.html file is properly formatted.
check :
	@python bin/swc_index_validator.py ./index.html

## clean    : clean up all generated files.
clean : tidy
	rm -rf $(SITE) *~

## ---------------------------------------

.PHONY: all check clean
