
##############################################################
#
# LDD
#
##############################################################


LDD_VERSION = c78fad9937bba91fbee283c95567766315cf15bd
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-AntonioMR.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

$(eval $(kernel-module))

# define directories to build
LDD_MODULE_SUBDIRS = misc-modules scull
LDD_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

# Copy utilities/scripts to the installation steps below
define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin/
	
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload  $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
