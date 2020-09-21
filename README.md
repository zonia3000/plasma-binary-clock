# Plasma Binary Clock for small panels

The binary clock provided by the package [plasma-widgets-addons](https://github.com/KDE/kdeplasma-addons) doesn't work very well inside small panels, so I created this alternative version.

Appearance is customizable:

![binary clock screenshot](binary_clocks_screenshot.jpg)


## Install

    kpackagetool5 -t Plasma/Applet --install ./plasmoid/


## Remove

    kpackagetool5 -t Plasma/Applet --remove ./plasmoid/

## Development

    sudo apt install plasma-sdk

### Test

    plasmoidviewer --applet ./plasmoid/

