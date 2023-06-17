barp = function(data,x_axis,y_axis){
    data %>%
        ggplot() +
        geom_bar(aes(x = x_axis, y = y_axis), stat = "identity") +
        # scale_


        theme_bw() +
        theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
        labs(x = "", y = "")
}