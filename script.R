
# load libraries ----------------------------------------------------------
pacman::p_load(readr, janitor, ggthemes, here, viridis, tidyverse)


# load dataset ------------------------------------------------------------

salaries_df_1 <- read_csv(here("Latest_Data_Science_Salaries.csv")) %>% clean_names()


# assessing the dataset for outliers ------------------------------------------------------

# Indeed there're some extereme values but will be good to interrogate further/n What could be the hiring company, what's the level of expertise
# Job title, etc

salaries_df_1 %>% 
  filter(salary_currency == "United States Dollar") %>% 
  mutate(year = as.character(year)) %>% 
  ggplot(aes(x = year, y = salary)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6) +
  scale_y_continuous(labels = scales::comma)+
  geom_jitter(color="black", size=0.4, alpha=0.9) +
  theme_solarized() +
  theme(legend.position="none",
        plot.title = element_text(size = 14,face = "bold")) +
  labs(title = "Identifying outliers", x = "Year", y = "Salary, for currency in USDs")


salaries_df_1 %>% 
  filter(salary_currency == "British Pound Sterling") %>% 
  ggplot(aes(x = year, y = salary)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6) +
  scale_y_continuous(labels = scales::comma)+
  geom_jitter(color="black", size=0.4, alpha=0.9) +
  theme_clean() +
  theme(legend.position="none",
        plot.title = element_text(size=11)) +
  labs(title = "Identifying outliers", x = "Year", y = "Salary, for currency Pounds")
