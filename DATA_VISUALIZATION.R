#DATA VISUALIZATION USING GGPLOT
#LINE GRAPH
setwd("C:/Users/irfan/Documents")
library(tidyverse)

#Loding dataset
data()
BOD
?BOD

#Plotting time and demand
#METHOD ONE
ggplot(data = BOD,
       mapping = aes(x = Time,y = demand)) +
  geom_point(size = 4) +
  geom_line(colour = "red") + 
  labs(x = "TIME",y = "DEMAND", title = "BIOCHEMICAL OXYGEN DEMAND")

#METHOD TWO
ggplot(BOD, aes(Time,demand)) +
  geom_point(size = 3) +
  geom_line(colour = "red") +
  labs(title = "Biochemical Oxygen Demand",x ="TIME",y="DEMAND")

#CO2 DATA SET
data()
CO2
?CO2
View(CO2)

#PIPING THE DATA SET
CO2 %>%
  ggplot(aes(conc,uptake,colour = Treatment)) +
  geom_point(size = 3, alpha = 0.5) +
  geom_smooth(method = lm,se = F) +
  facet_wrap(~Type) + 
  labs(x= "Concentration",y = "Uptake",title = "CO2 UPTAKE IN GRASS PLANTS") +
  theme_bw()

#BOXPLOT VISUALIZATIION
CO2 %>%
  ggplot(aes(Treatment,uptake)) +
  geom_boxplot() +
  geom_point(alpha = 0.5,aes(size = conc,colour = Plant)) +  
  facet_wrap(~Type) +
  coord_flip() +
  labs(title = "CO2 UPTAKE AND CONCENTRATION IN PLANTS") +
  theme_bw()

#DEALING WITH BIG DATA SET
data()
mpg
?mpg
view(mpg)
mpg %>%
  filter(cty <25) %>%
  ggplot(aes(displ,cty)) +
  geom_point(alpha = 0.5,aes(size = trans,colour = drv)) +
  geom_smooth(method = lm) +
  facet_wrap(~year) +
  labs(x="Egine size",y ="MPG in the city",title = "FUEL EFFICIENCY") +
  theme_bw()

#SCARTER PLOT
#TWO OR MORE NUMERIC VARIABLES
msleep%>%
  filter(bodywt <2) %>%
  ggplot(aes(bodywt,brainwt)) +
  geom_point(aes(color = sleep_total, size = awake)) +
  geom_smooth(method = lm, se =F)

#DENSITY PLOT
msleep%>%
  drop_na(vore) %>%
  filter(vore == "herbi" | vore == "omni") %>%
  
  ggplot(aes(sleep_total,fill = vore)) +
  geom_density(alpha = 0.5) +
  theme_bw()
