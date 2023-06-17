empty = function(data){
    output = data %>% add_column(good_q = NA) %>% add_column(pop_q = NA)
}