---
---

## Getting started

Let's start by loading a few packages along with a sample dataset, which is the *animals* table from the [Portal Project Teaching Database](https://figshare.com/articles/Portal_Project_Teaching_Database/1314459).

===


~~~r
library(dplyr)
animals <- read.csv('data/animals.csv', na.strings = '') %>%
  select(year, species_id, sex, weight) %>%
  na.omit()
~~~
{:.text-document title="{{ site.handouts[0] }}"}

Omitting rows that have missing values for the `species_id`, `sex`, and `weight` columns is not strictly necessary, but it will prevent ggplot from returning missing values warnings.
{:.notes}

===

## Layered graphics

As a first example, this code plots each invidual's weight by species:


~~~r
library(ggplot2)
ggplot(animals,
       aes(x = species_id, y = weight)) +
  geom_point()
~~~
{:.text-document title="{{ site.handouts[0] }}"}

![plot of chunk plot_pt]({{ site.baseurl }}/images/plot_pt-1.png)
{:.captioned}

===

The `ggplot` command expects a data frame and an aesthetic mapping. The `aes` function creates the aesthetic, a mapping between variables in the data frame and visual elements in the plot. Here, the aesthetic maps `species_id` to the x-axis and `weight` to the y-axis.

===

The `ggplot` function by itself does not display anything until we add a `geom_*` layer, in this example a `geom_point`. Layers are literally added, with `+`, to the object created by the `ggplot` function.

===

Individual points are hard to distinguish in this plot. Might a boxplot be a better visualization? The only change needed is in the `geom_*` layer.


~~~r
ggplot(animals,
       aes(x = species_id, y = weight)) +
  geom_boxplot()
~~~
{:.text-document title="{{ site.handouts[0] }}"}

![plot of chunk plot_box]({{ site.baseurl }}/images/plot_box-1.png)
{:.captioned}

===

Add `geom_*` layers together to create a multi-layered plot:


~~~r
ggplot(animals,
       aes(x = species_id, y = weight)) +
  geom_boxplot() +
  geom_point()
~~~
{:.text-document title="{{ site.handouts[0] }}"}

![plot of chunk plot_pt_box_plain]({{ site.baseurl }}/images/plot_pt_box_plain-1.png)
{:.captioned}

===

Each `geom_*` object accepts some general and some specialized arguments. For styling with shapes and colors, or for performing some dplyr-like data transformations.

===


~~~r
ggplot(animals,
       aes(x = species_id, y = weight)) +
  geom_boxplot() +
  geom_point(
    color = 'red',
    stat = 'summary',
    fun.y = 'mean')
~~~
{:.text-document title="{{ site.handouts[0] }}"}

![plot of chunk plot_pt_box]({{ site.baseurl }}/images/plot_pt_box-1.png)
{:.captioned}

===

The `geom_point` layer definition illustrates these features:

- With `stat = 'summary'`, the plot replaces the raw data with the result of a summary function, defined by `fun.y`.
- Setting `color = red` applies one color to the whole layer.

===

Associating color (or any attribute, like the shape of points) to a variable is another kind of aesthetic mapping. Passing the `color` argument to the `aes` function works quite differently than assiging color to a `geom_*`.

===


~~~r
ggplot(animals,
       aes(x = species_id, y = weight,
           color = species_id)) +
  geom_boxplot() +
  geom_point(stat = 'summary',
             fun.y = 'mean')
~~~
{:.text-document title="{{ site.handouts[0] }}"}

![plot of chunk plot_box_color]({{ site.baseurl }}/images/plot_box_color-1.png)
{:.captioned}

===

<!--
### Quick plotting with qplot

The `qplot` function provides a shortcut to `ggplot` that looks more like the base R `plot` function, e.g. `qplot(x = species_id, y = weight, data = animals, geom = "boxplot")`. This can be useful to quickly produce simple graphs, especially those with a single geom.

===
-->

## Exercise 1

Use dplyr to filter down to the animals with `species_id` equal to DM. Use `ggplot` to show how the mean weight of this species changes each year, showing males and females in different colors. (Hint: Baby steps! Start with a scatterplot of weight by year. Then expand your code to plot only the means. Then try to distinguish sexes.)

[View solution](#solution-1)
{:.notes}
