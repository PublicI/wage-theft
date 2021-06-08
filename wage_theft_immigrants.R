install.packages("formattable")
install.packages("ipumsr")

library(formattable)
library(ipumsr)
library(lubridate)
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
    # Replace NAs with zeros
    across(everything(), ~replace_na(.x, 0)),
    # Simplify citizenship into native- and foreign-born categories
    NATIVE_BORN = NATIVE_BORN + CITIZEN_BORN_ABROAD,
    FOREIGN_BORN = NATURALIZED + NOT_A_CITIZEN,
    PCT_NATIVE_BORN = NATIVE_BORN / (NATIVE_BORN + FOREIGN_BORN),
    PCT_FOREIGN_BORN = FOREIGN_BORN / (NATIVE_BORN + FOREIGN_BORN)) %>% 
  ungroup() %>% 
  mutate(
    # Format the columns
    #across(where(is.numeric), ~ formattable::comma(.x, digits = 0, format = "d")),
    across(starts_with("PCT_"), ~ formattable::percent(.x, 1)),
    IND = as.character(IND)) %>% 
  select(1, 3, 6:8)

# Test
citizenship_industry %>% 
  filter(IND %in% c("9590", "9670", "9680", "9690", "9770", "9780", "9790", "9870")) %>% 
  summarize(across(where(is.numeric) & -starts_with("PCT_"), sum, na.rm = TRUE))

## Add the NAICS column to the citizenship by industry data using the crosswalk table
citizenship_industry <- citizenship_industry %>% 
  left_join(census_naics_crosswalk, by = c("IND" = "IND")) %>% 
  select(1, 7, 6, 2:5)

## Group by NAICS and roll up the citizenship by industry data for cases where one NAICS code maps to
## multiple Census industry codes
citizenship_industry <- citizenship_industry %>% 
  group_by(NAICS) %>% 
  summarize(DESC = paste0(DESC, collapse = " + "),
            IND = paste0(IND, collapse = " + "),
            across(where(is.numeric) & -starts_with("PCT_"), sum, na.rm = TRUE)) %>% 
  mutate(PCT_NATIVE_BORN = NATIVE_BORN / (NATIVE_BORN + FOREIGN_BORN),
         PCT_FOREIGN_BORN = FOREIGN_BORN / (NATIVE_BORN + FOREIGN_BORN)) %>% 
  left_join(citizenship_industry, by = "NAICS") %>% 
  rename("DESC" = 2,
         "IND" = 3,
         "NATIVE_BORN" = 4,
         "FOREIGN_BORN" = 5,
         "PCT_NATIVE_BORN" = 6,
         "PCT_FOREIGN_BORN" = 7) %>% 
  select(1, 3, 2, 4:7) %>% 
  distinct(NAICS, .keep_all = TRUE)

# Create a version of the citizenship by industry data set grouped by three-digit NAICS
citizenship_industry_three_digit <- citizenship_industry %>% 
  group_by(NAICS_THREE_DIGITS = substr(NAICS, 1, 3)) %>% 
  summarize(DESC = paste0(DESC, collapse = " + "),
            IND = paste0(IND, collapse = " + "),
            across(where(is.numeric) & -starts_with("PCT_"), sum, na.rm = TRUE)) %>% 
  mutate(PCT_NATIVE_BORN = NATIVE_BORN / (NATIVE_BORN + FOREIGN_BORN),
         PCT_FOREIGN_BORN = FOREIGN_BORN / (NATIVE_BORN + FOREIGN_BORN)) %>% 
  select(1, 3, 2, 4:7)

# Join the three-digit citizenship by industry data to the case_employer table
case_employer_citizenship_industry <- case_employer %>% 
  mutate(ER_NAICS_THREE_DIGITS = substr(ER_NAICS, 1, 3)) %>% 
  left_join(citizenship_industry_three_digit, by = c("ER_NAICS_THREE_DIGITS" = "NAICS_THREE_DIGITS")) %>% 
  select(CASE_ID, ER_TRADE_NAME, ER_NATURE_OF_BUS, ER_NAICS, 54:60)

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
  select(1, 29:38)

# How many records didn't match?
mw_ot_cases %>% 
  filter(is.na(IND)) %>% 
  View()
# About 12%

# Analysis

# What is the national average for foreign-born workers in an industry?
citizenship_industry %>% 
  summarize(sum(FOREIGN_BORN) / (sum(NATIVE_BORN) + sum(FOREIGN_BORN)))
# 13.9%

# What are the foreign-born proportions of the industries represented in the wage theft data?
mw_ot_cases_pct_foreign_born_by_industry <- mw_ot_cases %>% 
  group_by(ER_NAICS_THREE_DIGITS, DESC, NATIVE_BORN, FOREIGN_BORN, PCT_NATIVE_BORN, PCT_FOREIGN_BORN) %>% 
  filter(!is.na(PCT_FOREIGN_BORN)) %>% 
  summarize(MW_OT_CASES = n(), .groups = "drop") %>% 
  mutate(PCT_MW_OT_CASES = MW_OT_CASES/sum(MW_OT_CASES),
         RANK = rank(desc(MW_OT_CASES), ties.method = "min"),
         TOTAL_INDUSTRY_EMPLOYMENT = NATIVE_BORN + FOREIGN_BORN,
         PCT_FOREIGN_BORN_ABOVE_NAT_AVG = PCT_FOREIGN_BORN > .139) %>% 
  arrange(desc(MW_OT_CASES)) %>% 
  select(RANK, MW_OT_CASES, PCT_MW_OT_CASES, ER_NAICS_THREE_DIGITS, DESC, TOTAL_INDUSTRY_EMPLOYMENT, NATIVE_BORN, FOREIGN_BORN, PCT_NATIVE_BORN, PCT_FOREIGN_BORN, PCT_FOREIGN_BORN_ABOVE_NAT_AVG)

# Which of these industries for which nativity data are available are above the national average of 13.9% 
mw_ot_cases_pct_foreign_born_by_industry %>% 
  filter(PCT_FOREIGN_BORN_ABOVE_NAT_AVG == TRUE) %>% 
  View()

# Which of these industries are more than 1.5 times the national average?
mw_ot_cases_pct_foreign_born_by_industry %>% 
  filter(PCT_FOREIGN_BORN > .2085) %>% 
  View()

# How many wage theft cases occurred in industries with a proportion of foreign-born workers
# greater than the national average?
mw_ot_cases_pct_foreign_born_by_industry %>% 
  summarize(sum(MW_OT_CASES[PCT_FOREIGN_BORN_ABOVE_NAT_AVG == TRUE]))

# What proportion of the total number of wage theft cases does that number represent?
mw_ot_cases_pct_foreign_born_by_industry %>% 
  summarize(sum(MW_OT_CASES[PCT_FOREIGN_BORN_ABOVE_NAT_AVG == TRUE]) / sum(MW_OT_CASES))

mw_ot_cases_pct_foreign_born_by_industry %>% 
  summarize(sum(MW_OT_CASES))

# What is the maximum, minimum and median size and number of wage theft cases for these industries?
mw_ot_cases_pct_foreign_born_by_industry %>% 
  summarize(max(TOTAL_INDUSTRY_EMPLOYMENT),
            min(TOTAL_INDUSTRY_EMPLOYMENT),
            median(TOTAL_INDUSTRY_EMPLOYMENT),
            max(MW_OT_CASES),
            min(MW_OT_CASES),
            median(MW_OT_CASES))

# Export the mw_ot_cases_pct_foreign_born_by_industry data frame
write_csv(mw_ot_cases_pct_foreign_born_by_industry,
          "data/exported/immigrants/mw_ot_cases_pct_foreign_born_by_industry.csv")