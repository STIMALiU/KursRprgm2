library(ggplot2)
library(ggthemes)

data(Nile)
head(Nile)

p <- ggplot(data = Nile)

Nile2 <- (data.frame(Nile))
colnames(Nile2)
colnames(Nile2) <- "level"
Nile2$years <- 1871:1970
Nile2$level

p <- ggplot(data = Nile2) +
  aes(x = years, y = level) +
  geom_point()
print(p)

Nile2$level <- as.vector(Nile2$level)

print(p)

ggplot(data = Nile2) +
  aes(x = years, y = level) +
  geom_line()


Nile2$period <- "- 1900"
Nile2$period[Nile2$years > 1900] <- "1901 - 1928"
Nile2$period[Nile2$years > 1928] <- "1929 - 1946"
Nile2$period[Nile2$years > 1946] <- "1947 -"
Nile2$period <- as.factor(Nile2$period)
Nile2$period

ggplot(data = Nile2) +
  aes(x = years, y = level, color = period) + 
  geom_line()

Nile2 <- rbind(Nile2, Nile2[Nile2$years == 1901,])
Nile2 <- rbind(Nile2, Nile2[Nile2$years == 1929,])
Nile2 <- rbind(Nile2, Nile2[Nile2$years == 1947,])
tail(Nile2)
Nile2[nrow(Nile2),]$period <- "1929 - 1946"
Nile2[nrow(Nile2)-1,]$period <- "1901 - 1928"
Nile2[nrow(Nile2)-2,]$period <- "- 1900"
tail(Nile2)



ggplot(data = Nile2) +
  aes(x = years, y = level, color = period) +
  geom_line()

ggplot(data = Nile2) +
  geom_line(aes(x = years, y = level, color = period))


Nile2$level2 <- Nile2$level + 100

ggplot(data = Nile2) +
  aes(x = years) +
  geom_line(aes(y = level, color = period)) +
  geom_line(aes(y = level2, color = period))

ggplot(data = Nile2) +
  aes(x = years, y = level, color = period) +
  geom_line(aes(linewidth = period))

p <- ggplot(data = Nile2) +
  aes(x = years, y = level, color = period) +
  geom_line(aes(linetype = period))

p + theme_bw()

p + theme_base()

p + theme_excel_new()

p + theme_dark()

?theme_bw

p + theme_economist()

data("chickwts")
chickwts

p <- ggplot(data = chickwts) +
  aes(x = weight)
print(p)

p + geom_histogram(binwidth = 20)

p + geom_histogram(binwidth = 50) +
  facet_grid(. ~ feed)

p + geom_boxplot() +
  facet_grid(. ~ feed)

p + geom_boxplot(aes(x = feed, y = weight)) +
  xlab("feed")

?geom_boxplot

?geom_histogram

ggplot(data = chickwts) +
  aes(x = weight, after_stat(density)) +
  geom_histogram() +
  geom_density()

data("longley")

ggplot(data = longley, aes(Year, GNP.deflator)) +
  geom_line()

ggplot(data = longley, aes(Year, GNP.deflator)) +
  geom_line() +
  geom_smooth()

ggplot(data = longley, aes(Year, GNP.deflator)) +
  geom_line() +
  geom_smooth(method = "lm")

?geom_smooth

ggplot(data = Nile2, mapping = aes(x = years, y = level, colour = period)) +
  geom_line() +
  scale_color_manual(values = c(4,5,6,1))
  
ggplot(data = Nile2, mapping = aes(x = years, y = level, colour = period)) +
  geom_line() +
  scale_color_manual(values = c("black", "grey", "lightblue", "cyan"))

ggplot(data = Nile2, mapping = aes(x = years, y = level, colour = period)) +
  geom_line(aes(linetype = period)) +
  scale_color_manual(values = c("black", "grey", "lightblue", "cyan"))

ggplot(data = Nile2, mapping = aes(x = years, y = level, colour = period)) +
  geom_line(aes(linetype = period)) +
  scale_color_manual(values = c("black", "grey", "lightblue", "cyan")) +
  scale_linetype_manual(values = c(2,2,1,2,2))

ggplot(data = Nile2) +
  aes(x = years, y = level, color = period) +
  geom_line() +
  scale_color_excel_new()

?scale_color_manual

## tot_df från pxweb_data.R

ggplot(data = tot_df) +
  aes(x = Lägenhet_per_1000, after_stat(density)) +
  geom_histogram()

mu <- mean(tot_df$Lägenhet_per_1000)
se <- sd(tot_df$Lägenhet_per_1000)

x <- seq(min(tot_df$Lägenhet_per_1000), max(tot_df$Lägenhet_per_1000), by = 1)
y <- dnorm(x, mean = mu, sd = se)

ggplot(data = tot_df) +
  aes(x = Lägenhet_per_1000, after_stat(density)) +
  geom_histogram() +
  geom_line(mapping = aes(x = x, y = y, color = "red"), data = data.frame(x = x, y = y))

?geom_density

?lm

data("trees")

x <- lm(formula = Volume ~ Girth, data = trees)
str(x)
plot(x)

qplot(x)

plot(tot_df)
