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
    ## ├── links
    ## │   ├── Lecythidaceae_Barcode.xlsx
    ## │   ├── Symphonia_Barcode.xlsx
    ## │   ├── Symphonia_CROPS.csv
    ## │   ├── Symphonia_DROUGHT.csv
    ## │   ├── Symphonia_DROUGHT.xlsx
    ## │   ├── Symphonia_ind_coords.csv
    ## │   ├── Symphonia_ind_names_complete-1.csv
    ## │   ├── Symphonia_ind_names.csv
    ## │   ├── Symphonia_Match_btw_Gbs_otherDatasets.csv
    ## │   ├── Symphonia_Match_btw_Gbs_otherDatasets.xlsx
    ## │   ├── Symphonia_Paracou.csv
    ## │   ├── Symphonia_Paracou.xlsx
    ## │   └── Symphonia_SymphoGrowth.csv
    ## ├── Paracou
    ## │   ├── biotic
    ## │   │   ├── Metadonnees_MNC_Paracou.txt
    ## │   │   ├── MNC_ParacouAvril2009_1m.tfw
    ## │   │   ├── MNC_ParacouAvril2009_1m.tif
    ## │   │   ├── MNC_ParacouAvril2009_1m.tif.aux.xml
    ## │   │   ├── MNC_ParacouAvril2009_1m.tif.ovr
    ## │   │   └── Thumbs.db
    ## │   ├── hydrology
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
    ## │   │   ├── CIRADConcession.cpg
    ## │   │   ├── CIRADConcession.dbf
    ## │   │   ├── CIRADConcession.gpx
    ## │   │   ├── CIRADConcession.kml
    ## │   │   ├── CIRADConcession.prj
    ## │   │   ├── CIRADConcession.qpj
    ## │   │   ├── CIRADConcession.shp
    ## │   │   ├── CIRADConcession.shp.xml
    ## │   │   ├── CIRADConcession.shx
    ## │   │   ├── OverallPlots.cpg
    ## │   │   ├── OverallPlots.dbf
    ## │   │   ├── OverallPlots.prj
    ## │   │   ├── OverallPlots.qpj
    ## │   │   ├── OverallPlots.shp
    ## │   │   ├── OverallPlots.shx
    ## │   │   ├── RegenerationPlots.cpg
    ## │   │   ├── RegenerationPlots.dbf
    ## │   │   ├── RegenerationPlots.prj
    ## │   │   ├── RegenerationPlots.shp
    ## │   │   ├── RegenerationPlots.shp.xml
    ## │   │   ├── RegenerationPlots.shx
    ## │   │   ├── RoadsPaths.dbf
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
    ## │   │   ├── doc - inventaire données degats exploit.doc
    ## │   │   ├── Gaps.cpg
    ## │   │   ├── Gaps.dbf
    ## │   │   ├── Gaps.prj
    ## │   │   ├── Gaps.shp
    ## │   │   ├── Gaps.shx
    ## │   │   ├──  LoggingDirection.dbf
    ## │   │   ├── LoggingDirection.dbf
    ## │   │   ├──  LoggingDirection.kml
    ## │   │   ├──  LoggingDirection.prj
    ## │   │   ├── LoggingDirection.sbn
    ## │   │   ├── LoggingDirection.sbx
    ## │   │   ├──  LoggingDirection.shp
    ## │   │   ├── LoggingDirection.shp
    ## │   │   ├──  LoggingDirection.shx
    ## │   │   ├── LoggingDirection.shx
    ## │   │   ├──  LoggingDirection.xml
    ## │   │   ├── LoggingDirection.xml
    ## │   │   ├── RoadsPaths.dbf
    ## │   │   ├── RoadsPaths.shp
    ## │   │   ├── RoadsPaths.shx
    ## │   │   ├── SkidTrails.cpg
    ## │   │   ├── SkidTrails.dbf
    ## │   │   ├── SkidTrails.prj
    ## │   │   ├── SkidTrails.shp
    ## │   │   └── SkidTrails.shx
    ## │   ├── pedology
    ## │   │   ├── CoarseElement.cpg
    ## │   │   ├── CoarseElement.dbf
    ## │   │   ├── CoarseElement.kml
    ## │   │   ├── CoarseElement.shp
    ## │   │   ├── CoarseElement.shx
    ## │   │   ├── CoarseElement.xml
    ## │   │   ├── Drainages.cpg
    ## │   │   ├── Drainages.dbf
    ## │   │   ├── Drainages.kml
    ## │   │   ├── Drainages.shp
    ## │   │   ├── Drainages.shx
    ## │   │   ├── Drainages.xml
    ## │   │   ├── Hydromorphy.cpg
    ## │   │   ├── Hydromorphy.dbf
    ## │   │   ├── Hydromorphy.kml
    ## │   │   ├── Hydromorphy.shp
    ## │   │   ├── Hydromorphy.shx
    ## │   │   ├── SoilSurvey.dbf
    ## │   │   ├── SoilSurvey.shp
    ## │   │   ├── SoilSurvey.shx
    ## │   │   ├── SpecificSoils.cpg
    ## │   │   ├── SpecificSoils.dbf
    ## │   │   ├── SpecificSoils.kml
    ## │   │   ├── SpecificSoils.shp
    ## │   │   ├── SpecificSoils.shx
    ## │   │   ├── SpecificSoils.xml
    ## │   │   ├── Thalwegs.dbf
    ## │   │   ├── Thalwegs.shp
    ## │   │   ├── Thalwegs.shp.xml
    ## │   │   ├── Thalwegs.shx
    ## │   │   ├── Thumbs.db
    ## │   │   ├── Waterlogging.cpg
    ## │   │   ├── Waterlogging.dbf
    ## │   │   ├── Waterlogging.kml
    ## │   │   ├── Waterlogging.shp
    ## │   │   ├── Waterlogging.shx
    ## │   │   └── Waterlogging.xml
    ## │   ├── topography
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
    ## │       ├── Symphonia_Guyafor.csv
    ## │       └── Symphonia_Paracou.csv
    ## └── Symphonia
    ##     ├── Maps
    ##     │   ├── Parcelle10.png
    ##     │   ├── Parcelle11.png
    ##     │   ├── Parcelle12.png
    ##     │   ├── Parcelle13.png
    ##     │   ├── Parcelle14.png
    ##     │   ├── Parcelle15.png
    ##     │   ├── Parcelle16.png
    ##     │   ├── Parcelle1.png
    ##     │   ├── Parcelle2.png
    ##     │   ├── Parcelle3.png
    ##     │   ├── Parcelle4.png
    ##     │   ├── Parcelle5.png
    ##     │   ├── Parcelle6.png
    ##     │   ├── Parcelle7.png
    ##     │   ├── Parcelle8.png
    ##     │   └── Parcelle9.png
    ##     ├── Measures
    ##     │   └── 2017.11.21.ods
    ##     ├── Pictures
    ##     │   ├── 2017.10.30
    ##     │   │   ├── PA300001.JPG
    ##     │   │   ├── PA300001.JPG.xmp
    ##     │   │   ├── PA300002.JPG
    ##     │   │   ├── PA300002.JPG.xmp
    ##     │   │   ├── PA300003.JPG
    ##     │   │   ├── PA300003.JPG.xmp
    ##     │   │   ├── PA300004.JPG
    ##     │   │   ├── PA300004.JPG.xmp
    ##     │   │   ├── PA300005.JPG
    ##     │   │   ├── PA300005.JPG.xmp
    ##     │   │   ├── PA300006.JPG
    ##     │   │   ├── PA300006.JPG.xmp
    ##     │   │   ├── PA300007.JPG
    ##     │   │   ├── PA300007.JPG.xmp
    ##     │   │   ├── PA300008.JPG
    ##     │   │   ├── PA300008.JPG.xmp
    ##     │   │   ├── PA300009.JPG
    ##     │   │   ├── PA300009.JPG.xmp
    ##     │   │   ├── PA300011.JPG
    ##     │   │   ├── PA300011.JPG.xmp
    ##     │   │   ├── PA300012.JPG
    ##     │   │   ├── PA300012.JPG.xmp
    ##     │   │   ├── PA300013.JPG
    ##     │   │   ├── PA300013.JPG.xmp
    ##     │   │   ├── PA300014.JPG
    ##     │   │   ├── PA300014.JPG.xmp
    ##     │   │   ├── PA300015.JPG
    ##     │   │   ├── PA300015.JPG.xmp
    ##     │   │   ├── PA300016.JPG
    ##     │   │   ├── PA300016.JPG.xmp
    ##     │   │   ├── PA300017.JPG
    ##     │   │   ├── PA300017.JPG.xmp
    ##     │   │   ├── PA300018.JPG
    ##     │   │   ├── PA300018.JPG.xmp
    ##     │   │   ├── PA300019.JPG
    ##     │   │   ├── PA300019.JPG.xmp
    ##     │   │   ├── PA300020.JPG
    ##     │   │   ├── PA300020.JPG.xmp
    ##     │   │   ├── PA300021.JPG
    ##     │   │   ├── PA300021.JPG.xmp
    ##     │   │   ├── PA300022.JPG
    ##     │   │   ├── PA300022.JPG.xmp
    ##     │   │   ├── PA300023.JPG
    ##     │   │   ├── PA300023.JPG.xmp
    ##     │   │   ├── PA300024.JPG
    ##     │   │   ├── PA300024.JPG.xmp
    ##     │   │   ├── PA300025.JPG
    ##     │   │   ├── PA300025.JPG.xmp
    ##     │   │   ├── PA300026.JPG
    ##     │   │   ├── PA300026.JPG.xmp
    ##     │   │   ├── PA300027.JPG
    ##     │   │   ├── PA300027.JPG.xmp
    ##     │   │   ├── PA300028.JPG
    ##     │   │   ├── PA300028.JPG.xmp
    ##     │   │   ├── PA300029.JPG
    ##     │   │   ├── PA300029.JPG.xmp
    ##     │   │   ├── PA300030.JPG
    ##     │   │   ├── PA300030.JPG.xmp
    ##     │   │   ├── PA300031.JPG
    ##     │   │   ├── PA300031.JPG.xmp
    ##     │   │   ├── PA300032.JPG
    ##     │   │   ├── PA300032.JPG.xmp
    ##     │   │   ├── PA300033.JPG
    ##     │   │   ├── PA300033.JPG.xmp
    ##     │   │   ├── PA300034.JPG
    ##     │   │   ├── PA300034.JPG.xmp
    ##     │   │   ├── PA300035.JPG
    ##     │   │   ├── PA300035.JPG.xmp
    ##     │   │   ├── PA300036.JPG
    ##     │   │   ├── PA300036.JPG.xmp
    ##     │   │   ├── PA300037.JPG
    ##     │   │   ├── PA300037.JPG.xmp
    ##     │   │   ├── PA300038.JPG
    ##     │   │   ├── PA300038.JPG.xmp
    ##     │   │   ├── PA300039.JPG
    ##     │   │   ├── PA300039.JPG.xmp
    ##     │   │   ├── PA300040.JPG
    ##     │   │   ├── PA300040.JPG.xmp
    ##     │   │   ├── PA300041.JPG
    ##     │   │   ├── PA300041.JPG.xmp
    ##     │   │   ├── PA300042.JPG
    ##     │   │   ├── PA300042.JPG.xmp
    ##     │   │   ├── PA300043.JPG
    ##     │   │   ├── PA300043.JPG.xmp
    ##     │   │   ├── PA300044.JPG
    ##     │   │   ├── PA300044.JPG.xmp
    ##     │   │   ├── PA300045.JPG
    ##     │   │   ├── PA300045.JPG.xmp
    ##     │   │   ├── PA300046.JPG
    ##     │   │   ├── PA300046.JPG.xmp
    ##     │   │   ├── PA300047.JPG
    ##     │   │   ├── PA300047.JPG.xmp
    ##     │   │   ├── PA300048.JPG
    ##     │   │   ├── PA300048.JPG.xmp
    ##     │   │   ├── PA300049.JPG
    ##     │   │   ├── PA300049.JPG.xmp
    ##     │   │   ├── PA300050.JPG
    ##     │   │   ├── PA300050.JPG.xmp
    ##     │   │   ├── PA300051.JPG
    ##     │   │   ├── PA300051.JPG.xmp
    ##     │   │   ├── PA300052.JPG
    ##     │   │   ├── PA300052.JPG.xmp
    ##     │   │   ├── PA300053.JPG
    ##     │   │   ├── PA300053.JPG.xmp
    ##     │   │   ├── PA300054.JPG
    ##     │   │   ├── PA300054.JPG.xmp
    ##     │   │   ├── PA300055.JPG
    ##     │   │   ├── PA300055.JPG.xmp
    ##     │   │   ├── PA300056.JPG
    ##     │   │   ├── PA300056.JPG.xmp
    ##     │   │   ├── PA300057.JPG
    ##     │   │   ├── PA300057.JPG.xmp
    ##     │   │   ├── PA300058.JPG
    ##     │   │   ├── PA300058.JPG.xmp
    ##     │   │   ├── PA300059.JPG
    ##     │   │   ├── PA300059.JPG.xmp
    ##     │   │   ├── PA300060.JPG
    ##     │   │   ├── PA300060.JPG.xmp
    ##     │   │   ├── PA300061.JPG
    ##     │   │   ├── PA300061.JPG.xmp
    ##     │   │   ├── PA300062.JPG
    ##     │   │   ├── PA300062.JPG.xmp
    ##     │   │   ├── PA300063.JPG
    ##     │   │   ├── PA300063.JPG.xmp
    ##     │   │   ├── PA300064.JPG
    ##     │   │   ├── PA300064.JPG.xmp
    ##     │   │   ├── PA300065.JPG
    ##     │   │   ├── PA300065.JPG.xmp
    ##     │   │   ├── PA300066.JPG
    ##     │   │   └── PA300066.JPG.xmp
    ##     │   ├── 2017.10.31
    ##     │   │   ├── PA310067.JPG
    ##     │   │   ├── PA310068.JPG
    ##     │   │   ├── PA310069.JPG
    ##     │   │   ├── PA310070.JPG
    ##     │   │   ├── PA310071.JPG
    ##     │   │   ├── PA310072.JPG
    ##     │   │   ├── PA310073.JPG
    ##     │   │   ├── PA310074.JPG
    ##     │   │   ├── PA310075.JPG
    ##     │   │   ├── PA310076.JPG
    ##     │   │   ├── PA310077.JPG
    ##     │   │   ├── PA310078.JPG
    ##     │   │   ├── PA310079.JPG
    ##     │   │   ├── PA310080.JPG
    ##     │   │   ├── PA310081.JPG
    ##     │   │   ├── PA310082.JPG
    ##     │   │   ├── PA310083.JPG
    ##     │   │   ├── PA310084.JPG
    ##     │   │   ├── PA310085.JPG
    ##     │   │   ├── PA310086.JPG
    ##     │   │   ├── PA310087.JPG
    ##     │   │   ├── PA310088.JPG
    ##     │   │   ├── PA310089.JPG
    ##     │   │   ├── PA310090.JPG
    ##     │   │   ├── PA310091.JPG
    ##     │   │   ├── PA310092.JPG
    ##     │   │   ├── PA310093.JPG
    ##     │   │   ├── PA310094.JPG
    ##     │   │   ├── PA310095.JPG
    ##     │   │   ├── PA310096.JPG
    ##     │   │   ├── PA310097.JPG
    ##     │   │   ├── PA310098.JPG
    ##     │   │   ├── PA310099.JPG
    ##     │   │   ├── PA310100.JPG
    ##     │   │   ├── PA310101.JPG
    ##     │   │   ├── PA310102.JPG
    ##     │   │   ├── PA310103.JPG
    ##     │   │   ├── PA310104.JPG
    ##     │   │   ├── PA310105.JPG
    ##     │   │   ├── PA310106.JPG
    ##     │   │   ├── PA310107.JPG
    ##     │   │   ├── PA310108.JPG
    ##     │   │   ├── PA310109.JPG
    ##     │   │   ├── PA310110.JPG
    ##     │   │   ├── PA310111.JPG
    ##     │   │   ├── PA310112.JPG
    ##     │   │   ├── PA310113.JPG
    ##     │   │   ├── PA310114.JPG
    ##     │   │   ├── PA310115.JPG
    ##     │   │   ├── PA310116.JPG
    ##     │   │   ├── PA310117.JPG
    ##     │   │   ├── PA310118.JPG
    ##     │   │   ├── PA310119.JPG
    ##     │   │   ├── PA310120.JPG
    ##     │   │   ├── PA310121.JPG
    ##     │   │   ├── PA310122.JPG
    ##     │   │   ├── PA310123.JPG
    ##     │   │   ├── PA310124.JPG
    ##     │   │   ├── PA310125.JPG
    ##     │   │   ├── PA310126.JPG
    ##     │   │   ├── PA310127.JPG
    ##     │   │   ├── PA310128.JPG
    ##     │   │   ├── PA310129.JPG
    ##     │   │   ├── PA310130.JPG
    ##     │   │   ├── PA310131.JPG
    ##     │   │   ├── PA310132.JPG
    ##     │   │   ├── PA310133.JPG
    ##     │   │   ├── PA310134.JPG
    ##     │   │   ├── PA310135.JPG
    ##     │   │   └── PA310136.JPG
    ##     │   ├── 2017.11.06
    ##     │   │   ├── PB060137.JPG
    ##     │   │   ├── PB060138.JPG
    ##     │   │   ├── PB060139.JPG
    ##     │   │   ├── PB060140.JPG
    ##     │   │   ├── PB060141.JPG
    ##     │   │   ├── PB060142.JPG
    ##     │   │   ├── PB060143.JPG
    ##     │   │   ├── PB060144.JPG
    ##     │   │   ├── PB060145.JPG
    ##     │   │   ├── PB060146.JPG
    ##     │   │   ├── PB060147.JPG
    ##     │   │   ├── PB060148.JPG
    ##     │   │   ├── PB060149.JPG
    ##     │   │   ├── PB060150.JPG
    ##     │   │   ├── PB060151.JPG
    ##     │   │   ├── PB060152.JPG
    ##     │   │   ├── PB060153.JPG
    ##     │   │   ├── PB060154.JPG
    ##     │   │   ├── PB060155.JPG
    ##     │   │   ├── PB060156.JPG
    ##     │   │   ├── PB060157.JPG
    ##     │   │   ├── PB060158.JPG
    ##     │   │   ├── PB060159.JPG
    ##     │   │   ├── PB060160.JPG
    ##     │   │   ├── PB060161.JPG
    ##     │   │   ├── PB060162.JPG
    ##     │   │   ├── PB060163.JPG
    ##     │   │   ├── PB060164.JPG
    ##     │   │   ├── PB060165.JPG
    ##     │   │   ├── PB060166.JPG
    ##     │   │   ├── PB060167.JPG
    ##     │   │   ├── PB060168.JPG
    ##     │   │   ├── PB060169.JPG
    ##     │   │   ├── PB060170.JPG
    ##     │   │   ├── PB060171.JPG
    ##     │   │   ├── PB060172.JPG
    ##     │   │   ├── PB060173.JPG
    ##     │   │   ├── PB060174.JPG
    ##     │   │   ├── PB060175.JPG
    ##     │   │   ├── PB060176.JPG
    ##     │   │   ├── PB060177.JPG
    ##     │   │   ├── PB060178.JPG
    ##     │   │   ├── PB060179.JPG
    ##     │   │   ├── PB060180.JPG
    ##     │   │   ├── PB060181.JPG
    ##     │   │   ├── PB060182.JPG
    ##     │   │   ├── PB060183.JPG
    ##     │   │   ├── PB060184.JPG
    ##     │   │   ├── PB060185.JPG
    ##     │   │   ├── PB060186.JPG
    ##     │   │   ├── PB060187.JPG
    ##     │   │   ├── PB060188.JPG
    ##     │   │   ├── PB060189.JPG
    ##     │   │   ├── PB060190.JPG
    ##     │   │   ├── PB060191.JPG
    ##     │   │   ├── PB060192.JPG
    ##     │   │   ├── PB060193.JPG
    ##     │   │   ├── PB060194.JPG
    ##     │   │   ├── PB060195.JPG
    ##     │   │   ├── PB060196.JPG
    ##     │   │   ├── PB060197.JPG
    ##     │   │   ├── PB060198.JPG
    ##     │   │   ├── PB060199.JPG
    ##     │   │   ├── PB060200.JPG
    ##     │   │   ├── PB060201.JPG
    ##     │   │   ├── PB060202.JPG
    ##     │   │   ├── PB060203.JPG
    ##     │   │   ├── PB060204.JPG
    ##     │   │   ├── PB060205.JPG
    ##     │   │   ├── PB060206.JPG
    ##     │   │   ├── PB060207.JPG
    ##     │   │   ├── PB060208.JPG
    ##     │   │   └── PB060209.JPG
    ##     │   ├── 2017.11.07
    ##     │   │   ├── PB070001.JPG
    ##     │   │   ├── PB070002.JPG
    ##     │   │   ├── PB070003.JPG
    ##     │   │   ├── PB070004.JPG
    ##     │   │   ├── PB070005.JPG
    ##     │   │   ├── PB070006.JPG
    ##     │   │   ├── PB070007.JPG
    ##     │   │   ├── PB070008.JPG
    ##     │   │   ├── PB070009.JPG
    ##     │   │   ├── PB070010.JPG
    ##     │   │   ├── PB070011.JPG
    ##     │   │   ├── PB070012.JPG
    ##     │   │   ├── PB070013.JPG
    ##     │   │   ├── PB070014.JPG
    ##     │   │   ├── PB070015.JPG
    ##     │   │   ├── PB070016.JPG
    ##     │   │   ├── PB070017.JPG
    ##     │   │   ├── PB070018.JPG
    ##     │   │   ├── PB070019.JPG
    ##     │   │   ├── PB070020.JPG
    ##     │   │   ├── PB070021.JPG
    ##     │   │   ├── PB070022.JPG
    ##     │   │   ├── PB070023.JPG
    ##     │   │   ├── PB070024.JPG
    ##     │   │   ├── PB070025.JPG
    ##     │   │   ├── PB070026.JPG
    ##     │   │   ├── PB070027.JPG
    ##     │   │   ├── PB070028.JPG
    ##     │   │   ├── PB070029.JPG
    ##     │   │   ├── PB070030.JPG
    ##     │   │   ├── PB070031.JPG
    ##     │   │   ├── PB070032.JPG
    ##     │   │   ├── PB070033.JPG
    ##     │   │   ├── PB070034.JPG
    ##     │   │   ├── PB070035.JPG
    ##     │   │   ├── PB070036.JPG
    ##     │   │   ├── PB070037.JPG
    ##     │   │   ├── PB070038.JPG
    ##     │   │   ├── PB070039.JPG
    ##     │   │   ├── PB070040.JPG
    ##     │   │   ├── PB070041.JPG
    ##     │   │   ├── PB070042.JPG
    ##     │   │   ├── PB070043.JPG
    ##     │   │   ├── PB070044.JPG
    ##     │   │   ├── PB070045.JPG
    ##     │   │   ├── PB070046.JPG
    ##     │   │   ├── PB070047.JPG
    ##     │   │   ├── PB070048.JPG
    ##     │   │   ├── PB070049.JPG
    ##     │   │   ├── PB070050.JPG
    ##     │   │   ├── PB070051.JPG
    ##     │   │   ├── PB070052.JPG
    ##     │   │   ├── PB070053.JPG
    ##     │   │   ├── PB070054.JPG
    ##     │   │   ├── PB070055.JPG
    ##     │   │   ├── PB070056.JPG
    ##     │   │   ├── PB070057.JPG
    ##     │   │   ├── PB070058.JPG
    ##     │   │   ├── PB070059.JPG
    ##     │   │   ├── PB070060.JPG
    ##     │   │   ├── PB070061.JPG
    ##     │   │   ├── PB070062.JPG
    ##     │   │   ├── PB070063.JPG
    ##     │   │   ├── PB070064.JPG
    ##     │   │   ├── PB070065.JPG
    ##     │   │   ├── PB070066.JPG
    ##     │   │   ├── PB070067.JPG
    ##     │   │   ├── PB070068.JPG
    ##     │   │   ├── PB070069.JPG
    ##     │   │   ├── PB070070.JPG
    ##     │   │   └── PB070071.JPG
    ##     │   ├── 2017.11.08
    ##     │   │   ├── PB080073.JPG
    ##     │   │   ├── PB080074.JPG
    ##     │   │   ├── PB080075.JPG
    ##     │   │   ├── PB080076.JPG
    ##     │   │   ├── PB080077.JPG
    ##     │   │   ├── PB080078.JPG
    ##     │   │   ├── PB080079.JPG
    ##     │   │   ├── PB080080.JPG
    ##     │   │   ├── PB080081.JPG
    ##     │   │   ├── PB080082.JPG
    ##     │   │   ├── PB080083.JPG
    ##     │   │   ├── PB080084.JPG
    ##     │   │   ├── PB080085.JPG
    ##     │   │   ├── PB080086.JPG
    ##     │   │   ├── PB080087.JPG
    ##     │   │   ├── PB080088.JPG
    ##     │   │   ├── PB080089.JPG
    ##     │   │   ├── PB080090.JPG
    ##     │   │   ├── PB080091.JPG
    ##     │   │   ├── PB080092.JPG
    ##     │   │   ├── PB080093.JPG
    ##     │   │   ├── PB080094.JPG
    ##     │   │   ├── PB080095.JPG
    ##     │   │   ├── PB080096.JPG
    ##     │   │   ├── PB080097.JPG
    ##     │   │   ├── PB080098.JPG
    ##     │   │   ├── PB080099.JPG
    ##     │   │   ├── PB080100.JPG
    ##     │   │   ├── PB080101.JPG
    ##     │   │   ├── PB080102.JPG
    ##     │   │   ├── PB080103.JPG
    ##     │   │   ├── PB080104.JPG
    ##     │   │   ├── PB080105.JPG
    ##     │   │   ├── PB080106.JPG
    ##     │   │   ├── PB080107.JPG
    ##     │   │   ├── PB080108.JPG
    ##     │   │   ├── PB080109.JPG
    ##     │   │   ├── PB080110.JPG
    ##     │   │   ├── PB080111.JPG
    ##     │   │   ├── PB080112.JPG
    ##     │   │   ├── PB080113.JPG
    ##     │   │   ├── PB080114.JPG
    ##     │   │   ├── PB080115.JPG
    ##     │   │   ├── PB080116.JPG
    ##     │   │   ├── PB080117.JPG
    ##     │   │   ├── PB080118.JPG
    ##     │   │   ├── PB080119.JPG
    ##     │   │   ├── PB080120.JPG
    ##     │   │   ├── PB080121.JPG
    ##     │   │   ├── PB080122.JPG
    ##     │   │   ├── PB080123.JPG
    ##     │   │   ├── PB080124.JPG
    ##     │   │   ├── PB080125.JPG
    ##     │   │   ├── PB080126.JPG
    ##     │   │   ├── PB080127.JPG
    ##     │   │   ├── PB080128.JPG
    ##     │   │   ├── PB080129.JPG
    ##     │   │   ├── PB080130.JPG
    ##     │   │   ├── PB080131.JPG
    ##     │   │   ├── PB080132.JPG
    ##     │   │   ├── PB080133.JPG
    ##     │   │   ├── PB080134.JPG
    ##     │   │   ├── PB080135.JPG
    ##     │   │   ├── PB080136.JPG
    ##     │   │   ├── PB080137.JPG
    ##     │   │   ├── PB080138.JPG
    ##     │   │   ├── PB080139.JPG
    ##     │   │   ├── PB080140.JPG
    ##     │   │   ├── PB080141.JPG
    ##     │   │   ├── PB080142.JPG
    ##     │   │   ├── PB080143.JPG
    ##     │   │   ├── PB080144.JPG
    ##     │   │   ├── PB080145.JPG
    ##     │   │   ├── PB080146.JPG
    ##     │   │   ├── PB080147.JPG
    ##     │   │   ├── PB080148.JPG
    ##     │   │   ├── PB080149.JPG
    ##     │   │   ├── PB080150.JPG
    ##     │   │   ├── PB080151.JPG
    ##     │   │   └── PB080152.JPG
    ##     │   ├── 2017.11.09
    ##     │   │   ├── PB090001.JPG
    ##     │   │   ├── PB090002.JPG
    ##     │   │   ├── PB090003.JPG
    ##     │   │   ├── PB090004.JPG
    ##     │   │   ├── PB090005.JPG
    ##     │   │   ├── PB090006.JPG
    ##     │   │   ├── PB090007.JPG
    ##     │   │   ├── PB090008.JPG
    ##     │   │   ├── PB090009.JPG
    ##     │   │   ├── PB090010.JPG
    ##     │   │   ├── PB090011.JPG
    ##     │   │   ├── PB090012.JPG
    ##     │   │   ├── PB090013.JPG
    ##     │   │   ├── PB090014.JPG
    ##     │   │   ├── PB090015.JPG
    ##     │   │   ├── PB090016.JPG
    ##     │   │   ├── PB090017.JPG
    ##     │   │   ├── PB090018.JPG
    ##     │   │   ├── PB090019.JPG
    ##     │   │   ├── PB090020.JPG
    ##     │   │   ├── PB090021.JPG
    ##     │   │   ├── PB090022.JPG
    ##     │   │   ├── PB090023.JPG
    ##     │   │   ├── PB090024.JPG
    ##     │   │   ├── PB090025.JPG
    ##     │   │   ├── PB090026.JPG
    ##     │   │   ├── PB090027.JPG
    ##     │   │   ├── PB090028.JPG
    ##     │   │   ├── PB090029.JPG
    ##     │   │   ├── PB090030.JPG
    ##     │   │   ├── PB090031.JPG
    ##     │   │   ├── PB090032.JPG
    ##     │   │   ├── PB090033.JPG
    ##     │   │   ├── PB090034.JPG
    ##     │   │   ├── PB090035.JPG
    ##     │   │   ├── PB090036.JPG
    ##     │   │   ├── PB090037.JPG
    ##     │   │   ├── PB090038.JPG
    ##     │   │   ├── PB090039.JPG
    ##     │   │   ├── PB090040.JPG
    ##     │   │   ├── PB090041.JPG
    ##     │   │   ├── PB090042.JPG
    ##     │   │   ├── PB090043.JPG
    ##     │   │   ├── PB090044.JPG
    ##     │   │   ├── PB090045.JPG
    ##     │   │   ├── PB090046.JPG
    ##     │   │   ├── PB090047.JPG
    ##     │   │   ├── PB090048.JPG
    ##     │   │   ├── PB090049.JPG
    ##     │   │   ├── PB090050.JPG
    ##     │   │   ├── PB090051.JPG
    ##     │   │   ├── PB090052.JPG
    ##     │   │   ├── PB090053.JPG
    ##     │   │   ├── PB090054.JPG
    ##     │   │   ├── PB090055.JPG
    ##     │   │   ├── PB090056.JPG
    ##     │   │   ├── PB090057.JPG
    ##     │   │   ├── PB090058.JPG
    ##     │   │   ├── PB090059.JPG
    ##     │   │   ├── PB090060.JPG
    ##     │   │   ├── PB090061.JPG
    ##     │   │   ├── PB090062.JPG
    ##     │   │   ├── PB090063.JPG
    ##     │   │   ├── PB090064.JPG
    ##     │   │   ├── PB090065.JPG
    ##     │   │   ├── PB090066.JPG
    ##     │   │   ├── PB090067.JPG
    ##     │   │   ├── PB090068.JPG
    ##     │   │   ├── PB090069.JPG
    ##     │   │   ├── PB090070.JPG
    ##     │   │   ├── PB090071.JPG
    ##     │   │   ├── PB090072.JPG
    ##     │   │   ├── PB090073.JPG
    ##     │   │   ├── PB090074.JPG
    ##     │   │   ├── PB090075.JPG
    ##     │   │   ├── PB090076.JPG
    ##     │   │   ├── PB090077.JPG
    ##     │   │   └── PB090078.JPG
    ##     │   ├── 2017.11.14
    ##     │   │   ├── PB140001.JPG
    ##     │   │   ├── PB140002.JPG
    ##     │   │   ├── PB140003.JPG
    ##     │   │   ├── PB140004.JPG
    ##     │   │   ├── PB140005.JPG
    ##     │   │   ├── PB140006.JPG
    ##     │   │   ├── PB140007.JPG
    ##     │   │   ├── PB140008.JPG
    ##     │   │   ├── PB140009.JPG
    ##     │   │   ├── PB140010.JPG
    ##     │   │   ├── PB140011.JPG
    ##     │   │   ├── PB140012.JPG
    ##     │   │   ├── PB140013.JPG
    ##     │   │   ├── PB140014.JPG
    ##     │   │   ├── PB140015.JPG
    ##     │   │   ├── PB140016.JPG
    ##     │   │   ├── PB140017.JPG
    ##     │   │   ├── PB140018.JPG
    ##     │   │   ├── PB140019.JPG
    ##     │   │   ├── PB140020.JPG
    ##     │   │   ├── PB140021.JPG
    ##     │   │   ├── PB140022.JPG
    ##     │   │   ├── PB140023.JPG
    ##     │   │   ├── PB140024.JPG
    ##     │   │   ├── PB140025.JPG
    ##     │   │   ├── PB140026.JPG
    ##     │   │   ├── PB140027.JPG
    ##     │   │   ├── PB140028.JPG
    ##     │   │   ├── PB140029.JPG
    ##     │   │   ├── PB140030.JPG
    ##     │   │   ├── PB140031.JPG
    ##     │   │   └── PB140032.JPG
    ##     │   ├── 2017.11.15
    ##     │   │   ├── PB150001.JPG
    ##     │   │   ├── PB150002.JPG
    ##     │   │   ├── PB150003.JPG
    ##     │   │   ├── PB150004.JPG
    ##     │   │   ├── PB150005.JPG
    ##     │   │   ├── PB150006.JPG
    ##     │   │   ├── PB150007.JPG
    ##     │   │   ├── PB150008.JPG
    ##     │   │   ├── PB150009.JPG
    ##     │   │   ├── PB150010.JPG
    ##     │   │   ├── PB150011.JPG
    ##     │   │   ├── PB150012.JPG
    ##     │   │   ├── PB150013.JPG
    ##     │   │   ├── PB150014.JPG
    ##     │   │   ├── PB150015.JPG
    ##     │   │   ├── PB150016.JPG
    ##     │   │   ├── PB150017.JPG
    ##     │   │   ├── PB150018.JPG
    ##     │   │   ├── PB150019.JPG
    ##     │   │   ├── PB150020.JPG
    ##     │   │   ├── PB150021.JPG
    ##     │   │   ├── PB150022.JPG
    ##     │   │   ├── PB150023.JPG
    ##     │   │   ├── PB150024.JPG
    ##     │   │   ├── PB150025.JPG
    ##     │   │   ├── PB150026.JPG
    ##     │   │   ├── PB150027.JPG
    ##     │   │   ├── PB150028.JPG
    ##     │   │   ├── PB150029.JPG
    ##     │   │   ├── PB150030.JPG
    ##     │   │   ├── PB150031.JPG
    ##     │   │   ├── PB150032.JPG
    ##     │   │   ├── PB150033.JPG
    ##     │   │   ├── PB150034.JPG
    ##     │   │   ├── PB150035.JPG
    ##     │   │   ├── PB150036.JPG
    ##     │   │   ├── PB150037.JPG
    ##     │   │   ├── PB150038.JPG
    ##     │   │   ├── PB150039.JPG
    ##     │   │   ├── PB150040.JPG
    ##     │   │   ├── PB150041.JPG
    ##     │   │   ├── PB150042.JPG
    ##     │   │   ├── PB150043.JPG
    ##     │   │   ├── PB150044.JPG
    ##     │   │   ├── PB150045.JPG
    ##     │   │   ├── PB150046.JPG
    ##     │   │   ├── PB150047.JPG
    ##     │   │   ├── PB150048.JPG
    ##     │   │   ├── PB150049.JPG
    ##     │   │   ├── PB150050.JPG
    ##     │   │   ├── PB150051.JPG
    ##     │   │   ├── PB150052.JPG
    ##     │   │   ├── PB150053.JPG
    ##     │   │   └── PB150054.JPG
    ##     │   ├── 2017.11.16
    ##     │   │   ├── PB160001.JPG
    ##     │   │   ├── PB160002.JPG
    ##     │   │   ├── PB160003.JPG
    ##     │   │   ├── PB160004.JPG
    ##     │   │   ├── PB160005.JPG
    ##     │   │   ├── PB160006.JPG
    ##     │   │   ├── PB160007.JPG
    ##     │   │   ├── PB160008.JPG
    ##     │   │   ├── PB160009.JPG
    ##     │   │   ├── PB160010.JPG
    ##     │   │   ├── PB160011.JPG
    ##     │   │   ├── PB160012.JPG
    ##     │   │   ├── PB160013.JPG
    ##     │   │   ├── PB160014.JPG
    ##     │   │   ├── PB160015.JPG
    ##     │   │   ├── PB160016.JPG
    ##     │   │   ├── PB160017.JPG
    ##     │   │   ├── PB160018.JPG
    ##     │   │   ├── PB160019.JPG
    ##     │   │   ├── PB160020.JPG
    ##     │   │   ├── PB160021.JPG
    ##     │   │   ├── PB160022.JPG
    ##     │   │   ├── PB160023.JPG
    ##     │   │   ├── PB160024.JPG
    ##     │   │   ├── PB160025.JPG
    ##     │   │   ├── PB160026.JPG
    ##     │   │   ├── PB160027.JPG
    ##     │   │   ├── PB160028.JPG
    ##     │   │   ├── PB160029.JPG
    ##     │   │   ├── PB160030.JPG
    ##     │   │   ├── PB160031.JPG
    ##     │   │   ├── PB160032.JPG
    ##     │   │   ├── PB160033.JPG
    ##     │   │   ├── PB160034.JPG
    ##     │   │   ├── PB160035.JPG
    ##     │   │   ├── PB160036.JPG
    ##     │   │   ├── PB160037.JPG
    ##     │   │   ├── PB160038.JPG
    ##     │   │   ├── PB160039.JPG
    ##     │   │   ├── PB160040.JPG
    ##     │   │   ├── PB160041.JPG
    ##     │   │   ├── PB160042.JPG
    ##     │   │   ├── PB160043.JPG
    ##     │   │   ├── PB160044.JPG
    ##     │   │   ├── PB160045.JPG
    ##     │   │   ├── PB160046.JPG
    ##     │   │   ├── PB160047.JPG
    ##     │   │   ├── PB160048.JPG
    ##     │   │   ├── PB160049.JPG
    ##     │   │   ├── PB160050.JPG
    ##     │   │   ├── PB160051.JPG
    ##     │   │   ├── PB160052.JPG
    ##     │   │   ├── PB160053.JPG
    ##     │   │   └── PB160054.JPG
    ##     │   ├── 2017.11.20
    ##     │   │   ├── PB200001.JPG
    ##     │   │   ├── PB200002.JPG
    ##     │   │   ├── PB200003.JPG
    ##     │   │   ├── PB200004.JPG
    ##     │   │   ├── PB200005.JPG
    ##     │   │   ├── PB200006.JPG
    ##     │   │   ├── PB200007.JPG
    ##     │   │   ├── PB200008.JPG
    ##     │   │   ├── PB200009.JPG
    ##     │   │   ├── PB200010.JPG
    ##     │   │   ├── PB200011.JPG
    ##     │   │   ├── PB200012.JPG
    ##     │   │   ├── PB200013.JPG
    ##     │   │   ├── PB200014.JPG
    ##     │   │   ├── PB200015.JPG
    ##     │   │   ├── PB200016.JPG
    ##     │   │   ├── PB200017.JPG
    ##     │   │   ├── PB200018.JPG
    ##     │   │   ├── PB200019.JPG
    ##     │   │   ├── PB200020.JPG
    ##     │   │   ├── PB200021.JPG
    ##     │   │   ├── PB200022.JPG
    ##     │   │   ├── PB200023.JPG
    ##     │   │   ├── PB200024.JPG
    ##     │   │   ├── PB200025.JPG
    ##     │   │   ├── PB200026.JPG
    ##     │   │   ├── PB200027.JPG
    ##     │   │   ├── PB200028.JPG
    ##     │   │   ├── PB200029.JPG
    ##     │   │   ├── PB200030.JPG
    ##     │   │   ├── PB200031.JPG
    ##     │   │   ├── PB200032.JPG
    ##     │   │   ├── PB200033.JPG
    ##     │   │   ├── PB200034.JPG
    ##     │   │   ├── PB200035.JPG
    ##     │   │   ├── PB200036.JPG
    ##     │   │   ├── PB200037.JPG
    ##     │   │   ├── PB200038.JPG
    ##     │   │   ├── PB200039.JPG
    ##     │   │   ├── PB200040.JPG
    ##     │   │   ├── PB200041.JPG
    ##     │   │   ├── PB200042.JPG
    ##     │   │   ├── PB200043.JPG
    ##     │   │   ├── PB200044.JPG
    ##     │   │   ├── PB200045.JPG
    ##     │   │   ├── PB200046.JPG
    ##     │   │   ├── PB200047.JPG
    ##     │   │   ├── PB200048.JPG
    ##     │   │   ├── PB200049.JPG
    ##     │   │   ├── PB200050.JPG
    ##     │   │   ├── PB200051.JPG
    ##     │   │   ├── PB200052.JPG
    ##     │   │   └── PB200053.JPG
    ##     │   └── 2017.11.21
    ##     │       ├── PB210001.JPG
    ##     │       ├── PB210002.JPG
    ##     │       ├── PB210003.JPG
    ##     │       ├── PB210004.JPG
    ##     │       ├── PB210005.JPG
    ##     │       ├── PB210006.JPG
    ##     │       ├── PB210007.JPG
    ##     │       ├── PB210008.JPG
    ##     │       ├── PB210009.JPG
    ##     │       ├── PB210010.JPG
    ##     │       ├── PB210011.JPG
    ##     │       ├── PB210012.JPG
    ##     │       ├── PB210013.JPG
    ##     │       ├── PB210014.JPG
    ##     │       ├── PB210015.JPG
    ##     │       ├── PB210016.JPG
    ##     │       ├── PB210017.JPG
    ##     │       ├── PB210018.JPG
    ##     │       ├── PB210019.JPG
    ##     │       ├── PB210020.JPG
    ##     │       ├── PB210021.JPG
    ##     │       ├── PB210022.JPG
    ##     │       ├── PB210023.JPG
    ##     │       ├── PB210024.JPG
    ##     │       ├── PB210025.JPG
    ##     │       ├── PB210026.JPG
    ##     │       ├── PB210027.JPG
    ##     │       ├── PB210028.JPG
    ##     │       ├── PB210029.JPG
    ##     │       ├── PB210030.JPG
    ##     │       ├── PB210031.JPG
    ##     │       ├── PB210032.JPG
    ##     │       ├── PB210033.JPG
    ##     │       ├── PB210034.JPG
    ##     │       ├── PB210035.JPG
    ##     │       ├── PB210036.JPG
    ##     │       ├── PB210037.JPG
    ##     │       ├── PB210038.JPG
    ##     │       ├── PB210039.JPG
    ##     │       ├── PB210040.JPG
    ##     │       ├── PB210041.JPG
    ##     │       ├── PB210042.JPG
    ##     │       ├── PB210043.JPG
    ##     │       ├── PB210044.JPG
    ##     │       ├── PB210045.JPG
    ##     │       ├── PB210046.JPG
    ##     │       ├── PB210047.JPG
    ##     │       ├── PB210048.JPG
    ##     │       └── PB210049.JPG
    ##     └── Scans
    ##         ├── 2017.10.30
    ##         │   ├── P15-1-198.pdf
    ##         │   ├── P15-1-560.pdf
    ##         │   ├── P15-1-637.pdf
    ##         │   ├── P15-2-113.pdf
    ##         │   ├── P15-2-2846.pdf
    ##         │   ├── P15-2-2997.pdf
    ##         │   ├── P15-2-530.pdf
    ##         │   ├── P15-2-73.pdf
    ##         │   ├── P15-3-1125.pdf
    ##         │   ├── P15-3-247.pdf
    ##         │   ├── P15-3-267.pdf
    ##         │   ├── P15-3-2830.pdf
    ##         │   ├── P15-3-575.pdf
    ##         │   └── P15-3-966.pdf
    ##         ├── 2017.10.31
    ##         │   ├── P15-2-1093.pdf
    ##         │   ├── P15-2-457.pdf
    ##         │   ├── P15-2-932.pdf
    ##         │   ├── P15-2-974.pdf
    ##         │   ├── P15-4-1098.pdf
    ##         │   ├── P15-4-1118.pdf
    ##         │   ├── P15-4-13.pdf
    ##         │   ├── P15-4-147.pdf
    ##         │   ├── P15-4-1.pdf
    ##         │   ├── P15-4-235.pdf
    ##         │   ├── P15-4-286.pdf
    ##         │   ├── P15-4-40.pdf
    ##         │   ├── P15-4-664.pdf
    ##         │   └── P15-4-938.pdf
    ##         ├── 2017.11.06
    ##         │   ├── P14-1-14.pdf
    ##         │   ├── P14-1-25.pdf
    ##         │   ├── P14-1-495.pdf
    ##         │   ├── P14-1-7.pdf
    ##         │   ├── P14-1-87.pdf
    ##         │   ├── P14-2-220.pdf
    ##         │   ├── P14-2-2842.pdf
    ##         │   ├── P14-2-2847.pdf
    ##         │   ├── P14-2-2982.pdf
    ##         │   ├── P14-2-318.pdf
    ##         │   ├── P14-2-459.pdf
    ##         │   ├── P14-2-67.pdf
    ##         │   ├── P14-2-87.pdf
    ##         │   └── P14-2-946.pdf
    ##         ├── 2017.11.07
    ##         │   ├── P14-1-2830.pdf
    ##         │   ├── P14-1-361.pdf
    ##         │   ├── P14-1-371.pdf
    ##         │   ├── P14-1-576.pdf
    ##         │   ├── P14-1-587.pdf
    ##         │   ├── P14-1-771.pdf
    ##         │   ├── P14-3-204.pdf
    ##         │   ├── P14-3-445.pdf
    ##         │   ├── P14-3-663.pdf
    ##         │   ├── P14-4-212.pdf
    ##         │   ├── P14-4-3034.pdf
    ##         │   ├── P14-4-460.pdf
    ##         │   ├── P14-4-52.pdf
    ##         │   └── P14-4-651.pdf
    ##         ├── 2017.11.08
    ##         │   ├── P13-1-1050.pdf
    ##         │   ├── P13-1-1085.pdf
    ##         │   ├── P13-1-235.pdf
    ##         │   ├── P13-1-2803.pdf
    ##         │   ├── P13-1-2849.pdf
    ##         │   ├── P13-1-655.pdf
    ##         │   ├── P13-1-782.pdf
    ##         │   ├── P13-1-785.pdf
    ##         │   ├── P13-1-894.pdf
    ##         │   ├── P13-1-922.pdf
    ##         │   ├── P13-1-941.pdf
    ##         │   ├── P13-2-103.pdf
    ##         │   ├── P13-2-104.pdf
    ##         │   ├── P13-2-107.pdf
    ##         │   ├── P13-2-2819.pdf
    ##         │   ├── P13-2-301.pdf
    ##         │   └── P13-2-73.pdf
    ##         ├── 2017.11.09
    ##         │   ├── P13-2-2894.pdf
    ##         │   ├── P13-2-290.pdf
    ##         │   ├── P13-2-300.pdf
    ##         │   ├── P13-2-304.pdf
    ##         │   ├── P13-2-409.pdf
    ##         │   ├── P13-2-472.pdf
    ##         │   ├── P13-2-504.pdf
    ##         │   ├── P13-2-629.pdf
    ##         │   ├── P13-2-662.pdf
    ##         │   ├── P13-2-670.pdf
    ##         │   ├── P13-2-709.pdf
    ##         │   ├── P13-2-714.pdf
    ##         │   ├── P13-2-928.pdf
    ##         │   ├── P13-2-929.pdf
    ##         │   ├── P13-2-931.pdf
    ##         │   ├── P13-4-149.pdf
    ##         │   ├── P13-4-153.pdf
    ##         │   └── P13-4-361.pdf
    ##         ├── 2017.11.14
    ##         │   ├── P1-2-2824.pdf
    ##         │   ├── P1-2-2933.pdf
    ##         │   ├── P1-2-3019.pdf
    ##         │   ├── P13-3-113.pdf
    ##         │   ├── P13-3-2888.pdf
    ##         │   ├── P13-3-358.pdf
    ##         │   ├── P13-3-392.pdf
    ##         │   ├── P13-3-479.pdf
    ##         │   ├── P13-3-542.pdf
    ##         │   └── P13-4-659.pdf
    ##         ├── 2017.11.15
    ##         │   ├── P1-1-231.pdf
    ##         │   ├── P1-1-252.pdf
    ##         │   ├── P1-1-255.pdf
    ##         │   ├── P1-1-267.pdf
    ##         │   ├── P1-1-290.pdf
    ##         │   ├── P1-2-387.pdf
    ##         │   ├── P1-2-392.pdf
    ##         │   ├── P1-2-552.pdf
    ##         │   ├── P1-3-106.pdf
    ##         │   ├── P1-3-539.pdf
    ##         │   ├── P1-3-61.pdf
    ##         │   ├── P1-3-886.pdf
    ##         │   ├── P1-4-1048.pdf
    ##         │   ├── P1-4-2253.pdf
    ##         │   ├── P1-4-2835.pdf
    ##         │   └── P1-4-529.pdf
    ##         ├── 2017.11.16
    ##         │   ├── P1-1-117.pdf
    ##         │   ├── p1-1-2101.pdf
    ##         │   ├── P1-1-2201.pdf
    ##         │   ├── P1-1-2880.pdf
    ##         │   ├── P1-1-479.pdf
    ##         │   ├── p1-1-616.pdf
    ##         │   ├── p1-1-619.pdf
    ##         │   ├── P1-1-623.pdf
    ##         │   ├── p1-1-625.pdf
    ##         │   ├── p1-1-628.pdf
    ##         │   ├── P1-1-631.pdf
    ##         │   ├── p1-1-653.pdf
    ##         │   ├── P1-1-658.pdf
    ##         │   ├── p1-1-880.pdf
    ##         │   └── p1-1-887.pdf
    ##         ├── 2017.11.20
    ##         │   ├── P5-2-2650.pdf
    ##         │   ├── P5-2-2911.pdf
    ##         │   ├── P5-2-2952.pdf
    ##         │   ├── P5-2-2959.pdf
    ##         │   ├── P5-2-3092.pdf
    ##         │   ├── P5-2-88.pdf
    ##         │   ├── P5-2-931.pdf
    ##         │   ├── P5-2-940.pdf
    ##         │   ├── P5-4-1093.pdf
    ##         │   ├── P5-4-1094.pdf
    ##         │   ├── P5-4-2875.pdf
    ##         │   ├── P5-4-2913.pdf
    ##         │   ├── P5-4-2947.pdf
    ##         │   ├── P5-4-3036.pdf
    ##         │   ├── P5-4-471.pdf
    ##         │   ├── P5-4-626.pdf
    ##         │   ├── P5-4-658.pdf
    ##         │   └── P5-4-784.pdf
    ##         └── 2017.11.21
    ##             ├── P5-1-2360.pdf
    ##             ├── P5-1-436.pdf
    ##             ├── P5-1-611.pdf
    ##             ├── P5-1-892.pdf
    ##             ├── P5-1-972.pdf
    ##             ├── P5-3-189.pdf
    ##             ├── P5-3-2202.pdf
    ##             ├── p5-3-265.pdf
    ##             ├── p5-3-2884.pdf
    ##             ├── P5-3-329.pdf
    ##             ├── p5-3-395.pdf
    ##             ├── P5-3-397.pdf
    ##             ├── p5-3-398.pdf
    ##             ├── P5-3-520.pdf
    ##             ├── P5-3-583.pdf
    ##             └── p5-3-877.pdf
    ## 
    ## 72 directories, 1697 files
