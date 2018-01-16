---
---

## Facets

To conclude this overview of ggplot2, we'll apply the same plotting instructions
to different subsets of the data in panels called "facets". The `facet_wrap`
function takes a `formula` argument that specifies the grouping on either side
of a '~' using a factor in the data.

===


~~~r
animals_common <- filter(animals,
  species_id %in% c('DM', 'PP', 'DO'))
faceted <- ggplot(
  animals_common, aes(x = weight)) +
  geom_histogram() +
  facet_wrap( ~ species_id) +
  labs(title =
       "Weight of most common species",
       x = "Count",
       y = "Weight (g)")
~~~
{:.text-document title="{{ site.handouts[0] }}"}

~~~r
faceted
~~~
{:.input}

![plot of chunk plot_facets]({{ site.baseurl }}/images/plot_facets-1.png)
{:.captioned}

===

The un-grouped data may be added as a layer on each panel, but you have to drop the grouping variable (i.e. `month`).


~~~r
faceted_all <- faceted +
  geom_histogram(data =
    select(animals_common, -species_id),
    alpha = 0.2)
~~~
{:.text-document title="{{ site.handouts[0] }}"}

~~~r
faceted_all
~~~
{:.input}

![plot of chunk plot_facets_all]({{ site.baseurl }}/images/plot_facets_all-1.png)
{:.captioned}

===

Finally, let's show off some additional styling with `fill` and the very unusual
`..density..` aesthetic. The `..` notation is shared by several ggplot functions
that perform a calculation. Using `..density..` as the y-axis variable allows a
geometry to display the probability density of variable assigned to the x-axis.

===


~~~r
faceted_density <- ggplot(
  animals_common,
  aes(x = weight, fill = species_id)) +
  geom_histogram(aes(y = ..density..)) +
  facet_wrap( ~ species_id) +
  labs(title =
    "Weight of most common species",
    x = "Count",
    y = "Weight (g)")
~~~
{:.text-document title="{{ site.handouts[0] }}"}

~~~r
faceted_density
~~~
{:.input}

![plot of chunk plot_facets_density]({{ site.baseurl }}/images/plot_facets_density-1.png)
{:.captioned}

===

## Exercise 3

The formula notation for `facet_grid` (different from `facet_wrap`) interprets left-side variables as one axis and right-side variables as another. For these three common animals, create facets in the weight histogram along two categorical variables, with a row for each sex and a column for each species.

[View solution](#solution-3)
{:.notes}
