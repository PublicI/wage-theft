# Cheated at Work

This repo contains code and data for ["Cheated at Work,"](https://publicintegrity.org/topics/inequality-poverty-opportunity/workers-rights/cheated-at-work/) a Center for Public Integrity investigation of the effectiveness of federal wage theft laws and the agency charged with enforcing them.

The series consists of four major stories:
* ["Ripping off workers without consequences"](https://publicintegrity.org/inequality-poverty-opportunity/workers-rights/cheated-at-work/ripping-off-workers-with-no-consequences/) published on May 4, 2021.

* ["USPS has cheated mail carriers for years"](https://publicintegrity.org/inequality-poverty-opportunity/workers-rights/cheated-at-work/usps-cheated-mail-carriers/) published on August 31, 2021.

* ["Wage theft hits immigrants — hard"](https://publicintegrity.org/inequality-poverty-opportunity/workers-rights/cheated-at-work/garment-immigrant-workers-wage-theft/) published on October 14, 2021.

* ["As guest workers increase, so do concerns about wage cheating"](https://publicintegrity.org/inequality-poverty-opportunity/workers-rights/cheated-at-work/guest-workers-increase-wage-cheating/) published on March 2, 2022.

All stories were published in partnership with The Associated Press and Univision.

### Here's what's in this repo

#### [wage_theft_repeat_violators.R](wage_theft_repeat_violators.R)
This R file contains code used to produce the analysis in ["Ripping off workers without consequences."](https://publicintegrity.org/inequality-poverty-opportunity/workers-rights/cheated-at-work/ripping-off-workers-with-no-consequences/)

#### [wage_theft_immigrants.R](wage_theft_immigrants.R)
This R file contains code used to produce the analysis in ["Wage theft hits immigrants — hard."](https://publicintegrity.org/inequality-poverty-opportunity/workers-rights/cheated-at-work/garment-immigrant-workers-wage-theft/)

#### [wage_theft_guest_workers.Rmd](wage_theft_guest_workers.Rmd)
This R Markdown file contains code used to produce the analysis in ["As guest workers increase, so do concerns about wage cheating"](https://publicintegrity.org/inequality-poverty-opportunity/workers-rights/cheated-at-work/guest-workers-increase-wage-cheating/).

### Some notes about the data
* The files relating to wage theft investigations in this repo's data folder were provided in response to a FOIA request to the U.S. Department of Labor completed on Dec. 10, 2020. The files contain investigations closed from Oct. 1, 2005 to Sept. 30, 2020. More information about these files can be found in the [data dictionary](data/wh_data_dictionary.xlsx) in the data folder.

* The [citizenship_industry.data](data/citizenship_industry.dat) and [citizenship_industry.xml](data/citizenship_industry.xml) files relating to the citizenship of particular industries' workforces come from [IPUMS USA](https://usa.ipums.org/usa/index.shtml).

* The [visas_by_type_and_year.xlsx](data/visas_by_type_and_year.xlsx) file comes from the [U.S. Department of State](https://travel.state.gov/content/travel/en/legal/visa-law0/visa-statistics/nonimmigrant-visa-statistics.html).

### Questions?
For questions about the contents of this repo, email [Joe Yerardi](https://publicintegrity.org/author/joe-yerardi/) at jyerardi@publicintegrity.org.

### License & Attribution
This data is being released under a CC BY 4.0 license. You are free to copy, redistribute and adapt this data. All that we ask is that you provide appropriate credit and a link to this license. You can [view the full LICENSE here](LICENSE).