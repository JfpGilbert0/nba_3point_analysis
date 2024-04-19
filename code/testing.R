### testing clean data ###
# USE: Cleans the dataset pbp_4thonly. It is recomended that you only download the pbp data as all these databases are quite large.
# Author: Jacob Gilbert 
# Date: 19 April 2024
# Contact: j.gilbert@mail.utoronto.ca
# License: MIT
# Pre-requisites: Download.R


teamgame <- read_parquet("data/analysis/cleaned_pbp.parquet")


#Test to make sure all values used in the graph/ models are behaving normally

all(sapply(teamgame$att_3pt, is.numeric))
all(sapply(teamgame$att_2pt, is.numeric))
all(sapply(teamgame$att_ft, is.numeric))
all(sapply(teamgame$pct_3pt, is.numeric))
all(sapply(teamgame$final_margin, is.numeric))
all(sapply(gamedata$win, is.logical ))
all(teamgame$att_3pt >= 0)
all(teamgame$att_2pt >= 0)
all(teamgame$att_ft >= 0)
all(teamgame$pct_3pt >= 0)
all(teamgame$pct_3pt <= 1)
all(teamgame$pct_2pt >= 0)
all(teamgame$pct_2pt <= 1)
all(teamgame$att_ft >= 0)
all(teamgame$pct_ft <= 1)

teamnames <- teamgame$team |> unique()
length(teamnames) == 30
print(teamnames)
