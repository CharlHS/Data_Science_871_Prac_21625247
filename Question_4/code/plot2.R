plot2 = function(data){
    g = data%>%
        ggplot()+
        geom_line(aes(x = release_year, y = avg, color = age_certification), alpha = 0.8, size =1)
    g <- g + theme_bw() + theme(legend.position = "bottom") + labs(x = "Release Year",
                                                                   y = "Average IMDB votes", title = "IMDB votes for different age restriction shows")
    pacman::p_load(ggthemes)
    g + facet_wrap(~age_certification, scales = "free_y") + ggthemes::scale_color_wsj()


    }