require 'gtk2'
#require 'gs_gtk2_util.rb'  # binding some gtk2 stuf >> green-shoes

module Gtk
  class SysTray < StatusIcon 
    def initialize(window,title="title?",config)
#      $statusIcon=self
      @bshow=[]
      @popup_tray=Menu.new
      file= config[:icon] && File.exist?(config[:icon]) ? config[:icon] : nil

      config.each do |label,proc|
        if Proc === proc
          @bshow << CheckMenuItem.new(label)
          @bshow.last.signal_connect("toggled") { proc.call(window.visible?) }  
          @popup_tray.append(@bshow.last) 
        end
      end

      if config[:quit]
        @bquit_tray = ImageMenuItem.new(Stock::QUIT)
        @bquit_tray.signal_connect("activate"){ window.main_quit }
        @popup_tray.append(SeparatorMenuItem.new)
        @popup_tray.append(@bquit_tray)
      end

      @popup_tray.show_all

      super()
      self.pixbuf  = Gdk::Pixbuf.new(file) if file
      self.tooltip = title || ""
      self.signal_connect('activate'){ window.visible? ? window.hide : window.show }
      self.signal_connect('popup-menu'){|tray, button, time| @popup_tray.popup(nil, nil, button, time) }
    end
  end
end

class Shoes
  class App
    def systray config
      @systray = ::Gtk::SysTray.new(
        self.win, @owner.instance_variable_get('@title'), config
      )
    end 
  end
end
