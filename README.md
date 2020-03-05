# Hacking the Historical Data: Register of Chinese Immigrants to Canada, 1886-1949

## A History of Discrimination and Exclusion
Through the mid- to late nineteenth century, some 15,000 labourers were brought from China to do construction work on the Canadian Pacific Railway (CPR), though they were only paid a third or a half less than their co-workers

Responding to anti-immigration sentiment in British Columbia, the federal parliament passed in 1885 the Chinese Immigration Act, which stipulated that all Chinese entering Canada must first pay a 50-dollar fee, later referred to as a head tax. This was amended in 1887, 1892, and 1901, with the fee increasing to its maximum of $500 in 1903.

Between 1885 and 1923, the Government of Canada collect about 33 million dollars ($334 million in 2016 dollars), from about 97,000 Chinese headtax payers.

The headtax system also had the effect of constraining Chinese immigration; it discouraged Chinese women and children from joining their men, so the Chinese community in Canada became a "bachelor society".

## The Registry and the Digital Dataset
Thanks to two scholars, Peter Ward and Henry Yu, and their teams at the History Department of the University of British Columbia, the Register of Chinese Immigrants to Canada (1886-1949) has been transformed to a digital spreadsheet, openly accessible from <a href="https://open.library.ubc.ca/cIRcle/collections/facultyresearchandpublications/52383/items/1.0075988">UBC Open Collection </a>, and a searchable database accessible from <a href="http://www.collectionscanada.gc.ca/databases/chinese-immigrants/index-e.html"> Library and Archives Canada </a>, is such an example.

## Our Work 
Curious about to what extent this dataset has been utilized, we went on a journey of mining the data. We discovered a lot-- the difficulty with interpretation of the data due to lack of a codebook, the untapped potential of the data. We fixed the issues, uncovered patterns, and had fun.

## What's included in this repo
Two R scripts are included in this repo. 
Xinhui.R is the R script for cleaning and analyzing the registry data to generate the line chart of the change in the immigrants' heights among a few cohorts, with the data filtered to Xinhui County. 
Zhongshan.R is the R script for cleaning and analyzing the registry data to generate the scatterplot which shows the relationship between the number of immigrants from a village and the number of total destinations of that village, with the data filtered to Zhongshan County.

For more information, please visit this OSF Project [Hacking the Historical Data: Register of Chinese Immigrants to Canada, 1886-1949](https://osf.io/9zr6f/)