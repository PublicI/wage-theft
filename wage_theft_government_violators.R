library(lubridate)
library(tidyverse)

# Data import

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

# Which government agencies are committing minimum wage or overtime violations?

# Return the case IDs for cases with at least one minimum wage or overtime violation
# for which back wages were assessed.

mw_ot_case_ids <- case_act_eer_viol %>% 
  filter(VIOLATION_TYPE %in% c("MW", "OT"),
         !is.na(AMT_BW_ASSESSED),
         AMT_BW_ASSESSED > 0) %>% 
  pull(CASE_ID)

# Return the data for those cases in the kase and case_employer tables.
mw_ot_gov_cases <- kase %>% 
  inner_join(case_employer %>% 
               # Filter to only government employers
               filter(ER_BUS_ORG == "5"),
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
  select(1, 29, 31, 37, 43, 47, 81, 23, 10, 11, 14, 16:20) %>% 
  arrange(ER_EIN, DATE_CONCLUDED)

# 4,616 cases in which an employer was identified as a government agency

# Export the mw_ot_gov_cases data frame
write_csv(mw_ot_gov_cases,
          "data/exported/government_violators/mw_ot_gov_cases.csv")

# Return the data for those cases with missing and junk EINs filtered out.
mw_ot_gov_cases_filtered_eins <- kase %>% 
  inner_join(case_employer %>% 
               # Filter to only government employers
               filter(ER_BUS_ORG == "5"),
             by = "CASE_ID") %>% 
  # Filter to only the MW or OT cases identified above
  filter(CASE_ID %in% mw_ot_case_ids,
         # Remove missing and junk EINs
         !is.na(ER_EIN),
         !(ER_EIN %in% c("(b)(7)(E)", "NA", "ER Refused", "EIN Missing", "Dropped", "Owner SSN", "00-0000000", "99-9999999",
                         "Conciliate", "Conciliated"))) %>% 
  arrange(DATE_CONCLUDED) %>% 
  group_by(ER_EIN) %>% 
  # Record the order of the cases
  mutate(CASE_NUM = row_number()) %>% 
  ungroup() %>% 
  # Replace NA values with zeros, convert dates and calculate the length of cases
  mutate(across(16:20, ~replace_na(., 0)),
         DATE_REGISTERED = as.Date(parse_date_time(DATE_REGISTERED, "Ymd")),
         DATE_CONCLUDED = as.Date(parse_date_time(DATE_CONCLUDED, "Ymd")),
         CASE_LENGTH = DATE_CONCLUDED - DATE_REGISTERED) %>% 
  # Remove junk case lengths
  filter(!is.na(CASE_LENGTH),
         CASE_LENGTH > 0) %>% 
  select(1, 29, 31, 37, 43, 47, 81, 23, 10, 82, 11, 14, 16:20) %>% 
  arrange(ER_EIN, DATE_CONCLUDED)

# 3,277 cases in which an employer identified as a government agency had a valid EIN

# How many of the cases with missing or junk EINs are the USPS?
mw_ot_gov_cases %>% 
  filter(str_detect(ER_LEGAL_NAME, regex("post|usps", ignore_case = TRUE)) &
  (is.na(ER_EIN) |
     ER_EIN %in% c("(b)(7)(E)", "NA", "ER Refused", "EIN Missing", "Dropped", "Owner SSN", "00-0000000", "99-9999999", "Conciliate", "Conciliated"))) %>% 
  View()

# ~277 of the 1,339 unknown EIN cases seem to be the USPS

# Export the mw_ot_gov_cases_filtered_eins data frame
write_csv(mw_ot_gov_cases_filtered_eins,
          "data/exported/government_violators/mw_ot_gov_cases_filtered_eins.csv")

# Create a function to return the most common values in the state and NAICS columns
Modes <- function(x) {
  ux <- unique(x)
  tab <- tabulate(match(x, ux))
  ux[tab == max(tab)]
}

# Create table of employer aggregates.
mw_ot_gov_employers <- mw_ot_gov_cases_filtered_eins %>% 
  group_by(ER_EIN) %>% 
  summarize(TRADE_NAMES = paste0(ER_TRADE_NAME, collapse = ", "),
            LEGAL_NAMES = paste0(ER_LEGAL_NAME, collapse = ", "),
            MOST_COMMON_STATE = paste0(Modes(ER_STATE_ID), collapse =', '),
            MOST_COMMON_NAICS = paste0(Modes(ER_NAICS), collapse =', '),
            NUM_CASES = n(),
            CONCLUDE_REASONS = paste0(CONCLUDE_REASON_ID, collapse = ", "),
            TTL_EMP_AMT_BW_COMPUTED = sum(AMT_BW_COMPUTED, na.rm = TRUE),
            TTL_EMP_AMT_BW_ASSESSED = sum(AMT_BW_ASSESSED, na.rm = TRUE),
            TTL_EMP_AMT_BW_PD_TO_DATE = sum(TTL_BW_PD_TO_DATE, na.rm = TRUE),
            TTL_EMP_CMP_PD_TO_DATE = sum(TTL_CMP_PD_TO_DATE, na.rm = TRUE),
            TTL_EMP_AMT_LD_ASSESSED = sum(AMT_LD_ASSESSED, na.rm = TRUE),
            TTL_UNDUP_EES_VIOLATED = sum(UNDUP_EES_VIOLATED)) %>% 
  select(ER_EIN,
         TRADE_NAMES,
         LEGAL_NAMES,
         MOST_COMMON_STATE,
         MOST_COMMON_NAICS,
         NUM_CASES,
         CONCLUDE_REASONS,
         TTL_EMP_AMT_BW_COMPUTED,
         TTL_EMP_AMT_BW_ASSESSED,
         TTL_EMP_AMT_BW_PD_TO_DATE,
         TTL_EMP_CMP_PD_TO_DATE,
         TTL_EMP_AMT_LD_ASSESSED,
         TTL_UNDUP_EES_VIOLATED)

# Test with a USPS example (multiple states)
mw_ot_gov_cases_filtered_eins %>% 
  filter(ER_EIN == "41-0760000") %>% 
  group_by(ER_STATE_ID) %>% 
  summarize(count = n()) %>% 
  arrange(desc(count)) %>% 
  View()

# Test with the Arkansas Department of Heath and Human Services (multiple most common NAICS)
mw_ot_gov_cases_filtered_eins %>% 
  filter(ER_EIN == "71-0847443") %>% 
  group_by(ER_NAICS) %>% 
  summarize(count = n()) %>% 
  arrange(desc(count)) %>% 
  View()

# Export the mw_ot_gov_employers data frame
write_csv(mw_ot_gov_employers,
          "data/exported/government_violators/mw_ot_gov_employers.csv")
