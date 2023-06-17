tidy_CH = function(data){
    output = data %>% group_by(title) %>% reframe(good_q,pop_q,production_countries, release_year, age_certification, genres, imdb_votes)
    output = unique.data.frame(output)
}