---
---

## Storing and re-plotting

The output of `ggplot` can be assigned to a variable (here, it's `year_wgt`). It is then possible to add new elements to it with the `+` operator. We will use this method to try different color scales for the previous plot


~~~r
year_wgt <- ggplot(data = surveys_dm,
                   aes(x = year,
                   y = weight,
                   color = sex)) + 
              geom_point(aes(shape = sex),
                         size = 3,
	                 stat = "summary",
	                 fun.y = "mean") +
              geom_smooth(method = "lm")

year_wgt +
  scale_color_manual(values = c("darkblue", "orange"))
~~~
{:.text-document title="{{ site.handouts }}"}

![plot of chunk plot_lm_scales]({{ site.baseurl }}/images/plot_lm_scales-1.png)

===

By overwriting the `year_wgt` variable, the stored plot gets updated with the black and red color scale.


~~~r
year_wgt <- year_wgt +
  scale_color_manual(values = c("black", "red"))
year_wgt
~~~
{:.text-document title="{{ site.handouts }}"}

![plot of chunk plot_lm_scales_2]({{ site.baseurl }}/images/plot_lm_scales_2-1.png)

===

## Exercise 2

Create a histogram, using a `geom_histogram()` layer, of the weights of individuals of species *DM* and divide the data by sex. Note that instead of using `color` in the aesthetic, you'll use `fill` to distinguish the sexes. Also look at the [documentation](http://docs.ggplot2.org/current/geom_histogram.html) and determine how to explicitly set the bin width.

[View solution](#solution-2)
