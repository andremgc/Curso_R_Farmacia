#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Uso do software R em análises epidemiológicas
# Aula 3, análise descritiva, 04/09/2019 
# André Moura Gomes da Costa
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

# Falar do ifelse()

# Carregando pacotes


library(tidyverse) # dplyr, tidyr, ggplt2, stringr, ...
library(gmodels) # Tabela parecida com do SPSS
library(GGally) # ggpairs function
library(psych) # pairs.panels function
library(moments) # Skewness e kurtosis
library(car) # QQplot

# Carregando dados

data(mtcars) 
data(iris)

# revendo mean ######################################

mean(c(1,2,3))
mean(c(1,NA,3))
mean(c(1,NA,3), na.rm = T)

# Análise descritiva ########################################

summary(mtcars) # Sumário de mtcars
summary(____) # Sumário de iris

str(mtcars) # Estrutura de mtcars
___(iris) # Estrutura de iris

# Tabela cruzada simples
xtabs(~ am + gear, data = mtcars)
xtabs(~ am + gear + vs, data=mtcars)

# Razão do total
prop.table(xtabs(~ am + gear, data = mtcars))
# Razão por linha
prop.table(xtabs(~ am + gear, data = mtcars), 1)
# Razão por coluna
prop.table(xtabs(______, _______), 2)

# Para quem está acostumado com o SPSS:
gmodels::CrossTable(mtcars$am, mtcars$gear, format = "SPSS")

# Estatística descritiva e dplyr #

# extrai media de mpg e am
mtcars %>% summarise_at(vars(mpg, hp), mean) 

# extrai media das variáveis entre mpg e qseq.
mtcars %>% summarise_at(vars(mpg:qsec), ______)

# extrai media de mpg e hp - repare o nome das colunas
mtcars %>% summarise_at(vars(mpg, hp), list(mean, sd)) 

# extrai media de mpg e hp - com nomes claros
mtcars %>% summarise_at(___(mpg,__), list(media = mean,
                                           dp = sd)) 

# O mesmo de cima, agrupado por cyl
mtcars %>% ______ (cyl) %>% 
        summarise_at(vars(mpg, hp), list(media = mean, dp = sd)) 

# Normalidade
# skewness e kurtosis do pacote moments
mtcars %>% summarise_at(____(___,___), list(Assimetria = skewness,
                                          Curtose = kurtosis)) 

# Teste de Shapiro-Wilk
shapiro.test (mtcars$mpg) # nao nega normalidade

# QQPlot
hist(mtcars$mpg)
qqPlot(mtcars$mpg)
stem(mtcars$mpg)


# Gráficos de pares ##########################################

pairs(iris)

ggpairs(iris)

ggpairs(iris, columns = 1:4, aes(color = Species, alpha = .5))

#ggpairs(mtcars)


mtcars2 <- mtcars %>% 
        # Seleciona colunas mpg, hp, cyl, gear
        ______ (___, ___, ____, ____) %>% 
        # Transforma gear e cyl para factor.
        mutate(gear = _________,
               cyl = ________)

ggpairs(mtcars2)
ggpairs(mtcars2, columns = 1:3, aes(color = gear))

psych::pairs.panels(mtcars2)
