
##############################################################
#
# AESDCHAR
#
##############################################################


AESDCHAR_VERSION = 92523e69a98127f86a187d70149fb4527a962fb9
AESDCHAR_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-AntonioMR.git
AESDCHAR_SITE_METHOD = git
AESDCHAR_GIT_SUBMODULES = YES

$(eval $(kernel-module))

# define directories to build
AESDCHAR_MODULE_SUBDIRS = aesd-char-driver
AESDCHAR_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

# Copy utilities/scripts to the installation steps below
define AESDCHAR_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar-start-stop $(TARGET_DIR)/etc/init.d/S97aesdchar
endef

$(eval $(generic-package))
