# Intel Aero Machine kernel support
KBRANCH_intel-aero = "standard/base"
KMACHINE_intel-aero ?= "common-pc-64"
SRCREV_machine_intel-aero ?= "cdd86b9722657feffdca5a12ecc34c30be64e618"
COMPATIBLE_MACHINE_intel-aero = "intel-aero"
LINUX_VERSION_intel-aero = "4.4.41"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# List of configs to enable in kernel .config
SRC_URI += "file://lpss.cfg \
			file://mmc.cfg \
			file://pinctrl.cfg \
			file://debug.cfg \
			file://socdts.cfg \
			file://dma.cfg \
			file://drone-code.cfg \
			file://acmmbim.cfg \
			file://nat.cfg \
			file://spi.cfg \
			file://usbotg.cfg \
			file://regulator.cfg \
			file://camera.cfg \
			file://wdt.cfg \
			"

# List of binarie files
SRC_URI += "file://shisp_2401a0_v21.bin \
			"


# List of patches to apply
SRC_URI += "file://0001-thermal-add-cherryview-support-to-soc-dts.patch \
			file://0007-spi-Let-drivers-translate-ACPI-DeviceSelection-to-su.patch \
			file://0008--spi-pxa2xx-Move-chip-select-control-bits-into-lpss_c.patch \
			file://0009--spi-pxa2xx-Translate-ACPI-DeviceSelection-to-Linux-c.patch \
			file://0010--spi-pxa2xx-Add-support-for-both-chip-selects-on-Inte.patch \
			file://0011-usb-otg-add-cherryview-support.patch \
			file://0017-intel-mid-split-keyboard-gpio-SFI-implementation-fro.patch \
			file://0018-input-soc_button_array-add-debounce-parameter-to-the.patch \
			file://0024-acpi-Workaround-for-not-registering-CAN-controller.patch \
			"

do_install_append() {
			install -d ${D}/lib/firmware
			install -m 0777 ${WORKDIR}/shisp_2401a0_v21.bin ${D}/lib/firmware
}
