#set up test frame
names <- list(lebron = c("LeBron","James"),
              davis = c("Anthony", "Davis"))

names <- tibble(names)
names|>
  unnest_wider(names, names_sep = "")->
  names

#attempt to use function for mutate
names|>
  mutate(stats = map2(.x = names1,
                      .y = names2,
                      .f = \(x,y) {get_season_avg(x,y,2020)})) |>
  unnest_wider(stats) ->
  names_stats








#one by one methond
lebron_stats <- get_season_avg(names$names1[1], names$names2[1], 2020)
ad_stats <- get_season_avg(names$names1[2], names$names2[2], 2020)

combine <- bind_rows(names,ad_stats)
final <- merge(combine, names)

