##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-MENT2022.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_VERSION = main
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
    # Build the writer binary in the finder-app directory
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app writer
    # Build the aesdsocket application
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server aesdsocket
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
    # Install configuration files (if any)
    $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/finder-app/conf
    $(INSTALL) -m 0644 $(@D)/finder-app/conf/* $(TARGET_DIR)/etc/finder-app/conf/
    
    # Install binaries and scripts
    $(INSTALL) -D -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin/writer
    $(INSTALL) -D -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin/finder.sh
    $(INSTALL) -D -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin/finder-test.sh
    
    # Install the aesdsocket executable
    $(INSTALL) -D -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/aesdsocket
    
    # Install the aesdsocket-start-stop script
    $(INSTALL) -D -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
    
    # Install required test scripts
    $(INSTALL) -D -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))