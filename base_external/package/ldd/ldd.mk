################################################################################
#
# ldd
#
################################################################################

LDD_VERSION = 'main'
LDD_SITE = https://github.com/cu-ecen-aeld/assignment-7-MENT2022.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

define LDD_BUILD_CMDS
    $(MAKE) -C $(@D)/misc-modules $(LINUX_MAKE_FLAGS) KERNELDIR=$(LINUX_DIR)
    $(MAKE) -C $(@D)/scull $(LINUX_MAKE_FLAGS) KERNELDIR=$(LINUX_DIR)
endef

define LDD_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/misc-modules/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/
    $(INSTALL) -D -m 0755 $(@D)/scull/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/
endef

$(eval $(kernel-module))
$(eval $(generic-package))