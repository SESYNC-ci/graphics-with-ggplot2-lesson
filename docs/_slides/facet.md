---
---

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
{:.text-document title="{{ site.handouts }}"}

![plot of chunk plot_facets]({{ site.baseurl }}/images/plot_facets-1.png)

===

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
{:.text-document title="{{ site.handouts }}"}

![plot of chunk plot_facets_2]({{ site.baseurl }}/images/plot_facets_2-1.png)

===

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
{:.text-document title="{{ site.handouts }}"}

![plot of chunk plot_facets_3]({{ site.baseurl }}/images/plot_facets_3-1.png)

===

## Exercise 3

Here's a take-home challenge for you to try later. For records with species_id "DM" and "PB", create facets along two categorical variables, species_id and sex, using `facet_grid` instead of `facet_wrap`.

[View solution](#solution-3)