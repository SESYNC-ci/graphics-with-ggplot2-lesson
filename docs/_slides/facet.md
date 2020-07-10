---
---


## Facets

To conclude this overview of [ggplot2](){:.rlib}, we'll apply the same plotting
instructions to different subsets of the data, creating panels or "facets".

The `facet_wrap` function takes a `vars` argument that, like the `aes` function,
relates a variable in the dataset to a visual element, the panels. The
`facet_grid` function works like `facet_wrap`, but expects two variables to
facet by the interaction of a row variable by a column variable.
{:.notes}

===

The gender wage gap apparent in the US Census PUMS data is probably not
consistent across people who obtained different levels of education.

The `wage_gap` plot created above stored it's own copy of the data. To plot the simplified levels of education, we will need to change the input data. Therefore, we need to create a
new `ggplot` foundation using a cleaned up dataset. We can either use the dataset we created earlier, `filter_SCHL` or we can specify the data in the `ggplot` command.
{:.notes}



~~~r
ggplot(pums[pums$SCHL %in% c(16, 21, 22, 24),],
  aes(x = AGEP, y = WAGP)) + 
  geom_point() +
  geom_smooth(
    method = 'lm',
    aes(color = SEX, fill=SEX)) +
  facet_wrap(vars(SCHL))
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}
![ ]({% include asset.html path="images/facet/unnamed-chunk-2-1.png" %})
{:.captioned}

Adding `facet_wrap(vars(SCHL))` creates 4 separate plots, 1 for each level of eduction attainment.
{:.notes}

===

Question
: What wage gap trend do you think is worth investigating, and how might you
do it?

Answer
: {:.fragment} There are so many possibilities! 
