old_gold = function(data,year){
    oldies = data %>% filter(release_year <= year) %>% filter(good_q>=3 & pop_q == 4 | good_q==4 & pop_q>=3)
}