#theme_bw()
#theme_classic()
#ChangeName
#changemargins
#Changecolor

library(forcats)
attach(data)
data %>%
  mutate(name = fct_reorder(name, frequency)) %>%
  ggplot(aes(x=name, y=frequency, fill=as.factor(name))) + 
    geom_bar(stat="identity") +
    scale_fill_manual(values=c("#7F3C8D","#11A579","#3969AC","#F2B701","#E73F74","#80BA5A","#E68310","#008695")) +
    coord_flip() +
    theme_classic() +
    xlab("Location of Wellness") +
    ylab ("Frequency of Reporting") +
    labs(fill='Legend', 
         title = "Frequency of Wellness Locations on Campus", 
         caption="Graph Created in R Studio") +
    theme(
      plot.title = element_text(hjust=0.5, lineheight=0.9),
      plot.caption=element_text(color="#3969AC", face="italic")
    )
#hjust=1:placetitleonright
#hjust=2:placestitleonleft
library(wordcloud2)
attach(Buzzwords_for_Wellness_)
wordcloud2(Buzzwords_for_Wellness_, size=1.6, color='random-dark')