library(fbar)
library(ROI.plugin.ecos)

dummy_model_table <- read.csv(file = "pentose.csv", header = TRUE, stringsAsFactors = FALSE)

dummy_model_table$lowbnd = as.numeric(dummy_model_table$lowbnd)
dummy_model_table$uppbnd = as.numeric(dummy_model_table$uppbnd)
dummy_model_table$obj_coef = as.numeric(dummy_model_table$obj_coef)

dummy_model_with_flux = find_fluxes_df(reaction_table = dummy_model_table, do_minimization = FALSE)

print(dummy_model_with_flux)