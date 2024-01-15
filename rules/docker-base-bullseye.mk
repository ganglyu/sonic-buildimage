# Docker base image (based on Debian Bullseye)

DOCKER_BASE_BULLSEYE = docker-base-bullseye.gz
$(DOCKER_BASE_BULLSEYE)_PATH = $(DOCKERS_PATH)/docker-base-bullseye

$(DOCKER_BASE_BULLSEYE)_DEPENDS += $(SOCAT)

GDB = gdb
GDBSERVER = gdbserver
VIM = vim
OPENSSH = openssh-client
SSHPASS = sshpass
STRACE = strace

ifeq ($(INCLUDE_FIPS), y)
$(DOCKER_BASE_BULLSEYE)_DEPENDS += $(FIPS_OPENSSL_LIBSSL) $(FIPS_OPENSSL_LIBSSL_DEV) $(FIPS_OPENSSL) $(SYMCRYPT_OPENSSL) $(FIPS_KRB5)
endif

$(DOCKER_BASE_BULLSEYE)_DBG_IMAGE_PACKAGES += $(GDB) $(GDBSERVER) $(VIM) $(OPENSSH) $(SSHPASS) $(STRACE)

SONIC_DOCKER_IMAGES += $(DOCKER_BASE_BULLSEYE)
SONIC_BULLSEYE_DOCKERS += $(DOCKER_BASE_BULLSEYE)
