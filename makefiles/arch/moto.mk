include $(ROOTDIR)/makefiles/arch/unix.mk

INSTALLDIR = /mmc/mmca1/.system/QTDownLoad/fbreader
IMAGEDIR = $(INSTALLDIR)/pics
APPIMAGEDIR = $(IMAGEDIR)/%APPLICATION_NAME%

ARM_PATH = /home/ooo/Work/Compile/blackhawk_e2_sdk_with_gcc-arm-iwmmxt/gcc-arm-iwmmxt/gcc-3.3.6-glibc-2.3.2#ooo fixed path
TOOLS_PATH = $(ARM_PATH)/arm-linux/bin
QT_PATH = /home/ooo/Work/Compile/blackhawk_e2_sdk_with_gcc-arm-iwmmxt/e2-sdk/qt#ooo fixed 
EZX_PATH = /home/ooo/Work/Compile/blackhawk_e2_sdk_with_gcc-arm-iwmmxt/e2-sdk/ezx#ooo added

CC = $(TOOLS_PATH)/arm-linux-gcc
AR = $(TOOLS_PATH)/arm-linux-ar rsu
LD = $(TOOLS_PATH)/arm-linux-g++
MOC = $(QT_PATH)/bin/moc

RM = rm -rvf
RM_QUIET = rm -rf

QTINCLUDE = -I $(QT_PATH)/include -I $(EZX_PATH)/include
EXTERNAL_INCLUDE = -I $(ROOTDIR)/common-lib/include#ooo added
EXTERNAL_LIBS = -L$(ROOTDIR)/common-lib/lib#ooo added
UILIBS = -L$(QT_PATH)/../lib -L$(QT_PATH)/../lib/ezx -lqte-mt -lezxappbase -lpthread #-lezxappsdk -lezxopenwindow -lipp-miscGen -lipp-jp -lezxjpeg -lezxpm

CFLAGS = -pipe -Duint16_t="unsigned short" -Duint32_t="unsigned int" -DQWS -fno-exceptions -fno-rtti -Wall -W -O2 -mcpu=iwmmxt -mtune=iwmmxt -Wno-ctor-dtor-privacy -W -ftemplate-depth-30
LDFLAGS = -Wl,-rpath-link,$(QT_PATH)/lib:$(EZX_PATH)/lib,-rpath,./
