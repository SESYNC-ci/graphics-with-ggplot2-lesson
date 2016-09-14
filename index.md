---
layout: default
style: /css/lesson.css
---

# {{ site.title }}
{:.no-toc}

Lesson {{ site.lesson }} with *Ian Carroll*

* TOC
{:toc}

This lesson is a brief overview of the **ggplot2** package, which is a R implementation of the "grammar of graphics". In base R, there are different functions for different types of graphics (`plot`, `boxplot`, `hist`, etc.) and each may have their own specific parameters in addition to general plot options. In contrast, ggplot2 constructs plots one *layer* at a time; for example, the output of a linear regression could be plotted by defining the axes, then adding individual points, tracing the line of best fit, and finally specifying overall layout parameters such as font sizes and background color.

This layered approach allows for highly customizable graphics. Even when a plot requires several lines of code, that code is broken down in simple components that are easy to interpret.

Let's start by loading a few packages along with a sample dataset, which is the *surveys* table from the [Portal Project Teaching Database](https://figshare.com/articles/Portal_Project_Teaching_Database/1314459). We filter the data to remove rows that have missing values for the species\_id, sex, or weight columns. (This is not strictly necessary, but it will prevent ggplot from returning missing values warnings.)


~~~r
library(dplyr)
library(ggplot2)
surveys <- read.csv("data/surveys.csv", na.strings = "") %>%
    filter(!is.na(species_id), !is.na(sex), !is.na(weight))
~~~

## Constructing layered graphics in ggplot

As a first example, this code plots the inviduals' weights by species:

~~~r
ggplot(data = surveys,
       aes(x = species_id, y = weight)) +
  geom_point()
~~~
{:.text-document title="lesson-5.R"}

![plot of chunk plot_pt](/graphics-with-ggplot2-lesson/images/plot_pt-1.png)

In `ggplot`, we specified a data frame (*surveys*) and a number of aesthetic mappings (`aes`). The `aes` function associates variables from that data frame to visual elements in the plot: here, *species_id* on the x-axis and *weight* on the y-axis. The `ggplot` function by itself does not plot anything until we add a *geom* layer such as `geom_point`. In this particular case, individual points are hard to distinguish; what could we use instead? (Try `geom_boxplot`.)

Multiple geom layers can be combined in a single plot:

~~~r
ggplot(data = surveys,
       aes(x = species_id, y = weight)) +
  geom_boxplot() +
  geom_point(stat = "summary",
             fun.y = "mean",
             color = "red")
~~~
{:.text-document title="lesson-5.R"}

![plot of chunk plot_box](/graphics-with-ggplot2-lesson/images/plot_box-1.png)

This `geom_point` layer definition illustrates a couple new features:

* With `stat = "summary"`, we can plot a summary statistic (defined by `fun.y`) instead of the raw data.
* Setting `color = red` applies one color to the whole layer. If we want instead to associate color (or some other attribute, like point shape) to a variable, it needs to be specified within an `aes` function.

### Quick plotting with qplot

The `qplot` function provides a shortcut to `ggplot` that looks more like the base R `plot` function, e.g. `qplot(x = species_id, y = weight, data = surveys, geom = "boxplot")`. This can be useful to quickly produce simple graphs, especially those with a single geom.

### Exercise 1

Using `dplyr` and `ggplot` show how the mean weight of individuals of the species *DM* varies across years and between males and females.

[View solution](#solution-1)

## Adding a regression line

The code below shows one graph answering the question in the exercise.
Adding a `geom_smooth` layer displays a regression line with confidence intervals (95% CI by default). The `method = "lm"` parameter specifies that a linear model is used for smoothing.


~~~r
surveys_dm <- filter(surveys, species_id == "DM")
ggplot(data = surveys_dm,
       aes(x = year, y = weight)) + 
  geom_point(aes(shape = sex),
             size = 3,
             stat = "summary",
             fun.y = "mean") +
  geom_smooth(method = "lm")
~~~
{:.text-document title="lesson-5.R"}

![plot of chunk plot_lm](/graphics-with-ggplot2-lesson/images/plot_lm-1.png)

To get separate regression lines for females and males, we could add a *group* aesthetic mapping to `geom_smooth`:


~~~r
ggplot(data = surveys_dm,
       aes(x = year, y = weight)) + 
  geom_point(aes(shape = sex),
             size = 3,
             stat = "summary",
             fun.y = "mean") +
  geom_smooth(aes(group = sex), method = "lm")
~~~
{:.text-document title="lesson-5.R"}

![plot of chunk plot_lm_group](/graphics-with-ggplot2-lesson/images/plot_lm_group-1.png)

Even better would be to distinguish the two lines by color:


~~~r
ggplot(data = surveys_dm,
       aes(x = year,
           y = weight,
           color = sex)) + 
  geom_point(aes(shape = sex),
             size = 3,
	     stat = "summary",
	     fun.y = "mean") +
  geom_smooth(method = "lm")
~~~
{:.text-document title="lesson-5.R"}

![plot of chunk plot_lm_color](/graphics-with-ggplot2-lesson/images/plot_lm_color-1.png)

Notice that by adding the aesthetic mapping in the `ggplot` command, it is applied to all layers that recognize that aesthetic (color).

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
{:.text-document title="lesson-5.R"}

![plot of chunk plot_lm_scales](/graphics-with-ggplot2-lesson/images/plot_lm_scales-1.png)


~~~r
year_wgt <- year_wgt +
  scale_color_manual(values = c("black", "red"))
year_wgt
~~~
{:.text-document title="lesson-5.R"}

![plot of chunk plot_lm_scales_2](/graphics-with-ggplot2-lesson/images/plot_lm_scales_2-1.png)

By overwriting the `year_wgt` variable, the stored plot gets updated with the black and red color scale.

### Exercise 2

Create a histogram, using a `geom_histogram()` layer, of the weights of individuals of species *DM* and divide the data by sex. Note that instead of using `color` in the aesthetic, you'll use `fill` to distinguish the sexes. Also look at the [documentation](http://docs.ggplot2.org/current/geom_histogram.html) and determine how to explicitly set the bin width.

[View solution](#solution-2)

## Axes, labels and themes

Let's start from the histogram like the one generated in the exercise.


~~~r
histo <- ggplot(data = surveys_dm,
                aes(x = weight, fill = sex)) +
    geom_histogram(binwidth = 3, color = "white")
histo
~~~
{:.text-document title="lesson-5.R"}

![plot of chunk plot_hist](/graphics-with-ggplot2-lesson/images/plot_hist-1.png)

We change the title and axis labels with the `labs` function. We have various functions related to the scale of each axis, i.e. the range, breaks and any transformations of the values on the axis. Here, we use `scale_x_continuous` to modify a continuous (as opposed to discrete) x-axis.


~~~r
histo <- histo + 
  labs(title = "Dipodomys merriami weight distribution",
       x = "Weight (g)",
       y = "Count") +
  scale_x_continuous(limits = c(20, 60),
                     breaks = c(20, 30, 40, 50, 60))
histo
~~~
{:.text-document title="lesson-5.R"}

![plot of chunk plot_hist_axes](/graphics-with-ggplot2-lesson/images/plot_hist_axes-1.png)

For information on how to add special symbols and formatting to plot labels, see `?plotmath`.

Many plot-level options in `ggplot`, from background color to font sizes, are defined as part of *themes*. The next modification to *histo* changes the base theme of the plot to `theme_bw` (replacing the default `theme_grey`) and set a few options manually with the `theme` function. Try `?theme` for a list of available theme options.


~~~r
histo <- histo +
  theme_bw() +
  theme(legend.position = c(0.2, 0.5),
        plot.title = element_text(face = "bold", vjust = 2),
        axis.title.y = element_text(size = 13, vjust = 1), 
        axis.title.x = element_text(size = 13, vjust = 0))
histo
~~~
{:.text-document title="lesson-5.R"}

![plot of chunk plot_hist_themes](/graphics-with-ggplot2-lesson/images/plot_hist_themes-1.png)

Note that position is relative to plot size (i.e. between 0 and 1).

## Facets

To conclude this overview of ggplot2, here are a few examples that show different subsets of the data in panels called *facets*.
The `facet_wrap` function takes a *formula* argument that specifies the grouping on either side of a '~'. First, we specify that *month* is a factor, rather than an integer, so grouping works.


~~~r
surveys_dm$month <- as.factor(surveys_dm$month)
levels(surveys_dm$month) <- c("January", "February", "March", "April", "May", "June",
                              "July", "August", "September", "October", "November", "December")
ggplot(data = surveys_dm,
       aes(x = weight)) +
  geom_histogram() +
  facet_wrap( ~ month) +
  labs(title = "DM weight distribution by month",
       x = "Count",
       y = "Weight (g)")
~~~
{:.text-document title="lesson-5.R"}

![plot of chunk plot_facets](/graphics-with-ggplot2-lesson/images/plot_facets-1.png)

The un-grouped data may be added as a layer on each panel, but you have to drop the grouping variable (i.e. *month*).


~~~r
ggplot(data = surveys_dm,
       aes(x = weight)) +
  geom_histogram(data = select(surveys_dm, -month),
                 alpha = 0.2) +
  geom_histogram() +
  facet_wrap( ~ month) +
  labs(title = "DM weight distribution by month",
       x = "Count",
       y = "Weight (g)")
~~~
{:.text-document title="lesson-5.R"}

![plot of chunk plot_facets_2](/graphics-with-ggplot2-lesson/images/plot_facets_2-1.png)

Finally, let's show off with some nice styling and the very unusual `..density..` argument in the aesthetic. The notation signifies the ggplot is to calculate the probability density, rather than plot frequency as before.


~~~r
ggplot(data = surveys_dm,
       aes(x = weight, fill = month)) +
  geom_histogram(data = select(surveys_dm, -month),
                 aes(y = ..density..),
                 fill = "black") +
  geom_histogram(aes(y = ..density..),
                 alpha = 0.8) +
  facet_wrap( ~ month) +
  labs(title = "DM weight distribution by month",
       x = "Count",
       y = "Weight (g)") +
  guides(fill = FALSE)								 
~~~
{:.text-document title="lesson-5.R"}

![plot of chunk plot_facets_3](/graphics-with-ggplot2-lesson/images/plot_facets_3-1.png)

### Exercise 3

Here's a take-home challenge for you to try later. For records with species_id "DM" and "PB", create facets along two categorical variables, species_id and sex, using `facet_grid` instead of `facet_wrap`.

[View solution](#solution-3)

## Additional information

* [Data visualization with ggplot2 (RStudio cheat sheet)](http://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf)

* [Documentation site for ggplot2](http://docs.ggplot2.org)

* [Cookbook for R - Graphs](http://www.cookbook-r.com/Graphs/) A useful reference on how to customize different graph elements in ggplot2.

## Exercise solutions

### Solution 1


~~~r
filter(surveys, species_id == "DM") %>%
  ggplot(aes(x = year, y = weight, color = sex)) +
  geom_line(stat = "summary", fun.y = "mean")
~~~
{:.text-document title="lesson-5.R"}

![plot of chunk sol1](/graphics-with-ggplot2-lesson/images/sol1-1.png)

[Return](#exercise-1)

### Solution 2


~~~r
filter(surveys, species_id == "DM") %>%
  ggplot(aes(x = weight, fill = sex)) +         
  geom_histogram(binwidth = 1)
~~~
{:.text-document title="lesson-5.R"}

![plot of chunk sol2](/graphics-with-ggplot2-lesson/images/sol2-1.png)

[Return](#exercise-2)

### Solution 3


~~~r
filter(surveys, species_id %in% c("DM", "PB")) %>%
  ggplot(aes(x = weight)) +
  geom_histogram() +
  facet_grid(sex ~ species_id) +
  labs(title = "DM and RO weight distribution by sex",
       x = "Count",
       y = "Weight (g)")
~~~
{:.text-document title="lesson-5.R"}

![plot of chunk sol3](/graphics-with-ggplot2-lesson/images/sol3-1.png)

[Return](#exercise-3)
