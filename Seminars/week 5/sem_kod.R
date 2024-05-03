?Distributions

x <- rnorm(n = 100000, mean = 1, sd = 4)
plot(x)
mean(x)

set.seed(1)
n <- 1000
# Simulera punkter i kvadraten
x <- runif(n = n, min = 0, max = 1)
y <- runif(n = n, min = 0, max = 1)
plot(x = x, y = y)

# Beräkna sannolikheten att vara inne i cirkeln
innuti <- x^2+y^2 <= 1

plot(x = x, y = y, col = innuti)
points(x = x[!innuti], y = y[!innuti], col = "red")
sannolikhet <- sum(innuti)/length(innuti)

pi_est <- 4 * sannolikhet
