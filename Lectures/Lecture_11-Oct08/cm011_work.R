#STAT 545
#lecture 011 work

#blog post about setwd()
##https://www.tidyverse.org/articles/2017/12/workflow-vs-script/

#set up packages
library(tidyverse)
library(gapminder)
library(here)

#bad bad bad
setwd("C:\\Users\\tbake\\Documents\\UBC\\STAT 545\\git\\STAT545-participation\\Lectures\\Lecture_11-Oct08")

#save gapminer as csv
write_csv(gapminder, "./gapminder.csv")

#read my csv file
gm <- read_csv("./gapminder.csv")

  #doing this using here::
  here::set_here() #this puts a .here file in my working directory
  new.path1 <- here::here("gapminder__.csv") #this however doesn't create path to the dir containing .here because it encounters an Rproj file first
  write_csv(gm,new.path1) #this will write to main participation repo
  new.path2 <- here::here("Lectures","Lecture_11-Oct08","gapminder__.csv") #this creates the path I want
  write_csv(gm,new.path2) #this will write to my Oct08 lecture folder

  #NOTES:
  #here::here() works differently depending file type:
  # - in an Rmd file, here::here would look in the folder that hosts the Rmd file
  # - in an R script, here::here would look for nearest root folder with Rproj file
  # -- 
  # - also the set_here function puts a .here file in your working directory,
  # -- but if your .here containing folder is within a file path that contains a .Rproj file at a lower level, 
  # --- then it will set the here location as the folder with the Rproj file, not the folder it just made the .here file in 
  
  
#view data
View(gm)

#process short summary
gm_summ <- gapminder %>%
            group_by(continent) %>%
            summarize(maxGDP=max(gdpPercap))
View(gm_summ)

#save summary data
write_csv(gm_summ, "./gapminder_summary.csv")


#plot the summary
gm_summ %>%
  ggplot(aes(x=continent, y=maxGDP)) +
  geom_col() +
  theme_bw()


#load outside data
data_url <- "http://gattonweb.uky.edu/sheather/book/docs/datasets/GreatestGivers.xls"
file.name <- basename(data_url) #using the existing file name from a url or file path
#saved.file <- file.name
saved.file <- here::here("Lectures","Lecture_11-Oct08", file.name) #construct file path
download.file(url=data_url, 
              mode="wb", #need this arg for a workbook, excel file
              destfile=saved.file) #downloading the file
gg <- readxl::read_excel(saved.file,
                         trim_ws = TRUE)


#load Firas' data
firas.file <- here::here("Lectures","Lecture_11-Oct08", "Firas-MRI.xlsx") #construct file path
ff <- readxl::read_excel(firas.file,
                         trim_ws = TRUE,
                         range=c("A1:L12") ) 
ff2 <- ff %>%
        select(-"Weighted Average") %>%
        pivot_longer(cols = 'Slice 1':'Slice 8',
                     names_sep=" ",
                     names_to= c("sl", "slice"),
                     values_to="value") %>%
        select(-"sl")
  




#load my data
df <- read.delim("C:\\users\\tbake\\Dropbox (IEG)\\Integral Ecology\\Calculation Tools\\AWSC\\Plot database analysis\\BC db\\raw data\\env_raw.txt", 
                 sep="\t", 
                 stringsAsFactors = F)


