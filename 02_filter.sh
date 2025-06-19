#look at zipped notes  notes 

unzip -p notes-00000.zip |head

#convert start and end dates to milliseconds 

date -d "2021-01-23T00:00:00Z" +%s000
#Jan 23-  1611360000000
 
date -d "2021-07-31T23:59:59Z" +%s000
#july 27- 1627775999000

#unzip and filter 

# Unzip and filter into filtered_notes.tsv
unzip -p notes-00000.zip | awk -F'\t' 'NR == 1 || ($3 >= 1611360000000 && $3 <= 1627775999000)' > filtered_notes.tsv

#check out rating format 
unzip -p ratings-00000.zip |head

#loop through ratings files, extract and filter 
for i in $(seq -w 0 19);do 
    unzip -p ratings-000${i}.zip | awk -F'\t' 'NR == 1 || ($3 >= 1611360000000 && $3 <= 1627775999000)' > filtered_ratings_${i}.tsv
done 

#manually moved it to folder for organization
#check no of lines in filtered_notes
wc -l filtered_data/filtered_notes.tsv


#manually deleted empty files after filtered data 
#merge remaining rating files, merging headers
head -n 1 filtered_data/filtered_ratings_00.tsv > complete_filtered_ratings.tsv
for i in $(seq -w 0 9); do
    tail -n +2 filtered_data/filtered_ratings_0${i}.tsv >> complete_filtered_ratings.tsv
done