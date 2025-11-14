

install.packages("readxl")
install.packages("rpart")
install.packages("rpart.plot")

library(readxl)
library(rpart)
library(rpart.plot)

# Leer el dataset
data <- read_excel("C:\\Users\\Oswaldo\\Downloads\\base-de-datos-violencia-intrafamiliar-ano-2024_v3.xlsx")

# Visualizar columnas disponibles
data.frame(1:ncol(data), colnames(data))


# Seleccion de variable objetivo

arbol_ocup <- rpart(VIC_OCUP ~
                      VIC_SEXO +
                      VIC_EDAD +
                      VIC_TRABAJA + 
                      VIC_DEDICA +
                      VIC_ESCOLARIDAD +
                      HEC_DEPTO +
                      AGR_TRABAJA +
                      AGR_ESCOLARIDAD,
                    data = data, method = "class"
)

rpart.plot(arbol_ocup, type = 2, extra = 0, under = TRUE, fallen.leaves = TRUE,
           box.palette = "BuGn", main = "Predicción de Ocupación de la Víctima", cex = 0.5)



persona <- data.frame(
  VIC_SEXO = c(2),
  VIC_EDAD = c(30),
  VIC_TRABAJA = c(1),
  VIC_DEDICA = c(3),
  VIC_ESCOLARIDAD = c(44),
  HEC_DEPTO = c(3),
  AGR_TRABAJA = c(2),
  AGR_ESCOLARIDAD = c(39)
)

resultado <- predict(arbol_ocup, persona, type = "prob")
resultado


# clase final
clase_predicha <- colnames(resultado)[which.max(resultado)]
clase_predicha

