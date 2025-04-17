# read in raw data
dat <- read.csv('./v62.0_HO_public.csv', skip = 1, na.strings = '..')
dat <- subset(dat, !is.na(long) & !is.na(lat))

# remove haplotypes that are n/a or n/a (<2x)
dat <- subset(dat, !(mtDNA_hap %in% c('n/a', 'n/a (<2x)')))
dat <- subset(dat, !(Y_hap2 %in% c('n/a', 'n/a (<2x)')))
# remove haplotypes that are '-' and 'n/'
dat <- subset(dat, mtDNA_hap != '-')
dat <- subset(dat, Y_hap2 != '-')
dat <- subset(dat, Y_hap2 != 'n/')
dat <- subset(dat, Y_hap2 != '..')
# coarsen haplotype
dat$mtDNA_hap_simp <- substr(dat$mtDNA_hap, 1, 3)
dat$y_hap_simp <- substr(dat$Y_hap2, 1, 3)
dat <- subset(dat, !(y_hap_simp %in% c('n/a', 'n/a (<2x)')))

# write out clean data
write.csv(dat, file = 'clean_data.csv', row.names = FALSE)
