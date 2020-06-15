---
---



## Getting Started

The dataset you will plot is an example of Public Use Microdata Sample (PUMS)
produced by the US Census Bureau. You can find more about this data [here] (https://www.census.gov/programs-surveys/acs/technical-documentation/pums/about.html). 

In this lesson, we'll explore the wage gap between men and women.

The file to be loaded contains individuals' anonymized responses to the 5 Year
American Community Survey (ACS) completed in 2017. There are over a hundred
variables giving individual level data on household members income, education,
employment, ethnicity, and much more.
{:.notes}

===
The data columns we will use in this lesson are age (AGEP), wages over the past 12 months (WAGP), educational attainment (SCHL),  and sex (SEX)



~~~r
library(readr)
pums <- read_csv(
  file = 'data/census_pums/sample.csv',
  col_types = cols_only(
    AGEP = 'i',
    WAGP = 'd',
    SCHL = 'c',
    SEX = 'c'))
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}


The [readr](){:.rlib} package gives additional flexibility and speed over the
base R `read.csv` function. The CSV contains 4 million rows, equating to several
gigabytes, so a sample suffices while developing ideas for visualiztion.
{:.notes}

===

### Layered Grammar

First, we will explore the data by plotting a histogram of the wages (WAGP) of all the individuals in the data set. The code to plot the histogram calls three functions: `ggplot`, `aes`, and `geom_histogram` from the [ggplot2](){:.rlib} package.

===

- `ggplot` creates the foundation
- `aes` specifies an aesthetic mapping
- `geom_histogram` adds a layer of visual elements



~~~r
library(ggplot2)
ggplot(data = pums, aes(x = WAGP)) +
  geom_histogram()
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}
![ ]({% include asset.html path="images/layer/unnamed-chunk-3-1.png" %})
{:.captioned}

The `ggplot` command expects a data frame and an aesthetic mapping. 

- The data is specified (`data = pums`). 

- The `aes` function creates the aesthetic, a mapping between variables in the data frame and visual elements in the plot. Here, the aesthetic maps `WAGP` to the
x-axis; a histogram only needs one variable mapped. {:.notes}

The `ggplot` function by itself only creates the axes, because only the
aesthetic map has been defined. No data are plotted until the addition of a
`geom_*` layer, in this example a `geom_histogram`. Layers are literally added,
with `+`, to the object created by the `ggplot` function.
{:.notes}

===

Plotting histograms is always a good idea when exploring data. The zeros and
the "top coded" value used for high wage-earners in PUMS are outliers. So we will now "filter" the data to remove individuals with a wage of 0 and the "top-coded" high earners)



~~~r
library(dplyr)
pums <- filter(
  pums,
  WAGP > 0,
  WAGP < max(WAGP, na.rm = TRUE))
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}


The [dplyr](){:.rlib} package provides tools for manipulating tabular data. It
is an essential accompaniment to [ggplot2](){:.rlib}.
{:.notes}

===

Now, we can remake the histogram with the filtered data set in the same way. 



~~~r
ggplot(data = pums, aes(x = WAGP)) +
  geom_histogram()
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}
![ ]({% include asset.html path="images/layer/unnamed-chunk-5-1.png" %})
{:.captioned}

===

The `geom_histogram` aesthetic only involves one variable. A scatterplot
requires two, both an `x` and a `y`. We can use a scatterplot to look at the relationship between age and wage. 



~~~r
ggplot(pums,
  aes(x = AGEP, y = WAGP)) +
  geom_point()
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}
![ ]({% include asset.html path="images/layer/unnamed-chunk-6-1.png" %})
{:.captioned}

The `aes` function can map variable to more than just the `x` and `y` axes in a
plot. There are several other "scales" that exist, although whether and how they
show up depends on the `geom_*` layer. Commonly used arguments are `color` for
line or edge color and `fill` for interior colors, but [many more are
available](https://ggplot2.tidyverse.org/articles/ggplot2-specs.html).
{:.notes}

===

The aesthetic and the geometry are entirely independent, making it easy to
experiment with very different kinds of visual representations. The only change
needed is in the `geom_*` layer. For example, we can plot the same data, age and wage, using a 2D density plot by switching out geom_histogram with geom_density_2d



~~~r
ggplot(pums,
  aes(x = AGEP, y = WAGP)) +
  geom_density_2d()
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}
![ ]({% include asset.html path="images/layer/unnamed-chunk-7-1.png" %})
{:.captioned}

===

For a discrete x-axis, a boxplot is often beter than a scatterplot. Here, we plot wage by the level of education (`SCHL`)



~~~r
ggplot(pums,
  aes(x = SCHL, y = WAGP)) +
  geom_boxplot()
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}
![ ]({% include asset.html path="images/layer/unnamed-chunk-8-1.png" %})
{:.captioned}

To create a scatterplot, a boxplot, and even a 2d kernel density estimate, the
`geom_*` function takes no arguments. Every layer added on top of the foundation
generated by the call to `ggplot` *inherits* the dataset and aesthetics of the
foundation.
{:.notes}

===

Multiple `geom_*` layers create a plot with multiple visual elements.



~~~r
ggplot(pums,
  aes(x = SCHL, y = WAGP)) +
  geom_boxplot() +
  geom_point()
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}
![ ]({% include asset.html path="images/layer/unnamed-chunk-9-1.png" %})
{:.captioned}

===

Question
: What happens if you supply `x = AGEP` to the aesthetic map in the boxplot?

Answer
: {:.fragment} Boxplots aren't designed for continuous x-axis variables, so the
result is not useful. Fortunately, there's a warning.

===

### Layer Customization

Each `geom_*` object accepts arguments to customize that layer. Many arguments
are common to multiple `geom_*` functions, such as changing the layer's color or size. To make the points only from the scatterplot red, we add an aesthetic for color to the `geom_point` layer.

===



~~~r
ggplot(pums,
  aes(x = SCHL, y = WAGP)) +
  geom_point(color = 'red') +
  geom_boxplot()
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}
![ ]({% include asset.html path="images/layer/unnamed-chunk-10-1.png" %})
{:.captioned}

The `color` specification was not part of aesthetic mapping between data and visual elements. In other words, it was not used to specify how the **data** are mapped visually.  Therefore, 1) it applies to every record (or person) and 2) only the elements in the scatterplot layer are affected. 
{:.notes}

===

The `stat` parameter, in conjunction with `fun`, provides the ability to
perform quick data transformations while plotting.



~~~r
ggplot(pums,
  aes(x = SCHL, y = WAGP)) +
  geom_boxplot() +
  geom_point(
    color = 'red',
    stat = 'summary',
    fun = mean)
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}
![ ]({% include asset.html path="images/layer/unnamed-chunk-11-1.png" %})
{:.captioned}

With `stat = 'summary'`, the plot replaces the raw data with the result of a
summary function applied to a "grouping" that is defined in the aesthetic. In
this case, it's the ordinal x-axis that defines education attainment groups. The
`fun` argument determines what function, here the function `mean`, you want to summarize each group.
{:.notes}

===

### Additional Aesthetics

The true power of [ggplot2](){:.rlib} is the natural connection it provides
between variables and visuals.

Associating color (or any attribute, like the shape of points) to a variable is
another kind of aesthetic mapping. Passing the `color` argument to the `aes`
function works quite differently than assiging color to a `geom_*`.
{:.notes}

===

Here, the color of each point is detemined by the variable in the `SEX` data column. This time, color is specificied in the `aes` function. 



~~~r
ggplot(pums,
  aes(x = SCHL, y = WAGP, color = SEX)) +
  geom_boxplot()
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}
![ ]({% include asset.html path="images/layer/unnamed-chunk-12-1.png" %})
{:.captioned}

===

Question
: What sex do you think is coded as "1"?

Answer
: ... Megan is skeptical about the answer!
: {:.fragment}![]({% include asset.html path = 'images/rapinoe.jpg' %})

===

Properties of the data itself are similarly independent of the aesthetic mapping
and the visual elements, but they can still affect the output. For example, switching the order of the levels of `SEX` will likewise switch the order in the plot.



~~~r
pums$SEX <- factor(pums$SEX, levels = c("2", "1"))

ggplot(pums,
  aes(x = SCHL, y = WAGP, color = SEX)) +
  geom_boxplot()
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}
![ ]({% include asset.html path="images/layer/unnamed-chunk-13-1.png" %})
{:.captioned}

There can be cases where you don't want to or can't modify the dataframe.  Then, it is still possible to change properties of the data to get the plot you'd like within the `ggplot`, `aes`, and `scale_*` functions.  More on modifying plots with `scale_*` later in the [lesson](#axes-labels-and-themes).      
{:.notes}

