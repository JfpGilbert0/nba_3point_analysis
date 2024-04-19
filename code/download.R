


# setup
library(tidyverse)
library(rvest)
library(nbastatR)
library(lubridate)
library(janitor)
library(heapsofpapers)
library(arrow)
Sys.setenv("VROOM_CONNECTION_SIZE" = 500000)
# Data from nbaR
gamedata <- clean_names(game_logs(seasons = 2022, season_types = c("Regular Season")))
playoffdata <- clean_names(game_logs(seasons = 2022, season_types = c("Playoff")))
# Save raw
write_parquet(x = gamedata, sink ="data/raw/gamedata.parquet")
write_parquet(x = playoffdata, sink = "data/raw/playoffdata.parquet")
#
raps <- teams_annual_stats(teams = "Toronto Raptors")


season <- teams_seasons_info(seasons = 2022)
season_data <- clean_names(nbastatR::seasons_players(seasons = 2012:2022))
# Save raw
write_parquet(x = season_data, sink ="data/raw/seasondata.parquet")

#Play-By-Play: Split season into 3 for speed
pbp_1 <- play_by_play_v2(game_ids = 22100001:22100600)
write_parquet(x = pbp_1, "data/raw/pbp2022_1.parquet")
pbp_2 <- play_by_play_v2(game_ids = 22100601:22101200)
write_parquet(x = pbp_2, "data/raw/pbp2022_2.parquet")
pbp_3 <- play_by_play_v2(game_ids = 22101201:22101230)
write_parquet(x = pbp_3, "data/raw/pbp2022_3.parquet")
play_by_play_v2(game_ids = 22100604)
#Save Parquet

# Dowload Rosters
rosters <- clean_names(seasons_rosters(seasons = 2012:2022))
#save raw
write_parquet(x = rosters, sink ="data/raw/rosters.parquet")
