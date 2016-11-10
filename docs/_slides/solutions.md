---
---

## Exercise solutions

### Solution 1


~~~r
filter(surveys, species_id == "DM") %>%
  ggplot(aes(x = year, y = weight, color = sex)) +
  geom_line(stat = "summary", fun.y = "mean")
~~~
{:.text-document title="{{ site.worksheet }}"}

![plot of chunk sol1]({{ site.baseurl }}/images/sol1-1.png)

[Return](#exercise-1)

### Solution 2


~~~r
filter(surveys, species_id == "DM") %>%
  ggplot(aes(x = weight, fill = sex)) +         
  geom_histogram(binwidth = 1)
~~~
{:.text-document title="{{ site.worksheet }}"}

![plot of chunk sol2]({{ site.baseurl }}/images/sol2-1.png)

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
{:.text-document title="{{ site.worksheet }}"}

![plot of chunk sol3]({{ site.baseurl }}/images/sol3-1.png)

[Return](#exercise-3)
