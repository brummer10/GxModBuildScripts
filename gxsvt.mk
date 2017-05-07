######################################
#
# gxsvt
#
######################################

GXSVT_VERSION = e9b9aa4912b829ee49080a44e6e55889e03f6af5
GXSVT_SITE = $(call github,brummer10,GxSVT.lv2,$(GXSVT_VERSION))
GXSVT_BUNDLES = gx_ampegsvt.lv2

GXSVT_TARGET_MAKE = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) SSE_CFLAGS="-O3 -mfpu=vfpv3" -C $(@D)

define GXSVT_BUILD_CMDS
	$(GXSVT_TARGET_MAKE) mod
endef

define GXSVT_INSTALL_TARGET_CMDS
	$(GXSVT_TARGET_MAKE) install DESTDIR=$(TARGET_DIR) INSTALL_DIR=/usr/lib/lv2
endef

$(eval $(generic-package))
