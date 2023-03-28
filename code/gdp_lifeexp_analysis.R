library(tidyverse)


gapminder_1997 <- read_csv("gapminder_1997.csv")
str(gapminder_1997)

?read_csv
getwd()

sum(5,6)
round(3.1415,3)
round(2, 3.1415)
round(x = 3.1415, digits = 2)

# all together 
ggplot(data = gapminder_1997) + 
  aes(x = gdpPercap) +
  labs(x = "GDP Per Capita") +
  aes(y = lifeExp) + 
  labs(y = "Life Expectancy") + 
  geom_point() + 
  labs(title = "Do people in wealthy countries live longer?") +
  aes(color = continent) + 
  scale_color_brewer(palette = "Set1") +
  aes(size = pop/1000000) +
  labs(size = "Population (in millions)")
  
  ggplot(data = gapminder_1997) + 
    aes(x = gdpPercap, y = lifeExp, color = continent, size = pop/1000000) + 
    geom_point() +
    scale_color_brewer(palette = "Set1") +
    labs(x = "GDP Per Capita", y = "Life Expectancy", 
         title = "Do people in wealthy countries live longer?", 
         size = "Population (in millions)")
  
  
  # load in a larger dataset 

  gapminder_data <- read_csv("gapminder_data.csv")
  dim(gapminder_data)
  
  ggplot(data = gapminder_data) +
    aes(x = year, y = lifeExp, group = country, color = continent) +
    geom_line()
  
  # Discrete plos 
  
  ggplot(data = gapminder_1997) + 
    aes(x = continent, y = lifeExp) +
    geom_boxplot()
  
  ggplot(data = gapminder_1997) + 
    aes(x = continent, y = lifeExp) +
    geom_violin() +
    geom_point()
  
  ggplot(data = gapminder_1997) + 
    aes(x = continent, y = lifeExp) +
    geom_violin() +
    geom_jitter()
  
  ggplot(data = gapminder_1997) + 
    aes(x = continent, y = lifeExp) +
    geom_jitter() +
    geom_violin() 
  
  # Master aesthetics 
  ggplot(data = gapminder_1997, aes(x = continent, y = lifeExp)) + 
    geom_violin() +
    geom_jitter(aes(size = pop), color = "pink")
     
  
  ggplot(data = gapminder_1997, aes(x = continent, y = lifeExp)) + 
    geom_violin(aes(fill = continent)) 
  
  
  ggplot(data = gapminder_1997, aes(x = continent, y = lifeExp)) + 
    geom_violin(aes(fill = "springgreen")) 

  ggplot(data = gapminder_1997, aes(x = continent, y = lifeExp)) + 
    geom_violin(fill = "springgreen")   
  
  
  # Univariate plots 
  
  ggplot(gapminder_1997) + 
    aes(x = lifeExp) + 
    geom_histogram(bins = 20, binwidth = 0.5)
  
  
  # Plot themes
  
  ggplot(gapminder_1997) + 
    aes(x = lifeExp) + 
    geom_histogram(bins = 20) + 
    theme_minimal()
    
    
  ggplot(gapminder_1997) + 
    aes(x = lifeExp) + 
    geom_histogram(bins = 20) + 
    theme_classic() + 
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
    
 # facet wrap   
  ggplot(gapminder_1997) + 
    aes(x = gdpPercap, y = lifeExp) +
    geom_point() + 
    facet_wrap(vars(continent))
    
  
  # facet grid
  awsome_plot <- ggplot(gapminder_1997) + 
    aes(x = gdpPercap, y = lifeExp) +
    geom_point() + 
    facet_grid(rows = vars(continent))  

    
  ggplot(gapminder_1997) + 
    aes(x = gdpPercap, y = lifeExp) +
    geom_point() + 
    facet_grid(vars(continent))    

  
  ggsave(awsome_plot, file = "awsome_plot.jpg", width = 6, height = 4)    
  
  
  # exercise
  # violin plot of continent and life expectancy
  # color mapped to continent
  # assigned to an object "violin plot"
  # black and white theme 
  # save it as "awsome_violin_plot.jpg"
  
  
 awsome_violin_plot <- ggplot(data = gapminder_1997) +
    aes(x = continent, y = lifeExp) + 
    geom_violin(aes(color = continent)) +
    labs(x = "Continent", y = "Life Expectancy", color = "Continent") +
    theme_bw()
  
    ggsave(awsome_violin_plot, "awsome_violin_plot.jpg", width = 6, height = 4)  

  
  awsome_violin_plot_2 <- ggplot(data = gapminder_1997) +
    aes(x = continent, y = lifeExp) + 
    geom_violin(aes(fill = continent)) +
    labs(x = "Continent", y = "Life Expectancy", fill = "Continent") +
    theme_bw()

  ggsave(awsome_violin_plot_2, "awsome_violin_plot_2.jpg", width = 6, height = 4) 

  awsome_violin_plot
  awsome_violin_plot_2  
  
  violin_plot <- ggplot(data = gapminder_1997) +
    aes(x = continent, y = lifeExp) + 
    geom_violin(aes(color = continent)) +
    labs(x = "Continent", y = "Life Expectancy", color = "Continent") +
    theme_bw()
  
  violin_plot
  
  ggsave(violin_plot, file = "awsome_violin_plot.jpg") 
  