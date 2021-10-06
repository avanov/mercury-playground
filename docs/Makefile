COMPONENT_MKFILE_PATH		:= $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
COMPONENT_MKFILE_PATH		:= $(shell cd $(shell dirname $(COMPONENT_MKFILE_PATH)); pwd)

COMPONENT_ROOT				:= $(COMPONENT_MKFILE_PATH)
# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = $(COMPONENT_ROOT)
BUILDDIR      = $(COMPONENT_ROOT)/_build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help $(COMPONENT_ROOT)/Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%:
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
