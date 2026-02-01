require 'tk'

root = TkRoot.new { title "Procesador de Archivos" }
archivo_seleccionado = ""

# --- 1. Label de estado ---
lbl_status = TkLabel.new(root) do
  text "No se ha seleccionado ningún archivo"
  foreground "blue"
  pack { padx 15; pady 5 }
end

# --- 2. Botón para escoger fichero ---
TkButton.new(root) do
  text "Seleccionar Archivo"
  command {
    archivo_seleccionado = Tk.getOpenFile
    lbl_status.text = "Archivo: #{File.basename(archivo_seleccionado)}" if archivo_seleccionado != ""
  }
  pack { pady 5 }
end

# --- 3. Botón para ejecutar tarea ---
TkButton.new(root) do
  text "Ejecutar Tarea"
  command {
    if archivo_seleccionado.empty?
      Tk.messageBox(type: 'ok', icon: 'error', message: '¡Primero selecciona un archivo!')
    else
      # Aquí simulamos la tarea
      @output_text.insert('end', "Procesando: #{archivo_seleccionado}...\n")
      @output_text.insert('end', "Resultado: Tarea completada con éxito.\n")
      @output_text.see('end') # Scroll automático al final
    end
  }
  pack { pady 5 }
end

# --- 4. Cuadro de texto de muchas líneas (Output) ---
# Añadimos un Frame para contener el texto y el scrollbar
frame_texto = TkFrame.new(root).pack(padx: 10, pady: 10)

@output_text = TkText.new(frame_texto) do
  width 40
  height 10
  pack(side: 'left', fill: 'both', expand: true)
end

# Añadimos una barra de desplazamiento (Scrollbar)
scroll = TkScrollbar.new(frame_texto) do
  pack(side: 'right', fill: 'y')
end

@output_text.yscrollbar(scroll)

Tk.mainloop
