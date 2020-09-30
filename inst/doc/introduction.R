## ---- include=FALSE-----------------------------------------------------------
library(robservable)
library(htmlwidgets)
knitr::opts_chunk$set(
  screenshot.force = FALSE,
  echo = TRUE
)

## ----eval = FALSE-------------------------------------------------------------
#  robservable("https://observablehq.com/@d3/horizontal-bar-chart")

## ----eval = FALSE-------------------------------------------------------------
#  robservable("@d3/horizontal-bar-chart")

## ----eval = FALSE-------------------------------------------------------------
#  robservable("https://observablehq.com/d/61be71d2b8c0d456")

## ----eval = FALSE-------------------------------------------------------------
#  robservable("61be71d2b8c0d456")

## -----------------------------------------------------------------------------
robservable(
  "@d3/horizontal-bar-chart", 
  include = "chart"
)

## ---- eval = FALSE------------------------------------------------------------
#  robservable(
#    "@d3/horizontal-bar-chart",
#    include = 1
#  )

## -----------------------------------------------------------------------------
robservable(
  "@mbostock/eyes",
  include = c("canvas", "mouse")
)

## -----------------------------------------------------------------------------
robservable(
  "@mbostock/eyes",
  include = c("canvas", "mouse"),
  hide = "mouse"
)

## ---- eval = FALSE------------------------------------------------------------
#  robservable(
#    "@mbostock/eyes",
#    cell = c(1, "canvas", "mouse"),
#    hide = "mouse"
#  )

## -----------------------------------------------------------------------------
robservable(
  "@d3/horizontal-bar-chart", 
  include = "chart",
  input = list(barHeight = 15)
)

## -----------------------------------------------------------------------------
df <- data.frame(table(iris$Species))
# change column names to match the names used in the observable notebook
names(df) <- c("name", "value")

robservable(
  "@d3/horizontal-bar-chart", 
  include = "chart",
  input = list(data = df)
)

## -----------------------------------------------------------------------------
robservable(
  "@d3/horizontal-bar-chart",
  include = "chart",
  input = list(
    data = df,
    # equivalent to {top: 20, right: 0, left: 70, bottom: 0} in JavaScript
    margin = list(top = 20, right = 0, left = 70, bottom = 0)
  )
)

## ----message=FALSE------------------------------------------------------------
library(gapminder)
data(gapminder)
series <- lapply(unique(gapminder$country), function(country) {
  values <- gapminder[gapminder$country == country, "lifeExp", drop = TRUE]
  list(name = country, values = values)
})
dates <- sort(unique(gapminder$year))
dates <- as.Date(as.character(dates), format = "%Y")

df <- list(
  y = "Life expectancy",
  series = series,
  dates = to_js_date(dates)
)

robservable(
  "@d3/multi-line-chart",
  include = "chart",
  input = list(data = df)
)

## -----------------------------------------------------------------------------
robservable(
  "@mbostock/eyes",
  include = c("canvas", "mouse"),
  hide = "mouse"
)

## -----------------------------------------------------------------------------
robservable(
  "@mbostock/eyes",
  include = c("canvas", "mouse"),
  hide = "mouse",
  width = 500,
  height = 100
)

## -----------------------------------------------------------------------------
robservable(
  "@d3/bivariate-choropleth",
  include = "chart",
  height = 450
)

## -----------------------------------------------------------------------------
robservable(
  "@mbostock/eyes",
  include = c("canvas", "mouse"),
  hide = "mouse",
  input = list(height = 50),
  height = 200
)

## -----------------------------------------------------------------------------
df <- data.frame(table(iris$Species))
names(df) <- c("name", "value")

robservable(
  "@d3/horizontal-bar-chart",
  include  = "chart",
  input = list(
    data = df,
    margin = list(top = 20, right = 0, left = 70, bottom = 0)
  ),
  update_height = FALSE
)

