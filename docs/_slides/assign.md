---
---

## Storing and Re-plotting

The output of `ggplot` can be assigned to a variable, which works with `+` to
add layers.

Here, we will recreate the plot for the wage and level of schooling we made before.

===

First, we will store the plot, mapping only the boxplots for each education level. 



~~~r
schl_wagp <- ggplot(filter_SCHL,
       aes(x = SCHL, y = WAGP)) +
  geom_boxplot() 
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}


===

The plot information stored in `schl_wagp` can be used on its own, or with
additional layers. 

You may notice that the plot is not displayed in Rstudio when it is stored. To plot the data, simply run the name of the stored object.



~~~r
> schl_wagp
~~~
{:title="Console" .input}
![ ]({% include asset.html path="images/assign/unnamed-chunk-2-1.png" %})
{:.captioned}

===

To add the points for the mean of each education level, simply add the `geom_point` layer to the stored `schl_wagp` object. 



~~~r
schl_wagp +
  geom_point(
    color = 'red',
    stat = 'summary',
    fun = mean)
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}
![ ]({% include asset.html path="images/assign/unnamed-chunk-3-1.png" %})
{:.captioned}

===

When adding layers, you can save as a new variable or overwrite the existing variable. 



~~~r
schl_wagp <- schl_wagp +
  geom_point(
    color = 'red',
    stat = 'summary',
    fun = mean)
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}



~~~r
> schl_wagp
~~~
{:title="Console" .input}
![ ]({% include asset.html path="images/assign/unnamed-chunk-5-1.png" %})
{:.captioned}
===

Figures are constructed in [ggplot2](){:.rlib} as layers of shapes, from the
axes on up through the `geom_*` elements. The natural file type for storing such
figures at "infinite" resolution are PDF (for print) or SVG (for online). 
{:.notes}

Use the function `ggsave` to save as an image.  



~~~r
ggsave(filename = 'schl_wagp.pdf',
  plot = schl_wagp,
  width = 4, height = 3)
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}


The `plot` argument is unnecessary if the target is the most recently displayed
plot, but adding `plot` will ensure that the correct plot is saved. When a raster file type
is necessary (e.g. a PNG, JPG, or TIFF) use the `dpi` argument to specify an
image resolution. To save as a different file type, simply change the extension of the plot name (for example `filename = 'sch_wagp.png'`).
{:.notes}
