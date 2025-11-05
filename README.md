## **Prueba automatizada de la aplicación movil de Mercado Libre**

Prueba automatizada del flujo principal de búsqueda en la app Mercado Libre (Android) utilizando Appium y Ruby

***

### **Requisitos:**

***

#### **Ruby 3.x**


**Instalacion (Windows):** 

1. Descargar el instalador desde https://rubyinstaller.org/
2. Durante la instalación, marcar la opción “Add Ruby executables to your PATH”.
3. Verificar la instalación con:
```
   ruby -v
   gem -v
```

#### **Appium server y UiAutomator2 driver**

#### **Instalacion de Appium**

Ir a la carpeta del proyecto y ejecutar el siguiente comando:
```
npm i --location=global appium
```
El comando anterior instalara appium de manera global y se podra acceder a el desde la linea de comandos mediante la siguiente instruccion:
```
appium
```
Y se deberia obtener una salida como la siguiente:
```
[Appium] Welcome to Appium v2.0.0
```
#### **Instalacion de UiAutomator2:**

Antes de instalar el driver se tendra que configurar el entorno para trabajar con android, esto inlcuye:

1. Descargar el SDK de android, se recomienda como opcion utilizar Android Studio para realizar la configuracion el SDK de manera mas facil
2. Configurar las variables de entorno de manera que apunten hacia el directorio en donde estan instaladas las dependencias de android SDK manager. Se require que la variable de entorno se llame ANDROID_HOME
3. Instalar el JDK 9 de Java (recomendado para las ultimas versiones de Android) y configurar las variables de entorno que apunten hacia el directorio del JDK
4. Utilizar Android Studio para crear un dispositivo virtual

#### **Descarga y configuracion del driver**

Ejecutando la siguiente linea se puede intalar facilmente el driver:

```
appium driver install uiautomator2
```

## **Clonar y ejecutar este repositorio**

Para clonar este repositorio solo sera necesario pegar la siguiente linea en la consola:

```
git clone https://github.com/luherto/mercado-libre-android-framework.git
```

Posteriormente entrar al directorio creado:

```
cd mercado-libre-android-framework
```
Y ejecutar
```
bundle install
```
Para instalar automaticamente las gemas necesarias del proyecto

Posteriormente se requerira lanzar un dispositivo con Android Studio e iniciar desde consola el servidor de Appium con:

```
appium
```

Finalmente ejecutar las pruebas con el siguiente comando

```
ruby spec/tests/mercado_libre_test.rb
```

## **Mejoras futuras**

- Generar un reporte de Allure con capturas especificas de cada paso

- Incluir soporte iOS con capabilities específicas.
