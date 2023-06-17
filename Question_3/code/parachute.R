parachute = function(data, crit){
    temp_s = data %>% mutate(sieve = ifelse(album_name %in% crit, 1, 0))
    temp_s = temp_s %>% filter(sieve==1)
    temp_s = temp_s %>% mutate(unit = album_name)
}