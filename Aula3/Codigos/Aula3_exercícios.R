#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Uso do software R em análises epidemiológicas
# Exercício 2
# André Moura Gomes da Costa
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

# NOME DO ALUNO : 


#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# UTILIZE ESTE ESPAÇO PARA CARREGAR BIBLIOTECAS





# Corrija o texto, para obter: "Olá, este é um texto sem erros"

texto1 <- "Olá, 3st3 é      um t3xto com @lguns 3rros."



# Retire todos os digitos não alfabéticos (ou barra de espaço) do texto abaixo

texto2 <- "!@34Es!s%@e te4x%to n@!@#ao t$!e12m nu)(m*e#!ros o5%5u di$g()*&itos espe13ci245ais 4123 "



# Passe todos os padrões abaixo para um único, GOL.

Gols <- c("GoooooooL", "GOL", "GoOoOoOL", "gOOOOl", "GoOl", "goL", "GOL", "GoL", "g0000000l")



# Considere o banco de dados

df <-data.frame(
        Nascimento = c ("14/5/1993", "24/9/1963", "13/7/1991", "07/3/1963",
                        "19/5/1983", "14/1/1963", "13/12/1997", "20/3/1963"),
        Vacina = c ("14/5/1994", "14/9/1968", "15/6/1992", "07/3/1965",
                    "19/7/1985", "14/10/1967", "13/12/1998", "21/10/1980"),
        sexo = c("M","M","M","M","F","F","F","F"))

# Transforme as colunas para classe de datas. e sexo para factor.



# Crie uma coluna com a idade, em dias, de vacinação e passe para a classe numérica.



# Crie uma coluna com a idade, em dias, de vacinação e passe para a classe numérica.



# Passe as idades para ano (divizão por 365.25)



# Descubra as médias e os desvios padrão das idades e das idades de vacinação
# extratificadas por sexo.



# Discuta: Há alguma variável que parece vir de um distribuição normal?



# Faça um gráfico de pares para o seu data frame, comente resultados interessantes.
# (Recomendação: uso ggpairs())



