#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import pygtk
pygtk.require( "2.0" )
import gtk

class Sample( gtk.Window ):

	# More code here

	def __init__( self ):
		# Create main window
		gtk.Window.__init__( self )
		self.set_border_width( 10 )

		# Connect delete event signal - this is where we'll show our
		# quit conformation dialog.
		self.connect( 'delete-event', self.cb_delete_event )

		# Connect destroy signal, which will be emitted if we return
		# False from our self.cb_delete_event method. */
		self.connect( 'destroy', lambda *w: gtk.main_quit() )

		# Create button ...
		button = gtk.Button( None, gtk.STOCK_ABOUT )

		# ... and connect clicked signal to handler that will create
		# and show about dialog.
		button.connect( 'clicked', self.cb_show_about )
		self.add( button )

		# Add "placeholders" for dialogs
		self.about_dialog = None
		self.quit_dialog  = None

	def cb_delete_event( self, window, event ):
		# If dialog does not exists, create it
		if self.quit_dialog == None:
		# Create dialog
			self.quit_dialog = gtk.Dialog()

		# Set it modal and transient for main window.
		self.quit_dialog.set_modal( True )
		self.quit_dialog.set_transient_for( self )

		# Set title
		self.quit_dialog.set_title( 'Conformation' )

		# Add buttons.
		self.quit_dialog.add_button( gtk.STOCK_YES, 1 )
		self.quit_dialog.add_button( gtk.STOCK_NO,  2 )

		# Using non-null parameter list when creating dialog,
		# the last six calls can be written as:
		# self.quit_dialog = gtk.Dialog( 'Conformation', self,
		#                                gtk.DIALOG_MODAL,
		#                                ( gtk.STOCK_YES, 1,
		#                                  gtk.STOCK_NO,  2 ) )

		# Create label
		label = gtk.Label( 'Are you sure you want to quit?' )

		# Pack label, taking API change in account
		if gtk.pygtk_version[1] < 14:
			self.quit_dialog.vbox.pack_start( label )
		else:
			self.quit_dialog.get_content_area().pack_start( label )

		# Show dialog
		self.quit_dialog.show_all()

		# Run dialog
		response = self.quit_dialog.run()
		self.quit_dialog.hide()

		return response != 1

	def cb_show_about( self, button ):
		if self.about_dialog == None:
			# Create about dialog
			self.about_dialog = gtk.AboutDialog()
			self.about_dialog.set_transient_for( self )

			# Set dialog's properties
			self.about_dialog.set_program_name( "Sample Dialog App" )
			self.about_dialog.set_version( "0.1" )
			self.about_dialog.set_copyright( u"Copyright 2009 © Tadej Borovšak" )
			self.about_dialog.set_website( "http://tadeboro.blogspot.com" )
			self.about_dialog.set_authors(
			[ "Tadej Borovšak <tadeboro@gmail.com>" ] )

			# Show dialog
			self.about_dialog.show_all()

		# Run dialog
		self.about_dialog.run()
		self.about_dialog.hide()

		# Convenience method for creating about dialog is wrapped,
		# but unfortunatelly I don't know how to use it.
		# API reference for PyGTK says nothing about gtk.show_about_dialog
		# Sorry for the inconveniance, Python coders.

if __name__ == "__main__":
	win = Sample()
	win.show_all()
	gtk.main()
