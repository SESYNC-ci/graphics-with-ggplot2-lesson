---
---

## Exercises

===

### Exercise 1

Use dplyr to filter down to the animals with `species_id` equal to DM. Use
`ggplot` to show how the mean weight of this species changes each year, showing
males and females in different colors. (Hint: Baby steps! Start with a
scatterplot of weight by year. Then expand your code to plot only the means.
Then try to distinguish sexes.)

[View solution](#solution-1)
{:.notes}

===

### Exercise 2

Create a histogram, using a `geom_histogram` layer, of the weights of
individuals of species DM and divide the data by sex. Note that instead of using
`color` in the aesthetic, you'll use `fill` to distinguish the sexes. To silence
that warning, open the help with `?geom_histogram` and determine how to
explicitly set the bin width.

[View solution](#solution-2)
{:.notes}

===

### Exercise 3

The `facet_grid` layer (different from `facet_wrap`) requires an argument for
both row and column varaibles, creating a grid of panels. For these three common
animals, create facets in the weight histogram along two categorical variables,
with a row for each sex and a column for each species.

[View solution](#solution-3)
{:.notes}

===
## Solutions

===

### Solution 1



~~~r
animals_dm <- filter(animals, species_id == 'DM')
ggplot(animals_dm,
       aes(x = year, y = weight, color = sex)) +
  geom_line(stat = 'summary',
            fun.y = 'mean')
~~~
{:.text-document title="{{ site.handouts[0] }}"}
![ ]({{ site.baseurl }}/images/exercise/sol1-1.png)
{:.captioned}

[Return](#exercise-1)
{:.notes}

===

### Solution 2



~~~r
filter(animals, species_id == 'DM') %>%
  ggplot(aes(x = weight, fill = sex)) +         
  geom_histogram(binwidth = 1)
~~~
{:.text-document title="{{ site.handouts[0] }}"}
![ ]({{ site.baseurl }}/images/exercise/sol2-1.png)
{:.captioned}

[Return](#exercise-2)
{:.notes}

===

### Solution 3



~~~r
ggplot(animals_common,
       aes(x = weight)) +
  geom_histogram() +
  facet_grid(vars(sex), vars(species_id)) +
  labs(title = 'Weight of common species by sex',
       x = 'Count',
       y = 'Weight (g)')
~~~
{:.text-document title="{{ site.handouts[0] }}"}
![ ]({{ site.baseurl }}/images/exercise/sol3-1.png)
{:.captioned}

[Return](#exercise-3)
{:.notes}
