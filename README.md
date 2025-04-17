---
title: "README"
output: html_document
date: "2025-04-01"
---


# Project objective: 
The objective of this project is to map human genetic variation using the Allen
Ancient DNA Resource (AADR) from the Harvard University Dataverse dataset.This 
allows one to observe any population migrations in both Asia and Europe that may 
not have been studied enough or overlooked in the literature via the use of an 
rshiny leaflet map with a dynamic time slider that allows user to filter data by 
toggling the "date before present," data (date_BP). This is a data mining app 
project.

# Instructions For Code ReUse
# apps
--This is an R Shiny app project. to access code and app directly click on 
"mtDNAhaplogroupapp.R," "Yhaplogroupapp.R," and "DataCleaning.R." 

--These two apps contain thousands of genetic markers across the entire world.
There are approximately 20,000 genetic markers (rows) in this dataset. As well
it contains the years before present that each marker was detected to be. You 
will see that at 0 years before present we are at the present time. This 
contains the most markers and represent modern people who are still alive today. 
But this project is not interested in modern people, we are interested in 
ancient people. Particularly these apps were designed to model ancient 
population migrations. go to the mtDNA app and set slider to around 10,000 years
ago. What haplogroups do you see in Europe? you can click on these dots to see 
their names. In Western Europe, we see U (green), in Eastern Europe we see H 
(gray), and in Anatolia (Turkey) we see K (dark green). Now slide increments of 
a thousand years at a time and you will see that K moves north into the rest of 
Europe while H moves southwest into the Balkans. The K haplogroup is a genetic 
marker of the Early Neolithic Farmers who spread farming to Europe. H is the 
Genetic Markers of the Proto-Indo-Europeans (Yamnaya) who spread their DNA and 
language to Europe, we still speak these languages today and their genetic legacy
can still be seen in modern Europeans. The ancient U gets mostly replaced by K 
and H so that in modern times only really northern Scandinavians (Sami) and 
Estonians carry this genetic marker. This is the control test to see if this 
model works, and as you have seen, it does. The focus of this project is to 
look for Non-European population migrations as Europe is unfairly 
disproportionately covered which is why we use it as a control. I am going to 
look mostly at Asia since it has the most data in comparison to the rest of the 
world though I hope that in time more data will surface in non-European 
populations as these are severely understudied and in desperate need of 
research.


# data providence

Metadata:
The Harvard Dataverse is a compendium of data from academic publications stored 
for public use. The Allen Ancient DNA Resource (AADR) is a compendium within the
larger dataverse that has ancient human DNA data from different academic 
publications. 

Mallick, Swapan; Reich, David, 2023, "The Allen Ancient DNA Resource (AADR): 
A curated compendium of ancient human genomes", 
https://doi.org/10.7910/DVN/FFIDCW, Harvard Dataverse, V9; v62.0_HO_public.xlsx 

a link to exact data file:

https://dataverse.harvard.edu/file.xhtml?fileId=10537422&version=9.1

# dependencies
shiny
leaflet
viridis
sf

# directory structure
--- all data and scripts can be found in paleo_app 2 folder, there are no other
folders embedded in this folder.

--data:

The data itself used in this app consists of a column detailing years before
present, a column with the haplogroup data, and two columns with latitude and 
longitude.

All data should be .csv files

v62.0_HO_public.csv: this file contains original unedited data from source. 
(this should be used in DataCleaning.R)


clean_data.csv: this file contains the cleaned data. (it is the output of 
DataCleaning.R)

--scripts: 
mtDNAhaplogroupapp.R- this contains the script for the app that runs the leaflet 
plot and timeslider with mtDNA.

Yhaplogroupapp.R- this contains the script for the app that runs the leaflet 
plot and timeslider with Y DNA. 

DataCleaning.R-this cleans up the data so that it runs more smoothly and does 
not show any non-haplogroups in the final app.

# directions on how to use different data
--step 1:
find and download data file containing columns with numbers that represent years
before present, a column with latitude, and a column with longitude, and a 
column with chosen haplogroups. In this dataset the years before present are 
labeled date_BP, latitude is lat, longitude is long, and the haplogroups are
mt_DNA_hap, Y_hap2 for each app respectively. You should rename all of these 
columns when referenced in code to match your own column names.

--step 2:
run this dataset through DataCleaning.R if it needs it. DataCleaning.R will get
rid of cells containing the character sequences: "n/", "..", "-", "n/a", and 
"n/a (<2x)" and replace them with "NA" then it will coursen data so that only a 
maximum three digits of the haplogroups will be shown in app and then output a 
new .csv file with these changes made. to remove more haplogroups, simply copy and 
paste this line of code and place it directly under where you see it in 
DataCleaning.R (its in multiple places, placing it under any of these will not 
mess up code and will return desired output). 

> dat <- subset(dat, dat$yourhaplogroups != 'whatever you dont want to see in 
legend')

--step 3: 
after obtaining your new cleaned .csv file from write.csv, you are now ready to 
put this data in the main app's read.csv and launch the app.

# Acknowledgments

--Harvard University Dataverse: The Allen Ancient DNA Resource (AADR): A curated
compendium of ancient human genomes.

--Dan McGlinn who helped me a lot with this code, apps as it turns out are 
really hard to make.

--StackOverflow this site had a lot of explanations for bugs that I got.

--GeeksforGeeks, helped me understand relative file paths.
