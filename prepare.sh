#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "You have to pass a directory name to this script"
	exit 0
fi

# all LP except fome and car4 (cut 0)

hgraphs=( aa01 aa03 aa3 aa4 aa5 aa6 add20 add32 adder_dcop_01 adder_dcop_02 adder_dcop_03 adder_dcop_04 adder_dcop_05 adder_dcop_06 adder_dcop_07 adder_dcop_08 adder_dcop_09 adder_dcop_10 adder_dcop_11 adder_dcop_12 adder_dcop_13 adder_dcop_14 adder_dcop_15 adder_dcop_16 adder_dcop_17 adder_dcop_18 adder_dcop_19 adder_dcop_20 adder_dcop_21 adder_dcop_22 adder_dcop_23 adder_dcop_24 adder_dcop_25 adder_dcop_26 adder_dcop_27 adder_dcop_28 adder_dcop_29 adder_dcop_30 adder_dcop_31 adder_dcop_32 adder_dcop_33 adder_dcop_34 adder_dcop_35 adder_dcop_36 adder_dcop_37 adder_dcop_38 adder_dcop_39 adder_dcop_40 adder_dcop_41 adder_dcop_42 adder_dcop_43 adder_dcop_44 adder_dcop_45 adder_dcop_46 adder_dcop_47 adder_dcop_48 adder_dcop_49 adder_dcop_50 adder_dcop_51 adder_dcop_52 adder_dcop_53 adder_dcop_54 adder_dcop_55 adder_dcop_56 adder_dcop_57 adder_dcop_58 adder_dcop_59 adder_dcop_60 adder_dcop_61 adder_dcop_62 adder_dcop_63 adder_dcop_64 adder_dcop_65 adder_dcop_66 adder_dcop_67 adder_dcop_68 adder_dcop_69 adder_trans_01 adder_trans_02 air02 air03 air04 air05 air06 aircraft baxter bcspwr06 bcspwr07 bcspwr08 bcspwr09 bcspwr10 brainpc2 c-18 c-19 c-20 c-21 c-22 c-23 c-24 c-25 c-26 c-27 c-28 c-29 c-30 c-31 c-32 c-33 c-34 c-35 c-36 c-37 c-38 c-39 c-40 c-41 c-42 c-43 c-44 c-45 c-46 c-48 c-49 c-50 car4 cari case9 cep1 ch circuit_1 circuit_2 circuit204 circuit_3 co5 co9 complex coupled cq5 cq9 cr42 crew1 cvxqp3 dano3mip de063157 de080285 delf deter0 deter1 deter2 deter3 deter4 deter5 deter6 deter7 deter8 df2177 dtoc dynamicSoaringProblem_2 dynamicSoaringProblem_3 dynamicSoaringProblem_4 dynamicSoaringProblem_5 dynamicSoaringProblem_6 dynamicSoaringProblem_7 dynamicSoaringProblem_8 e18 eris1176 ex3sta1 fome11 fome12 fpga_dcop_01 fpga_dcop_02 fpga_dcop_03 fpga_dcop_04 fpga_dcop_05 fpga_dcop_06 fpga_dcop_07 fpga_dcop_08 fpga_dcop_09 fpga_dcop_10 fpga_dcop_11 fpga_dcop_12 fpga_dcop_13 fpga_dcop_14 fpga_dcop_15 fpga_dcop_16 fpga_dcop_17 fpga_dcop_18 fpga_dcop_19 fpga_dcop_20 fpga_dcop_21 fpga_dcop_22 fpga_dcop_23 fpga_dcop_24 fpga_dcop_25 fpga_dcop_26 fpga_dcop_27 fpga_dcop_28 fpga_dcop_29 fpga_dcop_30 fpga_dcop_31 fpga_dcop_32 fpga_dcop_33 fpga_dcop_34 fpga_dcop_35 fpga_dcop_36 fpga_dcop_37 fpga_dcop_38 fpga_dcop_39 fpga_dcop_40 fpga_dcop_41 fpga_dcop_42 fpga_dcop_43 fpga_dcop_44 fpga_dcop_45 fpga_dcop_46 fpga_dcop_47 fpga_dcop_48 fpga_dcop_49 fpga_dcop_50 fpga_dcop_51 fpga_trans_01 fpga_trans_02 freeFlyingRobot_10 freeFlyingRobot_11 freeFlyingRobot_12 freeFlyingRobot_13 freeFlyingRobot_14 freeFlyingRobot_15 freeFlyingRobot_16 freeFlyingRobot_2 freeFlyingRobot_3 freeFlyingRobot_4 freeFlyingRobot_5 freeFlyingRobot_6 freeFlyingRobot_7 freeFlyingRobot_8 freeFlyingRobot_9 fxm2-16 fxm2-6 fxm3_6 ge gemat1 gemat11 gemat12 gen gen1 gen2 gen4 Hamrle2 hangGlider_2 hangGlider_3 hangGlider_4 hangGlider_5 hvdc1 iiasa init_adder1 iprob jendrec1 jnlbrng1 kineticBatchReactor_1 kineticBatchReactor_2 kineticBatchReactor_3 kineticBatchReactor_4 kineticBatchReactor_5 kineticBatchReactor_6 kineticBatchReactor_7 kineticBatchReactor_8 kineticBatchReactor_9 l30 large LeGresley_2508 LeGresley_4908 lowThrust_2 lowThrust_3 lowThrust_4 lowThrust_5 lp22 lp_25fv47 lp_80bau3b lp_d2q06c lp_d6cube lp_degen3 lp_dfl001 lp_fffff800 lp_fit1d lp_fit1p lp_fit2d lp_fit2p lp_ganges lp_greenbea lp_greenbeb lpi_gosh lpi_gran lpi_greenbea lpi_klein3 lpi_pilot4i lp_ken_07 lp_ken_11 lp_ken_13 lpl2 lpl3 lp_maros lp_nug08 lp_nug12 lp_nug15 lp_osa_07 lp_pds_02 lp_pds_06 lp_pds_10 lp_perold lp_pilot lp_pilot4 lp_pilot87 lp_pilot_ja lp_pilotnov lp_pilot_we lp_qap12 lp_qap15 lp_qap8 lp_scfxm2 lp_scfxm3 lp_scsd8 lp_sctap2 lp_sctap3 lp_ship04l lp_ship08l lp_ship08s lp_ship12l lp_ship12s lp_sierra lp_stocfor2 lp_stocfor3 lp_truss lp_wood1p lp_woodw meg1 meg4 memplus mod2 model10 model2 model3 model4 model5 model6 model7 model8 model9 mult_dcop_01 mult_dcop_02 mult_dcop_03 ncvxqp1 ncvxqp9 nemsemm2 nemspmm1 nemspmm2 nemswrld nl nsir nug08-3rd obstclae OPF_3754 p010 p05 p2756 p6000 pcb1000 pcb3000 pds10 pf2177 pgp2 plddb pltexpa powersim primagaz progas psse0 psse1 psse2 qh1484 qpband r05 rajat01 rajat02 rajat03 rajat04 rajat06 rajat07 rajat08 rajat09 rajat10 rajat12 rajat13 rajat22 rajat27 reorientation_2 reorientation_3 reorientation_4 reorientation_5 reorientation_6 reorientation_7 reorientation_8 rosen1 rosen10 rosen2 rosen8 sc205-2r scagr7-2b scagr7-2c scagr7-2r scfxm1-2b scrs8-2b scrs8-2c scrs8-2r scsd8-2b scsd8-2c scsd8-2r sctap1-2b sctap1-2c sctap1-2r seymourl slptsk south31 spaceShuttleEntry_2 spaceShuttleEntry_3 spaceShuttleEntry_4 spaceStation_10 spaceStation_11 spaceStation_12 spaceStation_13 spaceStation_14 spaceStation_5 spaceStation_6 spaceStation_7 spaceStation_8 spaceStation_9 stoch_aircraft stormg2-27 stormg2-8 testbig torsion1 ulevimin world ) 

mkdir /zfs/safrolab/users/rshaydu/patoh_bench/"$1"

for h in ${hgraphs[@]}
do
		mkdir  /zfs/safrolab/users/rshaydu/patoh_bench/"$1"/"$h"/
		cp /zfs/safrolab/users/rshaydu/hypergraphs_converted_patoh/"$h".mtx.patoh /zfs/safrolab/users/rshaydu/patoh_bench/"$1"/"$h"/"$h".patoh
		cp /home/rshaydu/patoh_bench/bench/run_for_dir.py /zfs/safrolab/users/rshaydu/patoh_bench/"$1"/"$h"/
done
