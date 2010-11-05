require 'rubygems'
require 'java'
require 'profligacy/swing'

import 'javax.swing.JFrame'
import 'javax.swing.JLabel'

class SwingDemo
  def initialize
    frm = JFrame.new "A Simple Demo"
    frm.setSize 275, 100
    frm.default_close_operation = JFrame::EXIT_ON_CLOSE

    lab = JLabel.new " Swing powers the moder Java GUI"
    frm.add lab
    frm.pack
    frm.visible = true
  end
end

invoker = proc { SwingDemo.new }.to_runnable
SwingUtilities.invoke_later &invoker
