#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Uso do software R em análises epidemiológicas
# Aula 3, revisao 2 join, 04/09/2019 
# André Moura Gomes da Costa
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

# Criando data frames.

dfdp <- data.frame(
        nome = c("João", "Maria", "João"),
        sobrenome = c("da Silva", "da Silva",
                      "Antunes"),
        variavel = c(rep(c("altura"), 3),
                     rep(c("peso"), 3),
                     rep(c("idade"), 3)),
        valor = c(180, 170, 170,
                  80, 70, 70,
                  30, 25, 20) ) %>%
        spread(key = variavel,
               value = valor) %>%
        unite (col = nomeCompleto,
               nome, sobrenome,
               sep = " ",
               remove = TRUE) %>%
        mutate(sexo = factor(c("M","M","F")))

ColsExtra <- data.frame(
        nomeCompleto = c("Ana Souza", "Pedro Moura"),
        altura = c(160, 165), idade = c(30, 18),
        peso = c(63, 75), sexo = c("F","M")
)
RowsExtra <- data.frame(
        pontos = rnorm(5, 6, 2),
        cidade = factor(c("BH", "BH", "BH",
                          "SP", "SP"))
)


DF <- dfdp %>% rbind(ColsExtra) %>% cbind(RowsExtra)
Cidades <- data.frame(cidade = c("SP","RJ","BH"),
                      populacao = c(12.2, 6.7, 2.5),
                      area = c(1500, 1200, 300)) %>%
        mutate (densidade = populacao*1e6/area)

# Explore os diferentes tipos de join.