# install.packages("arules")
# install.packages("readxl")

library(arules)
library(readxl)

# Carga de datos
ruta <-"C:\\Users\\Oswaldo\\Documents\\Repositories\\data-mining\\datasets\\graduados-superior-2023.xlsx"
datos <- read_excel(ruta)

# Remover la columna AÑO, no contribuye en las reglas de asociación
datos <- subset(datos, select = -c(AÑO))

# Reglas para todo el dataset
rules <- apriori(datos,parameter = list(support = 0.2, confidence = 0.5, minlen = 2))

rules_sorted <- sort(rules, by = "lift", decreasing = TRUE)
inspect(head(rules_sorted, 20))

rules_df <- as(rules_sorted, "data.frame")
write.csv(rules_df, "rules_graduados_2023.csv", row.names = FALSE)

# Filtro de datos para el Departamento de Guatemala

datos_guatemala <- subset(datos, Departamento == "Guatemala")

rules_Departamento_Guatemala <- apriori(datos_guatemala, 
                  parameter = list(support = 0.2, confidence = 0.5, minlen = 2))


sorted_rules_departamento <- sort(rules_Departamento_Guatemala, by = "lift", decreasing = TRUE)
inspect(head(sorted_rules_departamento, 10))

rules_departamento_df <- as(sorted_rules_departamento, "data.frame")
write.csv(rules_departamento_df, "rules_graduados_guatemala_2023.csv", row.names = FALSE)


# Selecccion de un subconjunto, Sector= publico

datos_sector_publico <- subset(datos, Sector == "Público")
table(datos_sector_publico$Sector)

datos_sector_publico <- droplevels(datos_sector_publico)

# Se omite la columna Sector, dado que todos los registros pertenecen al sector público
datos_sector_publico <- datos_sector_publico[, !(names(datos_sector_publico) %in% c("Sector"))]

rules_sector_publico <- apriori(datos_sector_publico, 
                                        parameter = list(support = 0.2, confidence = 0.5, minlen = 2))


sorted_rules_sector_publico <- sort(rules_sector_publico, by = "lift", decreasing = TRUE)
inspect(head(sorted_rules_sector_publico, 10))

# Escritura de archivo csv para las reglas obtenidas

rules_sector_publico_df <- as(sorted_rules_sector_publico, "data.frame")
write.csv(rules_sector_publico_df, "rules_graduados_sector_publico_2023.csv", row.names = FALSE)




