
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)" # is /scratch/julian/cxl/liveness_models/ currently
SRC_DIR="${SCRIPT_DIR}/../CXLGen/Protocols/MOESI_Directory/RF_Dir/ord_net/"
DST_DIR="${SCRIPT_DIR}"

# MESIxCXLxRCC 2Cl_2CC
cp "${SRC_DIR}/FullSystem/MESIxCXL2_ordxRCCHetero/Murphi/MU_FullSystem_2CC.m" "${DST_DIR}/MESIxCXLxRCC/2Cl_2CC/FullMurphi/"
cp "${SRC_DIR}/FullSystem/MESIxCXL2_ordxRCCHetero/Murphi/RMR_MR_LIVE_FullSystem_2CC.m" "${DST_DIR}/MESIxCXLxRCC/2Cl_2CC/FullRumurLive"

cp "${SRC_DIR}/HeteroGen/MESI_CXL2_ord/Murphi/COMP_Model_2CC.m" "${DST_DIR}/MESIxCXLxRCC/2Cl_2CC/MESI_CompModel"
cp "${SRC_DIR}/HeteroGen/MESI_CXL2_ord/Murphi/COMP_MR_EQP_BsL2_2CC.m" "${DST_DIR}/MESIxCXLxRCC/2Cl_2CC/MESI_EQ_BsL2"
cp "${SRC_DIR}/HeteroGen/MESI_CXL2_ord/Murphi/COMP_MR_EQ_L2sB_2CC.m" "${DST_DIR}/MESIxCXLxRCC/2Cl_2CC/MESI_EQ_L2sB"

cp "${SRC_DIR}/HeteroGen/RCCHetero_CXL2_ord/Murphi/COMP_Model_2CC.m" "${DST_DIR}/MESIxCXLxRCC/2Cl_2CC/RCC_CompModel"
cp "${SRC_DIR}/HeteroGen/RCCHetero_CXL2_ord/Murphi/COMP_MR_EQP_BsL2_2CC.m" "${DST_DIR}/MESIxCXLxRCC/2Cl_2CC/RCC_EQ_BsL2"
cp "${SRC_DIR}/HeteroGen/RCCHetero_CXL2_ord/Murphi/COMP_MR_EQ_L2sB_2CC.m" "${DST_DIR}/MESIxCXLxRCC/2Cl_2CC/RCC_EQ_L2sB"

# MESIxCXLxRCC 2Cl_3CC
cp "${SRC_DIR}/FullSystem/MESIxCXL2_ordxRCCHetero/Murphi/MU_FullSystem_3CC.m" "${DST_DIR}/MESIxCXLxRCC/2Cl_3CC/FullMurphi/"
cp "${SRC_DIR}/FullSystem/MESIxCXL2_ordxRCCHetero/Murphi/RMR_MR_LIVE_FullSystem_3CC.m" "${DST_DIR}/MESIxCXLxRCC/2Cl_3CC/FullRumurLive"

cp "${SRC_DIR}/HeteroGen/MESI_CXL2_ord/Murphi/COMP_Model_3CC.m" "${DST_DIR}/MESIxCXLxRCC/2Cl_3CC/MESI_CompModel"
cp "${SRC_DIR}/HeteroGen/MESI_CXL2_ord/Murphi/COMP_MR_EQP_BsL2_3CC.m" "${DST_DIR}/MESIxCXLxRCC/2Cl_3CC/MESI_EQ_BsL2"
cp "${SRC_DIR}/HeteroGen/MESI_CXL2_ord/Murphi/COMP_MR_EQ_L2sB_3CC.m" "${DST_DIR}/MESIxCXLxRCC/2Cl_3CC/MESI_EQ_L2sB"

cp "${SRC_DIR}/HeteroGen/RCCHetero_CXL2_ord/Murphi/COMP_Model_3CC.m" "${DST_DIR}/MESIxCXLxRCC/2Cl_3CC/RCC_CompModel"
cp "${SRC_DIR}/HeteroGen/RCCHetero_CXL2_ord/Murphi/COMP_MR_EQP_BsL2_3CC.m" "${DST_DIR}/MESIxCXLxRCC/2Cl_3CC/RCC_EQ_BsL2"
cp "${SRC_DIR}/HeteroGen/RCCHetero_CXL2_ord/Murphi/COMP_MR_EQ_L2sB_3CC.m" "${DST_DIR}/MESIxCXLxRCC/2Cl_3CC/RCC_EQ_L2sB"

# MESIxMESIxMESI 2Cl_3CC
cp "${SRC_DIR}/FullSystem/MESIxMESIxMESI/Murphi/MU_FullSystem_3CC.m" "${DST_DIR}/MESIxMESIxMESI/2Cl_3CC/FullMurphi/"
cp "${SRC_DIR}/FullSystem/MESIxMESIxMESI/Murphi/RMR_MR_LIVE_FullSystem_3CC.m" "${DST_DIR}/MESIxMESIxMESI/2Cl_3CC/FullRumurLive"

cp "${SRC_DIR}/HeteroGen/MESI_MESI/Murphi/COMP_Model_3CC.m" "${DST_DIR}/MESIxMESIxMESI/2Cl_3CC/MESI_CompModel"
cp "${SRC_DIR}/HeteroGen/MESI_MESI/Murphi/COMP_MR_EQP_BsL2_3CC.m" "${DST_DIR}/MESIxMESIxMESI/2Cl_3CC/MESI_EQ_BsL2"
cp "${SRC_DIR}/HeteroGen/MESI_MESI/Murphi/COMP_MR_EQ_L2sB_3CC.m" "${DST_DIR}/MESIxMESIxMESI/2Cl_3CC/MESI_EQ_L2sB"
