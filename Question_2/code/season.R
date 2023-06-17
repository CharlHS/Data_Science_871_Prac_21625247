season = function(data){
    #temp_sea = data %>% mutate(month =format(as.Date(date, format = "%Y-%m-%d"),"%m"))
    temp_sea = data %>% mutate(year = year(date))
    winter = c("December", "January", "February")
    spring = c("March","April","May")
    summer = c("June","July","August")
    autumn = c("September","October","November")
    temp_sea = temp_sea %>% mutate(season = ifelse(month %in% winter,"winter",ifelse(month %in% spring, "spring",ifelse(month %in% summer, "summer", ifelse(month %in% summer, "summer","autumn")))))
    temp_sea = temp_sea %>% arrange(year) %>% group_by(season) %>% summarise(sunshine = mean(sunshine, na.rm=T),max_temp = mean(max_temp, na.rm=T),mean_temp = mean(mean_temp, na.rm=T),min_temp = mean(min_temp, na.rm=T),precipitation = mean(precipitation, na.rm=T))
}