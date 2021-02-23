library(dplyr)
library(readxl)
read_excel("data/w4/mcap20210221.xlsx", sheet = "global100b") # i put my data in the subfolder w4
df_global <- read_excel("data/w4/mcap20210221.xlsx", sheet = "global100b")

######################
# Check column names
######################
colnames(df_global)
names(df_global)

#############################
# Number of Columns and Rows
#############################
nrow(df_global)
ncol(df_global)
###################
# Structure & Class
#####################
str(df_global)
glimpse(df_global)# new
class(df_global)
#########
# Rename
########
names(df_global)
# We can use column position or name
rename(df_global, code = 1) 
rename(df_global, mcap = "Company Market Cap") 

# Does anything get stored?
# Nothing gets stored; you just see output
df_global2 <- rename(df_global, mcap = 3)# now check!

###############################
# Many variables to be renamed?
###############################
# Pipe operator: %>% 
# Windows: ctrl + shift + m
# Mac: cmd + shift + m
names(df_global)# Let's check the names again
df_global %>% 
  rename(code = 1,
         cname = "Company Common Name",
         mcap = "Company Market Cap",
         country = "Country of Headquarters",
         industry = "TRBC Industry Name")

# store it as df_global
df_global <- df_global %>% 
  rename(code = 1,
         cname = "Company Common Name",
         mcap = "Company Market Cap",
         country = "Country of Headquarters",
         industry = "TRBC Industry Name")
# remove df_global2
rm(df_global2)
######################
# How many industries?
######################
table(df_global$industry)
table(df_global$industry, df_global$country)
#################################################################
# Get data for only Pharmaceuticals; Lowest & Largest Market Cap
#################################################################
df_global %>% 
  filter(industry == "Pharmaceuticals")

# Lowest Market Cap; use arrange()
df_global %>% 
  filter(industry == "Pharmaceuticals") %>% 
  arrange(mcap)

# Largest
df_global %>% 
  filter(industry == "Pharmaceuticals") %>% 
  arrange(- mcap) # or arrange(desc(mcap))

##############################
# keep only required variables
##############################
# suppose we only need cname and mcap
df_global %>% 
  select(cname, mcap)

#################
#     Stats
################
mean(df_global$mcap)
median(df_global$mcap)
min(df_global$mcap)
max(df_global$mcap)
summary(df_global$mcap)
summary(df_global)# whole data frame
