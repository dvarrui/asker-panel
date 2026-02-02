#!/usr/bin/env ruby
require "libui"

UI = LibUI
UI.init

main_window = UI.new_window("Hola Ruby", 300, 200, 1)
vbox = UI.new_vertical_box
UI.window_set_child(main_window, vbox)

entry = UI.new_entry
UI.box_append(vbox, entry, 0)

button = UI.new_button("Ejecutar")
UI.button_on_clicked(button) do
  puts "Archivo seleccionado: #{UI.entry_text(entry)}"
end
UI.box_append(vbox, button, 0)

UI.window_on_closing(main_window) {
  UI.quit
  1
}
UI.control_show(main_window)
UI.main
