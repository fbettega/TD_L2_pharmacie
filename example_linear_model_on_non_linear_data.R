##################
# Exercice 1
##################
data(anscombe)
attach(anscombe)

# create models
m1 = lm(y1~x1)
m2 = lm(y2~x2)
m3 = lm(y3~x3)
m4 = lm(y4~x4)

# model details
summary(m1)
summary(m2)
summary(m3)
summary(m4)

# plot
layout(matrix(1:4,2), respect=TRUE)
plot(x1,y1, xlim = c(3, 19), ylim = c(3, 13), main="m1")
abline(m1)
abline(a=m1$coefficients[[1]],b=m1$coefficients[[2]], lty=2, lwd=3, col=2)
plot(x2,y2, xlim = c(3, 19), ylim = c(3, 13), main="m2")
abline(m2)
plot(x3,y3, xlim = c(3, 19), ylim = c(3, 13), main="m3")
abline(m3)
plot(x4,y4, xlim = c(3, 19), ylim = c(3, 13), main="m4")
abline(m4)

