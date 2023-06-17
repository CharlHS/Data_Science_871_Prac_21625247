comp_plot = function(data, y_axis, x_lab = "", y_lab= "", title_lab = "",colour = ""){
    temp_c = data %>%
        ggplot()+
        geom_line(aes(x = release_date, y = y_axis), na.rm = T, alpha = 0.8, linewidth = 1,color=colour)+
        theme_bw() + theme(legend.position = "bottom") + labs(x = x_lab,
                                                              y = y_lab, title = title_lab)

    temp_c
}