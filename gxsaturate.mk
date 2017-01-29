######################################
#
# gxsaturate
#
######################################

GXSATURATE_VERSION = 2e846acad788b4b215a63af41a647510b3e1ed22
GXSATURATE_SITE = $(call github,brummer10,GxSaturator.lv2,$(GXSATURATE_VERSION))
GXSATURATE_BUNDLES = gx_saturate.lv2

GXSATURATE_TARGET_MAKE = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) SSE_CFLAGS="-O3 -mfpu=vfpv3" -C $(@D)

define GXSATURATE_BUILD_CMDS
	$(GXSATURATE_TARGET_MAKE) mod
endef

define GXSATURATE_INSTALL_TARGET_CMDS
	$(GXSATURATE_TARGET_MAKE) install DESTDIR=$(TARGET_DIR) INSTALL_DIR=/usr/lib/lv2
endef

$(eval $(generic-package))
