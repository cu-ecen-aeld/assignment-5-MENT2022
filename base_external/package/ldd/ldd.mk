################################################################################
#
# ldd
#
################################################################################

LDD_VERSION = '1.0'
LDD_SITE = 'https://github.com/cu-ecen-aeld/assignment-7-MENT2022.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = misc-modules scull
LDD_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

$(eval $(kernel-module))
$(eval $(generic-package))