reduce_ch = function(data,group){
    data= data %>% group_by(Genres)%>%mutate(avg_Installs = mean(Installs, na.rm=T),avg_rating = mean(Rating, na.rm=T))
    data = data %>%group_by(Genres)%>%reframe(avg_Installs,avg_rating)
    #data= data%>%order(avg_Installs,decreasing = TRUE)
}