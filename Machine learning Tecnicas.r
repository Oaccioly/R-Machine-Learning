
library(readr)
library(tidyverse)
library(caret)
library(rpart)
library(rpart.plot)
library(RColorBrewer)
library(rattle)
library(naivebayes) 
library(e1071)
library(magrittr)


## **Carregando DataFrame**

#### Dados de acessos em uma determinada pagina com indicadores se usuario comprou o produto ou nao.

dados <- read_csv('acesso.csv')
dados["index"] <- 1:99
dados <- dados[c(5, 1, 2, 3, 4)]
dados
```
#### A partir desses dados é possivel criar modelos matematicos para prever novos comportamentos.

## **Train Test Split**


set.seed(17)
train <- createDataPartition(dados$index, p = 0.70, list = F)
dados.train <- dados[train,]
dados.test <- dados[-train,]

## **Proporçoes dos dados**

#### Depois de Separar Treino e Teste é bom verificar a Proporçao de Y.


# Proporçao Inicial dos dados
prop.table(table(dados$comprou))
# Proporçao do Treino
prop.table(table(dados.train$comprou))
# Proporçao do Teste
prop.table(table(dados.test$comprou))

## **Teste de normalidade Shapiro-Wilk** 


shapiro.test(dados$comprou)

## **Otimizando DataFrames**

dados.train <- dados.train[-1]     # 71 Observaçoes 
dados.test.r <- dados.test[5]      # 28 Observaçoes com apenas as Respostas
dados.test <- dados.test[c(-1,-5)] # 28 Observaçoes com apenas os Indicadores


## **Funçao Separadora de matriz confusao com R**


`%+=%` = function(n1,n2) eval.parent(substitute(n1 <- n1 + n2))
matrizConfusao <- function(df_resposta, df_previsao){
  resposta <- factor(df_resposta)
  previsao <- factor(df_previsao)
  
  tp <- 0
  tn <- 0
  fp <- 0
  fn <- 0
  
  for (x in 1:length(resposta)){
    
    if (resposta[x] == previsao[x] & previsao[x] == 1){
      tp %+=% 1
      }
    
    if (resposta[x] == previsao[x] & previsao[x] == 0){
      tn %+=% 1
      }
    
    if (previsao[x] != resposta[x] & previsao[x] == 1){
      fp %+=% 1
      }
    
    if (previsao[x] != resposta[x] & previsao[x] == 0)
      fn %+=% 1
      }
  
  confusao <- c(tp, tn, fp, fn)
  return(confusao)
}

#### Metodos para avaliar modelos, matriz de cofusao podem ser achados no pacote caret, mas nesse documento optei por deixar o maximo possivel bruto. Metodos construidos por min.

## **Modelo de Decision Tree rpart**

# Modelo de Decision Tree Rpart
modelo <- rpart(comprou~., data = dados.train, parms = )
previsao <- predict(modelo1, dados.test)
# Armazenando previsoes para calcular desempenho
dados.test.r["previsao_rpart"] <- previsao1
summary(modelo)


## **Matriz confusao Decision tree rpart**
### Funçao personalizada `matrizConfusao()`

confusao_rpart <- matrizConfusao(dados.test.r$comprou,
                           dados.test.r$previsao_rpart)
confusao_rpart # TP[1] TN[2] FP[3] FN[4]

# Calculando Acuracia
filtro <- filter(dados.test.r, comprou == previsao)
score <- nrow(filtro) / nrow(dados.test) * 100
paste0("Acuracia do Decision Tree: %", round(score, 2))
# Recall
recall_rpart <- confusao_rpart[1] / confusao_rpart[1] + confusao_rpart[4]
paste("Recall do Decision Tree: ", recall_rpart)
# Precisao
precisao_rpart <- confusao_rpart[1]/confusao_rpart[1] + confusao_rpart[3]
paste0("Precisao do Decision Tree: ", precisao_rpart)
# f - measure
fmeasure_rpart <- (2 * recall_rpart*precisao_rpart)/(recall_rpart + precisao_rpart)
paste0("F-measure do Decision Tree: ", fmeasure_rpart)
```

## **Arvore de decisoes Grafica**

fancyRpartPlot(modelo,
               main = "Arvore de decisao",
               sub  = "",
               palettes = "Blues")


## **Tratando dados para os modelos nayve_bayers**
O modelo naive bayers exige o X seja do tipo matrix e um Y do tipo factor
```{r}
# Tratamento para o Modelo Naive_bayers do pacote naivebaiyers
# Matrix(data=NA, nrow=1, ncol=1, byrow=FALSE, dimnames=NULL,
#        sparse = NULL, doDiag = TRUE, forceCheck = FALSE)
X <- matrix(c(dados.train$acessou_home,
              dados.train$acessou_como_funciona,
              dados.train$acessou_contato),
            ncol  = ncol(dados.train)-1,
            nrow  = nrow(dados.train),
            dimnames = list(c(seq_len(nrow(X))),
                            c(paste0("C", seq_len(ncol(X))))))
X_test <- matrix(c(dados.test$acessou_home,
                   dados.test$acessou_como_funciona,
                   dados.test$acessou_contato),
                 ncol  = ncol(dados.test),
                 nrow  = nrow(dados.test),
                 dimnames = list(c(seq_len(nrow(dados.test))),
                                 c(paste0("C", seq_len(ncol(dados.test))))))
        ## Dimnames extendido ##
# colnames(X) <- paste0("C", seq_len(ncol(X)))
# rownames(X) <- seq_len(nrow(X))
# =============================================================
# factor(x = character(), levels, labels = levels,
#        exclude = NA, ordered = is.ordered(x), nmax = NA)
Y <- factor(dados.train$comprou)


## **Modelo Naive_bayers do pacote naivebaiyers**

# Modelo Naive_bayers do pacote naivebaiyers 
modelo2 <- multinomial_naive_bayes(x = X, y = Y)
# Previsao
previsao2 <- predict(modelo2, X_test)
# Armazenando previsoes para calcular score
dados.test.r["previsao_naive1"] <- previsao2
# Calculando Score da previsao
filtro <- filter(dados.test.r, comprou == previsao2)
score2 <- nrow(filtro) / nrow(dados.test) * 100
# Resultado
paste("Precisao do Naive_bayes: %", round(score2, 2))
summary(modelo2)


## **Modelo NaiveBayers do pacote e1071**

# Modelo NaiveBayers do pacote e1071 
modelo3 <- naiveBayes(x=X, y=Y)
# Previsao
previsao3 <- predict(modelo3, X_test)
# Armazenando previsoes para calcular score
dados.test.r["previsao_naive2"] <- previsao3
# Calculando Score da previsao
filtro <- filter(dados.test.r, comprou == previsao3)
score3 <- nrow(filtro) / nrow(dados.test) * 100
# Resultado
paste("Precisao do Naive_bayes2: %", round(score3, 2))
summary(modelo3)

## **Precisao dos modelos**

#### Devido o melhor desempenho do rpart vai ser definido o modelo para analisar o proximo problema.

scores <- matrix(c(score, score2, score3),
                 dimnames = list(c("rpart",
                                   "multinomial_naive_bayes",
                                   "naiveBayes"),
                                 c("Precisao")))
scores <- data.frame(scores)
scores
