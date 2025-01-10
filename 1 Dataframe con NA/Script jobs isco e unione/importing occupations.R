data <- W7R
data$id <- row.names(data)

EVS_WVS_Joint_ORIGINALE$id <- row.names(EVS_WVS_Joint_ORIGINALE)


# occupational group of respondent (WVS7)
# X036E_WVS7


str(EVS_WVS_Joint_ORIGINALE$X036E_WVS7)
summary(EVS_WVS_Joint_ORIGINALE$X036E_WVS7)
unique(EVS_WVS_Joint_ORIGINALE$X036E_WVS7)
EVS_WVS_Joint_ORIGINALE$X036E_WVS7 <- as.numeric(EVS_WVS_Joint_ORIGINALE$X036E_WVS7)



# job profession/industry ISCO08 (EVS5)
# X035_EVS5

str(EVS_WVS_Joint_ORIGINALE$X035_EVS5)
summary(EVS_WVS_Joint_ORIGINALE$X035_EVS5)
unique(EVS_WVS_Joint_ORIGINALE$X035_EVS5)
EVS_WVS_Joint_ORIGINALE$X035_EVS5 <- as.numeric(EVS_WVS_Joint_ORIGINALE$X035_EVS5)



# Merge occupations by individual ID ----

## ISCO08 ----

data$occupation_isco08 <- with(
  EVS_WVS_Joint_ORIGINALE, 
  setNames(X036E_WVS7, id
  ))[as.matrix(data$id)]



data$occupation_isco08 <- with(
  EVS_WVS_Joint_ORIGINALE, 
  setNames(X035_EVS5, id
  ))[as.matrix(data$id)]

summary(data$occupation_isco08)

## Clean df and replacing neg as NAs

i1 = which(data$occupation_isco08 == "-5")
data$occupation_isco08[i1] = NA

i1 = which(data$occupation_isco08 == "-4")
data$occupation_isco08[i1] = NA

i1 = which(data$occupation_isco08 == "-3")
data$occupation_isco08[i1] = NA

i1 = which(data$occupation_isco08 == "-2")
data$occupation_isco08[i1] = NA

i1 = which(data$occupation_isco08 == "-1")
data$occupation_isco08[i1] = NA


i1 = which(data$occupation_isco08 == "99")
data$occupation_isco08[i1] = NA


table(data$occupation_isco08)



# create separate col at 1-digit aggregation: truncate all numbers to the first digit

isco08_1digit <- numeric(length(data$occupation_isco08))

# iterate over each element of the column and truncate it to the first digit
for (i in seq_along(data$occupation_isco08)) {
  if (is.na(data$occupation_isco08[i])) {
    isco08_1digit[i] <- NA
  } else if (nchar(as.character(data$occupation_isco08[i])) > 1) {
    isco08_1digit[i] <- floor(data$occupation_isco08[i] / 10)
  } else {
    isco08_1digit[i] <- data$occupation_isco08[i]
  }
}


data$isco_1digit = isco08_1digit





## Occupational status --


data$X028 <- with(
  EVS_WVS_Joint_ORIGINALE, 
  setNames(X028, id
  ))[as.matrix(data$id)]



i1 = which(data$X028 == "-5")
data$X028[i1] = NA
i1 = which(data$X028 == "-4")
data$X028[i1] = NA
i1 = which(data$X028 == "-3")
data$X028[i1] = NA
i1 = which(data$X028 == "-2")
data$X028[i1] = NA
i1 = which(data$X028 == "-1")
data$X028[i1] = NA





#dataR$emp_sts = data$X028  employment status

i1 = which(data$X028 == 1) # full time >=30h
data$jpos_ft = 0
data$jpos_ft[i1] = 1
i2 = which(data$X028 == 2) # part time <30h
data$jpos_pt = 0
data$jpos_pt[i2] = 1
i3 = which(data$X028 == 3) # self employed
data$jpos_se = 0
data$jpos_se[i3] = 1
i4 = which(data$X028 == 4) # retired/pensioned
data$jpos_ret = 0
data$jpos_ret[i4] = 1
i5 = which(data$X028 == 5) # housewife (or not otherwise employed)
data$jpos_hsw = 0
data$jpos_hsw[i5] = 1
i6 = which(data$X028 == 6) # student
data$jpos_std = 0
data$jpos_std[i6] = 1
i7 = which(data$X028 == 7) # unemployed
data$jpos_un = 0
data$jpos_un[i7] = 1
i8 = which(data$X028 == 8) # other
data$jpos_oth = 0
data$jpos_oth[i8] = 1



data$occupation_isco08 = NULL
data$X028 = NULL



# Saving df ----
save(data, file = "DATA FINALE pre imputation e pop classification.Rda")
