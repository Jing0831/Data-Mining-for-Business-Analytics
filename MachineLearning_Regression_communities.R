library (readr) 
communities = read_csv("http://archive.ics.uci.edu/ml/machine-learning-databases/communities/communities.data", col_names = FALSE)
communities = as.data.frame(communities) 
colnames(communities)= c('state',	'county',	'community',	'communityname',	'fold',	'population',	'householdsize',	'racepctblack',	'racePctWhite',	'racePctAsian',	'racePctHisp',	'agePct12t21',	'agePct12t29',	'agePct16t24',	'agePct65up',	'numbUrban',	'pctUrban',	'medIncome',	'pctWWage',	'pctWFarmSelf',	'pctWInvInc',	'pctWSocSec',	'pctWPubAsst',	'pctWRetire',	'medFamInc',	'perCapInc',	'whitePerCap',	'blackPerCap',	'indianPerCap',	'AsianPerCap',	'OtherPerCap',	'HispPerCap',	'NumUnderPov',	'PctPopUnderPov',	'PctLess9thGrade',	'PctNotHSGrad',	'PctBSorMore',	'PctUnemployed',	'PctEmploy',	'PctEmplManu',	'PctEmplProfServ',	'PctOccupManu',	'PctOccupMgmtProf',	'MalePctDivorce',	'MalePctNevMarr',	'FemalePctDiv',	'TotalPctDiv',	'PersPerFam',	'PctFam2Par',	'PctKids2Par',	'PctYoungKids2Par',	'PctTeen2Par',	'PctWorkMomYoungKids',	'PctWorkMom',	'NumIlleg',	'PctIlleg',	'NumImmig',	'PctImmigRecent',	'PctImmigRec5',	'PctImmigRec8',	'PctImmigRec10',	'PctRecentImmig',	'PctRecImmig5',	'PctRecImmig8',	'PctRecImmig10',	'PctSpeakEnglOnly',	'PctNotSpeakEnglWell',	'PctLargHouseFam',	'PctLargHouseOccup',	'PersPerOccupHous',	'PersPerOwnOccHous',	'PersPerRentOccHous',	'PctPersOwnOccup',	'PctPersDenseHous',	'PctHousLess3BR',	'MedNumBR',	'HousVacant',	'PctHousOccup',	'PctHousOwnOcc',	'PctVacantBoarded',	'PctVacMore6Mos',	'MedYrHousBuilt',	'PctHousNoPhone',	'PctWOFullPlumb',	'OwnOccLowQuart',	'OwnOccMedVal',	'OwnOccHiQuart',	'RentLowQ',	'RentMedian',	'RentHighQ',	'MedRent',	'MedRentPctHousInc',	'MedOwnCostPctInc',	'MedOwnCostPctIncNoMtg',	'NumInShelters',	'NumStreet',	'PctForeignBorn',	'PctBornSameState',	'PctSameHouse85',	'PctSameCity85',	'PctSameState85',	'LemasSwornFT',	'LemasSwFTPerPop',	'LemasSwFTFieldOps',	'LemasSwFTFieldPerPop',	'LemasTotalReq',	'LemasTotReqPerPop',	'PolicReqPerOffic',	'PolicPerPop',	'RacialMatchCommPol',	'PctPolicWhite',	'PctPolicBlack',	'PctPolicHisp',	'PctPolicAsian',	'PctPolicMinor',	'OfficAssgnDrugUnits',	'NumKindsDrugsSeiz',	'PolicAveOTWorked',	'LandArea',	'PopDens',	'PctUsePubTrans',	'PolicCars',	'PolicOperBudg',	'LemasPctPolicOnPatr',	'LemasGangUnitDeploy',	'LemasPctOfficDrugUn',	'PolicBudgPerPop',	'ViolentCrimesPerPop')

summary(communities)

communities$rndnum = runif(1994, 1,100)
comm_train2 = communities [ communities[, "rndnum"] <= 80    ,     ]
mdl = lm( ViolentCrimesPerPop ~ population + householdsize + racepctblack + racePctWhite + racePctAsian + racePctHisp , data=communities)

summary(mdl)

# Now we need to split the data 
1994*.80
comm_train = communities[1:1595,]

mdl2 = lm( ViolentCrimesPerPop ~ population + householdsize + racepctblack + racePctWhite + racePctAsian + racePctHisp , data=comm_train)


comm_test = communities[1596:1994,]

comm_test$pred =  predict( mdl2,newdata=comm_test)

comm_test$err = comm_test$pred - comm_test$ViolentCrimesPerPop
comm_test$pcterr = comm_test$err / comm_test$ViolentCrimesPerPop
comm_test$abs_err = abs(comm_test$err)
comm_test$abs_pcterr = abs(comm_test$pcterr)

#Mean Error
mean(comm_test$err)
mean(comm_test$pcterr)
mean(comm_test$abs_err)


#Lets run some regression calculate errors

#use predict function 

#Calculate Error
#Calculate Absolute Error
#Calculate Error Percentage

#Calculate ME, MAE, MAPE





