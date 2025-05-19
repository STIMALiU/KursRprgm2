library(ggplot2)
library(ggthemes)

data("mpg")
head(mpg)

p <- ggplot(data = mpg) +
  geom_point(aes(x = cty, y = hwy, colour = drv)) +
  geom_point(aes(x = cty, y = displ, colour = drv))
p

p <- ggplot(data = mpg) +
  aes(x = cty, y = hwy, colour = drv) +
  geom_point()
p

p + scale_color_excel_new()
p + scale_color_economist()
p + scale_color_manual(
  values = c("gray", "black", "red")
)
p + scale_color_manual(
  values = c("r" = "gray", "f" = "red", "4" = "black")
)
p + scale_color_manual(
  values = c("r" = "gray", "f" = "red", "4" = "black"),
  labels = c("4" = "Fyrhjulsdrift", 
             "f" = "Framhjulsdrift", 
             "r" = "Bakhjulsdrift")
)
p1 <- p + scale_color_manual(
  values = c("r" = "#62f0b5", "f" = "red", "4" = "#dd5fe8"),
  labels = c("4" = "Fyrhjulsdrift", 
             "f" = "Framhjulsdrift", 
             "r" = "Bakhjulsdrift"),
  name = "Drivningstyp" 
)
p1 + theme_economist()
p1 + theme_clean()
p1 + theme_minimal()
p1 + theme_excel_new()
p1 + theme_bw()
p1 + theme_wsj()
p + theme_bw()
?theme
p1
p1 + theme_calc()

p2 <- ggplot(data = mpg) +
  aes(x = cty, y = hwy, shape = drv, colour = drv) +
  geom_point()
p2

p2 + scale_shape_manual(
  values = c("4" = 9, "r" = 3, "f" = 8),
  labels = c("4" = "Fyrhjulsdrift", 
             "f" = "Framhjulsdrift", 
             "r" = "Bakhjulsdrift"),
  name = "Drivningstyp" 
) + scale_color_manual(
  values = c("r" = "#62f0b5", "f" = "red", "4" = "#dd5fe8"),
  labels = c("4" = "Fyrhjulsdrift", 
             "f" = "Framhjulsdrift", 
             "r" = "Bakhjulsdrift"),
  name = "Drivningstyp" 
)

data(Nile)
?Nile

p <- ggplot(data = Nile)
Nile2 <- as.data.frame(Nile)
colnames(Nile2)
colnames(Nile2) <- "level"
colnames(Nile2)
Nile2$years <- 1871:1970

p <- ggplot(data = Nile2) +
  aes(x = years, y = level) + 
  geom_point()
p
Nile2$level <- as.vector(Nile2$level)
p <- ggplot(data = Nile2) +
  aes(x = years, y = level) + 
  geom_point()
p
p + geom_line()
p + geom_path()

x <- rnorm(100)
y <- x^2
df <- data.frame(x = x, y = y)

p3 <- ggplot(data = df) +
  aes(x = x, y = y) +
  geom_point()
p3
p3 + geom_line()
p3 + geom_path()

p + geom_line()

Nile2$period <- "- 1900"
Nile2$period[Nile2$years > 1900] <- "1901 - 1928"
Nile2$period[Nile2$years > 1928] <- "1929 - 1946"
Nile2$period[Nile2$years > 1946] <- "1947 -"

p <- ggplot(data = Nile2) +
  aes(x = years, y = level, color = period) +
  geom_line()
p

Nile2 <- rbind(Nile2, Nile2[Nile2$years == 1901,] )
Nile2 <- rbind(Nile2, Nile2[Nile2$years == 1929,] )
Nile2 <- rbind(Nile2, Nile2[Nile2$years == 1947,] )

tail(Nile2)
Nile2[nrow(Nile2)-2,]$period <- "- 1900"
Nile2[nrow(Nile2)-1,]$period <- "1901 - 1928"
Nile2[nrow(Nile2),]$period <- "1929 - 1946"
tail(Nile2)

p1 <- ggplot(data = Nile2) +
  aes(x = years, y = level, color = period) +
  geom_line()
p1

data("chickwts")

p <- ggplot(data = chickwts) +
  aes(x = weight) +
  geom_histogram(binwidth = 50)
p + facet_grid(. ~ feed)
p + facet_grid(feed ~ .)

p <- ggplot(data = chickwts) +
  aes(x = weight, after_stat(density)) +
  geom_histogram(binwidth = 50)
p
p + geom_density()
?geom_density

p <- ggplot(data = chickwts) +
  aes(x = weight) +
  geom_boxplot()
p + facet_grid(. ~ feed)

ggplot(data = chickwts) +
  aes(x = weight, y = feed) +
  geom_boxplot()
p + facet_grid(feed ~ .)

p1 <- ggplot(data = chickwts) +
  aes(x = feed, y = weight) +
  geom_boxplot(fill = "red")
p1
?geom_boxplot
