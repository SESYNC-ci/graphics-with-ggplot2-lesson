# Getting Started

library(readr)
pums <- read_csv(
  file = 'data/census_pums/sample.csv',
  col_types = cols_only(
    ... = 'i',
    ... = 'd',
    ... = 'c',
    ... = 'c', 
    ... = 'c'))

## Layered Grammar

library(...)
...(pums, ...(x = WAGP)) +
  ..._histogram()

library(dplyr)
pums <- filter(
  pums,
  WAGP > 0,
  WAGP < max(WAGP, na.rm = TRUE))

...(pums, ...(x = ...)) +
  geom_histogram()

ggplot(pums,
  aes(...)) +
  geom_point()

ggplot(pums,
  aes(x = ..., y = ...)) +
  geom_...

## Layer Customization
... <- pums[pums$SCHL %in% c(16, 21, 22, 24),]

ggplot(...,
  aes(x = SCHL, y = WAGP)) +
  geom_...() +
  
ggplot(...,
         aes(x = SCHL, y = WAGP)) +
  geom_...() +
  geom_...() 

ggplot(filter_SCHL,
  aes(x = SCHL, y = WAGP)) +
  geom_point(...) +
  geom_boxplot()

ggplot(filter_SCHL,
       aes(x = SCHL, y = WAGP)) +
  geom_...(
    color = ...,
    ... = 'summary',
    ... = mean)

## Adding Aesthetics

ggplot(filter_SCHL,
  aes(x = SCHL, y = WAGP, ...)) +
  geom_point(
    stat = 'summary',
    fun = mean)  
  

filter_SCHL$SEX <- factor(filter_SCHL$SEX, levels = ...)

ggplot(filter_SCHL,
       aes(x = SCHL, y = WAGP, color=SEX)) +
  geom_point(
    stat = 'summary',
    fun = mean)

# Storing and Re-plotting

... ggplot(filter_SCHL,
                    aes(x = SCHL, y = WAGP)) +
  geom_boxplot() 

... <- ... +
  geom_point(
    color = 'red',
    stat = 'summary',
    fun = mean)

ggsave(...,
  plot = ...,
  width = 4, height = 3)

# Smooth Lines
... <- ggplot(pums, 
                   aes(x=AGEP, y=WAGP)) +
  geom_point()

... + 
  ...(method = 'lm')

... <- Age_Wage + 
  geom_smooth(method = ..., aes(...))

# Axes, Labels and Themes

... + ...(
  ... = 'Wage Gap',
  x = ...,
  ... = 'Wages (Unadjusted USD)')

... + ...(
  trans = 'log10')


... <- ... + labs(
  title = 'Wage Gap',
  x = 'Age',
  y = 'Wages (Unadjusted USD)') + 
  scale_...(values = ..., 
                     labels = ...) + 
  scale_...(values = ..., 
                    labels = ...) 

... + theme_...() 

... + theme_bw() +
  labs(title = 'Wage Gap') +
  theme(
    ... = element_text(
      face = ...,
      hjust = 0.5))


# Facets

ggplot(pums[pums$SCHL %in% c(16, 21, 22, 24),],
       aes(x = ..., y = ...)) + 
  geom_...() +
  geom_smooth(
    method = 'lm',
    aes(...)) +
  facet_...
