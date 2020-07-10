---
---

## Lesson Objectives

- Meet the "layered grammar of graphics"
- Trust that [ggplot2](){:.rpkg} is way better than base R's `plot`
- Layer visual elements
- Glimpse the vast collection of [ggplot2](){:.rpkg} options

===

## Specific Achievements

- Create "aesthetic mappings" from variables to scales & geometries
- Build boxplots, scatterplots, smoothed lines and histograms
- Style plots with colors & annotate them with labels
- Repeat plots for different subsets of data

"A Layered Grammar of Graphics" is the title of an
[article](https://dx.doi.org/10.1198/jcgs.2009.07098) by the author of
[ggplot2](){:.rpkg}, Hadley Wickham. The package codifies the ideas presented in
the article, especially the main idea that scientific visualization is all about
assigning different variables to distinct visual elements. A plot is made up of
several of these "aesthetic mappings": for example, equating *income* to a
linear scale on the y-axis, *education* to a ordinal scale on the x-axis, and
displaying records about each person in a box-plot geometry.
{:.notes}
