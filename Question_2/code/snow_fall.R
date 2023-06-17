snow_fall = function(data){
    temp_sn = data %>% mutate(year = year(date))
    temp_sn = temp_sn %>% mutate(day = lubridate::yday(date))
    temp_sn = temp_sn %>% arrange(year) %>% summarize(max_snow = ifelse(snow_depth<=0,0,max(snow_depth)))

}