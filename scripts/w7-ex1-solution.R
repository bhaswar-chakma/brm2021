library(dplyr)
library(ggplot2)
library(gapminder)
# data
df <-  gapminder %>%
  filter(year == 2007) %>% 
  mutate(pop_m = pop/1e6)

# fig1
ggplot(df, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# fig2
ggplot(df, aes(x = gdpPercap, y = lifeExp, color = continent)) + 
  geom_point()

# fig3
ggplot(df, aes(x = gdpPercap, y = lifeExp, shape = continent)) + 
  geom_point()

# fig4
ggplot(df, aes(x = gdpPercap, y = lifeExp, size = pop_m, color = continent)) + 
  geom_point()
