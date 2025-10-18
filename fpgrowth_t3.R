
# Librerías
library(readxl)
library(dplyr)
library(fim4r)

# -----------------------------
# Leer dataset
data <- read_excel("C:\\Users\\Oswaldo\\Downloads\\base-de-datos-violencia-intrafamiliar-ano-2024_v3.xlsx")


# Subdataset 1: Variables victima
data_victima <- data %>%
  select(HEC_MES, VIC_SEXO, VIC_EDAD, VIC_ESCOLARIDAD, VIC_EST_CIV, VIC_REL_AGR, TOTAL_HIJOS) %>%
  filter(
    VIC_EDAD != 99,
    VIC_ESCOLARIDAD != 99,
    VIC_EST_CIV != 99,
    VIC_REL_AGR != 99,
    TOTAL_HIJOS != 99
  ) %>%
  mutate(across(everything(), as.factor))

cat("Número de registros:", nrow(data_victima), "\n\n")


# Subdataset 2: Variables agresor
data_agresor <- data %>%
  select(HEC_MES, AGR_SEXO, AGR_EDAD, AGR_ESCOLARIDAD, AGR_EST_CIV, AGR_OCUP) %>%
  filter(
    AGR_EDAD != 99,
    AGR_ESCOLARIDAD != 99,
    AGR_EST_CIV != 99,
    AGR_OCUP != 99
  ) %>%
  mutate(across(everything(), as.factor))

cat("Número de registros:", nrow(data_agresor), "\n\n")

# Subdataset 3: Geografia y Medidas aplicadas

data_geo <- data %>%
  select(
    HEC_DEPTO, HEC_DEPTOMCPIO, HEC_AREA, HEC_TIPAGRE,
    HEC_RECUR_DENUN, INST_DONDE_DENUNCIO, MEDIDAS_SEGURIDAD, TIPO_MEDIDA
  ) %>%
  filter(
    HEC_DEPTO != 99,
    HEC_DEPTOMCPIO != 99,
    HEC_AREA != 99,
    HEC_TIPAGRE != 99,
    HEC_RECUR_DENUN != 99,
    MEDIDAS_SEGURIDAD != 99,
    TIPO_MEDIDA != 99
  ) %>%
  mutate(across(everything(), as.factor))

cat("Número de registros:", nrow(data_geo), "\n\n")

# Subdataset 4: Tipo de agresion
data_agresion <- data %>%
  select(
    HEC_TIPAGRE,     # Tipo de agresión
    VIC_EDAD,        # Edad de la víctima
    AGR_EDAD,        # Edad del agresor
    VIC_REL_AGR,     # Relación víctima-agresor
    VIC_SEXO,        # Sexo de la víctima
    AGR_SEXO         # Sexo del agresor
  ) %>%
 
  filter(
    HEC_TIPAGRE != 99,
    VIC_EDAD != 99,
    AGR_EDAD != 99,
    VIC_REL_AGR != 99,
    VIC_SEXO != 99,
    AGR_SEXO != 99
  ) %>%

  mutate(across(everything(), as.factor))


cat("Número de registros:", nrow(data_agresion), "\n\n")



# Aplicar FP GROWTH a cada dataset

# Subdataset víctima
reglas_victima <- fim4r(data_victima, method = "fpgrowth", target = "rules", supp = 0.2, conf = 0.5)
rf_victima <- as(reglas_victima, "data.frame")

# Subdataset agresor
reglas_agresor <- fim4r(data_agresor, method = "fpgrowth", target = "rules", supp = 0.2, conf = 0.5)
rf_agresor <- as(reglas_agresor, "data.frame")

# Subdataset geográfico/medidas
reglas_geo <- fim4r(data_geo, method = "fpgrowth", target = "rules", supp = 0.2, conf = 0.5)
rf_geo <- as(reglas_geo, "data.frame")

#Subdataset tipo de agresion

reglas_agresion <- fim4r(data_agresion, method = "fpgrowth", target = "rules", supp = 0.2, conf = 0.5)
rf_agresion <- as(reglas_agresion, "data.frame")