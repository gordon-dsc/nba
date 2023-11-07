
library(rvest)
library(stringr) # for str_remove()
library(readr) # for parse_date()
library(tibble) # for tibble()
library(tidyverse)



read_html("https://en.wikipedia.org/wiki/List_of_NBA_All-Stars") |> # URL 
  html_elements(".fn") |> 
  html_element("a") |>
  html_text2() -> all_stars

tibble(all_stars) -> all_stars 


all_stars |>
  filter(all_stars %in% c("Kevin Durant", "Stephen Curry", "Kyrie Irving",
                          "Joel Embiid", "Kawhi Leonard", "Paul George",
                          "James Harden", "Kemba Walker", "Khris Middleton", "Anthony Davis",
                          "Nikola Jokić", "Klay Thompson", "Ben Simmons", "Damian Lillard",
                          "Blake Griffin", "Russell Westbrook", "D'Angelo Russell", "LaMarcus Aldridge", 
                          "Nikola Vučević", "Karl-Anthony Towns", "Bradley Beal", "Kyle Lowry", "Dwyane Wade",
                          "Dirk Nowitzki")) -> all_stars_2019


