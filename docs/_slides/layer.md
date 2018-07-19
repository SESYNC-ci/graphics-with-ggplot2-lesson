---
---

## Getting Started

Let's start by loading a few packages along with a sample dataset, which is the *animals* table from the [Portal Project Teaching Database](https://figshare.com/articles/Portal_Project_Teaching_Database/1314459).

===



~~~r
library(dplyr)
animals <- read.csv('data/animals.csv',
  na.strings = '') %>%
  select(year, species_id, sex, weight) %>%
  na.omit()
~~~
{:.text-document title="{{ site.handouts[0] }}"}


Omitting rows that have missing values for the `species_id`, `sex`, and `weight` columns is not strictly necessary, but it will prevent ggplot from returning missing values warnings.
{:.notes}

===

### Layered Graphics

As a first example, this code plots each invidual's weight by species:



~~~r
library(ggplot2)
ggplot(animals,
       aes(x = species_id, y = weight)) +
  geom_point()
~~~
{:.text-document title="{{ site.handouts[0] }}"}
![ ]({{ site.baseurl }}/images/layer/plot_pt-1.png)
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
![ ]({{ site.baseurl }}/images/layer/plot_box-1.png)
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
![ ]({{ site.baseurl }}/images/layer/plot_pt_box_plain-1.png)
{:.captioned}

===

Each `geom_*` object accepts arguments to customize that layer. Many arguments are
common to multiple `geom_*` functions, such as those for adding blanket styling 
to the layer.



~~~r
ggplot(animals,
       aes(x = species_id, y = weight)) +
  geom_boxplot() +
  geom_point(color = 'red')
~~~
{:.text-document title="{{ site.handouts[0] }}"}
![ ]({{ site.baseurl }}/images/layer/unnamed-chunk-2-1.png)
{:.captioned}

The `color` specification was not part of aesthetic mapping between data and
visual elements, so it applies to the entire layer.
{:.notes}

===

The `stat` parameter, in conjunction with `fun.y`, provide the ability
to perform on-the-fly data transformations.



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
![ ]({{ site.baseurl }}/images/layer/unnamed-chunk-3-1.png)
{:.captioned}

===

The `geom_point` layer definition illustrates two features:

- With `stat = 'summary'`, the plot replaces the raw data with the result of a
  summary function, defined by `fun.y`.
- Setting `color = red` applies one color to the whole layer.

===

Associating color (or any attribute, like the shape of points) to a variable is
another kind of aesthetic mapping. Passing the `color` argument to the `aes`
function works quite differently than assiging color to a `geom_*`.

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
![ ]({{ site.baseurl }}/images/layer/plot_box_color-1.png)
{:.captioned}
