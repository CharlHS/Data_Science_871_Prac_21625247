split = function(data, crit, thresh){
    temp_sp = data %>% mutate(sieve = ifelse(crit >= thresh, 1, 0))
    temp_sp_1 = temp_sp %>% filter(sieve==1)
    temp_sp_1 = temp_sp_1 %>% arrange(location) %>% group_by(date) %>% summarise(total_cases_per_million = mean(total_cases_per_million,na.rm = T),total_deaths_per_million = mean(total_deaths_per_million,na.rm = T))
    temp_sp_1 = temp_sp_1 %>% mutate(state = "Above the 75th percentile")
    temp_sp_0 = temp_sp %>% filter(sieve==0)
    temp_sp_0 = temp_sp_0 %>% arrange(location) %>% group_by(date) %>% summarise(total_cases_per_million = mean(total_cases_per_million,na.rm = T),,total_deaths_per_million = mean(total_deaths_per_million,na.rm = T))
    temp_sp_0 = temp_sp_0 %>% mutate(state = "Below the 75th percentile")
    out_sp = rbind(temp_sp_1,temp_sp_0)
    out_sp = out_sp %>% mutate(unit = state)
}