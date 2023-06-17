new_pop = function(data, year, popularity){
    newies = data %>% filter(release_year >=year) %>% filter(pop_q == popularity)
}