################################################################################
#
# xdriver_xf86-video-armada
#
################################################################################

XDRIVER_XF86_VIDEO_ARMADA_VERSION = 04748ff4fb30370086cc97b9487a32951c5600ba
XDRIVER_XF86_VIDEO_ARMADA_SITE = http://git.arm.linux.org.uk/cgit/xf86-video-armada.git
XDRIVER_XF86_VIDEO_ARMADA_SITE_METHOD = git
XDRIVER_XF86_VIDEO_ARMADA_AUTORECONF = YES
XDRIVER_XF86_VIDEO_ARMADA_DEPENDENCIES = \
	libdrm-armada \
	xserver_xorg-server

XDRIVER_XF86_VIDEO_ARMADA_LICENSE_FILES= README etna_viv/LICENSE
XDRIVER_XF86_VIDEO_ARMADA_LICENSE = BSD

#Need etna_viv source files for driver
define XDRIVER_XF86_VIDEO_ARMADA_ETNASRC
	git clone https://github.com/laanwj/etna_viv.git $(@D)/etna_viv
        mkdir $(@D)/m4
endef

XDRIVER_XF86_VIDEO_ARMADA_POST_PATCH_HOOKS += XDRIVER_XF86_VIDEO_ARMADA_ETNASRC

define XDRIVER_XF86_VIDEO_ARMADA_INSTALL_CONF_FILE
        $(INSTALL) -m 0644 -D $(@D)/conf/xorg-sample.conf $(TARGET_DIR)/etc/X11/xorg.conf
endef

XDRIVER_XF86_VIDEO_ARMADA_POST_INSTALL_TARGET_HOOKS += XDRIVER_XF86_VIDEO_ARMADA_INSTALL_CONF_FILE


XDRIVER_XF86_VIDEO_ARMADA_CONF_OPTS = \
  --prefix=/usr --disable-vivante --disable-etnaviv \
  --with-etnaviv-source=$(@D)/etna_viv

$(eval $(autotools-package))
