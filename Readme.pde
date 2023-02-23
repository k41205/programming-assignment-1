/* README
 
 Name: Giacomo Cavarretta
 Student Number: 20104117
 
 -----------------------------
 
 Brief description of piece:
 The painting is entitled "Autumn Leaves". It's an abstract representation of them.
 
 -----------------------------
 
 Instructions:
 - When you run the code, it will be in mode 0 so any function, except the left mouse button, are disabled. To start playing around with the painting switch to a different mode between 1 and 3.
 - Any function used will generate a new painting
 - Scroll the wheel down to see the representation with a higher resolution (smaller size cells) or scroll up to decrease it.
 - Play with the + and - keys to increase or decrease the space between the objects thus having more or fewer objects in the painting.
 - Press the left mouse button to generate a new painting (objects in the painting will always be random and positioned in a random way).
 - Press 1, 2, and 3 to switch palette colours. Palette 1 has two green shades, palette 2 has two orange shades, and palette 3 mixes both green and orange shades.
 - Press 0 to return to the default setting of the initial painting (resolution, spacedOut, and palette variables) and disabled all the functions, except left click.
 - Press the right mouse button to save PNG.
 
 -----------------------------
 
 References:
 
 - The piece of code below has been taken from https://processing.org/reference/mouseWheel_.html
 
 void mouseWheel(MouseEvent event) {
 float e = event.getCount();
 ... }
 
 - keyReleased() - https://processing.org/reference/keyReleased_.html
 - key [System Variable] - https://processing.org/reference/key.html
 - random() - https://processing.org/reference/random_.html
 
 Colors used are:
 #4C392E - Van Dyke
 #DC602E - Dark moss green
 #BC412B - Pakistan green
 #606C38 - Flame
 #283618 - Persian red
 
 - The colors used were chosen thanks to Coolors.co [https://coolors.co/4c392e-606c38-283618-dc602e-bc412b]
 - For learning purpose I replicate the same palette with Adobe Color [https://color.adobe.com/Palette-1st-Assignment-color-theme-47726ad3-e01e-4e19-b74e-a46d0aa40c41]
 
 -----------------------------
 
 Known bugs/problems:
 If there is no focus on the window, all the functions bound to keys and scroll won't work when you run the program.
 It's a well-known bug with Processing. It looks like Windows (no idea about other OS) doesn't give by default the focus on the window launched by the Run command.
 You need to give focus on the window by clicking on it with the mouse to use click or scroll with the mouse before using any keyboard keys.
 
 */
