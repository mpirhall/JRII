my_df <- data.frame(names = c("joe","jenny","bob","sue"), 
                    age = c(45, 27, 38,51), 
                    knows_r = c(FALSE, TRUE, TRUE,FALSE), 
                    stringsAsFactors = FALSE)
#dyplr examples
#selecting data with diplyr
iris_select <- iris %>%
  select(Petal.Length, Petal.Width, Species) %>%
as_tibble()
iris_select

#filtering data with diplyr by a Species
iris_select_filter<- iris_select %>%
  filter(Species=="virginica")
iris_select_filter

#mutating (manipulaitng data with diplyr)
iris_petal_ratio <- iris %>%
  mutate(petal_ratio=Petal.Width/Petal.Length) %>%
  as_tibble()
iris_petal_ratio

#group by and summarize commands
iris_petal_ratio_species <- iris %>%
  select(species = Species, petal_width = Petal.Width, petal_length = Petal.Length) %>%
  mutate(petal_ratio = petal_width/petal_length) %>%
  group_by(species) %>%
  summarize(mean_petal_ratio = mean(petal_ratio),
            sd_petal_ratio = sd(petal_ratio),
            median_petal_ratio = median(petal_ratio))
iris_petal_ratio_species

library(ggplot2)
library(ggthemes)
library(hrbrthemes)
library(plotly)
iris_gg <- ggplot(iris,aes(x=Petal.Length,y=Petal.Width)) +
      geom_point(aes(color=Species, shape=Species),size=2)+ labs(title="Iris Petal Measurements",
                            x="Petal Length (cm)", y="Petal Width (cm)") +
  geom_smooth(aes(group=Species, color=Species), method="lm") +
  #theme_ipsum()
ggplotly(iris_gg)