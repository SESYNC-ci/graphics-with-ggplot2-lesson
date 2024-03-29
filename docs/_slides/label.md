---
---



## Axes, Labels and Themes

The `aes` and the `geom_*` functions do their best with annotations and styling,
but precise control comes from other functions. 

===

Functions include:

- `labs`: labels
- `scale_*`: scales such as color, size, and positional scales
- `theme_*` : the stylistic theme unrelated to the data

===

To demonstrate these functions, we can edit the plot showing relationship of age and wages based on sex, saved as `wage_gap`. 
{:.notes}

Setting the title and axis labels is done by the `labs` function, which accepts names for
labeled elements in your plot (e.g. `x`, `y`, `title`) as arguments.



~~~r
wage_gap + labs(
  title = 'Wage Gap',
  x = 'Age',
  y = 'Wages (Unadjusted USD)')
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}
![ ]({% include asset.html path="images/label/unnamed-chunk-2-1.png" %})
{:.captioned}

For information on how to add special symbols and formatting to plot labels, see
`?plotmath`.
{:.notes}

===

Scales in `ggplot` control how the data is mapped to aesthetics. 

Functions related to the axes, i.e.  limits, breaks, and transformations,
are all `scale_*` functions. To modify any property of a continuous y-axis, add
a call to `scale_y_continuous`. For example, we can transform the y axis to a log scale.
{:.notes}



~~~r
wage_gap + scale_y_continuous(
  trans = 'log10')
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}


~~~
`geom_smooth()` using formula 'y ~ x'
~~~
{:.output}
![ ]({% include asset.html path="images/label/unnamed-chunk-3-1.png" %})
{:.captioned}

===

Scales are also used to control color and fill schemes. `scale_color_*` functions, for example, control the colors, labels, and breaks mapping.

We can use `scale_color_manual` and `scale_fill_manual` to manually specify the colors we want to use for men and women in the plot and relabel the factors from 1 and 2 to "Men" and "Women."
{:.notes}




~~~r
wage_gap <- wage_gap + labs(
  title = 'Wage Gap',
  x = 'Age',
  y = 'Wages (Unadjusted USD)') + 
  scale_color_manual(values = c('blue', 'red'), 
                     labels = c('Men', 'Women')) + 
  scale_fill_manual(values = c('blue', 'red'), 
                     labels = c('Men', 'Women')) 
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}


```
wage_gap
```
===

"Look and feel" options in [ggplot2](){:.rlib}, from background color to font
sizes, can be set with `theme_*` functions. There are also [8 preset themes in ggplot](https://ggplot2.tidyverse.org/reference/ggtheme.html)



~~~r
wage_gap + theme_bw()
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}


~~~
`geom_smooth()` using formula 'y ~ x'
~~~
{:.output}
![ ]({% include asset.html path="images/label/unnamed-chunk-5-1.png" %})
{:.captioned}

Start typing `theme_` on the console to see what themes are available in the
pop-up menu. The default theme is `theme_grey`. A popular "minimal" theme is
`theme_bw`. Any option set by a `theme_*` function can also be set by calling
`theme` itself with the option and value as an argument.
{:.notes}

===

The options available directly through `theme` offer limitless possibilities
for customization.

Do be aware that if `theme` comes after other custom specifications, it will overwrite
those customizations.  Check the order if your plot isn't looking how you'd like it to look.  
{:.notes}

For example, we can center align and bold face the title using the following `theme` specifications.
{:.notes}



~~~r
wage_gap + theme_bw() +
  labs(title = 'Wage Gap') +
  theme(
    plot.title = element_text(
      face = 'bold',
      hjust = 0.5))
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}


~~~
`geom_smooth()` using formula 'y ~ x'
~~~
{:.output}
![ ]({% include asset.html path="images/label/unnamed-chunk-6-1.png" %})
{:.captioned}

Use `?theme` for a list of available theme options. Note that position (both
`legend.position` and `hjust` for horizontal justification) should be given as a
proportion of the plot window (i.e. between 0 and 1).
{:.notes}
