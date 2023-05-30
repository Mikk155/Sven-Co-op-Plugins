# Sven-Co-op-Plugins

- [English](#english)
- [Español](#español)

# Español

Este repositorio contiene Plugins de Sven Co-op, Toque el nombre del que le interesa para ver mas información.

<details><summary>Instalar</summary>
<p>

- 1 Ve a la pagina principal de este [repositorio]([https://github.com/Mikk155/Sven-Co-op](https://github.com/Mikk155/Sven-Co-op-Plugins))
- 2 Toca el boton verde que dice ``<> Code``
- 3 Descarga en ``ZIP``
- 4 Ve a tu directorio de Sven Co-op en Steam
- 5 Ve a svencoop o svencoop_addon
- 6 Ve a ``scripts/plugins/`` y pega el ``Sven-Co-op-Plugins-main.zip`` ahi
- 7 Segundo click -> Extraer aqui
- 8 Renombra la carpeta ``Sven-Co-op-Plugins-main`` a ``mikk``
```
	📁svencoop
	└── 📁scripts
	  └── 📁plugins
	    └── 📁mikk
```
- 9 ve a ``svencoop/default_plugins.txt`` y abrelo con cualquier editor de texto

- 10 Agrega el script de la siguiente forma
```angelscript
  "plugin"
  {
    "name" "Nombre del archivo"
    "script" "mikk/Nombre del archivo"
  }
  ```

</p>
</details>

<details><summary>dynamic_hostname</summary>
<p>

  dynamic_hostname es un plugin que cambia dinamicamente el nombre de tu servidor dependiente de el mapa que se este jugando.
  
  Abra el archivo dynamic_hostname.as y modifique la linea 1 (iszConfigFile) cambielo a una ruta de su preferencia.
  
  cree un archivo de texto en la ruta que haya elegido y editelo de tal forma como se muestra en el ejemplo.
  
  Un simple espacio define que e lado izquierdo es el nombre del mapa actual y el lado derecho es el titulo a mostrar.

</p>
</details>

<details><summary>no_autopickup</summary>
<p>

  no_autopickup es un plugin que modifica los items en el momento en que un jugador quiere tomarlos, haciendo que estos deban presionar USE (e) para tomarlos.
  
</p>
</details>

# English

This repository contains Plugins for Sven Co-op, hit the name of the one of your interest to see more information.

<details><summary>Install</summary>
<p>

- 1 Go to the main page of this [repository]([https://github.com/Mikk155/Sven-Co-op](https://github.com/Mikk155/Sven-Co-op-Plugins))
- 2 Hit the green button that says ``<> Code``
- 3 Download the ``ZIP`
- 4 Go to your Sven Co-op directory in Steam
- 5 Go to svencoop or svencoop_addon
- 6 Go to ``scripts/plugins/`` then paste the ``Sven-Co-op-Plugins-main.zip`` there
- 7 Right click -> Extract here
- 8 Rename the folder ``Sven-Co-op-Plugins-main`` to ``mikk``
```
	📁svencoop
	└── 📁scripts
	  └── 📁plugins
	    └── 📁mikk
```
- 9 Go to ``svencoop/default_plugins.txt`` and open it with any text editor

- 10 Add the script as it is shown here
```angelscript
  "plugin"
  {
    "name" "Name of the file"
    "script" "mikk/Name of the file"
  }
  ```

</p>
</details>

<details><summary>dynamic_hostname</summary>
<p>

  dynamic_hostname is a plugin that changes dynamicaly the name of your server depending the map that is playing.
  
  Open the dynamic_hostname.as and modify the line 1 (iszConfigFile) change it for a path of your preference.

  Create a text file in the path set and edit it as it is shown in the example.
  
  A simple space defines the left side as the name of the current map and the right side as the title to show.

</p>
</details>

<details><summary>no_autopickup</summary>
<p>

  no_autopickup is a plugin that modify the items at the moment a player wants to pick up them, forcing them to press the USE (e) key to pick up.
  
</p>
</details>
