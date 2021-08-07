# Project-2-Covid-Data
Preparation of CDC covid data for analysis by Emily Zinn, Aarvin Rathod, and Lydia Deterding.

Proposal: 
	We used datasets from the Centers for Disease Control and Prevention (CDC) and World Population Review to compile data on COVID cases, deaths, and vaccination allocations, as well as state population data. The purpose of gathering his information is to provide a database that can aid in analysis of COVID-19 case and vaccination trends among states in the US. 

Some of the potential questions that could be answered by this data are:

•	Which state has the most cases/deaths, and which has the least? Does population density contribute to more cases/deaths? Adding population data allows you to analyze this by total counts, or by percent of the population which may provide better insights due to the variation in population from state to state. 
•	Is there a correlation between COVID cases/deaths, and the vaccine allocation for a state?
•	Is there a correlation between type of vaccine (Pfizer vs. Moderna vs. Johnson & Johnson), and the number of COVID cases/deaths for a state? 



Extract: 

Original data sources:

  o	CDC: COVID-19 Vaccinations in the United States Dataset
  
  Format: JSON
  
  https://data.cdc.gov/Vaccinations/COVID-19-Vaccinations-in-the-United-States-County/8xkx-amqh
  
  o	CDC: COVID-19 Case Surveillance Public Use Data with Geography
  
  Format: JSON
  
  https://data.cdc.gov/Case-Surveillance/COVID-19-Case-Surveillance-Public-Use-Data-with-Ge/n8mc-b4w4
  
  o	CDC: Conditions Contributing to COVID-19 Deaths by State Dataset
  
  Format:  JSON
  
  https://data.cdc.gov/NCHS/Conditions-Contributing-to-COVID-19-Deaths-by-Stat/hk9y-quqm
  
  o	CDC: COVID-19 Vaccine Distribution Allocations by Jurisdiction- Pfizer Dataset
   
   Format: JSON
   
   https://data.cdc.gov/Vaccinations/COVID-19-Vaccine-Distribution-Allocations-by-Juris/saz5-9hgg
  
  o	CDC: COVID-19 Vaccine Distribution Allocations by Jurisdiction – Moderna Dataset
   
   Format: JSON
   
   https://data.cdc.gov/Vaccinations/COVID-19-Vaccine-Distribution-Allocations-by-Juris/b7pe-5nws
  
  o	CDC: COVID-19 Vaccine Distribution Allocations by Jurisdiction- Janssen Dataset
  
   Format: JSON
   
   https://data.cdc.gov/Vaccinations/COVID-19-Vaccine-Distribution-Allocations-by-Juris/w9zu-fywh

  o	World Population Review: US States – Ranked by Population 2021 Dataset
  
   Format: CSV 
  
   https://worldpopulationreview.com/states
  
  o	State Abbreviations Dataset
   
   Format: JSON
  
   https://worldpopulationreview.com/states/state-abbreviations


Transform:

 We used Pandas to create data frames of our files. We reviewed each data frame to determine which columns would need to be dropped or edited. We used the .drop and .rename functions for those items on all of the data frames to remove columns that were not relevant to the questions in our proposal, as well as rename some columns with more descriptive names. 
	For the Moderna, Pfizer, and Johnson & Johnson data frames, we needed to group the data by jurisdiction so we used the .grouby function in both data frames, and then used .merge to join both data frames together with an outer join on “jurisdiction”. 

Load:

 We created a sqlite database through Python with the module sqlite3. We pushed all data frames into the sqlite database as tables so that both Python and SQL functions can be used to analyze the database. 
	These are the tables that we created:

covid_tracker – Shows total cases across the United States and its territories and also provides information about the individuals infected like gender, age, underlying conditions, etc. 

vaccine_allocation – Shows total allocation of Moderna, Pfizer, and Johnson & Johnson vaccinations per state/territory across the US. 

covid_death_tracker – Shows total number of COVID deaths per state/territory across the US. Also provides the age group and underlying conditions. 

population – Shows total population for each state in the US, and what percent of the total US population that state contains. Also shows density per square mile. 

state_names – Shows state names and their abbreviations to be able to connect data sets using either the name or abbreviation. 

vaccine _administration – Show count and percent of fully and partially vaccinated residents per state/territory. Also shows vaccination rate by age group and includes social vulnerability index for each state/territory. 



Why this topic was chosen:

 By compiling this data, we are able to provide a database that allows for analysis of correlations between cases/deaths, and vaccination allocations. With the recent spike in cases, this data could also possibly be used to forecast how specific states will be impacted by the current wave and what they can expect based on their vaccination rates if there is a correlation between vaccination allocations and COVID cases/deaths. We can also derive which particular state needs to improve their vaccination rates in order to protect its population. 
	

	

