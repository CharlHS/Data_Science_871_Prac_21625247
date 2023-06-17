sorting = function(data, tester1,quartile1, tester2, quartile2){
    temp = data %>% mutate(good_q = ifelse(tester1>=quartile1[['75%']],4,ifelse(tester1>=quartile1[['50%']],3,ifelse(tester1 >= quartile1[['25%']],2,1))))
    temp = temp %>% mutate(pop_q = ifelse(tester2>=quartile2[['75%']],4,ifelse(tester2>=quartile2[['50%']],3,ifelse(tester2 >= quartile2[['25%']],2,1))))
}