#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Uso do software R em análises epidemiológicas
# Aula 3, strings e tempos, 04/09/2019 
# André Moura Gomes da Costa
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

library(stringr)

character <- c("Interessante", "Inteligente", "incapaz", "gente", "inocente", 
               "a incerteza", "letra i", "2", "32432", "100000000.9", 
               "Char a", "Char b", "Char C", "Char D", "Char z",
               "G.L", "GOL", "GPL", "G1L", "GiL",
               "GOOL", "GOOOL", "GOOOOOOL","GOOOOOOOOOOOL","GL",
               "Assobio", "Assovio","biologia",
               "aluno", "alunos", "por que?")

#  princiapis funcoes do stringr (funções similares do pacote base entre parenteses) ####

# str_c (similar a paste e paste0)
str_c(character[4], character[2])
# str_c com separador
str_c(character[4], character[2], sep = " ")
# str_c para vetor
str_c(c("a", "b"), c("A", "B"), sep = " - ")
# str_c para vetor, colapsando em um único character
str_c(c("a", "b"), c("A", "B"), sep = " - ", collapse = "; ")

# str_to_upper e str_to_lower (toupper e tolower)
str_to_lower(character)
str_to_upper(character)

# str_count: conta o número de characters
str_count(character)

# str_sort, str_order : ordena e retorna as posições
str_sort(character)
str_order(character)
character[str_order(character)]



# str_detect: T ou F de acordo com existência de padrão
str_detect (character, "Interessante")
str_detect (character, "a")

# str_subset: retorna apenas elementos que contenham o padrão
str_subset (character, "Interessante")
str_subset (character, "a")

# str_match: retorna o primeiro padrão existente:
str_match (character, "Interessante")
str_match (character, "a")

# str_replace: substitui o primeiro padrão:str_replace_all
str_replace (character, "a", "A")
str_replace("Arara", "a", "A")

# str_replace_all: substitui todos as ocorrências do padrão
str_replace_all("Arara", "a", "A")

# str_locate: início e fim de um padrão
str_locate("Teste", pattern =c("es", "ste"))



# Exemplos do uso de expressões regulares com str_subset #########

# ^ - início do texto
str_subset(character, "^i")
str_subset(character, "i")

# $ - sim do texto
str_subset(character, "e$")
str_subset(character, "e")

# [] - conjuntos
str_subset(character, "[1-9]") # qualquer digito numérico
str_subset(character, "[A-Z]") # qualquer digito alfabético maíusculo
str_subset(character, "[a-z]") # qualquer digito alfabético minúsculo
str_subset(character, "[a-z,3]") # qualquer digito alfabético minúsculo ou 3
str_subset(character, "[a-zA-Z]") # qualquer digito alfabético 
str_subset(character, "[a-zA-Z0-9]") # qualquer digito alfanumérico
# ^ representa negação
str_subset(character, "[^a-zA-Z0-9]") # qualquer digito que não seja alfanumérico

# | Ou lógico
str_subset(character, "Assobio|Assovio") 



# . representa qualquer caracter (menos nova linha)
str_subset(character, "G.L") 

# ? existência ou nao de dado dígito
str_subset(character, "alunos?") 

# * Ocorrência de um caracter repedito 0 ou mais vezes
str_subset(character, "GO*L") 
# * Ocorrência de um caracter repedito 1 ou mais vezes
str_subset(character, "GO+L") 

# {n} ocorrencia de n vezes um padrao
str_subset(character, "GO{2}L")

# {n,m} ocorrencia de entre n e m vezes um padrao
str_subset(character, "GO{2,6}L")

# {n,} ocorrencia de n ou mais vezes um padrão
str_subset(character, "GO{2,}L")

# () ajusta o escopo
str_subset(character, "Assov|bio") 
str_subset(character, "Asso(v|b)io")

str_subset(character, "alunos?") 
str_subset(character, "(alunos)?") 

str_subset(character, "GO+L")
str_subset(character, "(GO)+L")

str_subset(character, "GO{2,}L")
str_subset(character, "(GO){2,}L")


# Datas ############################################################

datasInicio <- c("13/07/1991","5/03/1992","02/10/1996","14/05/1993")
datasFim <- c("1/10/2000","3/03/1998","12/10/2002","14/12/1997")

summary(datasInicio)

# Passando para Date com r base
datasInicio <- as.Date(datasInicio, format = "%d/%m/%Y")

datasInicio
summary(datasInicio)
class(datasInicio)

# Passando para Date com lubridate
datasFim <- dmy(datasFim)

summary(datasFim)
class(datasFim)

#Diferenças
Duracao <- datasInicio - datasFim
Duracao
mean(Duracao)
summary(as.numeric(Duracao))

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

temposInicio <- c("13/07/1991 12:00","05/03/1992 14:02","02/10/1996 23:12","14/05/1993 14:14")
temposFim <- c("1/10/2000 2:05","3/03/1998 14:35","12/10/2002 12:32","14/12/1997 21:12")


summary(temposInicio)

# Passando para POSIXct com base
temposInicio <- as.POSIXct(temposInicio, format = "%d/%m/%Y %H:%M")

summary(temposInicio)
class(temposInicio)

# Passando para POSIXct com lubridate
temposFim <- dmy_hm(temposFim)

summary(temposFim)
class(temposFim)

# Diferenças
Duracao <- temposInicio - temposFim
Duracao
mean(Duracao)
summary(as.numeric(Duracao))

