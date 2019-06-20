MOD_NAME	:= snd-digitakt
ifneq ($(KERNELRELEASE),)
# called from kernel build system

all:
	@echo "Building from the kernel build system"
	@echo "Module build: $(CONFIG_SND_USB_DIGITAKT)"
	@echo "Name: $(MOD_NAME)"

snd-digitakt-objs := digitakt.o
obj-$(CONFIG_SND_USB_DIGITAKT) += snd-digitakt.o

else
EXTRA_FLAGS += -I 
PWD	:= $(shell pwd)
export CONFIG_SND_USB_DIGITAKT := m

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean

install: snd-digitakt.ko
	rm -f ${MDIR}/kernel/sound/usb/misc/$(MOD_NAME).ko
	install -m644 -b -D $(MOD_NAME).ko ${MDIR}/kernel/sound/usb/misc/$(MOD_NAME).ko
	depmod -aq

uninstall:
	rm -rf ${MDIR}/kernel/sound/usb/misc/$(MOD_NAME).ko
	depmod -aq

endif

.PHONY : all clean install uninstall

