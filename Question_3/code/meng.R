meng = function(data){
    data = data %>% mutate(album.x=album.y,popularity.x=popularity.y,acousticness.x=acousticness.y,danceability.x=danceability.y,energy.x=energy.y,instrumentalness.x=instrumentalness.y,liveness.x=liveness.y,loudness.x=loudness.y,speechiness.x=speechiness.y,tempo.x=tempo.y,valence.x=valence.y)
}