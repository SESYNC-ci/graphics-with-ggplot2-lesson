## Getting started

library(dplyr)
animals <- read.csv('ata/animals.csv', na.strings = '') %>%
  select(...) %>%
  na.omit()

## Constructing layered graphics in ggplot

library(...)
ggplot(...,
       ...) +
  ...

ggplot(animals,
       aes(x = species_id, y = weight)) +
  ... +
  ...

ggplot(animals,
  aes(x = species_id, y = weight)) +
  geom_boxplot() ...
  geom_point(...,
             ...,
             ...)

ggplot(animals,
  aes(x = species_id, y = weight,
    ...)) +
  geom_boxplot() +
  geom_point(stat = 'summary',
             fun.y = 'mean')

## Exercise 1

...

## Adding a regression line

levels(animals$sex) <- c('Female', 'Male')
animals_dm <- filter(animals, ...)
ggplot(...,
  aes(x = year, y = weight, ...)) +
  geom_point(...,
             stat = 'summary',
             fun.y = 'mean') +
  ...

ggplot(animals_dm,
  aes(x = year, y = weight,
    shape = sex, color = sex)) +
  geom_point(size = 3,
    stat = 'summary',
    fun.y = 'mean') +
  geom_smooth(...)

# Storing and re-plotting

year_wgt <- ggplot(data = animals_dm,
  aes(x = year, y = weight,
    color = sex, shape = sex)) +
  geom_point(size = 3,
    stat = 'summary',
    fun.y = 'mean') +
  geom_smooth(method = 'lm')

year_wgt <- year_wgt +
  scale_color_manual(... = c("black", ...))

## Exercise 2

...

## Axes, labels and themes

histo <- ggplot(animals_dm,
  aes(x = weight, fill = sex)) +
  geom_...

histo <- histo + ...(
  title = 'Dipodomys merriami weight distribution',
  x = 'Weight (g)',
  y = 'Count')

histo <- histo + scale_x_continuous(
  ...,
  ... = c(20, 30, 40, 50, 60))

histo <- histo + theme_bw() + theme(
  legend.position = c(0.2, 0.5),
  plot.title = ...,
  ... = element_text(...),
  ... = element_text(size = 13, vjust = 0))

## Facets

animals_common <- filter(
  animals,
  ... %in% c(...))
faceted <- ggplot(...,
  ...) +
  geom_histogram() +
  ...
  labs(title = "Weight of most common species",
       x = "Count",
       y = "Weight (g)")

faceted_all <- faceted + geom_histogram(
  ...,
  ...)

faceted_density <- ggplot(animals_common,
  aes(x = weight, ...)) +
  geom_histogram(...) +
  facet_wrap( ~ species_id) +
  labs(title = "Weight of most common species",
       x = "Count",
       y = "Weight (g)")

## Exercise 3

...
