library(dplyr)
library(randomForest)
library(caret)
library(ggplot2)

# Cargar el dataset
df <- read_excel("C:\\Users\\Oswaldo\\Downloads\\base-de-datos-violencia-intrafamiliar-ano-2024_v3.xlsx")


# Seleccion de las columnas relevantes para predecir el tipo de agresión
selected_vars <- c(
  "VIC_SEXO",
  "VIC_EST_CIV",
  "VIC_REL_AGR",
  "AGR_SEXO",
  "AGR_EDAD",
  "HEC_AREA",
  "HEC_TIPAGRE"
)

df <- df %>% select(any_of(selected_vars))

# Definicion de la variable objetivo
target <- "HEC_TIPAGRE"

# Limpieza del dataset
df <- df %>% filter(!is.na(.data[[target]]))

# Conversion de la columna a factor
df[[target]] <- as.factor(df[[target]])


for(col in names(df)){
  if(is.numeric(df[[col]])){
    df[[col]][is.na(df[[col]])] <- median(df[[col]], na.rm = TRUE)
  } else {
    df[[col]][is.na(df[[col]])] <- "Missing"
  }
}

# Datos de entrenamiento y prueba
set.seed(123)
train_index <- createDataPartition(df[[target]], p = 0.7, list = FALSE)
train <- df[train_index, ]
test  <- df[-train_index, ]



bosque <- randomForest(HEC_TIPAGRE ~ VIC_SEXO + VIC_EST_CIV + VIC_REL_AGR +
                         AGR_SEXO + AGR_EDAD + HEC_AREA,
                       data = train,
                       ntree = 1000,
                       mtry = 3
)

# Prediccion
prueba <- predict(bosque, test)

matriz <- table(test$HEC_TIPAGRE, prueba)
matriz


pre <- sum(diag(matriz)) / sum(matriz)
pre

# Grafica del modelo
plot(bosque)

# Prediccion para nuevos datos
dato_nuevo <- data.frame(
  VIC_SEXO = 2, # mujer
  VIC_EST_CIV = 1, # soltera
  VIC_REL_AGR = 1, # Esposo,
  AGR_SEXO =  1,
  AGR_EDAD = 32,
  HEC_AREA = 1 # urbano
)

prediccion <- predict(bosque, dato_nuevo)
prediccion
