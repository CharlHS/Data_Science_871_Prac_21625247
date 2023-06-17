comp_plot = function(data, y_axis, x_lab = "", y_lab= "", title_lab = ""){
    temp_c = data %>%
        ggplot()+
        geom_line(aes(x = date, y = y_axis, color = unit), na.rm = T, alpha = 0.8, linewidth = 1)+
        facet_wrap(~unit, scales = "free_y")+
        theme_bw() + theme(legend.position = "bottom") + labs(x = x_lab,
                                                              y = y_lab, title = title_lab)

    temp_c
}
