---
title: "**Projeto Machine Learning**"
author: "Gabriel Accioly"
output: html_notebook
---

## **Modelos de Machine Learning**

1. Aprendizagem Supervisionada
    + Arvores de Decisao
    + Classificaçao Naive Bayers
    + Regressao Linear de minimos Quadrados
    + Regressao logistica
    + Support Vector Machine
    + Ensemble Methods
2. Aprendizagem sem supervisão
    + Algoritmos de Agrupamento (Clustering)
    + Decomposisao em valores singulares
    + Analise de Componentes Principais
    + Analise de componentes independentes
3. Aprendizado por reforço

## **Aprendizagem Supervisionada**
###     **Arvores de Decisao**

#### Do ponto de vista da decisão de negócios, uma árvore de decisão é o número mínimo de perguntas que devem ser respondidas para avaliar a probabilidade de tomar uma decisão correta, na maioria das vezes. Como um método, permite-lhe abordar o problema de uma forma estruturada e sistemática para chegar a uma conclusão lógica.

###     **Classificaçao Naive Bayers**

#### Os classificadores Naïve Bayes são uma família de classificadores probabilísticos simples com base na aplicação Bayes ‘teorema com forte independência entre as características. A imagem em destaque é a equação – em que P (A| B) é a probabilidade posterior, P (B|A) é a probabilidade, P (A) é a probabilidade prévia e P (B) é preditor de probabilidade prévia.

#### **Exemplos de uso:**
#### >Para marcar um e-mail como spam ou não spam.
#### >Classificar um artigo de notícias sobre tecnologia, política ou esportes.
#### >Verificar um pedaço de texto expressando emoções positivas ou negativas.
#### >Usado para software de reconhecimento facial.

###     **Regressão Linear de Mínimos Quadrados**

#### Regressão linear é a tarefa de encaixar uma linha reta através de um conjunto de pontos. Existem várias estratégias possíveis para isso e a de “mínimos quadrados comuns” é assim: assim é possivel desenhar uma linha e, em seguida, para cada um dos pontos de dados, medir a distância vertical entre o ponto e a linha e somá-los. A linha ajustada seria aquela em que esta soma de distâncias é a menor possível.
#### Linear refere-se ao tipo de modelo que você está usando para ajustar os dados,
#### Enquanto mínimos quadrados refere-se ao tipo de métrica de erro que você está minimizando.


###     **Regressão logística**

#### A regressão logística é uma poderosa forma estatística de modelar um resultado binomial com uma ou mais variáveis explicativas. Ela mede a relação entre a variável dependente categórica e uma ou mais variáveis independentes, estimando as probabilidades usando uma função logística, que é a distribuição logística cumulativa.

#### **Exemplos de uso:**
#### >Pontuação de crédito
#### >Medir as taxas de sucesso das campanhas de marketing
#### >Prever as receitas de um determinado produto
#### >Haverá um terremoto em um determinado dia?

###     **Support Vector Machine**

#### SVM é um algoritmo binário da classificação. Dado um conjunto de pontos de 2 tipos em lugar N dimensional, SVM gera um hiperplano (N – 1) dimensional para separar esses pontos em 2 grupos. Digamos que você tem alguns pontos de 2 tipos em um papel que são linearmente separáveis. SVM encontrará uma linha reta que separa esses pontos em 2 tipos e situados o mais longe possível de todos esses pontos.

#### Em termos de escala, alguns dos maiores problemas que foram resolvidos usando SVMs (com implementações adequadamente modificadas) 

####    **Exemplos de uso:**
####    >São publicidades em display.
####    >Reconhecimento de site de splice humano.
####    >Detecção de gênero baseada em imagem.
####    >Classificação de imagem em grande escala.

###     **Ensemble Methods**
#### São algoritmos de aprendizagem que constroem um conjunto de classificadores e, em seguida, classificam novos pontos de dados, tendo um ponderado voto de suas previsões. O método de conjunto original é a média bayesiana, mas os algoritmos mais recentes incluem codificação de saída, correção de erros, bagging e reforço.
#### Eles reduzem a variância: A opinião agregada de um monte de modelos é menos barulhenta do que a opinião única de um dos modelos. Em finanças, isso é chamado diversificação – uma carteira mista de muitas ações será muito menos variável do que apenas um dos estoques sozinho. É por isso que seus modelos serão melhores com mais pontos de dados do que menos.
#### É improvável que eles se sobrepõem: se você tem modelos individuais que não se sobrepõem e está combinando as previsões de cada modelo de uma maneira simples (média, média ponderada, regressão logística), então não há espaço para sobrecarga.


## **Aprendizagem sem supervisao**
###     **Algoritmos de Agrupamento (Clustering)**
#### É a tarefa de agrupar um conjunto de objetos de tal forma que os do mesmo grupo (cluster) são mais semelhantes uns aos outros do que aqueles em outros grupos.

####    **Cada algoritmo de agrupamento é diferente:**
####    >Algoritmos baseados em Centroid
####    >Algoritmos baseados em conectividade
####    >Algoritmos baseados em densidade
####    >Probabilístico
####    >Redução da Dimensionalidade
####    >Redes Neurais / Aprendizagem Profunda

###     **Decomposisao em valores singulares**
#### Na álgebra linear, a SVD é uma fatorização de uma matriz complexa real. Para uma dada matriz m* n M, existe uma decomposição tal que M = UΣV, onde U e V são matrizes unitárias e Σ é uma matriz diagonal.

#### PCA é realmente uma aplicação simples de SVD. Na visão computacional, os algoritmos de reconhecimento de primeira face usaram PCA e SVD para representar faces como uma combinação linear de “eigenfaces”, fazer redução de dimensionalidade e, em seguida, corresponder faces a identidades através de métodos simples. Embora os métodos modernos sejam muito mais sofisticados, muitos ainda dependem de técnicas semelhantes.

###     **Análise de Componentes Principais**
#### PCA é um procedimento estatístico que usa uma transformação ortogonal para converter um conjunto de observações de variáveis, possivelmente correlacionadas em um conjunto de valores de variáveis linearmente não correlacionadas, chamadas componentes principais.

#### Algumas das aplicações do PCA incluem compressão, simplificação de dados para facilitar o aprendizado e visualização. Observe que o conhecimento do domínio é muito importante ao escolher se deseja avançar com PCA ou não. Não é adequado nos casos em que os dados são ruidosos (todos os componentes da PCA têm uma variação bastante alta).

###     **Análise de componentes independentes**
#### ICA é uma técnica estatística para revelar fatores ocultos que estão subjacentes a conjuntos de variáveis aleatórias, medições ou sinais. A ICA define um modelo generativo para os dados multivariados observados, que normalmente é dado como um grande banco de dados de amostras. No modelo, as variáveis de dados são assumidas como misturas lineares de algumas variáveis latentes desconhecidas, e o sistema de mistura também é desconhecido. As variáveis latentes são consideradas não-gaussianas e mutuamente independentes, e são chamadas de componentes independentes dos dados observados.    

#### A ICA está relacionada ao PCA, mas é uma técnica muito mais poderosa, capaz de encontrar os fatores subjacentes das fontes quando esses métodos clássicos falham completamente. Suas aplicações incluem imagens digitais, bancos de dados de documentos, indicadores econômicos e medições psicométricas. Agora siga em frente e use sua compreensão de algoritmos para criar aplicações de aprendizagem de máquina que possibilitam melhores experiências para as pessoas em todos os lugares


## **Primeiras perguntas**
### 1.  Inferencia ou Prediçao ?
### 2.  Qual o tipo de problema ? (Supervisionado, semi-supervisionado, nao supervisionado ou por reforço)
### 3.  Classificaçao ou Regressao
### 4.  Selecionar variaveis plausiveis
### 5.  Vazamento de dados (ID)
### 6.  Padronizaçao de variaveis continuos
### 7.  Excluir variaveis correlacionadas ?
### 8.  Utilizar tecnica de reduçao de dimensao ?
### 9.  O que fazer com valores **missing**
### 10. **one-hot enconding** (ou **dummies**)
### 11. Divisao da amostra em treino e teste ?
### 12. Quais valores de hiperparametros testar ?
### 13. Validaçao cruzada? Quantos Folds ?
### 14. Quando houver mais de um hiperparametro (**grid search**) ?
### 15. Quais algoritmos testar ?
### 16. Amostras desbalanceadas, usar tecnica de reamostragem ? (**up**, **down** ou **smote**)
### 17. Performance de problemas de regressao (RMSE, R2, Erro absoluto medio)?
### 18. Performance de problemas de classificaçao (acuracia, sensibilidade, especificidade, area abaixo da curva ROC e grafico de calibraçao)


## **Bibliotecas utilizadas**

1. **readr**
    + `read_csv()`
2. **tidyverse**
    + `filter()`
3. **caret**
    + `createDataPartition()`
4. **rpart**
    + `rpart()`
5. **rpart.plot**
6. **RcolorBrewer**
7. **rattle**
    + `fancyRpartPlot()`
8. **naivebayes**
    + `multinomial_naive_bayes()`
9. **e1071**
    + `naiveBayes()`
10. **magrittr**

## **Bonus**
### No **Python** e outras linguagens como **C** possuem os operadores de incremento, para utilizar no controle de iteraçao. no **C** basta usar `i ++` e o objeto `i` ja vai ser incrementado, ou `i --` para decrementar.

### No **Python** suas entranhas possuem **C**, logo tambem tem uma funçao incrementadora `i += 1`, com ate mais recursos eles podendo ser utilizados com operadores matematicos.

#### **||** **Auto Adiaçao**`+=` | **Auto Subtaçao**`-=` | **Auto Multiplicaçao**`*=` |  **Auto Divisao**`/=` **||**
#### **||** **Auto Exponenciaçao** `**=` | **Auto Parte inteira** `//=` | **Auto Modulo** `%=` **||**

### Estes recursos de auto incrementaçao nao estao presentes no R, entao decidi fazer algo semelhante 
### `%+=% = function(n1,n2) eval.parent(substitute(n1 <- n1 + n2))`
#### Apenas modificando minha funçao posso retornar qualquer operador semelhante ao **Python**
