---
---

## Facets

To conclude this overview of ggplot2, here are a few examples that show different subsets of the data in panels called *facets*.
The `facet_wrap` function takes a *formula* argument that specifies the grouping on either side of a '~' using a factor in the data.


~~~r
animals_common <- filter(animals, species_id %in% c('DM', 'PP', 'DO'))
ggplot(data = animals_common,
       aes(x = weight)) +
  geom_histogram() +
  facet_wrap( ~ species_id) +
  labs(title = "Weight of most common species",
       x = "Count",
       y = "Weight (g)")
~~~
{:.text-document title="{{ site.handouts }}"}

===

![plot of chunk plot_facets]({{ site.baseurl }}/images/plot_facets-1.png)
{:.captioned}

===

The un-grouped data may be added as a layer on each panel, but you have to drop the grouping variable (i.e. *month*).


~~~r
ggplot(data = animals_common,
       aes(x = weight)) +
  geom_histogram(data = select(animals_common, -species_id),
                 alpha = 0.2) +
  geom_histogram() +
  facet_wrap( ~ species_id) +
  labs(title = "Weight of most common species",
       x = "Count",
       y = "Weight (g)")
~~~
{:.text-document title="{{ site.handouts }}"}

===

![plot of chunk plot_facets_2]({{ site.baseurl }}/images/plot_facets_2-1.png)
{:.captioned}

===

Finally, let's show off some additional styling and the very unusual `..density..` argument in the aesthetic.
The `..` notation signifies that ggplot is to calculate the probability density, rather than plot frequency as before.


~~~r
ggplot(data = animals_common,
       aes(x = weight, fill = species_id)) +
  geom_histogram(data = select(animals_common, -month),
                 aes(y = ..density..),
                 fill = "black") +
  geom_histogram(aes(y = ..density..),
                 alpha = 0.8) +
  facet_wrap( ~ species_id) +
  labs(title = "Weight of most common species",
       x = "Count",
       y = "Weight (g)") +
  guides(fill = FALSE)								 
~~~
{:.text-document title="{{ site.handouts }}"}

===

![plot of chunk plot_facets_3]({{ site.baseurl }}/images/plot_facets_3-1.png)
{:.captioned}

===

## Exercise 3

The formula notation for `facet_grid` (different from `facet_wrap`) interprets left-side variables as one axis and right-side variables as another. For these three common animals, create facets in the weight histogram along two categorical variables, with a row for each sex and a column for each species.

[View solution](#solution-3)
{:.notes}
