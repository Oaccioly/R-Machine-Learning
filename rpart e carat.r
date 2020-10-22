## **Importando Bibliotecas**

library(readr)
library(tidyverse)
library(rpart)
library(fastDummies)
library(caret)
library(rattle)
```
## **Importando dados**


dados <- read_csv("acessov2.csv")
dados

## **Tratando os dados**

table(dados$busca)

### Metodo de separaçao em Dummies, para poder trabalhar com a coluna busca.

dados <- dummy_cols(dados, remove_selected_columns = T)
dados


set.seed(17)
idx <- createDataPartition(dados$comprou, p = 0.80, list = F)
dados.train <- dados[idx,]
dados.train <- dados.train[c(1,2,4,5,6,3)]
dados.test <- dados[-idx,]
dados.test.r <- dados.test[3]
dados.test <- dados.test[-3]


### **Checando proporçoes**

# Proporçao dos dados inicias
prop.table(table(dados$comprou))
# Proporçao do treino
prop.table(table(dados.train$comprou))
# Proporçao do teste
prop.table(table(dados.test.r$comprou))


## **Modelo Decision Tree Rpart**
### Funçao para categorizar em 0 e 1.

# 0.375 0.611111111111111 0.704697986577181 0.795275590551181 1
bins <- function(df)map_dbl(df, function (x){
  if (x <= 0.704697986577181){
    return(0)
  }
  else{
    return(1)
  }})



modelo1 <- rpart(comprou~., dados.train, method = "anova")
previsao_rpart <- predict(modelo1, dados.test)
dados.test.r["previsao_rpart"] <- bins(previsao_rpart)


## **Grafico do modelo rpart**

fancyRpartPlot(modelo1, main = "Arvore de Decisoes", sub = "")


## **Matriz de confusao**

confusionMatrix(table(dados.test.r$comprou,
                      dados.test.r$previsao_rpart),
                positive = "1")
