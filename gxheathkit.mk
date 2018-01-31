######################################
#
# gxheathkit
#
######################################

GXHEATHKIT_VERSION = 49895ae55f32ad9a6825bc592ebd7e37eb5f2215
GXHEATHKIT_SITE = $(call github,brummer10,GxHeathkit.lv2,$(GXHEATHKIT_VERSION))
GXHEATHKIT_BUNDLES = gx_Heathkit.lv2

GXHEATHKIT_TARGET_MAKE = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) SSE_CFLAGS="-O3 -mfpu=vfpv3" -C $(@D)

define GXHEATHKIT_BUILD_CMDS
	$(GXHEATHKIT_TARGET_MAKE) mod
endef

define GXHEATHKIT_INSTALL_TARGET_CMDS
	$(GXHEATHKIT_TARGET_MAKE) install DESTDIR=$(TARGET_DIR) INSTALL_DIR=/usr/lib/lv2
endef

$(eval $(generic-package))
