# KindleLazy
Remote page turns and brightness control for Kindles.

KindleLazy is an application that allows the use of an external USB device (such as a mouse, keyboard or wireless presenter) to control various aspects of the reading experience when using the stock reader on Amazon Kindle devices.

At present, KindleLazy only reads events from /dev/input/event2 and /dev/input/event3, as these are the event devices presented by the external USB device used by the original author. This should be improved later.

The USB OTG implementation on Kindle devices does not support USB device hotplugging. Have the device inserted before starting KindleLazy; if the device is removed, the application may quit.

## Device Compatibility

|Device|Status |
|------|-------|
|PW3   |Working|

## Configuration
The program will not work without a config file named `config.json` in the same directory as the KindleLazy binary. This configuration file should not be confused with the `menu.json` and `config.xml` files used by the accompanying KUAL extension.

Here is a sample (and the default) `config.json` file:

```
{
   "key_brightness_down" : [ 115 ],
   "key_brightness_up" : [ 114 ],
   "key_next_page" : [ 104, 103, 106 ],
   "key_prev_page" : [ 109, 108, 105 ],
   "key_wake" : [ 15 ]
}
```
Errors in the config file are not handled and are likely to crash KindleLazy - beware of commas and other punctuation characters.

Enter the keycodes for the keys you want to trigger the actions.

For the config above, the key codes represent:

|Key |Action        |
|----|--------------|
|104 | KEY_PAGEUP   |         
|109 | KEY_PAGEDOWN |
|103 | KEY_UP       |
|108 | KEY_DOWN     |
|105 | KEY_LEFT     |
|106 | KEY_RIGHT    |
|114 | VOLUME_DOWN  |
|115 | VOLUME_UP    |
|15  | TAB          |

To view the key codes emitted by a device, run 'evtest /dev/input/mydevice' and see what values are given when pressing keys.

## Adjusting page turn direction
The page turn direction can be reversed (pass argument '-reverse'), so that your 'forward' button can still advance you to the next page.
For example, with books that are 'right to left', where the next page is on the left, you would reverse the direction.

## Credits
- [llakssz](https://github.com/llakssz) - original author of KindleLazy
- lucida - [original work on USB OTG input device support](https://www.mobileread.com/forums/showthread.php?t=276501)