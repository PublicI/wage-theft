install.packages("formattable")
install.packages("ipumsr")
install.packages("psych")

library(formattable)
library(ggplot2)
library(ipumsr)
library(lubridate)
library(psych)
library(tidyverse)

# Data import

# IPUMS data (2019 ACS)

citizenship_industry <- read_ipums_micro(ddi = "data/citizenship_industry.xml",
                                         data_file = "data/citizenship_industry.dat")

# Industry codes crosswalk
census_naics_crosswalk <- read_csv("data/census_naics_crosswalk.csv",
                                   col_types = cols(.default = "c"))

# CASE_ACT_EER_SUM

col_names_case_act_eer_sum <- c("CASE_ID", "ACT_ID", "CASE_EER_ID", "ER_EE_VIOL", "TTL_ACT_VIOLATIONS", "AMT_BW_COMPUTED", "AMT_BW_ASSESSED", "AMT_LD_ASSESSED", "TTL_BW_PAID", "TTL_CMP_PAID", "RESOLUTION_DATE", "RESOLUTION_EE_CNT", "RESOLUTION_BW_AMT", "RESOLUTION_CMP_AMT", "DATE_BW_PAID", "DATE_CMP_PAID", "FLAG_INCLUDE", "DATE_CHANGED")

case_act_eer_sum <- read_delim("data/case_act_eer_sum.txt",
                               "|",
                               col_names = col_names_case_act_eer_sum)

# CASE_ACT_EER_VIOL

col_names_case_act_eer_viol <- c("CASE_ID", "ACT_ID", "CASE_EER_ID", "VIOLATION_ID", "HAZ_OCCP_ID", "ACT_SPECIFIC_INFO", "ER_EE_VIOL", "VIOLATION_TYPE", "DATE_BEG_VIOL", "DATE_END_VIOL", "CMP_AMT_AT_INVEST", "AMT_BW_COMPUTED", "AMT_BW_ASSESSED", "AMT_LD_ASSESSED", "EE_AGE_AT_VIOL", "INJURY_VIOLATION", "INJURY_LEVEL_ID", "DATE_OF_INJURY", "AGE_AT_INJURY", "ACCIDENT_REPORT", "TIME_LOST_ON_JOB", "NUM_EES_REPRESENTD", "OTHER_EES_INVOLVED", "OTH_COMPLY_ACTIONS", "COMPLIANCE_STATUS", "COMPLY_REASON_ID", "VIOL_OCCURANCE", "CORRECTED_VIOL", "OSHA_COMBINED", "REASON_ID")

case_act_eer_viol <- read_delim("data/case_act_eer_viol (1).txt",
                                "|",
                                col_names = col_names_case_act_eer_viol)

# CASE_ACT_SUMMARY

col_names_case_act_summary <- c("CASE_ID", "ACT_ID", "TTL_ACT_VIOLATIONS", "DATE_FINDINGS_SUB", "FINDINGS_TOTAL_EES", "FINDINGS_EE_CNT", "AGRD_TO_DATE", "AGRD_TO_EES_CNT", "AMT_BW_COMPUTED", "AMT_BW_ASSESSED", "AMT_BW_PD_TO_DATE", "AMT_LD_ASSESSED", "AMT_CMP_PD_TO_DATE", "DATE_RESOLUTION", "RESOLUTION_EE_CNT", "RESOLUTION_BW_AMT", "RESOLUTION_CMP_AMT", "RESOLVE_REASON_ID", "COMPLIANCE_ID", "PAID_TO_DATE", "PAID_EES_CNT", "DATE_SYS_UPDATE", "FLAG_DETAIL_SUM")

case_act_summary <- read_delim("data/case_act_summary (1).txt",
                               "|",
                               col_names = col_names_case_act_summary)

# ACT_VIOLATIONS

col_names_act_violations <- c("VIOLATION_ID", "ACT_ID", "VIOLATION_NO", "VIOLATION_TYPE", "VIOLATION_DESC", "EE_ER_VIOL", "START_AGE", "END_AGE", "FLAG_COMPUTE_FB", "ACTIVE_FLAG")

act_violations <- read_delim("data/v_act_violations.txt",
                             "|",
                             col_names = col_names_act_violations)

# KASE

col_names_kase <- c("CASE_ID", "CASE_STATUS_ID", "COMPLIANCE_ID", "INVESTIGATING_RO", "INVESTIGATING_DO", "INVESTIGATING_AO", "INVESTIGATING_FO", "DATE_BEG_INV_PER", "DATE_END_INV_PER", "DATE_CONCLUDED", "CONCLUDE_REASON_ID", "UNDUP_EES_COMPUTED", "UNDUP_EES_ASSESSED", "UNDUP_EES_VIOLATED", "TTL_CASE_VIOLATION", "AMT_BW_COMPUTED", "AMT_BW_ASSESSED", "TTL_BW_PD_TO_DATE", "TTL_CMP_PD_TO_DATE", "AMT_LD_ASSESSED", "AMT_BW_RESOLVED", "AMT_CMP_RESOLVED", "DATE_REGISTERED", "INVEST_TOOL_ID", "RECURR_VIOL", "REINVESTIGATION", "REPEAT_VIOLATION", "REGISTRATION_ACT")

kase <- read_delim("data/kase (1).txt",
                   "|",
                   col_names = col_names_kase)

# CASE_STATUS

col_names_case_status <- c("CASE_STATUS_ID", "CASE_STATUS_DESC", "SORT_ORDER", "ACTIVE_FLAG", "PICKLIST_DEF")

case_status <- read_delim("data/v_case_status.txt",
                          "|",
                          col_names = col_names_case_status)

# CONCLUDED_REASON

col_names_concluded_reason <- c("REASON_ID", "REASON_DESC", "ACTIVE_FLAG")

concluded_reason <- read_delim("data/v_concluded_reason.txt",
                               "|",
                               col_names = col_names_concluded_reason)

# CASE_EMPLOYER

col_names_case_employer <- c("CASE_ID", "ER_TRADE_NAME", "ER_TRADE_SOUNDEX", "ER_LEGAL_NAME", "ER_LEGAL_SOUNDEX", "ER_ADDR1", "ER_ADDR2", "ER_ADDR3", "ER_CITY", "ER_STATE_ID", "ER_ZIP", "ER_PHONE1", "ER_PHONE2", "ER_FAX", "ER_FAX_EXT", "ER_EIN", "ER_COUNTY_ID", "ER_TYPE_ID", "ER_BUS_ORG", "ER_NAICS", "ER_SIC_CODE", "ER_NATURE_OF_BUS", "ER_IC_COVERAGE_ID", "ER_NUM_OF_EES", "ER_NUM_EE_AFFECTED", "ER_NUM_BRANCHES", "ER_BR_OUTSIDE_AO", "ER_BNPI", "PENALTY_TYPE", "EST_TYPE_ID", "EST_STATUS_ID", "EST_CERT_TYPE", "SPEC_COVERAGE_ID", "WORKSHOP_TYPE", "TTL_EES_CURRENT_YR", "TTL_EES_PRECEDE_YR", "ST_LOCAL_GOVT", "ER_PERM_ADDR1", "ER_PERM_ADDR2", "ER_PERM_ADDR3", "ER_PERM_CITY", "ER_PERM_STATE_ID", "ER_PERM_ZIP", "ER_PERM_PHONE1", "ER_PERM_PHONE2", "ER_PERM_INTNTL_PH", "ER_PERM_FAX", "ER_PERM_FAX_EXT", "ER_PERM_COUNTY_ID", "LENG_LOCAL_STAY", "ER_AGENCY_TYPE", "ENDING_DAY_OF_WEEK", "DATE_BUS_OPENED")

case_employer <- read_delim("data/case_employer (3.25.21).txt",
                            "|",
                            col_names = col_names_case_employer)

# BUS_ORG_TYPE

col_names_bus_org_type <- c("BUS_TYPE_ID", "BUS_TYPE_DESC", "SORT_ORDER", "ACTIVE_FLAG", "PICKLIST_DEF")

bus_org_type <- read_delim("data/v_bus_org_type.txt",
                           "|",
                           col_names = col_names_bus_org_type)

# NAICS

col_names_naics <- c("NAICS", "NAICSTEXT")

naics <- read_delim("data/v_naics.txt",
                    "|",
                    col_names = col_names_naics)

# Data preparation

# Calculate the proportion of each industry's employment that is foreign-born workers

## Calculate citizenship by industry
citizenship_industry <- citizenship_industry %>% 
  mutate(CITIZEN = case_when(
    CITIZEN == 0 ~ "NATIVE_BORN",
    CITIZEN == 1 ~ "CITIZEN_BORN_ABROAD",
    CITIZEN == 2 ~ "NATURALIZED",
    CITIZEN == 3 ~ "NOT_A_CITIZEN")) %>% 
  group_by(IND, CITIZEN) %>% 
  summarize(num_employees = sum(PERWT)) %>% 
  # Convert the citizenship groups to columns
  pivot_wider(
    names_from = CITIZEN,
    values_from = num_employees) %>% 
  mutate(
    IND = as.character(IND),
    # Replace NAs with zeros
    across(everything(), ~replace_na(.x, 0)),
    # Simplify citizenship into native- and foreign-born categories
    NATIVE_BORN = NATIVE_BORN + CITIZEN_BORN_ABROAD,
    FOREIGN_BORN = NATURALIZED + NOT_A_CITIZEN,
    PCT_NATIVE_BORN = NATIVE_BORN / (NATIVE_BORN + FOREIGN_BORN),
    PCT_FOREIGN_BORN = FOREIGN_BORN / (NATIVE_BORN + FOREIGN_BORN)) %>% 
  ungroup() %>% 
  select(1, 3, 6:8)

## Add the NAICS column to the citizenship by industry data using the crosswalk table
citizenship_industry <- citizenship_industry %>% 
  left_join(census_naics_crosswalk, by = c("IND" = "IND")) %>% 
  # We will shortly group by three-digit NAICS
  mutate(NAICS_THREE_DIGITS = substr(NAICS, 1, 3),
         COMBOKEY = paste0(IND, NAICS_THREE_DIGITS)) %>% 
  select(9, 1, 8, 7, 6, 2:5)

## Group by NAICS and roll up the citizenship by industry data for cases where one NAICS code maps to
## multiple Census industry codes
citizenship_industry_three_digit <- citizenship_industry %>% 
  # Remove duplicate combokeys to avoid double counting Census industry codes that appear in multiple NAICS codes
  distinct(COMBOKEY, .keep_all = TRUE) %>% 
  # Group by three-digit NAICS
  group_by(NAICS_THREE_DIGITS) %>% 
  summarize(DESC = paste0(DESC, collapse = " + "),
            IND = paste0(IND, collapse = " + "),
            across(where(is.numeric) & -starts_with("PCT_"), sum, na.rm = TRUE)) %>% 
  mutate(PCT_NATIVE_BORN = NATIVE_BORN / (NATIVE_BORN + FOREIGN_BORN),
         PCT_FOREIGN_BORN = FOREIGN_BORN / (NATIVE_BORN + FOREIGN_BORN)) %>% 
  left_join(citizenship_industry, by = "NAICS_THREE_DIGITS") %>% 
  rename("DESC" = 2,
         "IND" = 3,
         "NATIVE_BORN" = 4,
         "FOREIGN_BORN" = 5,
         "PCT_NATIVE_BORN" = 6,
         "PCT_FOREIGN_BORN" = 7) %>% 
  # Remove duplicate records
  distinct(NAICS_THREE_DIGITS, .keep_all = TRUE) %>% 
  select(1, 3, 2, 4:7)

# Test to make sure that duplicate INDs were properly eliminated prior to grouping by three-digit NAICS and summarizing
citizenship_industry_three_digit %>% 
  filter(NAICS_THREE_DIGITS %in% c("113", "928", "221")) %>% 
  arrange(NAICS_THREE_DIGITS) %>% 
  View()

# Join the three-digit citizenship by industry data to the case_employer table
case_employer_citizenship_industry <- case_employer %>% 
  mutate(ER_NAICS_THREE_DIGITS = substr(ER_NAICS, 1, 3)) %>% 
  left_join(citizenship_industry_three_digit, by = c("ER_NAICS_THREE_DIGITS" = "NAICS_THREE_DIGITS")) %>% 
  mutate(ER_ADDRESS = str_squish(str_remove_all(paste(ER_ADDR1, ER_ADDR2, ER_ADDR3, sep = " "), "NA"))) %>% 
  select(CASE_ID, ER_TRADE_NAME, ER_EIN, ER_ADDRESS, ER_CITY, ER_STATE_ID, ER_ZIP, ER_NATURE_OF_BUS, ER_NAICS, 54:60)

# How many records didn't match?
case_employer_citizenship_industry %>% 
  filter(is.na(IND)) %>% 
  View()
# About 14%

# Return the case IDs for cases with at least one minimum wage or overtime violation
# for which back wages were assessed.
mw_ot_case_ids <- case_act_eer_viol %>% 
  filter(VIOLATION_TYPE %in% c("MW", "OT"),
         !is.na(AMT_BW_ASSESSED),
         AMT_BW_ASSESSED > 0) %>% 
  pull(CASE_ID)

# Return the data for those cases in the kase and case_employer tables.
mw_ot_cases <- kase %>% 
  inner_join(case_employer_citizenship_industry,
             by = "CASE_ID") %>% 
  # Filter to only the MW or OT cases identified above
  filter(CASE_ID %in% mw_ot_case_ids) %>% 
  # Replace NA values with zeros, convert dates and calculate the length of cases
  mutate(across(16:20, ~replace_na(., 0)),
         DATE_REGISTERED = as.Date(parse_date_time(DATE_REGISTERED, "Ymd")),
         DATE_CONCLUDED = as.Date(parse_date_time(DATE_CONCLUDED, "Ymd")),
         CASE_LENGTH = DATE_CONCLUDED - DATE_REGISTERED) %>% 
  # Remove junk case lengths
  filter(!is.na(CASE_LENGTH),
         CASE_LENGTH > 0) %>% 
  select(1, 29, 30:34, 11, 17:20, 13, 23, 10, 44, 35:43)

# How many records didn't match?
mw_ot_cases %>% 
  filter(is.na(IND)) %>% 
  View()
# About 12%

# What are those non-matching three-digit NAICS codes?
mw_ot_cases %>% 
  filter(is.na(IND)) %>% 
  group_by(ER_NAICS_THREE_DIGITS) %>% 
  summarize(num_cases = n()) %>% 
  View()

mw_ot_cases %>% 
  filter(ER_NAICS_THREE_DIGITS == "238") %>% 
  View()

# Analysis

# What is the national average for the percent of assessed back wages paid back?
mw_ot_cases %>% 
  summarize(sum(TTL_BW_PD_TO_DATE) / (sum(AMT_BW_ASSESSED)))
# 95.9%

# Check to make sure this matches what you found previously just for 2019
mw_ot_cases %>% 
  filter(DATE_CONCLUDED >= "2019-01-01" &
           DATE_CONCLUDED <= "2019-12-31") %>% 
  summarize(sum(AMT_BW_ASSESSED))

# What are the foreign-born proportions of the industries represented in the wage theft data?
mw_ot_cases_pct_foreign_born_by_industry <- mw_ot_cases %>% 
  group_by(ER_NAICS_THREE_DIGITS, DESC, NATIVE_BORN, FOREIGN_BORN, PCT_NATIVE_BORN, PCT_FOREIGN_BORN) %>% 
  filter(!is.na(PCT_FOREIGN_BORN)) %>% 
  summarize(MW_OT_CASES = n(), .groups = "drop",
            AMT_BW_ASSESSED = sum(AMT_BW_ASSESSED),
            TTL_BW_PD_TO_DATE = sum(TTL_BW_PD_TO_DATE),
            TTL_CMP_PD_TO_DATE = sum(TTL_CMP_PD_TO_DATE),
            AMT_LD_ASSESSED = sum(AMT_LD_ASSESSED)) %>% 
  mutate(PCT_MW_OT_CASES = MW_OT_CASES/sum(MW_OT_CASES),
         RANK_BY_CASES = rank(desc(MW_OT_CASES), ties.method = "min"),
         TOTAL_INDUSTRY_EMPLOYMENT = NATIVE_BORN + FOREIGN_BORN,
         MW_OT_CASES_PER_THOUSAND_EMPLOYEES = MW_OT_CASES / TOTAL_INDUSTRY_EMPLOYMENT * 1000,
         RANK_BY_CASES_PER_THOUSAND = rank(desc(MW_OT_CASES_PER_THOUSAND_EMPLOYEES), ties.method = "min"),
         PCT_TTL_BW_PD_TO_DATE = TTL_BW_PD_TO_DATE / AMT_BW_ASSESSED,
         PCT_TTL_BW_PD_TO_DATE_BELOW_NAT_AVG = PCT_TTL_BW_PD_TO_DATE < .959) %>% 
  arrange(desc(MW_OT_CASES)) %>% 
  select(RANK_BY_CASES, MW_OT_CASES, PCT_MW_OT_CASES, RANK_BY_CASES_PER_THOUSAND, MW_OT_CASES_PER_THOUSAND_EMPLOYEES, ER_NAICS_THREE_DIGITS, DESC, TOTAL_INDUSTRY_EMPLOYMENT, NATIVE_BORN, FOREIGN_BORN, PCT_NATIVE_BORN, PCT_FOREIGN_BORN, AMT_BW_ASSESSED, TTL_BW_PD_TO_DATE, PCT_TTL_BW_PD_TO_DATE, PCT_TTL_BW_PD_TO_DATE_BELOW_NAT_AVG, TTL_CMP_PD_TO_DATE, AMT_LD_ASSESSED)

# What is the national average for foreign-born workers in these industries?
mw_ot_cases_pct_foreign_born_by_industry %>% 
  summarize(sum(FOREIGN_BORN) / (sum(NATIVE_BORN) + sum(FOREIGN_BORN)))
# 15.8%

# Which of these industries for which nativity data are available are above the average of 15.8%?
mw_ot_cases_pct_foreign_born_by_industry %>% 
  filter(PCT_FOREIGN_BORN > .158) %>% 
  arrange(RANK_BY_CASES_PER_THOUSAND) %>% 
  View()
# 37 industries

# Which of these industries are more than 1.5 times the average?
mw_ot_cases_pct_foreign_born_by_industry %>% 
  filter(PCT_FOREIGN_BORN > .237) %>% 
  arrange(RANK_BY_CASES_PER_THOUSAND) %>% 
  View()
# 11 industries

# Which of these industries are below the national average of 95.9% of back wages paid?
mw_ot_cases_pct_foreign_born_by_industry %>% 
  filter(PCT_TTL_BW_PD_TO_DATE_BELOW_NAT_AVG == TRUE) %>% 
  arrange(PCT_TTL_BW_PD_TO_DATE) %>% 
  View()

# Which of those industries are above the average for foreign-born workers?
mw_ot_cases_pct_foreign_born_by_industry %>% 
  filter(PCT_TTL_BW_PD_TO_DATE_BELOW_NAT_AVG == TRUE &
           PCT_FOREIGN_BORN > .158) %>% 
  arrange(PCT_TTL_BW_PD_TO_DATE) %>% 
  View()
# 17 industries

# How many of the top 10 industries by their proportion of foreign-born workers are below the average of 95.9% of back wages paid?
mw_ot_cases_pct_foreign_born_by_industry %>% 
  arrange(desc(PCT_FOREIGN_BORN)) %>% 
  select(DESC, PCT_FOREIGN_BORN, PCT_TTL_BW_PD_TO_DATE, PCT_TTL_BW_PD_TO_DATE_BELOW_NAT_AVG) %>% 
  head(10) %>% 
  View()

# How many wage theft cases occurred in industries with a proportion of foreign-born workers greater than the average?
mw_ot_cases_pct_foreign_born_by_industry %>% 
  summarize(sum(MW_OT_CASES[PCT_FOREIGN_BORN > .158]))

# What proportion of the total number of wage theft cases does that number represent?
mw_ot_cases_pct_foreign_born_by_industry %>% 
  summarize(sum(MW_OT_CASES[PCT_FOREIGN_BORN > .158]) / sum(MW_OT_CASES))

# Remove gas stations as those have a small foreign-born workforce
mw_ot_cases_pct_foreign_born_by_industry_no_gas_stations <- mw_ot_cases_pct_foreign_born_by_industry %>% 
  filter(ER_NAICS_THREE_DIGITS != "447")

# What's the correlation between the rate of wage theft cases and the share of the workforce that is foreign-born?
cor(mw_ot_cases_pct_foreign_born_by_industry$MW_OT_CASES_PER_THOUSAND_EMPLOYEES,
    mw_ot_cases_pct_foreign_born_by_industry$PCT_FOREIGN_BORN)
# .36

# And what about when we remove gas stations?
cor(mw_ot_cases_pct_foreign_born_by_industry_no_gas_stations$MW_OT_CASES_PER_THOUSAND_EMPLOYEES,
    mw_ot_cases_pct_foreign_born_by_industry_no_gas_stations$PCT_FOREIGN_BORN)
# .47

# What's the correlation between the repayment rate of back wages and the share of the workforce that is foreign-born?
cor(mw_ot_cases_pct_foreign_born_by_industry$PCT_TTL_BW_PD_TO_DATE,
    mw_ot_cases_pct_foreign_born_by_industry$PCT_FOREIGN_BORN)
# -.17

# What is the maximum, minimum and median size and number of wage theft cases for these industries?
mw_ot_cases_pct_foreign_born_by_industry %>% 
  summarize(max(TOTAL_INDUSTRY_EMPLOYMENT),
            min(TOTAL_INDUSTRY_EMPLOYMENT),
            median(TOTAL_INDUSTRY_EMPLOYMENT),
            max(MW_OT_CASES),
            min(MW_OT_CASES),
            median(MW_OT_CASES))

# What's the situation in Florida?
mw_ot_cases %>% 
  filter(ER_STATE_ID == "FL") %>% 
  summarize(num_cases = n(),
            total_bw_assessed = sum(AMT_BW_ASSESSED),
            total_bw_paid = sum(TTL_BW_PD_TO_DATE),
            total_cmp_paid = sum(TTL_CMP_PD_TO_DATE),
            total_ld_assessed = sum(AMT_LD_ASSESSED))

# And in Texas?
mw_ot_cases %>% 
  filter(ER_STATE_ID == "TX") %>% 
  summarize(num_cases = n(),
            total_bw_assessed = sum(AMT_BW_ASSESSED),
            total_bw_paid = sum(TTL_BW_PD_TO_DATE),
            total_cmp_paid = sum(TTL_CMP_PD_TO_DATE),
            total_ld_assessed = sum(AMT_LD_ASSESSED))

# And in California?
mw_ot_cases %>% 
  filter(ER_STATE_ID == "CA") %>% 
  summarize(num_cases = n(),
            total_bw_assessed = sum(AMT_BW_ASSESSED),
            total_bw_paid = sum(TTL_BW_PD_TO_DATE),
            total_cmp_paid = sum(TTL_CMP_PD_TO_DATE),
            total_ld_assessed = sum(AMT_LD_ASSESSED))

# What about just the garment industry in California?
mw_ot_cases %>% 
  filter(ER_STATE_ID == "CA",
         ER_NAICS_THREE_DIGITS == "315") %>% 
  summarize(num_cases = n(),
            total_bw_assessed = sum(AMT_BW_ASSESSED),
            total_bw_paid = sum(TTL_BW_PD_TO_DATE),
            total_cmp_paid = sum(TTL_CMP_PD_TO_DATE),
            total_ld_assessed = sum(AMT_LD_ASSESSED))

# What about restaurants in California?
mw_ot_cases %>% 
  filter(ER_STATE_ID == "CA",
         ER_NAICS_THREE_DIGITS == "722") %>% 
  summarize(num_cases = n(),
            total_bw_assessed = sum(AMT_BW_ASSESSED),
            total_bw_paid = sum(TTL_BW_PD_TO_DATE),
            total_cmp_paid = sum(TTL_CMP_PD_TO_DATE),
            total_ld_assessed = sum(AMT_LD_ASSESSED))

# Make plots
## Percent foreign-born by industry
plot_pct_foreign_born_by_industry <- ggplot(mw_ot_cases_pct_foreign_born_by_industry, aes(x = PCT_FOREIGN_BORN)) +
  geom_histogram(color="black", fill="lightblue", bins = 25) +
  geom_vline(aes(xintercept = .158), color="red", linetype="solid", size=1) +
  scale_x_continuous(labels = scales::label_percent()) +
  labs(x = "Percent Foreign Born",
       y = "Number of Industries")

ggsave("data/exported/immigrants/plot_pct_foreign_born_by_industry.png")

# Percent back wages paid by percent foreign-born
plot_pct_back_wages_paid_by_pct_foreign_born <- ggplot(mw_ot_cases_pct_foreign_born_by_industry, aes(x = PCT_FOREIGN_BORN, y = PCT_TTL_BW_PD_TO_DATE)) + geom_point() +
  geom_point(size = 2, color = "blue") +
  geom_vline(aes(xintercept = .158), color="red", linetype="solid", size=1) +
  scale_x_continuous(labels = scales::label_percent()) +
  scale_y_continuous(labels = scales::label_percent()) +
  labs(x = "Percent Foreign Born",
       y = "Percent Back Wages Repaid")

ggsave("data/exported/immigrants/plot_pct_back_wages_paid_by_pct_foreign_born.png")

## Number of employees by industry
plot_employees_by_industry <- ggplot(mw_ot_cases_pct_foreign_born_by_industry, aes(x = TOTAL_INDUSTRY_EMPLOYMENT)) +
  geom_histogram(color="black", fill="lightblue", bins = 25) +
  scale_x_continuous(labels = scales::comma) +
  labs(x = "Total Industry Employment",
       y = "Number of Industries")

ggsave("data/exported/immigrants/plot_employees_by_industry.png")

## Number of wage theft cases by industry
plot_cases_by_industry <- ggplot(mw_ot_cases_pct_foreign_born_by_industry, aes(x = MW_OT_CASES)) +
  geom_histogram(color="black", fill="lightblue", bins = 25) +
  scale_x_continuous(labels = scales::comma) +
  labs(x = "Wage Theft Cases",
       y = "Number of Industries")

ggsave("data/exported/immigrants/plot_cases_by_industry.png")

# Export the mw_ot_cases_pct_foreign_born_by_industry data frame
write_csv(mw_ot_cases_pct_foreign_born_by_industry,
          "data/exported/immigrants/mw_ot_cases_pct_foreign_born_by_industry.csv")

# Export cases in industries with both high rates of wage theft complaints and high proportions of foreign-born workers
industries_high_foreign_born <- c("315", "814", "115", "111", "485", "721", "313", "314", "722", "623", "812", "311", "325")

mw_ot_cases_pct_foreign_born_by_industry %>% 
  filter(ER_NAICS_THREE_DIGITS %in% industries_high_foreign_born) %>% 
  View()

mw_ot_cases_high_foreign_born <- mw_ot_cases %>% 
  filter(ER_NAICS_THREE_DIGITS %in% industries_high_foreign_born)

write_csv(mw_ot_cases_high_foreign_born,
            "data/exported/immigrants/mw_ot_cases_high_foreign_born.csv")
