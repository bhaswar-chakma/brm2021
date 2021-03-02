library(readr)
df_raw <- read_csv("data/w5/dplyr-csv.csv")
# Select
df_small <- df_raw %>% 
  select(year_, ITEM5601, ITEM6001, ITEM6026, ITEM7250) 
# Rename
df_renamed <- df_small %>% 
  rename(
    year = year_,
    cname = ITEM6001,  
    cname = ITEM6001,          
    country = ITEM6026, 
    net_income = ITEM7250  
  )
# Mutate
df_mutated <- df_renamed %>% 
  mutate(portugal = case_when(country == "PORTUGAL" ~ TRUE,
                              country != "PORTUGAL" ~ FALSE),
         net_income_m = net_income/1e6)
  
# Filter
df_pt<- df_mutated %>% 
  filter(country == "PORTUGAL")

# Summarise
df_pt %>% 
  group_by(year) %>% 
  summarise(
    mean_m = mean(net_income_m, na.rm = TRUE),
    median_m = median(net_income_m, na.rm = TRUE),
    n = n()
  )
