---
---

## Exercises

===

### Exercise 1

Use `ggplot` to show how the mean wage earned in the U.S. varies with age,
showing males and females in different colors. (Hint: Baby steps! Start with a
scatterplot of wage by age. Then expand your code to plot only the means. Then
distinguish sexes by color.)

===

### Exercise 2

Create a histogram, using a `geom_histogram` layer, of the wages earned by
females and males, with sex distinguished by the color of the bar's interior. To
silence that warning you're getting, open the help with `?geom_histogram` and
determine how to explicitly set the bin width.

===

### Exercise 3

The `facet_grid` layer (different from `facet_wrap`) requires an argument for
both row and column varaibles, creating a grid of panels. Create a plot with 8
facets, each displaying a single histogram of wage earned by women or men having
one of the four education attainment levels. Make the grid have 2 rows and 4
columns. *Advanced challenge*: add a second, partially transparent, histogram to
the background of each facet that provides a comparison to the whole population.
(Hint: the second histogram should not inherit the dataset from the `ggplot`
foundation.)

===

## Solutions



~~~r
ggplot(pums,
  aes(x = AGEP, y = WAGP, color = SEX)) +
  geom_line(stat = 'summary',
            fun.y = 'mean')
~~~
{:title="Solution 1" .text-document}


~~~
Warning: Ignoring unknown parameters: fun.y
~~~
{:.output}


~~~
No summary function supplied, defaulting to `mean_se()`
~~~
{:.output}
![ ]({% include asset.html path="images/exercise/unnamed-chunk-1-1.png" %})
{:.captioned}



~~~r
ggplot(pums,
  aes(x = WAGP, fill = SEX)) +
  geom_histogram(binwidth = 10000)
~~~
{:title="Solution 2" .text-document}
![ ]({% include asset.html path="images/exercise/unnamed-chunk-2-1.png" %})
{:.captioned}



~~~r
ggplot(na.omit(pums),
  aes(x = WAGP)) +
  geom_histogram(bins = 20) +
  facet_grid(vars(SEX), vars(SCHL))
~~~
{:title="Solution 3" .text-document}
![ ]({% include asset.html path="images/exercise/unnamed-chunk-3-1.png" %})
{:.captioned}

For the advanced challenge, you must supply a dataset to a second gemo_histogram
that does not have the variable specified in `facet_grid`. Note that
`facet_grid` affects the entire plot, including layers added "after faceting",
as in the solution below.



~~~r
ggplot(na.omit(pums),
  aes(x = WAGP)) +
  geom_histogram(bins = 20) +
  facet_grid(vars(SEX), vars(SCHL)) +
  geom_histogram(
    bins = 20,
    data = na.omit(pums['WAGP']),
    alpha = 0.5)
~~~
{:title="Solution 3 (challenge)" .text-document}
![ ]({% include asset.html path="images/exercise/unnamed-chunk-4-1.png" %})
{:.captioned}
