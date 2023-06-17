assess = function(data){
    a = quantile(data, 0.75, na.rm=T)
    b = quantile(data, 0.5, na.rm=T)
    c = quantile(data, 0.25, na.rm=T)
    output = c(a,b,c)
}