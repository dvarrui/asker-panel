#!/usr/bin/env ruby
require "libui"
require "debug"

UI = LibUI

# Inicializar la interfaz
UI.init

# Ventana principal
main_window = UI.new_window('Procesador de Archivos Ruby', 600, 400, 1)

# Contenedor vertical principal
vbox = UI.new_vertical_box
UI.box_set_padded(vbox, 1)
UI.window_set_child(main_window, vbox)

# Variable para guardar la ruta del archivo
@archivo_ruta = ""

# --- COMPONENTES ---

# 1. Botón para abrir explorador de archivos
btn_abrir = UI.new_button('Seleccionar Archivo')

# 2. Área de texto (Multilínea)
# Usamos un Non-Wrapping Multiline Entry para el contenido
text_area = UI.new_non_wrapping_multiline_entry
UI.multiline_entry_set_read_only(text_area, 0)

# 3. Botón para ejecutar acción (Contar palabras en este ejemplo)
btn_ejecutar = UI.new_button('Ejecutar Acción (Contar Palabras)')

# 4. Botón para salir
btn_salir = UI.new_button('Cerrar Programa')

# --- LÓGICA DE LOS BOTONES ---

# Acción: Abrir archivo
UI.button_on_clicked(btn_abrir) do
  path = UI.open_file(main_window)
  if path
    @archivo_ruta = path.to_s
    puts "DEBUG: #{@archivo_ruta}"
    content = File.read(@archivo_ruta)
    UI.multiline_entry_set_text(text_area, content)
    puts "Archivo cargado: #{@archivo_ruta}"
  end
end

# Acción: Ejecutar tarea sobre el archivo
UI.button_on_clicked(btn_ejecutar) do
  if @archivo_ruta.empty?
    UI.msg_box(main_window, "Error", "Por favor, selecciona un archivo primero.")
  else
    contenido = UI.multiline_entry_text(text_area).to_s
    conteo = contenido.split.size
    UI.msg_box(main_window, "Resultado", "El archivo tiene #{conteo} palabras.")
  end
end

# Acción: Salir
UI.button_on_clicked(btn_salir) do
  UI.control_destroy(main_window)
  UI.quit
  0
end

# --- ORGANIZAR EN LA VENTANA ---
UI.box_append(vbox, btn_abrir, 0)
UI.box_append(vbox, text_area, 1) # El 1 hace que este componente se expanda
UI.box_append(vbox, btn_ejecutar, 0)
UI.box_append(vbox, btn_salir, 0)

# Evento para cerrar la ventana desde la 'X'
UI.window_on_closing(main_window) do
  UI.control_destroy(main_window)
  UI.quit
  0
end

# Mostrar y ejecutar
UI.control_show(main_window)
UI.main
UI.uninit
