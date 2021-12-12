clear 

cd \\ptg01\RoamingProfiles\osimeono\Desktop\PAPER

use "\\ptg01\RoamingProfiles\osimeono\Desktop\PAPER\DATA.dta"
replace educfyr =. if educfyr > 20 
replace educmyr =. if educmyr > 20 
replace visits =. if visits > 50

gen sexd = 0
replace sexd = 1 if sex == 2

gen educmd = 0
replace educmd = 1 if educm >= 2

gen educfd = 0
replace educfd = 1 if educf >= 2

gen agemt = 0
replace agemt = 1 if agem <= 19

gen agemo = 0
replace agemo = 1 if agem  >= 35

gen agemo_visits = agemo*visits

gen agemt_visits = agemt*visits

replace residence =0 if residence == 2
replace elec =. if elec > 1
replace bweight =. if bweight > 9950
replace wealth = log(wealth)

gen visits_wealth = visits*wealth

gen educmyr_wealth = educmyr*wealth

gen residence_wealth = residence*wealth

gen educfyr_wealth = educfyr*wealth

regress bweight agemo agemt sexd wealth educmd educfd bord visits elec residence visits_wealth educmyr_wealth agemo_visits agemt_visits residence_wealth educfyr_wealth i.year i.country, vce(cluster loc)