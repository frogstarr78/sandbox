import kivy
kivy.require('1.0.7')

from kivy.app import App
from kivy.core.window import Window
from kivy.uix.widget import Widget
from kivy.uix.boxlayout import BoxLayout

class MyPaintApp(App):
    def _state(self):
        print('my current state is {}'.format(self.state))

class MyKeyboardListener(Widget):
    def __init__(self, **kwargs):
        super(MyKeyboardListener, self).__init__(**kwargs)
        self._keyboard = Window.request_keyboard(self._keyboard_closed, self, 'text')
        if self._keyboard.widget:
            pass # If it exists, this widget is a VKeyboard object which you can use to change the keyboard layout.
        self._keyboard.bind(on_key_down=self._on_keyboard_down)

    def _keyboard_closed(self):
        print('My keyboard have been closed!')
        self._keyboard.unbind(on_key_down=self._on_keyboard_down)
        self._keyboard = None

    def _on_keyboard_down(self, keyboard, keycode, text, modifiers):
        print('The key {0} have been pressed'.format(keycode))
        print(' - text is {0}'.format(text))
        print(' - modifiers are {0}'.format(modifiers))

        # Keycode is composed of an integer + a string
        # If we hit escape, release the keyboard
        if keycode[1] == 'escape':
            keyboard.release()

        # Return True to accept the key. Otherwise, it will be used by the system.
        return True

if __name__ == '__main__':
    MyPaintApp().run()
