#!/bin/sh
dconf reset -f /
dconf load -f / < dconf_gnome.ini
dconf update /
