python rrr.py -s /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/mc_220/saves -o /storage/labnas/students/igorbunova/spades_2.3/rectangles_result/ECOLI_MC220 --sc false
python rrr.py -s /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/ECOLI_MC480/saves -o /storage/labnas/students/igorbunova/spades_2.3/rectangles_result/ECOLI_MC480 --sc false
python rrr.py -s /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/ECOLI_SC_LANE1/saves -o /storage/labnas/students/igorbunova/spades_2.3/rectangles_result/ECOLI_SC_LANE1 --sc true
python rrr.py -s /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/ECOLI_SC_LANE6/saves -o /storage/labnas/students/igorbunova/spades_2.3/rectangles_result/ECOLI_SC_LANE6 --sc true
python rrr.py -s /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/ECOLI_SC_LANE7_JGI/saves -o /storage/labnas/students/igorbunova/spades_2.3/rectangles_result/ECOLI_SC_LANE7_JGI --sc true
python rrr.py -s /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/ECOLI_SC_LANE7_JGI_PRENORM/saves -o /storage/labnas/students/igorbunova/spades_2.3/rectangles_result/ECOLI_SC_LANE7_JGI_PRENORM --sc true
python rrr.py -s /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/M.ruber/saves -o /storage/labnas/students/igorbunova/spades_2.3/rectangles_result/M.ruber --sc true
python rrr.py -s /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/M.ruber_PRENORM/saves -o /storage/labnas/students/igorbunova/spades_2.3/rectangles_result/M.ruber_PRENORM --sc true
python rrr.py -s /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/P.heparinus/saves -o /storage/labnas/students/igorbunova/spades_2.3/rectangles_result/P.heparinus --sc true
python rrr.py -s /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/P.heparinus_PRENORM/saves -o /storage/labnas/students/igorbunova/spades_2.3/rectangles_result/P.heparinus_PRENORM --sc true
python rrr.py -s /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/S.aureus/saves -o /storage/labnas/students/igorbunova/spades_2.3/rectangles_result/S.aureus --sc true
rm -r /storage/labnas/students/igorbunova/spades_2.3/quast_results_prev
mv /storage/labnas/students/igorbunova/spades_2.3/quast_results /storage/labnas/students/igorbunova/spades_2.3/quast_results_prev
mkdir /storage/labnas/students/igorbunova/spades_2.3/quast_results
quast -R  /acestorage/data/input/E.coli/genes/MG1655-K12.fasta -G /acestorage/data/input/E.coli/genes/genes.txt /storage/labnas/students/igorbunova/spades_2.3/rectangles_result/ECOLI_MC220/rectangles_extend.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/mc_220/scaffolds.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/mc_220/contigs.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/mc_220/simplified_contigs.fasta -o /storage/labnas/students/igorbunova/spades_2.3/quast_results/ECOLI_MC220/

quast -R  /acestorage/data/input/E.coli/genes/MG1655-K12.fasta -G /acestorage/data/input/E.coli/genes/genes.txt /storage/labnas/students/igorbunova/spades_2.3/rectangles_result/ECOLI_MC480/rectangles_extend.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/ECOLI_MC480/scaffolds.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/ECOLI_MC480/contigs.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/ECOLI_MC480/simplified_contigs.fasta -o /storage/labnas/students/igorbunova/spades_2.3/quast_results/ECOLI_MC480/

quast -R  /acestorage/data/input/E.coli/genes/MG1655-K12.fasta -G /acestorage/data/input/E.coli/genes/genes.txt /storage/labnas/students/igorbunova/spades_2.3/rectangles_result/ECOLI_SC_LANE1/rectangles_extend.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/ECOLI_SC_LANE1/scaffolds.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/ECOLI_SC_LANE1/contigs.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/ECOLI_SC_LANE1/simplified_contigs.fasta -o /storage/labnas/students/igorbunova/spades_2.3/quast_results/ECOLI_SC_LANE1/

quast -R  /acestorage/data/input/E.coli/genes/MG1655-K12.fasta -G /acestorage/data/input/E.coli/genes/genes.txt /storage/labnas/students/igorbunova/spades_2.3/rectangles_result/ECOLI_SC_LANE6/rectangles_extend.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/ECOLI_SC_LANE6/scaffolds.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/ECOLI_SC_LANE6/contigs.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/ECOLI_SC_LANE6/simplified_contigs.fasta -o /storage/labnas/students/igorbunova/spades_2.3/quast_results/ECOLI_SC_LANE6/

quast -R  /acestorage/data/input/E.coli/genes/MG1655-K12.fasta -G /acestorage/data/input/E.coli/genes/genes.txt /storage/labnas/students/igorbunova/spades_2.3/rectangles_result/ECOLI_SC_LANE7_JGI/rectangles_extend.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/ECOLI_SC_LANE7_JGI/scaffolds.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/ECOLI_SC_LANE7_JGI/contigs.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/ECOLI_SC_LANE7_JGI/simplified_contigs.fasta –o /storage/labnas/students/igorbunova/spades_2.3/quast_results/ECOLI_SC_LANE7_JGI/

quast -R  /acestorage/data/input/E.coli/genes/MG1655-K12.fasta -G /acestorage/data/input/E.coli/genes/genes.txt /storage/labnas/students/igorbunova/spades_2.3/rectangles_result/ECOLI_SC_LANE7_JGI_PRENORM/rectangles_extend.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/ECOLI_SC_LANE7_JGI_PRENORM/scaffolds.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/ECOLI_SC_LANE7_JGI_PRENORM/contigs.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/ECOLI_SC_LANE7_JGI_PRENORM/simplified_contigs.fasta -o /storage/labnas/students/igorbunova/spades_2.3/quast_results/ECOLI_SC_LANE7_JGI_PRENORM/

quast -R  /storage/data/input/M.ruber/reference_NC_013946.1.fasta -G /storage/data/input/M.ruber/MRU_genes.txt /storage/labnas/students/igorbunova/spades_2.3/rectangles_result/M.ruber/rectangles_extend.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/M.ruber/scaffolds.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/M.ruber/contigs.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/M.ruber/simplified_contigs.fasta -o /storage/labnas/students/igorbunova/spades_2.3/quast_results/M.ruber/

quast -R  /storage/data/input/M.ruber/reference_NC_013946.1.fasta -G /storage/data/input/M.ruber/MRU_genes.txt /storage/labnas/students/igorbunova/spades_2.3/rectangles_result/M.ruber_PRENORM/rectangles_extend.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/M.ruber_PRENORM/scaffolds.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/M.ruber_PRENORM/contigs.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/M.ruber_PRENORM/simplified_contigs.fasta -o /storage/labnas/students/igorbunova/spades_2.3/quast_results/M.ruber_PRENORM/


quast -R  /storage/data/input/P.heparinus/reference_NC_013061.1.fasta  -G /storage/data/input/P.heparinus/PHE_genes.txt /storage/labnas/students/igorbunova/spades_2.3/rectangles_result/P.heparinus/rectangles_extend.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/P.heparinus/scaffolds.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/P.heparinus/contigs.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/P.heparinus/simplified_contigs.fasta -o /storage/labnas/students/igorbunova/spades_2.3/quast_results/P.heparinus/


quast -R  /storage/data/input/P.heparinus/reference_NC_013061.1.fasta  -G /storage/data/input/P.heparinus/PHE_genes.txt /storage/labnas/students/igorbunova/spades_2.3/rectangles_result/P.heparinus_PRENORM/rectangles_extend.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/P.heparinus_PRENORM/scaffolds.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/P.heparinus_PRENORM/contigs.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/P.heparinus_PRENORM/simplified_contigs.fasta -o /storage/labnas/students/igorbunova/spades_2.3/quast_results/P.heparinus_PRENORM/


quast -R /acestorage/data/input/S.aureus/genes/USA300_FPR3757_plus_plasmids.fasta -G /acestorage/data/input/S.aureus/genes/bacteria_and_plasmids_genes.txt /storage/labnas/students/igorbunova/spades_2.3/rectangles_result/S.aureus/rectangles_extend.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/S.aureus/scaffolds.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/S.aureus/contigs.fasta /storage/labnas/students/igorbunova/spades_2.3/all_datasets_results/S.aureus/simplified_contigs.fasta -o /storage/labnas/students/igorbunova/spades_2.3/quast_results/S.aureus/                     






