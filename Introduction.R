# créer  un script R
# Se familiariser avec les packages et savoir les installer en lignes de commandes

#Pour installer un package, vous pouvez utiliser l’onglet  Package  de RStudio, ou la fonction  
# install.packages("nom_du_package")

#Afin d’utiliser un package installé, il faut ensuite le charger pour la session de travail avec la fonction  
# library(nom_du_package) 

#Certains packages sont en constante évolution, avec de nouvelles versions régulièrement disponibles. 
#Il est donc intéressant de les mettre à jour de temps en temps.
#Le mieux est de mettre à jour les packages à l’ouverture d’une session R, en utilisant la fonction  
# update.packages()

library(dplyr)
library(tm.plugin.webmining)
library(purrr)
library(tidytext)
library(ggplot2)
library(tidyr)
library(igraph)
library(ggraph)

# Accès à la documentation d'un package

# install.packages("devtools")
# devtools::install_github("ropensci/gutenbergr")

library(gutenbergr)
library(dplyr)
library(stringr)

# Notre test 
book <- gutenberg_download(13795)

# Découverte de tous les opérateurs mathématiques disponibles

# addition
# soustraction
# multiplication
# division
# sqrt() -  2^(1/2)
# abs(-5)
# exp(1)
# log(6.38, base=exp(1))
# pi
# 15 %/% 4
# factorial()

# Apprendre à créer des variables en R , à les effacer et à faire des opérations

# variable algébriqe scalaire
# affecter une valeur 
a <- 5

# pas clair si chiffre négatif
b <--5

# il existe le =
b = 6

# variable algebrique complexe
z <- complex(real=3, imaginary = 2)
#Re(x)
#Im(x)
#x+x : somme, division, multiplication

# mod(z) : module
# arg(z) : angle
# conj(z) : conjugué complexe

#Créer une variable `sherlock` avec la valeur `"Sherlock Holmes"`.

#Créer une variable `watson` avec la valeur `"Dr. Watson"`

#Créer une variable `sherlock_watson` ayant pour valeur `Sherlock Holmes et Dr. Watson`.

## Pour obtenir la longueur de la chaîne, il faut utiliser
## nchar()
# Compréhension et utilisation des fichiers mémoire Rdata. 
# Utilisation des fonctions d'import et export et découverte de l'aide

### Rdata

#Ouvrir un projet
#Une nouvelle session R (processus) est lancée.
#Le fichier .RData du répertoire principal du projet est chargé (si les options du projet indiquent qu'il doit être chargé).

#Quitter un projet
#Les fichiers .RData sont écrits dans le répertoire du projet. 
#La session R est terminée.

# Charger les données
load("sherlock.RData")

### Doc
url <- "https://www.gutenberg.org/files/48320/48320-0.txt"
page_txt <- readLines(url)
page_txt[0:500]

### Doc
library(rvest)
url <- "https://en.wikipedia.org/wiki/Sherlock_Holmes"
page_html <- read_html(url)

### 
url <- "https://sherlock-holm.es/stories/pdf/a4/1-sided/advs.pdf"
library(pdftools)
page_pdf <- pdftools::pdf_text(pdf = url)
page_pdf[30]

####
save(page_txt, page_html,page_pdf , file = "sherlock.RData")
# Utilisation des packages {readr} et {readxl} 
# pour importer des fichiers plats en ligne de commande et avec une interface
# en ligne de commande et via une interface

### install readr
install.packages('readr')

library('readr')

#read_csv(): to read a comma (“,”) separated values
#read_csv2(): to read a semicolon (“;”) separated values
#read_tsv(): to read a tab separated (“\t”) values

### Import the file "sherlock_holmes.csv" 
data <- read_csv('sherlock-holmes-train.csv')

### Export your result

## installer le package
install.packages('readxl')

## charger la librarie
library(readxl)

## utiliser la doc

## Import the file "Breakout-Puzzle.xlsx" puzzle ( skip line, select onglet, ...)
xlsx <- read_excel("Breakout-Puzzle.xlsx", sheet = "Step 1", skip=9)








