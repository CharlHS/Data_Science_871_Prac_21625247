cloudy = function(data){
    temp_c = data %>% mutate(cloudy = ifelse(cloudcover<=3,0,1))
    temp_c = temp_c %>% mutate(year = year(date))
    temp_c = temp_c %>% mutate(month = lubridate::`month<-`(date))
    temp_c = temp_c %>% arrange(year) %>% group_by(day) %>% summarise(rain = mean(rain, na.rm=T))
}
