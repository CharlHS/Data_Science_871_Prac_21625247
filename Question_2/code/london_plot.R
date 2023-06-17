london_plot = function(data, y_axis, x_lab = "", y_lab= "", title_lab = ""){
    temp_c = data %>%
        ggplot()+
        geom_line(aes(x = day, y = y_axis), na.rm = T, alpha = 0.5, linewidth = 1)+
        theme_bw() + theme(legend.position = "bottom") + labs(x = x_lab,
                                                              y = y_lab, title = title_lab)+
        geom_hline(aes(yintercept = avg_rain), linetype = "solid", size = 1, alpha = 0.8, color = "red")

    temp_c
}
