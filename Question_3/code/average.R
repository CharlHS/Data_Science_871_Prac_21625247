average = function(data){
    data = data %>% arrange(release_date) %>% group_by(album) %>% reframe(popularity=mean(popularity,na.rm=T),acousticness=mean(acousticness,na.rm=T),danceability=mean(danceability,na.rm=T),energy=mean(energy,na.rm=T),instrumentalness=mean(instrumentalness,na.rm=T),liveness=mean(liveness,na.rm=T),loudness=mean(loudness,na.rm=T),speechiness=mean(speechiness,na.rm=T),tempo=mean(tempo,na.rm=T),valence=mean(valence,na.rm=T),release_date)
    data = unique(data)
}