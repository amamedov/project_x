# install.packages('ggplot2')
library(ggplot2)

setwd('C:/Users/Артём/Desktop/HSE/Бионформатика/Проект/Ямпольская/')

names <- c('H3K36me3_HepG2.ENCFF296VZN.hg19',
           'H3K36me3_HepG2.ENCFF296VZN.hg38',
           'H3K36me3_HepG2.ENCFF924TKB.hg19',
           'H3K36me3_HepG2.ENCFF924TKB.hg38')

outdir <- 'images/'


for (NAME in names)
{
  bed_df <- read.delim(paste0('data/',NAME, '.bed'), 
                       as.is = TRUE, header = FALSE)
  colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
  bed_df$len <- bed_df$end - bed_df$start
  
  ggplot(bed_df) +
    aes(x = len) +
    geom_histogram() +
    ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
    theme_bw()
  ggsave(paste0('len_hist.', NAME, '.pdf'), path = outdir,width = 10, dpi = 600)
}