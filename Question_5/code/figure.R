figure = function(play_adv){
    ht =hux(
        Genres = play_adv$Genres,
        "Average amount of Installs" = play_adv$avg_Installs,
        "Average rating" = play_adv$avg_rating,
        add_colnames = TRUE)
    bold(ht)[1,]           <- TRUE
    bottom_border(ht)[1,]  <- 0.4
    align(ht)[,2]          <- "right"
    right_padding(ht)      <- 10
    left_padding(ht)       <- 10
    width(ht)              <- 0.35
    number_format(ht)      <- 2

    ht

}