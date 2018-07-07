---
---

## Facets

To conclude this overview of [ggplot2](){:.rlib}, we'll apply the same plotting
instructions to different subsets of the data, creating panels or "facets". The
`facet_wrap` function takes a `vars` argument that, like the `aes` function
relates a variable in the dataset to a visual element, the panels.

===



~~~r
animals_common <- filter(animals,
  species_id %in% c('DM', 'PP', 'DO'))
faceted <- ggplot(
  animals_common, aes(x = weight)) +
  geom_histogram() +
  facet_wrap(vars(species_id)) +
  labs(title =
       'Weight of most common species',
       x = 'Count',
       y = 'Weight (g)')
~~~
{:.text-document title="{{ site.handouts[0] }}"}



~~~r
> faceted
~~~
{:.input title="Console"}
![ ]({{ site.baseurl }}/images/facet/plot_facets-1.png)
{:.captioned}

===

The un-grouped data may be added as a layer on each panel, but you have to drop
the grouping variable (i.e. `month`).



~~~r
faceted_all <- faceted +
  geom_histogram(data =
    select(animals_common, -species_id),
    alpha = 0.2)
~~~
{:.text-document title="{{ site.handouts[0] }}"}



~~~r
> faceted_all
~~~
{:.input title="Console"}
![ ]({{ site.baseurl }}/images/facet/plot_facets_all-1.png)
{:.captioned}
