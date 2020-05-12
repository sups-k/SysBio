#rm(list = ls())

#setwd("C:/Users/poulami/My Work/microarray_analysis/Post_proposal/nov_2016_aberrant_pathways/12_KEGG_PATHWAYS_RA_from_DAVID/to_Sir/crisp_data_toSir")

plotfile <- 'data_heatmap.png'
library(pheatmap)
library(Cairo)


file= paste("data_to_cluster.txt", sep="")

# the file which is read has the expression values (mas5 normalized) of 56 selected genes. 
#The expression values belong to 12 RA samples and 9 control samples.
# Thus dimension of data = 56 by 21
data <- read.table("data_to_cluster.txt", header = TRUE)


Cairo(
file=plotfile,
type="png",
width = 15,
height = 20,
units = "in",
dpi = 500,
pointsize = 6,
compression = c("lzw")
)


pheatmap(data ,scale = "row", clustering_distance_rows="correlation", cluster_rows=TRUE, clustering_distance_cols="correlation", cluster_cols=TRUE, color = colorRampPalette(c("red","white","green")) (100),margins=c(8,8),fontsize = 12, cex = 1.2, cellwidth = 24, cellheight = 24, show_rownames=TRUE, main="")


dev.off()

# The 56 selected genes are randomly picked up from 4 pathways listed in KEGG database
# The 4 pathways are hsa04380 = osteoclast differentiation pathway, hsa04660 = T cell receptor signaling pathway, hsa04650 = NK cell mediated cytotoxicity pathway and hsa04270 = Vascular Smooth Muscle Contraction pathway

# The genes myosin light chain 9(MYL9), actin, gamma 2, smooth muscle, enteric(ACTG2), phospholipase C beta 4(PLCB4), receptor activity modifying protein 2(RAMP2),
# myosin light chain kinase(MYLK) and angiotensin II receptor type 1(AGTR1) which cluster together are part of the pathway hsa04270 = Vascular Smooth Muscle Contraction pathway. These genes are down-regulated in RA samples.
# The other genes (of this pathway) which are present in our list of selected genes are phospholipase C beta 1(PLCB1), caldesmon 1(CALD1), guanylate cyclase 1 soluble subunit alpha 2(GUCY1A2), protein kinase, cGMP-dependent, type I(PRKG1)
# and natriuretic peptide receptor 2(NPR2). These genes are also grouped in the down-regulated gene cluster.






