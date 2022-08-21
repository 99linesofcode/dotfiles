// -*- mode: c++ -*-

#include "Kaleidoscope.h"
#include "Kaleidoscope-MouseKeys.h"
#include "Kaleidoscope-Qukeys.h"

#define MO(n) ShiftToLayer(n)
#define TG(n) LockLayer(n)

#define Key_Exclamation LSHIFT(Key_1)
#define Key_At LSHIFT(Key_2)
#define Key_Pound LSHIFT(Key_3)
#define Key_Dollar LSHIFT(Key_4)
#define Key_Percent LSHIFT(Key_5)
#define Key_Caret LSHIFT(Key_6)
#define Key_Ampersand LSHIFT(Key_7)
#define Key_Star LSHIFT(Key_8)
#define Key_Plus LSHIFT(Key_Equals)
#define Key_Redo LCTRL(Key_Y)

#define Key_LeftParen LSHIFT(Key_9)
#define Key_RightParen LSHIFT(Key_0)
#define Key_LeftCurly LSHIFT(Key_LeftBracket)
#define Key_RightCurly LSHIFT(Key_RightBracket)
#define Key_Colon LSHIFT(Key_Semicolon)
#define Key_Tilde LSHIFT(Key_Backtick)
#define Key_Pipe LSHIFT(Key_Backslash)
#define Key_Underscore LSHIFT(Key_Minus)

#define Key_Screenshot LGUI(LSHIFT(Key_S))

enum
{
  PRIMARY,
  NAV,
  MOUSE,
  BUTTON,
  MEDIA,
  NUM,
  SYM,
  FUN
};

// clang-format off
KEYMAPS(
    [PRIMARY] = KEYMAP_STACKED
    (
        Key_Q, Key_W, Key_E, Key_R, Key_T,
        Key_A, Key_S, Key_D, Key_F, Key_G,
        Key_Z, Key_X, Key_C, Key_V, Key_B, ___,
        Key_Enter, ___, ___, Key_CapsLock, Key_Space, Key_Tab,

        Key_Y, Key_U, Key_I, Key_O, Key_P,
        Key_H, Key_J, Key_K, Key_L, Key_Semicolon,
        ___, Key_N, Key_M, Key_Comma, Key_Period, Key_Slash,
        Key_Backspace, Key_Space, Key_Delete, ___, ___, Key_Enter
    ),

    [NAV] = KEYMAP_STACKED
    (
        ___, ___, ___, ___, ___,
        Key_LeftGui, Key_LeftAlt, Key_LeftControl, Key_LeftShift, ___,
        ___, ___, ___, ___, ___, ___,
        ___, ___, ___, ___, ___, ___,

        Key_Redo, Key_Paste, Key_Copy, Key_Cut, Key_Undo,
        Key_Esc, Key_LeftArrow, Key_DownArrow, Key_UpArrow, Key_RightArrow,
        ___, Key_Insert, Key_Home, Key_PageDown, Key_PageUp, Key_End,
        Key_Backspace, Key_Space, Key_Delete, ___, ___, ___
    ),

    [MOUSE] = KEYMAP_STACKED
    (
        ___, ___, ___, ___, ___,
        Key_LeftGui, Key_LeftAlt, Key_LeftControl, Key_LeftShift, ___,
        ___, ___, ___, ___, ___, ___,
        ___, ___, ___, ___, ___, ___,

        Key_Redo, Key_Paste, Key_Copy, Key_Cut, Key_Undo,
        ___, Key_LeftArrow, Key_DownArrow, Key_UpArrow, Key_RightArrow,
        ___, ___, ___, ___, ___, ___,
        ___, ___, ___, ___, ___, ___
    ),

    [BUTTON] = KEYMAP_STACKED
    (
        Key_Undo, Key_Cut, Key_Copy, Key_Paste, Key_Redo,
        Key_LeftGui, Key_LeftAlt, Key_LeftControl, Key_LeftShift, ___,
        Key_Undo, Key_Cut, Key_Copy, Key_Paste, Key_Redo, ___,
        ___, ___, ___, ___, ___, ___,

        Key_Redo, Key_Paste, Key_Copy, Key_Cut, Key_Undo,
        ___, Key_RightShift, Key_RightControl, Key_RightAlt, Key_RightGui,
        ___, Key_Redo, Key_Paste, Key_Copy, Key_Cut, Key_Undo,
        ___, ___, ___, ___, ___, ___
    ),

    [MEDIA] = KEYMAP_STACKED
    (
        ___, ___, ___, ___, ___,
        Key_LeftGui, Key_LeftAlt, Key_LeftControl, Key_LeftShift, ___,
        ___, ___, ___, ___, ___, ___,
        ___, ___, ___, ___, ___, ___,

        ___, ___, ___, ___, ___,
        ___, ___, Key_VolumeDown, Key_VolumeUp, ___,
        ___, ___, ___, ___, ___, ___,
        Key_Stop, Key_Pause, Key_Mute, ___, ___, ___
    ),

    [NUM] = KEYMAP_STACKED
    (
        Key_LeftBracket, Key_7, Key_8, Key_9, Key_RightBracket,
        Key_Semicolon, Key_4, Key_5, Key_6, Key_Equals,
        Key_Backtick, Key_1, Key_2, Key_3, Key_Backslash, ___,
        ___, ___, ___, Key_Period, Key_0, Key_Minus,

        ___, ___, ___, ___, ___,
        ___, Key_RightShift, Key_RightControl, Key_RightAlt, Key_RightGui,
        ___, ___, ___, ___, ___, ___,
        ___, ___, ___, ___, ___, ___
    ),

    [SYM] = KEYMAP_STACKED
    (
        Key_LeftBracket, Key_Ampersand, Key_Star, Key_LeftCurly, Key_RightCurly,
        Key_Colon, Key_Dollar, Key_Percent, Key_Caret, Key_Equals,
        Key_Tilde, Key_Exclamation, Key_At, Key_Pound, Key_Pipe, ___,
        ___, ___, ___, Key_LeftParen, Key_RightParen, Key_Underscore,

        ___, ___, ___, ___, ___,
        ___, Key_RightShift, Key_RightControl, Key_RightAlt, Key_RightGui,
        ___, ___, ___, ___, ___, ___,
        ___, ___, ___, ___, ___, ___
    ),

    [FUN] = KEYMAP_STACKED
    (
        Key_F12, Key_F7, Key_F8, Key_F9, Key_PrintScreen,
        Key_F11, Key_F4, Key_F5, Key_F6, Key_ScrollLock,
        Key_F10, Key_F1, Key_F2, Key_F3, ___, ___,
        ___, ___, ___, ___, ___, ___,

        ___, ___, ___, ___, ___,
        ___, Key_RightShift, Key_RightControl, Key_RightAlt, Key_RightGui,
        ___, ___, ___, ___, ___, ___,
        ___, ___, ___, ___, ___, ___
    )
)
// clang-format on

KALEIDOSCOPE_INIT_PLUGINS(MouseKeys, Qukeys);

void setup()
{
  QUKEYS(
      kaleidoscope::plugin::Qukey(0, KeyAddr(1, 0), Key_LeftGui),
      kaleidoscope::plugin::Qukey(0, KeyAddr(1, 1), Key_LeftAlt),
      kaleidoscope::plugin::Qukey(0, KeyAddr(1, 2), Key_LeftControl),
      kaleidoscope::plugin::Qukey(0, KeyAddr(1, 3), Key_LeftShift),
      kaleidoscope::plugin::Qukey(0, KeyAddr(3, 3), MO(MEDIA)),
      kaleidoscope::plugin::Qukey(0, KeyAddr(3, 4), MO(NAV)),
      kaleidoscope::plugin::Qukey(0, KeyAddr(3, 5), MO(MOUSE)),

      kaleidoscope::plugin::Qukey(0, KeyAddr(1, 8), Key_LeftShift),
      kaleidoscope::plugin::Qukey(0, KeyAddr(1, 9), Key_LeftControl),
      kaleidoscope::plugin::Qukey(0, KeyAddr(1, 10), Key_LeftAlt),
      kaleidoscope::plugin::Qukey(0, KeyAddr(1, 11), Key_LeftGui),

      kaleidoscope::plugin::Qukey(0, KeyAddr(3, 7), MO(SYM)),
      kaleidoscope::plugin::Qukey(0, KeyAddr(3, 7), MO(NUM)),
      kaleidoscope::plugin::Qukey(0, KeyAddr(3, 8), MO(FUN)))

  Qukeys.setHoldTimeout(200);
  Qukeys.setOverlapThreshold(100);
  Qukeys.setMinimumHoldTime(50);
  Qukeys.setMinimumPriorInterval(1);
  Qukeys.activate();

  Kaleidoscope.setup();
}

void loop()
{
  Kaleidoscope.loop();
}
