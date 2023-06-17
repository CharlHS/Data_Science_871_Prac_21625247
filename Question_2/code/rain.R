rain = function(data){
    temp_r = data %>% mutate(rain = ifelse(precipitation<=1,0,1))
    temp_r = temp_r %>% mutate(year = year(date))
    temp_r = temp_r %>% mutate(day = lubridate::yday(date))
    temp_r = temp_r %>% arrange(year) %>% group_by(day) %>% summarise(rain = mean(rain, na.rm=T))
}
