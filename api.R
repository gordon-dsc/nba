install.packages("tidyverse")
install.packages("httr2")
library(tidyverse)
library(httr2)
library(tidyr)



#function to get player id numbers used on api
get_id_number <- function(first, last){
  url <- "https://www.balldontlie.io/api/v1"
  request(url)|>
    req_url_path_append("/players") |>
    req_url_query(per_page = 100,
                  search = last) |>
    req_perform()|>
    resp_body_json() ->
    all_player_ids
  
  #unnest and rectangling the player ID's
  all_player_ids <- all_player_ids[1]
  all_player_id_tibble <- tibble(all_player_ids)
  
  all_player_id_tibble |>
    unnest_longer(col = all_player_ids) |>
    hoist(all_player_ids,
          id = c("id"),
          first_name = c("first_name"),
          last_name = c("last_name")) ->
    all_player_id_tibble
  
  #filter for first and last name matches
  all_player_id_tibble |>
    filter(first_name == first) |>
    filter(last_name == last) ->
    all_player_id_tibble
  
  all_player_id_tibble$id[1]
}

#function to get season averages from player id
get_stats <- function(season, id){
  url <- "https://www.balldontlie.io/api/v1"
  append_string <- "/season_averages?"
  append_string_ids <- paste("player_ids[]=", as.character(id),sep = "")
  append_string_season <- paste("&season=", as.character(season), sep = "")
  append_string <- paste(append_string,append_string_ids, append_string_season,sep = "")
  
  request(url) |>
    req_url_path_append(append_string) |>
    req_perform() |>
    resp_body_json() ->
    stats_json
  
  #rectangle 
  stats_json <- stats_json[["data"]]
  stats_tibble <- tibble(stats_json) 
  stats_tibble|>
    unnest_wider(col = stats_json) ->
    stats_tibble
}

get_season_avg <- function(first, last, season){
  id <- get_id_number(first, last)
  get_stats(season, id) ->
  stats_tibble
}

lebron <- get_season_avg("Karl-Anthony", "Towns", 2017)



