project_name			:= mercury-playground

# https://www.gnu.org/software/make/manual/html_node/Special-Variables.html
# https://ftp.gnu.org/old-gnu/Manuals/make-3.80/html_node/make_17.html
PROJECT_MKFILE_PATH		:= $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
PROJECT_MKFILE_DIR		:= $(shell cd $(shell dirname $(PROJECT_MKFILE_PATH)); pwd)

PROJECT_ROOT			:= $(PROJECT_MKFILE_DIR)
LOCAL_UNTRACK_DIR		:= $(PROJECT_MKFILE_DIR)/.local
BUILD_DIR				:= $(LOCAL_UNTRACK_DIR)/$(PROJECT_PLATFORM)/build
BUILD_NAME				:= $(BUILD_DIR)/main-exe
DIST_DIR				:= $(LOCAL_UNTRACK_DIR)/$(PROJECT_PLATFORM)/dist
DIST_NAME				:= $(DIST_DIR)/main-exe
DOCS_DIR				:= $(PROJECT_ROOT)/docs
SRC_DIR					:= $(PROJECT_ROOT)/src


include $(DOCS_DIR)/Makefile


.PHONY: build-docs
build-docs:
	$(MAKE) html


$(BUILD_DIR):
	install -dm0755 $(BUILD_DIR)

$(DIST_DIR):
	install -dm0755 $(DIST_DIR)

$(BUILD_NAME): $(BUILD_DIR)
	cd $(BUILD_DIR) && \
	mmc	--output-file	$(BUILD_NAME)	\
		$(SRC_DIR)/main.m

.PHONY: build
build: $(BUILD_NAME)

.PHONY: run
run: $(BUILD_NAME)
	$(BUILD_NAME)
