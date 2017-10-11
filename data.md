Raw data
================
Sylvain SCHMITT
18 septembre 2017

This document only list raw data files present in the data folder that are not uploaded online for security and storage issues.

``` bash
cd data
tree
```

    ## .
    ## ├── BRIDGE
    ## │   ├── bridge.csv
    ## │   └── Bridge_sylvain.xlsx
    ## ├── GbS_Symphonia
    ## │   ├── assembly
    ## │   │   ├── params-symphoGbS2.txt
    ## │   │   ├── script.sh
    ## │   │   ├── symphoGbS2_across
    ## │   │   │   ├── s6_cluster_stats.txt
    ## │   │   │   ├── symphoGbS2_catclust.gz
    ## │   │   │   ├── symphoGbS2.clust.hdf5
    ## │   │   │   └── symphoGbS2.utemp.sort
    ## │   │   ├── symphoGbS2_clust_0.85
    ## │   │   │   ├── PR_10.clustS.gz
    ## │   │   │   ├── PR_11.clustS.gz
    ## │   │   │   ├── PR_12.clustS.gz
    ## │   │   │   ├── PR_13.clustS.gz
    ## │   │   │   ├── PR_14.clustS.gz
    ## │   │   │   ├── PR_15.clustS.gz
    ## │   │   │   ├── PR_16.clustS.gz
    ## │   │   │   ├── PR_17.clustS.gz
    ## │   │   │   ├── PR_18.clustS.gz
    ## │   │   │   ├── PR_19.clustS.gz
    ## │   │   │   ├── PR_20.clustS.gz
    ## │   │   │   ├── PR_21.clustS.gz
    ## │   │   │   ├── PR_22.clustS.gz
    ## │   │   │   ├── PR_23.clustS.gz
    ## │   │   │   ├── PR_24.clustS.gz
    ## │   │   │   ├── PR_25.clustS.gz
    ## │   │   │   ├── PR_26.clustS.gz
    ## │   │   │   ├── PR_27.clustS.gz
    ## │   │   │   ├── PR_28.clustS.gz
    ## │   │   │   ├── PR_2.clustS.gz
    ## │   │   │   ├── PR_30.clustS.gz
    ## │   │   │   ├── PR_32.clustS.gz
    ## │   │   │   ├── PR_33.clustS.gz
    ## │   │   │   ├── PR_34.clustS.gz
    ## │   │   │   ├── PR_35.clustS.gz
    ## │   │   │   ├── PR_36.clustS.gz
    ## │   │   │   ├── PR_37.clustS.gz
    ## │   │   │   ├── PR_38.clustS.gz
    ## │   │   │   ├── PR_39.clustS.gz
    ## │   │   │   ├── PR_3.clustS.gz
    ## │   │   │   ├── PR_40.clustS.gz
    ## │   │   │   ├── PR_41.clustS.gz
    ## │   │   │   ├── PR_42.clustS.gz
    ## │   │   │   ├── PR_43.clustS.gz
    ## │   │   │   ├── PR_44.clustS.gz
    ## │   │   │   ├── PR_46.clustS.gz
    ## │   │   │   ├── PR_47.clustS.gz
    ## │   │   │   ├── PR_48.clustS.gz
    ## │   │   │   ├── PR_49c.clustS.gz
    ## │   │   │   ├── PR_4.clustS.gz
    ## │   │   │   ├── PR_50.clustS.gz
    ## │   │   │   ├── PR_51.clustS.gz
    ## │   │   │   ├── PR_52.clustS.gz
    ## │   │   │   ├── PR_53.clustS.gz
    ## │   │   │   ├── PR_54.clustS.gz
    ## │   │   │   ├── PR_55.clustS.gz
    ## │   │   │   ├── PR_57.clustS.gz
    ## │   │   │   ├── PR_58.clustS.gz
    ## │   │   │   ├── PR_59.clustS.gz
    ## │   │   │   ├── PR_60.clustS.gz
    ## │   │   │   ├── PR_61.clustS.gz
    ## │   │   │   ├── PR_62.clustS.gz
    ## │   │   │   ├── PR_63.clustS.gz
    ## │   │   │   ├── PR_64.clustS.gz
    ## │   │   │   ├── PR_65.clustS.gz
    ## │   │   │   ├── PR_66.clustS.gz
    ## │   │   │   ├── PR_6.clustS.gz
    ## │   │   │   ├── PR_7.clustS.gz
    ## │   │   │   ├── PR_8.clustS.gz
    ## │   │   │   ├── PR_9.clustS.gz
    ## │   │   │   ├── RG_10.clustS.gz
    ## │   │   │   ├── RG_11.clustS.gz
    ## │   │   │   ├── RG_12.clustS.gz
    ## │   │   │   ├── RG_13.clustS.gz
    ## │   │   │   ├── RG_14.clustS.gz
    ## │   │   │   ├── RG_15.clustS.gz
    ## │   │   │   ├── RG_16.clustS.gz
    ## │   │   │   ├── RG_17.clustS.gz
    ## │   │   │   ├── RG_18.clustS.gz
    ## │   │   │   ├── RG_19.clustS.gz
    ## │   │   │   ├── RG_1c.clustS.gz
    ## │   │   │   ├── RG_20.clustS.gz
    ## │   │   │   ├── RG_2.clustS.gz
    ## │   │   │   ├── RG_3.clustS.gz
    ## │   │   │   ├── RG_4.clustS.gz
    ## │   │   │   ├── RG_5.clustS.gz
    ## │   │   │   ├── RG_6.clustS.gz
    ## │   │   │   ├── RG_7.clustS.gz
    ## │   │   │   ├── RG_8.clustS.gz
    ## │   │   │   ├── RG_9.clustS.gz
    ## │   │   │   ├── s3_cluster_stats.txt
    ## │   │   │   └── s4_joint_estimate.txt
    ## │   │   ├── symphoGbS2_consens
    ## │   │   │   ├── PR_10.catg
    ## │   │   │   ├── PR_10.consens.gz
    ## │   │   │   ├── PR_11.catg
    ## │   │   │   ├── PR_11.consens.gz
    ## │   │   │   ├── PR_12.catg
    ## │   │   │   ├── PR_12.consens.gz
    ## │   │   │   ├── PR_13.catg
    ## │   │   │   ├── PR_13.consens.gz
    ## │   │   │   ├── PR_14.catg
    ## │   │   │   ├── PR_14.consens.gz
    ## │   │   │   ├── PR_15.catg
    ## │   │   │   ├── PR_15.consens.gz
    ## │   │   │   ├── PR_16.catg
    ## │   │   │   ├── PR_16.consens.gz
    ## │   │   │   ├── PR_17.catg
    ## │   │   │   ├── PR_17.consens.gz
    ## │   │   │   ├── PR_18.catg
    ## │   │   │   ├── PR_18.consens.gz
    ## │   │   │   ├── PR_19.catg
    ## │   │   │   ├── PR_19.consens.gz
    ## │   │   │   ├── PR_20.catg
    ## │   │   │   ├── PR_20.consens.gz
    ## │   │   │   ├── PR_21.catg
    ## │   │   │   ├── PR_21.consens.gz
    ## │   │   │   ├── PR_22.catg
    ## │   │   │   ├── PR_22.consens.gz
    ## │   │   │   ├── PR_23.catg
    ## │   │   │   ├── PR_23.consens.gz
    ## │   │   │   ├── PR_24.catg
    ## │   │   │   ├── PR_24.consens.gz
    ## │   │   │   ├── PR_25.catg
    ## │   │   │   ├── PR_25.consens.gz
    ## │   │   │   ├── PR_26.catg
    ## │   │   │   ├── PR_26.consens.gz
    ## │   │   │   ├── PR_27.catg
    ## │   │   │   ├── PR_27.consens.gz
    ## │   │   │   ├── PR_28.catg
    ## │   │   │   ├── PR_28.consens.gz
    ## │   │   │   ├── PR_2.catg
    ## │   │   │   ├── PR_2.consens.gz
    ## │   │   │   ├── PR_30.catg
    ## │   │   │   ├── PR_30.consens.gz
    ## │   │   │   ├── PR_32.catg
    ## │   │   │   ├── PR_32.consens.gz
    ## │   │   │   ├── PR_33.catg
    ## │   │   │   ├── PR_33.consens.gz
    ## │   │   │   ├── PR_34.catg
    ## │   │   │   ├── PR_34.consens.gz
    ## │   │   │   ├── PR_35.catg
    ## │   │   │   ├── PR_35.consens.gz
    ## │   │   │   ├── PR_36.catg
    ## │   │   │   ├── PR_36.consens.gz
    ## │   │   │   ├── PR_37.catg
    ## │   │   │   ├── PR_37.consens.gz
    ## │   │   │   ├── PR_38.catg
    ## │   │   │   ├── PR_38.consens.gz
    ## │   │   │   ├── PR_39.catg
    ## │   │   │   ├── PR_39.consens.gz
    ## │   │   │   ├── PR_3.catg
    ## │   │   │   ├── PR_3.consens.gz
    ## │   │   │   ├── PR_40.catg
    ## │   │   │   ├── PR_40.consens.gz
    ## │   │   │   ├── PR_41.catg
    ## │   │   │   ├── PR_41.consens.gz
    ## │   │   │   ├── PR_42.catg
    ## │   │   │   ├── PR_42.consens.gz
    ## │   │   │   ├── PR_43.catg
    ## │   │   │   ├── PR_43.consens.gz
    ## │   │   │   ├── PR_44.catg
    ## │   │   │   ├── PR_44.consens.gz
    ## │   │   │   ├── PR_46.catg
    ## │   │   │   ├── PR_46.consens.gz
    ## │   │   │   ├── PR_47.catg
    ## │   │   │   ├── PR_47.consens.gz
    ## │   │   │   ├── PR_48.catg
    ## │   │   │   ├── PR_48.consens.gz
    ## │   │   │   ├── PR_49c.catg
    ## │   │   │   ├── PR_49c.consens.gz
    ## │   │   │   ├── PR_4.catg
    ## │   │   │   ├── PR_4.consens.gz
    ## │   │   │   ├── PR_50.catg
    ## │   │   │   ├── PR_50.consens.gz
    ## │   │   │   ├── PR_51.catg
    ## │   │   │   ├── PR_51.consens.gz
    ## │   │   │   ├── PR_52.catg
    ## │   │   │   ├── PR_52.consens.gz
    ## │   │   │   ├── PR_53.catg
    ## │   │   │   ├── PR_53.consens.gz
    ## │   │   │   ├── PR_54.catg
    ## │   │   │   ├── PR_54.consens.gz
    ## │   │   │   ├── PR_55.catg
    ## │   │   │   ├── PR_55.consens.gz
    ## │   │   │   ├── PR_57.catg
    ## │   │   │   ├── PR_57.consens.gz
    ## │   │   │   ├── PR_58.catg
    ## │   │   │   ├── PR_58.consens.gz
    ## │   │   │   ├── PR_59.catg
    ## │   │   │   ├── PR_59.consens.gz
    ## │   │   │   ├── PR_60.catg
    ## │   │   │   ├── PR_60.consens.gz
    ## │   │   │   ├── PR_61.catg
    ## │   │   │   ├── PR_61.consens.gz
    ## │   │   │   ├── PR_62.catg
    ## │   │   │   ├── PR_62.consens.gz
    ## │   │   │   ├── PR_63.catg
    ## │   │   │   ├── PR_63.consens.gz
    ## │   │   │   ├── PR_64.catg
    ## │   │   │   ├── PR_64.consens.gz
    ## │   │   │   ├── PR_65.catg
    ## │   │   │   ├── PR_65.consens.gz
    ## │   │   │   ├── PR_66.catg
    ## │   │   │   ├── PR_66.consens.gz
    ## │   │   │   ├── PR_6.catg
    ## │   │   │   ├── PR_6.consens.gz
    ## │   │   │   ├── PR_7.catg
    ## │   │   │   ├── PR_7.consens.gz
    ## │   │   │   ├── PR_8.catg
    ## │   │   │   ├── PR_8.consens.gz
    ## │   │   │   ├── PR_9.catg
    ## │   │   │   ├── PR_9.consens.gz
    ## │   │   │   ├── RG_10.catg
    ## │   │   │   ├── RG_10.consens.gz
    ## │   │   │   ├── RG_11.catg
    ## │   │   │   ├── RG_11.consens.gz
    ## │   │   │   ├── RG_12.catg
    ## │   │   │   ├── RG_12.consens.gz
    ## │   │   │   ├── RG_13.catg
    ## │   │   │   ├── RG_13.consens.gz
    ## │   │   │   ├── RG_14.catg
    ## │   │   │   ├── RG_14.consens.gz
    ## │   │   │   ├── RG_15.catg
    ## │   │   │   ├── RG_15.consens.gz
    ## │   │   │   ├── RG_16.catg
    ## │   │   │   ├── RG_16.consens.gz
    ## │   │   │   ├── RG_17.catg
    ## │   │   │   ├── RG_17.consens.gz
    ## │   │   │   ├── RG_18.catg
    ## │   │   │   ├── RG_18.consens.gz
    ## │   │   │   ├── RG_19.catg
    ## │   │   │   ├── RG_19.consens.gz
    ## │   │   │   ├── RG_1c.catg
    ## │   │   │   ├── RG_1c.consens.gz
    ## │   │   │   ├── RG_20.catg
    ## │   │   │   ├── RG_20.consens.gz
    ## │   │   │   ├── RG_2.catg
    ## │   │   │   ├── RG_2.consens.gz
    ## │   │   │   ├── RG_3.catg
    ## │   │   │   ├── RG_3.consens.gz
    ## │   │   │   ├── RG_4.catg
    ## │   │   │   ├── RG_4.consens.gz
    ## │   │   │   ├── RG_5.catg
    ## │   │   │   ├── RG_5.consens.gz
    ## │   │   │   ├── RG_6.catg
    ## │   │   │   ├── RG_6.consens.gz
    ## │   │   │   ├── RG_7.catg
    ## │   │   │   ├── RG_7.consens.gz
    ## │   │   │   ├── RG_8.catg
    ## │   │   │   ├── RG_8.consens.gz
    ## │   │   │   ├── RG_9.catg
    ## │   │   │   ├── RG_9.consens.gz
    ## │   │   │   └── s5_consens_stats.txt
    ## │   │   ├── symphoGbS2_edits
    ## │   │   │   ├── PR_10.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_11.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_12.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_13.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_14.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_15.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_16.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_17.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_18.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_19.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_20.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_21.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_22.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_23.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_24.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_25.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_26.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_27.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_28.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_2.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_30.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_32.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_33.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_34.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_35.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_36.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_37.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_38.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_39.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_3.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_40.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_41.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_42.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_43.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_44.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_46.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_47.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_48.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_49c.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_49.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_4.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_50.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_51.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_52.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_53.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_54.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_55.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_57.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_58.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_59.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_60.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_61.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_62.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_63.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_64.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_65.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_66.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_6.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_7.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_8.trimmed_R1_.fastq.gz
    ## │   │   │   ├── PR_9.trimmed_R1_.fastq.gz
    ## │   │   │   ├── RG_10.trimmed_R1_.fastq.gz
    ## │   │   │   ├── RG_11.trimmed_R1_.fastq.gz
    ## │   │   │   ├── RG_12.trimmed_R1_.fastq.gz
    ## │   │   │   ├── RG_13.trimmed_R1_.fastq.gz
    ## │   │   │   ├── RG_14.trimmed_R1_.fastq.gz
    ## │   │   │   ├── RG_15.trimmed_R1_.fastq.gz
    ## │   │   │   ├── RG_16.trimmed_R1_.fastq.gz
    ## │   │   │   ├── RG_17.trimmed_R1_.fastq.gz
    ## │   │   │   ├── RG_18.trimmed_R1_.fastq.gz
    ## │   │   │   ├── RG_19.trimmed_R1_.fastq.gz
    ## │   │   │   ├── RG_1c.trimmed_R1_.fastq.gz
    ## │   │   │   ├── RG_1.trimmed_R1_.fastq.gz
    ## │   │   │   ├── RG_20.trimmed_R1_.fastq.gz
    ## │   │   │   ├── RG_2.trimmed_R1_.fastq.gz
    ## │   │   │   ├── RG_3.trimmed_R1_.fastq.gz
    ## │   │   │   ├── RG_4.trimmed_R1_.fastq.gz
    ## │   │   │   ├── RG_5.trimmed_R1_.fastq.gz
    ## │   │   │   ├── RG_6.trimmed_R1_.fastq.gz
    ## │   │   │   ├── RG_7.trimmed_R1_.fastq.gz
    ## │   │   │   ├── RG_8.trimmed_R1_.fastq.gz
    ## │   │   │   ├── RG_9.trimmed_R1_.fastq.gz
    ## │   │   │   └── s2_rawedit_stats.txt
    ## │   │   ├── symphoGbS2.json
    ## │   │   ├── symphoGbS2.o2627837
    ## │   │   ├── symphoGbS2_outfiles
    ## │   │   │   ├── pop.txt
    ## │   │   │   ├── symphoGbS2.hdf5
    ## │   │   │   ├── symphoGbS2.loci
    ## │   │   │   ├── symphoGbS2.phy
    ## │   │   │   ├── symphoGbS2.snps.map
    ## │   │   │   ├── symphoGbS2.snps.phy
    ## │   │   │   ├── symphoGbS2.spag
    ## │   │   │   ├── symphoGbS2_stats.txt
    ## │   │   │   ├── symphoGbS2.str
    ## │   │   │   ├── symphoGbS2.vcf
    ## │   │   │   ├── vcf2str.sh
    ## │   │   │   └── vcf2str.spid
    ## │   │   ├── symphoGbS2_s1_demultiplex_stats.txt
    ## │   │   └── symphoGbS2.tar.gz
    ## │   ├── distance_matrices
    ## │   │   ├── old
    ## │   │   │   ├── Allpops_GbS.spagedi
    ## │   │   │   ├── GbS_FrGuiana.spagedi
    ## │   │   │   ├── Guiana_stats.out
    ## │   │   │   └── Guiana_stats.Rmd
    ## │   │   ├── symphoGbS2.out
    ## │   │   └── symphoGbS2.spag
    ## │   ├── raw
    ## │   │   └── GbS.tar.gz
    ## │   └── structure
    ## │       ├── extraparams
    ## │       ├── harvester
    ## │       │   ├── result
    ## │       │   │   ├── deltaK.eps
    ## │       │   │   ├── deltaK.pdf
    ## │       │   │   ├── deltaK.png
    ## │       │   │   ├── evannoTable.tab
    ## │       │   │   ├── K10.indfile
    ## │       │   │   ├── K10.popfile
    ## │       │   │   ├── K1.indfile
    ## │       │   │   ├── K1.popfile
    ## │       │   │   ├── K2.indfile
    ## │       │   │   ├── K2.popfile
    ## │       │   │   ├── K3.indfile
    ## │       │   │   ├── K3.popfile
    ## │       │   │   ├── K4.indfile
    ## │       │   │   ├── K4.popfile
    ## │       │   │   ├── K5.indfile
    ## │       │   │   ├── K5.popfile
    ## │       │   │   ├── K6.indfile
    ## │       │   │   ├── K6.popfile
    ## │       │   │   ├── K7.indfile
    ## │       │   │   ├── K7.popfile
    ## │       │   │   ├── K8.indfile
    ## │       │   │   ├── K8.popfile
    ## │       │   │   ├── K9.indfile
    ## │       │   │   ├── K9.popfile
    ## │       │   │   ├── lnPK.eps
    ## │       │   │   ├── lnPK.pdf
    ## │       │   │   ├── lnPK.png
    ## │       │   │   ├── lnPPK.eps
    ## │       │   │   ├── lnPPK.pdf
    ## │       │   │   ├── lnPPK.png
    ## │       │   │   ├── meanLnProb.eps
    ## │       │   │   ├── meanLnProb.pdf
    ## │       │   │   ├── meanLnProb.png
    ## │       │   │   ├── rawSummary.tab
    ## │       │   │   └── summary.html
    ## │       │   └── symphoGbS2_Harvester_Upload.zip
    ## │       ├── input.py
    ## │       ├── input.pyc
    ## │       ├── log
    ## │       │   ├── k1
    ## │       │   │   ├── symphoGbS2_k1_run10.log
    ## │       │   │   ├── symphoGbS2_k1_run1.log
    ## │       │   │   ├── symphoGbS2_k1_run2.log
    ## │       │   │   ├── symphoGbS2_k1_run3.log
    ## │       │   │   ├── symphoGbS2_k1_run4.log
    ## │       │   │   ├── symphoGbS2_k1_run5.log
    ## │       │   │   ├── symphoGbS2_k1_run6.log
    ## │       │   │   ├── symphoGbS2_k1_run7.log
    ## │       │   │   ├── symphoGbS2_k1_run8.log
    ## │       │   │   └── symphoGbS2_k1_run9.log
    ## │       │   ├── k10
    ## │       │   │   ├── symphoGbS2_k10_run10.log
    ## │       │   │   ├── symphoGbS2_k10_run1.log
    ## │       │   │   ├── symphoGbS2_k10_run2.log
    ## │       │   │   ├── symphoGbS2_k10_run3.log
    ## │       │   │   ├── symphoGbS2_k10_run4.log
    ## │       │   │   ├── symphoGbS2_k10_run5.log
    ## │       │   │   ├── symphoGbS2_k10_run6.log
    ## │       │   │   ├── symphoGbS2_k10_run7.log
    ## │       │   │   ├── symphoGbS2_k10_run8.log
    ## │       │   │   └── symphoGbS2_k10_run9.log
    ## │       │   ├── k2
    ## │       │   │   ├── symphoGbS2_k2_run10.log
    ## │       │   │   ├── symphoGbS2_k2_run1.log
    ## │       │   │   ├── symphoGbS2_k2_run2.log
    ## │       │   │   ├── symphoGbS2_k2_run3.log
    ## │       │   │   ├── symphoGbS2_k2_run4.log
    ## │       │   │   ├── symphoGbS2_k2_run5.log
    ## │       │   │   ├── symphoGbS2_k2_run6.log
    ## │       │   │   ├── symphoGbS2_k2_run7.log
    ## │       │   │   ├── symphoGbS2_k2_run8.log
    ## │       │   │   └── symphoGbS2_k2_run9.log
    ## │       │   ├── k3
    ## │       │   │   ├── symphoGbS2_k3_run10.log
    ## │       │   │   ├── symphoGbS2_k3_run1.log
    ## │       │   │   ├── symphoGbS2_k3_run2.log
    ## │       │   │   ├── symphoGbS2_k3_run3.log
    ## │       │   │   ├── symphoGbS2_k3_run4.log
    ## │       │   │   ├── symphoGbS2_k3_run5.log
    ## │       │   │   ├── symphoGbS2_k3_run6.log
    ## │       │   │   ├── symphoGbS2_k3_run7.log
    ## │       │   │   ├── symphoGbS2_k3_run8.log
    ## │       │   │   └── symphoGbS2_k3_run9.log
    ## │       │   ├── k4
    ## │       │   │   ├── symphoGbS2_k4_run10.log
    ## │       │   │   ├── symphoGbS2_k4_run1.log
    ## │       │   │   ├── symphoGbS2_k4_run2.log
    ## │       │   │   ├── symphoGbS2_k4_run3.log
    ## │       │   │   ├── symphoGbS2_k4_run4.log
    ## │       │   │   ├── symphoGbS2_k4_run5.log
    ## │       │   │   ├── symphoGbS2_k4_run6.log
    ## │       │   │   ├── symphoGbS2_k4_run7.log
    ## │       │   │   ├── symphoGbS2_k4_run8.log
    ## │       │   │   └── symphoGbS2_k4_run9.log
    ## │       │   ├── k5
    ## │       │   │   ├── symphoGbS2_k5_run10.log
    ## │       │   │   ├── symphoGbS2_k5_run1.log
    ## │       │   │   ├── symphoGbS2_k5_run2.log
    ## │       │   │   ├── symphoGbS2_k5_run3.log
    ## │       │   │   ├── symphoGbS2_k5_run4.log
    ## │       │   │   ├── symphoGbS2_k5_run5.log
    ## │       │   │   ├── symphoGbS2_k5_run6.log
    ## │       │   │   ├── symphoGbS2_k5_run7.log
    ## │       │   │   ├── symphoGbS2_k5_run8.log
    ## │       │   │   └── symphoGbS2_k5_run9.log
    ## │       │   ├── k6
    ## │       │   │   ├── symphoGbS2_k6_run10.log
    ## │       │   │   ├── symphoGbS2_k6_run1.log
    ## │       │   │   ├── symphoGbS2_k6_run2.log
    ## │       │   │   ├── symphoGbS2_k6_run3.log
    ## │       │   │   ├── symphoGbS2_k6_run4.log
    ## │       │   │   ├── symphoGbS2_k6_run5.log
    ## │       │   │   ├── symphoGbS2_k6_run6.log
    ## │       │   │   ├── symphoGbS2_k6_run7.log
    ## │       │   │   ├── symphoGbS2_k6_run8.log
    ## │       │   │   └── symphoGbS2_k6_run9.log
    ## │       │   ├── k7
    ## │       │   │   ├── symphoGbS2_k7_run10.log
    ## │       │   │   ├── symphoGbS2_k7_run1.log
    ## │       │   │   ├── symphoGbS2_k7_run2.log
    ## │       │   │   ├── symphoGbS2_k7_run3.log
    ## │       │   │   ├── symphoGbS2_k7_run4.log
    ## │       │   │   ├── symphoGbS2_k7_run5.log
    ## │       │   │   ├── symphoGbS2_k7_run6.log
    ## │       │   │   ├── symphoGbS2_k7_run7.log
    ## │       │   │   ├── symphoGbS2_k7_run8.log
    ## │       │   │   └── symphoGbS2_k7_run9.log
    ## │       │   ├── k8
    ## │       │   │   ├── symphoGbS2_k8_run10.log
    ## │       │   │   ├── symphoGbS2_k8_run1.log
    ## │       │   │   ├── symphoGbS2_k8_run2.log
    ## │       │   │   ├── symphoGbS2_k8_run3.log
    ## │       │   │   ├── symphoGbS2_k8_run4.log
    ## │       │   │   ├── symphoGbS2_k8_run5.log
    ## │       │   │   ├── symphoGbS2_k8_run6.log
    ## │       │   │   ├── symphoGbS2_k8_run7.log
    ## │       │   │   ├── symphoGbS2_k8_run8.log
    ## │       │   │   └── symphoGbS2_k8_run9.log
    ## │       │   └── k9
    ## │       │       ├── symphoGbS2_k9_run10.log
    ## │       │       ├── symphoGbS2_k9_run1.log
    ## │       │       ├── symphoGbS2_k9_run2.log
    ## │       │       ├── symphoGbS2_k9_run3.log
    ## │       │       ├── symphoGbS2_k9_run4.log
    ## │       │       ├── symphoGbS2_k9_run5.log
    ## │       │       ├── symphoGbS2_k9_run6.log
    ## │       │       ├── symphoGbS2_k9_run7.log
    ## │       │       ├── symphoGbS2_k9_run8.log
    ## │       │       └── symphoGbS2_k9_run9.log
    ## │       ├── mainparams
    ## │       ├── results_f
    ## │       │   ├── k1
    ## │       │   │   ├── symphoGbS2_k1_run10_f
    ## │       │   │   ├── symphoGbS2_k1_run1_f
    ## │       │   │   ├── symphoGbS2_k1_run2_f
    ## │       │   │   ├── symphoGbS2_k1_run3_f
    ## │       │   │   ├── symphoGbS2_k1_run4_f
    ## │       │   │   ├── symphoGbS2_k1_run5_f
    ## │       │   │   ├── symphoGbS2_k1_run6_f
    ## │       │   │   ├── symphoGbS2_k1_run7_f
    ## │       │   │   ├── symphoGbS2_k1_run8_f
    ## │       │   │   └── symphoGbS2_k1_run9_f
    ## │       │   ├── k10
    ## │       │   │   ├── symphoGbS2_k10_run10_f
    ## │       │   │   ├── symphoGbS2_k10_run1_f
    ## │       │   │   ├── symphoGbS2_k10_run2_f
    ## │       │   │   ├── symphoGbS2_k10_run3_f
    ## │       │   │   ├── symphoGbS2_k10_run4_f
    ## │       │   │   ├── symphoGbS2_k10_run5_f
    ## │       │   │   ├── symphoGbS2_k10_run6_f
    ## │       │   │   ├── symphoGbS2_k10_run7_f
    ## │       │   │   ├── symphoGbS2_k10_run8_f
    ## │       │   │   └── symphoGbS2_k10_run9_f
    ## │       │   ├── k2
    ## │       │   │   ├── symphoGbS2_k2_run10_f
    ## │       │   │   ├── symphoGbS2_k2_run1_f
    ## │       │   │   ├── symphoGbS2_k2_run2_f
    ## │       │   │   ├── symphoGbS2_k2_run3_f
    ## │       │   │   ├── symphoGbS2_k2_run4_f
    ## │       │   │   ├── symphoGbS2_k2_run5_f
    ## │       │   │   ├── symphoGbS2_k2_run6_f
    ## │       │   │   ├── symphoGbS2_k2_run7_f
    ## │       │   │   ├── symphoGbS2_k2_run8_f
    ## │       │   │   └── symphoGbS2_k2_run9_f
    ## │       │   ├── k3
    ## │       │   │   ├── symphoGbS2_k3_run10_f
    ## │       │   │   ├── symphoGbS2_k3_run1_f
    ## │       │   │   ├── symphoGbS2_k3_run2_f
    ## │       │   │   ├── symphoGbS2_k3_run3_f
    ## │       │   │   ├── symphoGbS2_k3_run4_f
    ## │       │   │   ├── symphoGbS2_k3_run5_f
    ## │       │   │   ├── symphoGbS2_k3_run6_f
    ## │       │   │   ├── symphoGbS2_k3_run7_f
    ## │       │   │   ├── symphoGbS2_k3_run8_f
    ## │       │   │   └── symphoGbS2_k3_run9_f
    ## │       │   ├── k4
    ## │       │   │   ├── symphoGbS2_k4_run10_f
    ## │       │   │   ├── symphoGbS2_k4_run1_f
    ## │       │   │   ├── symphoGbS2_k4_run2_f
    ## │       │   │   ├── symphoGbS2_k4_run3_f
    ## │       │   │   ├── symphoGbS2_k4_run4_f
    ## │       │   │   ├── symphoGbS2_k4_run5_f
    ## │       │   │   ├── symphoGbS2_k4_run6_f
    ## │       │   │   ├── symphoGbS2_k4_run7_f
    ## │       │   │   ├── symphoGbS2_k4_run8_f
    ## │       │   │   └── symphoGbS2_k4_run9_f
    ## │       │   ├── k5
    ## │       │   │   ├── symphoGbS2_k5_run10_f
    ## │       │   │   ├── symphoGbS2_k5_run1_f
    ## │       │   │   ├── symphoGbS2_k5_run2_f
    ## │       │   │   ├── symphoGbS2_k5_run3_f
    ## │       │   │   ├── symphoGbS2_k5_run4_f
    ## │       │   │   ├── symphoGbS2_k5_run5_f
    ## │       │   │   ├── symphoGbS2_k5_run6_f
    ## │       │   │   ├── symphoGbS2_k5_run7_f
    ## │       │   │   ├── symphoGbS2_k5_run8_f
    ## │       │   │   └── symphoGbS2_k5_run9_f
    ## │       │   ├── k6
    ## │       │   │   ├── symphoGbS2_k6_run10_f
    ## │       │   │   ├── symphoGbS2_k6_run1_f
    ## │       │   │   ├── symphoGbS2_k6_run2_f
    ## │       │   │   ├── symphoGbS2_k6_run3_f
    ## │       │   │   ├── symphoGbS2_k6_run4_f
    ## │       │   │   ├── symphoGbS2_k6_run5_f
    ## │       │   │   ├── symphoGbS2_k6_run6_f
    ## │       │   │   ├── symphoGbS2_k6_run7_f
    ## │       │   │   ├── symphoGbS2_k6_run8_f
    ## │       │   │   └── symphoGbS2_k6_run9_f
    ## │       │   ├── k7
    ## │       │   │   ├── symphoGbS2_k7_run10_f
    ## │       │   │   ├── symphoGbS2_k7_run1_f
    ## │       │   │   ├── symphoGbS2_k7_run2_f
    ## │       │   │   ├── symphoGbS2_k7_run3_f
    ## │       │   │   ├── symphoGbS2_k7_run4_f
    ## │       │   │   ├── symphoGbS2_k7_run5_f
    ## │       │   │   ├── symphoGbS2_k7_run6_f
    ## │       │   │   ├── symphoGbS2_k7_run7_f
    ## │       │   │   ├── symphoGbS2_k7_run8_f
    ## │       │   │   └── symphoGbS2_k7_run9_f
    ## │       │   ├── k8
    ## │       │   │   ├── symphoGbS2_k8_run10_f
    ## │       │   │   ├── symphoGbS2_k8_run1_f
    ## │       │   │   ├── symphoGbS2_k8_run2_f
    ## │       │   │   ├── symphoGbS2_k8_run3_f
    ## │       │   │   ├── symphoGbS2_k8_run4_f
    ## │       │   │   ├── symphoGbS2_k8_run5_f
    ## │       │   │   ├── symphoGbS2_k8_run6_f
    ## │       │   │   ├── symphoGbS2_k8_run7_f
    ## │       │   │   ├── symphoGbS2_k8_run8_f
    ## │       │   │   └── symphoGbS2_k8_run9_f
    ## │       │   └── k9
    ## │       │       ├── symphoGbS2_k9_run10_f
    ## │       │       ├── symphoGbS2_k9_run1_f
    ## │       │       ├── symphoGbS2_k9_run2_f
    ## │       │       ├── symphoGbS2_k9_run3_f
    ## │       │       ├── symphoGbS2_k9_run4_f
    ## │       │       ├── symphoGbS2_k9_run5_f
    ## │       │       ├── symphoGbS2_k9_run6_f
    ## │       │       ├── symphoGbS2_k9_run7_f
    ## │       │       ├── symphoGbS2_k9_run8_f
    ## │       │       └── symphoGbS2_k9_run9_f
    ## │       ├── runstructure
    ## │       ├── sampleStructureFile.py
    ## │       ├── seed.txt
    ## │       ├── strauto_1.py
    ## │       ├── strauto.tar.gz
    ## │       ├── structureCommands
    ## │       ├── symphoGbS2.str
    ## │       ├── symphoStr.e2650696
    ## │       └── symphoStr.o2650696
    ## ├── growth_Paracou
    ## │   ├── Paracou_code.csv
    ## │   ├── Paracou_data.html
    ## │   ├── Paracou_info.xlsx
    ## │   ├── Paracou_species.csv
    ## │   ├── Paracou.zip
    ## │   ├── R_Paracou_1988-2016.csv
    ## │   ├── R_PostExploit_1987-88.csv
    ## │   ├── R_PreExploit_1984-85-86.csv
    ## │   └── Symphonia.csv
    ## ├── links
    ## │   ├── Lecythidaceae_Barcode.xlsx
    ## │   ├── Symphonia_Barcode.xlsx
    ## │   ├── Symphonia_ind_coords.csv
    ## │   ├── Symphonia_ind_names_complete-1.csv
    ## │   ├── Symphonia_ind_names.csv
    ## │   ├── Symphonia_Paracou.csv
    ## │   └── Symphonia_Paracou.xlsx
    ## ├── Paracou
    ## │   ├── hydrology
    ## │   │   ├── AltitudePlot.dbf
    ## │   │   ├── AltitudePlot.gpx
    ## │   │   ├── AltitudePlot.kml
    ## │   │   ├── AltitudePlot.prj
    ## │   │   ├── AltitudePlot.shp
    ## │   │   ├── AltitudePlot.shx
    ## │   │   ├── AltitudePlot.xml
    ## │   │   ├── ContourLinePlots.cpg
    ## │   │   ├── ContourLinePlots.dbf
    ## │   │   ├── ContourLinePlots.kml
    ## │   │   ├── ContourLinePlots.prj
    ## │   │   ├── ContourLinePlots.shp
    ## │   │   ├── ContourLinePlots.shx
    ## │   │   ├── ContourLinePlots.xml
    ## │   │   ├── Creeks.cpg
    ## │   │   ├── Creeks.dbf
    ## │   │   ├── Creeks.kml
    ## │   │   ├── Creeks.prj
    ## │   │   ├── Creeks.shp
    ## │   │   ├── Creeks.shx
    ## │   │   ├── Creeks.xml
    ## │   │   ├── TopographicLevels.dbf
    ## │   │   ├── TopographicLevels.kml
    ## │   │   ├── TopographicLevels.prj
    ## │   │   ├── TopographicLevels.shp
    ## │   │   ├── TopographicLevels.shx
    ## │   │   ├── TopographicLevelsSwamp.dbf
    ## │   │   ├── TopographicLevelsSwamp.kml
    ## │   │   ├── TopographicLevelsSwamp.prj
    ## │   │   ├── TopographicLevelsSwamp.shp
    ## │   │   ├── TopographicLevelsSwamp.shx
    ## │   │   ├── TopographicLevelsSwamp.xml
    ## │   │   ├── TopographicLevels.xml
    ## │   │   ├── WaterTable.dbf
    ## │   │   ├── WaterTable.prj
    ## │   │   ├── WaterTable.qpj
    ## │   │   ├── WaterTable.sbn
    ## │   │   ├── WaterTable.sbx
    ## │   │   ├── WaterTable.shp
    ## │   │   └── WaterTable.shx
    ## │   ├── limits
    ## │   │   ├── RoadsPaths.dbf
    ## │   │   ├── RoadsPaths.prj
    ## │   │   ├── RoadsPaths.qpj
    ## │   │   ├── RoadsPaths.shp
    ## │   │   └── RoadsPaths.shx
    ## │   ├── logging
    ## │   │   ├── DisturbedAreas.cpg
    ## │   │   ├── DisturbedAreas.dbf
    ## │   │   ├── DisturbedAreas.gpx
    ## │   │   ├── DisturbedAreas.prj
    ## │   │   ├── DisturbedAreas.shp
    ## │   │   ├── DisturbedAreas.shx
    ## │   │   ├── DisturbedAreas.xml
    ## │   │   ├── Gaps.cpg
    ## │   │   ├── Gaps.dbf
    ## │   │   ├── Gaps.prj
    ## │   │   ├── Gaps.shp
    ## │   │   ├── Gaps.shx
    ## │   │   ├── LoggingDirection.dbf
    ## │   │   ├── LoggingDirection.prj
    ## │   │   ├── LoggingDirection.sbn
    ## │   │   ├── LoggingDirection.sbx
    ## │   │   ├── LoggingDirection.shp
    ## │   │   ├── LoggingDirection.shx
    ## │   │   ├── LoggingDirection.xml
    ## │   │   ├── SkidTrails.cpg
    ## │   │   ├── SkidTrails.dbf
    ## │   │   ├── SkidTrails.prj
    ## │   │   ├── SkidTrails.shp
    ## │   │   └── SkidTrails.shx
    ## │   ├── mnt
    ## │   │   ├── Metadonnees_MNT_Paracou.txt
    ## │   │   ├── MNT_ParacouAvril2009_5m.aux
    ## │   │   ├── MNT_ParacouAvril2009_5m.tfw
    ## │   │   ├── MNT_ParacouAvril2009_5m.tif
    ## │   │   ├── MNT_ParacouAvril2009_5m.tif.aux.xml
    ## │   │   ├── MNT_ParacouAvril2009_5m.tif.xml
    ## │   │   ├── relative_elevation.R
    ## │   │   ├── relative_elevation.sh
    ## │   │   └── Thumbs.db
    ## │   └── trees
    ## │       └── Symphonia_Paracou.csv
    ## └── SIG_Paracou
    ##     ├── DisturbedAreas.cpg
    ##     ├── DisturbedAreas.dbf
    ##     ├── DisturbedAreas.gpx
    ##     ├── DisturbedAreas.prj
    ##     ├── DisturbedAreas.shp
    ##     ├── DisturbedAreas.shx
    ##     ├── DisturbedAreas.xml
    ##     ├── Gaps.cpg
    ##     ├── Gaps.dbf
    ##     ├── Gaps.prj
    ##     ├── Gaps.shp
    ##     ├── Gaps.shx
    ##     ├── LoggingDirection.dbf
    ##     ├── LoggingDirection.prj
    ##     ├── LoggingDirection.sbn
    ##     ├── LoggingDirection.sbx
    ##     ├── LoggingDirection.shp
    ##     ├── LoggingDirection.shx
    ##     ├── LoggingDirection.xml
    ##     ├── MNT_5m
    ##     │   ├── Metadonnees_MNT_Paracou.txt
    ##     │   ├── MNT_ParacouAvril2009_5m.aux
    ##     │   ├── MNT_ParacouAvril2009_5m_contour
    ##     │   │   ├── contour.dbf
    ##     │   │   ├── contour.prj
    ##     │   │   ├── contour.shp
    ##     │   │   └── contour.shx
    ##     │   ├── MNT_ParacouAvril2009_5m.tfw
    ##     │   ├── MNT_ParacouAvril2009_5m.tif
    ##     │   ├── MNT_ParacouAvril2009_5m.tif.aux.xml
    ##     │   ├── MNT_ParacouAvril2009_5m.tiff
    ##     │   │   └── PERMANENT
    ##     │   │       ├── cats
    ##     │   │       │   ├── difference_stream_downstream
    ##     │   │       │   ├── direction
    ##     │   │       │   ├── distance_stream_downstream
    ##     │   │       │   ├── ele
    ##     │   │       │   └── streams
    ##     │   │       ├── cell
    ##     │   │       │   ├── difference_stream_downstream
    ##     │   │       │   ├── direction
    ##     │   │       │   ├── distance_stream_downstream
    ##     │   │       │   ├── ele
    ##     │   │       │   └── streams
    ##     │   │       ├── cellhd
    ##     │   │       │   ├── difference_stream_downstream
    ##     │   │       │   ├── direction
    ##     │   │       │   ├── distance_stream_downstream
    ##     │   │       │   ├── ele
    ##     │   │       │   └── streams
    ##     │   │       ├── cell_misc
    ##     │   │       │   ├── difference_stream_downstream
    ##     │   │       │   │   ├── f_format
    ##     │   │       │   │   ├── f_quant
    ##     │   │       │   │   ├── f_range
    ##     │   │       │   │   └── null
    ##     │   │       │   ├── direction
    ##     │   │       │   │   ├── null
    ##     │   │       │   │   └── range
    ##     │   │       │   ├── distance_stream_downstream
    ##     │   │       │   │   ├── f_format
    ##     │   │       │   │   ├── f_quant
    ##     │   │       │   │   ├── f_range
    ##     │   │       │   │   └── null
    ##     │   │       │   ├── ele
    ##     │   │       │   │   ├── f_format
    ##     │   │       │   │   ├── f_quant
    ##     │   │       │   │   ├── f_range
    ##     │   │       │   │   └── null
    ##     │   │       │   └── streams
    ##     │   │       │       ├── null
    ##     │   │       │       └── range
    ##     │   │       ├── colr
    ##     │   │       │   ├── direction
    ##     │   │       │   └── streams
    ##     │   │       ├── DEFAULT_WIND
    ##     │   │       ├── fcell
    ##     │   │       │   ├── difference_stream_downstream
    ##     │   │       │   ├── distance_stream_downstream
    ##     │   │       │   └── ele
    ##     │   │       ├── hist
    ##     │   │       │   ├── difference_stream_downstream
    ##     │   │       │   ├── direction
    ##     │   │       │   ├── distance_stream_downstream
    ##     │   │       │   ├── ele
    ##     │   │       │   └── streams
    ##     │   │       ├── MYNAME
    ##     │   │       ├── sqlite
    ##     │   │       ├── VAR
    ##     │   │       └── WIND
    ##     │   ├── MNT_ParacouAvril2009_5m.tif.xml
    ##     │   ├── relative_elevation.R
    ##     │   ├── relative_elevation.sh
    ##     │   ├── relative_elevation.tfw
    ##     │   ├── relative_elevation.tif
    ##     │   ├── relative_elevation.tif.aux.xml
    ##     │   └── Thumbs.db
    ##     ├── RoadsPaths.dbf
    ##     ├── RoadsPaths.prj
    ##     ├── RoadsPaths.qpj
    ##     ├── RoadsPaths.shp
    ##     ├── RoadsPaths.shx
    ##     ├── SkidTrails.cpg
    ##     ├── SkidTrails.dbf
    ##     ├── SkidTrails.prj
    ##     ├── SkidTrails.shp
    ##     └── SkidTrails.shx
    ## 
    ## 62 directories, 791 files
