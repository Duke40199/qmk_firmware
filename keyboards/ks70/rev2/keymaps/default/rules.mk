
# Build Options
#   change to "no" to disable the options, or define them in the Makefile in
#   the appropriate keymap folder that will get included automatically
#
BOOTMAGIC_ENABLE = no       # Virtual DIP switch configuration(+1000)
MOUSEKEY_ENABLE = no       # Mouse keys(+4700)
EXTRAKEY_ENABLE = no       # Audio control and System control(+450)
CONSOLE_ENABLE = no         # Console for debug(+400)
COMMAND_ENABLE = no        # Commands for debug and configuration
NKRO_ENABLE = no            # Nkey Rollover - if this doesn't work, see here: https://github.com/tmk/tmk_keyboard/wiki/FAQ#nkro-doesnt-work
BACKLIGHT_ENABLE = no      # Enable keyboard backlight functionality
MIDI_ENABLE = no            # MIDI controls
AUDIO_ENABLE = no           # Audio output on port C6
UNICODE_ENABLE = no         # Unicode
BLUETOOTH_ENABLE = no       # Enable Bluetooth with the Adafruit EZ-Key HID
RGBLIGHT_ENABLE = no        # Enable WS2812 RGB underlight.  Do not enable this with audio at the same time.
SWAP_HANDS_ENABLE = no        # Enable one-hand typing

define KS70_CUSTOMISE_MSG
  $(info KS70 customize)
  $(info -  OLED_ENABLE=$(OLED_ENABLE))
  $(info -  LED_BACK_ENABLE=$(LED_BACK_ENABLE))
  $(info -  LED_UNDERGLOW_ENABLE=$(LED_UNDERGLOW_ENABLE))
  $(info -  LED_ANIMATION=$(LED_ANIMATIONS))
  $(info -  IOS_DEVICE_ENABLE=$(IOS_DEVICE_ENABLE))
endef

# KS70 keyboard customize
# you can edit follows 7 Variables
#  jp: 以下の7つの変数を必要に応じて編集します。
KS70_ROWS = 5              # KS70 Rows is 4 or 5
OLED_ENABLE = yes            # OLED_ENABLE
LOCAL_GLCDFONT = no         # use each keymaps "helixfont.h" insted of "common/glcdfont.c"
LED_BACK_ENABLE = no        # LED backlight (Enable WS2812 RGB underlight.)
LED_UNDERGLOW_ENABLE = no   # LED underglow (Enable WS2812 RGB underlight.)
LED_ANIMATIONS = yes        # LED animations
IOS_DEVICE_ENABLE = no      # connect to IOS device (iPad,iPhone)

####  LED_BACK_ENABLE and LED_UNDERGLOW_ENABLE.
####    Do not enable these with audio at the same time.

### KS70 keyboard 'default' keymap: convenient command line option
##    make KS70=<options> ks70:defualt
##    option= oled | back | under | na | ios
##    ex.
##      make KS70=oled          ks70:defualt
##      make KS70=oled,back     ks70:defualt
##      make KS70=oled,under    ks70:defualt
##      make KS70=oled,back,na  ks70:defualt
##      make KS70=oled,back,ios ks70:defualt
##
ifneq ($(strip $(KS70)),)
  ifeq ($(findstring oled,$(KS70)), oled)
    OLED_ENABLE = yes
  endif
  ifeq ($(findstring back,$(KS70)), back)
    LED_BACK_ENABLE = yes
  else ifeq ($(findstring under,$(KS70)), under)
    LED_UNDERGLOW_ENABLE = yes
  endif
  ifeq ($(findstring na,$(KS70)), na)
    LED_ANIMATIONS = no
  endif
  ifeq ($(findstring ios,$(KS70)), ios)
    IOS_DEVICE_ENABLE = yes
  endif
  $(eval $(call KS70_CUSTOMISE_MSG))
  $(info )
endif

# Uncomment these for checking
#   jp: コンパイル時にカスタマイズの状態を表示したい時はコメントをはずします。
# $(eval $(call KS70_CUSTOMISE_MSG))
# $(info )

ifneq ($(strip $(KS70_ROWS)), 4)
  ifneq ($(strip $(KS70_ROWS)), 5)
    $(error KS70_ROWS = $(strip $(KS70_ROWS)) is unexpected value)
  endif
endif
OPT_DEFS += -DKS70_ROWS=$(strip $(KS70_ROWS))

ifeq ($(strip $(LED_BACK_ENABLE)), yes)
  RGBLIGHT_ENABLE = yes
  OPT_DEFS += -DRGBLED_BACK
  ifeq ($(strip $(LED_UNDERGLOW_ENABLE)), yes)
    $(eval $(call KS70_CUSTOMISE_MSG))
    $(error LED_BACK_ENABLE and LED_UNDERGLOW_ENABLE both 'yes')
  endif
else ifeq ($(strip $(LED_UNDERGLOW_ENABLE)), yes)
  RGBLIGHT_ENABLE = yes
else
  RGBLIGHT_ENABLE = no
endif

ifeq ($(strip $(IOS_DEVICE_ENABLE)), yes)
    OPT_DEFS += -DIOS_DEVICE_ENABLE
endif

ifeq ($(strip $(LED_ANIMATIONS)), yes)
    OPT_DEFS += -DRGBLIGHT_ANIMATIONS
endif

ifeq ($(strip $(OLED_ENABLE)), yes)
    OPT_DEFS += -DOLED_ENABLE
endif

ifeq ($(strip $(LOCAL_GLCDFONT)), yes)
    OPT_DEFS += -DLOCAL_GLCDFONT
endif

# Do not enable SLEEP_LED_ENABLE. it uses the same timer as BACKLIGHT_ENABLE
SLEEP_LED_ENABLE = no    # Breathing sleep LED during USB suspend

ifndef QUANTUM_DIR
	include ../../../../Makefile
endif

# Uncomment these for debugging
# $(info -- RGBLIGHT_ENABLE=$(RGBLIGHT_ENABLE))
# $(info -- OPT_DEFS=$(OPT_DEFS))
# $(info )
