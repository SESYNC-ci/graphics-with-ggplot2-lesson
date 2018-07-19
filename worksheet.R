## Getting started

library(dplyr)
animals <- read.csv('data/animals.csv',
    na.strings = '') %>%
  select(year, species_id, sex, weight) %>%
  na.omit()

## Layered graphics

library(...)
ggplot(...,
       ...) +
  ...

ggplot(animals,
       aes(x = species_id, y = weight)) +
  ...

ggplot(animals,
       aes(x = species_id, y = weight)) +
  geom_boxplot() ...
  ...

ggplot(animals,
       aes(x = species_id, y = weight)) +
  geom_boxplot() +
  geom_point(...)

ggplot(animals,
       aes(x = species_id, y = weight)) +
  geom_boxplot() +
  geom_point(
    color = 'red',
    ...,
    ...)

ggplot(animals,
       aes(x = species_id, y = weight,
           ...)) +
  geom_boxplot() +
  geom_point(stat = 'summary',
             fun.y = 'mean')

## Smooth lines

...(animals$sex) <- c('Female', 'Male')
animals_dm <- filter(animals,
  species_id == 'DM')

ggplot(...,
  aes(x = year, y = weight, ...)) +
  geom_point(...,
    stat = 'summary', fun.y = 'mean') +
  ...

ggplot(animals_dm,
  aes(x = year, y = weight,
    shape = sex, color = sex)) +
  geom_point(size = 3,
    stat = 'summary', fun.y = 'mean') +
  geom_smooth(...)

# Storing and re-plotting

... ggplot(animals_dm,
  aes(x = year, y = weight,
    color = sex, shape = sex)) +
  geom_point(size = 3,
    stat = 'summary',
    fun.y = 'mean') +
  geom_smooth(method = 'lm')

year_wgt <- year_wgt +
  scale_color_manual(
    ... = c("black", ...))

...(filename = 'year_wgt.pdf',
    ...
    width = 4, height = 3)

## Axes, labels and themes

histo <- ggplot(animals_dm,
  aes(x = weight, fill = sex)) +
  geom_...

histo <- histo + ...(title =
  'Size of Dipodomys merriami',
  ...
  y = 'Count')

histo <- histo + scale_x_continuous(
  ...,
  ... = c(20, 30, 40, 50, 60))

histo <- ggplot(animals_dm,
  aes(x = weight,
      ...,
      ...)) +
  geom_histogram(binwidth = 3,
    color = 'white') +
  labs(title = 
    'Size of Dipodomys merriami',
    x = 'Weight (g)',
    ...)

histo <- histo + ... + theme(
  legend.position = c(0.2, 0.5),
  plot.title = ...(
    ...),
  ... = element_text(
    ...),
  ... = element_text(
    size = 13, vjust = 0))

## Facets

animals_common <- filter(animals,
  species_id %in% c('DM', 'PP', 'DO'))
faceted <- ggplot(...,
  ...) +
  geom_histogram() +
  ...
  labs(title =
       "Weight of most common species",
       x = "Count",
       y = "Weight (g)")

faceted_all <- faceted +
  geom_histogram(data =
    select(animals_common, ...),
  ...)

