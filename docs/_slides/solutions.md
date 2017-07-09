---
---

## Exercise solutions

===

## Solution 1


~~~r
animals_dm <- filter(animals, species_id == 'DM')
ggplot(data = animals_dm,
       aes(x = year, y = weight, color = sex)) +
  geom_line(stat = 'summary',
            fun.y = 'mean')
~~~
{:.text-document title="{{ site.handouts }}"}

===

![plot of chunk sol1]({{ site.baseurl }}/images/sol1-1.png)
{:.captioned}

[Return](#exercise-1)
{:.notes}

===

## Solution 2


~~~r
filter(animals, species_id == 'DM') %>%
  ggplot(aes(x = weight, fill = sex)) +         
  geom_histogram(binwidth = 1)
~~~
{:.text-document title="{{ site.handouts }}"}

===

![plot of chunk sol2]({{ site.baseurl }}/images/sol2-1.png)
{:.captioned}

[Return](#exercise-2)
{:.notes}

===

## Solution 3


~~~r
ggplot(data = animals_common,
       aes(x = weight)) +
  geom_histogram() +
  facet_grid(sex ~ species_id) +
  labs(title = 'Weight of common species by sex',
       x = 'Count',
       y = 'Weight (g)')
~~~
{:.text-document title="{{ site.handouts }}"}

===

![plot of chunk sol3]({{ site.baseurl }}/images/sol3-1.png)
{:.captioned}

[Return](#exercise-3)
{:.notes}
