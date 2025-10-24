# 📘 Algoritmos de Minería de Datos

Repositorio dedicado al **aprendizaje práctico de algoritmos clásicos de minería de datos** utilizando el lenguaje **R**.  
Cada script implementa un algoritmo diferente, acompañado de explicaciones, visualizaciones y ejemplos de aplicación.

---

## 📑 Índice

1. [Descripción general](#-descripción-general)
2. [Estructura del repositorio](#-estructura-del-repositorio)
3. [Requisitos y dependencias](#-requisitos-y-dependencias)
4. [Algoritmos incluidos](#-algoritmos-incluidos)
   - [Apriori (apriori_t2.R)](#apriori-apriorit2r)
   - [FP-Growth (fpgrowth_t3.R)](#fp-growth-fpgrowtht3r)
   - [K-Means (kmeans_t4.Rmd)](#k-means-kmeanst4rmd)
5. [Autor](#-autor)
6. [Licencia](#-licencia)

---

## 🧠 Descripción general

Este repositorio tiene como propósito servir de guía para el **aprendizaje de algoritmos fundamentales en minería de datos**.  
Los ejemplos fueron diseñados con un enfoque educativo, mostrando tanto la **implementación en R** como la **interpretación de resultados**.

Cada algoritmo aborda un tipo de problema distinto dentro del proceso de descubrimiento de conocimiento en bases de datos (KDD):

- **Reglas de asociación:** identificación de patrones y relaciones entre variables.
- **Segmentación / clustering:** agrupación de observaciones similares.

---

## 📂 Estructura del repositorio

```bash
data-mining/
├── apriori_t2.R          # Implementación del algoritmo Apriori
├── fpgrowth_t3.R         # Implementación del algoritmo FP-Growth
├── kmeans_t4.Rmd         # Análisis y clustering con K-Means
└── README.md             # Documentación principal del repositorio
```

---

## ⚙️ Requisitos y dependencias

Para ejecutar los scripts correctamente, se recomienda tener instalado:

- **R** (versión ≥ 4.5)
- **RStudio** (opciona pero recomendado)
- Librerías utilizadas:
  - `arules`
  - `dplyr`
  - `ggplot2`
  - `tidyr`
  - `factoextra`
  - `cluster`

Puedes instalarlas ejecutando:

```R
install.packages(c("arules", "dplyr", "ggplot2", "tidyr", "factoextra", "cluster"))
```

---

## 🔍 Algoritmos incluidos

### **Apriori (apriori_t2.R)**  

Implementa el **algoritmo Apriori**, utilizado para la **extracción de reglas de asociación** a partir de transacciones.  

---

### **FP-Growth (fpgrowth_t3.R)**

Implementa el algoritmo **FP-Growth**, una alternativa más eficiente al Apriori.  
Evita la generación explícita de combinaciones mediante una estructura de árbol de patrones frecuentes (FP-Tree).  

---

### **K-Means (kmeans_t4.Rmd)**

Implementa el algoritmo de **clustering K-Means**.  
Incluye:
- Carga y preprocesamiento de datos.

---
