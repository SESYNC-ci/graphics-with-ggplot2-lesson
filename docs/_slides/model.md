---
---

## Smooth lines

The `geom_smooth` layer adds a regression line with confidence intervals (95% CI by default). The `method = 'lm'` parameter specifies that a linear model is used for smoothing.

===

Prepare some data in dplyr as for a linear model with a categorical predictor.


~~~r
levels(animals$sex) <- c('Female', 'Male')
animals_dm <- filter(animals,
  species_id == 'DM')
~~~
{:.text-document title="{{ site.handouts[0] }}"}

===


~~~r
ggplot(animals_dm,
  aes(x = year, y = weight, shape = sex)) + 
  geom_point(size = 3,
    stat = 'summary', fun.y = 'mean') +
  geom_smooth(method = 'lm')
~~~
{:.text-document title="{{ site.handouts[0] }}"}

![plot of chunk plot_lm]({{ site.baseurl }}/images/plot_lm-1.png)
{:.captioned}

===

Even better would be to distinguish everything (points and lines) by color:


~~~r
ggplot(animals_dm,
  aes(x = year, y = weight,
    shape = sex, color = sex)) + 
  geom_point(size = 3,
    stat = 'summary', fun.y = 'mean') +
  geom_smooth(method = 'lm')
~~~
{:.text-document title="{{ site.handouts[0] }}"}

![plot of chunk plot_lm_color]({{ site.baseurl }}/images/plot_lm_color-1.png)
{:.captioned}

Notice that by adding aesthetic mappings in the base aesthetic (in the `ggplot` command), it is applied to any layer that recognizes the parameter.
