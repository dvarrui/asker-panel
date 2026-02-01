require 'tk'

# Configuración de la ventana principal
root = TkRoot.new { title "Mi Ventana en Ruby" }

# 1. El Label (Etiqueta)
label = TkLabel.new(root) do
  text "Escribe algo abajo:"
  pack { padx 15 ; pady 10 }
end

# 2. El Cuadro de Texto (Entry)
entrada = TkEntry.new(root) do
  pack { padx 15 ; pady 5 }
end

# 3. Botón 1: Saludar (interactúa con el texto)
btn_saludar = TkButton.new(root) do
  text "Saludar"
  command { 
    contenido = entrada.value
    label.text = "¡Hola, #{contenido}!" 
  }
  pack { side 'left'; padx 10 ; pady 10 }
end

# 4. Botón 2: Salir
btn_salir = TkButton.new(root) do
  text "Salir"
  command { exit }
  pack { side 'right'; padx 10 ; pady 10 }
end

# Iniciar el bucle de la interfaz
Tk.mainloop
