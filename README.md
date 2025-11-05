## **Prueba automatizada de la aplicación móvil de Mercado Libre**

Prueba automatizada del flujo principal de búsqueda en la app Mercado Libre (Android) utilizando Appium y Ruby

***

### **Requisitos:**

***

#### **Ruby 3.x**


**Instalación (Windows):** 

1. Descargar el instalador desde https://rubyinstaller.org/
2. Durante la instalación, marcar la opción “Add Ruby executables to your PATH”.
3. Verificar la instalación con:
```
   ruby -v
   gem -v
```

#### **Appium server y UiAutomator2 driver**

#### **Instalación de Appium**

Ir a la carpeta del proyecto y ejecutar el siguiente comando:
```
npm i --location=global appium
```
El comando anterior instalará Appium de manera global y se podrá acceder a él desde la línea de comandos mediante la siguiente instrucción:
```
appium
```
Y se debería obtener una salida como la siguiente:
```
[Appium] Welcome to Appium v2.0.0
```
#### **Instalación de UiAutomator2:**

Antes de instalar el driver se tendrá que configurar el entorno para trabajar con Android, esto incluye:

1. Descargar el SDK de Android, se recomienda como opción utilizar Android Studio para realizar la configuración el SDK de manera más fácil
2. Configurar las variables de entorno de manera que apunten hacia el directorio en donde están instaladas las dependencias de Android SDK manager. Sé require que la variable de entorno se llame ANDROID_HOME
3. Instalar el JDK 9 de Java (recomendado para las últimas versiones de Android) y configurar las variables de entorno que apunten hacia el directorio del JDK
4. Utilizar Android Studio para crear un dispositivo virtual

#### **Descarga y configuración del driver**

Ejecutando la siguiente línea se puede instalar fácilmente el driver:

```
appium driver install uiautomator2
```

###Importante: sobre el entorno de ejecución de las pruebas

Las pruebas fueron ejecutadas en un entorno bajo la siguiente configuracion:

| Componente                     | Detalle                                    |
| ------------------------------ | ------------------------------------------ |
| **Dispositivo**                | Emulador Android – *Medium Phone (API 36)* |
| **Versión de Android**         | 14 (API Level 36)                          |
| **Resolución de pantalla**     | 1080 × 2400 píxeles                        |
| **Densidad de pantalla (dpi)** | 420                                        |
| **Memoria RAM**                | 2 GB                                       |
| **CPU asignado**               | 8 núcleos                                  |
| **Orientación**                | Vertical (portrait)                        |
| **Play Store**                 | Habilitado                                 |
| **Mercado libre**              | Instalado desde Play Store                 |

Los gestos de desplazamiento (scroll) y la detección de elementos se ajustaron específicamente para esta resolución y versión de Android. En pantallas con diferentes dimensiones o densidades, podrían requerirse pequeños ajustes en los parámetros de scroll o tiempos de espera.

## **Clonar y ejecutar este repositorio**

Para clonar este repositorio solo será necesario pegar la siguiente línea en la consola:

```
git clone https://github.com/luherto/mercado-libre-android-framework.git
```

Posteriormente, entrar al directorio creado:

```
cd mercado-libre-android-framework
```
Y ejecutar
```
bundle install
```
Para instalar automáticamente las gemas necesarias del proyecto

Posteriormente, se requerirá lanzar un dispositivo desde Android Studio (preferentemente con las caracteristicas previamente mencionadas) e iniciar desde consola el servidor de Appium con:

```
appium
```

Finalmente, ejecutar las pruebas con el siguiente comando

```
ruby spec/tests/mercado_libre_test.rb
```

## **Mejoras futuras**

- Generar un reporte de Allure con capturas específicas de cada paso

- Incluir soporte iOS
