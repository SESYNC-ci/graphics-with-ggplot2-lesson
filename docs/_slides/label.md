---
---

## Axes, Labels and Themes

The `aes` and the `geom_*` functions do their best with annotations and styling,
but precise control comes from other functions. 

Functions include:

- `labs`: labels
- `scale_*`: scales such as color, size, and positional scales
- `theme_*` : the stylistic theme unrelated to the data

===

First, store a plot to simplify experiments with the labels.



~~~r
sex_wagp <- ggplot(pums,
  aes(x = SEX, y = WAGP)) + 
  geom_point() +
  geom_smooth(
    method = 'lm',
    aes(group = 0))
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}


===

Set the title and axis labels with the `labs` function, which accepts names for
labeled elements in your plot (e.g. `x`, `y`, `title`) as arguments.



~~~r
sex_wagp + labs(
  title = 'Wage Gap',
  x = NULL,
  y = 'Wages (Unadjusted USD)')
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}


~~~
`geom_smooth()` using formula 'y ~ x'
~~~
{:.output}
![ ]({% include asset.html path="images/label/unnamed-chunk-2-1.png" %})
{:.captioned}

For information on how to add special symbols and formatting to plot labels, see
`?plotmath`.
{:.notes}

===

Functions related to the axes, i.e. their limits, breaks, and any transformation
are all `scale_*` functions. To modify any property of a continuous y-axis, add
a call to `scale_y_continuous`.

For example, we can transform the y axis to a log scale.


~~~r
sex_wagp + scale_y_continuous(
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

"Look and feel" options in [ggplot2](){:.rlib}, from background color to font
sizes, can be set with `theme_*` functions. There are also [8 preset themes in ggplot](https://ggplot2.tidyverse.org/reference/ggtheme.html)



~~~r
sex_wagp + theme_bw()
~~~
{:title="{{ site.data.lesson.handouts[0] }}" .text-document}


~~~
`geom_smooth()` using formula 'y ~ x'
~~~
{:.output}
![ ]({% include asset.html path="images/label/unnamed-chunk-4-1.png" %})
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


~~~r
sex_wagp + theme_bw() +
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
![ ]({% include asset.html path="images/label/unnamed-chunk-5-1.png" %})
{:.captioned}

Use `?theme` for a list of available theme options. Note that position (both
`legend.position` and `hjust` for horizontal justification) should be given as a
proportion of the plot window (i.e. between 0 and 1).
{:.notes}
