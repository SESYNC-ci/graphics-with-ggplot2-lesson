---
---

## Storing and re-plotting

The output of `ggplot` can be assigned to a variable (here, it's `year_wgt`). It is then possible to add new elements to it with the `+` operator. We will use this method to try different color scales for the previous plot.

===


~~~r
year_wgt <- ggplot(animals_dm,
  aes(x = year, y = weight,
    color = sex, shape = sex)) + 
  geom_point(size = 3,
    stat = "summary",
    fun.y = "mean") +
  geom_smooth(method = "lm")
~~~
{:.text-document title="{{ site.handouts[0] }}"}

===

The plot information stored in `year_wgt` can be used on its own, or with additional layers.


~~~r
year_wgt
~~~
{:.input}

![plot of chunk plot_scale_color_manual]({{ site.baseurl }}/images/plot_scale_color_manual-1.png)
{:.captioned}

===

By overwriting the `year_wgt` variable, the stored plot gets updated with the black and red color scale.


~~~r
year_wgt <- year_wgt +
  scale_color_manual(
    values = c("black", "red"))
~~~
{:.text-document title="{{ site.handouts[0] }}"}

~~~r
year_wgt
~~~
{:.input}

![plot of chunk plot_lm_scales_2]({{ site.baseurl }}/images/plot_lm_scales_2-1.png)
{:.captioned}

===

## Exercise 2

Create a histogram, using a `geom_histogram` layer, of the weights of individuals of species DM and divide the data by sex. Note that instead of using `color` in the aesthetic, you'll use `fill` to distinguish the sexes. To silence that warning, open the help with `?geom_histogram` and determine how to explicitly set the bin width.

[View solution](#solution-2)
{:.notes}
