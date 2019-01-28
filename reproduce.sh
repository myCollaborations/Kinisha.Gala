
#just mortality
for i in 0 2 4 
do
echo "~/project/anaconda2/bin/Rscript de.R phenotype.mortality.day${i}.DE2.csv $PWD/analysis.DE.genes.day${i}.mortality day${i}.mortality">run.day${i}.mortality.sh
chmod 755 run.day${i}.mortality.sh
qsub -cwd -V -N qsub_day${i}_mortality -l h_data=8G,highp,time=4:00:00 run.day${i}.mortality.sh
done



# twbga for all individuals

for i in 0 2 4
do
echo "~/project/anaconda2/bin/Rscript de.R phenotype.twbga.day${i}.DE2.csv $PWD/analysis.DE.genes.day${i}.twbga day${i}.twbga">run.day${i}.twbga.sh
chmod 755 run.day${i}.twbga.sh
qsub -cwd -V -N qsub_day${i}_twbga -l h_data=8G,highp,time=4:00:00 run.day${i}.twbga.sh
done


# twbga (150) and mortality. many combinations

ls Run*sh | awk '{i+=1;print "qsub  -cwd -V -N qsub_twbga_mortality_"i" -l h_data=8G,highp,time=5:00:00 "$1}' >all.sh
chmod 755 all.sh
nohup ./all.sh &

