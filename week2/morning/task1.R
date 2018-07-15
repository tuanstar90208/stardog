# 第二周任務
library(ggplot2)
attitude

ggplot(data = attitude, aes(x = rating)) +
  geom_bar(fill = "lightgreen", colour = "black")

ggplot(data = attitude, aes(x = rating, y=learning)) +
  geom_point()

ggplot(attitude, aes(x=rating, y=learning)) +
  geom_boxplot()

