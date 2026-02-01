
# asker-panel

Vamos a crear una gema de Ruby con una aplicación gráfica muy sencilla que usaremos a modo de "front-end" para la herramienta `asker`.

Tk es el estándar "clásico" para interfaces gráficas en Ruby. Aunque no es la librería más moderna visualmente, es increíblemente ligera y suele venir preinstalada en algunos sistemas.

* Sin dependencias pesadas: No se necesita instalar motores de videojuegos como Gosu ni librerías pesadas como Qt o GTK.
* Método pack: El comando pack se encarga de acomodar los elementos automáticamente sin tener que pelearse con coordenadas x e y.
* Portabilidad: El mismo código funciona en Windows, Mac y Linux sin cambios.

## Prerrequisitos

En openSUSE, el soporte para Ruby-Tk no suele venir instalado por defecto con el intérprete básico de Ruby. Hay que instalar el paquete que actúa como puente entre Ruby y las librerías de sistema de Tcl/Tk.

* `sudo zypper install ruby-tcltk`

Este paquete instala los binarios necesarios (tcltklib.so) y las interfaces de Ruby para que el código que escribimos anteriormente funcione.

* `gem list | grep tk`, comprobamos si la librería está instalada. En caso contrario seguimos.

**rbenv o rvm**

Si usas un gestor de versiones como rbenv o rvm en lugar del Ruby del sistema, el error de que falta tcltklib.so suele ocurrir porque Ruby se compiló sin las librerías de desarrollo de Tcl/Tk presentes. En ese caso:


Instala las dependencias de desarrollo:
* `sudo zypper install -t pattern devel_ruby devel_basis`
* `sudo zypper install gcc make tcl-devel tk-devel`
gem install tk -- --with-tcl-dir=/usr --with-tk-dir=/usr
gem install tk -- --with-tcl-include=/usr/include --with-tk-include=/usr/include --with-tcllib=tcl8.6 --with-tklib=tk8.6
* Reinstala tu versión de Ruby: Si usas rbenv, por ejemplo: `rbenv install 3.x.x`
* Comprobamos: `ruby -e "require 'tk'; puts 'Ok'"`
ruby -rtk -e 'puts "Librería cargada correctamente"'

Si no recibes ningún mensaje de error y ves el texto de Ok, tu entorno está listo para ejecutar ventanas gráficas.

## Nueva gema

* `bundle gem asker-panel`
* Añadir gema `tk` al fichero `asker-panel.gemspec`
* Comprobamos si está instalada con `gem list | grep tk`.
* Se instala con `bundle install`.

## Ejemplo: "Hola Mundo"

Aquí tienes el código para crear exactamente lo que pediste: una ventana con un cuadro de texto (Entry), una etiqueta (Label) y dos botones.


## Ejemplo 2

* Tk.getOpenFile: Abre la ventana nativa de tu sistema operativo (Windows, Mac o Linux) para buscar un archivo. Devuelve la ruta completa.
* TkText: Es el componente ideal para logs o salidas largas. A diferencia del Entry (que es de una sola línea), este permite saltos de línea.
* TkScrollbar: Fundamental si esperas que el texto de salida crezca más allá del tamaño de la ventana.
* Tk.messageBox: Una forma sencilla de avisar al usuario si olvidó seleccionar el archivo.

---


gem install libui