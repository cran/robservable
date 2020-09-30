## ---- include=FALSE-----------------------------------------------------------
library(robservable)
library(htmlwidgets)
knitr::opts_chunk$set(
  screenshot.force = FALSE,
  echo = TRUE,
  message = FALSE,
  warning = FALSE
)

## -----------------------------------------------------------------------------
df <- data.frame(
  name = rownames(USPersonalExpenditure), 
  value = USPersonalExpenditure[,"1960"]
)
robservable(
  "https://observablehq.com/@juba/draggable-pie-donut-chart",
  include = c("chart", "draw"),
  hide = "draw",
  input = list(data = df),
  width = 700
)

## -----------------------------------------------------------------------------
library(readr)
library(dplyr)
library(tidyr)

## Load Covid-19 data from Johns Hopkins Github repository
d <- read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv")

## Reformat data 
d <- d %>%
  select(-`Province/State`, -Lat, -Long) %>%
  rename(id = `Country/Region`) %>%
  group_by(id) %>%
  summarise(across(everything(), sum)) %>%
  pivot_longer(-id, names_to = "date") %>%
  mutate(date = as.character(lubridate::mdy(date)))

## -----------------------------------------------------------------------------
## Generate chart
robservable(
  "https://observablehq.com/@juba/bar-chart-race",
  include = c("viewof date", "chart", "draw", "styles"),
  hide = "draw",
  input = list(
    data = d,
    title = "COVID-19 deaths",
    subtitle = "Cumulative number of COVID-19 deaths by country",
    source = "Source : Johns Hopkins University"
  ),
  width = 700,
  height = 710
)


## -----------------------------------------------------------------------------
load(url("https://raw.githubusercontent.com/Deleetdk/USA.county.data/master/data/USA_county_data.RData"))

d <- USA_county_data 
d$fips = stringr::str_pad(d$fips, 5, side="left", pad = "0")
d <- d[, c("fips", "name_16", "Graduate.Degree", "Less.Than.High.School")]
names(d) <- c("fips", "name_16", "Graduate", "<High.School")

## -----------------------------------------------------------------------------
robservable(
  "@juba/reusable-bivariate-choropleth",
  include = c("chart", "draw"),
  hide = "draw",
  input = list(
    data = d,
    data_id = "fips",
    data_name = "name_16",
    data_var1 = "Graduate",
    data_var2 = "<High.School",
    map = "https://raw.githubusercontent.com/jgoodall/us-maps/master/topojson/county.topo.json",
    map_object = "county",
    map_id_property = NULL,
    contour = "https://raw.githubusercontent.com/jgoodall/us-maps/master/topojson/state.topo.json",
    contour_object = "state",
    contour_width = 2,
    projection = "geoAlbersUsa",
    legend_position = "bottomleft"
  ),
  width = 700,
  height = 700
)

