sieve = function(data, crit){
    temp_s = data %>% mutate(sieve = ifelse(location %in% crit, 1, 0))
    temp_s = temp_s %>% filter(sieve==1)
    temp_s = temp_s %>% mutate(unit = location)
}