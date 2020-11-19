# Load csv and format data into columns: YEAR, POPULATION_RATE
#  Export csv: python transform-birth-rate.py > birth-rate-yearly.csv

import csv

# online source
# birth = "http://datasets.flowingdata.com/birth-rate.csv"

birth = "D:/dev_projects/Data-Mining-and-Analytics/datasets/birth-rate.csv"
reader = csv.reader(open(birth,'r'), delimiter=",")
rows_so_far = 0

print("year,rate")
for row in reader:
    if rows_so_far == 0:
        header = row
        rows_so_far += 1
    else:
        for i in range(len(row)):
            if i>0 and row[i]:
                print (header[i] + ',' + row[i])
        rows_so_far += 1