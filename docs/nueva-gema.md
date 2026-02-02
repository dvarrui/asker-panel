
# Empezando una gema nueva - asker-panel

Vamos a empezar una nueva gema de cero, muy sencilla. Sólo será wrapper frontend gui para `asker` que es un cli.

## Preparando la estructura de la gema

Para empezar de cero se hace lo siguiente:
1. Creo repo en github `github.com/dvarrui/asker-panel`. 
2. `cd asker-panel`
3. `bundle gem asker-panel`, para crear la estructura inicial de la gema.
4. Ahora sobre este esquema empzamos a crear el código.
5. Empezamos personalizando el ficher `asker-panel.gemspec`.
    * Incluimos como dependecia la gema `libui` para crear ventanas de entorno gráfico.
6. `bundle install`, para instalar las gemas del proyecto.

## Probando ejemplos de LibUI

* **[Ejemplo 1](./example/01-libui.rb):** Una ventana con un cuadro de texto (Entry), una etiqueta (Label) y dos botones.

* **[Ejemplo 2](./example/02-libui.rb):** Selecciona un fichero, lo carga y puedes contar sus palabras.

