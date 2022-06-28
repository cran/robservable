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
  "@juba/robservable-bar-chart", 
  include = "chart"
)

## ---- eval = FALSE------------------------------------------------------------
#  robservable(
#    "@juba/robservable-bar-chart",
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
#    include = c(1, "canvas", "mouse"),
#    hide = "mouse"
#  )

## -----------------------------------------------------------------------------
robservable(
  "@juba/robservable-bar-chart", 
  include = "chart",
  input = list(height = 300)
)

## -----------------------------------------------------------------------------
library(palmerpenguins)
df <- data.frame(table(penguins$species))
# change column names to match the names used in the observable notebook
names(df) <- c("Species", "Freq")

robservable(
  "@juba/robservable-bar-chart", 
  include = "chart",
  input = list(
    data = df,
    x = "Freq",
    y = "Species"
  )
)

## -----------------------------------------------------------------------------
robservable(
  "@juba/robservable-bar-chart",
  include = "chart",
  input = list(
    data = df,
    x = "Freq",
    y = "Species",
    # equivalent to {top: 20, right: 0, left: 70, bottom: 30} in JavaScript
    margin = list(top = 20, right = 0, left = 70, bottom = 30)
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
  "@juba/multi-line-chart",
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
  "@juba/bivariate-choropleth",
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

## ---- eval = FALSE------------------------------------------------------------
#  robservable(...,
#    input_js = list(
#      func = list(inputs = NULL, definition = "() => (x) => (x + 10)")
#    )
#  )

## ---- eval = FALSE------------------------------------------------------------
#  robservable(...,
#    input_js = list(
#      func = list(inputs = "param", definition = "(param) => (x) => (x - param)")
#    )
#  )

