#!/usr/bin/env python3

"""
This is a simple AppIndicator for Ubuntu used as an introduction to 
AppIndicators. 
"""

import os
import signal

from gi.repository import Gtk
from gi.repository import AppIndicator3
from gi.repository import Notify


APPINDICATOR_ID = "Bell Scheduler Docker stop music"


def main():
	indicator = AppIndicator3.Indicator.new(
			APPINDICATOR_ID,
			os.path.abspath("/usr/lib/python3/dist-packages/bellscheduler-dre-appindicator/bell-scheduler.png"),
			AppIndicator3.IndicatorCategory.SYSTEM_SERVICES)
	indicator.set_status(AppIndicator3.IndicatorStatus.ACTIVE)
	indicator.set_menu(menu_build())
	Notify.init(APPINDICATOR_ID)

	Gtk.main()


def menu_build():
	"""Return a Gtk+ menu."""
	menu = Gtk.Menu()

	item_bell = Gtk.MenuItem("Stop Bell")
	item_bell.connect('activate', bell_stop)
	menu.append(item_bell)

	item_quit = Gtk.MenuItem("Quit")
	item_quit.connect('activate', quit)
	menu.append(item_quit)

	menu.show_all()
	
	return menu


def bell_stop(source):
	"""Stop music from the bell cron."""

	os.system("killall -9 ffplay")
	
def quit(source):
	Notify.uninit()
	Gtk.main_quit()


if __name__ == "__main__":
	signal.signal(signal.SIGINT, signal.SIG_DFL)
	main()
