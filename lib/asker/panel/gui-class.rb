# frozen_string_literal: true
require "libui"

module Asker
  module Panel
    class GUI
      def initialize
        @ui = LibUI
        @ui.init
        @filepath = ""
      end

      def build
        @main_window = @ui.new_window('Procesador de Archivos Ruby', 600, 400, 1)

        # Contenedor vertical principal
        vbox = @ui.new_vertical_box
        @ui.box_set_padded(vbox, 1)
        @ui.window_set_child(@main_window, vbox)

        btn_open = @ui.new_button('Seleccionar Archivo')
        # Área de texto (Multilínea): Usamos un Non-Wrapping Multiline Entry para el contenido
        text_area = @ui.new_non_wrapping_multiline_entry
        @ui.multiline_entry_set_read_only(text_area, 0)

        btn_execute = @ui.new_button('Ejecutar Acción (Contar Palabras)')
        btn_exit = @ui.new_button('Cerrar Programa')

        # --- LÓGICA DE LOS BOTONES ---
        # Acción: Abrir archivo
        @ui.button_on_clicked(btn_open) do
          path = @ui.open_file(@main_window)
          if path
            @filepath = path.to_s
            puts "==> DEBUG: #{@filepath}"
            content = File.read(@filepath)
            @ui.multiline_entry_set_text(text_area, content)
            puts "Archivo cargado: #{@filepath}"
          end
        end
        # Acción: Ejecutar tarea sobre el archivo
        @ui.button_on_clicked(btn_execute) do
          if @filepath.empty?
            @ui.msg_box(@main_window, "Error", "Por favor, selecciona un archivo primero.")
          else
            content = @ui.multiline_entry_text(text_area).to_s
            number = content.split.size
            @ui.msg_box(@main_window, "Resultado", "El archivo tiene #{number} palabras.")
          end
        end

        # Acción: Salir
        @ui.button_on_clicked(btn_salir) do
          @ui.control_destroy(@main_window)
          @ui.quit
          0
        end

        # --- ORGANIZAR EN LA VENTANA ---
        @ui.box_append(vbox, btn_abrir, 0)
        @ui.box_append(vbox, text_area, 1) # El 1 hace que este componente se expanda
        @ui.box_append(vbox, btn_ejecutar, 0)
        @ui.box_append(vbox, btn_salir, 0)

        # Evento para cerrar la ventana desde la 'X'
        @ui.window_on_closing(@main_window) do
          @ui.control_destroy(@main_window)
          @ui.quit
          0
        end
      end

      def run
        @ui.control_show(@main_window)
        @ui.main
        @ui.uninit
      end
    end
  end
end