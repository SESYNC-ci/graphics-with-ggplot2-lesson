---
---

## Adding a regression line

The code below shows one graph answering the question in the exercise.
Adding a `geom_smooth` layer displays a regression line with confidence intervals (95% CI by default). The `method = 'lm'` parameter specifies that a linear model is used for smoothing.


~~~r
animals_dm <- filter(animals, species_id == 'DM')
ggplot(data = animals_dm,
       aes(x = year, y = weight)) + 
  geom_point(aes(shape = sex),
             size = 3,
             stat = 'summary',
             fun.y = 'mean') +
  geom_smooth(method = 'lm')
~~~
{:.text-document title="{{ site.handouts }}"}

![plot of chunk plot_lm]({{ site.baseurl }}/images/plot_lm-1.png)

===

To get separate regression lines for females and males, we could add a *group* aesthetic mapping to `geom_smooth`:


~~~r
ggplot(data = animals_dm,
       aes(x = year, y = weight)) + 
  geom_point(aes(shape = sex),
             size = 3,
             stat = 'summary',
             fun.y = 'mean') +
  geom_smooth(aes(group = sex), method = 'lm')
~~~
{:.text-document title="{{ site.handouts }}"}

![plot of chunk plot_lm_group]({{ site.baseurl }}/images/plot_lm_group-1.png)

===

Even better would be to distinguish the two lines by color:


~~~r
ggplot(data = animals_dm,
       aes(x = year,
           y = weight,
           color = sex)) + 
  geom_point(aes(shape = sex),
             size = 3,
	     stat = 'summary',
	     fun.y = 'mean') +
  geom_smooth(method = 'lm')
~~~
{:.text-document title="{{ site.handouts }}"}

![plot of chunk plot_lm_color]({{ site.baseurl }}/images/plot_lm_color-1.png)

Notice that by adding the aesthetic mapping in the `ggplot` command, it is applied to all layers that recognize that aesthetic (color).
