################################################################################
#
# libdrm-armada
#
################################################################################

LIBDRM_ARMADA_VERSION = 6b461c163b0bd02c76b65d94cc2fb3767167bda8
LIBDRM_ARMADA_SITE = http://git.arm.linux.org.uk/cgit/libdrm-armada.git
LIBDRM_ARMADA_SITE_METHOD = git
LIBDRM_ARMADA_DEPENDENCIES = libdrm
LIBDRM_ARMADA_INSTALL_STAGING = YES
LIBDRM_ARMADA_AUTORECONF = YES
LIBDRM_ARMADA_LICENSE_FILES = libdrm_lists.h

# Needed for autoreconf to work properly
define LIBDRM_ARMADA_FIXUP_M4_DIR
        mkdir $(@D)/m4
endef

LIBDRM_ARMADA_POST_PATCH_HOOKS += LIBDRM_ARMADA_FIXUP_M4_DIR

$(eval $(autotools-package))
