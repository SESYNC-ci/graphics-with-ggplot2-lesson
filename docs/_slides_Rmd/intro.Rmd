---
---

## Objective

This lesson is a brief overview of the **ggplot2** package, which is a R implementation of the "grammar of graphics". In base R, there are different functions for different types of graphics (`plot`, `boxplot`, `hist`, etc.) and each may have their own specific parameters in addition to general plot options. In contrast, ggplot2 constructs plots one *layer* at a time; for example, the output of a linear regression could be plotted by defining the axes, then adding individual points, tracing the line of best fit, and finally specifying overall layout parameters such as font sizes and background color.

This layered approach allows for highly customizable graphics. Even when a plot requires several lines of code, that code is broken down in simple components that are easy to interpret.
