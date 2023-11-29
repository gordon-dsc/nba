# NBA All Star Players and Stats 1980-2022

## 

### README.md

1.  Software and platform

    -   Software (R, RStudio, Git)

    -   Packages (tidyverse (2.0.0), httr (0.2.3), and rvest (1.0.3))

    -   Platform (macOS 14.1)

2.  Documentation map

    -   project/
        -   README.md

        -   example_analysis.qmd

        -   data/

            -   imported_data/

                -   cleaned_all_star_data.csv

                -   metadata/

                    -   codebook.txt

                    -   source.txt

            -   cleaned_data/

                -   cleaned_all_star_data.csv

                -   metadata/

                    -   codebook.txt

                    -   source.txt

        -   scripts/

            -   import.qmd

            -   cleaning.qmd

            -   exploration.qmd

        -   output/

            -   final_data.csv

3.  Instructions for reproducing your work

    -   Import.qmd

        -   First install the packages within the import.qmd file. Next run the web scraping code chunk as well as the following code chunk that scrapes the NBA all star names for each year (1980-2022) and makes a data frame. Run the following code chunks to create the three functions for the API. The next two code chunks will pull the players names and their stats and then write them to a csv file.

    -   cleaning.qmd

        -   First, run the code chunk to install the needed packages. Run the next code chunk which Imports the .csv file we created on the import step. Next, run the following code chunk that runs clean names on the data frame to make sure all the variable names are syntactical. In the same chunk we remove the variable player_id and season because they will not be needed for the next exploration step. Run the final code chunk to write the new cleaned .csv file.

    -   exploration.qmd

        -   Run the first code chunk to import the necessary package for exploring the data. Run all the following code chunks to see answers to the questions that are asked above each corresponding code chunk.
