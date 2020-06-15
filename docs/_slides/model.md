---
---

## Smooth Lines

The `geom_smooth` layer can add various kinds of regression lines and
confidence intervals. A `method = 'lm'` argument specifies a linear model.

Note, however, that with a categorical predictor mapped to an aesthetic element,
the `geom_smooth` call would separately perform a linear regression (ANOVA)
within each group. The call to `aes` must override the "group" aesthetic so the
regression is run once. Here, we set the group to 0 so that all data points are in the same group instead of split by sex.
{:.notes}

===



~~~r
ggplot(pums,
  aes(x = SEX, y = WAGP)) + 
  geom_point() +
  geom_smooth(
    method = 'lm',
    aes(group = 0))
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}


~~~
`geom_smooth()` using formula 'y ~ x'
~~~
{:.output}
![ ]({% include asset.html path="images/model/unnamed-chunk-1-1.png" %})
{:.captioned}

Is there really a confidence interval? Yes, it's just pretty narrow and hard to
see. You could add a `size = 0.5` argument to `geom_smooth` to see there is a
gray interval around the line. Or, as the next step shows, you could change
the size of the confidence interval for a better visual representation of the
variability.
{:.notes}

===

The `level` argument for `geom_smooth` controls the limits of the confidence
interval, defaulting to 95%.



~~~r
ggplot(pums,
  aes(x = SEX, y = WAGP)) + 
  geom_point() +
  geom_smooth(
    method = 'lm',
    level = 0.99,
    aes(group = 0))
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}


~~~
`geom_smooth()` using formula 'y ~ x'
~~~
{:.output}
![ ]({% include asset.html path="images/model/unnamed-chunk-2-1.png" %})
{:.captioned}
