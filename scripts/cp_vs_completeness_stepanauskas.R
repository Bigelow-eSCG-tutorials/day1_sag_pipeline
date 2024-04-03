#getting set up

library(tidyverse)
library(dplyr)
setwd("/Users/rstepanauskas/Projects/\ \ SCGC/\ \ Processing/WGS/2022_assemblies/220203_VH00511_48_AAAKT5NHV")
assembly_stats <- read_csv("220203_VH00511_48_AAAKT5NHV_assembly_stats.csv")

#plot Cp versus assembly completeness

ggplot(data = assembly_stats, aes(x = wga_cp, y = checkM_estimated_completeness, size=raw_read_count, color=-gc_content)) +
  geom_point(alpha = 0.7) +
  scale_color_gradientn(colours = rainbow(3)) +
  xlim(1, 4) +
  ylim(0, 100) +
  ggtitle(nth(assembly_stats, 4)) +
  xlab("WGA-X Cp, h") +
  ylab("Assembly completeness, %") +
  theme(
    plot.title = element_text(size=12),
    axis.title.x = element_text(size=14, face="bold"),
    axis.title.y = element_text(size=14, face="bold"),
    axis.text.x= element_text(size=14),
    axis.text.y= element_text(size=14)
  )
  
  #save the plot
  
ggsave(width = 7, height = 5, dpi = 300, filename = "Cp_vs_completeness.png")


