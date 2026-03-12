# Windows-Easy-Cleaner 🧹

[![Batch](https://img.shields.io/badge/Batch-FDCB6E?style=flat&logo=windows&logoColor=white)](https://en.wikipedia.org/wiki/Batch_file)  
![Windows](https://img.shields.io/badge/OS-Windows-0078D6?style=flat&logo=windows&logoColor=white)  
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

Windows-Easy-Cleaner es un aplicativo sencillo para limpiar archivos temporales en Windows de manera rápida y segura, compatible con `%temp%`, `%windir%\Temp` y `CleanMgr`.

---

## ✨ Características

- Limpieza de %temp% y %windir%\Temp  
- Ejecución de CleanMgr con la configuración /sagerun:1  
- Elevación automática a administrador si es necesario  
- Interfaz tipo menú simple y clara  
- Compatible con Windows 7, 8, 10 y 11

---

## 🚀 Cómo usar

### Opción 1: Usuarios que saben usar Git

1. Cloná el repositorio con
```bash
git clone https://github.com/demateopablo/Windows-Easy-Cleaner.git
```
3. Entrá a la carpeta del proyecto con 
```bash
cd Windows-Easy-Cleaner
```
4. Ejecutá el archivo `Limpia Temporales.bat` como administrador

### Opción 2: Usuarios que no usan Git

1. Ingresá al archivo Limpia Temporales.bat en GitHub en [Limpia Temporales.bat](https://github.com/demateopablo/Windows-Easy-Cleaner/blob/main/Limpia%20Temporales.bat)  
2. Presioná Ctrl + Shift + S o hacé clic en el menú ... y luego en Download  
3. Opcional: también podés descargar el ícono en [icono.ico](https://github.com/demateopablo/Windows-Easy-Cleaner/blob/main/icono.ico) y asignarlo a un acceso directo para tenerlo más visual en el escritorio  
4. Ejecutá Limpia Temporales.bat como administrador

---

## ⚙️ Requisitos

- Windows 7 o superior  
- Permisos de administrador para ciertas operaciones  
- Batch scripting soportado (cmd.exe)  

---

## 💡 Notas

- Algunos archivos en uso no se podrán borrar automáticamente  
- CleanMgr debe estar configurado previamente con /sageset:1 para usar /sagerun:1  
- El script eleva permisos automáticamente usando PowerShell si no se ejecuta como administrador

---

## 📄 Licencia

Este proyecto está bajo la licencia [MIT](https://github.com/demateopablo/Windows-Easy-Cleaner/blob/main/LICENSE).

---

## 👨‍💻 Autor

Pablo Demateo
