---
---



## Smooth Lines

The `geom_smooth` layer can add various kinds of regression lines and
confidence intervals. The argument `method` defines the type of regression; `method = 'lm'`  specifies a linear model.

===

Here, we will observe the relationship between age (AGEP) and wages (WAGP). 

First, the scatterplot is stored as `Age_Wage`



~~~r
 Age_Wage <- ggplot(pums, 
       aes(x=AGEP, y=WAGP)) +
  geom_point()
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}




~~~r
> Age_Wage
~~~
{:title="Console" .input}
![ ]({% include asset.html path="images/model/unnamed-chunk-3-1.png" %})
{:.captioned}

===

Next, the regression line is added using `geom_smooth` using a linear model. 



~~~r
Age_Wage + geom_smooth(method = 'lm')
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}
![ ]({% include asset.html path="images/model/unnamed-chunk-4-1.png" %})
{:.captioned}

===

We can also use the aesthetic mapping to explore how wages differ by sex. To do this, map the color and fill to `SEX`, using `aes` inside the `geom_smooth` layer. In `ggplot2`, `color` refers to the outline and `fill` the interior coloring.  



~~~r
wage_gap <- Age_Wage + 
  geom_smooth(method='lm', aes(color=SEX, fill=SEX))
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}




~~~r
> wage_gap
~~~
{:title="Console" .input}
![ ]({% include asset.html path="images/model/unnamed-chunk-6-1.png" %})
{:.captioned}

To learn more about adding regression lines, such as how to change the confidence interval, see the `geom_smooth` [help page](https://ggplot2.tidyverse.org/reference/geom_smooth.html)
{:.notes}


