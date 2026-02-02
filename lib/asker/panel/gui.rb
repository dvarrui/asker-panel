# frozen_string_literal: true

require "libui"

def build
  @main_window = UI.new_window("Procesador de Archivos Ruby", 600, 400, 1)

  # Contenedor vertical principal
  vbox = UI.new_vertical_box
  UI.box_set_padded(vbox, 1)
  UI.window_set_child(@main_window, vbox)

  btn_open = UI.new_button("Seleccionar Archivo")
  # Área de texto (Multilínea): Usamos un Non-Wrapping Multiline Entry para el contenido
  text_area = UI.new_non_wrapping_multiline_entry
  UI.multiline_entry_set_read_only(text_area, 0)
  btn_execute = UI.new_button("Ejecutar Acción (Contar Palabras)")
  btn_exit = UI.new_button("Cerrar Programa")

  # --- LÓGICA DE LOS BOTONES ---
  # Acción: Abrir archivo
  UI.button_on_clicked(btn_open) do
    path = UI.open_file(@main_window)
    if path
      @filepath = path.to_s
      puts "==> DEBUG: #{@filepath}"
      content = File.read(@filepath)
      UI.multiline_entry_set_text(text_area, content)
      puts "Archivo cargado: #{@filepath}"
    end
  end
  # Acción: Ejecutar tarea sobre el archivo
  UI.button_on_clicked(btn_execute) do
    if @filepath.empty?
      UI.msg_box(@main_window, "Error", "Por favor, selecciona un archivo primero.")
    else
      content = UI.multiline_entry_text(text_area).to_s
      number = content.split.size
      UI.msg_box(@main_window, "Resultado", "El archivo tiene #{number} palabras.")
    end
  end

  # Acción: Salir
  UI.button_on_clicked(btn_exit) do
    UI.control_destroy(@main_window)
    UI.quit
    0
  end

  # --- ORGANIZAR EN LA VENTANA ---
  UI.box_append(vbox, btn_open, 0)
  UI.box_append(vbox, text_area, 1) # El 1 hace que este componente se expanda
  UI.box_append(vbox, btn_execute, 0)
  UI.box_append(vbox, btn_exit, 0)

  # Evento para cerrar la ventana desde la 'X'
  UI.window_on_closing(@main_window) do
    UI.control_destroy(@main_window)
    UI.quit
    0
  end
end

UI = LibUI
UI.init
@filepath = ""
build

UI.control_show(@main_window)
UI.main
UI.uninit
