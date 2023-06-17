age = function(data){
    data = data %>% mutate(date = lubridate::mdy("Last Updated"))
    data
}