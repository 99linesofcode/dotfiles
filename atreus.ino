// -*- mode: c++ -*-

#include "Kaleidoscope.h"
#include "Kaleidoscope-Qukeys.h"

#define MO(n) ShiftToLayer(n)
#define TG(n) LockLayer(n)

#define Key_Exclamation LSHIFT(Key_1)
#define Key_At LSHIFT(Key_2)
#define Key_Hash LSHIFT(Key_3)
#define Key_Dollar LSHIFT(Key_4)
#define Key_Percent LSHIFT(Key_5)
#define Key_Caret LSHIFT(Key_6)
#define Key_And LSHIFT(Key_7)
#define Key_Star LSHIFT(Key_8)
#define Key_Plus LSHIFT(Key_Equals)


enum {
  PRIMARY,
  SECONDARY
};

/* *INDENT-OFF* */
KEYMAPS(
  [PRIMARY] = KEYMAP_STACKED
  (
       Key_Q        ,Key_W ,Key_E ,Key_R ,Key_T
      ,Key_A        ,Key_S ,Key_D ,Key_F ,Key_G
      ,Key_Z        ,Key_X ,Key_C ,Key_V ,Key_B, Key_Tab
      ,Key_CapsLock ,Key_Backtick ,Key_Quote ,LSHIFT(Key_9) ,Key_Space ,Key_Backspace

      ,Key_Y ,Key_U ,Key_I ,Key_O ,Key_P
      ,Key_H ,Key_J ,Key_K ,Key_L ,Key_Semicolon
      ,___ ,Key_N ,Key_M ,Key_Comma ,Key_Period ,Key_Slash
      ,Key_Delete ,Key_Space ,LSHIFT(Key_0) ,Key_Minus ,Key_Equals ,Key_Enter
  ),

  [SECONDARY] = KEYMAP_STACKED
  (
       Key_F1 ,Key_F2 ,Key_F3 ,Key_F4 ,Key_F5
      ,Key_1 ,Key_2 ,Key_3 ,Key_4 ,Key_5
      ,LGUI(LSHIFT(Key_S)) ,Key_UpArrow ,___ ,___ ,___ ,___
      ,Key_LeftArrow ,Key_DownArrow ,Key_RightArrow ,Key_LeftBracket ,___ ,___

      ,Key_F6 ,Key_F7 ,Key_F8 ,Key_F9 ,Key_F10
      ,Key_6 ,Key_7 ,Key_8 ,Key_9 ,Key_0
      ,___ ,___ ,___ ,___ ,___ ,Key_UpArrow
      ,___ ,___ ,Key_RightBracket ,Key_LeftArrow ,Key_DownArrow ,Key_RightArrow
   )
)
/* *INDENT-ON* */

KALEIDOSCOPE_INIT_PLUGINS(
  Qukeys
);

void setup() {
  QUKEYS(
    // QWERTY
    kaleidoscope::plugin::Qukey(0, KeyAddr(1, 0), Key_LeftGui),
    kaleidoscope::plugin::Qukey(0, KeyAddr(1, 1), Key_LeftAlt),
    kaleidoscope::plugin::Qukey(0, KeyAddr(1, 2), Key_LeftControl),
    kaleidoscope::plugin::Qukey(0, KeyAddr(1, 3), Key_LeftShift),

    kaleidoscope::plugin::Qukey(0, KeyAddr(3, 3), LSHIFT(Key_LeftBracket)),
    kaleidoscope::plugin::Qukey(0, KeyAddr(3, 4), MO(SECONDARY)),

    kaleidoscope::plugin::Qukey(0, KeyAddr(1, 8), Key_LeftShift),
    kaleidoscope::plugin::Qukey(0, KeyAddr(1, 9), Key_LeftControl),
    kaleidoscope::plugin::Qukey(0, KeyAddr(1, 10), Key_LeftAlt),
    kaleidoscope::plugin::Qukey(0, KeyAddr(1, 11), Key_LeftGui),

    kaleidoscope::plugin::Qukey(0, KeyAddr(3, 7), MO(SECONDARY)),
    kaleidoscope::plugin::Qukey(0, KeyAddr(3, 8), LSHIFT(Key_RightBracket)),

    // FUN
    kaleidoscope::plugin::Qukey(1, KeyAddr(1, 0), Key_Exclamation),
    kaleidoscope::plugin::Qukey(1, KeyAddr(1, 1), Key_At),
    kaleidoscope::plugin::Qukey(1, KeyAddr(1, 2), Key_Hash),
    kaleidoscope::plugin::Qukey(1, KeyAddr(1, 3), Key_Dollar),
    kaleidoscope::plugin::Qukey(1, KeyAddr(1, 4), Key_Percent),
    kaleidoscope::plugin::Qukey(1, KeyAddr(1, 7), Key_Caret),
    kaleidoscope::plugin::Qukey(1, KeyAddr(1, 8), Key_And),
    kaleidoscope::plugin::Qukey(1, KeyAddr(1, 9), Key_Star),
    kaleidoscope::plugin::Qukey(1, KeyAddr(1, 10), LSHIFT(Key_9)),
    kaleidoscope::plugin::Qukey(1, KeyAddr(1, 11), LSHIFT(Key_0)),
  )
  Qukeys.setHoldTimeout(200);
  Qukeys.setOverlapThreshold(80);
  Qukeys.setMinimumHoldTime(50);
  Qukeys.setMinimumPriorInterval(1);
  Qukeys.activate();

  Kaleidoscope.setup();
}

void loop() {
  Kaleidoscope.loop();
}
