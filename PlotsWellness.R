#NotesOnTheGraph
#theme_bw()
#theme_classic()
#ChangeName
#changemargins
#Changecolor

library(forcats)
attach(data)
data %>% #GraphforQualitativeData
  mutate(name = fct_reorder(name, frequency)) %>%
  ggplot(aes(x=name, y=frequency, fill=as.factor(name))) + 
    geom_bar(stat="identity") +
    scale_fill_manual(values=c("#7F3C8D","#11A579","#3969AC","#F2B701","#E73F74","#80BA5A","#E68310","#008695")) +
#ColorsareFromCARTOcolorsfromtheirBOLD
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
##Wordcloud Creation
library(wordcloud2)
attach(Buzzwords_for_Wellness_)
wordcloud2(Buzzwords_for_Wellness_, size=1.6, color='random-dark')
#Grouped Bargraph Creation
#CreateSubset 
public<-subset(Wellness_Research_Mastico_Numerical_Version, `Type of College`=="1")
private<-subset(Wellness_Research_Mastico_Numerical_Version, `Type of College`=="2")
#CreateTables
PublicWellness<- table(public$`Wellness Definition`)
PrivateWellness<- table(private$`Wellness Definition`)
#createDataFramesformoredetail
df2 <- data.frame(college=rep(c("Private", "Public"), each=5),
       def=rep(c("Holistic","Mind and Body","Unclear","Physical Only","Unmet Community Needs"),2),
       freq=c(19,43,2,30,0,17,51,3,31,2))
#createbargraph
ggplot(data=df2, aes(x=def, y=freq, fill=college)) +
  geom_bar(stat="identity", position=position_dodge()) +
  scale_fill_manual(values=c("#E68310","#008695")) +
  theme_classic() +
  xlab("Wellness Definition") +
  ylab("Frequency") +
  labs(fill="Legend", 
       title = "Public vs. Private University Wellness Definitions", 
       caption="Graph Created in R Studio") +
  theme(
    plot.title = element_text(hjust=0.5, lineheight=0.9),
    plot.caption=element_text(color="black", face="italic")
  )
