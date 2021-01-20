install.packages("tidyverse")
library(tidyverse)

setwd("wage_theft/")

### CASE_ACT_EER_SUM

col_names_case_act_eer_sum <- c("CASE_ID", "ACT_ID", "CASE_EER_ID", "ER_EE_VIOL", "TTL_ACT_VIOLATIONS", "AMT_BW_COMPUTED", "AMT_BW_ASSESSED", "AMT_LD_ASSESSED", "TTL_BW_PAID", "TTL_CMP_PAID", "RESOLUTION_DATE", "RESOLUTION_EE_CNT", "RESOLUTION_BW_AMT", "RESOLUTION_CMP_AMT", "DATE_BW_PAID", "DATE_CMP_PAID", "FLAG_INCLUDE", "DATE_CHANGED")

case_act_eer_sum <- read_delim("data/case_act_eer_sum.txt",
                               "|",
                               col_names = col_names_case_act_eer_sum)

### CASE_ACT_EER_VIOL

col_names_case_act_eer_viol <- c("CASE_ID", "ACT_ID", "CASE_EER_ID", "VIOLATION_ID", "HAZ_OCCP_ID", "ACT_SPECIFIC_INFO", "ER_EE_VIOL", "VIOLATION_TYPE", "DATE_BEG_VIOL", "DATE_END_VIOL", "CMP_AMT_AT_INVEST", "AMT_BW_COMPUTED", "AMT_BW_ASSESSED", "AMT_LD_ASSESSED", "EE_AGE_AT_VIOL", "INJURY_VIOLATION", "INJURY_LEVEL_ID", "DATE_OF_INJURY", "AGE_AT_INJURY", "ACCIDENT_REPORT", "TIME_LOST_ON_JOB", "NUM_EES_REPRESENTD", "OTHER_EES_INVOLVED", "OTH_COMPLY_ACTIONS", "COMPLIANCE_STATUS", "COMPLY_REASON_ID", "VIOL_OCCURANCE", "CORRECTED_VIOL", "OSHA_COMBINED", "REASON_ID")

case_act_eer_viol <- read_delim("data/case_act_eer_viol (1).txt",
                                "|",
                                col_names = col_names_case_act_eer_viol)

### CASE_ACT_SUMMARY

col_names_case_act_summary <- c("CASE_ID", "ACT_ID", "TTL_ACT_VIOLATIONS", "DATE_FINDINGS_SUB", "FINDINGS_TOTAL_EES", "FINDINGS_EE_CNT", "AGRD_TO_DATE", "AGRD_TO_EES_CNT", "AMT_BW_COMPUTED", "AMT_BW_ASSESSED", "AMT_BW_PD_TO_DATE", "AMT_LD_ASSESSED", "AMT_CMP_PD_TO_DATE", "DATE_RESOLUTION", "RESOLUTION_EE_CNT", "RESOLUTION_BW_AMT", "RESOLUTION_CMP_AMT", "RESOLVE_REASON_ID", "COMPLIANCE_ID", "PAID_TO_DATE", "PAID_EES_CNT", "DATE_SYS_UPDATE", "FLAG_DETAIL_SUM")

case_act_summary <- read_delim("data/case_act_summary (1).txt",
                               "|",
                               col_names = col_names_case_act_summary)

### ACT_VIOLATIONS

col_names_act_violations <- c("VIOLATION_ID", "ACT_ID", "VIOLATION_NO", "VIOLATION_TYPE", "VIOLATION_DESC", "EE_ER_VIOL", "START_AGE", "END_AGE", "FLAG_COMPUTE_FB", "ACTIVE_FLAG")

act_violations <- read_delim("data/v_act_violations.txt",
                             "|",
                             col_names = col_names_act_violations)

### KASE

col_names_kase <- c("CASE_ID", "CASE_STATUS_ID", "COMPLIANCE_ID", "INVESTIGATING_RO", "INVESTIGATING_DO", "INVESTIGATING_AO", "INVESTIGATING_FO", "DATE_BEG_INV_PER", "DATE_END_INV_PER", "DATE_CONCLUDED", "CONCLUDE_REASON_ID", "UNDUP_EES_COMPUTED", "UNDUP_EES_ASSESSED", "UNDUP_EES_VIOLATED", "TTL_CASE_VIOLATION", "AMT_BW_COMPUTED", "AMT_BW_ASSESSED", "TTL_BW_PD_TO_DATE", "TTL_CMP_PD_TO_DATE", "AMT_LD_ASSESSED", "AMT_BW_RESOLVED", "AMT_CMP_RESOLVED", "DATE_REGISTERED", "INVEST_TOOL_ID", "RECURR_VIOL", "REINVESTIGATION", "REPEAT_VIOLATION", "REGISTRATION_ACT")

kase <- read_delim("data/kase (1).txt",
                   "|",
                   col_names = col_names_kase)

View(kase %>% 
       filter(CASE_ID == 1856562))

View(kase %>% 
             filter(TTL_BW_PD_TO_DATE < AMT_BW_ASSESSED &
                            CONCLUDE_REASON_ID %in% c(22, 23)))

# Q: Do the money figures add up?

View(case_act_eer_sum %>% 
       summarize_if(str_detect(names(.), "AMT"), sum, na.rm = TRUE))

View(case_act_eer_viol %>% 
       summarize_if(str_detect(names(.), "AMT"), sum, na.rm = TRUE))

View(case_act_summary %>% 
       summarize_if(str_detect(names(.), "AMT"), sum, na.rm = TRUE))

View(kase %>% 
       summarize_if(str_detect(names(.), "AMT"), sum, na.rm = TRUE))

# A: Yes, they do (with extremely minor discrepancies).

kase %>% 
  replace(is.na(.), 0) %>% 
  summarise_all(funs(sum)) %>% 
  select_if()

View(case_act_eer_viol %>% 
       filter(CASE_ID == 1664240) %>% 
       summarize(sum(AMT_BW_COMPUTED), sum(AMT_BW_ASSESSED)))

# Which companies have committed the most violations?
case_act_eer_sum %>% 
  summarize(n_distinct(CASE_ID))

case_act_eer_sum %>% 
  group_by(CASE_ID) %>% 
  summarize(count = n()) %>% 
  arrange(desc(count))

case_act_eer_sum %>% 
  summarize(count(CASE_ID))

### CASE_STATUS

col_names_case_status <- c("CASE_STATUS_ID", "CASE_STATUS_DESC", "SORT_ORDER", "ACTIVE_FLAG", "PICKLIST_DEF")

case_status <- read_delim("data/v_case_status.txt",
                          "|",
                          col_names = col_names_case_status)

View(case_status)

### CONCLUDED_REASON

col_names_concluded_reason <- c("REASON_ID", "REASON_DESC", "ACTIVE_FLAG")

concluded_reason <- read_delim("data/v_concluded_reason.txt",
                               "|",
                               col_names = col_names_concluded_reason)

View(concluded_reason)
