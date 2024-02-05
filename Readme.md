# Description
 
It's an interactive painting developed for a Java exam, utilizing the Processing framework.

The painting is entitled "Autumn Leaves" and is an abstract representation of them.

Interact with the painting using these shortcuts:

- Initially in mode 0, all functions disabled except left click. Press 1-3 to enable features.
- Left click to randomize painting.
- Keys 1-3 change color palettes (1 for greens, 2 for oranges, 3 for a mix).
- Scrolling adjusts resolution (down for higher, up for lower).
- Use + and - keys to adjust object spacing, altering quantity.
- Press 0 to reset to default and disable functions (except left click).
- Right click to save as PNG.

![Leaves](https://github.com/k41205/programming-assignment-1/assets/93975067/dedf3436-8771-4801-b250-40e66b0ccc73)
 -----------------------------
 
## Known bugs:
If there is no focus on the window, all the functions bound to keys and scroll won't work when you run the program.
It's a well-known bug with Processing. It looks like Windows (no idea about other OSs) doesn't give by default the focus on the window launched by the Run command.
You need to focus on the window by clicking on it with the mouse to use click or scroll with the mouse before using any keyboard keys.
