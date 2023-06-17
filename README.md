Charl Schoeman - 21625247

Data Science Practical Test

17 June 2023

``` r
# Clean environment
rm(list = ls())
gc()
```

    ##          used (Mb) gc trigger (Mb) max used (Mb)
    ## Ncells 464356 24.8     996538 53.3   660385 35.3
    ## Vcells 857692  6.6    8388608 64.0  1770619 13.6

``` r
# Load Relevant packages
library(tidyverse)
```

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.2     ✔ readr     2.1.4
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.0
    ## ✔ ggplot2   3.4.2     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.2     ✔ tidyr     1.3.0
    ## ✔ purrr     1.0.1     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

``` r
library(pacman)
library(fmxdat)
pacman::p_load(Texevier)
pacman::p_load(huxtable)
list.files('code/', full.names = T, recursive = T) %>% .[grepl('.R', .)] %>% as.list() %>% walk(~source(.))
```

Question 1: Covid-19

Common misconceptions: (Do these 3, add 2 of own from data)

1.  African countries’ experience vs others (look at total deaths per
    million)

2.  Patterns for countries with specific concentrated groupings (life
    expectancy, )

3.  Increases in hospitalization facilities (lagging with ICU admissions
    or leading?)

Own:

1.  How does median age of a country affect mortality?

2.  Which country reached the highest total vaccination rate per
    continent, and when?

Create rmd for Question 1:

``` r
#Texevier::create_template(directory = "D:/User folders/Documents/Practical/21625247",template_name = "Question_1", build_project = F, open_project = F)
```

Import the data:

``` r
covid_df <- read_csv("D:/User folders/Documents/Practical/21625247/data/Covid/owid-covid-data.csv")
```

    ## Rows: 194260 Columns: 67
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr   (4): iso_code, continent, location, tests_units
    ## dbl  (62): total_cases, new_cases, new_cases_smoothed, total_deaths, new_dea...
    ## date  (1): date
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
descr <- read_csv("D:/User folders/Documents/Practical/21625247/data/Covid/covid_data_description.csv")
```

    ## Rows: 67 Columns: 4
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (4): column, source, category, description
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
deaths <- read_csv("D:/User folders/Documents/Practical/21625247/data/Covid/Deaths_by_cause.csv")
```

    ## Rows: 7273 Columns: 36
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (3): Entity, Code, Number of executions (Amnesty International)
    ## dbl (33): Year, Deaths - Meningitis - Sex: Both - Age: All Ages (Number), De...
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

First, create a list of countries to simplify things:

``` r
countries = unique(covid_df$location)
print(countries)
```

    ##   [1] "Afghanistan"                      "Africa"                          
    ##   [3] "Albania"                          "Algeria"                         
    ##   [5] "Andorra"                          "Angola"                          
    ##   [7] "Anguilla"                         "Antigua and Barbuda"             
    ##   [9] "Argentina"                        "Armenia"                         
    ##  [11] "Aruba"                            "Asia"                            
    ##  [13] "Australia"                        "Austria"                         
    ##  [15] "Azerbaijan"                       "Bahamas"                         
    ##  [17] "Bahrain"                          "Bangladesh"                      
    ##  [19] "Barbados"                         "Belarus"                         
    ##  [21] "Belgium"                          "Belize"                          
    ##  [23] "Benin"                            "Bermuda"                         
    ##  [25] "Bhutan"                           "Bolivia"                         
    ##  [27] "Bonaire Sint Eustatius and Saba"  "Bosnia and Herzegovina"          
    ##  [29] "Botswana"                         "Brazil"                          
    ##  [31] "British Virgin Islands"           "Brunei"                          
    ##  [33] "Bulgaria"                         "Burkina Faso"                    
    ##  [35] "Burundi"                          "Cambodia"                        
    ##  [37] "Cameroon"                         "Canada"                          
    ##  [39] "Cape Verde"                       "Cayman Islands"                  
    ##  [41] "Central African Republic"         "Chad"                            
    ##  [43] "Chile"                            "China"                           
    ##  [45] "Colombia"                         "Comoros"                         
    ##  [47] "Congo"                            "Cook Islands"                    
    ##  [49] "Costa Rica"                       "Cote d'Ivoire"                   
    ##  [51] "Croatia"                          "Cuba"                            
    ##  [53] "Curacao"                          "Cyprus"                          
    ##  [55] "Czechia"                          "Democratic Republic of Congo"    
    ##  [57] "Denmark"                          "Djibouti"                        
    ##  [59] "Dominica"                         "Dominican Republic"              
    ##  [61] "Ecuador"                          "Egypt"                           
    ##  [63] "El Salvador"                      "Equatorial Guinea"               
    ##  [65] "Eritrea"                          "Estonia"                         
    ##  [67] "Eswatini"                         "Ethiopia"                        
    ##  [69] "Europe"                           "European Union"                  
    ##  [71] "Faeroe Islands"                   "Falkland Islands"                
    ##  [73] "Fiji"                             "Finland"                         
    ##  [75] "France"                           "French Polynesia"                
    ##  [77] "Gabon"                            "Gambia"                          
    ##  [79] "Georgia"                          "Germany"                         
    ##  [81] "Ghana"                            "Gibraltar"                       
    ##  [83] "Greece"                           "Greenland"                       
    ##  [85] "Grenada"                          "Guam"                            
    ##  [87] "Guatemala"                        "Guernsey"                        
    ##  [89] "Guinea"                           "Guinea-Bissau"                   
    ##  [91] "Guyana"                           "Haiti"                           
    ##  [93] "High income"                      "Honduras"                        
    ##  [95] "Hong Kong"                        "Hungary"                         
    ##  [97] "Iceland"                          "India"                           
    ##  [99] "Indonesia"                        "International"                   
    ## [101] "Iran"                             "Iraq"                            
    ## [103] "Ireland"                          "Isle of Man"                     
    ## [105] "Israel"                           "Italy"                           
    ## [107] "Jamaica"                          "Japan"                           
    ## [109] "Jersey"                           "Jordan"                          
    ## [111] "Kazakhstan"                       "Kenya"                           
    ## [113] "Kiribati"                         "Kosovo"                          
    ## [115] "Kuwait"                           "Kyrgyzstan"                      
    ## [117] "Laos"                             "Latvia"                          
    ## [119] "Lebanon"                          "Lesotho"                         
    ## [121] "Liberia"                          "Libya"                           
    ## [123] "Liechtenstein"                    "Lithuania"                       
    ## [125] "Low income"                       "Lower middle income"             
    ## [127] "Luxembourg"                       "Macao"                           
    ## [129] "Madagascar"                       "Malawi"                          
    ## [131] "Malaysia"                         "Maldives"                        
    ## [133] "Mali"                             "Malta"                           
    ## [135] "Marshall Islands"                 "Mauritania"                      
    ## [137] "Mauritius"                        "Mexico"                          
    ## [139] "Micronesia (country)"             "Moldova"                         
    ## [141] "Monaco"                           "Mongolia"                        
    ## [143] "Montenegro"                       "Montserrat"                      
    ## [145] "Morocco"                          "Mozambique"                      
    ## [147] "Myanmar"                          "Namibia"                         
    ## [149] "Nauru"                            "Nepal"                           
    ## [151] "Netherlands"                      "New Caledonia"                   
    ## [153] "New Zealand"                      "Nicaragua"                       
    ## [155] "Niger"                            "Nigeria"                         
    ## [157] "Niue"                             "North America"                   
    ## [159] "North Korea"                      "North Macedonia"                 
    ## [161] "Northern Cyprus"                  "Northern Mariana Islands"        
    ## [163] "Norway"                           "Oceania"                         
    ## [165] "Oman"                             "Pakistan"                        
    ## [167] "Palau"                            "Palestine"                       
    ## [169] "Panama"                           "Papua New Guinea"                
    ## [171] "Paraguay"                         "Peru"                            
    ## [173] "Philippines"                      "Pitcairn"                        
    ## [175] "Poland"                           "Portugal"                        
    ## [177] "Puerto Rico"                      "Qatar"                           
    ## [179] "Romania"                          "Russia"                          
    ## [181] "Rwanda"                           "Saint Helena"                    
    ## [183] "Saint Kitts and Nevis"            "Saint Lucia"                     
    ## [185] "Saint Pierre and Miquelon"        "Saint Vincent and the Grenadines"
    ## [187] "Samoa"                            "San Marino"                      
    ## [189] "Sao Tome and Principe"            "Saudi Arabia"                    
    ## [191] "Senegal"                          "Serbia"                          
    ## [193] "Seychelles"                       "Sierra Leone"                    
    ## [195] "Singapore"                        "Sint Maarten (Dutch part)"       
    ## [197] "Slovakia"                         "Slovenia"                        
    ## [199] "Solomon Islands"                  "Somalia"                         
    ## [201] "South Africa"                     "South America"                   
    ## [203] "South Korea"                      "South Sudan"                     
    ## [205] "Spain"                            "Sri Lanka"                       
    ## [207] "Sudan"                            "Suriname"                        
    ## [209] "Sweden"                           "Switzerland"                     
    ## [211] "Syria"                            "Taiwan"                          
    ## [213] "Tajikistan"                       "Tanzania"                        
    ## [215] "Thailand"                         "Timor"                           
    ## [217] "Togo"                             "Tokelau"                         
    ## [219] "Tonga"                            "Trinidad and Tobago"             
    ## [221] "Tunisia"                          "Turkey"                          
    ## [223] "Turkmenistan"                     "Turks and Caicos Islands"        
    ## [225] "Tuvalu"                           "Uganda"                          
    ## [227] "Ukraine"                          "United Arab Emirates"            
    ## [229] "United Kingdom"                   "United States"                   
    ## [231] "United States Virgin Islands"     "Upper middle income"             
    ## [233] "Uruguay"                          "Uzbekistan"                      
    ## [235] "Vanuatu"                          "Vatican"                         
    ## [237] "Venezuela"                        "Vietnam"                         
    ## [239] "Wallis and Futuna"                "Western Sahara"                  
    ## [241] "World"                            "Yemen"                           
    ## [243] "Zambia"                           "Zimbabwe"

The list is used to see which countries are of value and can be used for
insights.

Isolate the required regions (continents)

This is done in the
