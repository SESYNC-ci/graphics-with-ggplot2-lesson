---
---

## Getting started

Let's start by loading a few packages along with a sample dataset, which is the *animals* table from the [Portal Project Teaching Database](https://figshare.com/articles/Portal_Project_Teaching_Database/1314459).

We filter the data to remove rows that have missing values for the species\_id, sex, or weight columns. (This is not strictly necessary, but it will prevent ggplot from returning missing values warnings.)
{:.notes}


~~~r
library(dplyr)
library(ggplot2)
animals <- read.csv("data/animals.csv", na.strings = "") %>%
    filter(!is.na(species_id), !is.na(sex), !is.na(weight))
~~~
{:.text-document title="{{ site.handouts }}"}

===

## Constructing layered graphics in ggplot

As a first example, this code plots the inviduals' weights by species:

~~~r
ggplot(data = animals,
       aes(x = species_id, y = weight)) +
  geom_point()
~~~
{:.text-document title="{{ site.handouts }}"}

![plot of chunk plot_pt]({{ site.baseurl }}/images/plot_pt-1.png)

In `ggplot`, we specified a data frame (*animals*) and a number of aesthetic mappings (`aes`). The `aes` function associates variables from that data frame to visual elements in the plot: here, *species_id* on the x-axis and *weight* on the y-axis. The `ggplot` function by itself does not plot anything until we add a *geom* layer such as `geom_point`. In this particular case, individual points are hard to distinguish; what could we use instead? (Try `geom_boxplot`.)

===

Multiple geom layers can be combined in a single plot:


~~~r
ggplot(data = animals,
       aes(x = species_id, y = weight)) +
  geom_boxplot() +
  geom_point(stat = "summary",
             fun.y = "mean",
             color = "red")
~~~
{:.text-document title="{{ site.handouts }}"}

![plot of chunk plot_box]({{ site.baseurl }}/images/plot_box-1.png)

===

The `geom_point` layer definition illustrates a couple new features:

- With `stat = "summary"`, we can plot a summary statistic (defined by `fun.y`) instead of the raw data.
- Setting `color = red` applies one color to the whole layer.

===

To associate color (or some other attribute, like point shape) to a variable, it needs to be specified within an `aes` function.


~~~r
ggplot(data = animals,
       aes(x = species_id, y = weight, color = species_id)) +
  geom_boxplot() +
  geom_point(stat = "summary",
             fun.y = "mean")
~~~
{:.text-document title="{{ site.handouts }}"}

![plot of chunk plot_box_color]({{ site.baseurl }}/images/plot_box_color-1.png)

===

<!--
### Quick plotting with qplot

The `qplot` function provides a shortcut to `ggplot` that looks more like the base R `plot` function, e.g. `qplot(x = species_id, y = weight, data = animals, geom = "boxplot")`. This can be useful to quickly produce simple graphs, especially those with a single geom.

===
-->

## Exercise 1

Using `dplyr` and `ggplot` show how the mean weight of individuals of the species *DM* changes over time, with males and females shown in different colors.

[View solution](#solution-1)
{:.notes}
