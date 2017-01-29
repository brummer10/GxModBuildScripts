######################################
#
# gxvintagefuzzmaster
#
######################################

GXVINTAGEFUZZMASTER_VERSION = 1f85ab67627ffa340273a0b2c027b3ece16019bb
GXVINTAGEFUZZMASTER_SITE = $(call github,brummer10,GxVintageFuzzMaster.lv2,$(GXVINTAGEFUZZMASTER_VERSION))
GXVINTAGEFUZZMASTER_BUNDLES = gx_vfm.lv2

GXVINTAGEFUZZMASTER_TARGET_MAKE = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) SSE_CFLAGS="-O3 -mfpu=vfpv3" -C $(@D)

define GXVINTAGEFUZZMASTER_BUILD_CMDS
	$(GXVINTAGEFUZZMASTER_TARGET_MAKE) mod
endef

define GXVINTAGEFUZZMASTER_INSTALL_TARGET_CMDS
	$(GXVINTAGEFUZZMASTER_TARGET_MAKE) install DESTDIR=$(TARGET_DIR) INSTALL_DIR=/usr/lib/lv2
endef

$(eval $(generic-package))
