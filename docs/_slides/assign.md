---
---

## Storing and Re-plotting

The output of `ggplot` can be assigned to a variable. It is then possible to add
new elements to it with the `+` operator. We will use this method to try
different color scales for a stored plot.

===



~~~r
year_wgt <- ggplot(animals_dm,
  aes(x = year, y = weight,
    color = sex, shape = sex)) + 
  geom_point(size = 3,
    stat = 'summary',
    fun.y = 'mean') +
  geom_smooth(method = 'lm')
~~~
{:.text-document title="{{ site.handouts[0] }}"}


===

The plot information stored in `year_wgt` can be used on its own, or with
additional layers.



~~~r
> year_wgt
~~~
{:.input title="Console"}
![ ]({{ site.baseurl }}/images/assign/plot_scale_color_manual-1.png)
{:.captioned}

===

By overwriting the `year_wgt` variable, the stored plot gets updated with the
black and red color scale.



~~~r
year_wgt <- year_wgt +
  scale_color_manual(
    values = c('black', 'red'))
~~~
{:.text-document title="{{ site.handouts[0] }}"}



~~~r
> year_wgt
~~~
{:.input title="Console"}
![ ]({{ site.baseurl }}/images/assign/plot_lm_scales_2-1.png)
{:.captioned}

===

Figures are constructed in [ggplot2](){:.rlib} as layers of shapes, from the
axes on up through the `geom_*` elements. Natural file types for storing these
figures at "infinite" resolution are PDF (for print) or SVG (for online).



~~~r
ggsave(filename = 'year_wgt.pdf',
       plot = year_wgt,
       width = 4, height = 3)
~~~
{:.text-document title="{{ site.handouts[0] }}"}


The `plot` argument is unnecessary if the target is the most recently displayed
plot. When a raster file type is necessary (e.g. a PNG, JPG, or TIFF) use the
`dpi` argument to specify an image resolution.
{:.notes}
