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

## Filter out data
d <- d %>%
  group_by(date) %>%
  filter(value > 0 & (n() - row_number(value)) <= 12) %>%
  arrange(date)

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
d <- read_csv("https://gist.githubusercontent.com/juba/ccba4dadb899588d0301968fd974a99f/raw/5dedadc47c343ad95c3759c068f1821533296087/ecoles_inge.csv")

## -----------------------------------------------------------------------------
map_url <- "https://raw.githubusercontent.com/gregoiredavid/france-geojson/master/regions-version-simplifiee.geojson"

robservable(
 "@juba/reusable-voronoi-map",
 include = c("chart", "draw"),
 hide = "draw",
 input = list(
  contour = map_url,
  contour_width = 1,
  data = d,
  longitude_var = "longitude (X)",
  latitude_var = "latitude (Y)",
  point_radius = 1.5,
  zoom = TRUE
 ),
  width = 600,
  height = 600
)

## -----------------------------------------------------------------------------
load(url("https://raw.githubusercontent.com/Deleetdk/USA.county.data/master/data/USA_county_data.RData"))

d <- USA_county_data
d <- d[d$State == "California",]
d <- d[, c("name_16", "Graduate.Degree", "Less.Than.High.School")]
names(d) <- c("name_16", "Graduate", "<High.School")

## -----------------------------------------------------------------------------
robservable(
  "@juba/reusable-bivariate-choropleth",
  include = c("chart", "draw"),
  hide = "draw",
  input = list(
    data = d,
    data_id = "name_16",
    data_name = "name_16",
    data_var1 = "Graduate",
    data_var2 = "<High.School",
    map = "https://raw.githubusercontent.com/codeforamerica/click_that_hood/master/public/data/california-counties.geojson",
    map_object = "geometry",
    map_id_property = "name",
    legend_position = "bottomleft"
  ),
  width = 800,
  height = 500
)

