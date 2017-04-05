######################################
#
# gxslowgear
#
######################################

GXSLOWGEAR_VERSION = 6fb75b807d72a0bcd369ff5b8d98f0c6c60b9068
GXSLOWGEAR_SITE = $(call github,brummer10,GxSlowGear.lv2,$(GXSLOWGEAR_VERSION))
GXSLOWGEAR_BUNDLES = gx_slowgear.lv2

GXSLOWGEAR_TARGET_MAKE = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) SSE_CFLAGS="-O3 -mfpu=vfpv3" -C $(@D)

define GXSLOWGEAR_BUILD_CMDS
	$(GXSLOWGEAR_TARGET_MAKE) mod
endef

define GXSLOWGEAR_INSTALL_TARGET_CMDS
	$(GXSLOWGEAR_TARGET_MAKE) install DESTDIR=$(TARGET_DIR) INSTALL_DIR=/usr/lib/lv2
endef

$(eval $(generic-package))
