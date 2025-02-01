# Prueba Técnica iOS - Lista de Usuarios

## Descripción
Esta aplicación iOS muestra una lista de usuarios obtenidos desde una API pública (JSONPlaceholder). Permite filtrar los usuarios mediante una barra de búsqueda y navegar a una pantalla de detalles al seleccionar un usuario.

## Tecnologías utilizadas
- Swift
- UIKit
- URLSession para consumo de API
- XCTest y XCTestUI para pruebas
- SDWebImage: Una librería externa para carga de imágenes

## Instalación
1. Clonar el repositorio:
   ```sh
   git clone https://github.com/usuario/PruebaTecASD.git
   ```
2. Navegar al directorio del proyecto:
   ```sh
   cd PruebaTecASD
   ```
3. Instalar dependencias con CocoaPods:
   ```sh
   pod install
   ```
4. Abrir el proyecto en Xcode:
   ```sh
   open PruebaTecASD.xcworkspace
   ```

## Uso
1. Ejecutar la aplicación en un simulador o dispositivo.
2. Ver la lista de usuarios obtenida desde la API.
3. Usar la barra de búsqueda para filtrar usuarios por nombre.
4. Seleccionar un usuario para ver su información detallada.

## API Utilizada
Se consume la API pública de [JSONPlaceholder](https://jsonplaceholder.typicode.com/users) para obtener la lista de usuarios.

Además, para la imagen del usuario se utiliza el servicio de [UI-Avatars](https://ui-avatars.com/), que permite generar un avatar dinámico a partir del nombre del usuario.

## Pruebas
### Pruebas unitarias
Ubicadas en `PruebaTecASDTests`. Se validan:
- Consumo de la API y transformación de datos.
- Funcionalidad de filtrado de usuarios.

### Pruebas de UI
Ubicadas en `PruebaTecASDUITests`. Se verifican:
- Que la lista de usuarios se muestre correctamente.
- Que la navegación entre la lista y la pantalla de detalles funcione.

Para ejecutar las pruebas:
```sh
Cmd + U
```

## Solución de Problemas
### Error: `Sandbox: rsync.samba (13105) deny(1) file-write-create`
Verificar que la llave ENABLE_USER_SCRIPT_SANDBOXING tenga el valor 'No' en los Build Settings


### Error: `Failed to terminate com.asd.PruebaTecASD`
Soluciones posibles:
- Cerrar la app manualmente en el simulador.
- Reiniciar el simulador (`Cmd + Shift + 2`, seleccionar dispositivo, presionar "Restart").
- Limpiar Derived Data:
  ```sh
  rm -rf ~/Library/Developer/Xcode/DerivedData
  ```
- Cerrar procesos atascados:
  ```sh
  killall Simulator
  killall com.apple.CoreSimulator.CoreSimulatorService
  ```

## Licencia
Este proyecto es de uso libre para fines educativos y de prueba técnica.

