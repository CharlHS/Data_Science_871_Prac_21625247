split_under = function(data, crit, thresh){
    temp_sp = data %>% mutate(sieve = ifelse(crit < thresh, 1, 0))
    temp_sp = temp_sp %>% filter(sieve==1)
    temp_sp = temp_sp %>% arrange(location) %>% group_by(date) %>% summarise(total_cases = mean(total_cases,na.rm = T))
    temp_sp = temp_sp %>% mutate(State = "0")
}