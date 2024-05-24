# Usa una imagen de Python como base
FROM python:3.8

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el archivo actual al contenedor en /app
COPY ./app.py /app/

# Instala las dependencias necesarias
RUN pip install flask

# Expone el puerto 5000
EXPOSE 5000

# Comando para ejecutar la aplicación cuando se inicia el contenedor
CMD ["python", "app.py"]
