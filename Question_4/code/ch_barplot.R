ch_barplot = function(data){
    ggplot()+
        geom_bar(aes(data$genre), fill = "green", alpha = 0.65)+
        labs(x = "Genre", y = "Number of movies", title = "Most popular genres")
}