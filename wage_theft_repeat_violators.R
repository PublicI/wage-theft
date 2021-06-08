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

# Return the case IDs for cases with at least one minimum wage or overtime violation
# for which back wages were assessed.

mw_ot_case_ids <- case_act_eer_viol %>% 
  filter(VIOLATION_TYPE %in% c("MW", "OT"),
         !is.na(AMT_BW_ASSESSED),
         AMT_BW_ASSESSED > 0) %>% 
  pull(CASE_ID)

# Return the data for those cases in the kase and case_employer tables.
mw_ot_cases <- kase %>% 
  inner_join(case_employer,
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

# Export the mw_ot_cases data frame
write_csv(mw_ot_cases,
          "data/exported/repeat_violators/mw_ot_cases.csv")

# Return the data for those cases with missing and junk EINs filtered out.
mw_ot_cases_filtered_eins <- kase %>% 
  inner_join(case_employer,
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

# Export the mw_ot_cases_filtered_eins data frame
write_csv(mw_ot_cases_filtered_eins,
          "data/exported/repeat_violators/mw_ot_cases_filtered_eins.csv")

# Create a function to return the most common values in the state and NAICS columns
Modes <- function(x) {
  ux <- unique(x)
  tab <- tabulate(match(x, ux))
  ux[tab == max(tab)]
}

# Create table of employer aggregates.
mw_ot_employers <- mw_ot_cases_filtered_eins %>% 
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

# Export the mw_ot_employers data frame
write_csv(mw_ot_employers,
          "data/exported/repeat_violators/mw_ot_employers.csv")

# Which employers are repeat violators?
repeat_violators <- mw_ot_employers %>% 
  filter(NUM_CASES > 1)

write_csv(repeat_violators,
          "data/exported/repeat_violators/repeat_violators.csv")

### Analysis
## All MW and OT cases
# In what proportion of cases were employers never assessed civil monetary
# penalties?
count(mw_ot_cases %>% 
        filter(TTL_CMP_PD_TO_DATE == 0)) /
count(mw_ot_cases)

# And by year?
mw_ot_cases %>% 
  group_by(year(DATE_CONCLUDED)) %>% 
  summarize(total_cases = n(),
            num_no_cmp_cases = sum(TTL_CMP_PD_TO_DATE == 0),
            pct_no_cpm_cases = round(num_no_cmp_cases / total_cases * 100, 0))

# In what proportion of cases were employers never assessed liquidated damages?
count(mw_ot_cases %>% 
        filter(AMT_LD_ASSESSED == 0)) /
count(mw_ot_cases)

# And by year?
mw_ot_cases %>% 
  group_by(year(DATE_CONCLUDED)) %>% 
  summarize(total_cases = n(),
            num_no_ld_cases = sum(AMT_LD_ASSESSED == 0),
            pct_no_ld_cases = round(num_no_ld_cases / total_cases * 100, 0))

# What percentage of cases were closed as “full compliance; BW not paid in full”?
count(mw_ot_cases %>% 
        filter(CONCLUDE_REASON_ID == "22")) /
count(mw_ot_cases)

# What percentage of cases were closed as "full compliance; refusal to pay?"
count(mw_ot_cases %>% 
        filter(CONCLUDE_REASON_ID == "23")) /
count(mw_ot_cases)

# What is the total amount of unpaid back wages due in cases that were closed as
# “full compliance, BW not paid in full” or “full compliance; refusal to pay?"
mw_ot_cases %>% 
  filter(CONCLUDE_REASON_ID %in% c("22", "23")) %>% 
  summarize(sum_amt_bw_assessed = sum(AMT_BW_ASSESSED),
            sum_ttl_bw_pd_to_date = sum(TTL_BW_PD_TO_DATE),
            ttl_bw_unpaid = sum_amt_bw_assessed - sum_ttl_bw_pd_to_date,
            pct_ttl_bw_unpaid = ttl_bw_unpaid / sum_amt_bw_assessed)

# And how many employers does that represent?
mw_ot_cases_filtered_eins %>% 
  filter(CONCLUDE_REASON_ID %in% c("22", "23")) %>% 
  summarize(num_employers = n_distinct(ER_EIN))

# What percentage of cases had back wages assessed but the employer didn’t pay the full
# amount before the case was closed?
count(mw_ot_cases %>% 
        filter(AMT_BW_ASSESSED != 0,
               AMT_BW_ASSESSED > TTL_BW_PD_TO_DATE)) /
count(mw_ot_cases %>% 
          filter(AMT_BW_ASSESSED != 0))

# And by year?
mw_ot_cases %>% 
  group_by(year(DATE_CONCLUDED)) %>% 
  summarize(total_cases = sum(AMT_BW_ASSESSED != 0),
            num_low_bw_cases = sum(AMT_BW_ASSESSED != 0 &
                                     AMT_BW_ASSESSED > TTL_BW_PD_TO_DATE),
            pct_low_bw_cases = round(num_low_bw_cases / total_cases * 100, 0))

# What percentage of cases had back wages assessed, but the employer didn’t pay any of
# the back wages before the case was closed?
  count(mw_ot_cases %>% 
        filter(AMT_BW_ASSESSED != 0,
               TTL_BW_PD_TO_DATE == 0)) /
count(mw_ot_cases %>% 
          filter(AMT_BW_ASSESSED != 0))

# And by year?
mw_ot_cases %>% 
  group_by(year(DATE_CONCLUDED)) %>% 
  summarize(total_cases = sum(AMT_BW_ASSESSED != 0),
            num_no_bw_cases = sum(AMT_BW_ASSESSED != 0 &
                                     TTL_BW_PD_TO_DATE == 0),
            pct_no_bw_cases = round(num_no_bw_cases / total_cases * 100, 0))

# What percentage of cases that had back wages assessed and in which the employer didn’t
# pay the full amount before the case was closed were closed with a referral for
# criminal prosecution?
count(mw_ot_cases %>% 
        filter(AMT_BW_ASSESSED != 0,
               AMT_BW_ASSESSED > TTL_BW_PD_TO_DATE,
               CONCLUDE_REASON_ID == "8")) /
  count(mw_ot_cases %>% 
          filter(AMT_BW_ASSESSED != 0,
                 AMT_BW_ASSESSED > TTL_BW_PD_TO_DATE))

# What industries have the highest number of cases?
mw_ot_cases %>% 
  group_by(ER_NAICS) %>% 
  summarize(num_cases = n()) %>% 
  mutate(pct_cases = round(num_cases / sum(num_cases) * 100, 0)) %>% 
  left_join(naics, by = c("ER_NAICS" = "NAICS")) %>% 
  arrange(desc(num_cases))

# What employers have the highest number of cases?
View(mw_ot_employers %>% 
       arrange(desc(NUM_CASES)))

# What is the average length of time between the investigation begin date and the case
# concluded date?
mw_ot_cases %>% 
  summarize(median(CASE_LENGTH))

# And by year?
mw_ot_cases %>% 
  mutate(case_conclude_year = year(DATE_CONCLUDED)) %>% 
  group_by(case_conclude_year) %>% 
  summarize(num_cases = n(),
            median_case_length = median(CASE_LENGTH))

# How many cases did the Department of Labor close each year?
mw_ot_cases %>% 
  mutate(case_conclude_year = year(DATE_CONCLUDED)) %>% 
  group_by(case_conclude_year) %>% 
  summarize(num_cases = n())

# And how many employers did that represent?
mw_ot_cases_filtered_eins %>% 
  mutate(case_conclude_year = year(DATE_CONCLUDED)) %>% 
  group_by(case_conclude_year) %>% 
  summarize(num_employers = n_distinct(ER_EIN))

# And what were the total back wages that the Department of Labor calculated by year?
mw_ot_cases %>% 
  mutate(case_conclude_year = year(DATE_CONCLUDED)) %>% 
  group_by(case_conclude_year) %>% 
  summarize(sum_amt_bw_assessed = sum(AMT_BW_ASSESSED))

# What is the total amount of back wages that have gone unpaid?
mw_ot_cases %>% 
  summarize(sum(AMT_BW_ASSESSED) - sum(TTL_BW_PD_TO_DATE))

## Repeat MW and OT cases
# What percentage of repeat violators were never assessed civil monetary penalties?
count(repeat_violators %>% 
            filter(TTL_EMP_CMP_PD_TO_DATE == 0)) /
count(repeat_violators)

# What percentage of repeat violators were never assessed liquidated damages?
count(repeat_violators %>% 
              filter(TTL_EMP_AMT_LD_ASSESSED == 0)) /
  count(repeat_violators)

# What percentage of repeat cases were closed as "full compliance; BW not paid in full?"
count(mw_ot_cases_filtered_eins %>% 
        filter(CASE_NUM > 1,
               CONCLUDE_REASON_ID == "22")) /
  count(mw_ot_cases_filtered_eins %>% 
          filter(CASE_NUM > 1))

# What percentage of repeat cases were closed as "full compliance; refusal to pay?"
count(mw_ot_cases_filtered_eins %>% 
        filter(CASE_NUM > 1,
               CONCLUDE_REASON_ID == "23")) /
  count(mw_ot_cases_filtered_eins %>% 
          filter(CASE_NUM > 1))

# What is the total amount of unpaid back wages due in repeat cases that were closed as
# “full compliance, BW not paid in full” or “full compliance; refusal to pay?"
mw_ot_cases_filtered_eins %>% 
  filter(CASE_NUM > 1,
         CONCLUDE_REASON_ID %in% c("22", "23")) %>% 
  summarize(sum_amt_bw_assessed = sum(AMT_BW_ASSESSED),
            sum_ttl_bw_pd_to_date = sum(TTL_BW_PD_TO_DATE),
            ttl_bw_unpaid = sum_amt_bw_assessed - sum_ttl_bw_pd_to_date,
            pct_ttl_bw_unpaid = ttl_bw_unpaid / sum_amt_bw_assessed)

# What percentage of repeat cases had back wages assessed but the employer didn’t pay
# the full amount before the case was closed?
count(mw_ot_cases_filtered_eins %>% 
        filter(CASE_NUM > 1,
               AMT_BW_ASSESSED != 0,
               AMT_BW_ASSESSED > TTL_BW_PD_TO_DATE)) /
  count(mw_ot_cases_filtered_eins %>% 
          filter(CASE_NUM > 1,
                 AMT_BW_ASSESSED != 0))

# And by year?
mw_ot_cases_filtered_eins %>% 
  group_by(year(DATE_CONCLUDED)) %>% 
  summarize(total_cases = sum(CASE_NUM > 1 &
                                AMT_BW_ASSESSED != 0),
            num_low_bw_cases = sum(CASE_NUM > 1 &
                                     AMT_BW_ASSESSED != 0 &
                                     AMT_BW_ASSESSED > TTL_BW_PD_TO_DATE),
            pct_low_bw_cases = round(num_low_bw_cases / total_cases * 100, 0))

# What percentage of repeat cases had back wages assessed, but the employer didn’t pay any of
# the back wages before the case was closed?
count(mw_ot_cases_filtered_eins %>% 
        filter(CASE_NUM > 1,
               AMT_BW_ASSESSED != 0,
               TTL_BW_PD_TO_DATE == 0)) /
  count(mw_ot_cases_filtered_eins %>% 
          filter(CASE_NUM > 1,
                 AMT_BW_ASSESSED != 0))

# And by year?
mw_ot_cases_filtered_eins %>% 
  group_by(year(DATE_CONCLUDED)) %>% 
  summarize(total_cases = sum(CASE_NUM > 1 &
                                AMT_BW_ASSESSED != 0),
            num_no_bw_cases = sum(CASE_NUM > 1 &
                                    AMT_BW_ASSESSED != 0 &
                                    TTL_BW_PD_TO_DATE == 0),
            pct_no_bw_cases = round(num_no_bw_cases / total_cases * 100, 0))

## Company-specific queries
# What are the total assessed back wages against Circle-K, Halliburton, Wackenhut and Waffle House?
# Circle-K = 74-1149540, Halliburton = 73-0271280, Wackenhut = 59-0857245 & 59-0940269, Waffle House = 58-0652840
mw_ot_cases %>% 
  filter(ER_EIN %in% c("74-1149540", "73-0271280", "59-0857245", "59-0940269", "58-0652840")) %>% 
  summarize(sum_amt_bw_assessed = sum(AMT_BW_ASSESSED))

# How many times has Circle-K been cited in MW and OT cases?
mw_ot_cases %>% 
  filter(ER_EIN == "74-1149540") %>% 
  summarize(num_cases = n(),
            sum_amt_bw_assessed = sum(AMT_BW_ASSESSED),
            sum_ttl_cmp_pd_to_date = sum(TTL_CMP_PD_TO_DATE),
            sum_amt_ld_assessed = sum(AMT_LD_ASSESSED),
            num_cmp_cases = sum(TTL_CMP_PD_TO_DATE > 0),
            num_ld_cases = sum(AMT_LD_ASSESSED > 0),
            num_low_bw_cases = sum(CONCLUDE_REASON_ID %in% c("22", "23")),
            sum_undup_ees_violated = sum(UNDUP_EES_VIOLATED))

# How many times has Halliburton been cited in MW and OT cases?
mw_ot_cases %>% 
  filter(ER_EIN == "73-0271280") %>% 
  summarize(num_cases = n(),
            sum_amt_bw_assessed = sum(AMT_BW_ASSESSED),
            sum_ttl_cmp_pd_to_date = sum(TTL_CMP_PD_TO_DATE),
            sum_amt_ld_assessed = sum(AMT_LD_ASSESSED),
            num_cmp_cases = sum(TTL_CMP_PD_TO_DATE > 0),
            num_ld_cases = sum(AMT_LD_ASSESSED > 0),
            num_low_bw_cases = sum(CONCLUDE_REASON_ID %in% c("22", "23")),
            sum_undup_ees_violated = sum(UNDUP_EES_VIOLATED))

# How many times has Wackenhut been cited in MW and OT cases?
mw_ot_cases %>% 
  filter(ER_EIN %in% c("59-0857245", "59-0940269"),
         # Exclude the Centerra subsidiary which had been sold prior to the violations occurring
         str_detect(ER_LEGAL_NAME, regex("centerra", ignore_case = TRUE), negate = TRUE)) %>% 
  summarize(num_cases = n(),
            sum_amt_bw_assessed = sum(AMT_BW_ASSESSED),
            sum_ttl_cmp_pd_to_date = sum(TTL_CMP_PD_TO_DATE),
            sum_amt_ld_assessed = sum(AMT_LD_ASSESSED),
            num_cmp_cases = sum(TTL_CMP_PD_TO_DATE > 0),
            num_ld_cases = sum(AMT_LD_ASSESSED > 0),
            num_low_bw_cases = sum(CONCLUDE_REASON_ID %in% c("22", "23")),
            sum_undup_ees_violated = sum(UNDUP_EES_VIOLATED))

View(mw_ot_cases %>% 
       filter(ER_EIN %in% c("59-0857245", "59-0940269")) %>% 
       arrange(ER_LEGAL_NAME))

View(mw_ot_cases %>% 
       filter(CASE_ID %in% c("1812004", "1850535", "1859718")))

# Export the Wackenhut cases
write_csv(mw_ot_cases %>% 
            filter(ER_EIN %in% c("59-0857245", "59-0940269")) %>% 
            inner_join(case_employer, by = "CASE_ID") %>% 
            select(1:4, 6:15, 20:26),
          "data/exported/wackenhut_cases.csv")

# -30-