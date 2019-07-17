---
---

## Storing and Re-plotting

The output of `ggplot` can be assigned to a variable, which works with `+` to
add layers.

===



~~~r
schl_wagp <- ggplot(person,
  aes(x = SCHL, y = WAGP, color = SEX)) +
  geom_point(
    stat = 'summary',
    fun.y = 'mean')
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}


===

The plot information stored in `schl_wagp` can be used on its own, or with
additional layers.



~~~r
> schl_wagp
~~~
{:title="Console" .input}
![ ]({% include asset.html path="images/assign/unnamed-chunk-2-1.png" %})
{:.captioned}

===

Store additional layers by overwriting the variable (or creating a new one).



~~~r
schl_wagp <- schl_wagp +
  scale_color_manual(
    values = c('black', 'red'))
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}



~~~r
> schl_wagp
~~~
{:title="Console" .input}
![ ]({% include asset.html path="images/assign/unnamed-chunk-4-1.png" %})
{:.captioned}

===

Figures are constructed in [ggplot2](){:.rlib} as layers of shapes, from the
axes on up through the `geom_*` elements. The natural file type for storing such
figures at "infinite" resolution are PDF (for print) or SVG (for online).



~~~r
ggsave(filename = 'schl_wagp.pdf',
  plot = schl_wagp,
  width = 4, height = 3)
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}


The `plot` argument is unnecessary if the target is the most recently displayed
plot, but a little verbosity is not out-of-place here. When a raster file type
is necessary (e.g. a PNG, JPG, or TIFF) use the `dpi` argument to specify an
image resolution.
{:.notes}
