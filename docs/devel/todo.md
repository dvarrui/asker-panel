
# Roadmap v1.0.0 (2026)

**Entorno gráfico GUI**: gema asker-panel como front-end gráfico para asker

Aspecto:

```text
* Botón "seleccionar": para elegir el archivo a cargar (FILEPATH).
* Etiqueta para mostrar "FILEPATH" del fichero cargado.
* Caja de texto para mostrar el contenido del fichero.
* Botón "ejecutar": para ejecutar `asker FILEPATH`.
* Botón "check": para ejecutar `asker check FILEPATH`.

---

* Textfield: FILENAME
* Botón "new": para ejecutar `asker new FILENAME`
* Botón "config": para consultar la configuración actual.
```

Funcionalidades:

- cargar fichero input(xml, haml)
- ejecutar `asker` sobre el fichero input(xml, haml)
- mostrar resultado del check del input(xml, haml)
- mostrar los resultados de la ejecución
- Quizás editar el contenido del input en la ventana gráfica

> INFO: gema [asker](https://github.com/teuton-software/asker)