/*
  Copyright (c) 2021.  Nicolai Oswald
  Copyright (c) 2021.  University of Edinburgh
  All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are
  met: redistributions of source code must retain the above copyright
  notice, this list of conditions and the following disclaimer;
  redistributions in binary form must reproduce the above copyright
  notice, this list of conditions and the following disclaimer in the
  documentation and/or other materials provided with the distribution;
  neither the name of the copyright holders nor the names of its
  contributors may be used to endorse or promote products derived from
  this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
--Backend/Murphi/MurphiModular/Constants/GenConst
  ---- System access constants
  const
    ENABLE_QS: false;
    VAL_COUNT: 1;
    ADR_COUNT: 1;
  
  ---- System network constants
    O_NET_MAX: 18;
    U_NET_MAX: 18;
  
  ---- Cluster network constants
    CACHE_NET_MAX : 5;
    C1_LHS_NET_MAX : 7;
    C2_LHS_NET_MAX : 7;
    C2_RHS_NET_MAX : 7;
  
  ---- SSP declaration constants
    NrCachesL1: 3;
    NrCachesL2: 3;
  
--Backend/Murphi/MurphiModular/GenTypes
  type
    ----Backend/Murphi/MurphiModular/Types/GenAdrDef
    Address: scalarset(ADR_COUNT);
    ClValue: 0..VAL_COUNT;
    
    ----Backend/Murphi/MurphiModular/Types/Enums/GenEnums
      ------Backend/Murphi/MurphiModular/Types/Enums/SubEnums/GenAccess
      PermissionType: enum {
        load, 
        store, 
        evict, 
        none
      };
      
      ------Backend/Murphi/MurphiModular/Types/Enums/SubEnums/GenMessageTypes
      MessageType: enum {
        GetSL1, 
        GetML1, 
        PutSL1, 
        Inv_AckL1, 
        GetM_Ack_DL1, 
        GetS_AckL1, 
        WBL1, 
        PutML1, 
        PutEL1, 
        GetM_Ack_ADL1, 
        InvL1, 
        Put_AckL1, 
        Fwd_GetSL1, 
        Fwd_GetML1, 
        GetSL1store, 
        GetSL1load, 
        GetML1store, 
        MemRd_S_SnpDataL2, 
        BIConflictL2, 
        MemRd_A_SnpInvL2, 
        BIRspIL2, 
        MemInv_A_SnpInvL2, 
        MemClnEvct_IL2, 
        BIRspSL2, 
        MemWr_IL2, 
        MemWr_SL2, 
        Cmp_EL2, 
        MemDataL2, 
        Cmp_SL2, 
        BISnpInvL2, 
        BIConflictAckL2, 
        CmpL2, 
        BISnpDataL2, 
        BIConflictL2load, 
        MemRd_S_SnpDataL2load, 
        MemRd_A_SnpInvL2load, 
        MemInv_A_SnpInvL2load
      };
      
      ------Backend/Murphi/MurphiModular/Types/Enums/SubEnums/GenArchEnums
      s_cacheL2RHS: enum {
        cacheL2RHS_S_store,
        cacheL2RHS_S_evict_x_I,
        cacheL2RHS_S_evict,
        cacheL2RHS_S,
        cacheL2RHS_M_evict_BIConflictAck,
        cacheL2RHS_M_evict,
        cacheL2RHS_M_BISnpInv,
        cacheL2RHS_M_BISnpData,
        cacheL2RHS_M_BIConflictAck,
        cacheL2RHS_M,
        cacheL2RHS_I_store_Cmp_E,
        cacheL2RHS_I_store,
        cacheL2RHS_I_load_Cmp_S,
        cacheL2RHS_I_load_Cmp_E,
        cacheL2RHS_I_load,
        cacheL2RHS_I,
        cacheL2RHS_E_evict_x_I,
        cacheL2RHS_E_evict,
        cacheL2RHS_E
      };
      
      s_directoryL1LHS: enum {
        directoryL1LHS_evictdM_x_pI_store__C__M,
        directoryL1LHS_evictdM_x_pI_store_GetM_Ack_AD__C__S,
        directoryL1LHS_evictdM_x_pI_store_GetM_Ack_AD__C__M,
        directoryL1LHS_evictdM_x_pI_store_GetM_Ack_AD__C__E,
        directoryL1LHS_evictI__C__S_evict_x_I,
        directoryL1LHS_evictI__C__S_evict,
        directoryL1LHS_evictI__C__M_evict_BIConflictAck,
        directoryL1LHS_evictI__C__M_evict,
        directoryL1LHS_evictI__C__E_evict_x_I,
        directoryL1LHS_evictI__C__E_evict,
        directoryL1LHS_S__C__S,
        directoryL1LHS_S__C__M,
        directoryL1LHS_S__C__E,
        directoryL1LHS_M__C__M,
        directoryL1LHS_I__C__S,
        directoryL1LHS_I__C__M,
        directoryL1LHS_I__C__I,
        directoryL1LHS_I__C__E,
        directoryL1LHS_GetSL1M_GetS__C__M,
        directoryL1LHS_GetSL1I__C__S_store,
        directoryL1LHS_GetSL1I__C__I_store_Cmp_E,
        directoryL1LHS_GetSL1I__C__I_store,
        directoryL1LHS_GetSL1E_GetS__C__M,
        directoryL1LHS_GetML1S__C__S_store,
        directoryL1LHS_GetML1S__C__I_store_Cmp_E,
        directoryL1LHS_GetML1S__C__I_store,
        directoryL1LHS_GetML1I__C__S_store,
        directoryL1LHS_GetML1I__C__I_store_Cmp_E,
        directoryL1LHS_GetML1I__C__I_store,
        directoryL1LHS_E__C__M,
        directoryL1LHS_BISnpInvL2dM_x_pI_store__C__M,
        directoryL1LHS_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__S,
        directoryL1LHS_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__M,
        directoryL1LHS_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__E,
        directoryL1LHS_BISnpInvL2I__C__M_BISnpInv,
        directoryL1LHS_BISnpDataL2dS_x_pI_load__C__M,
        directoryL1LHS_BISnpDataL2dM_GetS_x_pS__C__M,
        directoryL1LHS_BISnpDataL2dM_GetS_x_pI_load__C__M,
        directoryL1LHS_BISnpDataL2dE_GetS_x_pS__C__M,
        directoryL1LHS_BISnpDataL2dE_GetS_x_pI_load__C__M,
        directoryL1LHS_BISnpDataL2S__C__M_BISnpData,
        directoryL1LHS_BISnpDataL2I__C__M_BISnpData,
        directoryL1LHS_BIConflictAckL2dM_x_pI_store__C__M,
        directoryL1LHS_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__S,
        directoryL1LHS_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__M,
        directoryL1LHS_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__I_store,
        directoryL1LHS_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__E,
        directoryL1LHS_BIConflictAckL2I__C__M_BIConflictAck
      };
      
      s_directoryL2LHS: enum {
        directoryL2LHS_S_MemRd_A_SnpInv,
        directoryL2LHS_S_MemInv_A_SnpInv,
        directoryL2LHS_S,
        directoryL2LHS_M_MemRd_S_SnpData,
        directoryL2LHS_M_MemRd_A_SnpInv,
        directoryL2LHS_M_MemInv_A_SnpInv,
        directoryL2LHS_M,
        directoryL2LHS_I,
        directoryL2LHS_E_MemRd_S_SnpData,
        directoryL2LHS_E_MemRd_A_SnpInv,
        directoryL2LHS_E_MemInv_A_SnpInv,
        directoryL2LHS_E
      };
      
      s_abstractionRHS: enum {
        abstractionRHS_S_store,
        abstractionRHS_S_evict_x_I,
        abstractionRHS_S_evict,
        abstractionRHS_S,
        abstractionRHS_M_evict_BIConflictAck,
        abstractionRHS_M_evict,
        abstractionRHS_M_BISnpInv,
        abstractionRHS_M_BISnpData,
        abstractionRHS_M_BIConflictAck,
        abstractionRHS_M,
        abstractionRHS_I_store_Cmp_E,
        abstractionRHS_I_store,
        abstractionRHS_I_load_Cmp_S,
        abstractionRHS_I_load_Cmp_E,
        abstractionRHS_I_load,
        abstractionRHS_I,
        abstractionRHS_E_evict_x_I,
        abstractionRHS_E_evict,
        abstractionRHS_E
      };
      
      s_cacheL1LHS: enum {
        cacheL1LHS_S_store_GetM_Ack_AD,
        cacheL1LHS_S_store,
        cacheL1LHS_S_evict_x_I,
        cacheL1LHS_S_evict,
        cacheL1LHS_S,
        cacheL1LHS_M_evict_x_I,
        cacheL1LHS_M_evict,
        cacheL1LHS_M,
        cacheL1LHS_I_store_GetM_Ack_AD,
        cacheL1LHS_I_store,
        cacheL1LHS_I_load,
        cacheL1LHS_I,
        cacheL1LHS_E_evict_x_I,
        cacheL1LHS_E_evict,
        cacheL1LHS_E
      };
      
      s_cacheL2LHS: enum {
        cacheL2LHS_S_store,
        cacheL2LHS_S_evict_x_I,
        cacheL2LHS_S_evict,
        cacheL2LHS_S,
        cacheL2LHS_M_evict_BIConflictAck,
        cacheL2LHS_M_evict,
        cacheL2LHS_M_BISnpInv,
        cacheL2LHS_M_BISnpData,
        cacheL2LHS_M_BIConflictAck,
        cacheL2LHS_M,
        cacheL2LHS_I_store_Cmp_E,
        cacheL2LHS_I_store,
        cacheL2LHS_I_load_Cmp_S,
        cacheL2LHS_I_load_Cmp_E,
        cacheL2LHS_I_load,
        cacheL2LHS_I,
        cacheL2LHS_E_evict_x_I,
        cacheL2LHS_E_evict,
        cacheL2LHS_E
      };
      
      s_directoryL2RHS: enum {
        directoryL2RHS_S_MemRd_A_SnpInv,
        directoryL2RHS_S_MemInv_A_SnpInv,
        directoryL2RHS_S,
        directoryL2RHS_M_MemRd_S_SnpData,
        directoryL2RHS_M_MemRd_A_SnpInv,
        directoryL2RHS_M_MemInv_A_SnpInv,
        directoryL2RHS_M,
        directoryL2RHS_I,
        directoryL2RHS_E_MemRd_S_SnpData,
        directoryL2RHS_E_MemRd_A_SnpInv,
        directoryL2RHS_E_MemInv_A_SnpInv,
        directoryL2RHS_E
      };
      
      SystemStates: enum { systemLHS, systemRHS, systemLHSExt, systemRHSExt };
    ----Backend/Murphi/MurphiModular/Types/GenMachineSets
      -- Cluster: C1_LHS
      OBJSET_cacheL1LHS: scalarset(2);
      OBJSET_directoryL1LHS: enum{directoryL1LHS};
      C1_LHSMachines: record
        cacheL1LHS: OBJSET_cacheL1LHS;
        directoryL1LHS: OBJSET_directoryL1LHS;
      end;
      -- Cluster: C2_LHS
      OBJSET_directoryL2LHS: enum{directoryL2LHS};
      OBJSET_cacheL2LHS: enum{cacheL2LHS};
      C2_LHSMachines: record
        directoryL1LHS: OBJSET_directoryL1LHS;
        directoryL2LHS: OBJSET_directoryL2LHS;
        cacheL2LHS: OBJSET_cacheL2LHS;
      end;
      -- Cluster: C2_RHS
      OBJSET_abstractionRHS: enum{abstractionRHS};
      OBJSET_cacheL2RHS: OBJSET_cacheL2LHS;
      OBJSET_directoryL2RHS: OBJSET_directoryL2LHS;
      C2_RHSMachines: record
        abstractionRHS: OBJSET_abstractionRHS;
        cacheL2RHS: OBJSET_cacheL2RHS;
        directoryL2RHS: OBJSET_directoryL2RHS;
      end;
      
      Machines: record
        cacheL1LHS: OBJSET_cacheL1LHS;
        directoryL1LHS: OBJSET_directoryL1LHS;
        directoryL2LHS: OBJSET_directoryL2LHS;
        cacheL2LHS: OBJSET_cacheL2LHS;
        abstractionRHS: OBJSET_abstractionRHS;
        cacheL2RHS: OBJSET_cacheL2RHS;
        directoryL2RHS: OBJSET_directoryL2RHS;
      end;
      CntMachines: 0..8;
    
    ----Backend/Murphi/MurphiModular/Types/GenScalarMaps
    
    ----Backend/Murphi/MurphiModular/Types/GenCheckTypes
      ------Backend/Murphi/MurphiModular/Types/CheckTypes/GenPermType
        acc_type_obj: array[PermissionType] of boolean;
        PermMonitor: record
          cacheL2RHS: array[OBJSET_cacheL2RHS] of array[Address] of acc_type_obj;
          cacheL2LHS: array[OBJSET_cacheL2LHS] of array[Address] of acc_type_obj;
          cacheL1LHS: array[OBJSET_cacheL1LHS] of array[Address] of acc_type_obj;
        
        end;
      
    
    ----Backend/Murphi/MurphiModular/Types/GenMessage
      Message: record
        adr: Address;
        mtype: MessageType;
        src: Machines;
        dst: Machines;
        cl: ClValue;
        acksExpectedL1: 0..NrCachesL1;
      end;
      
    ----Backend/Murphi/MurphiModular/Types/GenNetwork
      NET_fwd_cacheL1LHS: array[OBJSET_cacheL1LHS] of array[0..(C1_LHS_NET_MAX)-1] of Message;
      NET_resp_cacheL1LHS: array[OBJSET_cacheL1LHS] of array[0..(C1_LHS_NET_MAX)-1] of Message;
      NET_cacheL1LHS_cnt: array[OBJSET_cacheL1LHS] of 0..O_NET_MAX;
      NET_fwd_directoryL1LHS: array[OBJSET_directoryL1LHS] of array[0..1-1] of Message;
      NET_req_directoryL1LHS: array[OBJSET_directoryL1LHS] of array[0..(C1_LHS_NET_MAX)-1] of Message;
      NET_birsp_directoryL1LHS: array[OBJSET_directoryL1LHS] of array[0..(C1_LHS_NET_MAX)-1] of Message;
      NET_drs_directoryL1LHS: array[OBJSET_directoryL1LHS] of array[0..(C1_LHS_NET_MAX)-1] of Message;
      NET_rwd_directoryL1LHS: array[OBJSET_directoryL1LHS] of array[0..(C1_LHS_NET_MAX)-1] of Message;
      NET_req2_directoryL1LHS: array[OBJSET_directoryL1LHS] of array[0..(C1_LHS_NET_MAX)-1] of Message;
      NET_ndr_directoryL1LHS: array[OBJSET_directoryL1LHS] of array[0..(C1_LHS_NET_MAX)-1] of Message;
      NET_bisnp_directoryL1LHS: array[OBJSET_directoryL1LHS] of array[0..(C1_LHS_NET_MAX)-1] of Message;
      NET_resp_directoryL1LHS: array[OBJSET_directoryL1LHS] of array[0..(C1_LHS_NET_MAX)-1] of Message;
      NET_directoryL1LHS_cnt: array[OBJSET_directoryL1LHS] of 0..O_NET_MAX;
      NET_birsp_directoryL2LHS: array[OBJSET_directoryL2LHS] of array[0..(C2_LHS_NET_MAX)-1] of Message;
      NET_drs_directoryL2LHS: array[OBJSET_directoryL2LHS] of array[0..(C2_LHS_NET_MAX)-1] of Message;
      NET_rwd_directoryL2LHS: array[OBJSET_directoryL2LHS] of array[0..(C2_LHS_NET_MAX)-1] of Message;
      NET_req2_directoryL2LHS: array[OBJSET_directoryL2LHS] of array[0..(C2_LHS_NET_MAX)-1] of Message;
      NET_ndr_directoryL2LHS: array[OBJSET_directoryL2LHS] of array[0..(C2_LHS_NET_MAX)-1] of Message;
      NET_bisnp_directoryL2LHS: array[OBJSET_directoryL2LHS] of array[0..(C2_LHS_NET_MAX)-1] of Message;
      NET_directoryL2LHS_cnt: array[OBJSET_directoryL2LHS] of 0..O_NET_MAX;
      NET_birsp_cacheL2LHS: array[OBJSET_cacheL2LHS] of array[0..(C2_LHS_NET_MAX)-1] of Message;
      NET_drs_cacheL2LHS: array[OBJSET_cacheL2LHS] of array[0..(C2_LHS_NET_MAX)-1] of Message;
      NET_rwd_cacheL2LHS: array[OBJSET_cacheL2LHS] of array[0..(C2_LHS_NET_MAX)-1] of Message;
      NET_req2_cacheL2LHS: array[OBJSET_cacheL2LHS] of array[0..(C2_LHS_NET_MAX)-1] of Message;
      NET_ndr_cacheL2LHS: array[OBJSET_cacheL2LHS] of array[0..(C2_LHS_NET_MAX)-1] of Message;
      NET_bisnp_cacheL2LHS: array[OBJSET_cacheL2LHS] of array[0..(C2_LHS_NET_MAX)-1] of Message;
      NET_cacheL2LHS_cnt: array[OBJSET_cacheL2LHS] of 0..O_NET_MAX;
      NET_fwd_abstractionRHS: array[OBJSET_abstractionRHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_req_abstractionRHS: array[OBJSET_abstractionRHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_birsp_abstractionRHS: array[OBJSET_abstractionRHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_drs_abstractionRHS: array[OBJSET_abstractionRHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_rwd_abstractionRHS: array[OBJSET_abstractionRHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_req2_abstractionRHS: array[OBJSET_abstractionRHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_ndr_abstractionRHS: array[OBJSET_abstractionRHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_bisnp_abstractionRHS: array[OBJSET_abstractionRHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_resp_abstractionRHS: array[OBJSET_abstractionRHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_abstractionRHS_cnt: array[OBJSET_abstractionRHS] of 0..O_NET_MAX;
      NET_birsp_cacheL2RHS: array[OBJSET_cacheL2RHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_drs_cacheL2RHS: array[OBJSET_cacheL2RHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_rwd_cacheL2RHS: array[OBJSET_cacheL2RHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_req2_cacheL2RHS: array[OBJSET_cacheL2RHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_ndr_cacheL2RHS: array[OBJSET_cacheL2RHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_bisnp_cacheL2RHS: array[OBJSET_cacheL2RHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_cacheL2RHS_cnt: array[OBJSET_cacheL2RHS] of 0..O_NET_MAX;
      NET_birsp_directoryL2RHS: array[OBJSET_directoryL2RHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_drs_directoryL2RHS: array[OBJSET_directoryL2RHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_rwd_directoryL2RHS: array[OBJSET_directoryL2RHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_req2_directoryL2RHS: array[OBJSET_directoryL2RHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_ndr_directoryL2RHS: array[OBJSET_directoryL2RHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_bisnp_directoryL2RHS: array[OBJSET_directoryL2RHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_directoryL2RHS_cnt: array[OBJSET_directoryL2RHS] of 0..O_NET_MAX;
    
    ----Backend/Murphi/MurphiModular/Types/GenMachines
      
      ENTRY_cacheL2RHS: record
        State: s_cacheL2RHS;
        cl: ClValue;
      end;
      
      MACH_cacheL2RHS: record
        cb: array[Address] of ENTRY_cacheL2RHS;
      end;
      
      OBJ_cacheL2RHS: array[OBJSET_cacheL2RHS] of MACH_cacheL2RHS;
      v_cacheL1: record
        cacheL1LHS: array[OBJSET_cacheL1LHS] of boolean;
        directoryL2LHS: array[OBJSET_directoryL2LHS] of boolean;
        cacheL2LHS: array[OBJSET_cacheL2LHS] of boolean;
        abstractionRHS: array[OBJSET_abstractionRHS] of boolean;
        cacheL2RHS: array[OBJSET_cacheL2RHS] of boolean;
        directoryL2RHS: array[OBJSET_directoryL2RHS] of boolean;
      end;
      cnt_v_cacheL1: 0..NrCachesL1;
      
      ENTRY_directoryL1LHS: record
        State: s_directoryL1LHS;
        cl: ClValue;
        cacheL1: v_cacheL1;
        ownerL1: Machines;
        acksReceivedL1: 0..NrCachesL1;
        acksExpectedL1: 0..NrCachesL1;
        proxy_msgL1: Message;
        proxy_msgL2: Message;
      end;
      
      MACH_directoryL1LHS: record
        cb: array[Address] of ENTRY_directoryL1LHS;
      end;
      
      OBJ_directoryL1LHS: array[OBJSET_directoryL1LHS] of MACH_directoryL1LHS;
      v_cacheL2: record
        cacheL1LHS: array[OBJSET_cacheL1LHS] of boolean;
        directoryL1LHS: array[OBJSET_directoryL1LHS] of boolean;
        cacheL2LHS: array[OBJSET_cacheL2LHS] of boolean;
        abstractionRHS: array[OBJSET_abstractionRHS] of boolean;
        cacheL2RHS: array[OBJSET_cacheL2RHS] of boolean;
        directoryL2RHS: array[OBJSET_directoryL2RHS] of boolean;
      end;
      cnt_v_cacheL2: 0..NrCachesL2;
      
      ENTRY_directoryL2LHS: record
        State: s_directoryL2LHS;
        cl: ClValue;
        cacheL2: v_cacheL2;
        ownerL2: Machines;
        requestorL2: Machines;
      end;
      
      MACH_directoryL2LHS: record
        cb: array[Address] of ENTRY_directoryL2LHS;
      end;
      
      OBJ_directoryL2LHS: array[OBJSET_directoryL2LHS] of MACH_directoryL2LHS;
      
      ENTRY_directoryL2RHS: record
        State: s_directoryL2RHS;
        cl: ClValue;
        cacheL2: v_cacheL2;
        ownerL2: Machines;
        requestorL2: Machines;
      end;
      
      MACH_directoryL2RHS: record
        cb: array[Address] of ENTRY_directoryL2RHS;
      end;
      
      OBJ_directoryL2RHS: array[OBJSET_directoryL2RHS] of MACH_directoryL2RHS;
      
      ENTRY_cacheL2LHS: record
        State: s_cacheL2LHS;
        cl: ClValue;
      end;
      
      MACH_cacheL2LHS: record
        cb: array[Address] of ENTRY_cacheL2LHS;
      end;
      
      OBJ_cacheL2LHS: array[OBJSET_cacheL2LHS] of MACH_cacheL2LHS;
      
      ENTRY_abstractionRHS: record
        State: s_abstractionRHS;
        cl: ClValue;
      end;
      
      MACH_abstractionRHS: record
        cb: array[Address] of ENTRY_abstractionRHS;
      end;
      
      OBJ_abstractionRHS: array[OBJSET_abstractionRHS] of MACH_abstractionRHS;
      
      ENTRY_cacheL1LHS: record
        State: s_cacheL1LHS;
        cl: ClValue;
        acksReceivedL1: 0..NrCachesL1;
        acksExpectedL1: 0..NrCachesL1;
      end;
      
      MACH_cacheL1LHS: record
        cb: array[Address] of ENTRY_cacheL1LHS;
      end;
      
      OBJ_cacheL1LHS: array[OBJSET_cacheL1LHS] of MACH_cacheL1LHS;
    

  var
    --Backend/Murphi/MurphiModular/GenVars
      g_system_state: SystemStates;
      g_progress_tracking: boolean;
      resp_cacheL1LHS: NET_resp_cacheL1LHS;
      cnt_resp_cacheL1LHS: NET_cacheL1LHS_cnt;
      fwd_cacheL1LHS: NET_fwd_cacheL1LHS;
      cnt_fwd_cacheL1LHS: NET_cacheL1LHS_cnt;
    
      resp_directoryL1LHS: NET_resp_directoryL1LHS;
      cnt_resp_directoryL1LHS: NET_directoryL1LHS_cnt;
      req_directoryL1LHS: NET_req_directoryL1LHS;
      cnt_req_directoryL1LHS: NET_directoryL1LHS_cnt;
      fwd_directoryL1LHS: NET_fwd_directoryL1LHS;
      cnt_fwd_directoryL1LHS: NET_directoryL1LHS_cnt;
      bisnp_directoryL1LHS: NET_bisnp_directoryL1LHS;
      cnt_bisnp_directoryL1LHS: NET_directoryL1LHS_cnt;
      req2_directoryL1LHS: NET_req2_directoryL1LHS;
      cnt_req2_directoryL1LHS: NET_directoryL1LHS_cnt;
      rwd_directoryL1LHS: NET_rwd_directoryL1LHS;
      cnt_rwd_directoryL1LHS: NET_directoryL1LHS_cnt;
      birsp_directoryL1LHS: NET_birsp_directoryL1LHS;
      cnt_birsp_directoryL1LHS: NET_directoryL1LHS_cnt;
      drs_directoryL1LHS: NET_drs_directoryL1LHS;
      cnt_drs_directoryL1LHS: NET_directoryL1LHS_cnt;
      ndr_directoryL1LHS: NET_ndr_directoryL1LHS;
      cnt_ndr_directoryL1LHS: NET_directoryL1LHS_cnt;
    
      bisnp_directoryL2LHS: NET_bisnp_directoryL2LHS;
      cnt_bisnp_directoryL2LHS: NET_directoryL2LHS_cnt;
      req2_directoryL2LHS: NET_req2_directoryL2LHS;
      cnt_req2_directoryL2LHS: NET_directoryL2LHS_cnt;
      rwd_directoryL2LHS: NET_rwd_directoryL2LHS;
      cnt_rwd_directoryL2LHS: NET_directoryL2LHS_cnt;
      birsp_directoryL2LHS: NET_birsp_directoryL2LHS;
      cnt_birsp_directoryL2LHS: NET_directoryL2LHS_cnt;
      drs_directoryL2LHS: NET_drs_directoryL2LHS;
      cnt_drs_directoryL2LHS: NET_directoryL2LHS_cnt;
      ndr_directoryL2LHS: NET_ndr_directoryL2LHS;
      cnt_ndr_directoryL2LHS: NET_directoryL2LHS_cnt;
    
      bisnp_cacheL2LHS: NET_bisnp_cacheL2LHS;
      cnt_bisnp_cacheL2LHS: NET_cacheL2LHS_cnt;
      req2_cacheL2LHS: NET_req2_cacheL2LHS;
      cnt_req2_cacheL2LHS: NET_cacheL2LHS_cnt;
      rwd_cacheL2LHS: NET_rwd_cacheL2LHS;
      cnt_rwd_cacheL2LHS: NET_cacheL2LHS_cnt;
      birsp_cacheL2LHS: NET_birsp_cacheL2LHS;
      cnt_birsp_cacheL2LHS: NET_cacheL2LHS_cnt;
      drs_cacheL2LHS: NET_drs_cacheL2LHS;
      cnt_drs_cacheL2LHS: NET_cacheL2LHS_cnt;
      ndr_cacheL2LHS: NET_ndr_cacheL2LHS;
      cnt_ndr_cacheL2LHS: NET_cacheL2LHS_cnt;
    
      resp_abstractionRHS: NET_resp_abstractionRHS;
      cnt_resp_abstractionRHS: NET_abstractionRHS_cnt;
      resp_abstractionRHS_BKUP: NET_resp_abstractionRHS;
      cnt_resp_abstractionRHS_BKUP: NET_abstractionRHS_cnt;
      req_abstractionRHS: NET_req_abstractionRHS;
      cnt_req_abstractionRHS: NET_abstractionRHS_cnt;
      req_abstractionRHS_BKUP: NET_req_abstractionRHS;
      cnt_req_abstractionRHS_BKUP: NET_abstractionRHS_cnt;
      fwd_abstractionRHS: NET_fwd_abstractionRHS;
      cnt_fwd_abstractionRHS: NET_abstractionRHS_cnt;
      fwd_abstractionRHS_BKUP: NET_fwd_abstractionRHS;
      cnt_fwd_abstractionRHS_BKUP: NET_abstractionRHS_cnt;
      bisnp_abstractionRHS: NET_bisnp_abstractionRHS;
      cnt_bisnp_abstractionRHS: NET_abstractionRHS_cnt;
      bisnp_abstractionRHS_BKUP: NET_bisnp_abstractionRHS;
      cnt_bisnp_abstractionRHS_BKUP: NET_abstractionRHS_cnt;
      req2_abstractionRHS: NET_req2_abstractionRHS;
      cnt_req2_abstractionRHS: NET_abstractionRHS_cnt;
      req2_abstractionRHS_BKUP: NET_req2_abstractionRHS;
      cnt_req2_abstractionRHS_BKUP: NET_abstractionRHS_cnt;
      rwd_abstractionRHS: NET_rwd_abstractionRHS;
      cnt_rwd_abstractionRHS: NET_abstractionRHS_cnt;
      rwd_abstractionRHS_BKUP: NET_rwd_abstractionRHS;
      cnt_rwd_abstractionRHS_BKUP: NET_abstractionRHS_cnt;
      birsp_abstractionRHS: NET_birsp_abstractionRHS;
      cnt_birsp_abstractionRHS: NET_abstractionRHS_cnt;
      birsp_abstractionRHS_BKUP: NET_birsp_abstractionRHS;
      cnt_birsp_abstractionRHS_BKUP: NET_abstractionRHS_cnt;
      drs_abstractionRHS: NET_drs_abstractionRHS;
      cnt_drs_abstractionRHS: NET_abstractionRHS_cnt;
      drs_abstractionRHS_BKUP: NET_drs_abstractionRHS;
      cnt_drs_abstractionRHS_BKUP: NET_abstractionRHS_cnt;
      ndr_abstractionRHS: NET_ndr_abstractionRHS;
      cnt_ndr_abstractionRHS: NET_abstractionRHS_cnt;
      ndr_abstractionRHS_BKUP: NET_ndr_abstractionRHS;
      cnt_ndr_abstractionRHS_BKUP: NET_abstractionRHS_cnt;
    
      bisnp_cacheL2RHS: NET_bisnp_cacheL2RHS;
      cnt_bisnp_cacheL2RHS: NET_cacheL2RHS_cnt;
      bisnp_cacheL2RHS_BKUP: NET_bisnp_cacheL2RHS;
      cnt_bisnp_cacheL2RHS_BKUP: NET_cacheL2RHS_cnt;
      req2_cacheL2RHS: NET_req2_cacheL2RHS;
      cnt_req2_cacheL2RHS: NET_cacheL2RHS_cnt;
      req2_cacheL2RHS_BKUP: NET_req2_cacheL2RHS;
      cnt_req2_cacheL2RHS_BKUP: NET_cacheL2RHS_cnt;
      rwd_cacheL2RHS: NET_rwd_cacheL2RHS;
      cnt_rwd_cacheL2RHS: NET_cacheL2RHS_cnt;
      rwd_cacheL2RHS_BKUP: NET_rwd_cacheL2RHS;
      cnt_rwd_cacheL2RHS_BKUP: NET_cacheL2RHS_cnt;
      birsp_cacheL2RHS: NET_birsp_cacheL2RHS;
      cnt_birsp_cacheL2RHS: NET_cacheL2RHS_cnt;
      birsp_cacheL2RHS_BKUP: NET_birsp_cacheL2RHS;
      cnt_birsp_cacheL2RHS_BKUP: NET_cacheL2RHS_cnt;
      drs_cacheL2RHS: NET_drs_cacheL2RHS;
      cnt_drs_cacheL2RHS: NET_cacheL2RHS_cnt;
      drs_cacheL2RHS_BKUP: NET_drs_cacheL2RHS;
      cnt_drs_cacheL2RHS_BKUP: NET_cacheL2RHS_cnt;
      ndr_cacheL2RHS: NET_ndr_cacheL2RHS;
      cnt_ndr_cacheL2RHS: NET_cacheL2RHS_cnt;
      ndr_cacheL2RHS_BKUP: NET_ndr_cacheL2RHS;
      cnt_ndr_cacheL2RHS_BKUP: NET_cacheL2RHS_cnt;
    
      bisnp_directoryL2RHS: NET_bisnp_directoryL2RHS;
      cnt_bisnp_directoryL2RHS: NET_directoryL2RHS_cnt;
      bisnp_directoryL2RHS_BKUP: NET_bisnp_directoryL2RHS;
      cnt_bisnp_directoryL2RHS_BKUP: NET_directoryL2RHS_cnt;
      req2_directoryL2RHS: NET_req2_directoryL2RHS;
      cnt_req2_directoryL2RHS: NET_directoryL2RHS_cnt;
      req2_directoryL2RHS_BKUP: NET_req2_directoryL2RHS;
      cnt_req2_directoryL2RHS_BKUP: NET_directoryL2RHS_cnt;
      rwd_directoryL2RHS: NET_rwd_directoryL2RHS;
      cnt_rwd_directoryL2RHS: NET_directoryL2RHS_cnt;
      rwd_directoryL2RHS_BKUP: NET_rwd_directoryL2RHS;
      cnt_rwd_directoryL2RHS_BKUP: NET_directoryL2RHS_cnt;
      birsp_directoryL2RHS: NET_birsp_directoryL2RHS;
      cnt_birsp_directoryL2RHS: NET_directoryL2RHS_cnt;
      birsp_directoryL2RHS_BKUP: NET_birsp_directoryL2RHS;
      cnt_birsp_directoryL2RHS_BKUP: NET_directoryL2RHS_cnt;
      drs_directoryL2RHS: NET_drs_directoryL2RHS;
      cnt_drs_directoryL2RHS: NET_directoryL2RHS_cnt;
      drs_directoryL2RHS_BKUP: NET_drs_directoryL2RHS;
      cnt_drs_directoryL2RHS_BKUP: NET_directoryL2RHS_cnt;
      ndr_directoryL2RHS: NET_ndr_directoryL2RHS;
      cnt_ndr_directoryL2RHS: NET_directoryL2RHS_cnt;
      ndr_directoryL2RHS_BKUP: NET_ndr_directoryL2RHS;
      cnt_ndr_directoryL2RHS_BKUP: NET_directoryL2RHS_cnt;
    
    
    
      g_perm: PermMonitor;
      i_cacheL2RHS: OBJ_cacheL2RHS;
      i_cacheL2RHS_BKUP: OBJ_cacheL2RHS;
      i_directoryL1LHS: OBJ_directoryL1LHS;
      i_directoryL2LHS: OBJ_directoryL2LHS;
      i_directoryL2RHS: OBJ_directoryL2RHS;
      i_directoryL2RHS_BKUP: OBJ_directoryL2RHS;
      i_cacheL2LHS: OBJ_cacheL2LHS;
      i_abstractionRHS: OBJ_abstractionRHS;
      i_abstractionRHS_BKUP: OBJ_abstractionRHS;
      i_cacheL1LHS: OBJ_cacheL1LHS;
  
--Backend/Murphi/MurphiModular/GenFunctions

  ----Backend/Murphi/MurphiModular/Functions/GenTypeFunc
    function to_m_cacheL1LHS(o: OBJSET_cacheL1LHS) : Machines;
    var m: Machines;
    begin
      undefine m;
      m.cacheL1LHS := o;
      return m;
    end
    
    function from_m_cacheL1LHS(m: Machines) : OBJSET_cacheL1LHS;
    begin
      return m.cacheL1LHS;
    end
    
    function to_m_directoryL1LHS(o: OBJSET_directoryL1LHS) : Machines;
    var m: Machines;
    begin
      undefine m;
      m.directoryL1LHS := o;
      return m;
    end
    
    function from_m_directoryL1LHS(m: Machines) : OBJSET_directoryL1LHS;
    begin
      return m.directoryL1LHS;
    end
    
    function to_m_directoryL2LHS(o: OBJSET_directoryL2LHS) : Machines;
    var m: Machines;
    begin
      undefine m;
      m.directoryL2LHS := o;
      return m;
    end
    
    function from_m_directoryL2LHS(m: Machines) : OBJSET_directoryL2LHS;
    begin
      return m.directoryL2LHS;
    end
    
    function to_m_cacheL2LHS(o: OBJSET_cacheL2LHS) : Machines;
    var m: Machines;
    begin
      undefine m;
      m.cacheL2LHS := o;
      return m;
    end
    
    function from_m_cacheL2LHS(m: Machines) : OBJSET_cacheL2LHS;
    begin
      return m.cacheL2LHS;
    end
    
    function to_m_abstractionRHS(o: OBJSET_abstractionRHS) : Machines;
    var m: Machines;
    begin
      undefine m;
      m.abstractionRHS := o;
      return m;
    end
    
    function from_m_abstractionRHS(m: Machines) : OBJSET_abstractionRHS;
    begin
      return m.abstractionRHS;
    end
    
    function to_m_cacheL2RHS(o: OBJSET_cacheL2RHS) : Machines;
    var m: Machines;
    begin
      undefine m;
      m.cacheL2RHS := o;
      return m;
    end
    
    function from_m_cacheL2RHS(m: Machines) : OBJSET_cacheL2RHS;
    begin
      return m.cacheL2RHS;
    end
    
    function to_m_directoryL2RHS(o: OBJSET_directoryL2RHS) : Machines;
    var m: Machines;
    begin
      undefine m;
      m.directoryL2RHS := o;
      return m;
    end
    
    function from_m_directoryL2RHS(m: Machines) : OBJSET_directoryL2RHS;
    begin
      return m.directoryL2RHS;
    end
    
  ----Backend/Murphi/MurphiModular/Functions/GenEQCheckMappingFunc
    function map_LHS_to_RHS(m: Machines): Machines
    var ret: Machines;
    begin
      undefine ret;
      if !isundefined(m.directoryL1LHS) then
        ret.abstractionRHS := abstractionRHS;
        return ret;
      endif; 
      if !isundefined(m.cacheL2LHS) then
        ret.cacheL2RHS := m.cacheL2LHS;
        return ret;
      endif;
      if !isundefined(m.directoryL2LHS) then
        ret.directoryL2RHS := m.directoryL2LHS;
        return ret;
      endif;
    
      
      return ret;
    end;
  
    function map_directoryL1LHS_to_abstractionRHS(m: OBJSET_directoryL1LHS): OBJSET_abstractionRHS
    begin
      return from_m_abstractionRHS(map_LHS_to_RHS(to_m_directoryL1LHS(m)));
    end;
  
    function map_directoryL2LHS_to_directoryL2RHS(m: OBJSET_directoryL2LHS): OBJSET_directoryL2RHS
    begin
      return from_m_directoryL2RHS(map_LHS_to_RHS(to_m_directoryL2LHS(m)));
    end;
  
    function map_cacheL2LHS_to_cacheL2RHS(m: OBJSET_cacheL2LHS): OBJSET_cacheL2RHS
    begin
      return from_m_cacheL2RHS(map_LHS_to_RHS(to_m_cacheL2LHS(m)));
    end;
  
    ----Backend/Murphi/MurphiModular/Functions/GenEQCheckMappingFunc : StateAssociation
    function is_machine_in_state(m: Machines; s: SystemStates): boolean;
    begin
      if s = systemLHS then
        if !isundefined(m.directoryL1LHS) then
          return true;
        endif;
        if !isundefined(m.cacheL1LHS) then
          return true;
        endif;
        return false;
      endif;
      if s = systemRHS then
        if !isundefined(m.abstractionRHS) then
          return true;
        endif;
        return false;
      endif;
      if s = systemLHSExt then
        if !isundefined(m.cacheL2LHS) then
          return true;
        endif;
        if !isundefined(m.directoryL2LHS) then
          return true;
        endif;
        return false;
      endif;
      if s = systemRHSExt then
        if !isundefined(m.directoryL2RHS) then
          return true;
        endif;
        if !isundefined(m.cacheL2RHS) then
          return true;
        endif;
        return false;
      endif;
      
      error "is_machine_in_state"
    end;
  
    ----Backend/Murphi/MurphiModular/Functions/GenEQCheckMappingFunc : MessageComparisonFunctions
      function map_LHS_msg_to_RHS(lhs_m: Message): Message;
      var rhs_m: Message
      begin
      
        if isundefined(lhs_m.adr) then
          undefine rhs_m.adr;
        else
          rhs_m.adr := lhs_m.adr;
        endif;
        if isundefined(lhs_m.mtype) then
          undefine rhs_m.mtype;
        else
          rhs_m.mtype := lhs_m.mtype;
        endif;
        undefine rhs_m.src;
        rhs_m.src := map_LHS_to_RHS(lhs_m.src);
        undefine rhs_m.dst;
        rhs_m.dst := map_LHS_to_RHS(lhs_m.dst);
        if isundefined(lhs_m.acksExpectedL1) then
          undefine rhs_m.acksExpectedL1;
        else
          rhs_m.acksExpectedL1 := lhs_m.acksExpectedL1;
        endif;
        if isundefined(lhs_m.acksExpectedL1) then
          undefine rhs_m.acksExpectedL1;
        else
          rhs_m.acksExpectedL1 := lhs_m.acksExpectedL1;
        endif;
        if isundefined(lhs_m.cl) then
          undefine rhs_m.cl;
        else
          rhs_m.cl := lhs_m.cl;
        endif;
      
        return rhs_m;
      end;
      
      function is_LHS_msg_eq_RHS(lhs_m: Message; rhs_m: Message): boolean;
      begin
        
        if isundefined(lhs_m.adr) & !isundefined(rhs_m.adr) then
          return false;
        elsif !isundefined(lhs_m.adr) & isundefined(rhs_m.adr) then
          return false; 
        elsif !isundefined(lhs_m.adr) & !isundefined(rhs_m.adr)  then
          if lhs_m.adr != rhs_m.adr then
            return false;
          endif;
        endif;
        
        if isundefined(lhs_m.mtype) & !isundefined(rhs_m.mtype) then
          return false;
        elsif !isundefined(lhs_m.mtype) & isundefined(rhs_m.mtype) then
          return false; 
        elsif !isundefined(lhs_m.mtype) & !isundefined(rhs_m.mtype)  then
          if lhs_m.mtype != rhs_m.mtype then
            return false;
          endif;
        endif;
        
        if map_LHS_to_RHS(lhs_m.src) != rhs_m.src then
          return false;
        endif;
        
        if map_LHS_to_RHS(lhs_m.dst) != rhs_m.dst then
          return false;
        endif;
        
        if isundefined(lhs_m.acksExpectedL1) & !isundefined(rhs_m.acksExpectedL1) then
          return false;
        elsif !isundefined(lhs_m.acksExpectedL1) & isundefined(rhs_m.acksExpectedL1) then
          return false; 
        elsif !isundefined(lhs_m.acksExpectedL1) & !isundefined(rhs_m.acksExpectedL1)  then
          if lhs_m.acksExpectedL1 != rhs_m.acksExpectedL1 then
            return false;
          endif;
        endif;
      
        if isundefined(lhs_m.acksExpectedL1) & !isundefined(rhs_m.acksExpectedL1) then
          return false;
        elsif !isundefined(lhs_m.acksExpectedL1) & isundefined(rhs_m.acksExpectedL1) then
          return false; 
        elsif !isundefined(lhs_m.acksExpectedL1) & !isundefined(rhs_m.acksExpectedL1)  then
          if lhs_m.acksExpectedL1 != rhs_m.acksExpectedL1 then
            return false;
          endif;
        endif;
        
        if isundefined(lhs_m.cl) & !isundefined(rhs_m.cl) then
          return false;
        elsif !isundefined(lhs_m.cl) & isundefined(rhs_m.cl) then
          return false; 
        elsif !isundefined(lhs_m.cl) & !isundefined(rhs_m.cl)  then
          if lhs_m.cl != rhs_m.cl then
            return false;
          endif;
        endif;
      
        return true;
      end;
  
    ----Backend/Murphi/MurphiModular/Functions/GenEQCheckMappingFunc : BackupFunctions
      procedure BackupRHS();
      begin
        for elem : OBJSET_cacheL2RHS do 
          i_cacheL2RHS_BKUP[elem] := i_cacheL2RHS[elem];
      
          undefine req2_cacheL2RHS_BKUP[elem];
          cnt_req2_cacheL2RHS_BKUP[elem] := cnt_req2_cacheL2RHS[elem];
          if cnt_req2_cacheL2RHS[elem] > 0 then
            for idx := 0 to cnt_req2_cacheL2RHS[elem]-1 do  
              req2_cacheL2RHS_BKUP[elem][idx] := (req2_cacheL2RHS[elem][idx]);
            endfor;
          endif;
      
          undefine rwd_cacheL2RHS_BKUP[elem];
          cnt_rwd_cacheL2RHS_BKUP[elem] := cnt_rwd_cacheL2RHS[elem];
          if cnt_rwd_cacheL2RHS[elem] > 0 then
            for idx := 0 to cnt_rwd_cacheL2RHS[elem]-1 do  
              rwd_cacheL2RHS_BKUP[elem][idx] := (rwd_cacheL2RHS[elem][idx]);
            endfor;
          endif;
      
          undefine birsp_cacheL2RHS_BKUP[elem];
          cnt_birsp_cacheL2RHS_BKUP[elem] := cnt_birsp_cacheL2RHS[elem];
          if cnt_birsp_cacheL2RHS[elem] > 0 then
            for idx := 0 to cnt_birsp_cacheL2RHS[elem]-1 do  
              birsp_cacheL2RHS_BKUP[elem][idx] := (birsp_cacheL2RHS[elem][idx]);
            endfor;
          endif;
      
          undefine bisnp_cacheL2RHS_BKUP[elem];
          cnt_bisnp_cacheL2RHS_BKUP[elem] := cnt_bisnp_cacheL2RHS[elem];
          if cnt_bisnp_cacheL2RHS[elem] > 0 then
            for idx := 0 to cnt_bisnp_cacheL2RHS[elem]-1 do  
              bisnp_cacheL2RHS_BKUP[elem][idx] := (bisnp_cacheL2RHS[elem][idx]);
            endfor;
          endif;
      
          undefine drs_cacheL2RHS_BKUP[elem];
          cnt_drs_cacheL2RHS_BKUP[elem] := cnt_drs_cacheL2RHS[elem];
          if cnt_drs_cacheL2RHS[elem] > 0 then
            for idx := 0 to cnt_drs_cacheL2RHS[elem]-1 do  
              drs_cacheL2RHS_BKUP[elem][idx] := (drs_cacheL2RHS[elem][idx]);
            endfor;
          endif;
      
          undefine ndr_cacheL2RHS_BKUP[elem];
          cnt_ndr_cacheL2RHS_BKUP[elem] := cnt_ndr_cacheL2RHS[elem];
          if cnt_ndr_cacheL2RHS[elem] > 0 then
            for idx := 0 to cnt_ndr_cacheL2RHS[elem]-1 do  
              ndr_cacheL2RHS_BKUP[elem][idx] := (ndr_cacheL2RHS[elem][idx]);
            endfor;
          endif;
      
        endfor;
        for elem : OBJSET_abstractionRHS do 
          i_abstractionRHS_BKUP[elem] := i_abstractionRHS[elem];
      
          undefine req_abstractionRHS_BKUP[elem];
          cnt_req_abstractionRHS_BKUP[elem] := cnt_req_abstractionRHS[elem];
          if cnt_req_abstractionRHS[elem] > 0 then
            for idx := 0 to cnt_req_abstractionRHS[elem]-1 do  
              req_abstractionRHS_BKUP[elem][idx] := (req_abstractionRHS[elem][idx]);
            endfor;
          endif;
      
          undefine req2_abstractionRHS_BKUP[elem];
          cnt_req2_abstractionRHS_BKUP[elem] := cnt_req2_abstractionRHS[elem];
          if cnt_req2_abstractionRHS[elem] > 0 then
            for idx := 0 to cnt_req2_abstractionRHS[elem]-1 do  
              req2_abstractionRHS_BKUP[elem][idx] := (req2_abstractionRHS[elem][idx]);
            endfor;
          endif;
      
          undefine resp_abstractionRHS_BKUP[elem];
          cnt_resp_abstractionRHS_BKUP[elem] := cnt_resp_abstractionRHS[elem];
          if cnt_resp_abstractionRHS[elem] > 0 then
            for idx := 0 to cnt_resp_abstractionRHS[elem]-1 do  
              resp_abstractionRHS_BKUP[elem][idx] := (resp_abstractionRHS[elem][idx]);
            endfor;
          endif;
      
          undefine fwd_abstractionRHS_BKUP[elem];
          cnt_fwd_abstractionRHS_BKUP[elem] := cnt_fwd_abstractionRHS[elem];
          if cnt_fwd_abstractionRHS[elem] > 0 then
            for idx := 0 to cnt_fwd_abstractionRHS[elem]-1 do  
              fwd_abstractionRHS_BKUP[elem][idx] := (fwd_abstractionRHS[elem][idx]);
            endfor;
          endif;
      
          undefine rwd_abstractionRHS_BKUP[elem];
          cnt_rwd_abstractionRHS_BKUP[elem] := cnt_rwd_abstractionRHS[elem];
          if cnt_rwd_abstractionRHS[elem] > 0 then
            for idx := 0 to cnt_rwd_abstractionRHS[elem]-1 do  
              rwd_abstractionRHS_BKUP[elem][idx] := (rwd_abstractionRHS[elem][idx]);
            endfor;
          endif;
      
          undefine birsp_abstractionRHS_BKUP[elem];
          cnt_birsp_abstractionRHS_BKUP[elem] := cnt_birsp_abstractionRHS[elem];
          if cnt_birsp_abstractionRHS[elem] > 0 then
            for idx := 0 to cnt_birsp_abstractionRHS[elem]-1 do  
              birsp_abstractionRHS_BKUP[elem][idx] := (birsp_abstractionRHS[elem][idx]);
            endfor;
          endif;
      
          undefine bisnp_abstractionRHS_BKUP[elem];
          cnt_bisnp_abstractionRHS_BKUP[elem] := cnt_bisnp_abstractionRHS[elem];
          if cnt_bisnp_abstractionRHS[elem] > 0 then
            for idx := 0 to cnt_bisnp_abstractionRHS[elem]-1 do  
              bisnp_abstractionRHS_BKUP[elem][idx] := (bisnp_abstractionRHS[elem][idx]);
            endfor;
          endif;
      
          undefine drs_abstractionRHS_BKUP[elem];
          cnt_drs_abstractionRHS_BKUP[elem] := cnt_drs_abstractionRHS[elem];
          if cnt_drs_abstractionRHS[elem] > 0 then
            for idx := 0 to cnt_drs_abstractionRHS[elem]-1 do  
              drs_abstractionRHS_BKUP[elem][idx] := (drs_abstractionRHS[elem][idx]);
            endfor;
          endif;
      
          undefine ndr_abstractionRHS_BKUP[elem];
          cnt_ndr_abstractionRHS_BKUP[elem] := cnt_ndr_abstractionRHS[elem];
          if cnt_ndr_abstractionRHS[elem] > 0 then
            for idx := 0 to cnt_ndr_abstractionRHS[elem]-1 do  
              ndr_abstractionRHS_BKUP[elem][idx] := (ndr_abstractionRHS[elem][idx]);
            endfor;
          endif;
      
        endfor;
        for elem : OBJSET_directoryL2RHS do 
          i_directoryL2RHS_BKUP[elem] := i_directoryL2RHS[elem];
      
          undefine req2_directoryL2RHS_BKUP[elem];
          cnt_req2_directoryL2RHS_BKUP[elem] := cnt_req2_directoryL2RHS[elem];
          if cnt_req2_directoryL2RHS[elem] > 0 then
            for idx := 0 to cnt_req2_directoryL2RHS[elem]-1 do  
              req2_directoryL2RHS_BKUP[elem][idx] := (req2_directoryL2RHS[elem][idx]);
            endfor;
          endif;
      
          undefine rwd_directoryL2RHS_BKUP[elem];
          cnt_rwd_directoryL2RHS_BKUP[elem] := cnt_rwd_directoryL2RHS[elem];
          if cnt_rwd_directoryL2RHS[elem] > 0 then
            for idx := 0 to cnt_rwd_directoryL2RHS[elem]-1 do  
              rwd_directoryL2RHS_BKUP[elem][idx] := (rwd_directoryL2RHS[elem][idx]);
            endfor;
          endif;
      
          undefine birsp_directoryL2RHS_BKUP[elem];
          cnt_birsp_directoryL2RHS_BKUP[elem] := cnt_birsp_directoryL2RHS[elem];
          if cnt_birsp_directoryL2RHS[elem] > 0 then
            for idx := 0 to cnt_birsp_directoryL2RHS[elem]-1 do  
              birsp_directoryL2RHS_BKUP[elem][idx] := (birsp_directoryL2RHS[elem][idx]);
            endfor;
          endif;
      
          undefine bisnp_directoryL2RHS_BKUP[elem];
          cnt_bisnp_directoryL2RHS_BKUP[elem] := cnt_bisnp_directoryL2RHS[elem];
          if cnt_bisnp_directoryL2RHS[elem] > 0 then
            for idx := 0 to cnt_bisnp_directoryL2RHS[elem]-1 do  
              bisnp_directoryL2RHS_BKUP[elem][idx] := (bisnp_directoryL2RHS[elem][idx]);
            endfor;
          endif;
      
          undefine drs_directoryL2RHS_BKUP[elem];
          cnt_drs_directoryL2RHS_BKUP[elem] := cnt_drs_directoryL2RHS[elem];
          if cnt_drs_directoryL2RHS[elem] > 0 then
            for idx := 0 to cnt_drs_directoryL2RHS[elem]-1 do  
              drs_directoryL2RHS_BKUP[elem][idx] := (drs_directoryL2RHS[elem][idx]);
            endfor;
          endif;
      
          undefine ndr_directoryL2RHS_BKUP[elem];
          cnt_ndr_directoryL2RHS_BKUP[elem] := cnt_ndr_directoryL2RHS[elem];
          if cnt_ndr_directoryL2RHS[elem] > 0 then
            for idx := 0 to cnt_ndr_directoryL2RHS[elem]-1 do  
              ndr_directoryL2RHS_BKUP[elem][idx] := (ndr_directoryL2RHS[elem][idx]);
            endfor;
          endif;
      
        endfor;
      end;
      
      procedure RestoreRHSBackup();
      begin
        for elem : OBJSET_cacheL2RHS do 
          i_cacheL2RHS[elem] := i_cacheL2RHS_BKUP[elem];
      
          undefine req2_cacheL2RHS[elem];
          cnt_req2_cacheL2RHS[elem] := cnt_req2_cacheL2RHS_BKUP[elem];
          if cnt_req2_cacheL2RHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_req2_cacheL2RHS_BKUP[elem]-1 do  
              req2_cacheL2RHS[elem][idx] := (req2_cacheL2RHS_BKUP[elem][idx]);
            endfor;
          endif;
      
          undefine rwd_cacheL2RHS[elem];
          cnt_rwd_cacheL2RHS[elem] := cnt_rwd_cacheL2RHS_BKUP[elem];
          if cnt_rwd_cacheL2RHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_rwd_cacheL2RHS_BKUP[elem]-1 do  
              rwd_cacheL2RHS[elem][idx] := (rwd_cacheL2RHS_BKUP[elem][idx]);
            endfor;
          endif;
      
          undefine birsp_cacheL2RHS[elem];
          cnt_birsp_cacheL2RHS[elem] := cnt_birsp_cacheL2RHS_BKUP[elem];
          if cnt_birsp_cacheL2RHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_birsp_cacheL2RHS_BKUP[elem]-1 do  
              birsp_cacheL2RHS[elem][idx] := (birsp_cacheL2RHS_BKUP[elem][idx]);
            endfor;
          endif;
      
          undefine bisnp_cacheL2RHS[elem];
          cnt_bisnp_cacheL2RHS[elem] := cnt_bisnp_cacheL2RHS_BKUP[elem];
          if cnt_bisnp_cacheL2RHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_bisnp_cacheL2RHS_BKUP[elem]-1 do  
              bisnp_cacheL2RHS[elem][idx] := (bisnp_cacheL2RHS_BKUP[elem][idx]);
            endfor;
          endif;
      
          undefine drs_cacheL2RHS[elem];
          cnt_drs_cacheL2RHS[elem] := cnt_drs_cacheL2RHS_BKUP[elem];
          if cnt_drs_cacheL2RHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_drs_cacheL2RHS_BKUP[elem]-1 do  
              drs_cacheL2RHS[elem][idx] := (drs_cacheL2RHS_BKUP[elem][idx]);
            endfor;
          endif;
      
          undefine ndr_cacheL2RHS[elem];
          cnt_ndr_cacheL2RHS[elem] := cnt_ndr_cacheL2RHS_BKUP[elem];
          if cnt_ndr_cacheL2RHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_ndr_cacheL2RHS_BKUP[elem]-1 do  
              ndr_cacheL2RHS[elem][idx] := (ndr_cacheL2RHS_BKUP[elem][idx]);
            endfor;
          endif;
      
        endfor;
        for elem : OBJSET_abstractionRHS do 
          i_abstractionRHS[elem] := i_abstractionRHS_BKUP[elem];
      
          undefine req_abstractionRHS[elem];
          cnt_req_abstractionRHS[elem] := cnt_req_abstractionRHS_BKUP[elem];
          if cnt_req_abstractionRHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_req_abstractionRHS_BKUP[elem]-1 do  
              req_abstractionRHS[elem][idx] := (req_abstractionRHS_BKUP[elem][idx]);
            endfor;
          endif;
      
          undefine req2_abstractionRHS[elem];
          cnt_req2_abstractionRHS[elem] := cnt_req2_abstractionRHS_BKUP[elem];
          if cnt_req2_abstractionRHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_req2_abstractionRHS_BKUP[elem]-1 do  
              req2_abstractionRHS[elem][idx] := (req2_abstractionRHS_BKUP[elem][idx]);
            endfor;
          endif;
      
          undefine resp_abstractionRHS[elem];
          cnt_resp_abstractionRHS[elem] := cnt_resp_abstractionRHS_BKUP[elem];
          if cnt_resp_abstractionRHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_resp_abstractionRHS_BKUP[elem]-1 do  
              resp_abstractionRHS[elem][idx] := (resp_abstractionRHS_BKUP[elem][idx]);
            endfor;
          endif;
      
          undefine fwd_abstractionRHS[elem];
          cnt_fwd_abstractionRHS[elem] := cnt_fwd_abstractionRHS_BKUP[elem];
          if cnt_fwd_abstractionRHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_fwd_abstractionRHS_BKUP[elem]-1 do  
              fwd_abstractionRHS[elem][idx] := (fwd_abstractionRHS_BKUP[elem][idx]);
            endfor;
          endif;
      
          undefine rwd_abstractionRHS[elem];
          cnt_rwd_abstractionRHS[elem] := cnt_rwd_abstractionRHS_BKUP[elem];
          if cnt_rwd_abstractionRHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_rwd_abstractionRHS_BKUP[elem]-1 do  
              rwd_abstractionRHS[elem][idx] := (rwd_abstractionRHS_BKUP[elem][idx]);
            endfor;
          endif;
      
          undefine birsp_abstractionRHS[elem];
          cnt_birsp_abstractionRHS[elem] := cnt_birsp_abstractionRHS_BKUP[elem];
          if cnt_birsp_abstractionRHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_birsp_abstractionRHS_BKUP[elem]-1 do  
              birsp_abstractionRHS[elem][idx] := (birsp_abstractionRHS_BKUP[elem][idx]);
            endfor;
          endif;
      
          undefine bisnp_abstractionRHS[elem];
          cnt_bisnp_abstractionRHS[elem] := cnt_bisnp_abstractionRHS_BKUP[elem];
          if cnt_bisnp_abstractionRHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_bisnp_abstractionRHS_BKUP[elem]-1 do  
              bisnp_abstractionRHS[elem][idx] := (bisnp_abstractionRHS_BKUP[elem][idx]);
            endfor;
          endif;
      
          undefine drs_abstractionRHS[elem];
          cnt_drs_abstractionRHS[elem] := cnt_drs_abstractionRHS_BKUP[elem];
          if cnt_drs_abstractionRHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_drs_abstractionRHS_BKUP[elem]-1 do  
              drs_abstractionRHS[elem][idx] := (drs_abstractionRHS_BKUP[elem][idx]);
            endfor;
          endif;
      
          undefine ndr_abstractionRHS[elem];
          cnt_ndr_abstractionRHS[elem] := cnt_ndr_abstractionRHS_BKUP[elem];
          if cnt_ndr_abstractionRHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_ndr_abstractionRHS_BKUP[elem]-1 do  
              ndr_abstractionRHS[elem][idx] := (ndr_abstractionRHS_BKUP[elem][idx]);
            endfor;
          endif;
      
        endfor;
        for elem : OBJSET_directoryL2RHS do 
          i_directoryL2RHS[elem] := i_directoryL2RHS_BKUP[elem];
      
          undefine req2_directoryL2RHS[elem];
          cnt_req2_directoryL2RHS[elem] := cnt_req2_directoryL2RHS_BKUP[elem];
          if cnt_req2_directoryL2RHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_req2_directoryL2RHS_BKUP[elem]-1 do  
              req2_directoryL2RHS[elem][idx] := (req2_directoryL2RHS_BKUP[elem][idx]);
            endfor;
          endif;
      
          undefine rwd_directoryL2RHS[elem];
          cnt_rwd_directoryL2RHS[elem] := cnt_rwd_directoryL2RHS_BKUP[elem];
          if cnt_rwd_directoryL2RHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_rwd_directoryL2RHS_BKUP[elem]-1 do  
              rwd_directoryL2RHS[elem][idx] := (rwd_directoryL2RHS_BKUP[elem][idx]);
            endfor;
          endif;
      
          undefine birsp_directoryL2RHS[elem];
          cnt_birsp_directoryL2RHS[elem] := cnt_birsp_directoryL2RHS_BKUP[elem];
          if cnt_birsp_directoryL2RHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_birsp_directoryL2RHS_BKUP[elem]-1 do  
              birsp_directoryL2RHS[elem][idx] := (birsp_directoryL2RHS_BKUP[elem][idx]);
            endfor;
          endif;
      
          undefine bisnp_directoryL2RHS[elem];
          cnt_bisnp_directoryL2RHS[elem] := cnt_bisnp_directoryL2RHS_BKUP[elem];
          if cnt_bisnp_directoryL2RHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_bisnp_directoryL2RHS_BKUP[elem]-1 do  
              bisnp_directoryL2RHS[elem][idx] := (bisnp_directoryL2RHS_BKUP[elem][idx]);
            endfor;
          endif;
      
          undefine drs_directoryL2RHS[elem];
          cnt_drs_directoryL2RHS[elem] := cnt_drs_directoryL2RHS_BKUP[elem];
          if cnt_drs_directoryL2RHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_drs_directoryL2RHS_BKUP[elem]-1 do  
              drs_directoryL2RHS[elem][idx] := (drs_directoryL2RHS_BKUP[elem][idx]);
            endfor;
          endif;
      
          undefine ndr_directoryL2RHS[elem];
          cnt_ndr_directoryL2RHS[elem] := cnt_ndr_directoryL2RHS_BKUP[elem];
          if cnt_ndr_directoryL2RHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_ndr_directoryL2RHS_BKUP[elem]-1 do  
              ndr_directoryL2RHS[elem][idx] := (ndr_directoryL2RHS_BKUP[elem][idx]);
            endfor;
          endif;
      
        endfor;
      end;
      
  ----Backend/Murphi/MurphiModular/Functions/GenEventFunc
  ----Backend/Murphi/MurphiModular/Functions/GenPermFunc
    procedure Clear_perm(adr: Address; m: Machines);
    begin
      for acc : PermissionType do
        if !isundefined(m.cacheL2RHS) then
          g_perm.cacheL2RHS[m.cacheL2RHS][adr][acc] := false;
        endif;
        if !isundefined(m.cacheL2LHS) then
          g_perm.cacheL2LHS[m.cacheL2LHS][adr][acc] := false;
        endif;
        if !isundefined(m.cacheL1LHS) then
          g_perm.cacheL1LHS[m.cacheL1LHS][adr][acc] := false;
        endif;
    
      endfor;
    end;
    
    procedure Set_perm(acc: PermissionType; adr: Address; m: Machines);
    begin
      if !isundefined(m.cacheL2RHS) then
        g_perm.cacheL2RHS[m.cacheL2RHS][adr][acc] := true;
      endif;
      if !isundefined(m.cacheL2LHS) then
        g_perm.cacheL2LHS[m.cacheL2LHS][adr][acc] := true;
      endif;
      if !isundefined(m.cacheL1LHS) then
        g_perm.cacheL1LHS[m.cacheL1LHS][adr][acc] := true;
      endif;
    
    end;
    
    procedure Reset_perm();
    begin
      for acc : PermissionType do
        for adr : Address do
          for o : OBJSET_cacheL2RHS do
            g_perm.cacheL2RHS[o][adr][acc] := false;
          endfor;
          for o : OBJSET_cacheL2LHS do
            g_perm.cacheL2LHS[o][adr][acc] := false;
          endfor;
          for o : OBJSET_cacheL1LHS do
            g_perm.cacheL1LHS[o][adr][acc] := false;
          endfor;
    
        endfor;
      endfor;
    end;
    
  
  ----Backend/Murphi/MurphiModular/Functions/GenVectorFunc
    -- .add()
    procedure AddElement_cacheL1(var sv:v_cacheL1; n:Machines);
    begin
      if !isundefined(n.cacheL2RHS) then
        sv.cacheL2RHS[n.cacheL2RHS] := true;
      endif;
      if !isundefined(n.abstractionRHS) then
        sv.abstractionRHS[n.abstractionRHS] := true;
      endif;
      if !isundefined(n.cacheL2LHS) then
        sv.cacheL2LHS[n.cacheL2LHS] := true;
      endif;
      if !isundefined(n.cacheL1LHS) then
        sv.cacheL1LHS[n.cacheL1LHS] := true;
      endif;
      if !isundefined(n.directoryL2RHS) then
        sv.directoryL2RHS[n.directoryL2RHS] := true;
      endif;
      if !isundefined(n.directoryL2LHS) then
        sv.directoryL2LHS[n.directoryL2LHS] := true;
      endif;
    
    end;
    
    -- .del()
    procedure RemoveElement_cacheL1(var sv:v_cacheL1; n:Machines);
    begin
      if !isundefined(n.cacheL2RHS) then
        sv.cacheL2RHS[n.cacheL2RHS] := false;
      endif;
      if !isundefined(n.abstractionRHS) then
        sv.abstractionRHS[n.abstractionRHS] := false;
      endif;
      if !isundefined(n.cacheL2LHS) then
        sv.cacheL2LHS[n.cacheL2LHS] := false;
      endif;
      if !isundefined(n.cacheL1LHS) then
        sv.cacheL1LHS[n.cacheL1LHS] := false;
      endif;
      if !isundefined(n.directoryL2RHS) then
        sv.directoryL2RHS[n.directoryL2RHS] := false;
      endif;
      if !isundefined(n.directoryL2LHS) then
        sv.directoryL2LHS[n.directoryL2LHS] := false;
      endif;
    
    end;
    
    -- .clear()
    procedure ClearVector_cacheL1(var sv:v_cacheL1;);
    begin
      for m : OBJSET_cacheL2RHS do
        sv.cacheL2RHS[m] := false;
      endfor;
      for m : OBJSET_abstractionRHS do
        sv.abstractionRHS[m] := false;
      endfor;
      for m : OBJSET_cacheL2LHS do
        sv.cacheL2LHS[m] := false;
      endfor;
      for m : OBJSET_cacheL1LHS do
        sv.cacheL1LHS[m] := false;
      endfor;
      for m : OBJSET_directoryL2RHS do
        sv.directoryL2RHS[m] := false;
      endfor;
      for m : OBJSET_directoryL2LHS do
        sv.directoryL2LHS[m] := false;
      endfor;
    
    end;
    
    -- .contains()
    function IsElement_cacheL1(sv:v_cacheL1; n:Machines) : boolean;
    begin
      if !isundefined(n.cacheL2RHS) then
        return sv.cacheL2RHS[n.cacheL2RHS];
      endif;
      if !isundefined(n.abstractionRHS) then
        return sv.abstractionRHS[n.abstractionRHS];
      endif;
      if !isundefined(n.cacheL2LHS) then
        return sv.cacheL2LHS[n.cacheL2LHS];
      endif;
      if !isundefined(n.cacheL1LHS) then
        return sv.cacheL1LHS[n.cacheL1LHS];
      endif;
      if !isundefined(n.directoryL2RHS) then
        return sv.directoryL2RHS[n.directoryL2RHS];
      endif;
      if !isundefined(n.directoryL2LHS) then
        return sv.directoryL2LHS[n.directoryL2LHS];
      endif;
    
      return false;
    end;
    
    -- .count()
    function VectorCount_cacheL1(sv:v_cacheL1) : cnt_v_cacheL1;
    var cnt : cnt_v_cacheL1;
    begin
      cnt := 0;
      for m : OBJSET_cacheL2RHS do
        if sv.cacheL2RHS[m] then
          cnt := cnt + 1;
        endif;
      endfor;
      for m : OBJSET_abstractionRHS do
        if sv.abstractionRHS[m] then
          cnt := cnt + 1;
        endif;
      endfor;
      for m : OBJSET_cacheL2LHS do
        if sv.cacheL2LHS[m] then
          cnt := cnt + 1;
        endif;
      endfor;
      for m : OBJSET_cacheL1LHS do
        if sv.cacheL1LHS[m] then
          cnt := cnt + 1;
        endif;
      endfor;
      for m : OBJSET_directoryL2RHS do
        if sv.directoryL2RHS[m] then
          cnt := cnt + 1;
        endif;
      endfor;
      for m : OBJSET_directoryL2LHS do
        if sv.directoryL2LHS[m] then
          cnt := cnt + 1;
        endif;
      endfor;
    
      return cnt;
    end;
    
    -- .empty()
    function HasElement_cacheL1(sv:v_cacheL1) : boolean;
    begin
        return VectorCount_cacheL1(sv) > 0;
    end;
    
    
    -- .add()
    procedure AddElement_cacheL2(var sv:v_cacheL2; n:Machines);
    begin
      if !isundefined(n.directoryL1LHS) then
        sv.directoryL1LHS[n.directoryL1LHS] := true;
      endif;
      if !isundefined(n.cacheL2RHS) then
        sv.cacheL2RHS[n.cacheL2RHS] := true;
      endif;
      if !isundefined(n.abstractionRHS) then
        sv.abstractionRHS[n.abstractionRHS] := true;
      endif;
      if !isundefined(n.cacheL2LHS) then
        sv.cacheL2LHS[n.cacheL2LHS] := true;
      endif;
      if !isundefined(n.cacheL1LHS) then
        sv.cacheL1LHS[n.cacheL1LHS] := true;
      endif;
      if !isundefined(n.directoryL2RHS) then
        sv.directoryL2RHS[n.directoryL2RHS] := true;
      endif;
    
    end;
    
    -- .del()
    procedure RemoveElement_cacheL2(var sv:v_cacheL2; n:Machines);
    begin
      if !isundefined(n.directoryL1LHS) then
        sv.directoryL1LHS[n.directoryL1LHS] := false;
      endif;
      if !isundefined(n.cacheL2RHS) then
        sv.cacheL2RHS[n.cacheL2RHS] := false;
      endif;
      if !isundefined(n.abstractionRHS) then
        sv.abstractionRHS[n.abstractionRHS] := false;
      endif;
      if !isundefined(n.cacheL2LHS) then
        sv.cacheL2LHS[n.cacheL2LHS] := false;
      endif;
      if !isundefined(n.cacheL1LHS) then
        sv.cacheL1LHS[n.cacheL1LHS] := false;
      endif;
      if !isundefined(n.directoryL2RHS) then
        sv.directoryL2RHS[n.directoryL2RHS] := false;
      endif;
    
    end;
    
    -- .clear()
    procedure ClearVector_cacheL2(var sv:v_cacheL2;);
    begin
      for m : OBJSET_directoryL1LHS do
        sv.directoryL1LHS[m] := false;
      endfor;
      for m : OBJSET_cacheL2RHS do
        sv.cacheL2RHS[m] := false;
      endfor;
      for m : OBJSET_abstractionRHS do
        sv.abstractionRHS[m] := false;
      endfor;
      for m : OBJSET_cacheL2LHS do
        sv.cacheL2LHS[m] := false;
      endfor;
      for m : OBJSET_cacheL1LHS do
        sv.cacheL1LHS[m] := false;
      endfor;
      for m : OBJSET_directoryL2RHS do
        sv.directoryL2RHS[m] := false;
      endfor;
    
    end;
    
    -- .contains()
    function IsElement_cacheL2(sv:v_cacheL2; n:Machines) : boolean;
    begin
      if !isundefined(n.directoryL1LHS) then
        return sv.directoryL1LHS[n.directoryL1LHS];
      endif;
      if !isundefined(n.cacheL2RHS) then
        return sv.cacheL2RHS[n.cacheL2RHS];
      endif;
      if !isundefined(n.abstractionRHS) then
        return sv.abstractionRHS[n.abstractionRHS];
      endif;
      if !isundefined(n.cacheL2LHS) then
        return sv.cacheL2LHS[n.cacheL2LHS];
      endif;
      if !isundefined(n.cacheL1LHS) then
        return sv.cacheL1LHS[n.cacheL1LHS];
      endif;
      if !isundefined(n.directoryL2RHS) then
        return sv.directoryL2RHS[n.directoryL2RHS];
      endif;
    
      return false;
    end;
    
    -- .count()
    function VectorCount_cacheL2(sv:v_cacheL2) : cnt_v_cacheL2;
    var cnt : cnt_v_cacheL2;
    begin
      cnt := 0;
      for m : OBJSET_directoryL1LHS do
        if sv.directoryL1LHS[m] then
          cnt := cnt + 1;
        endif;
      endfor;
      for m : OBJSET_cacheL2RHS do
        if sv.cacheL2RHS[m] then
          cnt := cnt + 1;
        endif;
      endfor;
      for m : OBJSET_abstractionRHS do
        if sv.abstractionRHS[m] then
          cnt := cnt + 1;
        endif;
      endfor;
      for m : OBJSET_cacheL2LHS do
        if sv.cacheL2LHS[m] then
          cnt := cnt + 1;
        endif;
      endfor;
      for m : OBJSET_cacheL1LHS do
        if sv.cacheL1LHS[m] then
          cnt := cnt + 1;
        endif;
      endfor;
      for m : OBJSET_directoryL2RHS do
        if sv.directoryL2RHS[m] then
          cnt := cnt + 1;
        endif;
      endfor;
    
      return cnt;
    end;
    
    -- .empty()
    function HasElement_cacheL2(sv:v_cacheL2) : boolean;
    begin
        return VectorCount_cacheL2(sv) > 0;
    end;
    
    
  ----Backend/Murphi/MurphiModular/Functions/GenResetFunc
    procedure ResetMachine_cacheL2RHS();
    begin
      for i:OBJSET_cacheL2RHS do
        for a:Address do
          i_cacheL2RHS[i].cb[a].State := cacheL2RHS_I;
          i_cacheL2RHS[i].cb[a].cl := 0;
    
        endfor;
      endfor;
    end;
    
    procedure ResetMachine_directoryL1LHS();
    begin
      for i:OBJSET_directoryL1LHS do
        for a:Address do
          i_directoryL1LHS[i].cb[a].State := directoryL1LHS_I__C__I;
          i_directoryL1LHS[i].cb[a].cl := 0;
          ClearVector_cacheL1(i_directoryL1LHS[i].cb[a].cacheL1);
          undefine i_directoryL1LHS[i].cb[a].ownerL1;
          undefine i_directoryL1LHS[i].cb[a].proxy_msgL1;
          undefine i_directoryL1LHS[i].cb[a].proxy_msgL2;
          i_directoryL1LHS[i].cb[a].acksReceivedL1 := 0;
          i_directoryL1LHS[i].cb[a].acksExpectedL1 := 0;
    
        endfor;
      endfor;
    end;
    
    procedure ResetMachine_directoryL2LHS();
    begin
      for i:OBJSET_directoryL2LHS do
        for a:Address do
          i_directoryL2LHS[i].cb[a].State := directoryL2LHS_I;
          i_directoryL2LHS[i].cb[a].cl := 0;
          ClearVector_cacheL2(i_directoryL2LHS[i].cb[a].cacheL2);
          undefine i_directoryL2LHS[i].cb[a].ownerL2;
          undefine i_directoryL2LHS[i].cb[a].requestorL2;
    
        endfor;
      endfor;
    end;
    
    procedure ResetMachine_directoryL2RHS();
    begin
      for i:OBJSET_directoryL2RHS do
        for a:Address do
          i_directoryL2RHS[i].cb[a].State := directoryL2RHS_I;
          i_directoryL2RHS[i].cb[a].cl := 0;
          ClearVector_cacheL2(i_directoryL2RHS[i].cb[a].cacheL2);
          undefine i_directoryL2RHS[i].cb[a].ownerL2;
          undefine i_directoryL2RHS[i].cb[a].requestorL2;
    
        endfor;
      endfor;
    end;
    
    procedure ResetMachine_cacheL2LHS();
    begin
      for i:OBJSET_cacheL2LHS do
        for a:Address do
          i_cacheL2LHS[i].cb[a].State := cacheL2LHS_I;
          i_cacheL2LHS[i].cb[a].cl := 0;
    
        endfor;
      endfor;
    end;
    
    procedure ResetMachine_abstractionRHS();
    begin
      for i:OBJSET_abstractionRHS do
        for a:Address do
          i_abstractionRHS[i].cb[a].State := abstractionRHS_I;
          i_abstractionRHS[i].cb[a].cl := 0;
    
        endfor;
      endfor;
    end;
    
    procedure ResetMachine_cacheL1LHS();
    begin
      for i:OBJSET_cacheL1LHS do
        for a:Address do
          i_cacheL1LHS[i].cb[a].State := cacheL1LHS_I;
          i_cacheL1LHS[i].cb[a].cl := 0;
          i_cacheL1LHS[i].cb[a].acksReceivedL1 := 0;
          i_cacheL1LHS[i].cb[a].acksExpectedL1 := 0;
    
        endfor;
      endfor;
    end;
    
      procedure ResetMachine_();
      begin
      ResetMachine_cacheL2RHS();
      ResetMachine_directoryL1LHS();
      ResetMachine_directoryL2LHS();
      ResetMachine_directoryL2RHS();
      ResetMachine_cacheL2LHS();
      ResetMachine_abstractionRHS();
      ResetMachine_cacheL1LHS();
      ResetMachine_directoryL1LHS();
      
      g_system_state := systemLHS;
      
      g_progress_tracking := false;
      
      end;
  ----Backend/Murphi/MurphiModular/Functions/GenFIFOFunc
  ----Backend/Murphi/MurphiModular/Functions/GenNetworkFunc
    procedure Send_resp(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1LHS) then
        Assert(cnt_resp_cacheL1LHS[dst.cacheL1LHS] < O_NET_MAX) "Too many messages: resp_cacheL1LHS";
        resp_cacheL1LHS[dst.cacheL1LHS][cnt_resp_cacheL1LHS[dst.cacheL1LHS]] := msg;
        cnt_resp_cacheL1LHS[dst.cacheL1LHS] := cnt_resp_cacheL1LHS[dst.cacheL1LHS] + 1;
      elsif !isundefined(dst.directoryL1LHS) then
        Assert(cnt_resp_directoryL1LHS[dst.directoryL1LHS] < O_NET_MAX) "Too many messages: resp_directoryL1LHS";
        resp_directoryL1LHS[dst.directoryL1LHS][cnt_resp_directoryL1LHS[dst.directoryL1LHS]] := msg;
        cnt_resp_directoryL1LHS[dst.directoryL1LHS] := cnt_resp_directoryL1LHS[dst.directoryL1LHS] + 1;
      elsif !isundefined(dst.directoryL2LHS) then
        error "Attempt to send to queue resp_directoryL2LHS, which is not modeled"; 
      elsif !isundefined(dst.cacheL2LHS) then
        error "Attempt to send to queue resp_cacheL2LHS, which is not modeled"; 
      elsif !isundefined(dst.abstractionRHS) then
        Assert(cnt_resp_abstractionRHS[dst.abstractionRHS] < O_NET_MAX) "Too many messages: resp_abstractionRHS";
        resp_abstractionRHS[dst.abstractionRHS][cnt_resp_abstractionRHS[dst.abstractionRHS]] := msg;
        cnt_resp_abstractionRHS[dst.abstractionRHS] := cnt_resp_abstractionRHS[dst.abstractionRHS] + 1;
      elsif !isundefined(dst.cacheL2RHS) then
        error "Attempt to send to queue resp_cacheL2RHS, which is not modeled"; 
      elsif !isundefined(dst.directoryL2RHS) then
        error "Attempt to send to queue resp_directoryL2RHS, which is not modeled"; 
      else
        error "unknown send machine";
      endif;
      if is_machine_in_state(src, systemLHSExt) then
        Send_resp(map_LHS_msg_to_RHS(msg), map_LHS_to_RHS(src));
        BackupRHS();
      endif;
    
      endalias;
    end;
    
    procedure Pop_resp(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1LHS) then
        Assert (cnt_resp_cacheL1LHS[dst.cacheL1LHS] > 0) "Trying to advance empty queue: resp_cacheL1LHS";
        for i := 0 to cnt_resp_cacheL1LHS[dst.cacheL1LHS]-1 do
          if i < cnt_resp_cacheL1LHS[dst.cacheL1LHS]-1 then
            resp_cacheL1LHS[dst.cacheL1LHS][i] := resp_cacheL1LHS[dst.cacheL1LHS][i+1];
          else
            undefine resp_cacheL1LHS[dst.cacheL1LHS][i];
          endif;
        endfor;
        cnt_resp_cacheL1LHS[dst.cacheL1LHS] := cnt_resp_cacheL1LHS[dst.cacheL1LHS] - 1;
      elsif !isundefined(dst.directoryL1LHS) then
        Assert (cnt_resp_directoryL1LHS[dst.directoryL1LHS] > 0) "Trying to advance empty queue: resp_directoryL1LHS";
        for i := 0 to cnt_resp_directoryL1LHS[dst.directoryL1LHS]-1 do
          if i < cnt_resp_directoryL1LHS[dst.directoryL1LHS]-1 then
            resp_directoryL1LHS[dst.directoryL1LHS][i] := resp_directoryL1LHS[dst.directoryL1LHS][i+1];
          else
            undefine resp_directoryL1LHS[dst.directoryL1LHS][i];
          endif;
        endfor;
        cnt_resp_directoryL1LHS[dst.directoryL1LHS] := cnt_resp_directoryL1LHS[dst.directoryL1LHS] - 1;
      elsif !isundefined(dst.directoryL2LHS) then
        error "Attempt to pop from queue resp_directoryL2LHS, which is not modeled"; 
      elsif !isundefined(dst.cacheL2LHS) then
        error "Attempt to pop from queue resp_cacheL2LHS, which is not modeled"; 
      elsif !isundefined(dst.abstractionRHS) then
        Assert (cnt_resp_abstractionRHS[dst.abstractionRHS] > 0) "Trying to advance empty queue: resp_abstractionRHS";
        for i := 0 to cnt_resp_abstractionRHS[dst.abstractionRHS]-1 do
          if i < cnt_resp_abstractionRHS[dst.abstractionRHS]-1 then
            resp_abstractionRHS[dst.abstractionRHS][i] := resp_abstractionRHS[dst.abstractionRHS][i+1];
          else
            undefine resp_abstractionRHS[dst.abstractionRHS][i];
          endif;
        endfor;
        cnt_resp_abstractionRHS[dst.abstractionRHS] := cnt_resp_abstractionRHS[dst.abstractionRHS] - 1;
      elsif !isundefined(dst.cacheL2RHS) then
        error "Attempt to pop from queue resp_cacheL2RHS, which is not modeled"; 
      elsif !isundefined(dst.directoryL2RHS) then
        error "Attempt to pop from queue resp_directoryL2RHS, which is not modeled"; 
      else
        error "unknown pop machine";
      endif;
      if is_machine_in_state(dst, systemLHSExt) then
        Pop_resp(map_LHS_to_RHS(dst), map_LHS_to_RHS(src));
        BackupRHS();
      endif;
    
    end;
    
    procedure Send_req(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1LHS) then
        error "Attempt to send to queue req_cacheL1LHS, which is not modeled"; 
      elsif !isundefined(dst.directoryL1LHS) then
        Assert(cnt_req_directoryL1LHS[dst.directoryL1LHS] < O_NET_MAX) "Too many messages: req_directoryL1LHS";
        req_directoryL1LHS[dst.directoryL1LHS][cnt_req_directoryL1LHS[dst.directoryL1LHS]] := msg;
        cnt_req_directoryL1LHS[dst.directoryL1LHS] := cnt_req_directoryL1LHS[dst.directoryL1LHS] + 1;
      elsif !isundefined(dst.directoryL2LHS) then
        error "Attempt to send to queue req_directoryL2LHS, which is not modeled"; 
      elsif !isundefined(dst.cacheL2LHS) then
        error "Attempt to send to queue req_cacheL2LHS, which is not modeled"; 
      elsif !isundefined(dst.abstractionRHS) then
        Assert(cnt_req_abstractionRHS[dst.abstractionRHS] < O_NET_MAX) "Too many messages: req_abstractionRHS";
        req_abstractionRHS[dst.abstractionRHS][cnt_req_abstractionRHS[dst.abstractionRHS]] := msg;
        cnt_req_abstractionRHS[dst.abstractionRHS] := cnt_req_abstractionRHS[dst.abstractionRHS] + 1;
      elsif !isundefined(dst.cacheL2RHS) then
        error "Attempt to send to queue req_cacheL2RHS, which is not modeled"; 
      elsif !isundefined(dst.directoryL2RHS) then
        error "Attempt to send to queue req_directoryL2RHS, which is not modeled"; 
      else
        error "unknown send machine";
      endif;
      if is_machine_in_state(src, systemLHSExt) then
        Send_req(map_LHS_msg_to_RHS(msg), map_LHS_to_RHS(src));
        BackupRHS();
      endif;
    
      endalias;
    end;
    
    procedure Pop_req(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1LHS) then
        error "Attempt to pop from queue req_cacheL1LHS, which is not modeled"; 
      elsif !isundefined(dst.directoryL1LHS) then
        Assert (cnt_req_directoryL1LHS[dst.directoryL1LHS] > 0) "Trying to advance empty queue: req_directoryL1LHS";
        for i := 0 to cnt_req_directoryL1LHS[dst.directoryL1LHS]-1 do
          if i < cnt_req_directoryL1LHS[dst.directoryL1LHS]-1 then
            req_directoryL1LHS[dst.directoryL1LHS][i] := req_directoryL1LHS[dst.directoryL1LHS][i+1];
          else
            undefine req_directoryL1LHS[dst.directoryL1LHS][i];
          endif;
        endfor;
        cnt_req_directoryL1LHS[dst.directoryL1LHS] := cnt_req_directoryL1LHS[dst.directoryL1LHS] - 1;
      elsif !isundefined(dst.directoryL2LHS) then
        error "Attempt to pop from queue req_directoryL2LHS, which is not modeled"; 
      elsif !isundefined(dst.cacheL2LHS) then
        error "Attempt to pop from queue req_cacheL2LHS, which is not modeled"; 
      elsif !isundefined(dst.abstractionRHS) then
        Assert (cnt_req_abstractionRHS[dst.abstractionRHS] > 0) "Trying to advance empty queue: req_abstractionRHS";
        for i := 0 to cnt_req_abstractionRHS[dst.abstractionRHS]-1 do
          if i < cnt_req_abstractionRHS[dst.abstractionRHS]-1 then
            req_abstractionRHS[dst.abstractionRHS][i] := req_abstractionRHS[dst.abstractionRHS][i+1];
          else
            undefine req_abstractionRHS[dst.abstractionRHS][i];
          endif;
        endfor;
        cnt_req_abstractionRHS[dst.abstractionRHS] := cnt_req_abstractionRHS[dst.abstractionRHS] - 1;
      elsif !isundefined(dst.cacheL2RHS) then
        error "Attempt to pop from queue req_cacheL2RHS, which is not modeled"; 
      elsif !isundefined(dst.directoryL2RHS) then
        error "Attempt to pop from queue req_directoryL2RHS, which is not modeled"; 
      else
        error "unknown pop machine";
      endif;
      if is_machine_in_state(dst, systemLHSExt) then
        Pop_req(map_LHS_to_RHS(dst), map_LHS_to_RHS(src));
        BackupRHS();
      endif;
    
    end;
    
    procedure Send_fwd(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1LHS) then
        Assert(cnt_fwd_cacheL1LHS[dst.cacheL1LHS] < O_NET_MAX) "Too many messages: fwd_cacheL1LHS";
        fwd_cacheL1LHS[dst.cacheL1LHS][cnt_fwd_cacheL1LHS[dst.cacheL1LHS]] := msg;
        cnt_fwd_cacheL1LHS[dst.cacheL1LHS] := cnt_fwd_cacheL1LHS[dst.cacheL1LHS] + 1;
      elsif !isundefined(dst.directoryL1LHS) then
        Assert(cnt_fwd_directoryL1LHS[dst.directoryL1LHS] < O_NET_MAX) "Too many messages: fwd_directoryL1LHS";
        fwd_directoryL1LHS[dst.directoryL1LHS][cnt_fwd_directoryL1LHS[dst.directoryL1LHS]] := msg;
        cnt_fwd_directoryL1LHS[dst.directoryL1LHS] := cnt_fwd_directoryL1LHS[dst.directoryL1LHS] + 1;
      elsif !isundefined(dst.directoryL2LHS) then
        error "Attempt to send to queue fwd_directoryL2LHS, which is not modeled"; 
      elsif !isundefined(dst.cacheL2LHS) then
        error "Attempt to send to queue fwd_cacheL2LHS, which is not modeled"; 
      elsif !isundefined(dst.abstractionRHS) then
        Assert(cnt_fwd_abstractionRHS[dst.abstractionRHS] < O_NET_MAX) "Too many messages: fwd_abstractionRHS";
        fwd_abstractionRHS[dst.abstractionRHS][cnt_fwd_abstractionRHS[dst.abstractionRHS]] := msg;
        cnt_fwd_abstractionRHS[dst.abstractionRHS] := cnt_fwd_abstractionRHS[dst.abstractionRHS] + 1;
      elsif !isundefined(dst.cacheL2RHS) then
        error "Attempt to send to queue fwd_cacheL2RHS, which is not modeled"; 
      elsif !isundefined(dst.directoryL2RHS) then
        error "Attempt to send to queue fwd_directoryL2RHS, which is not modeled"; 
      else
        error "unknown send machine";
      endif;
      if is_machine_in_state(src, systemLHSExt) then
        Send_fwd(map_LHS_msg_to_RHS(msg), map_LHS_to_RHS(src));
        BackupRHS();
      endif;
    
      endalias;
    end;
    
    procedure Pop_fwd(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1LHS) then
        Assert (cnt_fwd_cacheL1LHS[dst.cacheL1LHS] > 0) "Trying to advance empty queue: fwd_cacheL1LHS";
        for i := 0 to cnt_fwd_cacheL1LHS[dst.cacheL1LHS]-1 do
          if i < cnt_fwd_cacheL1LHS[dst.cacheL1LHS]-1 then
            fwd_cacheL1LHS[dst.cacheL1LHS][i] := fwd_cacheL1LHS[dst.cacheL1LHS][i+1];
          else
            undefine fwd_cacheL1LHS[dst.cacheL1LHS][i];
          endif;
        endfor;
        cnt_fwd_cacheL1LHS[dst.cacheL1LHS] := cnt_fwd_cacheL1LHS[dst.cacheL1LHS] - 1;
      elsif !isundefined(dst.directoryL1LHS) then
        Assert (cnt_fwd_directoryL1LHS[dst.directoryL1LHS] > 0) "Trying to advance empty queue: fwd_directoryL1LHS";
        for i := 0 to cnt_fwd_directoryL1LHS[dst.directoryL1LHS]-1 do
          if i < cnt_fwd_directoryL1LHS[dst.directoryL1LHS]-1 then
            fwd_directoryL1LHS[dst.directoryL1LHS][i] := fwd_directoryL1LHS[dst.directoryL1LHS][i+1];
          else
            undefine fwd_directoryL1LHS[dst.directoryL1LHS][i];
          endif;
        endfor;
        cnt_fwd_directoryL1LHS[dst.directoryL1LHS] := cnt_fwd_directoryL1LHS[dst.directoryL1LHS] - 1;
      elsif !isundefined(dst.directoryL2LHS) then
        error "Attempt to pop from queue fwd_directoryL2LHS, which is not modeled"; 
      elsif !isundefined(dst.cacheL2LHS) then
        error "Attempt to pop from queue fwd_cacheL2LHS, which is not modeled"; 
      elsif !isundefined(dst.abstractionRHS) then
        Assert (cnt_fwd_abstractionRHS[dst.abstractionRHS] > 0) "Trying to advance empty queue: fwd_abstractionRHS";
        for i := 0 to cnt_fwd_abstractionRHS[dst.abstractionRHS]-1 do
          if i < cnt_fwd_abstractionRHS[dst.abstractionRHS]-1 then
            fwd_abstractionRHS[dst.abstractionRHS][i] := fwd_abstractionRHS[dst.abstractionRHS][i+1];
          else
            undefine fwd_abstractionRHS[dst.abstractionRHS][i];
          endif;
        endfor;
        cnt_fwd_abstractionRHS[dst.abstractionRHS] := cnt_fwd_abstractionRHS[dst.abstractionRHS] - 1;
      elsif !isundefined(dst.cacheL2RHS) then
        error "Attempt to pop from queue fwd_cacheL2RHS, which is not modeled"; 
      elsif !isundefined(dst.directoryL2RHS) then
        error "Attempt to pop from queue fwd_directoryL2RHS, which is not modeled"; 
      else
        error "unknown pop machine";
      endif;
      if is_machine_in_state(dst, systemLHSExt) then
        Pop_fwd(map_LHS_to_RHS(dst), map_LHS_to_RHS(src));
        BackupRHS();
      endif;
    
    end;
    
    procedure Send_bisnp(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1LHS) then
        error "Attempt to send to queue bisnp_cacheL1LHS, which is not modeled"; 
      elsif !isundefined(dst.directoryL1LHS) then
        Assert(cnt_bisnp_directoryL1LHS[dst.directoryL1LHS] < O_NET_MAX) "Too many messages: bisnp_directoryL1LHS";
        bisnp_directoryL1LHS[dst.directoryL1LHS][cnt_bisnp_directoryL1LHS[dst.directoryL1LHS]] := msg;
        cnt_bisnp_directoryL1LHS[dst.directoryL1LHS] := cnt_bisnp_directoryL1LHS[dst.directoryL1LHS] + 1;
      elsif !isundefined(dst.directoryL2LHS) then
        Assert(cnt_bisnp_directoryL2LHS[dst.directoryL2LHS] < O_NET_MAX) "Too many messages: bisnp_directoryL2LHS";
        bisnp_directoryL2LHS[dst.directoryL2LHS][cnt_bisnp_directoryL2LHS[dst.directoryL2LHS]] := msg;
        cnt_bisnp_directoryL2LHS[dst.directoryL2LHS] := cnt_bisnp_directoryL2LHS[dst.directoryL2LHS] + 1;
      elsif !isundefined(dst.cacheL2LHS) then
        Assert(cnt_bisnp_cacheL2LHS[dst.cacheL2LHS] < O_NET_MAX) "Too many messages: bisnp_cacheL2LHS";
        bisnp_cacheL2LHS[dst.cacheL2LHS][cnt_bisnp_cacheL2LHS[dst.cacheL2LHS]] := msg;
        cnt_bisnp_cacheL2LHS[dst.cacheL2LHS] := cnt_bisnp_cacheL2LHS[dst.cacheL2LHS] + 1;
      elsif !isundefined(dst.abstractionRHS) then
        Assert(cnt_bisnp_abstractionRHS[dst.abstractionRHS] < O_NET_MAX) "Too many messages: bisnp_abstractionRHS";
        bisnp_abstractionRHS[dst.abstractionRHS][cnt_bisnp_abstractionRHS[dst.abstractionRHS]] := msg;
        cnt_bisnp_abstractionRHS[dst.abstractionRHS] := cnt_bisnp_abstractionRHS[dst.abstractionRHS] + 1;
      elsif !isundefined(dst.cacheL2RHS) then
        Assert(cnt_bisnp_cacheL2RHS[dst.cacheL2RHS] < O_NET_MAX) "Too many messages: bisnp_cacheL2RHS";
        bisnp_cacheL2RHS[dst.cacheL2RHS][cnt_bisnp_cacheL2RHS[dst.cacheL2RHS]] := msg;
        cnt_bisnp_cacheL2RHS[dst.cacheL2RHS] := cnt_bisnp_cacheL2RHS[dst.cacheL2RHS] + 1;
      elsif !isundefined(dst.directoryL2RHS) then
        Assert(cnt_bisnp_directoryL2RHS[dst.directoryL2RHS] < O_NET_MAX) "Too many messages: bisnp_directoryL2RHS";
        bisnp_directoryL2RHS[dst.directoryL2RHS][cnt_bisnp_directoryL2RHS[dst.directoryL2RHS]] := msg;
        cnt_bisnp_directoryL2RHS[dst.directoryL2RHS] := cnt_bisnp_directoryL2RHS[dst.directoryL2RHS] + 1;
      else
        error "unknown send machine";
      endif;
      if is_machine_in_state(src, systemLHSExt) then
        Send_bisnp(map_LHS_msg_to_RHS(msg), map_LHS_to_RHS(src));
        BackupRHS();
      endif;
    
      endalias;
    end;
    
    procedure Pop_bisnp(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1LHS) then
        error "Attempt to pop from queue bisnp_cacheL1LHS, which is not modeled"; 
      elsif !isundefined(dst.directoryL1LHS) then
        Assert (cnt_bisnp_directoryL1LHS[dst.directoryL1LHS] > 0) "Trying to advance empty queue: bisnp_directoryL1LHS";
        for i := 0 to cnt_bisnp_directoryL1LHS[dst.directoryL1LHS]-1 do
          if i < cnt_bisnp_directoryL1LHS[dst.directoryL1LHS]-1 then
            bisnp_directoryL1LHS[dst.directoryL1LHS][i] := bisnp_directoryL1LHS[dst.directoryL1LHS][i+1];
          else
            undefine bisnp_directoryL1LHS[dst.directoryL1LHS][i];
          endif;
        endfor;
        cnt_bisnp_directoryL1LHS[dst.directoryL1LHS] := cnt_bisnp_directoryL1LHS[dst.directoryL1LHS] - 1;
      elsif !isundefined(dst.directoryL2LHS) then
        Assert (cnt_bisnp_directoryL2LHS[dst.directoryL2LHS] > 0) "Trying to advance empty queue: bisnp_directoryL2LHS";
        for i := 0 to cnt_bisnp_directoryL2LHS[dst.directoryL2LHS]-1 do
          if i < cnt_bisnp_directoryL2LHS[dst.directoryL2LHS]-1 then
            bisnp_directoryL2LHS[dst.directoryL2LHS][i] := bisnp_directoryL2LHS[dst.directoryL2LHS][i+1];
          else
            undefine bisnp_directoryL2LHS[dst.directoryL2LHS][i];
          endif;
        endfor;
        cnt_bisnp_directoryL2LHS[dst.directoryL2LHS] := cnt_bisnp_directoryL2LHS[dst.directoryL2LHS] - 1;
      elsif !isundefined(dst.cacheL2LHS) then
        Assert (cnt_bisnp_cacheL2LHS[dst.cacheL2LHS] > 0) "Trying to advance empty queue: bisnp_cacheL2LHS";
        for i := 0 to cnt_bisnp_cacheL2LHS[dst.cacheL2LHS]-1 do
          if i < cnt_bisnp_cacheL2LHS[dst.cacheL2LHS]-1 then
            bisnp_cacheL2LHS[dst.cacheL2LHS][i] := bisnp_cacheL2LHS[dst.cacheL2LHS][i+1];
          else
            undefine bisnp_cacheL2LHS[dst.cacheL2LHS][i];
          endif;
        endfor;
        cnt_bisnp_cacheL2LHS[dst.cacheL2LHS] := cnt_bisnp_cacheL2LHS[dst.cacheL2LHS] - 1;
      elsif !isundefined(dst.abstractionRHS) then
        Assert (cnt_bisnp_abstractionRHS[dst.abstractionRHS] > 0) "Trying to advance empty queue: bisnp_abstractionRHS";
        for i := 0 to cnt_bisnp_abstractionRHS[dst.abstractionRHS]-1 do
          if i < cnt_bisnp_abstractionRHS[dst.abstractionRHS]-1 then
            bisnp_abstractionRHS[dst.abstractionRHS][i] := bisnp_abstractionRHS[dst.abstractionRHS][i+1];
          else
            undefine bisnp_abstractionRHS[dst.abstractionRHS][i];
          endif;
        endfor;
        cnt_bisnp_abstractionRHS[dst.abstractionRHS] := cnt_bisnp_abstractionRHS[dst.abstractionRHS] - 1;
      elsif !isundefined(dst.cacheL2RHS) then
        Assert (cnt_bisnp_cacheL2RHS[dst.cacheL2RHS] > 0) "Trying to advance empty queue: bisnp_cacheL2RHS";
        for i := 0 to cnt_bisnp_cacheL2RHS[dst.cacheL2RHS]-1 do
          if i < cnt_bisnp_cacheL2RHS[dst.cacheL2RHS]-1 then
            bisnp_cacheL2RHS[dst.cacheL2RHS][i] := bisnp_cacheL2RHS[dst.cacheL2RHS][i+1];
          else
            undefine bisnp_cacheL2RHS[dst.cacheL2RHS][i];
          endif;
        endfor;
        cnt_bisnp_cacheL2RHS[dst.cacheL2RHS] := cnt_bisnp_cacheL2RHS[dst.cacheL2RHS] - 1;
      elsif !isundefined(dst.directoryL2RHS) then
        Assert (cnt_bisnp_directoryL2RHS[dst.directoryL2RHS] > 0) "Trying to advance empty queue: bisnp_directoryL2RHS";
        for i := 0 to cnt_bisnp_directoryL2RHS[dst.directoryL2RHS]-1 do
          if i < cnt_bisnp_directoryL2RHS[dst.directoryL2RHS]-1 then
            bisnp_directoryL2RHS[dst.directoryL2RHS][i] := bisnp_directoryL2RHS[dst.directoryL2RHS][i+1];
          else
            undefine bisnp_directoryL2RHS[dst.directoryL2RHS][i];
          endif;
        endfor;
        cnt_bisnp_directoryL2RHS[dst.directoryL2RHS] := cnt_bisnp_directoryL2RHS[dst.directoryL2RHS] - 1;
      else
        error "unknown pop machine";
      endif;
      if is_machine_in_state(dst, systemLHSExt) then
        Pop_bisnp(map_LHS_to_RHS(dst), map_LHS_to_RHS(src));
        BackupRHS();
      endif;
    
    end;
    
    procedure Send_req2(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1LHS) then
        error "Attempt to send to queue req2_cacheL1LHS, which is not modeled"; 
      elsif !isundefined(dst.directoryL1LHS) then
        Assert(cnt_req2_directoryL1LHS[dst.directoryL1LHS] < O_NET_MAX) "Too many messages: req2_directoryL1LHS";
        req2_directoryL1LHS[dst.directoryL1LHS][cnt_req2_directoryL1LHS[dst.directoryL1LHS]] := msg;
        cnt_req2_directoryL1LHS[dst.directoryL1LHS] := cnt_req2_directoryL1LHS[dst.directoryL1LHS] + 1;
      elsif !isundefined(dst.directoryL2LHS) then
        Assert(cnt_req2_directoryL2LHS[dst.directoryL2LHS] < O_NET_MAX) "Too many messages: req2_directoryL2LHS";
        req2_directoryL2LHS[dst.directoryL2LHS][cnt_req2_directoryL2LHS[dst.directoryL2LHS]] := msg;
        cnt_req2_directoryL2LHS[dst.directoryL2LHS] := cnt_req2_directoryL2LHS[dst.directoryL2LHS] + 1;
      elsif !isundefined(dst.cacheL2LHS) then
        Assert(cnt_req2_cacheL2LHS[dst.cacheL2LHS] < O_NET_MAX) "Too many messages: req2_cacheL2LHS";
        req2_cacheL2LHS[dst.cacheL2LHS][cnt_req2_cacheL2LHS[dst.cacheL2LHS]] := msg;
        cnt_req2_cacheL2LHS[dst.cacheL2LHS] := cnt_req2_cacheL2LHS[dst.cacheL2LHS] + 1;
      elsif !isundefined(dst.abstractionRHS) then
        Assert(cnt_req2_abstractionRHS[dst.abstractionRHS] < O_NET_MAX) "Too many messages: req2_abstractionRHS";
        req2_abstractionRHS[dst.abstractionRHS][cnt_req2_abstractionRHS[dst.abstractionRHS]] := msg;
        cnt_req2_abstractionRHS[dst.abstractionRHS] := cnt_req2_abstractionRHS[dst.abstractionRHS] + 1;
      elsif !isundefined(dst.cacheL2RHS) then
        Assert(cnt_req2_cacheL2RHS[dst.cacheL2RHS] < O_NET_MAX) "Too many messages: req2_cacheL2RHS";
        req2_cacheL2RHS[dst.cacheL2RHS][cnt_req2_cacheL2RHS[dst.cacheL2RHS]] := msg;
        cnt_req2_cacheL2RHS[dst.cacheL2RHS] := cnt_req2_cacheL2RHS[dst.cacheL2RHS] + 1;
      elsif !isundefined(dst.directoryL2RHS) then
        Assert(cnt_req2_directoryL2RHS[dst.directoryL2RHS] < O_NET_MAX) "Too many messages: req2_directoryL2RHS";
        req2_directoryL2RHS[dst.directoryL2RHS][cnt_req2_directoryL2RHS[dst.directoryL2RHS]] := msg;
        cnt_req2_directoryL2RHS[dst.directoryL2RHS] := cnt_req2_directoryL2RHS[dst.directoryL2RHS] + 1;
      else
        error "unknown send machine";
      endif;
      if is_machine_in_state(src, systemLHSExt) then
        Send_req2(map_LHS_msg_to_RHS(msg), map_LHS_to_RHS(src));
        BackupRHS();
      endif;
    
      endalias;
    end;
    
    procedure Pop_req2(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1LHS) then
        error "Attempt to pop from queue req2_cacheL1LHS, which is not modeled"; 
      elsif !isundefined(dst.directoryL1LHS) then
        Assert (cnt_req2_directoryL1LHS[dst.directoryL1LHS] > 0) "Trying to advance empty queue: req2_directoryL1LHS";
        for i := 0 to cnt_req2_directoryL1LHS[dst.directoryL1LHS]-1 do
          if i < cnt_req2_directoryL1LHS[dst.directoryL1LHS]-1 then
            req2_directoryL1LHS[dst.directoryL1LHS][i] := req2_directoryL1LHS[dst.directoryL1LHS][i+1];
          else
            undefine req2_directoryL1LHS[dst.directoryL1LHS][i];
          endif;
        endfor;
        cnt_req2_directoryL1LHS[dst.directoryL1LHS] := cnt_req2_directoryL1LHS[dst.directoryL1LHS] - 1;
      elsif !isundefined(dst.directoryL2LHS) then
        Assert (cnt_req2_directoryL2LHS[dst.directoryL2LHS] > 0) "Trying to advance empty queue: req2_directoryL2LHS";
        for i := 0 to cnt_req2_directoryL2LHS[dst.directoryL2LHS]-1 do
          if i < cnt_req2_directoryL2LHS[dst.directoryL2LHS]-1 then
            req2_directoryL2LHS[dst.directoryL2LHS][i] := req2_directoryL2LHS[dst.directoryL2LHS][i+1];
          else
            undefine req2_directoryL2LHS[dst.directoryL2LHS][i];
          endif;
        endfor;
        cnt_req2_directoryL2LHS[dst.directoryL2LHS] := cnt_req2_directoryL2LHS[dst.directoryL2LHS] - 1;
      elsif !isundefined(dst.cacheL2LHS) then
        Assert (cnt_req2_cacheL2LHS[dst.cacheL2LHS] > 0) "Trying to advance empty queue: req2_cacheL2LHS";
        for i := 0 to cnt_req2_cacheL2LHS[dst.cacheL2LHS]-1 do
          if i < cnt_req2_cacheL2LHS[dst.cacheL2LHS]-1 then
            req2_cacheL2LHS[dst.cacheL2LHS][i] := req2_cacheL2LHS[dst.cacheL2LHS][i+1];
          else
            undefine req2_cacheL2LHS[dst.cacheL2LHS][i];
          endif;
        endfor;
        cnt_req2_cacheL2LHS[dst.cacheL2LHS] := cnt_req2_cacheL2LHS[dst.cacheL2LHS] - 1;
      elsif !isundefined(dst.abstractionRHS) then
        Assert (cnt_req2_abstractionRHS[dst.abstractionRHS] > 0) "Trying to advance empty queue: req2_abstractionRHS";
        for i := 0 to cnt_req2_abstractionRHS[dst.abstractionRHS]-1 do
          if i < cnt_req2_abstractionRHS[dst.abstractionRHS]-1 then
            req2_abstractionRHS[dst.abstractionRHS][i] := req2_abstractionRHS[dst.abstractionRHS][i+1];
          else
            undefine req2_abstractionRHS[dst.abstractionRHS][i];
          endif;
        endfor;
        cnt_req2_abstractionRHS[dst.abstractionRHS] := cnt_req2_abstractionRHS[dst.abstractionRHS] - 1;
      elsif !isundefined(dst.cacheL2RHS) then
        Assert (cnt_req2_cacheL2RHS[dst.cacheL2RHS] > 0) "Trying to advance empty queue: req2_cacheL2RHS";
        for i := 0 to cnt_req2_cacheL2RHS[dst.cacheL2RHS]-1 do
          if i < cnt_req2_cacheL2RHS[dst.cacheL2RHS]-1 then
            req2_cacheL2RHS[dst.cacheL2RHS][i] := req2_cacheL2RHS[dst.cacheL2RHS][i+1];
          else
            undefine req2_cacheL2RHS[dst.cacheL2RHS][i];
          endif;
        endfor;
        cnt_req2_cacheL2RHS[dst.cacheL2RHS] := cnt_req2_cacheL2RHS[dst.cacheL2RHS] - 1;
      elsif !isundefined(dst.directoryL2RHS) then
        Assert (cnt_req2_directoryL2RHS[dst.directoryL2RHS] > 0) "Trying to advance empty queue: req2_directoryL2RHS";
        for i := 0 to cnt_req2_directoryL2RHS[dst.directoryL2RHS]-1 do
          if i < cnt_req2_directoryL2RHS[dst.directoryL2RHS]-1 then
            req2_directoryL2RHS[dst.directoryL2RHS][i] := req2_directoryL2RHS[dst.directoryL2RHS][i+1];
          else
            undefine req2_directoryL2RHS[dst.directoryL2RHS][i];
          endif;
        endfor;
        cnt_req2_directoryL2RHS[dst.directoryL2RHS] := cnt_req2_directoryL2RHS[dst.directoryL2RHS] - 1;
      else
        error "unknown pop machine";
      endif;
      if is_machine_in_state(dst, systemLHSExt) then
        Pop_req2(map_LHS_to_RHS(dst), map_LHS_to_RHS(src));
        BackupRHS();
      endif;
    
    end;
    
    procedure Send_rwd(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1LHS) then
        error "Attempt to send to queue rwd_cacheL1LHS, which is not modeled"; 
      elsif !isundefined(dst.directoryL1LHS) then
        Assert(cnt_rwd_directoryL1LHS[dst.directoryL1LHS] < O_NET_MAX) "Too many messages: rwd_directoryL1LHS";
        rwd_directoryL1LHS[dst.directoryL1LHS][cnt_rwd_directoryL1LHS[dst.directoryL1LHS]] := msg;
        cnt_rwd_directoryL1LHS[dst.directoryL1LHS] := cnt_rwd_directoryL1LHS[dst.directoryL1LHS] + 1;
      elsif !isundefined(dst.directoryL2LHS) then
        Assert(cnt_rwd_directoryL2LHS[dst.directoryL2LHS] < O_NET_MAX) "Too many messages: rwd_directoryL2LHS";
        rwd_directoryL2LHS[dst.directoryL2LHS][cnt_rwd_directoryL2LHS[dst.directoryL2LHS]] := msg;
        cnt_rwd_directoryL2LHS[dst.directoryL2LHS] := cnt_rwd_directoryL2LHS[dst.directoryL2LHS] + 1;
      elsif !isundefined(dst.cacheL2LHS) then
        Assert(cnt_rwd_cacheL2LHS[dst.cacheL2LHS] < O_NET_MAX) "Too many messages: rwd_cacheL2LHS";
        rwd_cacheL2LHS[dst.cacheL2LHS][cnt_rwd_cacheL2LHS[dst.cacheL2LHS]] := msg;
        cnt_rwd_cacheL2LHS[dst.cacheL2LHS] := cnt_rwd_cacheL2LHS[dst.cacheL2LHS] + 1;
      elsif !isundefined(dst.abstractionRHS) then
        Assert(cnt_rwd_abstractionRHS[dst.abstractionRHS] < O_NET_MAX) "Too many messages: rwd_abstractionRHS";
        rwd_abstractionRHS[dst.abstractionRHS][cnt_rwd_abstractionRHS[dst.abstractionRHS]] := msg;
        cnt_rwd_abstractionRHS[dst.abstractionRHS] := cnt_rwd_abstractionRHS[dst.abstractionRHS] + 1;
      elsif !isundefined(dst.cacheL2RHS) then
        Assert(cnt_rwd_cacheL2RHS[dst.cacheL2RHS] < O_NET_MAX) "Too many messages: rwd_cacheL2RHS";
        rwd_cacheL2RHS[dst.cacheL2RHS][cnt_rwd_cacheL2RHS[dst.cacheL2RHS]] := msg;
        cnt_rwd_cacheL2RHS[dst.cacheL2RHS] := cnt_rwd_cacheL2RHS[dst.cacheL2RHS] + 1;
      elsif !isundefined(dst.directoryL2RHS) then
        Assert(cnt_rwd_directoryL2RHS[dst.directoryL2RHS] < O_NET_MAX) "Too many messages: rwd_directoryL2RHS";
        rwd_directoryL2RHS[dst.directoryL2RHS][cnt_rwd_directoryL2RHS[dst.directoryL2RHS]] := msg;
        cnt_rwd_directoryL2RHS[dst.directoryL2RHS] := cnt_rwd_directoryL2RHS[dst.directoryL2RHS] + 1;
      else
        error "unknown send machine";
      endif;
      if is_machine_in_state(src, systemLHSExt) then
        Send_rwd(map_LHS_msg_to_RHS(msg), map_LHS_to_RHS(src));
        BackupRHS();
      endif;
    
      endalias;
    end;
    
    procedure Pop_rwd(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1LHS) then
        error "Attempt to pop from queue rwd_cacheL1LHS, which is not modeled"; 
      elsif !isundefined(dst.directoryL1LHS) then
        Assert (cnt_rwd_directoryL1LHS[dst.directoryL1LHS] > 0) "Trying to advance empty queue: rwd_directoryL1LHS";
        for i := 0 to cnt_rwd_directoryL1LHS[dst.directoryL1LHS]-1 do
          if i < cnt_rwd_directoryL1LHS[dst.directoryL1LHS]-1 then
            rwd_directoryL1LHS[dst.directoryL1LHS][i] := rwd_directoryL1LHS[dst.directoryL1LHS][i+1];
          else
            undefine rwd_directoryL1LHS[dst.directoryL1LHS][i];
          endif;
        endfor;
        cnt_rwd_directoryL1LHS[dst.directoryL1LHS] := cnt_rwd_directoryL1LHS[dst.directoryL1LHS] - 1;
      elsif !isundefined(dst.directoryL2LHS) then
        Assert (cnt_rwd_directoryL2LHS[dst.directoryL2LHS] > 0) "Trying to advance empty queue: rwd_directoryL2LHS";
        for i := 0 to cnt_rwd_directoryL2LHS[dst.directoryL2LHS]-1 do
          if i < cnt_rwd_directoryL2LHS[dst.directoryL2LHS]-1 then
            rwd_directoryL2LHS[dst.directoryL2LHS][i] := rwd_directoryL2LHS[dst.directoryL2LHS][i+1];
          else
            undefine rwd_directoryL2LHS[dst.directoryL2LHS][i];
          endif;
        endfor;
        cnt_rwd_directoryL2LHS[dst.directoryL2LHS] := cnt_rwd_directoryL2LHS[dst.directoryL2LHS] - 1;
      elsif !isundefined(dst.cacheL2LHS) then
        Assert (cnt_rwd_cacheL2LHS[dst.cacheL2LHS] > 0) "Trying to advance empty queue: rwd_cacheL2LHS";
        for i := 0 to cnt_rwd_cacheL2LHS[dst.cacheL2LHS]-1 do
          if i < cnt_rwd_cacheL2LHS[dst.cacheL2LHS]-1 then
            rwd_cacheL2LHS[dst.cacheL2LHS][i] := rwd_cacheL2LHS[dst.cacheL2LHS][i+1];
          else
            undefine rwd_cacheL2LHS[dst.cacheL2LHS][i];
          endif;
        endfor;
        cnt_rwd_cacheL2LHS[dst.cacheL2LHS] := cnt_rwd_cacheL2LHS[dst.cacheL2LHS] - 1;
      elsif !isundefined(dst.abstractionRHS) then
        Assert (cnt_rwd_abstractionRHS[dst.abstractionRHS] > 0) "Trying to advance empty queue: rwd_abstractionRHS";
        for i := 0 to cnt_rwd_abstractionRHS[dst.abstractionRHS]-1 do
          if i < cnt_rwd_abstractionRHS[dst.abstractionRHS]-1 then
            rwd_abstractionRHS[dst.abstractionRHS][i] := rwd_abstractionRHS[dst.abstractionRHS][i+1];
          else
            undefine rwd_abstractionRHS[dst.abstractionRHS][i];
          endif;
        endfor;
        cnt_rwd_abstractionRHS[dst.abstractionRHS] := cnt_rwd_abstractionRHS[dst.abstractionRHS] - 1;
      elsif !isundefined(dst.cacheL2RHS) then
        Assert (cnt_rwd_cacheL2RHS[dst.cacheL2RHS] > 0) "Trying to advance empty queue: rwd_cacheL2RHS";
        for i := 0 to cnt_rwd_cacheL2RHS[dst.cacheL2RHS]-1 do
          if i < cnt_rwd_cacheL2RHS[dst.cacheL2RHS]-1 then
            rwd_cacheL2RHS[dst.cacheL2RHS][i] := rwd_cacheL2RHS[dst.cacheL2RHS][i+1];
          else
            undefine rwd_cacheL2RHS[dst.cacheL2RHS][i];
          endif;
        endfor;
        cnt_rwd_cacheL2RHS[dst.cacheL2RHS] := cnt_rwd_cacheL2RHS[dst.cacheL2RHS] - 1;
      elsif !isundefined(dst.directoryL2RHS) then
        Assert (cnt_rwd_directoryL2RHS[dst.directoryL2RHS] > 0) "Trying to advance empty queue: rwd_directoryL2RHS";
        for i := 0 to cnt_rwd_directoryL2RHS[dst.directoryL2RHS]-1 do
          if i < cnt_rwd_directoryL2RHS[dst.directoryL2RHS]-1 then
            rwd_directoryL2RHS[dst.directoryL2RHS][i] := rwd_directoryL2RHS[dst.directoryL2RHS][i+1];
          else
            undefine rwd_directoryL2RHS[dst.directoryL2RHS][i];
          endif;
        endfor;
        cnt_rwd_directoryL2RHS[dst.directoryL2RHS] := cnt_rwd_directoryL2RHS[dst.directoryL2RHS] - 1;
      else
        error "unknown pop machine";
      endif;
      if is_machine_in_state(dst, systemLHSExt) then
        Pop_rwd(map_LHS_to_RHS(dst), map_LHS_to_RHS(src));
        BackupRHS();
      endif;
    
    end;
    
    procedure Send_birsp(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1LHS) then
        error "Attempt to send to queue birsp_cacheL1LHS, which is not modeled"; 
      elsif !isundefined(dst.directoryL1LHS) then
        Assert(cnt_birsp_directoryL1LHS[dst.directoryL1LHS] < O_NET_MAX) "Too many messages: birsp_directoryL1LHS";
        birsp_directoryL1LHS[dst.directoryL1LHS][cnt_birsp_directoryL1LHS[dst.directoryL1LHS]] := msg;
        cnt_birsp_directoryL1LHS[dst.directoryL1LHS] := cnt_birsp_directoryL1LHS[dst.directoryL1LHS] + 1;
      elsif !isundefined(dst.directoryL2LHS) then
        Assert(cnt_birsp_directoryL2LHS[dst.directoryL2LHS] < O_NET_MAX) "Too many messages: birsp_directoryL2LHS";
        birsp_directoryL2LHS[dst.directoryL2LHS][cnt_birsp_directoryL2LHS[dst.directoryL2LHS]] := msg;
        cnt_birsp_directoryL2LHS[dst.directoryL2LHS] := cnt_birsp_directoryL2LHS[dst.directoryL2LHS] + 1;
      elsif !isundefined(dst.cacheL2LHS) then
        Assert(cnt_birsp_cacheL2LHS[dst.cacheL2LHS] < O_NET_MAX) "Too many messages: birsp_cacheL2LHS";
        birsp_cacheL2LHS[dst.cacheL2LHS][cnt_birsp_cacheL2LHS[dst.cacheL2LHS]] := msg;
        cnt_birsp_cacheL2LHS[dst.cacheL2LHS] := cnt_birsp_cacheL2LHS[dst.cacheL2LHS] + 1;
      elsif !isundefined(dst.abstractionRHS) then
        Assert(cnt_birsp_abstractionRHS[dst.abstractionRHS] < O_NET_MAX) "Too many messages: birsp_abstractionRHS";
        birsp_abstractionRHS[dst.abstractionRHS][cnt_birsp_abstractionRHS[dst.abstractionRHS]] := msg;
        cnt_birsp_abstractionRHS[dst.abstractionRHS] := cnt_birsp_abstractionRHS[dst.abstractionRHS] + 1;
      elsif !isundefined(dst.cacheL2RHS) then
        Assert(cnt_birsp_cacheL2RHS[dst.cacheL2RHS] < O_NET_MAX) "Too many messages: birsp_cacheL2RHS";
        birsp_cacheL2RHS[dst.cacheL2RHS][cnt_birsp_cacheL2RHS[dst.cacheL2RHS]] := msg;
        cnt_birsp_cacheL2RHS[dst.cacheL2RHS] := cnt_birsp_cacheL2RHS[dst.cacheL2RHS] + 1;
      elsif !isundefined(dst.directoryL2RHS) then
        Assert(cnt_birsp_directoryL2RHS[dst.directoryL2RHS] < O_NET_MAX) "Too many messages: birsp_directoryL2RHS";
        birsp_directoryL2RHS[dst.directoryL2RHS][cnt_birsp_directoryL2RHS[dst.directoryL2RHS]] := msg;
        cnt_birsp_directoryL2RHS[dst.directoryL2RHS] := cnt_birsp_directoryL2RHS[dst.directoryL2RHS] + 1;
      else
        error "unknown send machine";
      endif;
      if is_machine_in_state(src, systemLHSExt) then
        Send_birsp(map_LHS_msg_to_RHS(msg), map_LHS_to_RHS(src));
        BackupRHS();
      endif;
    
      endalias;
    end;
    
    procedure Pop_birsp(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1LHS) then
        error "Attempt to pop from queue birsp_cacheL1LHS, which is not modeled"; 
      elsif !isundefined(dst.directoryL1LHS) then
        Assert (cnt_birsp_directoryL1LHS[dst.directoryL1LHS] > 0) "Trying to advance empty queue: birsp_directoryL1LHS";
        for i := 0 to cnt_birsp_directoryL1LHS[dst.directoryL1LHS]-1 do
          if i < cnt_birsp_directoryL1LHS[dst.directoryL1LHS]-1 then
            birsp_directoryL1LHS[dst.directoryL1LHS][i] := birsp_directoryL1LHS[dst.directoryL1LHS][i+1];
          else
            undefine birsp_directoryL1LHS[dst.directoryL1LHS][i];
          endif;
        endfor;
        cnt_birsp_directoryL1LHS[dst.directoryL1LHS] := cnt_birsp_directoryL1LHS[dst.directoryL1LHS] - 1;
      elsif !isundefined(dst.directoryL2LHS) then
        Assert (cnt_birsp_directoryL2LHS[dst.directoryL2LHS] > 0) "Trying to advance empty queue: birsp_directoryL2LHS";
        for i := 0 to cnt_birsp_directoryL2LHS[dst.directoryL2LHS]-1 do
          if i < cnt_birsp_directoryL2LHS[dst.directoryL2LHS]-1 then
            birsp_directoryL2LHS[dst.directoryL2LHS][i] := birsp_directoryL2LHS[dst.directoryL2LHS][i+1];
          else
            undefine birsp_directoryL2LHS[dst.directoryL2LHS][i];
          endif;
        endfor;
        cnt_birsp_directoryL2LHS[dst.directoryL2LHS] := cnt_birsp_directoryL2LHS[dst.directoryL2LHS] - 1;
      elsif !isundefined(dst.cacheL2LHS) then
        Assert (cnt_birsp_cacheL2LHS[dst.cacheL2LHS] > 0) "Trying to advance empty queue: birsp_cacheL2LHS";
        for i := 0 to cnt_birsp_cacheL2LHS[dst.cacheL2LHS]-1 do
          if i < cnt_birsp_cacheL2LHS[dst.cacheL2LHS]-1 then
            birsp_cacheL2LHS[dst.cacheL2LHS][i] := birsp_cacheL2LHS[dst.cacheL2LHS][i+1];
          else
            undefine birsp_cacheL2LHS[dst.cacheL2LHS][i];
          endif;
        endfor;
        cnt_birsp_cacheL2LHS[dst.cacheL2LHS] := cnt_birsp_cacheL2LHS[dst.cacheL2LHS] - 1;
      elsif !isundefined(dst.abstractionRHS) then
        Assert (cnt_birsp_abstractionRHS[dst.abstractionRHS] > 0) "Trying to advance empty queue: birsp_abstractionRHS";
        for i := 0 to cnt_birsp_abstractionRHS[dst.abstractionRHS]-1 do
          if i < cnt_birsp_abstractionRHS[dst.abstractionRHS]-1 then
            birsp_abstractionRHS[dst.abstractionRHS][i] := birsp_abstractionRHS[dst.abstractionRHS][i+1];
          else
            undefine birsp_abstractionRHS[dst.abstractionRHS][i];
          endif;
        endfor;
        cnt_birsp_abstractionRHS[dst.abstractionRHS] := cnt_birsp_abstractionRHS[dst.abstractionRHS] - 1;
      elsif !isundefined(dst.cacheL2RHS) then
        Assert (cnt_birsp_cacheL2RHS[dst.cacheL2RHS] > 0) "Trying to advance empty queue: birsp_cacheL2RHS";
        for i := 0 to cnt_birsp_cacheL2RHS[dst.cacheL2RHS]-1 do
          if i < cnt_birsp_cacheL2RHS[dst.cacheL2RHS]-1 then
            birsp_cacheL2RHS[dst.cacheL2RHS][i] := birsp_cacheL2RHS[dst.cacheL2RHS][i+1];
          else
            undefine birsp_cacheL2RHS[dst.cacheL2RHS][i];
          endif;
        endfor;
        cnt_birsp_cacheL2RHS[dst.cacheL2RHS] := cnt_birsp_cacheL2RHS[dst.cacheL2RHS] - 1;
      elsif !isundefined(dst.directoryL2RHS) then
        Assert (cnt_birsp_directoryL2RHS[dst.directoryL2RHS] > 0) "Trying to advance empty queue: birsp_directoryL2RHS";
        for i := 0 to cnt_birsp_directoryL2RHS[dst.directoryL2RHS]-1 do
          if i < cnt_birsp_directoryL2RHS[dst.directoryL2RHS]-1 then
            birsp_directoryL2RHS[dst.directoryL2RHS][i] := birsp_directoryL2RHS[dst.directoryL2RHS][i+1];
          else
            undefine birsp_directoryL2RHS[dst.directoryL2RHS][i];
          endif;
        endfor;
        cnt_birsp_directoryL2RHS[dst.directoryL2RHS] := cnt_birsp_directoryL2RHS[dst.directoryL2RHS] - 1;
      else
        error "unknown pop machine";
      endif;
      if is_machine_in_state(dst, systemLHSExt) then
        Pop_birsp(map_LHS_to_RHS(dst), map_LHS_to_RHS(src));
        BackupRHS();
      endif;
    
    end;
    
    procedure Send_drs(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1LHS) then
        error "Attempt to send to queue drs_cacheL1LHS, which is not modeled"; 
      elsif !isundefined(dst.directoryL1LHS) then
        Assert(cnt_drs_directoryL1LHS[dst.directoryL1LHS] < O_NET_MAX) "Too many messages: drs_directoryL1LHS";
        drs_directoryL1LHS[dst.directoryL1LHS][cnt_drs_directoryL1LHS[dst.directoryL1LHS]] := msg;
        cnt_drs_directoryL1LHS[dst.directoryL1LHS] := cnt_drs_directoryL1LHS[dst.directoryL1LHS] + 1;
      elsif !isundefined(dst.directoryL2LHS) then
        Assert(cnt_drs_directoryL2LHS[dst.directoryL2LHS] < O_NET_MAX) "Too many messages: drs_directoryL2LHS";
        drs_directoryL2LHS[dst.directoryL2LHS][cnt_drs_directoryL2LHS[dst.directoryL2LHS]] := msg;
        cnt_drs_directoryL2LHS[dst.directoryL2LHS] := cnt_drs_directoryL2LHS[dst.directoryL2LHS] + 1;
      elsif !isundefined(dst.cacheL2LHS) then
        Assert(cnt_drs_cacheL2LHS[dst.cacheL2LHS] < O_NET_MAX) "Too many messages: drs_cacheL2LHS";
        drs_cacheL2LHS[dst.cacheL2LHS][cnt_drs_cacheL2LHS[dst.cacheL2LHS]] := msg;
        cnt_drs_cacheL2LHS[dst.cacheL2LHS] := cnt_drs_cacheL2LHS[dst.cacheL2LHS] + 1;
      elsif !isundefined(dst.abstractionRHS) then
        Assert(cnt_drs_abstractionRHS[dst.abstractionRHS] < O_NET_MAX) "Too many messages: drs_abstractionRHS";
        drs_abstractionRHS[dst.abstractionRHS][cnt_drs_abstractionRHS[dst.abstractionRHS]] := msg;
        cnt_drs_abstractionRHS[dst.abstractionRHS] := cnt_drs_abstractionRHS[dst.abstractionRHS] + 1;
      elsif !isundefined(dst.cacheL2RHS) then
        Assert(cnt_drs_cacheL2RHS[dst.cacheL2RHS] < O_NET_MAX) "Too many messages: drs_cacheL2RHS";
        drs_cacheL2RHS[dst.cacheL2RHS][cnt_drs_cacheL2RHS[dst.cacheL2RHS]] := msg;
        cnt_drs_cacheL2RHS[dst.cacheL2RHS] := cnt_drs_cacheL2RHS[dst.cacheL2RHS] + 1;
      elsif !isundefined(dst.directoryL2RHS) then
        Assert(cnt_drs_directoryL2RHS[dst.directoryL2RHS] < O_NET_MAX) "Too many messages: drs_directoryL2RHS";
        drs_directoryL2RHS[dst.directoryL2RHS][cnt_drs_directoryL2RHS[dst.directoryL2RHS]] := msg;
        cnt_drs_directoryL2RHS[dst.directoryL2RHS] := cnt_drs_directoryL2RHS[dst.directoryL2RHS] + 1;
      else
        error "unknown send machine";
      endif;
      if is_machine_in_state(src, systemLHSExt) then
        Send_drs(map_LHS_msg_to_RHS(msg), map_LHS_to_RHS(src));
        BackupRHS();
      endif;
    
      endalias;
    end;
    
    procedure Pop_drs(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1LHS) then
        error "Attempt to pop from queue drs_cacheL1LHS, which is not modeled"; 
      elsif !isundefined(dst.directoryL1LHS) then
        Assert (cnt_drs_directoryL1LHS[dst.directoryL1LHS] > 0) "Trying to advance empty queue: drs_directoryL1LHS";
        for i := 0 to cnt_drs_directoryL1LHS[dst.directoryL1LHS]-1 do
          if i < cnt_drs_directoryL1LHS[dst.directoryL1LHS]-1 then
            drs_directoryL1LHS[dst.directoryL1LHS][i] := drs_directoryL1LHS[dst.directoryL1LHS][i+1];
          else
            undefine drs_directoryL1LHS[dst.directoryL1LHS][i];
          endif;
        endfor;
        cnt_drs_directoryL1LHS[dst.directoryL1LHS] := cnt_drs_directoryL1LHS[dst.directoryL1LHS] - 1;
      elsif !isundefined(dst.directoryL2LHS) then
        Assert (cnt_drs_directoryL2LHS[dst.directoryL2LHS] > 0) "Trying to advance empty queue: drs_directoryL2LHS";
        for i := 0 to cnt_drs_directoryL2LHS[dst.directoryL2LHS]-1 do
          if i < cnt_drs_directoryL2LHS[dst.directoryL2LHS]-1 then
            drs_directoryL2LHS[dst.directoryL2LHS][i] := drs_directoryL2LHS[dst.directoryL2LHS][i+1];
          else
            undefine drs_directoryL2LHS[dst.directoryL2LHS][i];
          endif;
        endfor;
        cnt_drs_directoryL2LHS[dst.directoryL2LHS] := cnt_drs_directoryL2LHS[dst.directoryL2LHS] - 1;
      elsif !isundefined(dst.cacheL2LHS) then
        Assert (cnt_drs_cacheL2LHS[dst.cacheL2LHS] > 0) "Trying to advance empty queue: drs_cacheL2LHS";
        for i := 0 to cnt_drs_cacheL2LHS[dst.cacheL2LHS]-1 do
          if i < cnt_drs_cacheL2LHS[dst.cacheL2LHS]-1 then
            drs_cacheL2LHS[dst.cacheL2LHS][i] := drs_cacheL2LHS[dst.cacheL2LHS][i+1];
          else
            undefine drs_cacheL2LHS[dst.cacheL2LHS][i];
          endif;
        endfor;
        cnt_drs_cacheL2LHS[dst.cacheL2LHS] := cnt_drs_cacheL2LHS[dst.cacheL2LHS] - 1;
      elsif !isundefined(dst.abstractionRHS) then
        Assert (cnt_drs_abstractionRHS[dst.abstractionRHS] > 0) "Trying to advance empty queue: drs_abstractionRHS";
        for i := 0 to cnt_drs_abstractionRHS[dst.abstractionRHS]-1 do
          if i < cnt_drs_abstractionRHS[dst.abstractionRHS]-1 then
            drs_abstractionRHS[dst.abstractionRHS][i] := drs_abstractionRHS[dst.abstractionRHS][i+1];
          else
            undefine drs_abstractionRHS[dst.abstractionRHS][i];
          endif;
        endfor;
        cnt_drs_abstractionRHS[dst.abstractionRHS] := cnt_drs_abstractionRHS[dst.abstractionRHS] - 1;
      elsif !isundefined(dst.cacheL2RHS) then
        Assert (cnt_drs_cacheL2RHS[dst.cacheL2RHS] > 0) "Trying to advance empty queue: drs_cacheL2RHS";
        for i := 0 to cnt_drs_cacheL2RHS[dst.cacheL2RHS]-1 do
          if i < cnt_drs_cacheL2RHS[dst.cacheL2RHS]-1 then
            drs_cacheL2RHS[dst.cacheL2RHS][i] := drs_cacheL2RHS[dst.cacheL2RHS][i+1];
          else
            undefine drs_cacheL2RHS[dst.cacheL2RHS][i];
          endif;
        endfor;
        cnt_drs_cacheL2RHS[dst.cacheL2RHS] := cnt_drs_cacheL2RHS[dst.cacheL2RHS] - 1;
      elsif !isundefined(dst.directoryL2RHS) then
        Assert (cnt_drs_directoryL2RHS[dst.directoryL2RHS] > 0) "Trying to advance empty queue: drs_directoryL2RHS";
        for i := 0 to cnt_drs_directoryL2RHS[dst.directoryL2RHS]-1 do
          if i < cnt_drs_directoryL2RHS[dst.directoryL2RHS]-1 then
            drs_directoryL2RHS[dst.directoryL2RHS][i] := drs_directoryL2RHS[dst.directoryL2RHS][i+1];
          else
            undefine drs_directoryL2RHS[dst.directoryL2RHS][i];
          endif;
        endfor;
        cnt_drs_directoryL2RHS[dst.directoryL2RHS] := cnt_drs_directoryL2RHS[dst.directoryL2RHS] - 1;
      else
        error "unknown pop machine";
      endif;
      if is_machine_in_state(dst, systemLHSExt) then
        Pop_drs(map_LHS_to_RHS(dst), map_LHS_to_RHS(src));
        BackupRHS();
      endif;
    
    end;
    
    procedure Send_ndr(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1LHS) then
        error "Attempt to send to queue ndr_cacheL1LHS, which is not modeled"; 
      elsif !isundefined(dst.directoryL1LHS) then
        Assert(cnt_ndr_directoryL1LHS[dst.directoryL1LHS] < O_NET_MAX) "Too many messages: ndr_directoryL1LHS";
        ndr_directoryL1LHS[dst.directoryL1LHS][cnt_ndr_directoryL1LHS[dst.directoryL1LHS]] := msg;
        cnt_ndr_directoryL1LHS[dst.directoryL1LHS] := cnt_ndr_directoryL1LHS[dst.directoryL1LHS] + 1;
      elsif !isundefined(dst.directoryL2LHS) then
        Assert(cnt_ndr_directoryL2LHS[dst.directoryL2LHS] < O_NET_MAX) "Too many messages: ndr_directoryL2LHS";
        ndr_directoryL2LHS[dst.directoryL2LHS][cnt_ndr_directoryL2LHS[dst.directoryL2LHS]] := msg;
        cnt_ndr_directoryL2LHS[dst.directoryL2LHS] := cnt_ndr_directoryL2LHS[dst.directoryL2LHS] + 1;
      elsif !isundefined(dst.cacheL2LHS) then
        Assert(cnt_ndr_cacheL2LHS[dst.cacheL2LHS] < O_NET_MAX) "Too many messages: ndr_cacheL2LHS";
        ndr_cacheL2LHS[dst.cacheL2LHS][cnt_ndr_cacheL2LHS[dst.cacheL2LHS]] := msg;
        cnt_ndr_cacheL2LHS[dst.cacheL2LHS] := cnt_ndr_cacheL2LHS[dst.cacheL2LHS] + 1;
      elsif !isundefined(dst.abstractionRHS) then
        Assert(cnt_ndr_abstractionRHS[dst.abstractionRHS] < O_NET_MAX) "Too many messages: ndr_abstractionRHS";
        ndr_abstractionRHS[dst.abstractionRHS][cnt_ndr_abstractionRHS[dst.abstractionRHS]] := msg;
        cnt_ndr_abstractionRHS[dst.abstractionRHS] := cnt_ndr_abstractionRHS[dst.abstractionRHS] + 1;
      elsif !isundefined(dst.cacheL2RHS) then
        Assert(cnt_ndr_cacheL2RHS[dst.cacheL2RHS] < O_NET_MAX) "Too many messages: ndr_cacheL2RHS";
        ndr_cacheL2RHS[dst.cacheL2RHS][cnt_ndr_cacheL2RHS[dst.cacheL2RHS]] := msg;
        cnt_ndr_cacheL2RHS[dst.cacheL2RHS] := cnt_ndr_cacheL2RHS[dst.cacheL2RHS] + 1;
      elsif !isundefined(dst.directoryL2RHS) then
        Assert(cnt_ndr_directoryL2RHS[dst.directoryL2RHS] < O_NET_MAX) "Too many messages: ndr_directoryL2RHS";
        ndr_directoryL2RHS[dst.directoryL2RHS][cnt_ndr_directoryL2RHS[dst.directoryL2RHS]] := msg;
        cnt_ndr_directoryL2RHS[dst.directoryL2RHS] := cnt_ndr_directoryL2RHS[dst.directoryL2RHS] + 1;
      else
        error "unknown send machine";
      endif;
      if is_machine_in_state(src, systemLHSExt) then
        Send_ndr(map_LHS_msg_to_RHS(msg), map_LHS_to_RHS(src));
        BackupRHS();
      endif;
    
      endalias;
    end;
    
    procedure Pop_ndr(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1LHS) then
        error "Attempt to pop from queue ndr_cacheL1LHS, which is not modeled"; 
      elsif !isundefined(dst.directoryL1LHS) then
        Assert (cnt_ndr_directoryL1LHS[dst.directoryL1LHS] > 0) "Trying to advance empty queue: ndr_directoryL1LHS";
        for i := 0 to cnt_ndr_directoryL1LHS[dst.directoryL1LHS]-1 do
          if i < cnt_ndr_directoryL1LHS[dst.directoryL1LHS]-1 then
            ndr_directoryL1LHS[dst.directoryL1LHS][i] := ndr_directoryL1LHS[dst.directoryL1LHS][i+1];
          else
            undefine ndr_directoryL1LHS[dst.directoryL1LHS][i];
          endif;
        endfor;
        cnt_ndr_directoryL1LHS[dst.directoryL1LHS] := cnt_ndr_directoryL1LHS[dst.directoryL1LHS] - 1;
      elsif !isundefined(dst.directoryL2LHS) then
        Assert (cnt_ndr_directoryL2LHS[dst.directoryL2LHS] > 0) "Trying to advance empty queue: ndr_directoryL2LHS";
        for i := 0 to cnt_ndr_directoryL2LHS[dst.directoryL2LHS]-1 do
          if i < cnt_ndr_directoryL2LHS[dst.directoryL2LHS]-1 then
            ndr_directoryL2LHS[dst.directoryL2LHS][i] := ndr_directoryL2LHS[dst.directoryL2LHS][i+1];
          else
            undefine ndr_directoryL2LHS[dst.directoryL2LHS][i];
          endif;
        endfor;
        cnt_ndr_directoryL2LHS[dst.directoryL2LHS] := cnt_ndr_directoryL2LHS[dst.directoryL2LHS] - 1;
      elsif !isundefined(dst.cacheL2LHS) then
        Assert (cnt_ndr_cacheL2LHS[dst.cacheL2LHS] > 0) "Trying to advance empty queue: ndr_cacheL2LHS";
        for i := 0 to cnt_ndr_cacheL2LHS[dst.cacheL2LHS]-1 do
          if i < cnt_ndr_cacheL2LHS[dst.cacheL2LHS]-1 then
            ndr_cacheL2LHS[dst.cacheL2LHS][i] := ndr_cacheL2LHS[dst.cacheL2LHS][i+1];
          else
            undefine ndr_cacheL2LHS[dst.cacheL2LHS][i];
          endif;
        endfor;
        cnt_ndr_cacheL2LHS[dst.cacheL2LHS] := cnt_ndr_cacheL2LHS[dst.cacheL2LHS] - 1;
      elsif !isundefined(dst.abstractionRHS) then
        Assert (cnt_ndr_abstractionRHS[dst.abstractionRHS] > 0) "Trying to advance empty queue: ndr_abstractionRHS";
        for i := 0 to cnt_ndr_abstractionRHS[dst.abstractionRHS]-1 do
          if i < cnt_ndr_abstractionRHS[dst.abstractionRHS]-1 then
            ndr_abstractionRHS[dst.abstractionRHS][i] := ndr_abstractionRHS[dst.abstractionRHS][i+1];
          else
            undefine ndr_abstractionRHS[dst.abstractionRHS][i];
          endif;
        endfor;
        cnt_ndr_abstractionRHS[dst.abstractionRHS] := cnt_ndr_abstractionRHS[dst.abstractionRHS] - 1;
      elsif !isundefined(dst.cacheL2RHS) then
        Assert (cnt_ndr_cacheL2RHS[dst.cacheL2RHS] > 0) "Trying to advance empty queue: ndr_cacheL2RHS";
        for i := 0 to cnt_ndr_cacheL2RHS[dst.cacheL2RHS]-1 do
          if i < cnt_ndr_cacheL2RHS[dst.cacheL2RHS]-1 then
            ndr_cacheL2RHS[dst.cacheL2RHS][i] := ndr_cacheL2RHS[dst.cacheL2RHS][i+1];
          else
            undefine ndr_cacheL2RHS[dst.cacheL2RHS][i];
          endif;
        endfor;
        cnt_ndr_cacheL2RHS[dst.cacheL2RHS] := cnt_ndr_cacheL2RHS[dst.cacheL2RHS] - 1;
      elsif !isundefined(dst.directoryL2RHS) then
        Assert (cnt_ndr_directoryL2RHS[dst.directoryL2RHS] > 0) "Trying to advance empty queue: ndr_directoryL2RHS";
        for i := 0 to cnt_ndr_directoryL2RHS[dst.directoryL2RHS]-1 do
          if i < cnt_ndr_directoryL2RHS[dst.directoryL2RHS]-1 then
            ndr_directoryL2RHS[dst.directoryL2RHS][i] := ndr_directoryL2RHS[dst.directoryL2RHS][i+1];
          else
            undefine ndr_directoryL2RHS[dst.directoryL2RHS][i];
          endif;
        endfor;
        cnt_ndr_directoryL2RHS[dst.directoryL2RHS] := cnt_ndr_directoryL2RHS[dst.directoryL2RHS] - 1;
      else
        error "unknown pop machine";
      endif;
      if is_machine_in_state(dst, systemLHSExt) then
        Pop_ndr(map_LHS_to_RHS(dst), map_LHS_to_RHS(src));
        BackupRHS();
      endif;
    
    end;
    
    procedure Multicast_fwd_v_cacheL1(var msg: Message; dst_vect: v_cacheL1; src: Machines;);
    begin
      for n : OBJSET_cacheL2RHS do
        if IsElement_cacheL1(dst_vect, to_m_cacheL2RHS(n)) then
          msg.dst := to_m_cacheL2RHS(n);
          Send_fwd(msg, src);
        endif;
      endfor;
      for n : OBJSET_abstractionRHS do
        if IsElement_cacheL1(dst_vect, to_m_abstractionRHS(n)) then
          msg.dst := to_m_abstractionRHS(n);
          Send_fwd(msg, src);
        endif;
      endfor;
      for n : OBJSET_cacheL2LHS do
        if IsElement_cacheL1(dst_vect, to_m_cacheL2LHS(n)) then
          msg.dst := to_m_cacheL2LHS(n);
          Send_fwd(msg, src);
        endif;
      endfor;
      for n : OBJSET_cacheL1LHS do
        if IsElement_cacheL1(dst_vect, to_m_cacheL1LHS(n)) then
          msg.dst := to_m_cacheL1LHS(n);
          Send_fwd(msg, src);
        endif;
      endfor;
      for n : OBJSET_directoryL2RHS do
        if IsElement_cacheL1(dst_vect, to_m_directoryL2RHS(n)) then
          msg.dst := to_m_directoryL2RHS(n);
          Send_fwd(msg, src);
        endif;
      endfor;
      for n : OBJSET_directoryL2LHS do
        if IsElement_cacheL1(dst_vect, to_m_directoryL2LHS(n)) then
          msg.dst := to_m_directoryL2LHS(n);
          Send_fwd(msg, src);
        endif;
      endfor;
    
    end;
    
    procedure Multicast_bisnp_v_cacheL2(var msg: Message; dst_vect: v_cacheL2; src: Machines;);
    begin
      for n : OBJSET_directoryL1LHS do
        if IsElement_cacheL2(dst_vect, to_m_directoryL1LHS(n)) then
          msg.dst := to_m_directoryL1LHS(n);
          Send_bisnp(msg, src);
        endif;
      endfor;
      for n : OBJSET_cacheL2RHS do
        if IsElement_cacheL2(dst_vect, to_m_cacheL2RHS(n)) then
          msg.dst := to_m_cacheL2RHS(n);
          Send_bisnp(msg, src);
        endif;
      endfor;
      for n : OBJSET_abstractionRHS do
        if IsElement_cacheL2(dst_vect, to_m_abstractionRHS(n)) then
          msg.dst := to_m_abstractionRHS(n);
          Send_bisnp(msg, src);
        endif;
      endfor;
      for n : OBJSET_cacheL2LHS do
        if IsElement_cacheL2(dst_vect, to_m_cacheL2LHS(n)) then
          msg.dst := to_m_cacheL2LHS(n);
          Send_bisnp(msg, src);
        endif;
      endfor;
      for n : OBJSET_cacheL1LHS do
        if IsElement_cacheL2(dst_vect, to_m_cacheL1LHS(n)) then
          msg.dst := to_m_cacheL1LHS(n);
          Send_bisnp(msg, src);
        endif;
      endfor;
      for n : OBJSET_directoryL2RHS do
        if IsElement_cacheL2(dst_vect, to_m_directoryL2RHS(n)) then
          msg.dst := to_m_directoryL2RHS(n);
          Send_bisnp(msg, src);
        endif;
      endfor;
    
    end;
    
    function fwd_LHS_network_ready(): boolean;
    begin
      for dst:OBJSET_directoryL1LHS do
        if cnt_fwd_directoryL1LHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_cacheL1LHS do
        if cnt_fwd_cacheL1LHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function fwd_RHS_network_ready(): boolean;
    begin
      for dst:OBJSET_abstractionRHS do
        if cnt_fwd_abstractionRHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function bisnp_LHS_network_ready(): boolean;
    begin
      for dst:OBJSET_directoryL1LHS do
        if cnt_bisnp_directoryL1LHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_cacheL2LHS do
        if cnt_bisnp_cacheL2LHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2LHS do
        if cnt_bisnp_directoryL2LHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function bisnp_RHS_network_ready(): boolean;
    begin
      for dst:OBJSET_cacheL2RHS do
        if cnt_bisnp_cacheL2RHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_abstractionRHS do
        if cnt_bisnp_abstractionRHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2RHS do
        if cnt_bisnp_directoryL2RHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function req2_LHS_network_ready(): boolean;
    begin
      for dst:OBJSET_directoryL1LHS do
        if cnt_req2_directoryL1LHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_cacheL2LHS do
        if cnt_req2_cacheL2LHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2LHS do
        if cnt_req2_directoryL2LHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function req2_RHS_network_ready(): boolean;
    begin
      for dst:OBJSET_cacheL2RHS do
        if cnt_req2_cacheL2RHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_abstractionRHS do
        if cnt_req2_abstractionRHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2RHS do
        if cnt_req2_directoryL2RHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function resp_LHS_network_ready(): boolean;
    begin
      for dst:OBJSET_directoryL1LHS do
        if cnt_resp_directoryL1LHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_cacheL1LHS do
        if cnt_resp_cacheL1LHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function resp_RHS_network_ready(): boolean;
    begin
      for dst:OBJSET_abstractionRHS do
        if cnt_resp_abstractionRHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function rwd_LHS_network_ready(): boolean;
    begin
      for dst:OBJSET_directoryL1LHS do
        if cnt_rwd_directoryL1LHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_cacheL2LHS do
        if cnt_rwd_cacheL2LHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2LHS do
        if cnt_rwd_directoryL2LHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function rwd_RHS_network_ready(): boolean;
    begin
      for dst:OBJSET_cacheL2RHS do
        if cnt_rwd_cacheL2RHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_abstractionRHS do
        if cnt_rwd_abstractionRHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2RHS do
        if cnt_rwd_directoryL2RHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function birsp_LHS_network_ready(): boolean;
    begin
      for dst:OBJSET_directoryL1LHS do
        if cnt_birsp_directoryL1LHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_cacheL2LHS do
        if cnt_birsp_cacheL2LHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2LHS do
        if cnt_birsp_directoryL2LHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function birsp_RHS_network_ready(): boolean;
    begin
      for dst:OBJSET_cacheL2RHS do
        if cnt_birsp_cacheL2RHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_abstractionRHS do
        if cnt_birsp_abstractionRHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2RHS do
        if cnt_birsp_directoryL2RHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function req_LHS_network_ready(): boolean;
    begin
      for dst:OBJSET_directoryL1LHS do
        if cnt_req_directoryL1LHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function req_RHS_network_ready(): boolean;
    begin
      for dst:OBJSET_abstractionRHS do
        if cnt_req_abstractionRHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function drs_LHS_network_ready(): boolean;
    begin
      for dst:OBJSET_directoryL1LHS do
        if cnt_drs_directoryL1LHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_cacheL2LHS do
        if cnt_drs_cacheL2LHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2LHS do
        if cnt_drs_directoryL2LHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function drs_RHS_network_ready(): boolean;
    begin
      for dst:OBJSET_cacheL2RHS do
        if cnt_drs_cacheL2RHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_abstractionRHS do
        if cnt_drs_abstractionRHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2RHS do
        if cnt_drs_directoryL2RHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function ndr_LHS_network_ready(): boolean;
    begin
      for dst:OBJSET_directoryL1LHS do
        if cnt_ndr_directoryL1LHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_cacheL2LHS do
        if cnt_ndr_cacheL2LHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2LHS do
        if cnt_ndr_directoryL2LHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function ndr_RHS_network_ready(): boolean;
    begin
      for dst:OBJSET_cacheL2RHS do
        if cnt_ndr_cacheL2RHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_abstractionRHS do
        if cnt_ndr_abstractionRHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2RHS do
        if cnt_ndr_directoryL2RHS[dst] >= (O_NET_MAX-8) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function network_LHS_ready(): boolean;
    begin
            if !fwd_LHS_network_ready() then
            return false;
          endif;
    
    
          if !bisnp_LHS_network_ready() then
            return false;
          endif;
    
    
          if !req2_LHS_network_ready() then
            return false;
          endif;
    
    
          if !resp_LHS_network_ready() then
            return false;
          endif;
    
    
          if !rwd_LHS_network_ready() then
            return false;
          endif;
    
    
          if !birsp_LHS_network_ready() then
            return false;
          endif;
    
    
          if !req_LHS_network_ready() then
            return false;
          endif;
    
    
          if !drs_LHS_network_ready() then
            return false;
          endif;
    
    
          if !ndr_LHS_network_ready() then
            return false;
          endif;
    
    
    
      return true;
    end;
    function network_RHS_ready(): boolean;
    begin
            if !fwd_RHS_network_ready() then
            return false;
          endif;
    
    
          if !bisnp_RHS_network_ready() then
            return false;
          endif;
    
    
          if !req2_RHS_network_ready() then
            return false;
          endif;
    
    
          if !resp_RHS_network_ready() then
            return false;
          endif;
    
    
          if !rwd_RHS_network_ready() then
            return false;
          endif;
    
    
          if !birsp_RHS_network_ready() then
            return false;
          endif;
    
    
          if !req_RHS_network_ready() then
            return false;
          endif;
    
    
          if !drs_RHS_network_ready() then
            return false;
          endif;
    
    
          if !ndr_RHS_network_ready() then
            return false;
          endif;
    
    
    
      return true;
    end;
    
    function fwd_LHS_network_used(): boolean;
    begin
      for dst:OBJSET_directoryL1LHS do
        if cnt_fwd_directoryL1LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_cacheL1LHS do
        if cnt_fwd_cacheL1LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
    
    
      return false ;
    end;
    function fwd_RHS_network_used(): boolean;
    begin
      for dst:OBJSET_abstractionRHS do
        if cnt_fwd_abstractionRHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
    
    
      return false ;
    end;
    function bisnp_LHS_network_used(): boolean;
    begin
      for dst:OBJSET_directoryL1LHS do
        if cnt_bisnp_directoryL1LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_cacheL2LHS do
        if cnt_bisnp_cacheL2LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_directoryL2LHS do
        if cnt_bisnp_directoryL2LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
    
    
      return false ;
    end;
    function bisnp_RHS_network_used(): boolean;
    begin
      for dst:OBJSET_cacheL2RHS do
        if cnt_bisnp_cacheL2RHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_abstractionRHS do
        if cnt_bisnp_abstractionRHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_directoryL2RHS do
        if cnt_bisnp_directoryL2RHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
    
    
      return false ;
    end;
    function req2_LHS_network_used(): boolean;
    begin
      for dst:OBJSET_directoryL1LHS do
        if cnt_req2_directoryL1LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_cacheL2LHS do
        if cnt_req2_cacheL2LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_directoryL2LHS do
        if cnt_req2_directoryL2LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
    
    
      return false ;
    end;
    function req2_RHS_network_used(): boolean;
    begin
      for dst:OBJSET_cacheL2RHS do
        if cnt_req2_cacheL2RHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_abstractionRHS do
        if cnt_req2_abstractionRHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_directoryL2RHS do
        if cnt_req2_directoryL2RHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
    
    
      return false ;
    end;
    function resp_LHS_network_used(): boolean;
    begin
      for dst:OBJSET_directoryL1LHS do
        if cnt_resp_directoryL1LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_cacheL1LHS do
        if cnt_resp_cacheL1LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
    
    
      return false ;
    end;
    function resp_RHS_network_used(): boolean;
    begin
      for dst:OBJSET_abstractionRHS do
        if cnt_resp_abstractionRHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
    
    
      return false ;
    end;
    function rwd_LHS_network_used(): boolean;
    begin
      for dst:OBJSET_directoryL1LHS do
        if cnt_rwd_directoryL1LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_cacheL2LHS do
        if cnt_rwd_cacheL2LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_directoryL2LHS do
        if cnt_rwd_directoryL2LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
    
    
      return false ;
    end;
    function rwd_RHS_network_used(): boolean;
    begin
      for dst:OBJSET_cacheL2RHS do
        if cnt_rwd_cacheL2RHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_abstractionRHS do
        if cnt_rwd_abstractionRHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_directoryL2RHS do
        if cnt_rwd_directoryL2RHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
    
    
      return false ;
    end;
    function birsp_LHS_network_used(): boolean;
    begin
      for dst:OBJSET_directoryL1LHS do
        if cnt_birsp_directoryL1LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_cacheL2LHS do
        if cnt_birsp_cacheL2LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_directoryL2LHS do
        if cnt_birsp_directoryL2LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
    
    
      return false ;
    end;
    function birsp_RHS_network_used(): boolean;
    begin
      for dst:OBJSET_cacheL2RHS do
        if cnt_birsp_cacheL2RHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_abstractionRHS do
        if cnt_birsp_abstractionRHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_directoryL2RHS do
        if cnt_birsp_directoryL2RHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
    
    
      return false ;
    end;
    function req_LHS_network_used(): boolean;
    begin
      for dst:OBJSET_directoryL1LHS do
        if cnt_req_directoryL1LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
    
    
      return false ;
    end;
    function req_RHS_network_used(): boolean;
    begin
      for dst:OBJSET_abstractionRHS do
        if cnt_req_abstractionRHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
    
    
      return false ;
    end;
    function drs_LHS_network_used(): boolean;
    begin
      for dst:OBJSET_directoryL1LHS do
        if cnt_drs_directoryL1LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_cacheL2LHS do
        if cnt_drs_cacheL2LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_directoryL2LHS do
        if cnt_drs_directoryL2LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
    
    
      return false ;
    end;
    function drs_RHS_network_used(): boolean;
    begin
      for dst:OBJSET_cacheL2RHS do
        if cnt_drs_cacheL2RHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_abstractionRHS do
        if cnt_drs_abstractionRHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_directoryL2RHS do
        if cnt_drs_directoryL2RHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
    
    
      return false ;
    end;
    function ndr_LHS_network_used(): boolean;
    begin
      for dst:OBJSET_directoryL1LHS do
        if cnt_ndr_directoryL1LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_cacheL2LHS do
        if cnt_ndr_cacheL2LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_directoryL2LHS do
        if cnt_ndr_directoryL2LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
    
    
      return false ;
    end;
    function ndr_RHS_network_used(): boolean;
    begin
      for dst:OBJSET_cacheL2RHS do
        if cnt_ndr_cacheL2RHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_abstractionRHS do
        if cnt_ndr_abstractionRHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_directoryL2RHS do
        if cnt_ndr_directoryL2RHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
    
    
      return false ;
    end;
    function network_LHS_used(): boolean;
    begin
            if fwd_LHS_network_used() then
            return true ;
          endif;
    
    
          if bisnp_LHS_network_used() then
            return true ;
          endif;
    
    
          if req2_LHS_network_used() then
            return true ;
          endif;
    
    
          if resp_LHS_network_used() then
            return true ;
          endif;
    
    
          if rwd_LHS_network_used() then
            return true ;
          endif;
    
    
          if birsp_LHS_network_used() then
            return true ;
          endif;
    
    
          if req_LHS_network_used() then
            return true ;
          endif;
    
    
          if drs_LHS_network_used() then
            return true ;
          endif;
    
    
          if ndr_LHS_network_used() then
            return true ;
          endif;
    
    
    
      return false ;
    end;
    function network_RHS_used(): boolean;
    begin
            if fwd_RHS_network_used() then
            return true ;
          endif;
    
    
          if bisnp_RHS_network_used() then
            return true ;
          endif;
    
    
          if req2_RHS_network_used() then
            return true ;
          endif;
    
    
          if resp_RHS_network_used() then
            return true ;
          endif;
    
    
          if rwd_RHS_network_used() then
            return true ;
          endif;
    
    
          if birsp_RHS_network_used() then
            return true ;
          endif;
    
    
          if req_RHS_network_used() then
            return true ;
          endif;
    
    
          if drs_RHS_network_used() then
            return true ;
          endif;
    
    
          if ndr_RHS_network_used() then
            return true ;
          endif;
    
    
    
      return false ;
    end;
    
    procedure Reset_NET_();
    begin
      undefine resp_directoryL1LHS;
      undefine req_directoryL1LHS;
      undefine fwd_directoryL1LHS;
      undefine bisnp_directoryL1LHS;
      undefine req2_directoryL1LHS;
      undefine rwd_directoryL1LHS;
      undefine birsp_directoryL1LHS;
      undefine drs_directoryL1LHS;
      undefine ndr_directoryL1LHS;
      for dst:OBJSET_directoryL1LHS do
        cnt_resp_directoryL1LHS[dst] := 0;
        cnt_req_directoryL1LHS[dst] := 0;
        cnt_fwd_directoryL1LHS[dst] := 0;
        cnt_bisnp_directoryL1LHS[dst] := 0;
        cnt_req2_directoryL1LHS[dst] := 0;
        cnt_rwd_directoryL1LHS[dst] := 0;
        cnt_birsp_directoryL1LHS[dst] := 0;
        cnt_drs_directoryL1LHS[dst] := 0;
        cnt_ndr_directoryL1LHS[dst] := 0;
      endfor;
      
      undefine bisnp_cacheL2RHS;
      undefine req2_cacheL2RHS;
      undefine rwd_cacheL2RHS;
      undefine birsp_cacheL2RHS;
      undefine drs_cacheL2RHS;
      undefine ndr_cacheL2RHS;
      for dst:OBJSET_cacheL2RHS do
        cnt_bisnp_cacheL2RHS[dst] := 0;
        cnt_req2_cacheL2RHS[dst] := 0;
        cnt_rwd_cacheL2RHS[dst] := 0;
        cnt_birsp_cacheL2RHS[dst] := 0;
        cnt_drs_cacheL2RHS[dst] := 0;
        cnt_ndr_cacheL2RHS[dst] := 0;
      endfor;
      
      undefine resp_abstractionRHS;
      undefine req_abstractionRHS;
      undefine fwd_abstractionRHS;
      undefine bisnp_abstractionRHS;
      undefine req2_abstractionRHS;
      undefine rwd_abstractionRHS;
      undefine birsp_abstractionRHS;
      undefine drs_abstractionRHS;
      undefine ndr_abstractionRHS;
      for dst:OBJSET_abstractionRHS do
        cnt_resp_abstractionRHS[dst] := 0;
        cnt_req_abstractionRHS[dst] := 0;
        cnt_fwd_abstractionRHS[dst] := 0;
        cnt_bisnp_abstractionRHS[dst] := 0;
        cnt_req2_abstractionRHS[dst] := 0;
        cnt_rwd_abstractionRHS[dst] := 0;
        cnt_birsp_abstractionRHS[dst] := 0;
        cnt_drs_abstractionRHS[dst] := 0;
        cnt_ndr_abstractionRHS[dst] := 0;
      endfor;
      
      undefine bisnp_cacheL2LHS;
      undefine req2_cacheL2LHS;
      undefine rwd_cacheL2LHS;
      undefine birsp_cacheL2LHS;
      undefine drs_cacheL2LHS;
      undefine ndr_cacheL2LHS;
      for dst:OBJSET_cacheL2LHS do
        cnt_bisnp_cacheL2LHS[dst] := 0;
        cnt_req2_cacheL2LHS[dst] := 0;
        cnt_rwd_cacheL2LHS[dst] := 0;
        cnt_birsp_cacheL2LHS[dst] := 0;
        cnt_drs_cacheL2LHS[dst] := 0;
        cnt_ndr_cacheL2LHS[dst] := 0;
      endfor;
      
      undefine resp_cacheL1LHS;
      undefine fwd_cacheL1LHS;
      for dst:OBJSET_cacheL1LHS do
        cnt_resp_cacheL1LHS[dst] := 0;
        cnt_fwd_cacheL1LHS[dst] := 0;
      endfor;
      
      undefine bisnp_directoryL2RHS;
      undefine req2_directoryL2RHS;
      undefine rwd_directoryL2RHS;
      undefine birsp_directoryL2RHS;
      undefine drs_directoryL2RHS;
      undefine ndr_directoryL2RHS;
      for dst:OBJSET_directoryL2RHS do
        cnt_bisnp_directoryL2RHS[dst] := 0;
        cnt_req2_directoryL2RHS[dst] := 0;
        cnt_rwd_directoryL2RHS[dst] := 0;
        cnt_birsp_directoryL2RHS[dst] := 0;
        cnt_drs_directoryL2RHS[dst] := 0;
        cnt_ndr_directoryL2RHS[dst] := 0;
      endfor;
      
      undefine bisnp_directoryL2LHS;
      undefine req2_directoryL2LHS;
      undefine rwd_directoryL2LHS;
      undefine birsp_directoryL2LHS;
      undefine drs_directoryL2LHS;
      undefine ndr_directoryL2LHS;
      for dst:OBJSET_directoryL2LHS do
        cnt_bisnp_directoryL2LHS[dst] := 0;
        cnt_req2_directoryL2LHS[dst] := 0;
        cnt_rwd_directoryL2LHS[dst] := 0;
        cnt_birsp_directoryL2LHS[dst] := 0;
        cnt_drs_directoryL2LHS[dst] := 0;
        cnt_ndr_directoryL2LHS[dst] := 0;
      endfor;
      
    
    end;
    
  
  ----Backend/Murphi/MurphiModular/Functions/GenMessageConstrFunc
    function RequestL1(adr: Address; mtype: MessageType; src: Machines; dst: Machines) : Message;
    var Message: Message;
    begin
      Message.adr := adr;
      Message.mtype := mtype;
      Message.src := src;
      Message.dst := dst;
    return Message;
    end;
    
    function AckL1(adr: Address; mtype: MessageType; src: Machines; dst: Machines) : Message;
    var Message: Message;
    begin
      Message.adr := adr;
      Message.mtype := mtype;
      Message.src := src;
      Message.dst := dst;
    return Message;
    end;
    
    function RespL1(adr: Address; mtype: MessageType; src: Machines; dst: Machines; cl: ClValue) : Message;
    var Message: Message;
    begin
      Message.adr := adr;
      Message.mtype := mtype;
      Message.src := src;
      Message.dst := dst;
      Message.cl := cl;
    return Message;
    end;
    
    function RespAckL1(adr: Address; mtype: MessageType; src: Machines; dst: Machines; cl: ClValue; acksExpectedL1: 0..NrCachesL1) : Message;
    var Message: Message;
    begin
      Message.adr := adr;
      Message.mtype := mtype;
      Message.src := src;
      Message.dst := dst;
      Message.cl := cl;
      Message.acksExpectedL1 := acksExpectedL1;
    return Message;
    end;
    
    function ReqL2(adr: Address; mtype: MessageType; src: Machines; dst: Machines) : Message;
    var Message: Message;
    begin
      Message.adr := adr;
      Message.mtype := mtype;
      Message.src := src;
      Message.dst := dst;
    return Message;
    end;
    
    function RwdL2(adr: Address; mtype: MessageType; src: Machines; dst: Machines; cl: ClValue) : Message;
    var Message: Message;
    begin
      Message.adr := adr;
      Message.mtype := mtype;
      Message.src := src;
      Message.dst := dst;
      Message.cl := cl;
    return Message;
    end;
    
    function NdrL2(adr: Address; mtype: MessageType; src: Machines; dst: Machines) : Message;
    var Message: Message;
    begin
      Message.adr := adr;
      Message.mtype := mtype;
      Message.src := src;
      Message.dst := dst;
    return Message;
    end;
    
    function DrsL2(adr: Address; mtype: MessageType; src: Machines; dst: Machines; cl: ClValue) : Message;
    var Message: Message;
    begin
      Message.adr := adr;
      Message.mtype := mtype;
      Message.src := src;
      Message.dst := dst;
      Message.cl := cl;
    return Message;
    end;
    
    function BISnpL2(adr: Address; mtype: MessageType; src: Machines; dst: Machines) : Message;
    var Message: Message;
    begin
      Message.adr := adr;
      Message.mtype := mtype;
      Message.src := src;
      Message.dst := dst;
    return Message;
    end;
    
    function BIRspL2(adr: Address; mtype: MessageType; src: Machines; dst: Machines) : Message;
    var Message: Message;
    begin
      Message.adr := adr;
      Message.mtype := mtype;
      Message.src := src;
      Message.dst := dst;
    return Message;
    end;
    
  
  ----Backend/Murphi/MurphiModular/Functions/GenEQCheckComparisonFunc
    ----Backend/Murphi/MurphiModular/Functions/GenEQCheckComparisonFunc : QueueComparisonFunctions
      function sameInputOB() : boolean;
      var rhs_offset: 0..O_NET_MAX;
      var lhs_offset: 0..O_NET_MAX;
      begin
        -- Inputs
        alias elem : directoryL1LHS do
          lhs_offset := 0;
          rhs_offset := 0;
          if cnt_req_directoryL1LHS[elem] > 0 then
            for idx := 0 to cnt_req_directoryL1LHS[elem]-1 do
              if is_machine_in_state(req_directoryL1LHS[elem][idx].src, systemLHSExt) then
                if cnt_req_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(req_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHSExt) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_req_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(req_directoryL1LHS[elem][idx], req_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_req_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] > (cnt_req_directoryL1LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_req_directoryL1LHS[elem] - lhs_offset + rhs_offset) to cnt_req_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)]-1 do
              if is_machine_in_state(req_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx].src, systemRHSExt) then
                return false;
              endif;
            endfor;
          endif;
        
          lhs_offset := 0;
          rhs_offset := 0;
          if cnt_req2_directoryL1LHS[elem] > 0 then
            for idx := 0 to cnt_req2_directoryL1LHS[elem]-1 do
              if is_machine_in_state(req2_directoryL1LHS[elem][idx].src, systemLHSExt) then
                if cnt_req2_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(req2_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHSExt) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_req2_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(req2_directoryL1LHS[elem][idx], req2_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_req2_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] > (cnt_req2_directoryL1LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_req2_directoryL1LHS[elem] - lhs_offset + rhs_offset) to cnt_req2_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)]-1 do
              if is_machine_in_state(req2_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx].src, systemRHSExt) then
                return false;
              endif;
            endfor;
          endif;
        
          lhs_offset := 0;
          rhs_offset := 0;
          if cnt_resp_directoryL1LHS[elem] > 0 then
            for idx := 0 to cnt_resp_directoryL1LHS[elem]-1 do
              if is_machine_in_state(resp_directoryL1LHS[elem][idx].src, systemLHSExt) then
                if cnt_resp_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(resp_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHSExt) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_resp_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(resp_directoryL1LHS[elem][idx], resp_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_resp_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] > (cnt_resp_directoryL1LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_resp_directoryL1LHS[elem] - lhs_offset + rhs_offset) to cnt_resp_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)]-1 do
              if is_machine_in_state(resp_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx].src, systemRHSExt) then
                return false;
              endif;
            endfor;
          endif;
        
          lhs_offset := 0;
          rhs_offset := 0;
          if cnt_fwd_directoryL1LHS[elem] > 0 then
            for idx := 0 to cnt_fwd_directoryL1LHS[elem]-1 do
              if is_machine_in_state(fwd_directoryL1LHS[elem][idx].src, systemLHSExt) then
                if cnt_fwd_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(fwd_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHSExt) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_fwd_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(fwd_directoryL1LHS[elem][idx], fwd_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_fwd_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] > (cnt_fwd_directoryL1LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_fwd_directoryL1LHS[elem] - lhs_offset + rhs_offset) to cnt_fwd_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)]-1 do
              if is_machine_in_state(fwd_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx].src, systemRHSExt) then
                return false;
              endif;
            endfor;
          endif;
        
          lhs_offset := 0;
          rhs_offset := 0;
          if cnt_rwd_directoryL1LHS[elem] > 0 then
            for idx := 0 to cnt_rwd_directoryL1LHS[elem]-1 do
              if is_machine_in_state(rwd_directoryL1LHS[elem][idx].src, systemLHSExt) then
                if cnt_rwd_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(rwd_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHSExt) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_rwd_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(rwd_directoryL1LHS[elem][idx], rwd_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_rwd_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] > (cnt_rwd_directoryL1LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_rwd_directoryL1LHS[elem] - lhs_offset + rhs_offset) to cnt_rwd_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)]-1 do
              if is_machine_in_state(rwd_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx].src, systemRHSExt) then
                return false;
              endif;
            endfor;
          endif;
        
          lhs_offset := 0;
          rhs_offset := 0;
          if cnt_birsp_directoryL1LHS[elem] > 0 then
            for idx := 0 to cnt_birsp_directoryL1LHS[elem]-1 do
              if is_machine_in_state(birsp_directoryL1LHS[elem][idx].src, systemLHSExt) then
                if cnt_birsp_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(birsp_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHSExt) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_birsp_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(birsp_directoryL1LHS[elem][idx], birsp_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_birsp_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] > (cnt_birsp_directoryL1LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_birsp_directoryL1LHS[elem] - lhs_offset + rhs_offset) to cnt_birsp_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)]-1 do
              if is_machine_in_state(birsp_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx].src, systemRHSExt) then
                return false;
              endif;
            endfor;
          endif;
        
          lhs_offset := 0;
          rhs_offset := 0;
          if cnt_bisnp_directoryL1LHS[elem] > 0 then
            for idx := 0 to cnt_bisnp_directoryL1LHS[elem]-1 do
              if is_machine_in_state(bisnp_directoryL1LHS[elem][idx].src, systemLHSExt) then
                if cnt_bisnp_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(bisnp_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHSExt) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_bisnp_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(bisnp_directoryL1LHS[elem][idx], bisnp_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_bisnp_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] > (cnt_bisnp_directoryL1LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_bisnp_directoryL1LHS[elem] - lhs_offset + rhs_offset) to cnt_bisnp_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)]-1 do
              if is_machine_in_state(bisnp_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx].src, systemRHSExt) then
                return false;
              endif;
            endfor;
          endif;
        
          lhs_offset := 0;
          rhs_offset := 0;
          if cnt_drs_directoryL1LHS[elem] > 0 then
            for idx := 0 to cnt_drs_directoryL1LHS[elem]-1 do
              if is_machine_in_state(drs_directoryL1LHS[elem][idx].src, systemLHSExt) then
                if cnt_drs_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(drs_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHSExt) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_drs_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(drs_directoryL1LHS[elem][idx], drs_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_drs_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] > (cnt_drs_directoryL1LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_drs_directoryL1LHS[elem] - lhs_offset + rhs_offset) to cnt_drs_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)]-1 do
              if is_machine_in_state(drs_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx].src, systemRHSExt) then
                return false;
              endif;
            endfor;
          endif;
        
          lhs_offset := 0;
          rhs_offset := 0;
          if cnt_ndr_directoryL1LHS[elem] > 0 then
            for idx := 0 to cnt_ndr_directoryL1LHS[elem]-1 do
              if is_machine_in_state(ndr_directoryL1LHS[elem][idx].src, systemLHSExt) then
                if cnt_ndr_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(ndr_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHSExt) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_ndr_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(ndr_directoryL1LHS[elem][idx], ndr_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_ndr_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)] > (cnt_ndr_directoryL1LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_ndr_directoryL1LHS[elem] - lhs_offset + rhs_offset) to cnt_ndr_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)]-1 do
              if is_machine_in_state(ndr_abstractionRHS[map_directoryL1LHS_to_abstractionRHS(elem)][idx].src, systemRHSExt) then
                return false;
              endif;
            endfor;
          endif;
        
        endalias;
        
      
        return true;
      end;
  
      function sameOutputOB() : boolean;
      var rhs_offset: 0..O_NET_MAX;
      var lhs_offset: 0..O_NET_MAX;
      begin
        -- Outputs
        for elem : OBJSET_cacheL2LHS do
          lhs_offset := 0;
          rhs_offset := 0;
          if cnt_req2_cacheL2LHS[elem] > 0 then
            for idx := 0 to cnt_req2_cacheL2LHS[elem]-1 do
              if is_machine_in_state(req2_cacheL2LHS[elem][idx].src, systemLHS) then
                if cnt_req2_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(req2_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHS) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_req2_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(req2_cacheL2LHS[elem][idx], req2_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_req2_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)] > (cnt_req2_cacheL2LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_req2_cacheL2LHS[elem] - lhs_offset + rhs_offset) to cnt_req2_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)]-1 do
              if is_machine_in_state(req2_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)][idx].src, systemRHS) then
                return false;
              endif;
            endfor;
          endif;
        
          lhs_offset := 0;
          rhs_offset := 0;
          if cnt_rwd_cacheL2LHS[elem] > 0 then
            for idx := 0 to cnt_rwd_cacheL2LHS[elem]-1 do
              if is_machine_in_state(rwd_cacheL2LHS[elem][idx].src, systemLHS) then
                if cnt_rwd_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(rwd_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHS) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_rwd_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(rwd_cacheL2LHS[elem][idx], rwd_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_rwd_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)] > (cnt_rwd_cacheL2LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_rwd_cacheL2LHS[elem] - lhs_offset + rhs_offset) to cnt_rwd_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)]-1 do
              if is_machine_in_state(rwd_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)][idx].src, systemRHS) then
                return false;
              endif;
            endfor;
          endif;
        
          lhs_offset := 0;
          rhs_offset := 0;
          if cnt_birsp_cacheL2LHS[elem] > 0 then
            for idx := 0 to cnt_birsp_cacheL2LHS[elem]-1 do
              if is_machine_in_state(birsp_cacheL2LHS[elem][idx].src, systemLHS) then
                if cnt_birsp_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(birsp_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHS) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_birsp_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(birsp_cacheL2LHS[elem][idx], birsp_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_birsp_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)] > (cnt_birsp_cacheL2LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_birsp_cacheL2LHS[elem] - lhs_offset + rhs_offset) to cnt_birsp_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)]-1 do
              if is_machine_in_state(birsp_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)][idx].src, systemRHS) then
                return false;
              endif;
            endfor;
          endif;
        
          lhs_offset := 0;
          rhs_offset := 0;
          if cnt_bisnp_cacheL2LHS[elem] > 0 then
            for idx := 0 to cnt_bisnp_cacheL2LHS[elem]-1 do
              if is_machine_in_state(bisnp_cacheL2LHS[elem][idx].src, systemLHS) then
                if cnt_bisnp_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(bisnp_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHS) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_bisnp_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(bisnp_cacheL2LHS[elem][idx], bisnp_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_bisnp_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)] > (cnt_bisnp_cacheL2LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_bisnp_cacheL2LHS[elem] - lhs_offset + rhs_offset) to cnt_bisnp_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)]-1 do
              if is_machine_in_state(bisnp_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)][idx].src, systemRHS) then
                return false;
              endif;
            endfor;
          endif;
        
          lhs_offset := 0;
          rhs_offset := 0;
          if cnt_drs_cacheL2LHS[elem] > 0 then
            for idx := 0 to cnt_drs_cacheL2LHS[elem]-1 do
              if is_machine_in_state(drs_cacheL2LHS[elem][idx].src, systemLHS) then
                if cnt_drs_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(drs_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHS) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_drs_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(drs_cacheL2LHS[elem][idx], drs_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_drs_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)] > (cnt_drs_cacheL2LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_drs_cacheL2LHS[elem] - lhs_offset + rhs_offset) to cnt_drs_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)]-1 do
              if is_machine_in_state(drs_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)][idx].src, systemRHS) then
                return false;
              endif;
            endfor;
          endif;
        
          lhs_offset := 0;
          rhs_offset := 0;
          if cnt_ndr_cacheL2LHS[elem] > 0 then
            for idx := 0 to cnt_ndr_cacheL2LHS[elem]-1 do
              if is_machine_in_state(ndr_cacheL2LHS[elem][idx].src, systemLHS) then
                if cnt_ndr_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(ndr_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHS) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_ndr_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(ndr_cacheL2LHS[elem][idx], ndr_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_ndr_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)] > (cnt_ndr_cacheL2LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_ndr_cacheL2LHS[elem] - lhs_offset + rhs_offset) to cnt_ndr_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)]-1 do
              if is_machine_in_state(ndr_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)][idx].src, systemRHS) then
                return false;
              endif;
            endfor;
          endif;
        
        endfor;
        
        for elem : OBJSET_directoryL2LHS do
          lhs_offset := 0;
          rhs_offset := 0;
          if cnt_req2_directoryL2LHS[elem] > 0 then
            for idx := 0 to cnt_req2_directoryL2LHS[elem]-1 do
              if is_machine_in_state(req2_directoryL2LHS[elem][idx].src, systemLHS) then
                if cnt_req2_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(req2_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHS) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_req2_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(req2_directoryL2LHS[elem][idx], req2_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_req2_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)] > (cnt_req2_directoryL2LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_req2_directoryL2LHS[elem] - lhs_offset + rhs_offset) to cnt_req2_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)]-1 do
              if is_machine_in_state(req2_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)][idx].src, systemRHS) then
                return false;
              endif;
            endfor;
          endif;
        
          lhs_offset := 0;
          rhs_offset := 0;
          if cnt_rwd_directoryL2LHS[elem] > 0 then
            for idx := 0 to cnt_rwd_directoryL2LHS[elem]-1 do
              if is_machine_in_state(rwd_directoryL2LHS[elem][idx].src, systemLHS) then
                if cnt_rwd_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(rwd_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHS) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_rwd_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(rwd_directoryL2LHS[elem][idx], rwd_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_rwd_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)] > (cnt_rwd_directoryL2LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_rwd_directoryL2LHS[elem] - lhs_offset + rhs_offset) to cnt_rwd_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)]-1 do
              if is_machine_in_state(rwd_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)][idx].src, systemRHS) then
                return false;
              endif;
            endfor;
          endif;
        
          lhs_offset := 0;
          rhs_offset := 0;
          if cnt_birsp_directoryL2LHS[elem] > 0 then
            for idx := 0 to cnt_birsp_directoryL2LHS[elem]-1 do
              if is_machine_in_state(birsp_directoryL2LHS[elem][idx].src, systemLHS) then
                if cnt_birsp_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(birsp_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHS) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_birsp_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(birsp_directoryL2LHS[elem][idx], birsp_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_birsp_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)] > (cnt_birsp_directoryL2LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_birsp_directoryL2LHS[elem] - lhs_offset + rhs_offset) to cnt_birsp_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)]-1 do
              if is_machine_in_state(birsp_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)][idx].src, systemRHS) then
                return false;
              endif;
            endfor;
          endif;
        
          lhs_offset := 0;
          rhs_offset := 0;
          if cnt_bisnp_directoryL2LHS[elem] > 0 then
            for idx := 0 to cnt_bisnp_directoryL2LHS[elem]-1 do
              if is_machine_in_state(bisnp_directoryL2LHS[elem][idx].src, systemLHS) then
                if cnt_bisnp_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(bisnp_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHS) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_bisnp_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(bisnp_directoryL2LHS[elem][idx], bisnp_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_bisnp_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)] > (cnt_bisnp_directoryL2LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_bisnp_directoryL2LHS[elem] - lhs_offset + rhs_offset) to cnt_bisnp_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)]-1 do
              if is_machine_in_state(bisnp_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)][idx].src, systemRHS) then
                return false;
              endif;
            endfor;
          endif;
        
          lhs_offset := 0;
          rhs_offset := 0;
          if cnt_drs_directoryL2LHS[elem] > 0 then
            for idx := 0 to cnt_drs_directoryL2LHS[elem]-1 do
              if is_machine_in_state(drs_directoryL2LHS[elem][idx].src, systemLHS) then
                if cnt_drs_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(drs_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHS) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_drs_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(drs_directoryL2LHS[elem][idx], drs_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_drs_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)] > (cnt_drs_directoryL2LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_drs_directoryL2LHS[elem] - lhs_offset + rhs_offset) to cnt_drs_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)]-1 do
              if is_machine_in_state(drs_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)][idx].src, systemRHS) then
                return false;
              endif;
            endfor;
          endif;
        
          lhs_offset := 0;
          rhs_offset := 0;
          if cnt_ndr_directoryL2LHS[elem] > 0 then
            for idx := 0 to cnt_ndr_directoryL2LHS[elem]-1 do
              if is_machine_in_state(ndr_directoryL2LHS[elem][idx].src, systemLHS) then
                if cnt_ndr_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(ndr_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHS) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_ndr_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(ndr_directoryL2LHS[elem][idx], ndr_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_ndr_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)] > (cnt_ndr_directoryL2LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_ndr_directoryL2LHS[elem] - lhs_offset + rhs_offset) to cnt_ndr_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)]-1 do
              if is_machine_in_state(ndr_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)][idx].src, systemRHS) then
                return false;
              endif;
            endfor;
          endif;
        
        endfor;
        
      
        return true;
      end;
  
      function sameOB(): boolean;
      begin
        return sameInputOB() & sameOutputOB();
      end;
      
      function can_RHS_replicate_OB() : boolean;
      var rhs_offset: 0..O_NET_MAX;
      var lhs_offset: 0..O_NET_MAX;
      begin
        -- Inputs
        alias elem : directoryL1LHS do
          lhs_offset := 0;
          rhs_offset := 0;
          alias elem_rhs : map_directoryL1LHS_to_abstractionRHS(elem) do
            if cnt_req_directoryL1LHS[elem] > 0 then
              for idx := 0 to cnt_req_directoryL1LHS[elem]-1 do
                if is_machine_in_state(req_directoryL1LHS[elem][cnt_req_directoryL1LHS[elem]-1 - idx].src, systemLHSExt) then
                  if cnt_req_abstractionRHS[elem_rhs] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                  while !is_machine_in_state(req_abstractionRHS[elem_rhs][cnt_req_abstractionRHS[elem_rhs]-1 - (idx - lhs_offset + rhs_offset)].src, systemRHSExt) do
                    rhs_offset := rhs_offset + 1;
                    if cnt_req_abstractionRHS[elem_rhs] <= (idx - lhs_offset + rhs_offset) then
                      return false;
                    endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(req_directoryL1LHS[elem][cnt_req_directoryL1LHS[elem]-1 - idx], req_abstractionRHS[elem_rhs][cnt_req_abstractionRHS[elem_rhs]-1 - (idx - lhs_offset + rhs_offset)]) then
                      return false;
                  endif;
                else
                    lhs_offset := lhs_offset + 1;
                endif;
              endfor;
            endif;
          endalias;
        
          lhs_offset := 0;
          rhs_offset := 0;
          alias elem_rhs : map_directoryL1LHS_to_abstractionRHS(elem) do
            if cnt_req2_directoryL1LHS[elem] > 0 then
              for idx := 0 to cnt_req2_directoryL1LHS[elem]-1 do
                if is_machine_in_state(req2_directoryL1LHS[elem][cnt_req2_directoryL1LHS[elem]-1 - idx].src, systemLHSExt) then
                  if cnt_req2_abstractionRHS[elem_rhs] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                  while !is_machine_in_state(req2_abstractionRHS[elem_rhs][cnt_req2_abstractionRHS[elem_rhs]-1 - (idx - lhs_offset + rhs_offset)].src, systemRHSExt) do
                    rhs_offset := rhs_offset + 1;
                    if cnt_req2_abstractionRHS[elem_rhs] <= (idx - lhs_offset + rhs_offset) then
                      return false;
                    endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(req2_directoryL1LHS[elem][cnt_req2_directoryL1LHS[elem]-1 - idx], req2_abstractionRHS[elem_rhs][cnt_req2_abstractionRHS[elem_rhs]-1 - (idx - lhs_offset + rhs_offset)]) then
                      return false;
                  endif;
                else
                    lhs_offset := lhs_offset + 1;
                endif;
              endfor;
            endif;
          endalias;
        
          lhs_offset := 0;
          rhs_offset := 0;
          alias elem_rhs : map_directoryL1LHS_to_abstractionRHS(elem) do
            if cnt_resp_directoryL1LHS[elem] > 0 then
              for idx := 0 to cnt_resp_directoryL1LHS[elem]-1 do
                if is_machine_in_state(resp_directoryL1LHS[elem][cnt_resp_directoryL1LHS[elem]-1 - idx].src, systemLHSExt) then
                  if cnt_resp_abstractionRHS[elem_rhs] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                  while !is_machine_in_state(resp_abstractionRHS[elem_rhs][cnt_resp_abstractionRHS[elem_rhs]-1 - (idx - lhs_offset + rhs_offset)].src, systemRHSExt) do
                    rhs_offset := rhs_offset + 1;
                    if cnt_resp_abstractionRHS[elem_rhs] <= (idx - lhs_offset + rhs_offset) then
                      return false;
                    endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(resp_directoryL1LHS[elem][cnt_resp_directoryL1LHS[elem]-1 - idx], resp_abstractionRHS[elem_rhs][cnt_resp_abstractionRHS[elem_rhs]-1 - (idx - lhs_offset + rhs_offset)]) then
                      return false;
                  endif;
                else
                    lhs_offset := lhs_offset + 1;
                endif;
              endfor;
            endif;
          endalias;
        
          lhs_offset := 0;
          rhs_offset := 0;
          alias elem_rhs : map_directoryL1LHS_to_abstractionRHS(elem) do
            if cnt_fwd_directoryL1LHS[elem] > 0 then
              for idx := 0 to cnt_fwd_directoryL1LHS[elem]-1 do
                if is_machine_in_state(fwd_directoryL1LHS[elem][cnt_fwd_directoryL1LHS[elem]-1 - idx].src, systemLHSExt) then
                  if cnt_fwd_abstractionRHS[elem_rhs] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                  while !is_machine_in_state(fwd_abstractionRHS[elem_rhs][cnt_fwd_abstractionRHS[elem_rhs]-1 - (idx - lhs_offset + rhs_offset)].src, systemRHSExt) do
                    rhs_offset := rhs_offset + 1;
                    if cnt_fwd_abstractionRHS[elem_rhs] <= (idx - lhs_offset + rhs_offset) then
                      return false;
                    endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(fwd_directoryL1LHS[elem][cnt_fwd_directoryL1LHS[elem]-1 - idx], fwd_abstractionRHS[elem_rhs][cnt_fwd_abstractionRHS[elem_rhs]-1 - (idx - lhs_offset + rhs_offset)]) then
                      return false;
                  endif;
                else
                    lhs_offset := lhs_offset + 1;
                endif;
              endfor;
            endif;
          endalias;
        
          lhs_offset := 0;
          rhs_offset := 0;
          alias elem_rhs : map_directoryL1LHS_to_abstractionRHS(elem) do
            if cnt_rwd_directoryL1LHS[elem] > 0 then
              for idx := 0 to cnt_rwd_directoryL1LHS[elem]-1 do
                if is_machine_in_state(rwd_directoryL1LHS[elem][cnt_rwd_directoryL1LHS[elem]-1 - idx].src, systemLHSExt) then
                  if cnt_rwd_abstractionRHS[elem_rhs] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                  while !is_machine_in_state(rwd_abstractionRHS[elem_rhs][cnt_rwd_abstractionRHS[elem_rhs]-1 - (idx - lhs_offset + rhs_offset)].src, systemRHSExt) do
                    rhs_offset := rhs_offset + 1;
                    if cnt_rwd_abstractionRHS[elem_rhs] <= (idx - lhs_offset + rhs_offset) then
                      return false;
                    endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(rwd_directoryL1LHS[elem][cnt_rwd_directoryL1LHS[elem]-1 - idx], rwd_abstractionRHS[elem_rhs][cnt_rwd_abstractionRHS[elem_rhs]-1 - (idx - lhs_offset + rhs_offset)]) then
                      return false;
                  endif;
                else
                    lhs_offset := lhs_offset + 1;
                endif;
              endfor;
            endif;
          endalias;
        
          lhs_offset := 0;
          rhs_offset := 0;
          alias elem_rhs : map_directoryL1LHS_to_abstractionRHS(elem) do
            if cnt_birsp_directoryL1LHS[elem] > 0 then
              for idx := 0 to cnt_birsp_directoryL1LHS[elem]-1 do
                if is_machine_in_state(birsp_directoryL1LHS[elem][cnt_birsp_directoryL1LHS[elem]-1 - idx].src, systemLHSExt) then
                  if cnt_birsp_abstractionRHS[elem_rhs] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                  while !is_machine_in_state(birsp_abstractionRHS[elem_rhs][cnt_birsp_abstractionRHS[elem_rhs]-1 - (idx - lhs_offset + rhs_offset)].src, systemRHSExt) do
                    rhs_offset := rhs_offset + 1;
                    if cnt_birsp_abstractionRHS[elem_rhs] <= (idx - lhs_offset + rhs_offset) then
                      return false;
                    endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(birsp_directoryL1LHS[elem][cnt_birsp_directoryL1LHS[elem]-1 - idx], birsp_abstractionRHS[elem_rhs][cnt_birsp_abstractionRHS[elem_rhs]-1 - (idx - lhs_offset + rhs_offset)]) then
                      return false;
                  endif;
                else
                    lhs_offset := lhs_offset + 1;
                endif;
              endfor;
            endif;
          endalias;
        
          lhs_offset := 0;
          rhs_offset := 0;
          alias elem_rhs : map_directoryL1LHS_to_abstractionRHS(elem) do
            if cnt_bisnp_directoryL1LHS[elem] > 0 then
              for idx := 0 to cnt_bisnp_directoryL1LHS[elem]-1 do
                if is_machine_in_state(bisnp_directoryL1LHS[elem][cnt_bisnp_directoryL1LHS[elem]-1 - idx].src, systemLHSExt) then
                  if cnt_bisnp_abstractionRHS[elem_rhs] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                  while !is_machine_in_state(bisnp_abstractionRHS[elem_rhs][cnt_bisnp_abstractionRHS[elem_rhs]-1 - (idx - lhs_offset + rhs_offset)].src, systemRHSExt) do
                    rhs_offset := rhs_offset + 1;
                    if cnt_bisnp_abstractionRHS[elem_rhs] <= (idx - lhs_offset + rhs_offset) then
                      return false;
                    endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(bisnp_directoryL1LHS[elem][cnt_bisnp_directoryL1LHS[elem]-1 - idx], bisnp_abstractionRHS[elem_rhs][cnt_bisnp_abstractionRHS[elem_rhs]-1 - (idx - lhs_offset + rhs_offset)]) then
                      return false;
                  endif;
                else
                    lhs_offset := lhs_offset + 1;
                endif;
              endfor;
            endif;
          endalias;
        
          lhs_offset := 0;
          rhs_offset := 0;
          alias elem_rhs : map_directoryL1LHS_to_abstractionRHS(elem) do
            if cnt_drs_directoryL1LHS[elem] > 0 then
              for idx := 0 to cnt_drs_directoryL1LHS[elem]-1 do
                if is_machine_in_state(drs_directoryL1LHS[elem][cnt_drs_directoryL1LHS[elem]-1 - idx].src, systemLHSExt) then
                  if cnt_drs_abstractionRHS[elem_rhs] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                  while !is_machine_in_state(drs_abstractionRHS[elem_rhs][cnt_drs_abstractionRHS[elem_rhs]-1 - (idx - lhs_offset + rhs_offset)].src, systemRHSExt) do
                    rhs_offset := rhs_offset + 1;
                    if cnt_drs_abstractionRHS[elem_rhs] <= (idx - lhs_offset + rhs_offset) then
                      return false;
                    endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(drs_directoryL1LHS[elem][cnt_drs_directoryL1LHS[elem]-1 - idx], drs_abstractionRHS[elem_rhs][cnt_drs_abstractionRHS[elem_rhs]-1 - (idx - lhs_offset + rhs_offset)]) then
                      return false;
                  endif;
                else
                    lhs_offset := lhs_offset + 1;
                endif;
              endfor;
            endif;
          endalias;
        
          lhs_offset := 0;
          rhs_offset := 0;
          alias elem_rhs : map_directoryL1LHS_to_abstractionRHS(elem) do
            if cnt_ndr_directoryL1LHS[elem] > 0 then
              for idx := 0 to cnt_ndr_directoryL1LHS[elem]-1 do
                if is_machine_in_state(ndr_directoryL1LHS[elem][cnt_ndr_directoryL1LHS[elem]-1 - idx].src, systemLHSExt) then
                  if cnt_ndr_abstractionRHS[elem_rhs] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                  while !is_machine_in_state(ndr_abstractionRHS[elem_rhs][cnt_ndr_abstractionRHS[elem_rhs]-1 - (idx - lhs_offset + rhs_offset)].src, systemRHSExt) do
                    rhs_offset := rhs_offset + 1;
                    if cnt_ndr_abstractionRHS[elem_rhs] <= (idx - lhs_offset + rhs_offset) then
                      return false;
                    endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(ndr_directoryL1LHS[elem][cnt_ndr_directoryL1LHS[elem]-1 - idx], ndr_abstractionRHS[elem_rhs][cnt_ndr_abstractionRHS[elem_rhs]-1 - (idx - lhs_offset + rhs_offset)]) then
                      return false;
                  endif;
                else
                    lhs_offset := lhs_offset + 1;
                endif;
              endfor;
            endif;
          endalias;
        
        endalias;
        
        -- Outputs
        for elem : OBJSET_cacheL2LHS do
          rhs_offset := 0;
          lhs_offset := 0;
          alias elem_rhs : map_cacheL2LHS_to_cacheL2RHS(elem) do
              if cnt_req2_cacheL2RHS[elem_rhs] > 0 then
              for idx := 0 to cnt_req2_cacheL2RHS[elem_rhs]-1 do
                  if is_machine_in_state(req2_cacheL2RHS[elem_rhs][idx].src, systemRHS) then
                  if cnt_req2_cacheL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                      return false;
                  endif;
                  while !is_machine_in_state(req2_cacheL2LHS[elem][idx - rhs_offset + lhs_offset].src, systemLHS) do
                      lhs_offset := lhs_offset + 1;
                      if cnt_req2_cacheL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                        return false;
                      endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(req2_cacheL2LHS[elem][idx - rhs_offset + lhs_offset], req2_cacheL2RHS[elem_rhs][idx]) then
                      return false;
                  endif;
                  else
                      rhs_offset := rhs_offset + 1;
                  endif;
              endfor;
              endif;
          endalias;
        
          rhs_offset := 0;
          lhs_offset := 0;
          alias elem_rhs : map_cacheL2LHS_to_cacheL2RHS(elem) do
              if cnt_rwd_cacheL2RHS[elem_rhs] > 0 then
              for idx := 0 to cnt_rwd_cacheL2RHS[elem_rhs]-1 do
                  if is_machine_in_state(rwd_cacheL2RHS[elem_rhs][idx].src, systemRHS) then
                  if cnt_rwd_cacheL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                      return false;
                  endif;
                  while !is_machine_in_state(rwd_cacheL2LHS[elem][idx - rhs_offset + lhs_offset].src, systemLHS) do
                      lhs_offset := lhs_offset + 1;
                      if cnt_rwd_cacheL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                        return false;
                      endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(rwd_cacheL2LHS[elem][idx - rhs_offset + lhs_offset], rwd_cacheL2RHS[elem_rhs][idx]) then
                      return false;
                  endif;
                  else
                      rhs_offset := rhs_offset + 1;
                  endif;
              endfor;
              endif;
          endalias;
        
          rhs_offset := 0;
          lhs_offset := 0;
          alias elem_rhs : map_cacheL2LHS_to_cacheL2RHS(elem) do
              if cnt_birsp_cacheL2RHS[elem_rhs] > 0 then
              for idx := 0 to cnt_birsp_cacheL2RHS[elem_rhs]-1 do
                  if is_machine_in_state(birsp_cacheL2RHS[elem_rhs][idx].src, systemRHS) then
                  if cnt_birsp_cacheL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                      return false;
                  endif;
                  while !is_machine_in_state(birsp_cacheL2LHS[elem][idx - rhs_offset + lhs_offset].src, systemLHS) do
                      lhs_offset := lhs_offset + 1;
                      if cnt_birsp_cacheL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                        return false;
                      endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(birsp_cacheL2LHS[elem][idx - rhs_offset + lhs_offset], birsp_cacheL2RHS[elem_rhs][idx]) then
                      return false;
                  endif;
                  else
                      rhs_offset := rhs_offset + 1;
                  endif;
              endfor;
              endif;
          endalias;
        
          rhs_offset := 0;
          lhs_offset := 0;
          alias elem_rhs : map_cacheL2LHS_to_cacheL2RHS(elem) do
              if cnt_bisnp_cacheL2RHS[elem_rhs] > 0 then
              for idx := 0 to cnt_bisnp_cacheL2RHS[elem_rhs]-1 do
                  if is_machine_in_state(bisnp_cacheL2RHS[elem_rhs][idx].src, systemRHS) then
                  if cnt_bisnp_cacheL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                      return false;
                  endif;
                  while !is_machine_in_state(bisnp_cacheL2LHS[elem][idx - rhs_offset + lhs_offset].src, systemLHS) do
                      lhs_offset := lhs_offset + 1;
                      if cnt_bisnp_cacheL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                        return false;
                      endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(bisnp_cacheL2LHS[elem][idx - rhs_offset + lhs_offset], bisnp_cacheL2RHS[elem_rhs][idx]) then
                      return false;
                  endif;
                  else
                      rhs_offset := rhs_offset + 1;
                  endif;
              endfor;
              endif;
          endalias;
        
          rhs_offset := 0;
          lhs_offset := 0;
          alias elem_rhs : map_cacheL2LHS_to_cacheL2RHS(elem) do
              if cnt_drs_cacheL2RHS[elem_rhs] > 0 then
              for idx := 0 to cnt_drs_cacheL2RHS[elem_rhs]-1 do
                  if is_machine_in_state(drs_cacheL2RHS[elem_rhs][idx].src, systemRHS) then
                  if cnt_drs_cacheL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                      return false;
                  endif;
                  while !is_machine_in_state(drs_cacheL2LHS[elem][idx - rhs_offset + lhs_offset].src, systemLHS) do
                      lhs_offset := lhs_offset + 1;
                      if cnt_drs_cacheL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                        return false;
                      endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(drs_cacheL2LHS[elem][idx - rhs_offset + lhs_offset], drs_cacheL2RHS[elem_rhs][idx]) then
                      return false;
                  endif;
                  else
                      rhs_offset := rhs_offset + 1;
                  endif;
              endfor;
              endif;
          endalias;
        
          rhs_offset := 0;
          lhs_offset := 0;
          alias elem_rhs : map_cacheL2LHS_to_cacheL2RHS(elem) do
              if cnt_ndr_cacheL2RHS[elem_rhs] > 0 then
              for idx := 0 to cnt_ndr_cacheL2RHS[elem_rhs]-1 do
                  if is_machine_in_state(ndr_cacheL2RHS[elem_rhs][idx].src, systemRHS) then
                  if cnt_ndr_cacheL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                      return false;
                  endif;
                  while !is_machine_in_state(ndr_cacheL2LHS[elem][idx - rhs_offset + lhs_offset].src, systemLHS) do
                      lhs_offset := lhs_offset + 1;
                      if cnt_ndr_cacheL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                        return false;
                      endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(ndr_cacheL2LHS[elem][idx - rhs_offset + lhs_offset], ndr_cacheL2RHS[elem_rhs][idx]) then
                      return false;
                  endif;
                  else
                      rhs_offset := rhs_offset + 1;
                  endif;
              endfor;
              endif;
          endalias;
        
        endfor;
        
        for elem : OBJSET_directoryL2LHS do
          rhs_offset := 0;
          lhs_offset := 0;
          alias elem_rhs : map_directoryL2LHS_to_directoryL2RHS(elem) do
              if cnt_req2_directoryL2RHS[elem_rhs] > 0 then
              for idx := 0 to cnt_req2_directoryL2RHS[elem_rhs]-1 do
                  if is_machine_in_state(req2_directoryL2RHS[elem_rhs][idx].src, systemRHS) then
                  if cnt_req2_directoryL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                      return false;
                  endif;
                  while !is_machine_in_state(req2_directoryL2LHS[elem][idx - rhs_offset + lhs_offset].src, systemLHS) do
                      lhs_offset := lhs_offset + 1;
                      if cnt_req2_directoryL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                        return false;
                      endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(req2_directoryL2LHS[elem][idx - rhs_offset + lhs_offset], req2_directoryL2RHS[elem_rhs][idx]) then
                      return false;
                  endif;
                  else
                      rhs_offset := rhs_offset + 1;
                  endif;
              endfor;
              endif;
          endalias;
        
          rhs_offset := 0;
          lhs_offset := 0;
          alias elem_rhs : map_directoryL2LHS_to_directoryL2RHS(elem) do
              if cnt_rwd_directoryL2RHS[elem_rhs] > 0 then
              for idx := 0 to cnt_rwd_directoryL2RHS[elem_rhs]-1 do
                  if is_machine_in_state(rwd_directoryL2RHS[elem_rhs][idx].src, systemRHS) then
                  if cnt_rwd_directoryL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                      return false;
                  endif;
                  while !is_machine_in_state(rwd_directoryL2LHS[elem][idx - rhs_offset + lhs_offset].src, systemLHS) do
                      lhs_offset := lhs_offset + 1;
                      if cnt_rwd_directoryL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                        return false;
                      endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(rwd_directoryL2LHS[elem][idx - rhs_offset + lhs_offset], rwd_directoryL2RHS[elem_rhs][idx]) then
                      return false;
                  endif;
                  else
                      rhs_offset := rhs_offset + 1;
                  endif;
              endfor;
              endif;
          endalias;
        
          rhs_offset := 0;
          lhs_offset := 0;
          alias elem_rhs : map_directoryL2LHS_to_directoryL2RHS(elem) do
              if cnt_birsp_directoryL2RHS[elem_rhs] > 0 then
              for idx := 0 to cnt_birsp_directoryL2RHS[elem_rhs]-1 do
                  if is_machine_in_state(birsp_directoryL2RHS[elem_rhs][idx].src, systemRHS) then
                  if cnt_birsp_directoryL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                      return false;
                  endif;
                  while !is_machine_in_state(birsp_directoryL2LHS[elem][idx - rhs_offset + lhs_offset].src, systemLHS) do
                      lhs_offset := lhs_offset + 1;
                      if cnt_birsp_directoryL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                        return false;
                      endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(birsp_directoryL2LHS[elem][idx - rhs_offset + lhs_offset], birsp_directoryL2RHS[elem_rhs][idx]) then
                      return false;
                  endif;
                  else
                      rhs_offset := rhs_offset + 1;
                  endif;
              endfor;
              endif;
          endalias;
        
          rhs_offset := 0;
          lhs_offset := 0;
          alias elem_rhs : map_directoryL2LHS_to_directoryL2RHS(elem) do
              if cnt_bisnp_directoryL2RHS[elem_rhs] > 0 then
              for idx := 0 to cnt_bisnp_directoryL2RHS[elem_rhs]-1 do
                  if is_machine_in_state(bisnp_directoryL2RHS[elem_rhs][idx].src, systemRHS) then
                  if cnt_bisnp_directoryL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                      return false;
                  endif;
                  while !is_machine_in_state(bisnp_directoryL2LHS[elem][idx - rhs_offset + lhs_offset].src, systemLHS) do
                      lhs_offset := lhs_offset + 1;
                      if cnt_bisnp_directoryL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                        return false;
                      endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(bisnp_directoryL2LHS[elem][idx - rhs_offset + lhs_offset], bisnp_directoryL2RHS[elem_rhs][idx]) then
                      return false;
                  endif;
                  else
                      rhs_offset := rhs_offset + 1;
                  endif;
              endfor;
              endif;
          endalias;
        
          rhs_offset := 0;
          lhs_offset := 0;
          alias elem_rhs : map_directoryL2LHS_to_directoryL2RHS(elem) do
              if cnt_drs_directoryL2RHS[elem_rhs] > 0 then
              for idx := 0 to cnt_drs_directoryL2RHS[elem_rhs]-1 do
                  if is_machine_in_state(drs_directoryL2RHS[elem_rhs][idx].src, systemRHS) then
                  if cnt_drs_directoryL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                      return false;
                  endif;
                  while !is_machine_in_state(drs_directoryL2LHS[elem][idx - rhs_offset + lhs_offset].src, systemLHS) do
                      lhs_offset := lhs_offset + 1;
                      if cnt_drs_directoryL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                        return false;
                      endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(drs_directoryL2LHS[elem][idx - rhs_offset + lhs_offset], drs_directoryL2RHS[elem_rhs][idx]) then
                      return false;
                  endif;
                  else
                      rhs_offset := rhs_offset + 1;
                  endif;
              endfor;
              endif;
          endalias;
        
          rhs_offset := 0;
          lhs_offset := 0;
          alias elem_rhs : map_directoryL2LHS_to_directoryL2RHS(elem) do
              if cnt_ndr_directoryL2RHS[elem_rhs] > 0 then
              for idx := 0 to cnt_ndr_directoryL2RHS[elem_rhs]-1 do
                  if is_machine_in_state(ndr_directoryL2RHS[elem_rhs][idx].src, systemRHS) then
                  if cnt_ndr_directoryL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                      return false;
                  endif;
                  while !is_machine_in_state(ndr_directoryL2LHS[elem][idx - rhs_offset + lhs_offset].src, systemLHS) do
                      lhs_offset := lhs_offset + 1;
                      if cnt_ndr_directoryL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                        return false;
                      endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(ndr_directoryL2LHS[elem][idx - rhs_offset + lhs_offset], ndr_directoryL2RHS[elem_rhs][idx]) then
                      return false;
                  endif;
                  else
                      rhs_offset := rhs_offset + 1;
                  endif;
              endfor;
              endif;
          endalias;
        
        endfor;
        
      
        return true;
      end;
  
    ----Backend/Murphi/MurphiModular/Functions/GenEQCheckComparisonFunc : RHS Restrictions
    ----Backend/Murphi/MurphiModular/Functions/GenEQCheckComparisonFunc : GlobalStateManagementFunctions
      function can_switch_out_of(state : SystemStates) : boolean;
      begin
        if state = systemLHS then
          return !(fwd_LHS_network_used() | resp_LHS_network_used());
        elsif state = systemRHS then
          if !g_progress_tracking then
            return sameOB() ;
          else
            return true; -- we can always switch back
          endif;
        elsif state = systemLHSExt then
          return true;
        elsif state = systemRHSExt then
          error "unreachable system state";
        else
          error "unkown system state";
        endif;
      end;
      
      function can_switch_to(state : SystemStates) : boolean;
      begin
        if state = systemLHS then
          return true;
        elsif state = systemRHS then
          return !sameOB();
        elsif state = systemLHSExt then
          return sameOB() & !g_progress_tracking;
        elsif state = systemRHSExt then
          error "unreachable system state";
        else
          error "unkown system state";
        endif;
      end;
      
      function continue_run(machine_state: SystemStates; state: SystemStates) : boolean;
      begin
        if machine_state = state then
          if state = systemLHS then
              return !(can_switch_to(systemRHS) & can_switch_out_of(state));
          elsif state = systemRHS then
              if !g_progress_tracking then
                return !(can_switch_to(systemLHS) & can_switch_out_of(state)) & can_RHS_replicate_OB();
              else
                return sameOB(); -- as long as no OB was caused continue
              endif
          elsif state = systemLHSExt then
              return sameOB();
          elsif state = systemRHSExt then
              error "unreachable system state";
          else
              error "unkown system state";
          endif;
        else
          return false;
        endif;
      end;
      
  

--Backend/Murphi/MurphiModular/GenStateMachines

  ----Backend/Murphi/MurphiModular/StateMachines/GenAccessStateMachines
    procedure FSM_Access_cacheL1LHS_E_evict(adr:Address; mTyped:OBJSET_cacheL1LHS);
    var msg: Message;
    begin
    alias cbe: i_cacheL1LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL1LHS(mTyped) do
      msg := AckL1(adr,PutEL1,m,to_m_directoryL1LHS(directoryL1LHS));
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1LHS_E_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1LHS_E_load(adr:Address; mTyped:OBJSET_cacheL1LHS);
    begin
    alias cbe: i_cacheL1LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL1LHS(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1LHS_E;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1LHS_E_store(adr:Address; mTyped:OBJSET_cacheL1LHS);
    begin
    alias cbe: i_cacheL1LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL1LHS(mTyped) do
      Set_perm(store, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1LHS_M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1LHS_I_load(adr:Address; mTyped:OBJSET_cacheL1LHS);
    var msg: Message;
    begin
    alias cbe: i_cacheL1LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL1LHS(mTyped) do
      msg := RequestL1(adr,GetSL1,m,to_m_directoryL1LHS(directoryL1LHS));
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1LHS_I_load;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1LHS_I_store(adr:Address; mTyped:OBJSET_cacheL1LHS);
    var msg: Message;
    begin
    alias cbe: i_cacheL1LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL1LHS(mTyped) do
      msg := RequestL1(adr,GetML1,m,to_m_directoryL1LHS(directoryL1LHS));
      Send_req(msg, m);
      cbe.acksReceivedL1 := 0;
      Clear_perm(adr, m);
      cbe.State := cacheL1LHS_I_store;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1LHS_M_evict(adr:Address; mTyped:OBJSET_cacheL1LHS);
    var msg: Message;
    begin
    alias cbe: i_cacheL1LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL1LHS(mTyped) do
      msg := RespL1(adr,PutML1,m,to_m_directoryL1LHS(directoryL1LHS),cbe.cl);
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1LHS_M_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1LHS_M_load(adr:Address; mTyped:OBJSET_cacheL1LHS);
    begin
    alias cbe: i_cacheL1LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL1LHS(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1LHS_M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1LHS_M_store(adr:Address; mTyped:OBJSET_cacheL1LHS);
    begin
    alias cbe: i_cacheL1LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL1LHS(mTyped) do
      Set_perm(store, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1LHS_M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1LHS_S_evict(adr:Address; mTyped:OBJSET_cacheL1LHS);
    var msg: Message;
    begin
    alias cbe: i_cacheL1LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL1LHS(mTyped) do
      msg := RequestL1(adr,PutSL1,m,to_m_directoryL1LHS(directoryL1LHS));
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1LHS_S_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1LHS_S_load(adr:Address; mTyped:OBJSET_cacheL1LHS);
    begin
    alias cbe: i_cacheL1LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL1LHS(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m);
      cbe.State := cacheL1LHS_S;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1LHS_S_store(adr:Address; mTyped:OBJSET_cacheL1LHS);
    var msg: Message;
    begin
    alias cbe: i_cacheL1LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL1LHS(mTyped) do
      msg := RequestL1(adr,GetML1,m,to_m_directoryL1LHS(directoryL1LHS));
      Send_req(msg, m);
      cbe.acksReceivedL1 := 0;
      Clear_perm(adr, m);
      cbe.State := cacheL1LHS_S_store;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1LHS_E__C__M_evict(adr:Address; mTyped:OBJSET_directoryL1LHS);
    var msg_GetML1: Message;
    var msg: Message;
    begin
    alias cbe: i_directoryL1LHS[mTyped].cb[adr] do
    alias m : to_m_directoryL1LHS(mTyped) do
      msg_GetML1 := RequestL1(adr,GetML1,m,m);
      cbe.acksReceivedL1 := 0;
      msg := RequestL1(adr,Fwd_GetML1,msg_GetML1.src,cbe.ownerL1);
      Send_fwd(msg, m);
      cbe.ownerL1 := msg_GetML1.src;
      Clear_perm(adr, m);
      cbe.State := directoryL1LHS_evictdM_x_pI_store__C__M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1LHS_I__C__E_evict(adr:Address; mTyped:OBJSET_directoryL1LHS);
    var msg_GetML1: Message;
    var msg_GetM_Ack_ADL1: Message;
    var msg_PutML1: Message;
    var msg_Put_AckL1: Message;
    var msg: Message;
    begin
    alias cbe: i_directoryL1LHS[mTyped].cb[adr] do
    alias m : to_m_directoryL1LHS(mTyped) do
      msg_GetML1 := RequestL1(adr,GetML1,m,m);
      cbe.acksReceivedL1 := 0;
      msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
      cbe.ownerL1 := msg_GetML1.src;
      cbe.cl := msg_GetM_Ack_ADL1.cl;
      cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
      if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
      cbe.acksExpectedL1 := 0;
      cbe.acksReceivedL1 := 0;
      Set_perm(store, adr, m);
      msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
      msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
      RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
      if (cbe.ownerL1 = msg_PutML1.src) then
      cbe.cl := msg_PutML1.cl;
      msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2LHS(directoryL2LHS));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := directoryL1LHS_evictI__C__E_evict;
      return;
      endif;
      endif;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1LHS_I__C__M_evict(adr:Address; mTyped:OBJSET_directoryL1LHS);
    var msg_GetML1: Message;
    var msg_GetM_Ack_ADL1: Message;
    var msg_PutML1: Message;
    var msg_Put_AckL1: Message;
    var msg: Message;
    begin
    alias cbe: i_directoryL1LHS[mTyped].cb[adr] do
    alias m : to_m_directoryL1LHS(mTyped) do
      msg_GetML1 := RequestL1(adr,GetML1,m,m);
      cbe.acksReceivedL1 := 0;
      msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
      cbe.ownerL1 := msg_GetML1.src;
      cbe.cl := msg_GetM_Ack_ADL1.cl;
      cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
      if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
      cbe.acksExpectedL1 := 0;
      cbe.acksReceivedL1 := 0;
      Set_perm(store, adr, m);
      msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
      msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
      RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
      if (cbe.ownerL1 = msg_PutML1.src) then
      cbe.cl := msg_PutML1.cl;
      msg := RwdL2(adr,MemWr_IL2,m,to_m_directoryL2LHS(directoryL2LHS),cbe.cl);
      Send_rwd(msg, m);
      Clear_perm(adr, m);
      cbe.State := directoryL1LHS_evictI__C__M_evict;
      return;
      endif;
      endif;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1LHS_I__C__S_evict(adr:Address; mTyped:OBJSET_directoryL1LHS);
    var msg_GetML1: Message;
    var msg_GetM_Ack_ADL1: Message;
    var msg_PutML1: Message;
    var msg_Put_AckL1: Message;
    var msg: Message;
    begin
    alias cbe: i_directoryL1LHS[mTyped].cb[adr] do
    alias m : to_m_directoryL1LHS(mTyped) do
      msg_GetML1 := RequestL1(adr,GetML1,m,m);
      cbe.acksReceivedL1 := 0;
      msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
      cbe.ownerL1 := msg_GetML1.src;
      cbe.cl := msg_GetM_Ack_ADL1.cl;
      cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
      if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
      cbe.acksExpectedL1 := 0;
      cbe.acksReceivedL1 := 0;
      Set_perm(store, adr, m);
      msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
      msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
      RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
      if (cbe.ownerL1 = msg_PutML1.src) then
      cbe.cl := msg_PutML1.cl;
      msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2LHS(directoryL2LHS));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := directoryL1LHS_evictI__C__S_evict;
      return;
      endif;
      endif;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1LHS_M__C__M_evict(adr:Address; mTyped:OBJSET_directoryL1LHS);
    var msg_GetML1: Message;
    var msg: Message;
    begin
    alias cbe: i_directoryL1LHS[mTyped].cb[adr] do
    alias m : to_m_directoryL1LHS(mTyped) do
      msg_GetML1 := RequestL1(adr,GetML1,m,m);
      cbe.acksReceivedL1 := 0;
      msg := RequestL1(adr,Fwd_GetML1,msg_GetML1.src,cbe.ownerL1);
      Send_fwd(msg, m);
      cbe.ownerL1 := msg_GetML1.src;
      Clear_perm(adr, m);
      cbe.State := directoryL1LHS_evictdM_x_pI_store__C__M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1LHS_S__C__E_evict(adr:Address; mTyped:OBJSET_directoryL1LHS);
    var msg_GetML1: Message;
    var msg_GetM_Ack_ADL1: Message;
    var msg: Message;
    var msg_PutML1: Message;
    var msg_Put_AckL1: Message;
    begin
    alias cbe: i_directoryL1LHS[mTyped].cb[adr] do
    alias m : to_m_directoryL1LHS(mTyped) do
      msg_GetML1 := RequestL1(adr,GetML1,m,m);
      cbe.acksReceivedL1 := 0;
      if !(IsElement_cacheL1(cbe.cacheL1, msg_GetML1.src)) then
        msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
        msg := AckL1(adr,InvL1,msg_GetML1.src,msg_GetML1.src);
        Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
        cbe.ownerL1 := msg_GetML1.src;
        ClearVector_cacheL1(cbe.cacheL1);
        cbe.cl := msg_GetM_Ack_ADL1.cl;
        cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
        if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictdM_x_pI_store_GetM_Ack_AD__C__E;
          return;
        endif;
        if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2LHS(directoryL2LHS));
          Send_req2(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictI__C__E_evict;
          return;
          endif;
        endif;
      endif;
      if (IsElement_cacheL1(cbe.cacheL1, msg_GetML1.src)) then
        RemoveElement_cacheL1(cbe.cacheL1, msg_GetML1.src);
        msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
        msg := AckL1(adr,InvL1,msg_GetML1.src,msg_GetML1.src);
        Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
        cbe.ownerL1 := msg_GetML1.src;
        ClearVector_cacheL1(cbe.cacheL1);
        cbe.cl := msg_GetM_Ack_ADL1.cl;
        cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
        if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2LHS(directoryL2LHS));
          Send_req2(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictI__C__E_evict;
          return;
          endif;
        endif;
        if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictdM_x_pI_store_GetM_Ack_AD__C__E;
          return;
        endif;
      endif;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1LHS_S__C__M_evict(adr:Address; mTyped:OBJSET_directoryL1LHS);
    var msg_GetML1: Message;
    var msg_GetM_Ack_ADL1: Message;
    var msg: Message;
    var msg_PutML1: Message;
    var msg_Put_AckL1: Message;
    begin
    alias cbe: i_directoryL1LHS[mTyped].cb[adr] do
    alias m : to_m_directoryL1LHS(mTyped) do
      msg_GetML1 := RequestL1(adr,GetML1,m,m);
      cbe.acksReceivedL1 := 0;
      if !(IsElement_cacheL1(cbe.cacheL1, msg_GetML1.src)) then
        msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
        msg := AckL1(adr,InvL1,msg_GetML1.src,msg_GetML1.src);
        Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
        cbe.ownerL1 := msg_GetML1.src;
        ClearVector_cacheL1(cbe.cacheL1);
        cbe.cl := msg_GetM_Ack_ADL1.cl;
        cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
        if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictdM_x_pI_store_GetM_Ack_AD__C__M;
          return;
        endif;
        if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          msg := RwdL2(adr,MemWr_IL2,m,to_m_directoryL2LHS(directoryL2LHS),cbe.cl);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictI__C__M_evict;
          return;
          endif;
        endif;
      endif;
      if (IsElement_cacheL1(cbe.cacheL1, msg_GetML1.src)) then
        RemoveElement_cacheL1(cbe.cacheL1, msg_GetML1.src);
        msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
        msg := AckL1(adr,InvL1,msg_GetML1.src,msg_GetML1.src);
        Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
        cbe.ownerL1 := msg_GetML1.src;
        ClearVector_cacheL1(cbe.cacheL1);
        cbe.cl := msg_GetM_Ack_ADL1.cl;
        cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
        if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          msg := RwdL2(adr,MemWr_IL2,m,to_m_directoryL2LHS(directoryL2LHS),cbe.cl);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictI__C__M_evict;
          return;
          endif;
        endif;
        if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictdM_x_pI_store_GetM_Ack_AD__C__M;
          return;
        endif;
      endif;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1LHS_S__C__S_evict(adr:Address; mTyped:OBJSET_directoryL1LHS);
    var msg_GetML1: Message;
    var msg_GetM_Ack_ADL1: Message;
    var msg: Message;
    var msg_PutML1: Message;
    var msg_Put_AckL1: Message;
    begin
    alias cbe: i_directoryL1LHS[mTyped].cb[adr] do
    alias m : to_m_directoryL1LHS(mTyped) do
      msg_GetML1 := RequestL1(adr,GetML1,m,m);
      cbe.acksReceivedL1 := 0;
      if (IsElement_cacheL1(cbe.cacheL1, msg_GetML1.src)) then
        RemoveElement_cacheL1(cbe.cacheL1, msg_GetML1.src);
        msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
        msg := AckL1(adr,InvL1,msg_GetML1.src,msg_GetML1.src);
        Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
        cbe.ownerL1 := msg_GetML1.src;
        ClearVector_cacheL1(cbe.cacheL1);
        cbe.cl := msg_GetM_Ack_ADL1.cl;
        cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
        if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictdM_x_pI_store_GetM_Ack_AD__C__S;
          return;
        endif;
        if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2LHS(directoryL2LHS));
          Send_req2(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictI__C__S_evict;
          return;
          endif;
        endif;
      endif;
      if !(IsElement_cacheL1(cbe.cacheL1, msg_GetML1.src)) then
        msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
        msg := AckL1(adr,InvL1,msg_GetML1.src,msg_GetML1.src);
        Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
        cbe.ownerL1 := msg_GetML1.src;
        ClearVector_cacheL1(cbe.cacheL1);
        cbe.cl := msg_GetM_Ack_ADL1.cl;
        cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
        if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictdM_x_pI_store_GetM_Ack_AD__C__S;
          return;
        endif;
        if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2LHS(directoryL2LHS));
          Send_req2(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictI__C__S_evict;
          return;
          endif;
        endif;
      endif;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2LHS_E_evict(adr:Address; mTyped:OBJSET_cacheL2LHS);
    var msg: Message;
    begin
    alias cbe: i_cacheL2LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL2LHS(mTyped) do
      msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2LHS(directoryL2LHS));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL2LHS_E_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2LHS_E_load(adr:Address; mTyped:OBJSET_cacheL2LHS);
    begin
    alias cbe: i_cacheL2LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL2LHS(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL2LHS_E;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2LHS_E_store(adr:Address; mTyped:OBJSET_cacheL2LHS);
    begin
    alias cbe: i_cacheL2LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL2LHS(mTyped) do
      Set_perm(store, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL2LHS_M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2LHS_I_load(adr:Address; mTyped:OBJSET_cacheL2LHS);
    var msg: Message;
    begin
    alias cbe: i_cacheL2LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL2LHS(mTyped) do
      msg := ReqL2(adr,MemRd_S_SnpDataL2,m,to_m_directoryL2LHS(directoryL2LHS));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL2LHS_I_load;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2LHS_I_store(adr:Address; mTyped:OBJSET_cacheL2LHS);
    var msg: Message;
    begin
    alias cbe: i_cacheL2LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL2LHS(mTyped) do
      msg := ReqL2(adr,MemRd_A_SnpInvL2,m,to_m_directoryL2LHS(directoryL2LHS));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL2LHS_I_store;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2LHS_M_evict(adr:Address; mTyped:OBJSET_cacheL2LHS);
    var msg: Message;
    begin
    alias cbe: i_cacheL2LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL2LHS(mTyped) do
      msg := RwdL2(adr,MemWr_IL2,m,to_m_directoryL2LHS(directoryL2LHS),cbe.cl);
      Send_rwd(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL2LHS_M_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2LHS_M_load(adr:Address; mTyped:OBJSET_cacheL2LHS);
    begin
    alias cbe: i_cacheL2LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL2LHS(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL2LHS_M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2LHS_M_store(adr:Address; mTyped:OBJSET_cacheL2LHS);
    begin
    alias cbe: i_cacheL2LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL2LHS(mTyped) do
      Set_perm(store, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL2LHS_M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2LHS_S_evict(adr:Address; mTyped:OBJSET_cacheL2LHS);
    var msg: Message;
    begin
    alias cbe: i_cacheL2LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL2LHS(mTyped) do
      msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2LHS(directoryL2LHS));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL2LHS_S_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2LHS_S_load(adr:Address; mTyped:OBJSET_cacheL2LHS);
    begin
    alias cbe: i_cacheL2LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL2LHS(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m);
      cbe.State := cacheL2LHS_S;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2LHS_S_store(adr:Address; mTyped:OBJSET_cacheL2LHS);
    var msg: Message;
    begin
    alias cbe: i_cacheL2LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL2LHS(mTyped) do
      msg := ReqL2(adr,MemInv_A_SnpInvL2,m,to_m_directoryL2LHS(directoryL2LHS));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL2LHS_S_store;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_abstractionRHS_E_evict(adr:Address; mTyped:OBJSET_abstractionRHS);
    var msg: Message;
    begin
    alias cbe: i_abstractionRHS[mTyped].cb[adr] do
    alias m : to_m_abstractionRHS(mTyped) do
      msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2RHS(directoryL2LHS));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := abstractionRHS_E_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_abstractionRHS_E_load(adr:Address; mTyped:OBJSET_abstractionRHS);
    begin
    alias cbe: i_abstractionRHS[mTyped].cb[adr] do
    alias m : to_m_abstractionRHS(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := abstractionRHS_E;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_abstractionRHS_E_store(adr:Address; mTyped:OBJSET_abstractionRHS);
    begin
    alias cbe: i_abstractionRHS[mTyped].cb[adr] do
    alias m : to_m_abstractionRHS(mTyped) do
      Set_perm(store, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := abstractionRHS_M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_abstractionRHS_I_load(adr:Address; mTyped:OBJSET_abstractionRHS);
    var msg: Message;
    begin
    alias cbe: i_abstractionRHS[mTyped].cb[adr] do
    alias m : to_m_abstractionRHS(mTyped) do
      msg := ReqL2(adr,MemRd_S_SnpDataL2,m,to_m_directoryL2RHS(directoryL2LHS));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := abstractionRHS_I_load;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_abstractionRHS_I_store(adr:Address; mTyped:OBJSET_abstractionRHS);
    var msg: Message;
    begin
    alias cbe: i_abstractionRHS[mTyped].cb[adr] do
    alias m : to_m_abstractionRHS(mTyped) do
      msg := ReqL2(adr,MemRd_A_SnpInvL2,m,to_m_directoryL2RHS(directoryL2LHS));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := abstractionRHS_I_store;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_abstractionRHS_M_evict(adr:Address; mTyped:OBJSET_abstractionRHS);
    var msg: Message;
    begin
    alias cbe: i_abstractionRHS[mTyped].cb[adr] do
    alias m : to_m_abstractionRHS(mTyped) do
      msg := RwdL2(adr,MemWr_IL2,m,to_m_directoryL2RHS(directoryL2LHS),cbe.cl);
      Send_rwd(msg, m);
      Clear_perm(adr, m);
      cbe.State := abstractionRHS_M_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_abstractionRHS_M_load(adr:Address; mTyped:OBJSET_abstractionRHS);
    begin
    alias cbe: i_abstractionRHS[mTyped].cb[adr] do
    alias m : to_m_abstractionRHS(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := abstractionRHS_M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_abstractionRHS_M_store(adr:Address; mTyped:OBJSET_abstractionRHS);
    begin
    alias cbe: i_abstractionRHS[mTyped].cb[adr] do
    alias m : to_m_abstractionRHS(mTyped) do
      Set_perm(store, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := abstractionRHS_M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_abstractionRHS_S_evict(adr:Address; mTyped:OBJSET_abstractionRHS);
    var msg: Message;
    begin
    alias cbe: i_abstractionRHS[mTyped].cb[adr] do
    alias m : to_m_abstractionRHS(mTyped) do
      msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2RHS(directoryL2LHS));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := abstractionRHS_S_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_abstractionRHS_S_load(adr:Address; mTyped:OBJSET_abstractionRHS);
    begin
    alias cbe: i_abstractionRHS[mTyped].cb[adr] do
    alias m : to_m_abstractionRHS(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m);
      cbe.State := abstractionRHS_S;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_abstractionRHS_S_store(adr:Address; mTyped:OBJSET_abstractionRHS);
    var msg: Message;
    begin
    alias cbe: i_abstractionRHS[mTyped].cb[adr] do
    alias m : to_m_abstractionRHS(mTyped) do
      msg := ReqL2(adr,MemInv_A_SnpInvL2,m,to_m_directoryL2RHS(directoryL2LHS));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := abstractionRHS_S_store;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2RHS_E_evict(adr:Address; mTyped:OBJSET_cacheL2RHS);
    var msg: Message;
    begin
    alias cbe: i_cacheL2RHS[mTyped].cb[adr] do
    alias m : to_m_cacheL2RHS(mTyped) do
      msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2RHS(directoryL2LHS));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL2RHS_E_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2RHS_E_load(adr:Address; mTyped:OBJSET_cacheL2RHS);
    begin
    alias cbe: i_cacheL2RHS[mTyped].cb[adr] do
    alias m : to_m_cacheL2RHS(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL2RHS_E;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2RHS_E_store(adr:Address; mTyped:OBJSET_cacheL2RHS);
    begin
    alias cbe: i_cacheL2RHS[mTyped].cb[adr] do
    alias m : to_m_cacheL2RHS(mTyped) do
      Set_perm(store, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL2RHS_M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2RHS_I_load(adr:Address; mTyped:OBJSET_cacheL2RHS);
    var msg: Message;
    begin
    alias cbe: i_cacheL2RHS[mTyped].cb[adr] do
    alias m : to_m_cacheL2RHS(mTyped) do
      msg := ReqL2(adr,MemRd_S_SnpDataL2,m,to_m_directoryL2RHS(directoryL2LHS));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL2RHS_I_load;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2RHS_I_store(adr:Address; mTyped:OBJSET_cacheL2RHS);
    var msg: Message;
    begin
    alias cbe: i_cacheL2RHS[mTyped].cb[adr] do
    alias m : to_m_cacheL2RHS(mTyped) do
      msg := ReqL2(adr,MemRd_A_SnpInvL2,m,to_m_directoryL2RHS(directoryL2LHS));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL2RHS_I_store;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2RHS_M_evict(adr:Address; mTyped:OBJSET_cacheL2RHS);
    var msg: Message;
    begin
    alias cbe: i_cacheL2RHS[mTyped].cb[adr] do
    alias m : to_m_cacheL2RHS(mTyped) do
      msg := RwdL2(adr,MemWr_IL2,m,to_m_directoryL2RHS(directoryL2LHS),cbe.cl);
      Send_rwd(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL2RHS_M_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2RHS_M_load(adr:Address; mTyped:OBJSET_cacheL2RHS);
    begin
    alias cbe: i_cacheL2RHS[mTyped].cb[adr] do
    alias m : to_m_cacheL2RHS(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL2RHS_M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2RHS_M_store(adr:Address; mTyped:OBJSET_cacheL2RHS);
    begin
    alias cbe: i_cacheL2RHS[mTyped].cb[adr] do
    alias m : to_m_cacheL2RHS(mTyped) do
      Set_perm(store, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL2RHS_M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2RHS_S_evict(adr:Address; mTyped:OBJSET_cacheL2RHS);
    var msg: Message;
    begin
    alias cbe: i_cacheL2RHS[mTyped].cb[adr] do
    alias m : to_m_cacheL2RHS(mTyped) do
      msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2RHS(directoryL2LHS));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL2RHS_S_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2RHS_S_load(adr:Address; mTyped:OBJSET_cacheL2RHS);
    begin
    alias cbe: i_cacheL2RHS[mTyped].cb[adr] do
    alias m : to_m_cacheL2RHS(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m);
      cbe.State := cacheL2RHS_S;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2RHS_S_store(adr:Address; mTyped:OBJSET_cacheL2RHS);
    var msg: Message;
    begin
    alias cbe: i_cacheL2RHS[mTyped].cb[adr] do
    alias m : to_m_cacheL2RHS(mTyped) do
      msg := ReqL2(adr,MemInv_A_SnpInvL2,m,to_m_directoryL2RHS(directoryL2LHS));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL2RHS_S_store;
      return;
    endalias;
    endalias;
    end;
    
  ----Backend/Murphi/MurphiModular/StateMachines/GenMessageStateMachines
    function FSM_MSG_directoryL1LHS(inmsg:Message; mTyped:OBJSET_directoryL1LHS) : boolean;
    var msg: Message;
    var msg_PutML1: Message;
    var msg_Put_AckL1: Message;
    var msg_PutSL1: Message;
    var msg_GetML1: Message;
    var msg_GetSL1: Message;
    var msg_GetM_Ack_ADL1: Message;
    var msg_GetM_Ack_DL1: Message;
    var msg_PutEL1: Message;
    var msg_GetS_AckL1: Message;
    begin
      alias adr: inmsg.adr do
      alias cbe: i_directoryL1LHS[mTyped].cb[adr] do
    alias m : to_m_directoryL1LHS(mTyped) do
    switch cbe.State
      case directoryL1LHS_BIConflictAckL2I__C__M_BIConflictAck:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__E:
      switch inmsg.mtype
        case Inv_AckL1:
          cbe.acksReceivedL1 := cbe.acksReceivedL1+1;
          if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__E;
            return true;
          endif;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            cbe.acksExpectedL1 := 0;
            cbe.acksReceivedL1 := 0;
            Set_perm(store, adr, m);
            msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
            msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
            RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
            if (cbe.ownerL1 = msg_PutML1.src) then
            cbe.cl := msg_PutML1.cl;
            msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
            Send_birsp(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__I;
            return true;
            endif;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__I_store:
      switch inmsg.mtype
        case Inv_AckL1:
          cbe.acksReceivedL1 := cbe.acksReceivedL1+1;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            cbe.acksExpectedL1 := 0;
            cbe.acksReceivedL1 := 0;
            Set_perm(store, adr, m);
            msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
            msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
            RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
            if (cbe.ownerL1 = msg_PutML1.src) then
            cbe.cl := msg_PutML1.cl;
            msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
            Send_birsp(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_GetML1S__C__I_store;
            return true;
            endif;
          endif;
          if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__I_store;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__M:
      switch inmsg.mtype
        case Inv_AckL1:
          cbe.acksReceivedL1 := cbe.acksReceivedL1+1;
          if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__M;
            return true;
          endif;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            cbe.acksExpectedL1 := 0;
            cbe.acksReceivedL1 := 0;
            Set_perm(store, adr, m);
            msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
            msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
            RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
            if (cbe.ownerL1 = msg_PutML1.src) then
            cbe.cl := msg_PutML1.cl;
            msg := RwdL2(adr,MemWr_IL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_rwd(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_BIConflictAckL2I__C__M_BIConflictAck;
            return true;
            endif;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__S:
      switch inmsg.mtype
        case Inv_AckL1:
          cbe.acksReceivedL1 := cbe.acksReceivedL1+1;
          if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__S;
            return true;
          endif;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            cbe.acksExpectedL1 := 0;
            cbe.acksReceivedL1 := 0;
            Set_perm(store, adr, m);
            msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
            msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
            RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
            if (cbe.ownerL1 = msg_PutML1.src) then
            cbe.cl := msg_PutML1.cl;
            msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
            Send_birsp(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__I;
            return true;
            endif;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_BIConflictAckL2dM_x_pI_store__C__M:
      switch inmsg.mtype
        case GetM_Ack_DL1:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          msg := RwdL2(adr,MemWr_IL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_rwd(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_BIConflictAckL2I__C__M_BIConflictAck;
          return true;
          endif;
        
        case Inv_AckL1:
          cbe.acksReceivedL1 := cbe.acksReceivedL1+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_BIConflictAckL2dM_x_pI_store__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_BISnpDataL2I__C__M_BISnpData:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspSL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__S;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_BISnpDataL2S__C__M_BISnpData:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspSL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_S__C__S;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_BISnpDataL2dE_GetS_x_pI_load__C__M:
      switch inmsg.mtype
        case GetS_AckL1:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_BISnpDataL2dE_GetS_x_pS__C__M;
          return true;
        
        case WBL1:
          if (inmsg.src = cbe.ownerL1) then
          cbe.cl := inmsg.cl;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_BISnpDataL2dS_x_pI_load__C__M;
          return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_BISnpDataL2dE_GetS_x_pS__C__M:
      switch inmsg.mtype
        case WBL1:
          if (inmsg.src = cbe.ownerL1) then
          cbe.cl := inmsg.cl;
          msg_PutSL1 := RequestL1(adr,PutSL1,m,m);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutSL1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutSL1.src);
          if (VectorCount_cacheL1(cbe.cacheL1) = 0) then
            msg := RwdL2(adr,MemWr_SL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_rwd(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_BISnpDataL2I__C__M_BISnpData;
            return true;
          endif;
          if !(VectorCount_cacheL1(cbe.cacheL1) = 0) then
            msg := RwdL2(adr,MemWr_SL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_rwd(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_BISnpDataL2S__C__M_BISnpData;
            return true;
          endif;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_BISnpDataL2dM_GetS_x_pI_load__C__M:
      switch inmsg.mtype
        case GetS_AckL1:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_BISnpDataL2dM_GetS_x_pS__C__M;
          return true;
        
        case WBL1:
          if (inmsg.src = cbe.ownerL1) then
          cbe.cl := inmsg.cl;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_BISnpDataL2dS_x_pI_load__C__M;
          return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_BISnpDataL2dM_GetS_x_pS__C__M:
      switch inmsg.mtype
        case WBL1:
          if (inmsg.src = cbe.ownerL1) then
          cbe.cl := inmsg.cl;
          msg_PutSL1 := RequestL1(adr,PutSL1,m,m);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutSL1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutSL1.src);
          if !(VectorCount_cacheL1(cbe.cacheL1) = 0) then
            msg := RwdL2(adr,MemWr_SL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_rwd(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_BISnpDataL2S__C__M_BISnpData;
            return true;
          endif;
          if (VectorCount_cacheL1(cbe.cacheL1) = 0) then
            msg := RwdL2(adr,MemWr_SL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_rwd(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_BISnpDataL2I__C__M_BISnpData;
            return true;
          endif;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_BISnpDataL2dS_x_pI_load__C__M:
      switch inmsg.mtype
        case GetS_AckL1:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          msg_PutSL1 := RequestL1(adr,PutSL1,m,m);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutSL1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutSL1.src);
          if (VectorCount_cacheL1(cbe.cacheL1) = 0) then
            msg := RwdL2(adr,MemWr_SL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_rwd(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_BISnpDataL2I__C__M_BISnpData;
            return true;
          endif;
          if !(VectorCount_cacheL1(cbe.cacheL1) = 0) then
            msg := RwdL2(adr,MemWr_SL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_rwd(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_BISnpDataL2S__C__M_BISnpData;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_BISnpInvL2I__C__M_BISnpInv:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__E:
      switch inmsg.mtype
        case Inv_AckL1:
          cbe.acksReceivedL1 := cbe.acksReceivedL1+1;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            cbe.acksExpectedL1 := 0;
            cbe.acksReceivedL1 := 0;
            Set_perm(store, adr, m);
            msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
            msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
            RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
            if (cbe.ownerL1 = msg_PutML1.src) then
            cbe.cl := msg_PutML1.cl;
            msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
            Send_birsp(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__I;
            return true;
            endif;
          endif;
          if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__E;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__M:
      switch inmsg.mtype
        case Inv_AckL1:
          cbe.acksReceivedL1 := cbe.acksReceivedL1+1;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            cbe.acksExpectedL1 := 0;
            cbe.acksReceivedL1 := 0;
            Set_perm(store, adr, m);
            msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
            msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
            RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
            if (cbe.ownerL1 = msg_PutML1.src) then
            cbe.cl := msg_PutML1.cl;
            msg := RwdL2(adr,MemWr_IL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_rwd(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_BISnpInvL2I__C__M_BISnpInv;
            return true;
            endif;
          endif;
          if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__S:
      switch inmsg.mtype
        case Inv_AckL1:
          cbe.acksReceivedL1 := cbe.acksReceivedL1+1;
          if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__S;
            return true;
          endif;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            cbe.acksExpectedL1 := 0;
            cbe.acksReceivedL1 := 0;
            Set_perm(store, adr, m);
            msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
            msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
            RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
            if (cbe.ownerL1 = msg_PutML1.src) then
            cbe.cl := msg_PutML1.cl;
            msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
            Send_birsp(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__I;
            return true;
            endif;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_BISnpInvL2dM_x_pI_store__C__M:
      switch inmsg.mtype
        case GetM_Ack_DL1:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          msg := RwdL2(adr,MemWr_IL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_rwd(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_BISnpInvL2I__C__M_BISnpInv;
          return true;
          endif;
        
        case Inv_AckL1:
          cbe.acksReceivedL1 := cbe.acksReceivedL1+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_BISnpInvL2dM_x_pI_store__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_E__C__M:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg := RequestL1(adr,Fwd_GetML1,msg_GetML1.src,cbe.ownerL1);
          Send_fwd(msg, m);
          cbe.ownerL1 := msg_GetML1.src;
          cbe.proxy_msgL2 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_BIConflictAckL2dM_x_pI_store__C__M;
          return true;
        
        case BISnpDataL2:
          msg_GetSL1 := RequestL1(adr,GetSL1,m,m);
          msg := RequestL1(adr,Fwd_GetSL1,msg_GetSL1.src,cbe.ownerL1);
          Send_fwd(msg, m);
          AddElement_cacheL1(cbe.cacheL1, msg_GetSL1.src);
          AddElement_cacheL1(cbe.cacheL1, cbe.ownerL1);
          cbe.proxy_msgL2 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_BISnpDataL2dE_GetS_x_pI_load__C__M;
          return true;
        
        case BISnpInvL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg := RequestL1(adr,Fwd_GetML1,msg_GetML1.src,cbe.ownerL1);
          Send_fwd(msg, m);
          cbe.ownerL1 := msg_GetML1.src;
          cbe.proxy_msgL2 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_BISnpInvL2dM_x_pI_store__C__M;
          return true;
        
        case GetML1:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1 := inmsg;
          msg := RequestL1(adr,Fwd_GetML1,cbe.proxy_msgL1.src,cbe.ownerL1);
          Send_fwd(msg, m);
          cbe.ownerL1 := cbe.proxy_msgL1.src;
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_M__C__M;
          return true;
        
        case GetSL1:
          Set_perm(load, adr, m);
          cbe.proxy_msgL1 := inmsg;
          msg := RequestL1(adr,Fwd_GetSL1,cbe.proxy_msgL1.src,cbe.ownerL1);
          Send_fwd(msg, m);
          AddElement_cacheL1(cbe.cacheL1, cbe.proxy_msgL1.src);
          AddElement_cacheL1(cbe.cacheL1, cbe.ownerL1);
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetSL1E_GetS__C__M;
          return true;
        
        case PutEL1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if !(cbe.ownerL1 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_E__C__M;
            return true;
          endif;
          if (cbe.ownerL1 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__M;
            return true;
          endif;
        
        case PutML1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if !(cbe.ownerL1 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_E__C__M;
            return true;
          endif;
          if (cbe.ownerL1 = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__M;
            return true;
          endif;
        
        case PutSL1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if !(cbe.ownerL1 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_E__C__M;
            return true;
          endif;
          if (cbe.ownerL1 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_GetML1I__C__I_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
          cbe.ownerL1 := msg_GetML1.src;
          cbe.cl := msg_GetM_Ack_ADL1.cl;
          cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetML1I__C__I_store;
          return true;
          endif;
          endif;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetML1I__C__I_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetML1I__C__I_store;
          return true;
        
        case Cmp_EL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetML1I__C__I_store_Cmp_E;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_GetML1I__C__I_store_Cmp_E:
      switch inmsg.mtype
        case MemDataL2:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg := RespAckL1(adr,GetM_Ack_ADL1,m,cbe.proxy_msgL1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
          Send_resp(msg, m);
          cbe.ownerL1 := cbe.proxy_msgL1.src;
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_M__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_GetML1I__C__S_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
          cbe.ownerL1 := msg_GetML1.src;
          cbe.cl := msg_GetM_Ack_ADL1.cl;
          cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetML1I__C__I_store;
          return true;
          endif;
          endif;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetML1I__C__S_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetML1I__C__S_store;
          return true;
        
        case Cmp_EL2:
          Set_perm(store, adr, m);
          msg := RespAckL1(adr,GetM_Ack_ADL1,m,cbe.proxy_msgL1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
          Send_resp(msg, m);
          cbe.ownerL1 := cbe.proxy_msgL1.src;
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_M__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_GetML1S__C__I_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          if (IsElement_cacheL1(cbe.cacheL1, msg_GetML1.src)) then
            RemoveElement_cacheL1(cbe.cacheL1, msg_GetML1.src);
            msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            msg := AckL1(adr,InvL1,msg_GetML1.src,msg_GetML1.src);
            Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
            cbe.ownerL1 := msg_GetML1.src;
            ClearVector_cacheL1(cbe.cacheL1);
            cbe.cl := msg_GetM_Ack_ADL1.cl;
            cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
            if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.acksExpectedL1 := 0;
              cbe.acksReceivedL1 := 0;
              Set_perm(store, adr, m);
              msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
              msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
              RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
              if (cbe.ownerL1 = msg_PutML1.src) then
              cbe.cl := msg_PutML1.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
              Send_birsp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_GetML1S__C__I_store;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__I_store;
              return true;
            endif;
          endif;
          if !(IsElement_cacheL1(cbe.cacheL1, msg_GetML1.src)) then
            msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            msg := AckL1(adr,InvL1,msg_GetML1.src,msg_GetML1.src);
            Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
            cbe.ownerL1 := msg_GetML1.src;
            ClearVector_cacheL1(cbe.cacheL1);
            cbe.cl := msg_GetM_Ack_ADL1.cl;
            cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
            if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.acksExpectedL1 := 0;
              cbe.acksReceivedL1 := 0;
              Set_perm(store, adr, m);
              msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
              msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
              RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
              if (cbe.ownerL1 = msg_PutML1.src) then
              cbe.cl := msg_PutML1.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
              Send_birsp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_GetML1S__C__I_store;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__I_store;
              return true;
            endif;
          endif;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetML1S__C__I_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetML1S__C__I_store;
          return true;
        
        case Cmp_EL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetML1S__C__I_store_Cmp_E;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_GetML1S__C__I_store_Cmp_E:
      switch inmsg.mtype
        case MemDataL2:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          if !(IsElement_cacheL1(cbe.cacheL1, cbe.proxy_msgL1.src)) then
            msg := RespAckL1(adr,GetM_Ack_ADL1,m,cbe.proxy_msgL1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            Send_resp(msg, m);
            msg := AckL1(adr,InvL1,cbe.proxy_msgL1.src,cbe.proxy_msgL1.src);
            Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
            cbe.ownerL1 := cbe.proxy_msgL1.src;
            ClearVector_cacheL1(cbe.cacheL1);
            undefine cbe.proxy_msgL1;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_M__C__M;
            return true;
          endif;
          if (IsElement_cacheL1(cbe.cacheL1, cbe.proxy_msgL1.src)) then
            RemoveElement_cacheL1(cbe.cacheL1, cbe.proxy_msgL1.src);
            msg := RespAckL1(adr,GetM_Ack_ADL1,m,cbe.proxy_msgL1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            Send_resp(msg, m);
            msg := AckL1(adr,InvL1,cbe.proxy_msgL1.src,cbe.proxy_msgL1.src);
            Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
            cbe.ownerL1 := cbe.proxy_msgL1.src;
            ClearVector_cacheL1(cbe.cacheL1);
            undefine cbe.proxy_msgL1;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_M__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_GetML1S__C__S_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          if !(IsElement_cacheL1(cbe.cacheL1, msg_GetML1.src)) then
            msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            msg := AckL1(adr,InvL1,msg_GetML1.src,msg_GetML1.src);
            Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
            cbe.ownerL1 := msg_GetML1.src;
            ClearVector_cacheL1(cbe.cacheL1);
            cbe.cl := msg_GetM_Ack_ADL1.cl;
            cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
            if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.acksExpectedL1 := 0;
              cbe.acksReceivedL1 := 0;
              Set_perm(store, adr, m);
              msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
              msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
              RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
              if (cbe.ownerL1 = msg_PutML1.src) then
              cbe.cl := msg_PutML1.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
              Send_birsp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_GetML1S__C__I_store;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__I_store;
              return true;
            endif;
          endif;
          if (IsElement_cacheL1(cbe.cacheL1, msg_GetML1.src)) then
            RemoveElement_cacheL1(cbe.cacheL1, msg_GetML1.src);
            msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            msg := AckL1(adr,InvL1,msg_GetML1.src,msg_GetML1.src);
            Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
            cbe.ownerL1 := msg_GetML1.src;
            ClearVector_cacheL1(cbe.cacheL1);
            cbe.cl := msg_GetM_Ack_ADL1.cl;
            cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
            if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__I_store;
              return true;
            endif;
            if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.acksExpectedL1 := 0;
              cbe.acksReceivedL1 := 0;
              Set_perm(store, adr, m);
              msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
              msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
              RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
              if (cbe.ownerL1 = msg_PutML1.src) then
              cbe.cl := msg_PutML1.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
              Send_birsp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_GetML1S__C__I_store;
              return true;
              endif;
            endif;
          endif;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetML1S__C__S_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetML1S__C__S_store;
          return true;
        
        case Cmp_EL2:
          Set_perm(store, adr, m);
          if (IsElement_cacheL1(cbe.cacheL1, cbe.proxy_msgL1.src)) then
            RemoveElement_cacheL1(cbe.cacheL1, cbe.proxy_msgL1.src);
            msg := RespAckL1(adr,GetM_Ack_ADL1,m,cbe.proxy_msgL1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            Send_resp(msg, m);
            msg := AckL1(adr,InvL1,cbe.proxy_msgL1.src,cbe.proxy_msgL1.src);
            Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
            cbe.ownerL1 := cbe.proxy_msgL1.src;
            ClearVector_cacheL1(cbe.cacheL1);
            undefine cbe.proxy_msgL1;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_M__C__M;
            return true;
          endif;
          if !(IsElement_cacheL1(cbe.cacheL1, cbe.proxy_msgL1.src)) then
            msg := RespAckL1(adr,GetM_Ack_ADL1,m,cbe.proxy_msgL1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            Send_resp(msg, m);
            msg := AckL1(adr,InvL1,cbe.proxy_msgL1.src,cbe.proxy_msgL1.src);
            Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
            cbe.ownerL1 := cbe.proxy_msgL1.src;
            ClearVector_cacheL1(cbe.cacheL1);
            undefine cbe.proxy_msgL1;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_M__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_GetSL1E_GetS__C__M:
      switch inmsg.mtype
        case WBL1:
          if (inmsg.src = cbe.ownerL1) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_S__C__M;
            return true;
          endif;
          if !(inmsg.src = cbe.ownerL1) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_GetSL1E_GetS__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_GetSL1I__C__I_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
          cbe.ownerL1 := msg_GetML1.src;
          cbe.cl := msg_GetM_Ack_ADL1.cl;
          cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetSL1I__C__I_store;
          return true;
          endif;
          endif;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetSL1I__C__I_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetSL1I__C__I_store;
          return true;
        
        case Cmp_EL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetSL1I__C__I_store_Cmp_E;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_GetSL1I__C__I_store_Cmp_E:
      switch inmsg.mtype
        case MemDataL2:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg := RespL1(adr,GetM_Ack_DL1,m,cbe.proxy_msgL1.src,cbe.cl);
          Send_resp(msg, m);
          cbe.ownerL1 := cbe.proxy_msgL1.src;
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_E__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_GetSL1I__C__S_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
          cbe.ownerL1 := msg_GetML1.src;
          cbe.cl := msg_GetM_Ack_ADL1.cl;
          cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetSL1I__C__I_store;
          return true;
          endif;
          endif;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetSL1I__C__S_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetSL1I__C__S_store;
          return true;
        
        case Cmp_EL2:
          Set_perm(store, adr, m);
          msg := RespL1(adr,GetM_Ack_DL1,m,cbe.proxy_msgL1.src,cbe.cl);
          Send_resp(msg, m);
          cbe.ownerL1 := cbe.proxy_msgL1.src;
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_E__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_GetSL1M_GetS__C__M:
      switch inmsg.mtype
        case WBL1:
          if !(inmsg.src = cbe.ownerL1) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_GetSL1M_GetS__C__M;
            return true;
          endif;
          if (inmsg.src = cbe.ownerL1) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_S__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_I__C__E:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
          cbe.ownerL1 := msg_GetML1.src;
          cbe.cl := msg_GetM_Ack_ADL1.cl;
          cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__I;
          return true;
          endif;
          endif;
        
        case BISnpDataL2:
          msg_GetSL1 := RequestL1(adr,GetSL1,m,m);
          msg_GetM_Ack_DL1 := RespL1(adr,GetM_Ack_DL1,m,msg_GetSL1.src,cbe.cl);
          cbe.ownerL1 := msg_GetSL1.src;
          cbe.cl := msg_GetM_Ack_DL1.cl;
          Set_perm(load, adr, m);
          msg_PutEL1 := AckL1(adr,PutEL1,m,m);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutEL1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutEL1.src);
          if (cbe.ownerL1 = msg_PutEL1.src) then
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspSL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__S;
          return true;
          endif;
        
        case BISnpInvL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
          cbe.ownerL1 := msg_GetML1.src;
          cbe.cl := msg_GetM_Ack_ADL1.cl;
          cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__I;
          return true;
          endif;
          endif;
        
        case GetML1:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1 := inmsg;
          msg := RespAckL1(adr,GetM_Ack_ADL1,m,cbe.proxy_msgL1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
          Send_resp(msg, m);
          cbe.ownerL1 := cbe.proxy_msgL1.src;
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_M__C__M;
          return true;
        
        case GetSL1:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1 := inmsg;
          msg := RespL1(adr,GetM_Ack_DL1,m,cbe.proxy_msgL1.src,cbe.cl);
          Send_resp(msg, m);
          cbe.ownerL1 := cbe.proxy_msgL1.src;
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_E__C__M;
          return true;
        
        case PutEL1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if !(cbe.ownerL1 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__E;
            return true;
          endif;
          if (cbe.ownerL1 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__E;
            return true;
          endif;
        
        case PutML1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if !(cbe.ownerL1 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__E;
            return true;
          endif;
          if (cbe.ownerL1 = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__E;
            return true;
          endif;
        
        case PutSL1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if !(VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__E;
            return true;
          endif;
          if (VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__E;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_I__C__I:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
          cbe.ownerL1 := msg_GetML1.src;
          cbe.cl := msg_GetM_Ack_ADL1.cl;
          cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__I;
          return true;
          endif;
          endif;
        
        case BISnpDataL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__I;
          return true;
        
        case BISnpInvL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
          cbe.ownerL1 := msg_GetML1.src;
          cbe.cl := msg_GetM_Ack_ADL1.cl;
          cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__I;
          return true;
          endif;
          endif;
        
        case GetML1:
          msg := ReqL2(adr,MemRd_A_SnpInvL2,m,to_m_directoryL2LHS(directoryL2LHS));
          Send_req2(msg, m);
          cbe.proxy_msgL1 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetML1I__C__I_store;
          return true;
        
        case GetSL1:
          msg := ReqL2(adr,MemRd_A_SnpInvL2,m,to_m_directoryL2LHS(directoryL2LHS));
          Send_req2(msg, m);
          cbe.proxy_msgL1 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetSL1I__C__I_store;
          return true;
        
        case PutEL1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if !(cbe.ownerL1 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__I;
            return true;
          endif;
          if (cbe.ownerL1 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__I;
            return true;
          endif;
        
        case PutML1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if !(cbe.ownerL1 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__I;
            return true;
          endif;
          if (cbe.ownerL1 = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__I;
            return true;
          endif;
        
        case PutSL1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if !(VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__I;
            return true;
          endif;
          if (VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__I;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_I__C__M:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
          cbe.ownerL1 := msg_GetML1.src;
          cbe.cl := msg_GetM_Ack_ADL1.cl;
          cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := RwdL2(adr,MemWr_IL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_rwd(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_BIConflictAckL2I__C__M_BIConflictAck;
          return true;
          endif;
          endif;
        
        case BISnpDataL2:
          msg_GetSL1 := RequestL1(adr,GetSL1,m,m);
          msg_GetM_Ack_DL1 := RespL1(adr,GetM_Ack_DL1,m,msg_GetSL1.src,cbe.cl);
          cbe.ownerL1 := msg_GetSL1.src;
          cbe.cl := msg_GetM_Ack_DL1.cl;
          Set_perm(load, adr, m);
          msg_PutEL1 := AckL1(adr,PutEL1,m,m);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutEL1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutEL1.src);
          if (cbe.ownerL1 = msg_PutEL1.src) then
          cbe.proxy_msgL2 := inmsg;
          msg := RwdL2(adr,MemWr_SL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_rwd(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_BISnpDataL2I__C__M_BISnpData;
          return true;
          endif;
        
        case BISnpInvL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
          cbe.ownerL1 := msg_GetML1.src;
          cbe.cl := msg_GetM_Ack_ADL1.cl;
          cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := RwdL2(adr,MemWr_IL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_rwd(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_BISnpInvL2I__C__M_BISnpInv;
          return true;
          endif;
          endif;
        
        case GetML1:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1 := inmsg;
          msg := RespAckL1(adr,GetM_Ack_ADL1,m,cbe.proxy_msgL1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
          Send_resp(msg, m);
          cbe.ownerL1 := cbe.proxy_msgL1.src;
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_M__C__M;
          return true;
        
        case GetSL1:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1 := inmsg;
          msg := RespL1(adr,GetM_Ack_DL1,m,cbe.proxy_msgL1.src,cbe.cl);
          Send_resp(msg, m);
          cbe.ownerL1 := cbe.proxy_msgL1.src;
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_E__C__M;
          return true;
        
        case PutEL1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if !(cbe.ownerL1 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__M;
            return true;
          endif;
          if (cbe.ownerL1 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__M;
            return true;
          endif;
        
        case PutML1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if !(cbe.ownerL1 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__M;
            return true;
          endif;
          if (cbe.ownerL1 = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__M;
            return true;
          endif;
        
        case PutSL1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if (VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__M;
            return true;
          endif;
          if !(VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_I__C__S:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
          cbe.ownerL1 := msg_GetML1.src;
          cbe.cl := msg_GetM_Ack_ADL1.cl;
          cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__I;
          return true;
          endif;
          endif;
        
        case BISnpDataL2:
          msg_GetSL1 := RequestL1(adr,GetSL1,m,m);
          msg_GetM_Ack_DL1 := RespL1(adr,GetM_Ack_DL1,m,msg_GetSL1.src,cbe.cl);
          cbe.ownerL1 := msg_GetSL1.src;
          cbe.cl := msg_GetM_Ack_DL1.cl;
          Set_perm(load, adr, m);
          msg_PutEL1 := AckL1(adr,PutEL1,m,m);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutEL1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutEL1.src);
          if (cbe.ownerL1 = msg_PutEL1.src) then
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspSL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__S;
          return true;
          endif;
        
        case BISnpInvL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
          cbe.ownerL1 := msg_GetML1.src;
          cbe.cl := msg_GetM_Ack_ADL1.cl;
          cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__I;
          return true;
          endif;
          endif;
        
        case GetML1:
          msg := ReqL2(adr,MemInv_A_SnpInvL2,m,to_m_directoryL2LHS(directoryL2LHS));
          Send_req2(msg, m);
          cbe.proxy_msgL1 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetML1I__C__S_store;
          return true;
        
        case GetSL1:
          msg := ReqL2(adr,MemInv_A_SnpInvL2,m,to_m_directoryL2LHS(directoryL2LHS));
          Send_req2(msg, m);
          cbe.proxy_msgL1 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetSL1I__C__S_store;
          return true;
        
        case PutEL1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if !(cbe.ownerL1 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__S;
            return true;
          endif;
          if (cbe.ownerL1 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__S;
            return true;
          endif;
        
        case PutML1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if (cbe.ownerL1 = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__S;
            return true;
          endif;
          if !(cbe.ownerL1 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__S;
            return true;
          endif;
        
        case PutSL1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if !(VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__S;
            return true;
          endif;
          if (VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__S;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_M__C__M:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg := RequestL1(adr,Fwd_GetML1,msg_GetML1.src,cbe.ownerL1);
          Send_fwd(msg, m);
          cbe.ownerL1 := msg_GetML1.src;
          cbe.proxy_msgL2 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_BIConflictAckL2dM_x_pI_store__C__M;
          return true;
        
        case BISnpDataL2:
          msg_GetSL1 := RequestL1(adr,GetSL1,m,m);
          msg := RequestL1(adr,Fwd_GetSL1,msg_GetSL1.src,cbe.ownerL1);
          Send_fwd(msg, m);
          AddElement_cacheL1(cbe.cacheL1, msg_GetSL1.src);
          AddElement_cacheL1(cbe.cacheL1, cbe.ownerL1);
          cbe.proxy_msgL2 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_BISnpDataL2dM_GetS_x_pI_load__C__M;
          return true;
        
        case BISnpInvL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg := RequestL1(adr,Fwd_GetML1,msg_GetML1.src,cbe.ownerL1);
          Send_fwd(msg, m);
          cbe.ownerL1 := msg_GetML1.src;
          cbe.proxy_msgL2 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_BISnpInvL2dM_x_pI_store__C__M;
          return true;
        
        case GetML1:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1 := inmsg;
          msg := RequestL1(adr,Fwd_GetML1,cbe.proxy_msgL1.src,cbe.ownerL1);
          Send_fwd(msg, m);
          cbe.ownerL1 := cbe.proxy_msgL1.src;
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_M__C__M;
          return true;
        
        case GetSL1:
          Set_perm(load, adr, m);
          cbe.proxy_msgL1 := inmsg;
          msg := RequestL1(adr,Fwd_GetSL1,cbe.proxy_msgL1.src,cbe.ownerL1);
          Send_fwd(msg, m);
          AddElement_cacheL1(cbe.cacheL1, cbe.proxy_msgL1.src);
          AddElement_cacheL1(cbe.cacheL1, cbe.ownerL1);
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetSL1M_GetS__C__M;
          return true;
        
        case PutEL1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if (cbe.ownerL1 = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__M;
            return true;
          endif;
          if !(cbe.ownerL1 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_M__C__M;
            return true;
          endif;
        
        case PutML1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if (cbe.ownerL1 = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__M;
            return true;
          endif;
          if !(cbe.ownerL1 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_M__C__M;
            return true;
          endif;
        
        case PutSL1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if !(cbe.ownerL1 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_M__C__M;
            return true;
          endif;
          if (cbe.ownerL1 = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_S__C__E:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          if !(IsElement_cacheL1(cbe.cacheL1, msg_GetML1.src)) then
            msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            msg := AckL1(adr,InvL1,msg_GetML1.src,msg_GetML1.src);
            Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
            cbe.ownerL1 := msg_GetML1.src;
            ClearVector_cacheL1(cbe.cacheL1);
            cbe.cl := msg_GetM_Ack_ADL1.cl;
            cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
            if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.acksExpectedL1 := 0;
              cbe.acksReceivedL1 := 0;
              Set_perm(store, adr, m);
              msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
              msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
              RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
              if (cbe.ownerL1 = msg_PutML1.src) then
              cbe.cl := msg_PutML1.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
              Send_birsp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_I__C__I;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__E;
              return true;
            endif;
          endif;
          if (IsElement_cacheL1(cbe.cacheL1, msg_GetML1.src)) then
            RemoveElement_cacheL1(cbe.cacheL1, msg_GetML1.src);
            msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            msg := AckL1(adr,InvL1,msg_GetML1.src,msg_GetML1.src);
            Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
            cbe.ownerL1 := msg_GetML1.src;
            ClearVector_cacheL1(cbe.cacheL1);
            cbe.cl := msg_GetM_Ack_ADL1.cl;
            cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
            if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__E;
              return true;
            endif;
            if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.acksExpectedL1 := 0;
              cbe.acksReceivedL1 := 0;
              Set_perm(store, adr, m);
              msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
              msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
              RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
              if (cbe.ownerL1 = msg_PutML1.src) then
              cbe.cl := msg_PutML1.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
              Send_birsp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_I__C__I;
              return true;
              endif;
            endif;
          endif;
        
        case BISnpDataL2:
          msg_GetSL1 := RequestL1(adr,GetSL1,m,m);
          msg_GetS_AckL1 := RespL1(adr,GetS_AckL1,m,msg_GetSL1.src,cbe.cl);
          AddElement_cacheL1(cbe.cacheL1, msg_GetSL1.src);
          cbe.cl := msg_GetS_AckL1.cl;
          Set_perm(load, adr, m);
          msg_PutSL1 := RequestL1(adr,PutSL1,m,m);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutSL1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutSL1.src);
          if !(VectorCount_cacheL1(cbe.cacheL1) = 0) then
            cbe.proxy_msgL2 := inmsg;
            msg := BIRspL2(adr,BIRspSL2,m,cbe.proxy_msgL2.src);
            Send_birsp(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_S__C__S;
            return true;
          endif;
          if (VectorCount_cacheL1(cbe.cacheL1) = 0) then
            cbe.proxy_msgL2 := inmsg;
            msg := BIRspL2(adr,BIRspSL2,m,cbe.proxy_msgL2.src);
            Send_birsp(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__S;
            return true;
          endif;
        
        case BISnpInvL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          if !(IsElement_cacheL1(cbe.cacheL1, msg_GetML1.src)) then
            msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            msg := AckL1(adr,InvL1,msg_GetML1.src,msg_GetML1.src);
            Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
            cbe.ownerL1 := msg_GetML1.src;
            ClearVector_cacheL1(cbe.cacheL1);
            cbe.cl := msg_GetM_Ack_ADL1.cl;
            cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
            if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.acksExpectedL1 := 0;
              cbe.acksReceivedL1 := 0;
              Set_perm(store, adr, m);
              msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
              msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
              RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
              if (cbe.ownerL1 = msg_PutML1.src) then
              cbe.cl := msg_PutML1.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
              Send_birsp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_I__C__I;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__E;
              return true;
            endif;
          endif;
          if (IsElement_cacheL1(cbe.cacheL1, msg_GetML1.src)) then
            RemoveElement_cacheL1(cbe.cacheL1, msg_GetML1.src);
            msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            msg := AckL1(adr,InvL1,msg_GetML1.src,msg_GetML1.src);
            Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
            cbe.ownerL1 := msg_GetML1.src;
            ClearVector_cacheL1(cbe.cacheL1);
            cbe.cl := msg_GetM_Ack_ADL1.cl;
            cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
            if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.acksExpectedL1 := 0;
              cbe.acksReceivedL1 := 0;
              Set_perm(store, adr, m);
              msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
              msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
              RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
              if (cbe.ownerL1 = msg_PutML1.src) then
              cbe.cl := msg_PutML1.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
              Send_birsp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_I__C__I;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__E;
              return true;
            endif;
          endif;
        
        case GetML1:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1 := inmsg;
          if !(IsElement_cacheL1(cbe.cacheL1, cbe.proxy_msgL1.src)) then
            msg := RespAckL1(adr,GetM_Ack_ADL1,m,cbe.proxy_msgL1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            Send_resp(msg, m);
            msg := AckL1(adr,InvL1,cbe.proxy_msgL1.src,cbe.proxy_msgL1.src);
            Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
            cbe.ownerL1 := cbe.proxy_msgL1.src;
            ClearVector_cacheL1(cbe.cacheL1);
            undefine cbe.proxy_msgL1;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_M__C__M;
            return true;
          endif;
          if (IsElement_cacheL1(cbe.cacheL1, cbe.proxy_msgL1.src)) then
            RemoveElement_cacheL1(cbe.cacheL1, cbe.proxy_msgL1.src);
            msg := RespAckL1(adr,GetM_Ack_ADL1,m,cbe.proxy_msgL1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            Send_resp(msg, m);
            msg := AckL1(adr,InvL1,cbe.proxy_msgL1.src,cbe.proxy_msgL1.src);
            Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
            cbe.ownerL1 := cbe.proxy_msgL1.src;
            ClearVector_cacheL1(cbe.cacheL1);
            undefine cbe.proxy_msgL1;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_M__C__M;
            return true;
          endif;
        
        case GetSL1:
          Set_perm(load, adr, m);
          cbe.proxy_msgL1 := inmsg;
          msg := RespL1(adr,GetS_AckL1,m,cbe.proxy_msgL1.src,cbe.cl);
          Send_resp(msg, m);
          AddElement_cacheL1(cbe.cacheL1, cbe.proxy_msgL1.src);
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_S__C__E;
          return true;
        
        case PutEL1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if !(VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_S__C__E;
            return true;
          endif;
          if (VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__E;
            return true;
          endif;
        
        case PutML1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if (VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__E;
            return true;
          endif;
          if !(VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_S__C__E;
            return true;
          endif;
        
        case PutSL1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if !(VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_S__C__E;
            return true;
          endif;
          if (VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__E;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_S__C__M:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          if !(IsElement_cacheL1(cbe.cacheL1, msg_GetML1.src)) then
            msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            msg := AckL1(adr,InvL1,msg_GetML1.src,msg_GetML1.src);
            Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
            cbe.ownerL1 := msg_GetML1.src;
            ClearVector_cacheL1(cbe.cacheL1);
            cbe.cl := msg_GetM_Ack_ADL1.cl;
            cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
            if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__M;
              return true;
            endif;
            if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.acksExpectedL1 := 0;
              cbe.acksReceivedL1 := 0;
              Set_perm(store, adr, m);
              msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
              msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
              RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
              if (cbe.ownerL1 = msg_PutML1.src) then
              cbe.cl := msg_PutML1.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := RwdL2(adr,MemWr_IL2,m,cbe.proxy_msgL2.src,cbe.cl);
              Send_rwd(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_BIConflictAckL2I__C__M_BIConflictAck;
              return true;
              endif;
            endif;
          endif;
          if (IsElement_cacheL1(cbe.cacheL1, msg_GetML1.src)) then
            RemoveElement_cacheL1(cbe.cacheL1, msg_GetML1.src);
            msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            msg := AckL1(adr,InvL1,msg_GetML1.src,msg_GetML1.src);
            Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
            cbe.ownerL1 := msg_GetML1.src;
            ClearVector_cacheL1(cbe.cacheL1);
            cbe.cl := msg_GetM_Ack_ADL1.cl;
            cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
            if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.acksExpectedL1 := 0;
              cbe.acksReceivedL1 := 0;
              Set_perm(store, adr, m);
              msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
              msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
              RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
              if (cbe.ownerL1 = msg_PutML1.src) then
              cbe.cl := msg_PutML1.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := RwdL2(adr,MemWr_IL2,m,cbe.proxy_msgL2.src,cbe.cl);
              Send_rwd(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_BIConflictAckL2I__C__M_BIConflictAck;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__M;
              return true;
            endif;
          endif;
        
        case BISnpDataL2:
          msg_GetSL1 := RequestL1(adr,GetSL1,m,m);
          msg_GetS_AckL1 := RespL1(adr,GetS_AckL1,m,msg_GetSL1.src,cbe.cl);
          AddElement_cacheL1(cbe.cacheL1, msg_GetSL1.src);
          cbe.cl := msg_GetS_AckL1.cl;
          Set_perm(load, adr, m);
          msg_PutSL1 := RequestL1(adr,PutSL1,m,m);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutSL1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutSL1.src);
          if !(VectorCount_cacheL1(cbe.cacheL1) = 0) then
            cbe.proxy_msgL2 := inmsg;
            msg := RwdL2(adr,MemWr_SL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_rwd(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_BISnpDataL2S__C__M_BISnpData;
            return true;
          endif;
          if (VectorCount_cacheL1(cbe.cacheL1) = 0) then
            cbe.proxy_msgL2 := inmsg;
            msg := RwdL2(adr,MemWr_SL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_rwd(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_BISnpDataL2I__C__M_BISnpData;
            return true;
          endif;
        
        case BISnpInvL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          if !(IsElement_cacheL1(cbe.cacheL1, msg_GetML1.src)) then
            msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            msg := AckL1(adr,InvL1,msg_GetML1.src,msg_GetML1.src);
            Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
            cbe.ownerL1 := msg_GetML1.src;
            ClearVector_cacheL1(cbe.cacheL1);
            cbe.cl := msg_GetM_Ack_ADL1.cl;
            cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
            if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.acksExpectedL1 := 0;
              cbe.acksReceivedL1 := 0;
              Set_perm(store, adr, m);
              msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
              msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
              RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
              if (cbe.ownerL1 = msg_PutML1.src) then
              cbe.cl := msg_PutML1.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := RwdL2(adr,MemWr_IL2,m,cbe.proxy_msgL2.src,cbe.cl);
              Send_rwd(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_BISnpInvL2I__C__M_BISnpInv;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__M;
              return true;
            endif;
          endif;
          if (IsElement_cacheL1(cbe.cacheL1, msg_GetML1.src)) then
            RemoveElement_cacheL1(cbe.cacheL1, msg_GetML1.src);
            msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            msg := AckL1(adr,InvL1,msg_GetML1.src,msg_GetML1.src);
            Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
            cbe.ownerL1 := msg_GetML1.src;
            ClearVector_cacheL1(cbe.cacheL1);
            cbe.cl := msg_GetM_Ack_ADL1.cl;
            cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
            if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.acksExpectedL1 := 0;
              cbe.acksReceivedL1 := 0;
              Set_perm(store, adr, m);
              msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
              msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
              RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
              if (cbe.ownerL1 = msg_PutML1.src) then
              cbe.cl := msg_PutML1.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := RwdL2(adr,MemWr_IL2,m,cbe.proxy_msgL2.src,cbe.cl);
              Send_rwd(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_BISnpInvL2I__C__M_BISnpInv;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__M;
              return true;
            endif;
          endif;
        
        case GetML1:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1 := inmsg;
          if (IsElement_cacheL1(cbe.cacheL1, cbe.proxy_msgL1.src)) then
            RemoveElement_cacheL1(cbe.cacheL1, cbe.proxy_msgL1.src);
            msg := RespAckL1(adr,GetM_Ack_ADL1,m,cbe.proxy_msgL1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            Send_resp(msg, m);
            msg := AckL1(adr,InvL1,cbe.proxy_msgL1.src,cbe.proxy_msgL1.src);
            Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
            cbe.ownerL1 := cbe.proxy_msgL1.src;
            ClearVector_cacheL1(cbe.cacheL1);
            undefine cbe.proxy_msgL1;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_M__C__M;
            return true;
          endif;
          if !(IsElement_cacheL1(cbe.cacheL1, cbe.proxy_msgL1.src)) then
            msg := RespAckL1(adr,GetM_Ack_ADL1,m,cbe.proxy_msgL1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            Send_resp(msg, m);
            msg := AckL1(adr,InvL1,cbe.proxy_msgL1.src,cbe.proxy_msgL1.src);
            Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
            cbe.ownerL1 := cbe.proxy_msgL1.src;
            ClearVector_cacheL1(cbe.cacheL1);
            undefine cbe.proxy_msgL1;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_M__C__M;
            return true;
          endif;
        
        case GetSL1:
          Set_perm(load, adr, m);
          cbe.proxy_msgL1 := inmsg;
          msg := RespL1(adr,GetS_AckL1,m,cbe.proxy_msgL1.src,cbe.cl);
          Send_resp(msg, m);
          AddElement_cacheL1(cbe.cacheL1, cbe.proxy_msgL1.src);
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_S__C__M;
          return true;
        
        case PutEL1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if !(VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_S__C__M;
            return true;
          endif;
          if (VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__M;
            return true;
          endif;
        
        case PutML1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if (VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__M;
            return true;
          endif;
          if !(VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_S__C__M;
            return true;
          endif;
        
        case PutSL1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if !(VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_S__C__M;
            return true;
          endif;
          if (VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_S__C__S:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          if (IsElement_cacheL1(cbe.cacheL1, msg_GetML1.src)) then
            RemoveElement_cacheL1(cbe.cacheL1, msg_GetML1.src);
            msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            msg := AckL1(adr,InvL1,msg_GetML1.src,msg_GetML1.src);
            Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
            cbe.ownerL1 := msg_GetML1.src;
            ClearVector_cacheL1(cbe.cacheL1);
            cbe.cl := msg_GetM_Ack_ADL1.cl;
            cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
            if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.acksExpectedL1 := 0;
              cbe.acksReceivedL1 := 0;
              Set_perm(store, adr, m);
              msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
              msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
              RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
              if (cbe.ownerL1 = msg_PutML1.src) then
              cbe.cl := msg_PutML1.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
              Send_birsp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_I__C__I;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__S;
              return true;
            endif;
          endif;
          if !(IsElement_cacheL1(cbe.cacheL1, msg_GetML1.src)) then
            msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            msg := AckL1(adr,InvL1,msg_GetML1.src,msg_GetML1.src);
            Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
            cbe.ownerL1 := msg_GetML1.src;
            ClearVector_cacheL1(cbe.cacheL1);
            cbe.cl := msg_GetM_Ack_ADL1.cl;
            cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
            if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.acksExpectedL1 := 0;
              cbe.acksReceivedL1 := 0;
              Set_perm(store, adr, m);
              msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
              msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
              RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
              if (cbe.ownerL1 = msg_PutML1.src) then
              cbe.cl := msg_PutML1.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
              Send_birsp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_I__C__I;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__S;
              return true;
            endif;
          endif;
        
        case BISnpDataL2:
          msg_GetSL1 := RequestL1(adr,GetSL1,m,m);
          msg_GetS_AckL1 := RespL1(adr,GetS_AckL1,m,msg_GetSL1.src,cbe.cl);
          AddElement_cacheL1(cbe.cacheL1, msg_GetSL1.src);
          cbe.cl := msg_GetS_AckL1.cl;
          Set_perm(load, adr, m);
          msg_PutSL1 := RequestL1(adr,PutSL1,m,m);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutSL1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutSL1.src);
          if !(VectorCount_cacheL1(cbe.cacheL1) = 0) then
            cbe.proxy_msgL2 := inmsg;
            msg := BIRspL2(adr,BIRspSL2,m,cbe.proxy_msgL2.src);
            Send_birsp(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_S__C__S;
            return true;
          endif;
          if (VectorCount_cacheL1(cbe.cacheL1) = 0) then
            cbe.proxy_msgL2 := inmsg;
            msg := BIRspL2(adr,BIRspSL2,m,cbe.proxy_msgL2.src);
            Send_birsp(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__S;
            return true;
          endif;
        
        case BISnpInvL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          if (IsElement_cacheL1(cbe.cacheL1, msg_GetML1.src)) then
            RemoveElement_cacheL1(cbe.cacheL1, msg_GetML1.src);
            msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            msg := AckL1(adr,InvL1,msg_GetML1.src,msg_GetML1.src);
            Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
            cbe.ownerL1 := msg_GetML1.src;
            ClearVector_cacheL1(cbe.cacheL1);
            cbe.cl := msg_GetM_Ack_ADL1.cl;
            cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
            if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.acksExpectedL1 := 0;
              cbe.acksReceivedL1 := 0;
              Set_perm(store, adr, m);
              msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
              msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
              RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
              if (cbe.ownerL1 = msg_PutML1.src) then
              cbe.cl := msg_PutML1.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
              Send_birsp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_I__C__I;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__S;
              return true;
            endif;
          endif;
          if !(IsElement_cacheL1(cbe.cacheL1, msg_GetML1.src)) then
            msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            msg := AckL1(adr,InvL1,msg_GetML1.src,msg_GetML1.src);
            Multicast_fwd_v_cacheL1(msg, cbe.cacheL1, m);
            cbe.ownerL1 := msg_GetML1.src;
            ClearVector_cacheL1(cbe.cacheL1);
            cbe.cl := msg_GetM_Ack_ADL1.cl;
            cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
            if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__S;
              return true;
            endif;
            if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.acksExpectedL1 := 0;
              cbe.acksReceivedL1 := 0;
              Set_perm(store, adr, m);
              msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
              msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
              RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
              if (cbe.ownerL1 = msg_PutML1.src) then
              cbe.cl := msg_PutML1.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
              Send_birsp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_I__C__I;
              return true;
              endif;
            endif;
          endif;
        
        case GetML1:
          msg := ReqL2(adr,MemInv_A_SnpInvL2,m,to_m_directoryL2LHS(directoryL2LHS));
          Send_req2(msg, m);
          cbe.proxy_msgL1 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetML1S__C__S_store;
          return true;
        
        case GetSL1:
          Set_perm(load, adr, m);
          cbe.proxy_msgL1 := inmsg;
          msg := RespL1(adr,GetS_AckL1,m,cbe.proxy_msgL1.src,cbe.cl);
          Send_resp(msg, m);
          AddElement_cacheL1(cbe.cacheL1, cbe.proxy_msgL1.src);
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_S__C__S;
          return true;
        
        case PutEL1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if !(VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_S__C__S;
            return true;
          endif;
          if (VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__S;
            return true;
          endif;
        
        case PutML1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if !(VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_S__C__S;
            return true;
          endif;
          if (VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__S;
            return true;
          endif;
        
        case PutSL1:
          msg := AckL1(adr,Put_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1(cbe.cacheL1, inmsg.src);
          if (VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__S;
            return true;
          endif;
          if !(VectorCount_cacheL1(cbe.cacheL1) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_S__C__S;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_evictI__C__E_evict:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictI__C__E_evict_x_I;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictI__C__E_evict;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictI__C__E_evict;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_evictI__C__E_evict_x_I:
      switch inmsg.mtype
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictI__C__E_evict_x_I;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictI__C__E_evict_x_I;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_evictI__C__M_evict:
      switch inmsg.mtype
        case BIConflictAckL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictI__C__M_evict_BIConflictAck;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictI__C__M_evict;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictI__C__M_evict;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_evictI__C__M_evict_BIConflictAck:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_evictI__C__S_evict:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictI__C__S_evict_x_I;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictI__C__S_evict;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictI__C__S_evict;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_evictI__C__S_evict_x_I:
      switch inmsg.mtype
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictI__C__S_evict_x_I;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictI__C__S_evict_x_I;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_evictdM_x_pI_store_GetM_Ack_AD__C__E:
      switch inmsg.mtype
        case Inv_AckL1:
          cbe.acksReceivedL1 := cbe.acksReceivedL1+1;
          if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_evictdM_x_pI_store_GetM_Ack_AD__C__E;
            return true;
          endif;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            cbe.acksExpectedL1 := 0;
            cbe.acksReceivedL1 := 0;
            Set_perm(store, adr, m);
            msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
            msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
            RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
            if (cbe.ownerL1 = msg_PutML1.src) then
            cbe.cl := msg_PutML1.cl;
            msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2LHS(directoryL2LHS));
            Send_req2(msg, m);
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_evictI__C__E_evict;
            return true;
            endif;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_evictdM_x_pI_store_GetM_Ack_AD__C__M:
      switch inmsg.mtype
        case Inv_AckL1:
          cbe.acksReceivedL1 := cbe.acksReceivedL1+1;
          if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_evictdM_x_pI_store_GetM_Ack_AD__C__M;
            return true;
          endif;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            cbe.acksExpectedL1 := 0;
            cbe.acksReceivedL1 := 0;
            Set_perm(store, adr, m);
            msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
            msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
            RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
            if (cbe.ownerL1 = msg_PutML1.src) then
            cbe.cl := msg_PutML1.cl;
            msg := RwdL2(adr,MemWr_IL2,m,to_m_directoryL2LHS(directoryL2LHS),cbe.cl);
            Send_rwd(msg, m);
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_evictI__C__M_evict;
            return true;
            endif;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_evictdM_x_pI_store_GetM_Ack_AD__C__S:
      switch inmsg.mtype
        case Inv_AckL1:
          cbe.acksReceivedL1 := cbe.acksReceivedL1+1;
          if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_evictdM_x_pI_store_GetM_Ack_AD__C__S;
            return true;
          endif;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            cbe.acksExpectedL1 := 0;
            cbe.acksReceivedL1 := 0;
            Set_perm(store, adr, m);
            msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
            msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
            RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
            if (cbe.ownerL1 = msg_PutML1.src) then
            cbe.cl := msg_PutML1.cl;
            msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2LHS(directoryL2LHS));
            Send_req2(msg, m);
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_evictI__C__S_evict;
            return true;
            endif;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_evictdM_x_pI_store__C__M:
      switch inmsg.mtype
        case GetM_Ack_DL1:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          msg := RwdL2(adr,MemWr_IL2,m,to_m_directoryL2LHS(directoryL2LHS),cbe.cl);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictI__C__M_evict;
          return true;
          endif;
        
        case Inv_AckL1:
          cbe.acksReceivedL1 := cbe.acksReceivedL1+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictdM_x_pI_store__C__M;
          return true;
        
        else return false;
      endswitch;
      
    endswitch;
    endalias;
    endalias;
    endalias;
    return false;
    end;
    
    function FSM_MSG_directoryL2LHS(inmsg:Message; mTyped:OBJSET_directoryL2LHS) : boolean;
    var msg: Message;
    begin
      alias adr: inmsg.adr do
      alias cbe: i_directoryL2LHS[mTyped].cb[adr] do
    alias m : to_m_directoryL2LHS(mTyped) do
    switch cbe.State
      case directoryL2LHS_E:
      switch inmsg.mtype
        case MemClnEvct_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_E;
            return true;
          endif;
          if (cbe.ownerL2 = inmsg.src) then
            undefine cbe.ownerL2;
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_I;
            return true;
          endif;
        
        case MemInv_A_SnpInvL2:
          msg := BISnpL2(adr,BISnpInvL2,m,cbe.ownerL2);
          Send_bisnp(msg, m);
          cbe.requestorL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_E_MemInv_A_SnpInv;
          return true;
        
        case MemRd_A_SnpInvL2:
          msg := BISnpL2(adr,BISnpInvL2,m,cbe.ownerL2);
          Send_bisnp(msg, m);
          cbe.requestorL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_E_MemRd_A_SnpInv;
          return true;
        
        case MemRd_S_SnpDataL2:
          msg := BISnpL2(adr,BISnpDataL2,m,cbe.ownerL2);
          Send_bisnp(msg, m);
          cbe.requestorL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_E_MemRd_S_SnpData;
          return true;
        
        case MemWr_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if (cbe.ownerL2 = inmsg.src) then
            cbe.cl := inmsg.cl;
            undefine cbe.ownerL2;
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_I;
            return true;
          endif;
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_E;
            return true;
          endif;
        
        case MemWr_SL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_E;
            return true;
          endif;
          if (cbe.ownerL2 = inmsg.src) then
            cbe.cl := inmsg.cl;
            undefine cbe.ownerL2;
            AddElement_cacheL2(cbe.cacheL2, inmsg.src);
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_S;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2LHS_E_MemInv_A_SnpInv:
      switch inmsg.mtype
        case BIConflictL2:
          msg := NdrL2(adr,BIConflictAckL2,m,inmsg.src);
          Send_ndr(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_E_MemInv_A_SnpInv;
          return true;
        
        case BIRspIL2:
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          undefine cbe.ownerL2;
          msg := NdrL2(adr,Cmp_EL2,m,cbe.requestorL2);
          Send_ndr(msg, m);
          msg := DrsL2(adr,MemDataL2,m,cbe.requestorL2,cbe.cl);
          Send_drs(msg, m);
          cbe.ownerL2 := cbe.requestorL2;
          undefine cbe.requestorL2;
          ClearVector_cacheL2(cbe.cacheL2);
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_M;
          return true;
        
        case MemWr_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          if !(inmsg.src = cbe.ownerL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_E_MemInv_A_SnpInv;
            return true;
          endif;
          if (inmsg.src = cbe.ownerL2) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_E_MemInv_A_SnpInv;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2LHS_E_MemRd_A_SnpInv:
      switch inmsg.mtype
        case BIConflictL2:
          msg := NdrL2(adr,BIConflictAckL2,m,inmsg.src);
          Send_ndr(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_E_MemRd_A_SnpInv;
          return true;
        
        case BIRspIL2:
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          undefine cbe.ownerL2;
          msg := NdrL2(adr,Cmp_EL2,m,cbe.requestorL2);
          Send_ndr(msg, m);
          msg := DrsL2(adr,MemDataL2,m,cbe.requestorL2,cbe.cl);
          Send_drs(msg, m);
          cbe.ownerL2 := cbe.requestorL2;
          undefine cbe.requestorL2;
          ClearVector_cacheL2(cbe.cacheL2);
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_M;
          return true;
        
        case MemWr_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          if (inmsg.src = cbe.ownerL2) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_E_MemRd_A_SnpInv;
            return true;
          endif;
          if !(inmsg.src = cbe.ownerL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_E_MemRd_A_SnpInv;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2LHS_E_MemRd_S_SnpData:
      switch inmsg.mtype
        case BIConflictL2:
          msg := NdrL2(adr,BIConflictAckL2,m,inmsg.src);
          Send_ndr(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_E_MemRd_S_SnpData;
          return true;
        
        case BIRspIL2:
          undefine cbe.ownerL2;
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          AddElement_cacheL2(cbe.cacheL2, cbe.requestorL2);
          msg := NdrL2(adr,Cmp_SL2,m,cbe.requestorL2);
          Send_ndr(msg, m);
          msg := DrsL2(adr,MemDataL2,m,cbe.requestorL2,cbe.cl);
          Send_drs(msg, m);
          undefine cbe.requestorL2;
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_S;
          return true;
        
        case BIRspSL2:
          undefine cbe.ownerL2;
          AddElement_cacheL2(cbe.cacheL2, inmsg.src);
          AddElement_cacheL2(cbe.cacheL2, cbe.requestorL2);
          msg := NdrL2(adr,Cmp_SL2,m,cbe.requestorL2);
          Send_ndr(msg, m);
          msg := DrsL2(adr,MemDataL2,m,cbe.requestorL2,cbe.cl);
          Send_drs(msg, m);
          undefine cbe.requestorL2;
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_S;
          return true;
        
        case MemWr_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          if !(inmsg.src = cbe.ownerL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_E_MemRd_S_SnpData;
            return true;
          endif;
          if (inmsg.src = cbe.ownerL2) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_E_MemRd_S_SnpData;
            return true;
          endif;
        
        case MemWr_SL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          if (inmsg.src = cbe.ownerL2) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_E_MemRd_S_SnpData;
            return true;
          endif;
          if !(inmsg.src = cbe.ownerL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_E_MemRd_S_SnpData;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2LHS_I:
      switch inmsg.mtype
        case MemClnEvct_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if (cbe.ownerL2 = inmsg.src) then
            undefine cbe.ownerL2;
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_I;
            return true;
          endif;
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_I;
            return true;
          endif;
        
        case MemInv_A_SnpInvL2:
          msg := NdrL2(adr,Cmp_EL2,m,inmsg.src);
          Send_ndr(msg, m);
          msg := DrsL2(adr,MemDataL2,m,inmsg.src,cbe.cl);
          Send_drs(msg, m);
          cbe.ownerL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_M;
          return true;
        
        case MemRd_A_SnpInvL2:
          msg := NdrL2(adr,Cmp_EL2,m,inmsg.src);
          Send_ndr(msg, m);
          msg := DrsL2(adr,MemDataL2,m,inmsg.src,cbe.cl);
          Send_drs(msg, m);
          cbe.ownerL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_M;
          return true;
        
        case MemRd_S_SnpDataL2:
          msg := NdrL2(adr,Cmp_EL2,m,inmsg.src);
          Send_ndr(msg, m);
          msg := DrsL2(adr,MemDataL2,m,inmsg.src,cbe.cl);
          Send_drs(msg, m);
          cbe.ownerL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_E;
          return true;
        
        case MemWr_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_I;
            return true;
          endif;
          if (cbe.ownerL2 = inmsg.src) then
            cbe.cl := inmsg.cl;
            undefine cbe.ownerL2;
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_I;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2LHS_M:
      switch inmsg.mtype
        case MemClnEvct_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if (cbe.ownerL2 = inmsg.src) then
            undefine cbe.ownerL2;
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_I;
            return true;
          endif;
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_M;
            return true;
          endif;
        
        case MemInv_A_SnpInvL2:
          msg := BISnpL2(adr,BISnpInvL2,m,cbe.ownerL2);
          Send_bisnp(msg, m);
          cbe.requestorL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_M_MemInv_A_SnpInv;
          return true;
        
        case MemRd_A_SnpInvL2:
          msg := BISnpL2(adr,BISnpInvL2,m,cbe.ownerL2);
          Send_bisnp(msg, m);
          cbe.requestorL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_M_MemRd_A_SnpInv;
          return true;
        
        case MemRd_S_SnpDataL2:
          msg := BISnpL2(adr,BISnpDataL2,m,cbe.ownerL2);
          Send_bisnp(msg, m);
          cbe.requestorL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_M_MemRd_S_SnpData;
          return true;
        
        case MemWr_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if (cbe.ownerL2 = inmsg.src) then
            cbe.cl := inmsg.cl;
            undefine cbe.ownerL2;
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_I;
            return true;
          endif;
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_M;
            return true;
          endif;
        
        case MemWr_SL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          if (cbe.ownerL2 = inmsg.src) then
            cbe.cl := inmsg.cl;
            undefine cbe.ownerL2;
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_S;
            return true;
          endif;
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2LHS_M_MemInv_A_SnpInv:
      switch inmsg.mtype
        case BIConflictL2:
          msg := NdrL2(adr,BIConflictAckL2,m,inmsg.src);
          Send_ndr(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_M_MemInv_A_SnpInv;
          return true;
        
        case BIRspIL2:
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          undefine cbe.ownerL2;
          msg := NdrL2(adr,Cmp_EL2,m,cbe.requestorL2);
          Send_ndr(msg, m);
          msg := DrsL2(adr,MemDataL2,m,cbe.requestorL2,cbe.cl);
          Send_drs(msg, m);
          cbe.ownerL2 := cbe.requestorL2;
          undefine cbe.requestorL2;
          ClearVector_cacheL2(cbe.cacheL2);
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_M;
          return true;
        
        case MemWr_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          if (inmsg.src = cbe.ownerL2) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_M_MemInv_A_SnpInv;
            return true;
          endif;
          if !(inmsg.src = cbe.ownerL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_M_MemInv_A_SnpInv;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2LHS_M_MemRd_A_SnpInv:
      switch inmsg.mtype
        case BIConflictL2:
          msg := NdrL2(adr,BIConflictAckL2,m,inmsg.src);
          Send_ndr(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_M_MemRd_A_SnpInv;
          return true;
        
        case BIRspIL2:
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          undefine cbe.ownerL2;
          msg := NdrL2(adr,Cmp_EL2,m,cbe.requestorL2);
          Send_ndr(msg, m);
          msg := DrsL2(adr,MemDataL2,m,cbe.requestorL2,cbe.cl);
          Send_drs(msg, m);
          cbe.ownerL2 := cbe.requestorL2;
          undefine cbe.requestorL2;
          ClearVector_cacheL2(cbe.cacheL2);
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_M;
          return true;
        
        case MemWr_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          if (inmsg.src = cbe.ownerL2) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_M_MemRd_A_SnpInv;
            return true;
          endif;
          if !(inmsg.src = cbe.ownerL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_M_MemRd_A_SnpInv;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2LHS_M_MemRd_S_SnpData:
      switch inmsg.mtype
        case BIConflictL2:
          msg := NdrL2(adr,BIConflictAckL2,m,inmsg.src);
          Send_ndr(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_M_MemRd_S_SnpData;
          return true;
        
        case BIRspIL2:
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          undefine cbe.ownerL2;
          msg := NdrL2(adr,Cmp_SL2,m,cbe.requestorL2);
          Send_ndr(msg, m);
          msg := DrsL2(adr,MemDataL2,m,cbe.requestorL2,cbe.cl);
          Send_drs(msg, m);
          AddElement_cacheL2(cbe.cacheL2, cbe.requestorL2);
          undefine cbe.requestorL2;
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_S;
          return true;
        
        case BIRspSL2:
          undefine cbe.ownerL2;
          AddElement_cacheL2(cbe.cacheL2, inmsg.src);
          AddElement_cacheL2(cbe.cacheL2, cbe.requestorL2);
          msg := NdrL2(adr,Cmp_SL2,m,cbe.requestorL2);
          Send_ndr(msg, m);
          msg := DrsL2(adr,MemDataL2,m,cbe.requestorL2,cbe.cl);
          Send_drs(msg, m);
          undefine cbe.requestorL2;
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_S;
          return true;
        
        case MemWr_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          if (inmsg.src = cbe.ownerL2) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_M_MemRd_S_SnpData;
            return true;
          endif;
          if !(inmsg.src = cbe.ownerL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_M_MemRd_S_SnpData;
            return true;
          endif;
        
        case MemWr_SL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          if (inmsg.src = cbe.ownerL2) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_M_MemRd_S_SnpData;
            return true;
          endif;
          if !(inmsg.src = cbe.ownerL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_M_MemRd_S_SnpData;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2LHS_S:
      switch inmsg.mtype
        case MemClnEvct_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if (VectorCount_cacheL2(cbe.cacheL2) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_I;
            return true;
          endif;
          if !(VectorCount_cacheL2(cbe.cacheL2) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_S;
            return true;
          endif;
        
        case MemInv_A_SnpInvL2:
          cbe.requestorL2 := inmsg.src;
          if (IsElement_cacheL2(cbe.cacheL2, cbe.requestorL2)) then
            RemoveElement_cacheL2(cbe.cacheL2, cbe.requestorL2);
            if (VectorCount_cacheL2(cbe.cacheL2) = 0) then
              msg := NdrL2(adr,Cmp_EL2,m,cbe.requestorL2);
              Send_ndr(msg, m);
              cbe.ownerL2 := cbe.requestorL2;
              ClearVector_cacheL2(cbe.cacheL2);
              undefine cbe.requestorL2;
              Clear_perm(adr, m);
              cbe.State := directoryL2LHS_M;
              return true;
            endif;
            if !(VectorCount_cacheL2(cbe.cacheL2) = 0) then
              msg := BISnpL2(adr,BISnpInvL2,m,m);
              Multicast_bisnp_v_cacheL2(msg, cbe.cacheL2, m);
              AddElement_cacheL2(cbe.cacheL2, cbe.requestorL2);
              Clear_perm(adr, m);
              cbe.State := directoryL2LHS_S_MemInv_A_SnpInv;
              return true;
            endif;
          endif;
          if !(IsElement_cacheL2(cbe.cacheL2, cbe.requestorL2)) then
            msg := BISnpL2(adr,BISnpInvL2,m,m);
            Multicast_bisnp_v_cacheL2(msg, cbe.cacheL2, m);
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_S_MemInv_A_SnpInv;
            return true;
          endif;
        
        case MemRd_A_SnpInvL2:
          cbe.requestorL2 := inmsg.src;
          if (IsElement_cacheL2(cbe.cacheL2, inmsg.src)) then
            RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
            if !(VectorCount_cacheL2(cbe.cacheL2) = 0) then
              msg := BISnpL2(adr,BISnpInvL2,m,m);
              Multicast_bisnp_v_cacheL2(msg, cbe.cacheL2, m);
              Clear_perm(adr, m);
              cbe.State := directoryL2LHS_S_MemRd_A_SnpInv;
              return true;
            endif;
            if (VectorCount_cacheL2(cbe.cacheL2) = 0) then
              msg := NdrL2(adr,Cmp_EL2,m,cbe.requestorL2);
              Send_ndr(msg, m);
              msg := DrsL2(adr,MemDataL2,m,cbe.requestorL2,cbe.cl);
              Send_drs(msg, m);
              cbe.ownerL2 := cbe.requestorL2;
              ClearVector_cacheL2(cbe.cacheL2);
              undefine cbe.requestorL2;
              Clear_perm(adr, m);
              cbe.State := directoryL2LHS_M;
              return true;
            endif;
          endif;
          if !(IsElement_cacheL2(cbe.cacheL2, inmsg.src)) then
            msg := BISnpL2(adr,BISnpInvL2,m,m);
            Multicast_bisnp_v_cacheL2(msg, cbe.cacheL2, m);
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_S_MemRd_A_SnpInv;
            return true;
          endif;
        
        case MemRd_S_SnpDataL2:
          msg := NdrL2(adr,Cmp_SL2,m,inmsg.src);
          Send_ndr(msg, m);
          msg := DrsL2(adr,MemDataL2,m,inmsg.src,cbe.cl);
          Send_drs(msg, m);
          AddElement_cacheL2(cbe.cacheL2, inmsg.src);
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_S;
          return true;
        
        case MemWr_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if !(VectorCount_cacheL2(cbe.cacheL2) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_S;
            return true;
          endif;
          if (VectorCount_cacheL2(cbe.cacheL2) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_I;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2LHS_S_MemInv_A_SnpInv:
      switch inmsg.mtype
        case BIConflictL2:
          msg := NdrL2(adr,BIConflictAckL2,m,inmsg.src);
          Send_ndr(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_S_MemInv_A_SnpInv;
          return true;
        
        case BIRspIL2:
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if !(VectorCount_cacheL2(cbe.cacheL2) = 0) then
            if (VectorCount_cacheL2(cbe.cacheL2) = 1) then
              if (IsElement_cacheL2(cbe.cacheL2, cbe.requestorL2)) then
                msg := NdrL2(adr,Cmp_EL2,m,cbe.requestorL2);
                Send_ndr(msg, m);
                cbe.ownerL2 := cbe.requestorL2;
                ClearVector_cacheL2(cbe.cacheL2);
                undefine cbe.requestorL2;
                Clear_perm(adr, m);
                cbe.State := directoryL2LHS_M;
                return true;
              endif;
              if !(IsElement_cacheL2(cbe.cacheL2, cbe.requestorL2)) then
                Clear_perm(adr, m);
                cbe.State := directoryL2LHS_S_MemInv_A_SnpInv;
                return true;
              endif;
            endif;
            if !(VectorCount_cacheL2(cbe.cacheL2) = 1) then
              Clear_perm(adr, m);
              cbe.State := directoryL2LHS_S_MemInv_A_SnpInv;
              return true;
            endif;
          endif;
          if (VectorCount_cacheL2(cbe.cacheL2) = 0) then
            msg := NdrL2(adr,Cmp_EL2,m,cbe.requestorL2);
            Send_ndr(msg, m);
            msg := DrsL2(adr,MemDataL2,m,cbe.requestorL2,cbe.cl);
            Send_drs(msg, m);
            cbe.ownerL2 := cbe.requestorL2;
            ClearVector_cacheL2(cbe.cacheL2);
            undefine cbe.requestorL2;
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2LHS_S_MemRd_A_SnpInv:
      switch inmsg.mtype
        case BIConflictL2:
          msg := NdrL2(adr,BIConflictAckL2,m,inmsg.src);
          Send_ndr(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_S_MemRd_A_SnpInv;
          return true;
        
        case BIRspIL2:
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if !(VectorCount_cacheL2(cbe.cacheL2) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_S_MemRd_A_SnpInv;
            return true;
          endif;
          if (VectorCount_cacheL2(cbe.cacheL2) = 0) then
            msg := NdrL2(adr,Cmp_EL2,m,cbe.requestorL2);
            Send_ndr(msg, m);
            msg := DrsL2(adr,MemDataL2,m,cbe.requestorL2,cbe.cl);
            Send_drs(msg, m);
            cbe.ownerL2 := cbe.requestorL2;
            ClearVector_cacheL2(cbe.cacheL2);
            undefine cbe.requestorL2;
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
    endswitch;
    endalias;
    endalias;
    endalias;
    return false;
    end;
    
    function FSM_MSG_cacheL2LHS(inmsg:Message; mTyped:OBJSET_cacheL2LHS) : boolean;
    var msg: Message;
    begin
      alias adr: inmsg.adr do
      alias cbe: i_cacheL2LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL2LHS(mTyped) do
    switch cbe.State
      case cacheL2LHS_E:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I;
          return true;
        
        case BISnpDataL2:
          msg := BIRspL2(adr,BIRspSL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := cacheL2LHS_S;
          return true;
        
        case BISnpInvL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_E_evict:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_E_evict_x_I;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_E_evict;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_E_evict;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_E_evict_x_I:
      switch inmsg.mtype
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_E_evict_x_I;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_E_evict_x_I;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_I:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I;
          return true;
        
        case BISnpDataL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I;
          return true;
        
        case BISnpInvL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_I_load:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I_load;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I_load;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I_load;
          return true;
        
        case Cmp_EL2:
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I_load_Cmp_E;
          return true;
        
        case Cmp_SL2:
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I_load_Cmp_S;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_I_load_Cmp_E:
      switch inmsg.mtype
        case MemDataL2:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL2LHS_E;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_I_load_Cmp_S:
      switch inmsg.mtype
        case MemDataL2:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := cacheL2LHS_S;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_I_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I_store;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I_store;
          return true;
        
        case Cmp_EL2:
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I_store_Cmp_E;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_I_store_Cmp_E:
      switch inmsg.mtype
        case MemDataL2:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL2LHS_M;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_M:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := RwdL2(adr,MemWr_IL2,m,inmsg.src,cbe.cl);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_M_BIConflictAck;
          return true;
        
        case BISnpDataL2:
          msg := RwdL2(adr,MemWr_SL2,m,inmsg.src,cbe.cl);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_M_BISnpData;
          return true;
        
        case BISnpInvL2:
          msg := RwdL2(adr,MemWr_IL2,m,inmsg.src,cbe.cl);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_M_BISnpInv;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_M_BIConflictAck:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_M_BISnpData:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspSL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := cacheL2LHS_S;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_M_BISnpInv:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_M_evict:
      switch inmsg.mtype
        case BIConflictAckL2:
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_M_evict_BIConflictAck;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_M_evict;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_M_evict;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_M_evict_BIConflictAck:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_S:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I;
          return true;
        
        case BISnpDataL2:
          msg := BIRspL2(adr,BIRspSL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := cacheL2LHS_S;
          return true;
        
        case BISnpInvL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_S_evict:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_S_evict_x_I;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_S_evict;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_S_evict;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_S_evict_x_I:
      switch inmsg.mtype
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_S_evict_x_I;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_S_evict_x_I;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_S_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I_store;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_S_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_S_store;
          return true;
        
        case Cmp_EL2:
          Set_perm(store, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL2LHS_M;
          return true;
        
        else return false;
      endswitch;
      
    endswitch;
    endalias;
    endalias;
    endalias;
    return false;
    end;
    
    function FSM_MSG_abstractionRHS(inmsg:Message; mTyped:OBJSET_abstractionRHS) : boolean;
    var msg: Message;
    begin
      alias adr: inmsg.adr do
      alias cbe: i_abstractionRHS[mTyped].cb[adr] do
    alias m : to_m_abstractionRHS(mTyped) do
    switch cbe.State
      case abstractionRHS_E:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I;
          return true;
        
        case BISnpDataL2:
          msg := BIRspL2(adr,BIRspSL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := abstractionRHS_S;
          return true;
        
        case BISnpInvL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_E_evict:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_E_evict_x_I;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_E_evict;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_E_evict;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_E_evict_x_I:
      switch inmsg.mtype
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_E_evict_x_I;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_E_evict_x_I;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_I:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I;
          return true;
        
        case BISnpDataL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I;
          return true;
        
        case BISnpInvL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_I_load:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I_load;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I_load;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I_load;
          return true;
        
        case Cmp_EL2:
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I_load_Cmp_E;
          return true;
        
        case Cmp_SL2:
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I_load_Cmp_S;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_I_load_Cmp_E:
      switch inmsg.mtype
        case MemDataL2:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := abstractionRHS_E;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_I_load_Cmp_S:
      switch inmsg.mtype
        case MemDataL2:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := abstractionRHS_S;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_I_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I_store;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I_store;
          return true;
        
        case Cmp_EL2:
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I_store_Cmp_E;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_I_store_Cmp_E:
      switch inmsg.mtype
        case MemDataL2:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := abstractionRHS_M;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_M:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := RwdL2(adr,MemWr_IL2,m,inmsg.src,cbe.cl);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_M_BIConflictAck;
          return true;
        
        case BISnpDataL2:
          msg := RwdL2(adr,MemWr_SL2,m,inmsg.src,cbe.cl);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_M_BISnpData;
          return true;
        
        case BISnpInvL2:
          msg := RwdL2(adr,MemWr_IL2,m,inmsg.src,cbe.cl);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_M_BISnpInv;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_M_BIConflictAck:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_M_BISnpData:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspSL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := abstractionRHS_S;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_M_BISnpInv:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_M_evict:
      switch inmsg.mtype
        case BIConflictAckL2:
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_M_evict_BIConflictAck;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_M_evict;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_M_evict;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_M_evict_BIConflictAck:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_S:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I;
          return true;
        
        case BISnpDataL2:
          msg := BIRspL2(adr,BIRspSL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := abstractionRHS_S;
          return true;
        
        case BISnpInvL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_S_evict:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_S_evict_x_I;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_S_evict;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_S_evict;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_S_evict_x_I:
      switch inmsg.mtype
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_S_evict_x_I;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_S_evict_x_I;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_S_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I_store;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_S_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_S_store;
          return true;
        
        case Cmp_EL2:
          Set_perm(store, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := abstractionRHS_M;
          return true;
        
        else return false;
      endswitch;
      
    endswitch;
    endalias;
    endalias;
    endalias;
    return false;
    end;
    
    function FSM_MSG_cacheL1LHS(inmsg:Message; mTyped:OBJSET_cacheL1LHS) : boolean;
    var msg: Message;
    begin
      alias adr: inmsg.adr do
      alias cbe: i_cacheL1LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL1LHS(mTyped) do
    switch cbe.State
      case cacheL1LHS_E:
      switch inmsg.mtype
        case Fwd_GetML1:
          msg := RespL1(adr,GetM_Ack_DL1,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1LHS_I;
          return true;
        
        case Fwd_GetSL1:
          msg := RespL1(adr,GetS_AckL1,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL1(adr,WBL1,m,to_m_directoryL1LHS(directoryL1LHS),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := cacheL1LHS_S;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1LHS_E_evict:
      switch inmsg.mtype
        case Fwd_GetML1:
          msg := RespL1(adr,GetM_Ack_DL1,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1LHS_E_evict_x_I;
          return true;
        
        case Fwd_GetSL1:
          msg := RespL1(adr,GetS_AckL1,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL1(adr,WBL1,m,to_m_directoryL1LHS(directoryL1LHS),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1LHS_S_evict;
          return true;
        
        case Put_AckL1:
          Clear_perm(adr, m);
          cbe.State := cacheL1LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1LHS_E_evict_x_I:
      switch inmsg.mtype
        case Put_AckL1:
          Clear_perm(adr, m);
          cbe.State := cacheL1LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1LHS_I:
      switch inmsg.mtype
        else return false;
      endswitch;
      
      case cacheL1LHS_I_load:
      switch inmsg.mtype
        case GetM_Ack_DL1:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL1LHS_E;
          return true;
        
        case GetS_AckL1:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := cacheL1LHS_S;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1LHS_I_store:
      switch inmsg.mtype
        case GetM_Ack_ADL1:
          cbe.cl := inmsg.cl;
          cbe.acksExpectedL1 := inmsg.acksExpectedL1;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            cbe.acksExpectedL1 := 0;
            cbe.acksReceivedL1 := 0;
            Set_perm(store, adr, m);
            Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
            cbe.State := cacheL1LHS_M;
            return true;
          endif;
          if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            Clear_perm(adr, m);
            cbe.State := cacheL1LHS_I_store_GetM_Ack_AD;
            return true;
          endif;
        
        case GetM_Ack_DL1:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL1LHS_M;
          return true;
        
        case Inv_AckL1:
          cbe.acksReceivedL1 := cbe.acksReceivedL1+1;
          Clear_perm(adr, m);
          cbe.State := cacheL1LHS_I_store;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1LHS_I_store_GetM_Ack_AD:
      switch inmsg.mtype
        case Inv_AckL1:
          cbe.acksReceivedL1 := cbe.acksReceivedL1+1;
          if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            Clear_perm(adr, m);
            cbe.State := cacheL1LHS_I_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            cbe.acksExpectedL1 := 0;
            cbe.acksReceivedL1 := 0;
            Set_perm(store, adr, m);
            Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
            cbe.State := cacheL1LHS_M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case cacheL1LHS_M:
      switch inmsg.mtype
        case Fwd_GetML1:
          msg := RespL1(adr,GetM_Ack_DL1,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1LHS_I;
          return true;
        
        case Fwd_GetSL1:
          msg := RespL1(adr,GetS_AckL1,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL1(adr,WBL1,m,to_m_directoryL1LHS(directoryL1LHS),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := cacheL1LHS_S;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1LHS_M_evict:
      switch inmsg.mtype
        case Fwd_GetML1:
          msg := RespL1(adr,GetM_Ack_DL1,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1LHS_M_evict_x_I;
          return true;
        
        case Fwd_GetSL1:
          msg := RespL1(adr,GetS_AckL1,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL1(adr,WBL1,m,to_m_directoryL1LHS(directoryL1LHS),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1LHS_S_evict;
          return true;
        
        case Put_AckL1:
          Clear_perm(adr, m);
          cbe.State := cacheL1LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1LHS_M_evict_x_I:
      switch inmsg.mtype
        case Put_AckL1:
          Clear_perm(adr, m);
          cbe.State := cacheL1LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1LHS_S:
      switch inmsg.mtype
        case InvL1:
          msg := RespL1(adr,Inv_AckL1,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1LHS_S_evict:
      switch inmsg.mtype
        case InvL1:
          msg := RespL1(adr,Inv_AckL1,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1LHS_S_evict_x_I;
          return true;
        
        case Put_AckL1:
          Clear_perm(adr, m);
          cbe.State := cacheL1LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1LHS_S_evict_x_I:
      switch inmsg.mtype
        case Put_AckL1:
          Clear_perm(adr, m);
          cbe.State := cacheL1LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1LHS_S_store:
      switch inmsg.mtype
        case GetM_Ack_ADL1:
          cbe.acksExpectedL1 := inmsg.acksExpectedL1;
          if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            Clear_perm(adr, m);
            cbe.State := cacheL1LHS_S_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            cbe.acksExpectedL1 := 0;
            cbe.acksReceivedL1 := 0;
            Set_perm(store, adr, m);
            Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
            cbe.State := cacheL1LHS_M;
            return true;
          endif;
        
        case GetM_Ack_DL1:
          Set_perm(store, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL1LHS_M;
          return true;
        
        case InvL1:
          msg := RespL1(adr,Inv_AckL1,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1LHS_I_store;
          return true;
        
        case Inv_AckL1:
          cbe.acksReceivedL1 := cbe.acksReceivedL1+1;
          Clear_perm(adr, m);
          cbe.State := cacheL1LHS_S_store;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1LHS_S_store_GetM_Ack_AD:
      switch inmsg.mtype
        case Inv_AckL1:
          cbe.acksReceivedL1 := cbe.acksReceivedL1+1;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            cbe.acksExpectedL1 := 0;
            cbe.acksReceivedL1 := 0;
            Set_perm(store, adr, m);
            Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
            cbe.State := cacheL1LHS_M;
            return true;
          endif;
          if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            Clear_perm(adr, m);
            cbe.State := cacheL1LHS_S_store_GetM_Ack_AD;
            return true;
          endif;
        
        else return false;
      endswitch;
      
    endswitch;
    endalias;
    endalias;
    endalias;
    return false;
    end;
    

--Backend/Murphi/MurphiModular/GenResetFunc

  procedure System_Reset();
  begin
  Reset_perm();
  Reset_NET_();
  ResetMachine_();
  end;
  

--Backend/Murphi/MurphiModular/GenRules
  ----Backend/Murphi/MurphiModular/Rules/GenAccessRuleSet
    ruleset m:OBJSET_directoryL1LHS do
    ruleset adr:Address do
      alias cbe:i_directoryL1LHS[m].cb[adr] do
    
      rule "directoryL1LHS_E__C__M_evict"
        cbe.State = directoryL1LHS_E__C__M & continue_run(systemLHS, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_directoryL1LHS_E__C__M_evict(adr, m);
        
      endrule;
    
      rule "directoryL1LHS_I__C__E_evict"
        cbe.State = directoryL1LHS_I__C__E & continue_run(systemLHS, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_directoryL1LHS_I__C__E_evict(adr, m);
        
      endrule;
    
      rule "directoryL1LHS_I__C__M_evict"
        cbe.State = directoryL1LHS_I__C__M & continue_run(systemLHS, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_directoryL1LHS_I__C__M_evict(adr, m);
        
      endrule;
    
      rule "directoryL1LHS_I__C__S_evict"
        cbe.State = directoryL1LHS_I__C__S & continue_run(systemLHS, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_directoryL1LHS_I__C__S_evict(adr, m);
        
      endrule;
    
      rule "directoryL1LHS_M__C__M_evict"
        cbe.State = directoryL1LHS_M__C__M & continue_run(systemLHS, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_directoryL1LHS_M__C__M_evict(adr, m);
        
      endrule;
    
      rule "directoryL1LHS_S__C__E_evict"
        cbe.State = directoryL1LHS_S__C__E & continue_run(systemLHS, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_directoryL1LHS_S__C__E_evict(adr, m);
        
      endrule;
    
      rule "directoryL1LHS_S__C__M_evict"
        cbe.State = directoryL1LHS_S__C__M & continue_run(systemLHS, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_directoryL1LHS_S__C__M_evict(adr, m);
        
      endrule;
    
      rule "directoryL1LHS_S__C__S_evict"
        cbe.State = directoryL1LHS_S__C__S & continue_run(systemLHS, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_directoryL1LHS_S__C__S_evict(adr, m);
        
      endrule;
    
    
      endalias;
    endruleset;
    endruleset;
    
    ruleset m:OBJSET_cacheL2LHS do
    ruleset adr:Address do
      alias cbe:i_cacheL2LHS[m].cb[adr] do
    
      rule "cacheL2LHS_E_load"
        cbe.State = cacheL2LHS_E & continue_run(systemLHSExt, g_system_state) 
      ==>
        FSM_Access_cacheL2LHS_E_load(adr, m);
        
      endrule;
    
      rule "cacheL2LHS_E_store"
        cbe.State = cacheL2LHS_E & continue_run(systemLHSExt, g_system_state) 
      ==>
        FSM_Access_cacheL2LHS_E_store(adr, m);
        
      endrule;
    
      rule "cacheL2LHS_E_evict"
        cbe.State = cacheL2LHS_E & continue_run(systemLHSExt, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_cacheL2LHS_E_evict(adr, m);
        
      endrule;
    
      rule "cacheL2LHS_I_store"
        cbe.State = cacheL2LHS_I & continue_run(systemLHSExt, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_cacheL2LHS_I_store(adr, m);
        
      endrule;
    
      rule "cacheL2LHS_I_load"
        cbe.State = cacheL2LHS_I & continue_run(systemLHSExt, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_cacheL2LHS_I_load(adr, m);
        
      endrule;
    
      rule "cacheL2LHS_M_load"
        cbe.State = cacheL2LHS_M & continue_run(systemLHSExt, g_system_state) 
      ==>
        FSM_Access_cacheL2LHS_M_load(adr, m);
        
      endrule;
    
      rule "cacheL2LHS_M_evict"
        cbe.State = cacheL2LHS_M & continue_run(systemLHSExt, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_cacheL2LHS_M_evict(adr, m);
        
      endrule;
    
      rule "cacheL2LHS_M_store"
        cbe.State = cacheL2LHS_M & continue_run(systemLHSExt, g_system_state) 
      ==>
        FSM_Access_cacheL2LHS_M_store(adr, m);
        
      endrule;
    
      rule "cacheL2LHS_S_load"
        cbe.State = cacheL2LHS_S & continue_run(systemLHSExt, g_system_state) 
      ==>
        FSM_Access_cacheL2LHS_S_load(adr, m);
        
      endrule;
    
      rule "cacheL2LHS_S_evict"
        cbe.State = cacheL2LHS_S & continue_run(systemLHSExt, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_cacheL2LHS_S_evict(adr, m);
        
      endrule;
    
      rule "cacheL2LHS_S_store"
        cbe.State = cacheL2LHS_S & continue_run(systemLHSExt, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_cacheL2LHS_S_store(adr, m);
        
      endrule;
    
    
      endalias;
    endruleset;
    endruleset;
    
    ruleset m:OBJSET_abstractionRHS do
    ruleset adr:Address do
      alias cbe:i_abstractionRHS[m].cb[adr] do
    
    -- Impossible due to effective MI downgrade 
    --  rule "abstractionRHS_E_load"
    --    cbe.State = abstractionRHS_E & continue_run(systemRHS, g_system_state) 
    --  ==>
    --    FSM_Access_abstractionRHS_E_load(adr, m);
    --    
    --  endrule;
    --
      rule "abstractionRHS_E_store"
        cbe.State = abstractionRHS_E & continue_run(systemRHS, g_system_state) 
      ==>
        FSM_Access_abstractionRHS_E_store(adr, m);
        
      endrule;
    
      rule "abstractionRHS_E_evict"
        cbe.State = abstractionRHS_E & continue_run(systemRHS, g_system_state) & network_RHS_ready()
      ==>
        FSM_Access_abstractionRHS_E_evict(adr, m);
        
      endrule;
    
      rule "abstractionRHS_I_store"
        cbe.State = abstractionRHS_I & continue_run(systemRHS, g_system_state) & network_RHS_ready()
      ==>
        FSM_Access_abstractionRHS_I_store(adr, m);
        
      endrule;
    
    -- Impossible due to effective MI downgrade 
    --  rule "abstractionRHS_I_load"
    --    cbe.State = abstractionRHS_I & continue_run(systemRHS, g_system_state) & network_RHS_ready()
    --  ==>
    --    FSM_Access_abstractionRHS_I_load(adr, m);
    --    
    --  endrule;
    --
    -- Impossible due to effective MI downgrade 
    --  rule "abstractionRHS_M_load"
    --    cbe.State = abstractionRHS_M & continue_run(systemRHS, g_system_state) 
    --  ==>
    --    FSM_Access_abstractionRHS_M_load(adr, m);
    --    
    --  endrule;
    --
      rule "abstractionRHS_M_evict"
        cbe.State = abstractionRHS_M & continue_run(systemRHS, g_system_state) & network_RHS_ready()
      ==>
        FSM_Access_abstractionRHS_M_evict(adr, m);
        
      endrule;
    
      rule "abstractionRHS_M_store"
        cbe.State = abstractionRHS_M & continue_run(systemRHS, g_system_state) 
      ==>
        FSM_Access_abstractionRHS_M_store(adr, m);
        
      endrule;
    
    -- Impossible due to effective MI downgrade 
    --  rule "abstractionRHS_S_load"
    --    cbe.State = abstractionRHS_S & continue_run(systemRHS, g_system_state) 
    --  ==>
    --    FSM_Access_abstractionRHS_S_load(adr, m);
    --    
    --  endrule;
    --
      rule "abstractionRHS_S_evict"
        cbe.State = abstractionRHS_S & continue_run(systemRHS, g_system_state) & network_RHS_ready()
      ==>
        FSM_Access_abstractionRHS_S_evict(adr, m);
        
      endrule;
    
      rule "abstractionRHS_S_store"
        cbe.State = abstractionRHS_S & continue_run(systemRHS, g_system_state) & network_RHS_ready()
      ==>
        FSM_Access_abstractionRHS_S_store(adr, m);
        
      endrule;
    
    
      endalias;
    endruleset;
    endruleset;
    
    ruleset m:OBJSET_cacheL1LHS do
    ruleset adr:Address do
      alias cbe:i_cacheL1LHS[m].cb[adr] do
    
      rule "cacheL1LHS_E_load"
        cbe.State = cacheL1LHS_E & continue_run(systemLHS, g_system_state) 
      ==>
        FSM_Access_cacheL1LHS_E_load(adr, m);
        
      endrule;
    
      rule "cacheL1LHS_E_store"
        cbe.State = cacheL1LHS_E & continue_run(systemLHS, g_system_state) 
      ==>
        FSM_Access_cacheL1LHS_E_store(adr, m);
        
      endrule;
    
      rule "cacheL1LHS_E_evict"
        cbe.State = cacheL1LHS_E & continue_run(systemLHS, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_cacheL1LHS_E_evict(adr, m);
        
      endrule;
    
      rule "cacheL1LHS_I_store"
        cbe.State = cacheL1LHS_I & continue_run(systemLHS, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_cacheL1LHS_I_store(adr, m);
        
      endrule;
    
      rule "cacheL1LHS_I_load"
        cbe.State = cacheL1LHS_I & continue_run(systemLHS, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_cacheL1LHS_I_load(adr, m);
        
      endrule;
    
      rule "cacheL1LHS_M_evict"
        cbe.State = cacheL1LHS_M & continue_run(systemLHS, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_cacheL1LHS_M_evict(adr, m);
        
      endrule;
    
      rule "cacheL1LHS_M_load"
        cbe.State = cacheL1LHS_M & continue_run(systemLHS, g_system_state) 
      ==>
        FSM_Access_cacheL1LHS_M_load(adr, m);
        
      endrule;
    
      rule "cacheL1LHS_M_store"
        cbe.State = cacheL1LHS_M & continue_run(systemLHS, g_system_state) 
      ==>
        FSM_Access_cacheL1LHS_M_store(adr, m);
        
      endrule;
    
      rule "cacheL1LHS_S_load"
        cbe.State = cacheL1LHS_S & continue_run(systemLHS, g_system_state) 
      ==>
        FSM_Access_cacheL1LHS_S_load(adr, m);
        
      endrule;
    
      rule "cacheL1LHS_S_evict"
        cbe.State = cacheL1LHS_S & continue_run(systemLHS, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_cacheL1LHS_S_evict(adr, m);
        
      endrule;
    
      rule "cacheL1LHS_S_store"
        cbe.State = cacheL1LHS_S & continue_run(systemLHS, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_cacheL1LHS_S_store(adr, m);
        
      endrule;
    
    
      endalias;
    endruleset;
    endruleset;
    
  ----Backend/Murphi/MurphiModular/Rules/GenEventRuleSet
  ----Backend/Murphi/MurphiModular/Rules/GenNetworkRule
    -- directoryL1LHS
    ruleset n:OBJSET_directoryL1LHS do
      alias msg:resp_directoryL1LHS[n][0] do
        rule "Receive directoryL1LHS resp"
          cnt_resp_directoryL1LHS[n] > 0
          & continue_run(systemLHS, g_system_state) 
        ==>
          if FSM_MSG_directoryL1LHS(msg, n) then
            Pop_resp(to_m_directoryL1LHS(n), to_m_directoryL1LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1LHS do
      alias msg:req_directoryL1LHS[n][0] do
        rule "Receive directoryL1LHS req"
          cnt_req_directoryL1LHS[n] > 0
          & continue_run(systemLHS, g_system_state) 
        ==>
          if FSM_MSG_directoryL1LHS(msg, n) then
            Pop_req(to_m_directoryL1LHS(n), to_m_directoryL1LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1LHS do
      alias msg:fwd_directoryL1LHS[n][0] do
        rule "Receive directoryL1LHS fwd"
          cnt_fwd_directoryL1LHS[n] > 0
          & continue_run(systemLHS, g_system_state) 
        ==>
          if FSM_MSG_directoryL1LHS(msg, n) then
            Pop_fwd(to_m_directoryL1LHS(n), to_m_directoryL1LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1LHS do
      alias msg:bisnp_directoryL1LHS[n][0] do
        rule "Receive directoryL1LHS bisnp"
          cnt_bisnp_directoryL1LHS[n] > 0
          & continue_run(systemLHS, g_system_state) 
        ==>
          if FSM_MSG_directoryL1LHS(msg, n) then
            Pop_bisnp(to_m_directoryL1LHS(n), to_m_directoryL1LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1LHS do
      alias msg:req2_directoryL1LHS[n][0] do
        rule "Receive directoryL1LHS req2"
          cnt_req2_directoryL1LHS[n] > 0
          & continue_run(systemLHS, g_system_state) 
        ==>
          if FSM_MSG_directoryL1LHS(msg, n) then
            Pop_req2(to_m_directoryL1LHS(n), to_m_directoryL1LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1LHS do
      alias msg:rwd_directoryL1LHS[n][0] do
        rule "Receive directoryL1LHS rwd"
          cnt_rwd_directoryL1LHS[n] > 0
          & continue_run(systemLHS, g_system_state) 
        ==>
          if FSM_MSG_directoryL1LHS(msg, n) then
            Pop_rwd(to_m_directoryL1LHS(n), to_m_directoryL1LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1LHS do
      alias msg:birsp_directoryL1LHS[n][0] do
        rule "Receive directoryL1LHS birsp"
          cnt_birsp_directoryL1LHS[n] > 0
          & continue_run(systemLHS, g_system_state) 
        ==>
          if FSM_MSG_directoryL1LHS(msg, n) then
            Pop_birsp(to_m_directoryL1LHS(n), to_m_directoryL1LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1LHS do
      alias msg:drs_directoryL1LHS[n][0] do
        rule "Receive directoryL1LHS drs"
          cnt_drs_directoryL1LHS[n] > 0
          & continue_run(systemLHS, g_system_state) 
        ==>
          if FSM_MSG_directoryL1LHS(msg, n) then
            Pop_drs(to_m_directoryL1LHS(n), to_m_directoryL1LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1LHS do
      alias msg:ndr_directoryL1LHS[n][0] do
        rule "Receive directoryL1LHS ndr"
          cnt_ndr_directoryL1LHS[n] > 0
          & continue_run(systemLHS, g_system_state) 
        ==>
          if FSM_MSG_directoryL1LHS(msg, n) then
            Pop_ndr(to_m_directoryL1LHS(n), to_m_directoryL1LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    
    -- cacheL2RHS
    -- abstractionRHS
    ruleset n:OBJSET_abstractionRHS do
      alias msg:resp_abstractionRHS[n][0] do
        rule "Receive abstractionRHS resp"
          cnt_resp_abstractionRHS[n] > 0
          & continue_run(systemRHS, g_system_state) 
        ==>
          if FSM_MSG_abstractionRHS(msg, n) then
            Pop_resp(to_m_abstractionRHS(n), to_m_abstractionRHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_abstractionRHS do
      alias msg:req_abstractionRHS[n][0] do
        rule "Receive abstractionRHS req"
          cnt_req_abstractionRHS[n] > 0
          & continue_run(systemRHS, g_system_state) 
        ==>
          if FSM_MSG_abstractionRHS(msg, n) then
            Pop_req(to_m_abstractionRHS(n), to_m_abstractionRHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_abstractionRHS do
      alias msg:fwd_abstractionRHS[n][0] do
        rule "Receive abstractionRHS fwd"
          cnt_fwd_abstractionRHS[n] > 0
          & continue_run(systemRHS, g_system_state) 
        ==>
          if FSM_MSG_abstractionRHS(msg, n) then
            Pop_fwd(to_m_abstractionRHS(n), to_m_abstractionRHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_abstractionRHS do
      alias msg:bisnp_abstractionRHS[n][0] do
        rule "Receive abstractionRHS bisnp"
          cnt_bisnp_abstractionRHS[n] > 0
          & continue_run(systemRHS, g_system_state) 
        ==>
          if FSM_MSG_abstractionRHS(msg, n) then
            Pop_bisnp(to_m_abstractionRHS(n), to_m_abstractionRHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_abstractionRHS do
      alias msg:req2_abstractionRHS[n][0] do
        rule "Receive abstractionRHS req2"
          cnt_req2_abstractionRHS[n] > 0
          & continue_run(systemRHS, g_system_state) 
        ==>
          if FSM_MSG_abstractionRHS(msg, n) then
            Pop_req2(to_m_abstractionRHS(n), to_m_abstractionRHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_abstractionRHS do
      alias msg:rwd_abstractionRHS[n][0] do
        rule "Receive abstractionRHS rwd"
          cnt_rwd_abstractionRHS[n] > 0
          & continue_run(systemRHS, g_system_state) 
        ==>
          if FSM_MSG_abstractionRHS(msg, n) then
            Pop_rwd(to_m_abstractionRHS(n), to_m_abstractionRHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_abstractionRHS do
      alias msg:birsp_abstractionRHS[n][0] do
        rule "Receive abstractionRHS birsp"
          cnt_birsp_abstractionRHS[n] > 0
          & continue_run(systemRHS, g_system_state) 
        ==>
          if FSM_MSG_abstractionRHS(msg, n) then
            Pop_birsp(to_m_abstractionRHS(n), to_m_abstractionRHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_abstractionRHS do
      alias msg:drs_abstractionRHS[n][0] do
        rule "Receive abstractionRHS drs"
          cnt_drs_abstractionRHS[n] > 0
          & continue_run(systemRHS, g_system_state) 
        ==>
          if FSM_MSG_abstractionRHS(msg, n) then
            Pop_drs(to_m_abstractionRHS(n), to_m_abstractionRHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_abstractionRHS do
      alias msg:ndr_abstractionRHS[n][0] do
        rule "Receive abstractionRHS ndr"
          cnt_ndr_abstractionRHS[n] > 0
          & continue_run(systemRHS, g_system_state) 
        ==>
          if FSM_MSG_abstractionRHS(msg, n) then
            Pop_ndr(to_m_abstractionRHS(n), to_m_abstractionRHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    
    -- cacheL2LHS
    ruleset n:OBJSET_cacheL2LHS do
      alias msg:bisnp_cacheL2LHS[n][0] do
        rule "Receive cacheL2LHS bisnp"
          cnt_bisnp_cacheL2LHS[n] > 0
          & continue_run(systemLHSExt, g_system_state) 
        ==>
          if FSM_MSG_cacheL2LHS(msg, n) then
            Pop_bisnp(to_m_cacheL2LHS(n), to_m_cacheL2LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_cacheL2LHS do
      alias msg:req2_cacheL2LHS[n][0] do
        rule "Receive cacheL2LHS req2"
          cnt_req2_cacheL2LHS[n] > 0
          & continue_run(systemLHSExt, g_system_state) 
        ==>
          if FSM_MSG_cacheL2LHS(msg, n) then
            Pop_req2(to_m_cacheL2LHS(n), to_m_cacheL2LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_cacheL2LHS do
      alias msg:rwd_cacheL2LHS[n][0] do
        rule "Receive cacheL2LHS rwd"
          cnt_rwd_cacheL2LHS[n] > 0
          & continue_run(systemLHSExt, g_system_state) 
        ==>
          if FSM_MSG_cacheL2LHS(msg, n) then
            Pop_rwd(to_m_cacheL2LHS(n), to_m_cacheL2LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_cacheL2LHS do
      alias msg:birsp_cacheL2LHS[n][0] do
        rule "Receive cacheL2LHS birsp"
          cnt_birsp_cacheL2LHS[n] > 0
          & continue_run(systemLHSExt, g_system_state) 
        ==>
          if FSM_MSG_cacheL2LHS(msg, n) then
            Pop_birsp(to_m_cacheL2LHS(n), to_m_cacheL2LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_cacheL2LHS do
      alias msg:drs_cacheL2LHS[n][0] do
        rule "Receive cacheL2LHS drs"
          cnt_drs_cacheL2LHS[n] > 0
          & continue_run(systemLHSExt, g_system_state) 
        ==>
          if FSM_MSG_cacheL2LHS(msg, n) then
            Pop_drs(to_m_cacheL2LHS(n), to_m_cacheL2LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_cacheL2LHS do
      alias msg:ndr_cacheL2LHS[n][0] do
        rule "Receive cacheL2LHS ndr"
          cnt_ndr_cacheL2LHS[n] > 0
          & continue_run(systemLHSExt, g_system_state) 
        ==>
          if FSM_MSG_cacheL2LHS(msg, n) then
            Pop_ndr(to_m_cacheL2LHS(n), to_m_cacheL2LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    
    -- directoryL2RHS
    -- directoryL2LHS
    ruleset n:OBJSET_directoryL2LHS do
      alias msg:bisnp_directoryL2LHS[n][0] do
        rule "Receive directoryL2LHS bisnp"
          cnt_bisnp_directoryL2LHS[n] > 0
          & continue_run(systemLHSExt, g_system_state) 
        ==>
          if FSM_MSG_directoryL2LHS(msg, n) then
            Pop_bisnp(to_m_directoryL2LHS(n), to_m_directoryL2LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL2LHS do
      alias msg:req2_directoryL2LHS[n][0] do
        rule "Receive directoryL2LHS req2"
          cnt_req2_directoryL2LHS[n] > 0
          & continue_run(systemLHSExt, g_system_state) 
        ==>
          if FSM_MSG_directoryL2LHS(msg, n) then
            Pop_req2(to_m_directoryL2LHS(n), to_m_directoryL2LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL2LHS do
      alias msg:rwd_directoryL2LHS[n][0] do
        rule "Receive directoryL2LHS rwd"
          cnt_rwd_directoryL2LHS[n] > 0
          & continue_run(systemLHSExt, g_system_state) 
        ==>
          if FSM_MSG_directoryL2LHS(msg, n) then
            Pop_rwd(to_m_directoryL2LHS(n), to_m_directoryL2LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL2LHS do
      alias msg:birsp_directoryL2LHS[n][0] do
        rule "Receive directoryL2LHS birsp"
          cnt_birsp_directoryL2LHS[n] > 0
          & continue_run(systemLHSExt, g_system_state) 
        ==>
          if FSM_MSG_directoryL2LHS(msg, n) then
            Pop_birsp(to_m_directoryL2LHS(n), to_m_directoryL2LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL2LHS do
      alias msg:drs_directoryL2LHS[n][0] do
        rule "Receive directoryL2LHS drs"
          cnt_drs_directoryL2LHS[n] > 0
          & continue_run(systemLHSExt, g_system_state) 
        ==>
          if FSM_MSG_directoryL2LHS(msg, n) then
            Pop_drs(to_m_directoryL2LHS(n), to_m_directoryL2LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL2LHS do
      alias msg:ndr_directoryL2LHS[n][0] do
        rule "Receive directoryL2LHS ndr"
          cnt_ndr_directoryL2LHS[n] > 0
          & continue_run(systemLHSExt, g_system_state) 
        ==>
          if FSM_MSG_directoryL2LHS(msg, n) then
            Pop_ndr(to_m_directoryL2LHS(n), to_m_directoryL2LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    
    -- cacheL1LHS
    ruleset n:OBJSET_cacheL1LHS do
      alias msg:resp_cacheL1LHS[n][0] do
        rule "Receive cacheL1LHS resp"
          cnt_resp_cacheL1LHS[n] > 0
          & continue_run(systemLHS, g_system_state) 
        ==>
          if FSM_MSG_cacheL1LHS(msg, n) then
            Pop_resp(to_m_cacheL1LHS(n), to_m_cacheL1LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_cacheL1LHS do
      alias msg:fwd_cacheL1LHS[n][0] do
        rule "Receive cacheL1LHS fwd"
          cnt_fwd_cacheL1LHS[n] > 0
          & continue_run(systemLHS, g_system_state) 
        ==>
          if FSM_MSG_cacheL1LHS(msg, n) then
            Pop_fwd(to_m_cacheL1LHS(n), to_m_cacheL1LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    
    -- directoryL1LHS
    
    -- cacheL2RHS
    
    -- abstractionRHS
    
    -- cacheL2LHS
    
    -- directoryL2RHS
    
    -- directoryL2LHS
    
    -- cacheL1LHS
    
  ----Backend/Murphi/MurphiModular/Rules/GenEqGlobalStateRule
  
    rule "SWITCH FROM LHS TO RHS"
      g_system_state = systemLHS
      & can_switch_out_of(g_system_state)
      & can_switch_to(systemRHS)
    ==>
      g_progress_tracking := false;
      g_system_state := systemRHS;
      BackupRHS();
    endrule;
    
    rule "SWITCH FROM RHS TO LHS"
      g_system_state = systemRHS
      & can_switch_out_of(g_system_state)
      & can_switch_to(systemLHS)
    ==>
      g_system_state := systemLHS;
      if !g_progress_tracking then
        BackupRHS();
      else
        if sameOutputOB() then
          g_progress_tracking := false;
        endif;
        RestoreRHSBackup();
      endif;
    endrule;
    
    rule "SWITCH FROM LHS TO LHSEXT"
      g_system_state = systemLHS
      & can_switch_out_of(g_system_state)
      & can_switch_to(systemLHSExt)
    ==>
      g_system_state := systemLHSExt;
      BackupRHS();
    endrule;
    
    rule "SWITCH FROM LHSEXT TO LHS"
      g_system_state = systemLHSExt
      & can_switch_out_of(g_system_state)
      & can_switch_to(systemLHS)
    ==>
      g_system_state := systemLHS;
      BackupRHS();
    endrule;
    
    rule "Track Progress"
      g_system_state = systemLHS
      & sameOutputOB()
      & !g_progress_tracking
    ==>
      g_system_state := systemRHS;
      g_progress_tracking := true;
    endrule;
    
    rule "RESET RHS"
      g_system_state = systemRHS
    ==>
      RestoreRHSBackup()
    endrule;
    
  

--Backend/Murphi/MurphiModular/GenStartStates

  startstate
    System_Reset();
    BackupRHS();
  endstartstate;

--Backend/Murphi/MurphiModular/GenInvariant
  liveness "can always reproduce progress" g_system_state = systemLHS & !g_progress_tracking;
