/*
Copyright 2012 Jun Wako <wakojun@gmail.com>
Copyright 2015 Jack Humbert

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef CONFIG_H
#define CONFIG_H

#include "config_common.h"

// GCC include 'config.h" sequence in qmk_firmware/keyboards/ks70/
//   -include keyboards/ks70/config.h
//   -include keyboards/ks70/rev?/config.h
//   -include keyboards/ks70/rev?/keymaps/MAPNAME/config.h
//   XXXX.c

#include <serial_config.h>

// GCC include search path in qmk_firmare/keyboards/ks70/
//    #include "..." search starts here:
//    #include <...> search starts here:
//     keyboards/ks70/rev?/keymaps/MAPNAME
//     keyboards/ks70
//     keyboards/ks70/rev?
//     .
//     ./tmk_core
//     ......

#endif /* CONFIG_H */
