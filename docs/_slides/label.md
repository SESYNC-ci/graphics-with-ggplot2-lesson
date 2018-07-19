---
---

## Axes, Labels and Themes

Let's start looking at annotation and other customizations on a new `geom_*`,
one that creates a histogram. Due to the nature of histograms, the base
aesthetic does not require a mapping for `y`.

===



~~~r
histo <- ggplot(animals_dm,
  aes(x = weight, fill = sex)) +
  geom_histogram(binwidth = 3,
    color = 'white')
~~~
{:.text-document title="{{ site.handouts[0] }}"}



~~~r
> histo
~~~
{:.input title="Console"}
![ ]({{ site.baseurl }}/images/label/plot_hist-1.png)
{:.captioned}

===

Set the title and axis labels with the `labs` function, which accepts names for
labeled elements in your plot (e.g. `x`, `y`, `title`) as arguments.

===



~~~r
histo <- histo + labs(title =
  'Size of Dipodomys merriami',
  x = 'Weight (g)',
  y = 'Count')
~~~
{:.text-document title="{{ site.handouts[0] }}"}



~~~r
> histo
~~~
{:.input title="Console"}
![ ]({{ site.baseurl }}/images/label/plot_labs-1.png)
{:.captioned}

For information on how to add special symbols and formatting to plot labels, see `?plotmath`.
{:.notes}

===

We have various functions related to the scale of each axis, i.e. the range,
breaks and any transformations of the values on the axis. Here, we use
`scale_x_continuous` to modify the continuous (as opposed to discrete) x-axis.



~~~r
histo <- histo + scale_x_continuous(
  limits = c(20, 60),
  breaks = c(20, 30, 40, 50, 60))
~~~
{:.text-document title="{{ site.handouts[0] }}"}



~~~r
> histo
~~~
{:.input title="Console"}
![ ]({{ site.baseurl }}/images/label/plot_hist_axes-1.png)
{:.captioned}

===

If we prefer a histogram showing probability, rather than counts, as the scale
on the vertical axis, the aesthetic itself must be modified to include this
non-default mapping for the `y` element.

===



~~~r
histo <- ggplot(animals_dm,
  aes(x = weight,
      y = stat(density),
      fill = sex)) +
  geom_histogram(binwidth = 3,
    color = 'white') +
  labs(title =
    'Size of Dipodomys merriami',
    x = 'Weight (g)',
    y = 'Density')
~~~
{:.text-document title="{{ site.handouts[0] }}"}



~~~r
> histo
~~~
{:.input title="Console"}
![ ]({{ site.baseurl }}/images/label/unnamed-chunk-5-1.png)
{:.captioned}

===

Many plot-level options in [ggplot2](){:.rlib}, from background color to font
sizes, are defined as part of "themes". The next modification to `histo` changes
the base theme of the plot to `theme_bw` (replacing the default `theme_grey`)
and sets a few options manually with the `theme` function.

===



~~~r
histo <- histo + theme_bw() + theme(
  legend.position = c(0.2, 0.5),
  plot.title = element_text(
    face = 'bold', hjust = 0.5),
  axis.title.y = element_text(
    size = 13, hjust = 0.1), 
  axis.title.x = element_text(
    size = 13, hjust = 0.1))
~~~
{:.text-document title="{{ site.handouts[0] }}"}



~~~r
> histo
~~~
{:.input title="Console"}
![ ]({{ site.baseurl }}/images/label/plot_hist_themes-1.png)
{:.captioned}

Use `?theme` for a list of available theme options. Note that position (both
`legend.position` and `hjust` for horizontal justification) should be given as a
proportion of the plot window (i.e. between 0 and 1).
{:.notes}
