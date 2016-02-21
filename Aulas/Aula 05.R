library(tree)
ajuste_tree <- tree(factor(am) ~ wt, data = mtcars)
summary(ajuste_tree)

plot(ajuste_tree)
text(ajuste_tree, pretty = 0)

table(mtcars$am, predict(ajuste_tree)[,"1"] > 0.5)

set.seed(123)
cv_tree <- cv.tree(ajuste_tree)
plot(cv_tree)

# seleciona a arvoore com 2 nós
melhor_tree <- prune.tree(ajuste_tree, best = 2)
# Grafico que representa a arvore `melhor_tree`
plot(melhor_tree)
text(melhor_tree, pretty = 0)

table(mtcars$am, predict(ajuste_tree)[,"1"] > 0.5) # tamanho 5

controles <- tree.control(nobs = 32, mincut = 10)
ajuste_tree <- ajuste_tree <- tree(factor(am) ~ wt, 
                                   data = mtcars, 
                                   control = controles)
plot(ajuste_tree);text(ajuste_tree, pretty = 0)