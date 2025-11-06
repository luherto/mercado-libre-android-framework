## **Prueba automatizada de la aplicación móvil de Mercado Libre**

1. [Descripción general](#prueba-automatizada-de-la-aplicación-móvil-de-mercado-libre)
2. [Requisitos](#requisitos)
   - [Instalación de Ruby](#ruby-3x)
   - [Instalación de Appium y UiAutomator2](#appium-server-y-uiautomator2-driver)
3. [Entorno de ejecución de las pruebas](#importante-sobre-el-entorno-de-ejecución-de-las-pruebas)
4. [Clonar y ejecutar este repositorio](#clonar-y-ejecutar-este-repositorio)
5. [Estructura del proyecto](#estructura-del-proyecto)
6. [Ejecución de pruebas y reporte Allure](#ejecución-de-pruebas-y-reporte-allure)
7. [Mejoras futuras](#mejoras-futuras)

Prueba automatizada del flujo principal de búsqueda en la app Mercado Libre (Android) utilizando Appium y Ruby

---

### **Requisitos:**

---

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

## **Importante: sobre el entorno de ejecución de las pruebas**

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
El repositorio sigue una estructura modular basada en el patrón Page Object Model (POM):

```
📦 mercado-libre-android-framework
 ┣ 📂 Output
 ┃ ┣📂 allure-results            #Reporte de allure para servir
 ┃ ┣📂 screeenshots              #Capturas de pantalla de las pruebas realizadas
 ┣ 📂 spec
 ┃ ┣ 📂 helpers
 ┃ ┃ ┣ 📜 driver_setup.rb        # Configuración del driver Appium y capacidades
 ┃ ┃ ┗ 📜 base_page.rb           # Clase base con métodos reutilizables (scroll, waits, etc.)
 ┃ ┣ 📂 pages
 ┃ ┃ ┣ 📜 home_page.rb           # Acciones e interacciones de la pantalla principal
 ┃ ┃ ┗ 📜 result_page.rb         # Métodos para listar y capturar resultados de búsqueda
 ┃ ┗ 📂 tests
 ┃    ┗ 📜 mercado_libre_spec.rb # Flujo principal de la prueba automatizada
 ┣ 📜 Gemfile                    # Dependencias del proyecto (Appium, TestUnit, etc.)
 ┣ 📜 README.md                  # Documentación y guía de ejecución
 ┗ 📜 .gitignore                 # Exclusión de archivos no necesarios para el repositorio

```
Cada componente cumple una función específica:

helpers/ → Configuración del entorno y utilidades generales.

pages/ → Definición de las pantallas de la aplicación y sus acciones (POM).

tests/ → Implementación del flujo de prueba automatizado.

Para entrar al repositorio clonado se debera de ejecutar el siguiente comando:

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

## **Ejecutar las pruebas** 

---

Finalmente, ejecutar las pruebas con el siguiente comando

```
rspec spec
```

Y generar el reporte de allure
```
allure serve output/allure-results
```

El cual se abrira automaticamente en el navegador despues de ser servido 

## **Mejoras futuras**

- Incluir soporte iOS
