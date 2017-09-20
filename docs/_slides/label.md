---
---

## Axes, labels and themes

Let's start from the histogram like the one generated in the exercise.

===


~~~r
histo <- ggplot(animals_dm,
  aes(x = weight, fill = sex)) +
  geom_histogram(binwidth = 3, color = 'white')
~~~
{:.text-document title="{{ site.handouts }}"}

~~~r
histo
~~~
{:.input}

![plot of chunk plot_hist]({{ site.baseurl }}/images/plot_hist-1.png)
{:.captioned}

===

We change the title and axis labels with the `labs` function. We have various functions related to the scale of each axis, i.e. the range, breaks and any transformations of the values on the axis.

===


~~~r
histo <- histo + labs(
  title = 'Dipodomys merriami weight distribution',
  x = 'Weight (g)',
  y = 'Count')
~~~
{:.text-document title="{{ site.handouts }}"}

~~~r
histo
~~~
{:.input}

![plot of chunk plot_labs]({{ site.baseurl }}/images/plot_labs-1.png)
{:.captioned}

For information on how to add special symbols and formatting to plot labels, see `?plotmath`.
{:.notes}

===

Here, we use `scale_x_continuous` to modify the continuous (as opposed to discrete) x-axis.


~~~r
histo <- histo + scale_x_continuous(
  limits = c(20, 60),
  breaks = c(20, 30, 40, 50, 60))
~~~
{:.text-document title="{{ site.handouts }}"}

~~~r
histo
~~~
{:.input}

![plot of chunk plot_hist_axes]({{ site.baseurl }}/images/plot_hist_axes-1.png)
{:.captioned}

===

Many plot-level options in `ggplot`, from background color to font sizes, are defined as part of *themes*. The next modification to *histo* changes the base theme of the plot to `theme_bw` (replacing the default `theme_grey`) and set a few options manually with the `theme` function. Try `?theme` for a list of available theme options.

===


~~~r
histo <- histo + theme_bw() + theme(
  legend.position = c(0.2, 0.5),
  plot.title = element_text(face = 'bold', vjust = 2),
  axis.title.y = element_text(size = 13, vjust = 1), 
  axis.title.x = element_text(size = 13, vjust = 0))
~~~
{:.text-document title="{{ site.handouts }}"}

~~~r
histo
~~~
{:.input}

![plot of chunk plot_hist_themes]({{ site.baseurl }}/images/plot_hist_themes-1.png)
{:.captioned}

Note that position is relative to plot size (i.e. between 0 and 1).
{:.notes}
