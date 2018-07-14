interphase
=======

A wireless split compact keyboard.

Keyboard Maintainer: [@durburz](https://github.com/durburz]
Hardware Supported: interphase PCB
TODO Hardware Availability: https://www.reddit.com/r/MechanicalKeyboards/comments/66588f/wireless_split_qmk_mitosis/

Make example for this keyboard (after setting up your build environment):

    make interphase:default

See [build environment setup](https://docs.qmk.fm/build_environment_setup.html) then the [make instructions](https://docs.qmk.fm/make_instructions.html) for more information.

## interphase Notes

These configuration files were based off the Mitosis and Atreus keyboard. It assumes a Pro Micro is being used, however retains the 'make upload' feature from the Atreus branch. This keyboard uses a completely different 'matrix scan' system to other keyboards, it relies on an external nRF51822 microcontroller maintaining a matrix of keystates received from the keyboard halves. The matrix.c file contains the code to poll the external microcontroller for the key matrix. As long as this file is not changed, all other QMK features are supported.

TODO Build log of the keyboard can be found [here](https://www.reddit.com/r/MechanicalKeyboards/comments/66588f/wireless_split_qmk_mitosis/)

TODO Hardware design files can be found [here](https://github.com/reversebias/mitosis-hardware)

TODO Firmware for the nordic MCUs can be found [here](https://github.com/reversebias/mitosis)
