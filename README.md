# Plasma Binary Clock for small panels

The binary clock provided by the package [plasma-widgets-addons](https://github.com/KDE/kdeplasma-addons) doesn't work very well inside small panels, so I created this alternative version.

Appearance is customizable:

![binary clock screenshot](binary_clocks_screenshot.jpg)

The latest version works with Plasma 6. For Plasma 5 checkout the 0.1.0 tag.

## Install

    kpackagetool6 -t Plasma/Applet --install ./package/

## Remove

    kpackagetool6 -t Plasma/Applet --remove org.kde.plasma.contrib.binaryclock

## Development

    sudo apt install plasma-sdk

### Test

    plasmoidviewer --applet ./package/
