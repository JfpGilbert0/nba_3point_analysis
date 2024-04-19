### create and save models ###
# USE: creates Logit models
#Author: Jacob Gilbert 
# Date: 19 April 2024
# Contact: j.gilbert@mail.utoronto.ca
# License: MIT
# Pre-requisites: cleaning.R
# Setup
library(tidyverse)
library(rvest)
library(nbastatR)
library(lubridate)
library(janitor)
library(heapsofpapers)
library(arrow)
library(modelsummary)
library(bayesplot)
# Open Parquet
gamedata <- read_parquet("data/analysis/cleaned_pbp.parquet")

# model 1
model1 <- stan_glm(win ~ pct_diff_3pa, data = gamedata, family = binomial(link = "logit"), prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 8, autoscale = TRUE),
    seed = 30)

saveRDS(model1, file = "data/models/model_1.rds")

model_1 <- modelsummary(list("Logit" = model1), output = "markdown") 


# Losing model
losing_data <- gamedata |>
  filter(q4_margin < 0) |>
  mutate(q4_margin = -q4_margin)
model2 <- glm(win ~ pct_diff_3pa, data = losing_data, family = "binomial")
saveRDS(model2, file = "data/models/model_2.rds")

modelsummary(list("Logit" = mode2), output = "markdown")
