# Comprendre les types de donnés et déterminer si chaque colonne est une date, une valeur numérique, un texte…
# pas seulement des scalaires, on peut mettre des objets

# scalar
a <- 30

# vector
b <- c(1,2,3,4,5)

# matrix
c <- matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3, ncol = 3)

# data frame
d <- data.frame(x = c(1,2,3,4,7), y = c('Sherlock','Moriaty','Watson','Huddson','Hilary'))

# list
e <- list(a = 1, b = 2, c = 'Test')

# factor
f <- factor(c("M", "F", "F", "M", "M", "F"))
attributes(f)
levels(f)

# array
g <- array(c(1,2,3,4,5,6,7,8,9), dim = c(3,3))

######
# on peut specifier le format de chaque colonne
suspects <- read_csv(
  readr_example("chickens.csv"),
  col_types = cols(
    chicken   = col_character(),
    sex       = col_factor(levels = c("rooster", "hen")),
    eggs_laid = col_integer(),
    motto     = col_character()
  )
)

# Présentation du concept de vecteur et première utilisation pratique avec des exemples concrets

# c pour column
x <- c(1,3,6,9,10)

x <- 1:4
x

# ajout 2 à tout
x + 2 

# multiplier tout par 2
x * 2

t <- 1:7

z <- x+t
# erreur si pas la meme taille

# sum(x)

# cumsum(x)

# max(x)

# min(x)

# mean(x)

# var(x)

# sort(x)
#sort(x, decreasing = TRUE)

# length(x)

# allez à la composante 3
x[3]

x[c(1:2)]

x[c(1,3,4)]

# Savoir formater, manipuler et opérer des calculs sur des dates avec le package {lubridate}

library(lubridate)

# récupérer la date courante
today()

now()

# conversion simple sur la date du jour
maintenant<-now()
maintenant

year(maintenant)
month(maintenant)
day(maintenant)

month(maintenant,label = TRUE)
month(maintenant,label = TRUE ,abbr = FALSE)

# convertissons les dates
ymd("2022-03-21")

ydm("2022 17 May")

ymd("2022 May, 17")

hms("15:34:43")

# Choisir sa timezone
ymd_hms("2022/05/12 00:34:43")

ymd_hms("2022/09/21 10:34:43", tz = "America/Toronto")

ymd_hms("2022/01/29 5:34:43", tz = "Africa/Abidjan")

# Opérations sur les dates
ymd(20220101) + years(1)
ymd(20220101) - years(1)

# Anniversaire de Conan Doyles
anni <- as.Date("22/05/1859", format="%d/%m/%Y")
adj <- as.Date(maintenant, format="%d/%m/%Y")
age <- as.numeric((adj-anni)/365)
age
dmy_h("05-07-2022 13")
duration("0 hours 30 min")
duration("1.5 hours")

# Découverte des fonctions disponibles avec le package stringr et mise en pratique sur des données réelles

library(stringr)

str_length("Dr Watson")

x <- c("Sherlock Holmes", "Dr Watson")
str_sub(x, 4, 6)

# str_pad() 
x <- c("Elementaire", "Elementaire, mon cher Watson")
str_pad(x, 20) # default pads on left

str_pad(x, 20, "both")

#######

# str_trim()
  
x <- c("  indice1   ", "indice2   ",  "     indice3")
str_trim(x)

str_trim(x, "left")

# str_wrap() 

quote <- str_c(
  "`Lorsque vous avez éliminé l'impossible,   ",
  "ce qui reste, ",
  "si improbable soit-il, ",
  "est nécessairement la vérité. "
)

cat(str_wrap(quote, width = 20))

x <- "Nos idées doivent être aussi vastes que la nature pour pouvoir en rendre compte."
str_to_upper(x)

str_to_title(x)

str_to_lower(x)

# str_sort
x <- c("y", "i", "k")

str_sort(x)

#Pattern matching
strings <- c(
    "Elementaire 11/2022", 
    "219 733 8965", 
    "329-293-8753", 
    "Travail: 579-499-7527; Maison: 543.355.3679"
  )
phone <- "([2-9][0-9]{2})[- .]([0-9]{3})[- .]([0-9]{4})"

str_detect(strings, phone)

str_subset(strings, phone)

str_count(strings, phone)

# str_extract()
str_extract(strings, phone)

str_extract_all(strings, phone)

# str_replace()
str_replace(strings, phone, "XXX-XXX-XXXX")

str_replace_all(strings, phone, "XXX-XXX-XXXX")
# str_split_fixed()
str_split("a-b-c", "-")

# Découverte des fonctions disponibles avec le package stringr et mise en pratique sur des données réelles

# str_length("abc")

# This is now equivalent to the base R function nchar(). Previously it was needed to work around issues with nchar() such as the fact that it returned 2 for nchar(NA). This has been fixed as of R 3.3.0, so it is no longer so important.
# You can access individual character using str_sub(). It takes three arguments: a character vector, a start position and an end position. Either position can either be a positive integer, which counts from the left, or a negative integer which counts from the right. The positions are inclusive, and if longer than the string, will be silently truncated.

x <- c("abcdef", "ghifjk")

# The 3rd letter
str_sub(x, 3, 3)

#To duplicate individual strings, you can use str_dup():
str_dup(x, c(2, 3))

# Three functions add, remove, or modify whitespace:
# str_pad() pads a string to a fixed length by adding extra whitespace on the left, right, or both sides.

x <- c("abc", "defghi")
str_pad(x, 10) # default pads on left

str_pad(x, 10, "both")

#######

x <- c("Short", "This is a long string")

x %>% 
  str_trunc(10) %>% 
  str_pad(10, "right")

# The opposite of str_pad() is str_trim(), which removes leading and trailing whitespace:
  
x <- c("  a   ", "b   ",  "   c")
str_trim(x)
#> [1] "a" "b" "c"
str_trim(x, "left")
#> [1] "a   " "b   " "c"

# You can use str_wrap() to modify existing whitespace in order to wrap a paragraph of text, such that the length of each line is as similar as possible.

jabberwocky <- str_c(
  "`Twas brillig, and the slithy toves ",
  "did gyre and gimble in the wabe: ",
  "All mimsy were the borogoves, ",
  "and the mome raths outgrabe. "
)

cat(str_wrap(jabberwocky, width = 40))
#> `Twas brillig, and the slithy toves did
#> gyre and gimble in the wabe: All mimsy
#> were the borogoves, and the mome raths
#> outgrabe.

# Locale sensitive
# A handful of stringr functions are locale-sensitive: they will perform differently in different regions of the world. These functions are case transformation functions:
  
x <- "I like horses."
str_to_upper(x)

str_to_title(x)

str_to_lower(x)

str_to_lower(x, "tr")

# String ordering and sorting:
  
x <- c("y", "i", "k")
str_order(x)

str_sort(x)

str_sort(x, locale = "lt")

#The locale always defaults to English to ensure that the default behaviour is identical across systems. Locales always include a two letter ISO-639-1 language code (like “en” for English or “zh” for Chinese), and optionally a ISO-3166 country code (like “en_UK” vs “en_US”). You can see a complete list of available locales by running stringi::stri_locale_list().

#Pattern matching
#The vast majority of stringr functions work with patterns. These are parameterised by the task they perform and the types of patterns they match.

#Tasks
#Each pattern matching function has the same first two arguments, a character vector of strings to process and a single pattern to match. stringr provides pattern matching functions to detect, locate, extract, match, replace, and split strings. I’ll illustrate how they work with some strings and a regular expression designed to match (US) phone numbers:
  
strings <- c(
    "apple", 
    "219 733 8965", 
    "329-293-8753", 
    "Work: 579-499-7527; Home: 543.355.3679"
  )
phone <- "([2-9][0-9]{2})[- .]([0-9]{3})[- .]([0-9]{4})"

# str_detect() detects the presence or absence of a pattern and returns a logical vector (similar to grepl()). str_subset() returns the elements of a character vector that match a regular expression (similar to grep() with value = TRUE)`.

# Which strings contain phone numbers?
str_detect(strings, phone)

str_subset(strings, phone)

#str_count() counts the number of matches:
  
# How many phone numbers in each string?
str_count(strings, phone)

# str_locate() locates the first position of a pattern and returns a numeric matrix with columns start and end. str_locate_all() locates all matches, returning a list of numeric matrices. Similar to regexpr() and gregexpr().

# Where in the string is the phone number located?
(loc <- str_locate(strings, phone))

str_locate_all(strings, phone)

# str_extract() extracts text corresponding to the first match, returning a character vector. str_extract_all() extracts all matches and returns a list of character vectors.

# What are the phone numbers?
str_extract(strings, phone)

str_extract_all(strings, phone)

str_extract_all(strings, phone, simplify = TRUE)

# str_match() extracts capture groups formed by () from the first match. It returns a character matrix with one column for the complete match and one column for each group. str_match_all() extracts capture groups from all matches and returns a list of character matrices. Similar to regmatches().

# Pull out the three components of the match
str_match(strings, phone)

str_match_all(strings, phone)

# str_replace() replaces the first matched pattern and returns a character vector. str_replace_all() replaces all matches. Similar to sub() and gsub().

str_replace(strings, phone, "XXX-XXX-XXXX")

str_replace_all(strings, phone, "XXX-XXX-XXXX")

# str_split_fixed() splits a string into a fixed number of pieces based on a pattern and returns a character matrix. str_split() splits a string into a variable number of pieces and returns a list of character vectors.

str_split("a-b-c", "-")

str_split_fixed("a-b-c", "-", n = 2)

# Apprendre à créer des listes et découverte des fonctions utiles applicables sur des listes

# Création de listes
# La fonction de base pour créer une liste est la fonction  list   :
  
personList <- list(c("Sherlock","Watson","Dr Watson","James Moriarty"),matrix(1:6,2,3))
personList

length(personList)

is.list(personList)

#  y accéder plus facilement via l’opérateur  $  . 
# Ceci est faisable via la fonction  names  :
  
names(personList) # pas de nom actuellement, la fonction retourne un NULL

names(personList) <- c("nom","matrice")
names(personList)

personList$

# Il est également possible de créer une liste en partant d’une liste vide.

li <- list()
li
# list()

li[[1]] <- 1:4
li

li$matrice <- matrix(1:4,nrow=2)
li

names(li)

# Fonctions utiles
# il n’est pas possible de faire des calculs entre plusieurs listes. 
# Néanmoins, il existe quelques fonctions valides et utiles :
  
# lapply  applique une fonction (comme la moyenne, la variance, etc.) 
# successivement à chacune des composantes.
lapply(li, sum)

# unlist(maliste)  crée un seul vecteur contenant tous les éléments de la liste. 
# Les éléments d’un vecteur étant nécessairement du même mode, il faut faire attention à la conversion automatique pratiquée par R.
unlist(li)

#concatène deux listes.
list2 <- c(personList,li)  

# Apprendre à créer et visualiser des dataframes, découverte des opérations sur les dataframe

# Création d'un dataframe
df <- data.frame()

df2 <- data.frame(Nom=character(),
                  Age=integer())

# Création d'un dataframe à partir d'un fichier
# Import
df <- read.csv("quartier-londres.csv", sep=";")

# Création d'un dataframe à partir d'un vecteur
df <- data.frame(c(1, 2, 3))

# Création d'un dataframe à partir d'une matrice
df <- data.frame(matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3))

# Visualisation d'un dataframe
df

# Opérations sur les dataframes
df + 1
df * 2
df / 2
df - 1
df ^ 2

# Opérations sur les colonnes
df$X1
df$X2
df$X3

# Opérations sur les lignes
df[1, ]
df[2, ]

# Opérations sur les cellules
df[1, 1]
df[1, 2]
df[2, 1]
df[2, 2]

# Découverte des relations d’ordre ( > < <= >= ) et maitrise des opérations logiques ( & |) # ---------

# relation d'ordre

# 0 < 2
# 0 > 2
# 2 > 0
# 0 <= 2
# 2 >=1
# 0==1
# 0==0

# 1!=0
# ~1!= 1

# !TRUE
# !FALSE

# algebre booleaenne
# 0 | 1 -> TRUE
# 1 | 1 -> TRUE
# 1 & 1 -> TRUE
# 1 & 0 -> FALSE

# Utile dans les filtres

## L'énigme de Sherlock Holmes
## Sherlock Holmes enquête sur un meurtre. Il a trouvé une note avec le message suivant :
## "Le meurtrier est un homme mesurant entre 170 et 180 cm, 
## il a entre 30 et 40 ans, il porte une barbe et un chapeau."
## Sherlock Holmes a trouvé trois suspects :
  
df <- data.frame(c("Albert","Jacques","Jean"),
                 c(175,178,173),
                 c(35,32,41),
                 c(TRUE,FALSE,TRUE),
                 c(TRUE,TRUE,TRUE))

colnames(df) <- c("Prénom","Taille","Age","Barbe", "Chapeau")

## Qui est le coupable ?

df[which(df$Barbe==TRUE & df$Chapeau==TRUE),]

df[which(df$Barbe==TRUE & df$Chapeau==TRUE & df$Age<40),]








