# === Demo kod föreläsning 5 === #
# === Grafik === #

data("iris")
head(iris)

plot(x = iris$Sepal.Length, y = iris$Petal.Length)

plot(x = iris$Sepal.Length, y = iris$Petal.Width)

str(iris)
plot(iris)

plot(x = iris$Sepal.Length, y = iris$Petal.Length, col = "red")

plot(x = iris$Sepal.Length, y = iris$Petal.Length, col = "blue", pch = 3)

col_var <- iris$Species

plot(x = iris$Sepal.Length, y = iris$Petal.Length, col = col_var, pch = 17, cex = 1.4)


data("AirPassengers")

y <- as.numeric(AirPassengers)

plot(x = y, type = 'l', lty = 1, lwd = 2, main = 'AirPassengers')

plot(x = y, type = 'o', lty = 1, lwd = 2, main = 'AirPassengers')

plot(x = y, type = 'l', lty = 3, lwd = 6, main = 'AirPassengers')


class(AirPassengers)

str(AirPassengers)

plot(AirPassengers)

boxplot(y, col = "blue")

hist(y, breaks = 15, col = "purple", freq = FALSE)
hist(y, breaks = 100, col = "purple", freq = TRUE)

?par
par(lwd = 1)
plot(x = y, type = "l", lty = 1, main = "AirPassengers")

# === Slumptal === #

runif(n = 3, min = -1, max = 1)
set.seed(20220221)
runif(n = 3, min = -1, max = 1)

?Distributions

y <- rnorm(n = 1000, mean = 2, sd = 1)

hist(x = y, breaks = 20, freq = FALSE)
mean(y)
sd(y)
summary(y)


x <-  seq(from = -3, to = 3, length = 1000)
y <- dnorm(x = x, mean = 0, sd = 1)
plot(x = x, y = y, t = 'l')
head(cbind(x,y))

text <- c("Statistik","är","roligt")

sample(x = text, size = 4, replace = TRUE)
set.seed(20220221)
sample(x = text, size = 4, replace = TRUE)

sample(x = text, size = 3, replace = FALSE)


sample(x = iris$Species, size = 10, replace = FALSE)

dim(iris)

iris[15,]

rand_index <- sample(x = 150, size = 10, replace = FALSE)
rand_index
iris[rand_index,]

x <- seq (0, 10, length = 1000)
y <- dexp(x = x, rate = .5)
plot(x = x, y = y, t = "l")

abline(h = 0, lty = 3)
abline(v = 0, lty = 3)

z <- rexp(n = 1000, rate = 0.5)
hist(x = z, breaks = 50, freq = FALSE)

pexp(q = 2, rate = 0.5)
p_val <- pexp(q = 2, rate = 0.5)

qexp(p = p_val, rate = 0.5)
qexp(p = 0.9, rate = 0.5)
qexp(p = 0.5, rate = 0.5)
qexp(p = 0.99, rate = 0.5)

# === Markdown === #

# Kolla på
# https://rmarkdown.rstudio.com/

# https://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf

# Markdown file + Notebook

# == pxweb == #

library(pxweb)

min_data <- pxweb_interactive()


# PXWEB query 
pxweb_query_list <- 
  list("Inkomstkomponenter"=c("220"),
       "ContentsCode"=c("HE0103AA"),
       "Tid"=c("1991","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013"))

# Download data 
px_data <- 
  pxweb_get(url = "http://api.scb.se/OV0104/v1/doris/sv/ssd/HE/HE0103/HE0103A/Inksum1",
            query = pxweb_query_list)

# Convert to data.frame 
px_data_frame <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")

# Get pxweb data comments 
px_data_comments <- pxweb_data_comments(px_data)
px_data_comments_df <- as.data.frame(px_data_comments)
