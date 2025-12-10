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
    O_NET_MAX: 28;
    U_NET_MAX: 28;
  
  ---- Cluster network constants
    CACHE_NET_MAX : 7;
    C1A_NET_MAX : 9;
    C2_NET_MAX : 7;
    C1B_NET_MAX : 9;
  
  ---- SSP declaration constants
    NrCachesL1A: 4;
    NrCachesL2: 3;
    NrCachesL1B: 4;
  
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
        acquire, 
        release, 
        none
      };
      
      ------Backend/Murphi/MurphiModular/Types/Enums/SubEnums/GenMessageTypes
      MessageType: enum {
        GetSL1A, 
        GetML1A, 
        PutSL1A, 
        Inv_AckL1A, 
        GetM_Ack_DL1A, 
        GetS_AckL1A, 
        WBL1A, 
        PutML1A, 
        PutEL1A, 
        GetM_Ack_ADL1A, 
        InvL1A, 
        Put_AckL1A, 
        Fwd_GetSL1A, 
        Fwd_GetML1A, 
        GetSL1Astore, 
        GetSL1Aload, 
        GetML1Astore, 
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
        MemInv_A_SnpInvL2load, 
        GetVL1B, 
        GetRL1B, 
        PutRL1B, 
        PutVL1B, 
        GetV_AckL1B, 
        GetR_AckL1B, 
        PutR_AckL1B, 
        PutV_AckL1B, 
        GetVL1Bacquire, 
        GetVL1Bload, 
        GetRL1Brelease, 
        PutRL1Brelease, 
        PutVL1Brelease
      };
      
      ------Backend/Murphi/MurphiModular/Types/Enums/SubEnums/GenArchEnums
      s_directoryL1B: enum {
        directoryL1B_evictV__C__S_evict_x_I,
        directoryL1B_evictV__C__S_evict,
        directoryL1B_evictV__C__M_evict_BIConflictAck,
        directoryL1B_evictV__C__M_evict,
        directoryL1B_evictV__C__E_evict_x_I,
        directoryL1B_evictV__C__E_evict,
        directoryL1B_V__C__S,
        directoryL1B_V__C__M,
        directoryL1B_V__C__I,
        directoryL1B_V__C__E,
        directoryL1B_PutVL1BV__C__S_store,
        directoryL1B_PutVL1BV__C__I_store_Cmp_E,
        directoryL1B_PutVL1BV__C__I_store,
        directoryL1B_GetVL1BV__C__I_load_Cmp_S,
        directoryL1B_GetVL1BV__C__I_load_Cmp_E,
        directoryL1B_GetVL1BV__C__I_load,
        directoryL1B_GetRL1BV__C__S_store,
        directoryL1B_GetRL1BV__C__I_store_Cmp_E,
        directoryL1B_GetRL1BV__C__I_store,
        directoryL1B_GetRL1BV_GetR__C__M,
        directoryL1B_BISnpInvL2V__C__M_BISnpInv,
        directoryL1B_BISnpDataL2V__C__M_BISnpData,
        directoryL1B_BIConflictAckL2V__C__M_BIConflictAck
      };
      
      e_directoryL1B: enum {
        directoryL1B_rel_eventL1B,
        directoryL1B_acq_eventL1B
      };
      
      s_cacheL1A: enum {
        cacheL1A_S_store_GetM_Ack_AD,
        cacheL1A_S_store,
        cacheL1A_S_evict_x_I,
        cacheL1A_S_evict,
        cacheL1A_S,
        cacheL1A_M_evict_x_I,
        cacheL1A_M_evict,
        cacheL1A_M,
        cacheL1A_I_store_GetM_Ack_AD,
        cacheL1A_I_store,
        cacheL1A_I_load,
        cacheL1A_I,
        cacheL1A_E_evict_x_I,
        cacheL1A_E_evict,
        cacheL1A_E
      };
      
      s_directoryL1A: enum {
        directoryL1A_evictdM_x_pI_store__C__M,
        directoryL1A_evictdM_x_pI_store_GetM_Ack_AD__C__S,
        directoryL1A_evictdM_x_pI_store_GetM_Ack_AD__C__M,
        directoryL1A_evictdM_x_pI_store_GetM_Ack_AD__C__E,
        directoryL1A_evictI__C__S_evict_x_I,
        directoryL1A_evictI__C__S_evict,
        directoryL1A_evictI__C__M_evict_BIConflictAck,
        directoryL1A_evictI__C__M_evict,
        directoryL1A_evictI__C__E_evict_x_I,
        directoryL1A_evictI__C__E_evict,
        directoryL1A_S__C__S,
        directoryL1A_S__C__M,
        directoryL1A_S__C__E,
        directoryL1A_M__C__M,
        directoryL1A_I__C__S,
        directoryL1A_I__C__M,
        directoryL1A_I__C__I,
        directoryL1A_I__C__E,
        directoryL1A_GetSL1AM_GetS__C__M,
        directoryL1A_GetSL1AI__C__S_store,
        directoryL1A_GetSL1AI__C__I_store_Cmp_E,
        directoryL1A_GetSL1AI__C__I_store,
        directoryL1A_GetSL1AE_GetS__C__M,
        directoryL1A_GetML1AS__C__S_store,
        directoryL1A_GetML1AS__C__I_store_Cmp_E,
        directoryL1A_GetML1AS__C__I_store,
        directoryL1A_GetML1AI__C__S_store,
        directoryL1A_GetML1AI__C__I_store_Cmp_E,
        directoryL1A_GetML1AI__C__I_store,
        directoryL1A_E__C__M,
        directoryL1A_BISnpInvL2dM_x_pI_store__C__M,
        directoryL1A_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__S,
        directoryL1A_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__M,
        directoryL1A_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__E,
        directoryL1A_BISnpInvL2I__C__M_BISnpInv,
        directoryL1A_BISnpDataL2dS_x_pI_load__C__M,
        directoryL1A_BISnpDataL2dM_GetS_x_pS__C__M,
        directoryL1A_BISnpDataL2dM_GetS_x_pI_load__C__M,
        directoryL1A_BISnpDataL2dE_GetS_x_pS__C__M,
        directoryL1A_BISnpDataL2dE_GetS_x_pI_load__C__M,
        directoryL1A_BISnpDataL2S__C__M_BISnpData,
        directoryL1A_BISnpDataL2I__C__M_BISnpData,
        directoryL1A_BIConflictAckL2dM_x_pI_store__C__M,
        directoryL1A_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__S,
        directoryL1A_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__M,
        directoryL1A_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__I_store,
        directoryL1A_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__E,
        directoryL1A_BIConflictAckL2I__C__M_BIConflictAck
      };
      
      s_directoryL2: enum {
        directoryL2_S_MemRd_A_SnpInv,
        directoryL2_S_MemInv_A_SnpInv,
        directoryL2_S,
        directoryL2_M_MemRd_S_SnpData,
        directoryL2_M_MemRd_A_SnpInv,
        directoryL2_M_MemInv_A_SnpInv,
        directoryL2_M,
        directoryL2_I,
        directoryL2_E_MemRd_S_SnpData,
        directoryL2_E_MemRd_A_SnpInv,
        directoryL2_E_MemInv_A_SnpInv,
        directoryL2_E
      };
      
      s_cacheL1B: enum {
        cacheL1B_VD_release_rel_event,
        cacheL1B_VD_release,
        cacheL1B_VD_rel_event,
        cacheL1B_VD_evict,
        cacheL1B_VD_acquire_GetV_Ack,
        cacheL1B_VD_acquire,
        cacheL1B_VD,
        cacheL1B_VC_release_rel_event,
        cacheL1B_VC_release,
        cacheL1B_VC_acquire_GetV_Ack,
        cacheL1B_VC_acquire,
        cacheL1B_VC,
        cacheL1B_I_store,
        cacheL1B_I_release_rel_event_GetR_Ack,
        cacheL1B_I_release_rel_event,
        cacheL1B_I_release,
        cacheL1B_I_load,
        cacheL1B_I_acquire_GetV_Ack,
        cacheL1B_I_acquire,
        cacheL1B_I
      };
      
      e_cacheL1B: enum {
        cacheL1B_rel_eventL1B,
        cacheL1B_acq_eventL1B
      };
      
    ----Backend/Murphi/MurphiModular/Types/GenMachineSets
      -- Cluster: C1A
      OBJSET_cacheL1A: scalarset(3);
      OBJSET_directoryL1A: enum{directoryL1A};
      C1AMachines: record
        cacheL1A: OBJSET_cacheL1A;
        directoryL1A: OBJSET_directoryL1A;
      end;
      -- Cluster: C2
      OBJSET_directoryL2: enum{directoryL2};
      OBJSET_directoryL1B: enum{directoryL1B};
      C2Machines: record
        directoryL2: OBJSET_directoryL2;
        directoryL1B: OBJSET_directoryL1B;
        directoryL1A: OBJSET_directoryL1A;
      end;
      -- Cluster: C1B
      OBJSET_cacheL1B: scalarset(3);
      C1BMachines: record
        directoryL1B: OBJSET_directoryL1B;
        cacheL1B: OBJSET_cacheL1B;
      end;
      
      Machines: record
        cacheL1A: OBJSET_cacheL1A;
        directoryL1A: OBJSET_directoryL1A;
        directoryL2: OBJSET_directoryL2;
        directoryL1B: OBJSET_directoryL1B;
        cacheL1B: OBJSET_cacheL1B;
      end;
      CntMachines: 0..9;
    
    ----Backend/Murphi/MurphiModular/Types/GenScalarMaps
    
    ----Backend/Murphi/MurphiModular/Types/GenCheckTypes
      ------Backend/Murphi/MurphiModular/Types/CheckTypes/GenPermType
        acc_type_obj: array[PermissionType] of boolean;
        PermMonitor: record
          cacheL1A: array[OBJSET_cacheL1A] of array[Address] of acc_type_obj;
          cacheL1B: array[OBJSET_cacheL1B] of array[Address] of acc_type_obj;
        
        end;
      
    
    ----Backend/Murphi/MurphiModular/Types/GenMessage
      Message: record
        adr: Address;
        mtype: MessageType;
        src: Machines;
        dst: Machines;
        cl: ClValue;
        acksExpectedL1A: 0..NrCachesL1A;
      end;
      
    ----Backend/Murphi/MurphiModular/Types/GenNetwork
      NET_fwd_cacheL1A: array[OBJSET_cacheL1A] of array[0..(C1A_NET_MAX)-1] of Message;
      NET_resp_cacheL1A: array[OBJSET_cacheL1A] of array[0..(C1A_NET_MAX)-1] of Message;
      NET_cacheL1A_cnt: array[OBJSET_cacheL1A] of 0..O_NET_MAX;
      NET_fwd_directoryL1A: array[OBJSET_directoryL1A] of array[0..1-1] of Message;
      NET_req_directoryL1A: array[OBJSET_directoryL1A] of array[0..(C1A_NET_MAX)-1] of Message;
      NET_birsp_directoryL1A: array[OBJSET_directoryL1A] of array[0..(C2_NET_MAX)-1] of Message;
      NET_drs_directoryL1A: array[OBJSET_directoryL1A] of array[0..(C2_NET_MAX)-1] of Message;
      NET_rwd_directoryL1A: array[OBJSET_directoryL1A] of array[0..(C2_NET_MAX)-1] of Message;
      NET_req2_directoryL1A: array[OBJSET_directoryL1A] of array[0..(C2_NET_MAX)-1] of Message;
      NET_ndr_directoryL1A: array[OBJSET_directoryL1A] of array[0..(C2_NET_MAX)-1] of Message;
      NET_bisnp_directoryL1A: array[OBJSET_directoryL1A] of array[0..(C2_NET_MAX)-1] of Message;
      NET_resp_directoryL1A: array[OBJSET_directoryL1A] of array[0..(C1A_NET_MAX)-1] of Message;
      NET_directoryL1A_cnt: array[OBJSET_directoryL1A] of 0..O_NET_MAX;
      NET_birsp_directoryL2: array[OBJSET_directoryL2] of array[0..(C2_NET_MAX)-1] of Message;
      NET_drs_directoryL2: array[OBJSET_directoryL2] of array[0..(C2_NET_MAX)-1] of Message;
      NET_rwd_directoryL2: array[OBJSET_directoryL2] of array[0..(C2_NET_MAX)-1] of Message;
      NET_req2_directoryL2: array[OBJSET_directoryL2] of array[0..(C2_NET_MAX)-1] of Message;
      NET_ndr_directoryL2: array[OBJSET_directoryL2] of array[0..(C2_NET_MAX)-1] of Message;
      NET_bisnp_directoryL2: array[OBJSET_directoryL2] of array[0..(C2_NET_MAX)-1] of Message;
      NET_directoryL2_cnt: array[OBJSET_directoryL2] of 0..O_NET_MAX;
      NET_fwd_directoryL1B: array[OBJSET_directoryL1B] of array[0..1-1] of Message;
      NET_req_directoryL1B: array[OBJSET_directoryL1B] of array[0..(C1B_NET_MAX)-1] of Message;
      NET_birsp_directoryL1B: array[OBJSET_directoryL1B] of array[0..(C2_NET_MAX)-1] of Message;
      NET_drs_directoryL1B: array[OBJSET_directoryL1B] of array[0..(C2_NET_MAX)-1] of Message;
      NET_rwd_directoryL1B: array[OBJSET_directoryL1B] of array[0..(C2_NET_MAX)-1] of Message;
      NET_req2_directoryL1B: array[OBJSET_directoryL1B] of array[0..(C2_NET_MAX)-1] of Message;
      NET_ndr_directoryL1B: array[OBJSET_directoryL1B] of array[0..(C2_NET_MAX)-1] of Message;
      NET_bisnp_directoryL1B: array[OBJSET_directoryL1B] of array[0..(C2_NET_MAX)-1] of Message;
      NET_resp_directoryL1B: array[OBJSET_directoryL1B] of array[0..(C1B_NET_MAX)-1] of Message;
      NET_directoryL1B_cnt: array[OBJSET_directoryL1B] of 0..O_NET_MAX;
      NET_fwd_cacheL1B: array[OBJSET_cacheL1B] of array[0..(C1B_NET_MAX)-1] of Message;
      NET_resp_cacheL1B: array[OBJSET_cacheL1B] of array[0..(C1B_NET_MAX)-1] of Message;
      NET_cacheL1B_cnt: array[OBJSET_cacheL1B] of 0..O_NET_MAX;
    
    ----Backend/Murphi/MurphiModular/Types/GenMachines
      
      ENTRY_cacheL1B: record
        State: s_cacheL1B;
        cl: ClValue;
      end;
      
      EVENT_ENTRY_cacheL1B: record
          evt_type: e_cacheL1B;
          evt_adr: Address;
      end;
      
      EVENT_cacheL1B: record
          event_queue: array[0..ADR_COUNT] of EVENT_ENTRY_cacheL1B;
          event_queue_index: 0..ADR_COUNT+1;
          pend_adr: array[Address] of boolean;
          event_lock_adr: Address;
      
      end;
      
      MACH_cacheL1B: record
        cb: array[Address] of ENTRY_cacheL1B;
        evt: EVENT_cacheL1B;
      end;
      
      OBJ_cacheL1B: array[OBJSET_cacheL1B] of MACH_cacheL1B;
      
      ENTRY_directoryL1B: record
        State: s_directoryL1B;
        cl: ClValue;
        proxy_msgL1B: Message;
        proxy_msgL2: Message;
      end;
      
      EVENT_ENTRY_directoryL1B: record
          evt_type: e_directoryL1B;
          evt_adr: Address;
      end;
      
      EVENT_directoryL1B: record
          event_queue: array[0..ADR_COUNT] of EVENT_ENTRY_directoryL1B;
          event_queue_index: 0..ADR_COUNT+1;
          pend_adr: array[Address] of boolean;
          event_lock_adr: Address;
      
      end;
      
      MACH_directoryL1B: record
        cb: array[Address] of ENTRY_directoryL1B;
        evt: EVENT_directoryL1B;
      end;
      
      OBJ_directoryL1B: array[OBJSET_directoryL1B] of MACH_directoryL1B;
      v_cacheL1A: record
        cacheL1A: array[OBJSET_cacheL1A] of boolean;
        directoryL2: array[OBJSET_directoryL2] of boolean;
        directoryL1B: array[OBJSET_directoryL1B] of boolean;
        cacheL1B: array[OBJSET_cacheL1B] of boolean;
      end;
      cnt_v_cacheL1A: 0..NrCachesL1A;
      
      ENTRY_directoryL1A: record
        State: s_directoryL1A;
        cl: ClValue;
        cacheL1A: v_cacheL1A;
        ownerL1A: Machines;
        acksReceivedL1A: 0..NrCachesL1A;
        acksExpectedL1A: 0..NrCachesL1A;
        proxy_msgL1A: Message;
        proxy_msgL2: Message;
      end;
      
      MACH_directoryL1A: record
        cb: array[Address] of ENTRY_directoryL1A;
      end;
      
      OBJ_directoryL1A: array[OBJSET_directoryL1A] of MACH_directoryL1A;
      v_cacheL2: record
        cacheL1A: array[OBJSET_cacheL1A] of boolean;
        directoryL1A: array[OBJSET_directoryL1A] of boolean;
        directoryL1B: array[OBJSET_directoryL1B] of boolean;
        cacheL1B: array[OBJSET_cacheL1B] of boolean;
      end;
      cnt_v_cacheL2: 0..NrCachesL2;
      
      ENTRY_directoryL2: record
        State: s_directoryL2;
        cl: ClValue;
        cacheL2: v_cacheL2;
        ownerL2: Machines;
        requestorL2: Machines;
      end;
      
      MACH_directoryL2: record
        cb: array[Address] of ENTRY_directoryL2;
      end;
      
      OBJ_directoryL2: array[OBJSET_directoryL2] of MACH_directoryL2;
      
      ENTRY_cacheL1A: record
        State: s_cacheL1A;
        cl: ClValue;
        acksReceivedL1A: 0..NrCachesL1A;
        acksExpectedL1A: 0..NrCachesL1A;
      end;
      
      MACH_cacheL1A: record
        cb: array[Address] of ENTRY_cacheL1A;
      end;
      
      OBJ_cacheL1A: array[OBJSET_cacheL1A] of MACH_cacheL1A;
    

  var
    --Backend/Murphi/MurphiModular/GenVars
      resp_cacheL1A: NET_resp_cacheL1A;
      cnt_resp_cacheL1A: NET_cacheL1A_cnt;
      fwd_cacheL1A: NET_fwd_cacheL1A;
      cnt_fwd_cacheL1A: NET_cacheL1A_cnt;
    
      resp_directoryL1A: NET_resp_directoryL1A;
      cnt_resp_directoryL1A: NET_directoryL1A_cnt;
      req_directoryL1A: NET_req_directoryL1A;
      cnt_req_directoryL1A: NET_directoryL1A_cnt;
      fwd_directoryL1A: NET_fwd_directoryL1A;
      cnt_fwd_directoryL1A: NET_directoryL1A_cnt;
      bisnp_directoryL1A: NET_bisnp_directoryL1A;
      cnt_bisnp_directoryL1A: NET_directoryL1A_cnt;
      req2_directoryL1A: NET_req2_directoryL1A;
      cnt_req2_directoryL1A: NET_directoryL1A_cnt;
      rwd_directoryL1A: NET_rwd_directoryL1A;
      cnt_rwd_directoryL1A: NET_directoryL1A_cnt;
      birsp_directoryL1A: NET_birsp_directoryL1A;
      cnt_birsp_directoryL1A: NET_directoryL1A_cnt;
      drs_directoryL1A: NET_drs_directoryL1A;
      cnt_drs_directoryL1A: NET_directoryL1A_cnt;
      ndr_directoryL1A: NET_ndr_directoryL1A;
      cnt_ndr_directoryL1A: NET_directoryL1A_cnt;
    
      bisnp_directoryL2: NET_bisnp_directoryL2;
      cnt_bisnp_directoryL2: NET_directoryL2_cnt;
      req2_directoryL2: NET_req2_directoryL2;
      cnt_req2_directoryL2: NET_directoryL2_cnt;
      rwd_directoryL2: NET_rwd_directoryL2;
      cnt_rwd_directoryL2: NET_directoryL2_cnt;
      birsp_directoryL2: NET_birsp_directoryL2;
      cnt_birsp_directoryL2: NET_directoryL2_cnt;
      drs_directoryL2: NET_drs_directoryL2;
      cnt_drs_directoryL2: NET_directoryL2_cnt;
      ndr_directoryL2: NET_ndr_directoryL2;
      cnt_ndr_directoryL2: NET_directoryL2_cnt;
    
      resp_directoryL1B: NET_resp_directoryL1B;
      cnt_resp_directoryL1B: NET_directoryL1B_cnt;
      req_directoryL1B: NET_req_directoryL1B;
      cnt_req_directoryL1B: NET_directoryL1B_cnt;
      fwd_directoryL1B: NET_fwd_directoryL1B;
      cnt_fwd_directoryL1B: NET_directoryL1B_cnt;
      bisnp_directoryL1B: NET_bisnp_directoryL1B;
      cnt_bisnp_directoryL1B: NET_directoryL1B_cnt;
      req2_directoryL1B: NET_req2_directoryL1B;
      cnt_req2_directoryL1B: NET_directoryL1B_cnt;
      rwd_directoryL1B: NET_rwd_directoryL1B;
      cnt_rwd_directoryL1B: NET_directoryL1B_cnt;
      birsp_directoryL1B: NET_birsp_directoryL1B;
      cnt_birsp_directoryL1B: NET_directoryL1B_cnt;
      drs_directoryL1B: NET_drs_directoryL1B;
      cnt_drs_directoryL1B: NET_directoryL1B_cnt;
      ndr_directoryL1B: NET_ndr_directoryL1B;
      cnt_ndr_directoryL1B: NET_directoryL1B_cnt;
    
      resp_cacheL1B: NET_resp_cacheL1B;
      cnt_resp_cacheL1B: NET_cacheL1B_cnt;
      fwd_cacheL1B: NET_fwd_cacheL1B;
      cnt_fwd_cacheL1B: NET_cacheL1B_cnt;
    
    
    
      g_perm: PermMonitor;
      i_cacheL1B: OBJ_cacheL1B;
      i_directoryL1B: OBJ_directoryL1B;
      i_directoryL1A: OBJ_directoryL1A;
      i_directoryL2: OBJ_directoryL2;
      i_cacheL1A: OBJ_cacheL1A;
  
--Backend/Murphi/MurphiModular/GenFunctions

  ----Backend/Murphi/MurphiModular/Functions/GenTypeFunc
    function to_m_cacheL1A(o: OBJSET_cacheL1A) : Machines;
    var m: Machines;
    begin
      undefine m;
      m.cacheL1A := o;
      return m;
    end
    
    function from_m_cacheL1A(m: Machines) : OBJSET_cacheL1A;
    begin
      return m.cacheL1A;
    end
    
    function to_m_directoryL1A(o: OBJSET_directoryL1A) : Machines;
    var m: Machines;
    begin
      undefine m;
      m.directoryL1A := o;
      return m;
    end
    
    function from_m_directoryL1A(m: Machines) : OBJSET_directoryL1A;
    begin
      return m.directoryL1A;
    end
    
    function to_m_directoryL2(o: OBJSET_directoryL2) : Machines;
    var m: Machines;
    begin
      undefine m;
      m.directoryL2 := o;
      return m;
    end
    
    function from_m_directoryL2(m: Machines) : OBJSET_directoryL2;
    begin
      return m.directoryL2;
    end
    
    function to_m_directoryL1B(o: OBJSET_directoryL1B) : Machines;
    var m: Machines;
    begin
      undefine m;
      m.directoryL1B := o;
      return m;
    end
    
    function from_m_directoryL1B(m: Machines) : OBJSET_directoryL1B;
    begin
      return m.directoryL1B;
    end
    
    function to_m_cacheL1B(o: OBJSET_cacheL1B) : Machines;
    var m: Machines;
    begin
      undefine m;
      m.cacheL1B := o;
      return m;
    end
    
    function from_m_cacheL1B(m: Machines) : OBJSET_cacheL1B;
    begin
      return m.cacheL1B;
    end
    
  ----Backend/Murphi/MurphiModular/Functions/GenEventFunc
    procedure NextEvent_directoryL1B(m: OBJSET_directoryL1B);
    begin
      alias evt_entry: i_directoryL1B[m].evt do
      alias evt_index: evt_entry.event_queue_index do
      alias pend_adr: evt_entry.pend_adr do
    
        if isundefined(evt_entry.event_queue[0].evt_type) then
            return;
        endif;
    
        for adr: Address do
          if pend_adr[adr] then
            return;
          endif;
        endfor;
        
        if evt_entry.event_queue_index > 0 then
          for a: Address do
            if a != evt_entry.event_queue[0].evt_adr then
              pend_adr[a] := true;
            endif;
          endfor;
        endif;
        
      endalias;
      endalias;
      endalias;
    end;
    
    procedure PopEvent_directoryL1B(m: OBJSET_directoryL1B);
    begin
      alias evt_entry: i_directoryL1B[m].evt do
      alias evt_index: evt_entry.event_queue_index do
    
        for i := 0 to evt_index-1 do
          if i < evt_index-1 then
            evt_entry.event_queue[i] := evt_entry.event_queue[i+1];
          else
            undefine evt_entry.event_queue[i];
          endif;
        endfor;
    
        evt_index := evt_index - 1;
    
      endalias;
      endalias;
    end;
    
    procedure ResetEvent_directoryL1B();
    begin
      for m: OBJSET_directoryL1B do
        alias evt_entry: i_directoryL1B[m].evt do
          undefine evt_entry.event_queue;
          evt_entry.event_queue_index := 0;
          undefine evt_entry.pend_adr;
          for adr: Address do
            evt_entry.pend_adr[adr] := false;
          endfor;
          undefine evt_entry.event_lock_adr
        endalias;
      endfor;
    end;
    
    procedure IssueEvent_directoryL1B(evt_type: e_directoryL1B; machine: Machines; adr: Address);
    begin
      alias m : from_m_directoryL1B(machine) do
      alias evt_entry: i_directoryL1B[m].evt do
      alias evt_index: evt_entry.event_queue_index do
    
        evt_entry.event_queue[evt_index].evt_type := evt_type;
        evt_entry.event_queue[evt_index].evt_adr := adr;
        evt_index := evt_index + 1;
    
        NextEvent_directoryL1B(m);
    
      endalias;
      endalias;
      endalias;
    end;
    
    /* Event: Checks if the currently pending event has been served*/
    function CheckRemoteEvent_directoryL1B(cur_evt_type: e_directoryL1B; m: OBJSET_directoryL1B; adr: Address): boolean;
    begin
      alias evt_entry: i_directoryL1B[m].evt do
      alias pend_adr: i_directoryL1B[m].evt.pend_adr do
    
        if isundefined(evt_entry.event_queue[0].evt_type) then
            return false;
        endif;
    
        /* Check if the event type matches and the event still need to be served for this address */
        if evt_entry.event_queue[0].evt_type = cur_evt_type & pend_adr[adr] then
            return true;
        endif;
    
        return false;
    
      endalias;
      endalias;
    end;
    
    procedure ServeRemoteEvent_directoryL1B(cur_evt_type: e_directoryL1B; machine: Machines; adr: Address);
    begin
      alias m : from_m_directoryL1B(machine) do
      alias evt_entry: i_directoryL1B[m].evt do
      alias pend_adr: i_directoryL1B[m].evt.pend_adr do
    
        /* Check if the event type matches and the event still need to be served for this address */
        if evt_entry.event_queue[0].evt_type = cur_evt_type & pend_adr[adr] then
            pend_adr[adr] := false;
        endif;
    
      endalias;
      endalias;
      endalias;
    end;
    
    /* Event Ack: Checks if the currently pending event has been served by all addresses */
    function CheckInitEvent_directoryL1B(cur_evt_type: e_directoryL1B; m: OBJSET_directoryL1B; adr: Address): boolean;
    begin
      alias evt_entry: i_directoryL1B[m].evt do
      alias pend_adr: i_directoryL1B[m].evt.pend_adr do
    
        if isundefined(evt_entry.event_queue[0].evt_type) then
            return false;
        endif;
    
        for adr: Address do
          if pend_adr[adr] then
            return false;
          endif;
        endfor;
    
        return evt_entry.event_queue[0].evt_type = cur_evt_type;
    
      endalias;
      endalias;
    end;
    
    procedure ServeInitEvent_directoryL1B(cur_evt_type: e_directoryL1B; m: OBJSET_directoryL1B; adr: Address);
    begin
      alias evt_entry: i_directoryL1B[m].evt do
      alias pend_adr: i_directoryL1B[m].evt.pend_adr do
    
        for adr: Address do
          if pend_adr[adr] then
            return;
          endif;
        endfor;
        if evt_entry.event_queue[0].evt_type = cur_evt_type then
            PopEvent_directoryL1B(m);
            NextEvent_directoryL1B(m);
        endif;
    
      endalias;
      endalias;
    end;
    
    function TestAtomicEvent_directoryL1B(m: OBJSET_directoryL1B): boolean;
    begin
        if isundefined(i_directoryL1B[m].evt.event_lock_adr) then
            return true;
        else
            return false;
        endif;
    end;
    
    procedure LockAtomicEvent_directoryL1B(m: OBJSET_directoryL1B; adr: Address);
    begin
      i_directoryL1B[m].evt.event_lock_adr := adr;
    end;
    
    procedure UnlockAtomicEvent_directoryL1B(m: OBJSET_directoryL1B; adr: Address);
    begin
        if !isundefined(i_directoryL1B[m].evt.event_lock_adr) then
            if i_directoryL1B[m].evt.event_lock_adr = adr then
                undefine i_directoryL1B[m].evt.event_lock_adr;
            endif;
        endif;
    end;
    
    procedure NextEvent_cacheL1B(m: OBJSET_cacheL1B);
    begin
      alias evt_entry: i_cacheL1B[m].evt do
      alias evt_index: evt_entry.event_queue_index do
      alias pend_adr: evt_entry.pend_adr do
    
        if isundefined(evt_entry.event_queue[0].evt_type) then
            return;
        endif;
    
        for adr: Address do
          if pend_adr[adr] then
            return;
          endif;
        endfor;
        
        if evt_entry.event_queue_index > 0 then
          for a: Address do
            if a != evt_entry.event_queue[0].evt_adr then
              pend_adr[a] := true;
            endif;
          endfor;
        endif;
        
      endalias;
      endalias;
      endalias;
    end;
    
    procedure PopEvent_cacheL1B(m: OBJSET_cacheL1B);
    begin
      alias evt_entry: i_cacheL1B[m].evt do
      alias evt_index: evt_entry.event_queue_index do
    
        for i := 0 to evt_index-1 do
          if i < evt_index-1 then
            evt_entry.event_queue[i] := evt_entry.event_queue[i+1];
          else
            undefine evt_entry.event_queue[i];
          endif;
        endfor;
    
        evt_index := evt_index - 1;
    
      endalias;
      endalias;
    end;
    
    procedure ResetEvent_cacheL1B();
    begin
      for m: OBJSET_cacheL1B do
        alias evt_entry: i_cacheL1B[m].evt do
          undefine evt_entry.event_queue;
          evt_entry.event_queue_index := 0;
          undefine evt_entry.pend_adr;
          for adr: Address do
            evt_entry.pend_adr[adr] := false;
          endfor;
          undefine evt_entry.event_lock_adr
        endalias;
      endfor;
    end;
    
    procedure IssueEvent_cacheL1B(evt_type: e_cacheL1B; machine: Machines; adr: Address);
    begin
      alias m : from_m_cacheL1B(machine) do
      alias evt_entry: i_cacheL1B[m].evt do
      alias evt_index: evt_entry.event_queue_index do
    
        evt_entry.event_queue[evt_index].evt_type := evt_type;
        evt_entry.event_queue[evt_index].evt_adr := adr;
        evt_index := evt_index + 1;
    
        NextEvent_cacheL1B(m);
    
      endalias;
      endalias;
      endalias;
    end;
    
    /* Event: Checks if the currently pending event has been served*/
    function CheckRemoteEvent_cacheL1B(cur_evt_type: e_cacheL1B; m: OBJSET_cacheL1B; adr: Address): boolean;
    begin
      alias evt_entry: i_cacheL1B[m].evt do
      alias pend_adr: i_cacheL1B[m].evt.pend_adr do
    
        if isundefined(evt_entry.event_queue[0].evt_type) then
            return false;
        endif;
    
        /* Check if the event type matches and the event still need to be served for this address */
        if evt_entry.event_queue[0].evt_type = cur_evt_type & pend_adr[adr] then
            return true;
        endif;
    
        return false;
    
      endalias;
      endalias;
    end;
    
    procedure ServeRemoteEvent_cacheL1B(cur_evt_type: e_cacheL1B; machine: Machines; adr: Address);
    begin
      alias m : from_m_cacheL1B(machine) do
      alias evt_entry: i_cacheL1B[m].evt do
      alias pend_adr: i_cacheL1B[m].evt.pend_adr do
    
        /* Check if the event type matches and the event still need to be served for this address */
        if evt_entry.event_queue[0].evt_type = cur_evt_type & pend_adr[adr] then
            pend_adr[adr] := false;
        endif;
    
      endalias;
      endalias;
      endalias;
    end;
    
    /* Event Ack: Checks if the currently pending event has been served by all addresses */
    function CheckInitEvent_cacheL1B(cur_evt_type: e_cacheL1B; m: OBJSET_cacheL1B; adr: Address): boolean;
    begin
      alias evt_entry: i_cacheL1B[m].evt do
      alias pend_adr: i_cacheL1B[m].evt.pend_adr do
    
        if isundefined(evt_entry.event_queue[0].evt_type) then
            return false;
        endif;
    
        for adr: Address do
          if pend_adr[adr] then
            return false;
          endif;
        endfor;
    
        return evt_entry.event_queue[0].evt_type = cur_evt_type;
    
      endalias;
      endalias;
    end;
    
    procedure ServeInitEvent_cacheL1B(cur_evt_type: e_cacheL1B; m: OBJSET_cacheL1B; adr: Address);
    begin
      alias evt_entry: i_cacheL1B[m].evt do
      alias pend_adr: i_cacheL1B[m].evt.pend_adr do
    
        for adr: Address do
          if pend_adr[adr] then
            return;
          endif;
        endfor;
        if evt_entry.event_queue[0].evt_type = cur_evt_type then
            PopEvent_cacheL1B(m);
            NextEvent_cacheL1B(m);
        endif;
    
      endalias;
      endalias;
    end;
    
    function TestAtomicEvent_cacheL1B(m: OBJSET_cacheL1B): boolean;
    begin
        if isundefined(i_cacheL1B[m].evt.event_lock_adr) then
            return true;
        else
            return false;
        endif;
    end;
    
    procedure LockAtomicEvent_cacheL1B(m: OBJSET_cacheL1B; adr: Address);
    begin
      i_cacheL1B[m].evt.event_lock_adr := adr;
    end;
    
    procedure UnlockAtomicEvent_cacheL1B(m: OBJSET_cacheL1B; adr: Address);
    begin
        if !isundefined(i_cacheL1B[m].evt.event_lock_adr) then
            if i_cacheL1B[m].evt.event_lock_adr = adr then
                undefine i_cacheL1B[m].evt.event_lock_adr;
            endif;
        endif;
    end;
    
    procedure ResetEvent_();
    begin
      ResetEvent_directoryL1B();
      ResetEvent_cacheL1B();
    
    end;
  ----Backend/Murphi/MurphiModular/Functions/GenPermFunc
    procedure Clear_perm(adr: Address; m: Machines);
    begin
      for acc : PermissionType do
        if !isundefined(m.cacheL1A) then
          g_perm.cacheL1A[m.cacheL1A][adr][acc] := false;
        endif;
        if !isundefined(m.cacheL1B) then
          g_perm.cacheL1B[m.cacheL1B][adr][acc] := false;
        endif;
    
      endfor;
    end;
    
    procedure Set_perm(acc: PermissionType; adr: Address; m: Machines);
    begin
      if !isundefined(m.cacheL1A) then
        g_perm.cacheL1A[m.cacheL1A][adr][acc] := true;
      endif;
      if !isundefined(m.cacheL1B) then
        g_perm.cacheL1B[m.cacheL1B][adr][acc] := true;
      endif;
    
    end;
    
    procedure Reset_perm();
    begin
      for acc : PermissionType do
        for adr : Address do
          for o : OBJSET_cacheL1A do
            g_perm.cacheL1A[o][adr][acc] := false;
          endfor;
          for o : OBJSET_cacheL1B do
            g_perm.cacheL1B[o][adr][acc] := false;
          endfor;
    
        endfor;
      endfor;
    end;
    
  
    function live_cacheL1A(adr: Address; acc: PermissionType): boolean
    begin
      for n : OBJSET_cacheL1A do
        if g_perm.cacheL1A[n][adr][acc] then
          return true;
        endif;
      endfor;
    
      return false;
    end;
  
    function live_cacheL1B(adr: Address; acc: PermissionType): boolean
    begin
      for n : OBJSET_cacheL1B do
        if g_perm.cacheL1B[n][adr][acc] then
          return true;
        endif;
      endfor;
    
      return false;
    end;
  
  ----Backend/Murphi/MurphiModular/Functions/GenVectorFunc
    -- .add()
    procedure AddElement_cacheL1A(var sv:v_cacheL1A; n:Machines);
    begin
      if !isundefined(n.directoryL1B) then
        sv.directoryL1B[n.directoryL1B] := true;
      endif;
      if !isundefined(n.directoryL2) then
        sv.directoryL2[n.directoryL2] := true;
      endif;
      if !isundefined(n.cacheL1B) then
        sv.cacheL1B[n.cacheL1B] := true;
      endif;
      if !isundefined(n.cacheL1A) then
        sv.cacheL1A[n.cacheL1A] := true;
      endif;
    
    end;
    
    -- .del()
    procedure RemoveElement_cacheL1A(var sv:v_cacheL1A; n:Machines);
    begin
      if !isundefined(n.directoryL1B) then
        sv.directoryL1B[n.directoryL1B] := false;
      endif;
      if !isundefined(n.directoryL2) then
        sv.directoryL2[n.directoryL2] := false;
      endif;
      if !isundefined(n.cacheL1B) then
        sv.cacheL1B[n.cacheL1B] := false;
      endif;
      if !isundefined(n.cacheL1A) then
        sv.cacheL1A[n.cacheL1A] := false;
      endif;
    
    end;
    
    -- .clear()
    procedure ClearVector_cacheL1A(var sv:v_cacheL1A;);
    begin
      for m : OBJSET_directoryL1B do
        sv.directoryL1B[m] := false;
      endfor;
      for m : OBJSET_directoryL2 do
        sv.directoryL2[m] := false;
      endfor;
      for m : OBJSET_cacheL1B do
        sv.cacheL1B[m] := false;
      endfor;
      for m : OBJSET_cacheL1A do
        sv.cacheL1A[m] := false;
      endfor;
    
    end;
    
    -- .contains()
    function IsElement_cacheL1A(sv:v_cacheL1A; n:Machines) : boolean;
    begin
      if !isundefined(n.directoryL1B) then
        return sv.directoryL1B[n.directoryL1B];
      endif;
      if !isundefined(n.directoryL2) then
        return sv.directoryL2[n.directoryL2];
      endif;
      if !isundefined(n.cacheL1B) then
        return sv.cacheL1B[n.cacheL1B];
      endif;
      if !isundefined(n.cacheL1A) then
        return sv.cacheL1A[n.cacheL1A];
      endif;
    
      return false;
    end;
    
    -- .count()
    function VectorCount_cacheL1A(sv:v_cacheL1A) : cnt_v_cacheL1A;
    var cnt : cnt_v_cacheL1A;
    begin
      cnt := 0;
      for m : OBJSET_directoryL1B do
        if sv.directoryL1B[m] then
          cnt := cnt + 1;
        endif;
      endfor;
      for m : OBJSET_directoryL2 do
        if sv.directoryL2[m] then
          cnt := cnt + 1;
        endif;
      endfor;
      for m : OBJSET_cacheL1B do
        if sv.cacheL1B[m] then
          cnt := cnt + 1;
        endif;
      endfor;
      for m : OBJSET_cacheL1A do
        if sv.cacheL1A[m] then
          cnt := cnt + 1;
        endif;
      endfor;
    
      return cnt;
    end;
    
    -- .empty()
    function HasElement_cacheL1A(sv:v_cacheL1A) : boolean;
    begin
        return VectorCount_cacheL1A(sv) > 0;
    end;
    
    
    -- .add()
    procedure AddElement_cacheL2(var sv:v_cacheL2; n:Machines);
    begin
      if !isundefined(n.directoryL1B) then
        sv.directoryL1B[n.directoryL1B] := true;
      endif;
      if !isundefined(n.directoryL1A) then
        sv.directoryL1A[n.directoryL1A] := true;
      endif;
      if !isundefined(n.cacheL1B) then
        sv.cacheL1B[n.cacheL1B] := true;
      endif;
      if !isundefined(n.cacheL1A) then
        sv.cacheL1A[n.cacheL1A] := true;
      endif;
    
    end;
    
    -- .del()
    procedure RemoveElement_cacheL2(var sv:v_cacheL2; n:Machines);
    begin
      if !isundefined(n.directoryL1B) then
        sv.directoryL1B[n.directoryL1B] := false;
      endif;
      if !isundefined(n.directoryL1A) then
        sv.directoryL1A[n.directoryL1A] := false;
      endif;
      if !isundefined(n.cacheL1B) then
        sv.cacheL1B[n.cacheL1B] := false;
      endif;
      if !isundefined(n.cacheL1A) then
        sv.cacheL1A[n.cacheL1A] := false;
      endif;
    
    end;
    
    -- .clear()
    procedure ClearVector_cacheL2(var sv:v_cacheL2;);
    begin
      for m : OBJSET_directoryL1B do
        sv.directoryL1B[m] := false;
      endfor;
      for m : OBJSET_directoryL1A do
        sv.directoryL1A[m] := false;
      endfor;
      for m : OBJSET_cacheL1B do
        sv.cacheL1B[m] := false;
      endfor;
      for m : OBJSET_cacheL1A do
        sv.cacheL1A[m] := false;
      endfor;
    
    end;
    
    -- .contains()
    function IsElement_cacheL2(sv:v_cacheL2; n:Machines) : boolean;
    begin
      if !isundefined(n.directoryL1B) then
        return sv.directoryL1B[n.directoryL1B];
      endif;
      if !isundefined(n.directoryL1A) then
        return sv.directoryL1A[n.directoryL1A];
      endif;
      if !isundefined(n.cacheL1B) then
        return sv.cacheL1B[n.cacheL1B];
      endif;
      if !isundefined(n.cacheL1A) then
        return sv.cacheL1A[n.cacheL1A];
      endif;
    
      return false;
    end;
    
    -- .count()
    function VectorCount_cacheL2(sv:v_cacheL2) : cnt_v_cacheL2;
    var cnt : cnt_v_cacheL2;
    begin
      cnt := 0;
      for m : OBJSET_directoryL1B do
        if sv.directoryL1B[m] then
          cnt := cnt + 1;
        endif;
      endfor;
      for m : OBJSET_directoryL1A do
        if sv.directoryL1A[m] then
          cnt := cnt + 1;
        endif;
      endfor;
      for m : OBJSET_cacheL1B do
        if sv.cacheL1B[m] then
          cnt := cnt + 1;
        endif;
      endfor;
      for m : OBJSET_cacheL1A do
        if sv.cacheL1A[m] then
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
    procedure ResetMachine_cacheL1B();
    begin
      for i:OBJSET_cacheL1B do
        for a:Address do
          i_cacheL1B[i].cb[a].State := cacheL1B_I;
          i_cacheL1B[i].cb[a].cl := 0;
    
        endfor;
      endfor;
    end;
    
    procedure ResetMachine_directoryL1B();
    begin
      for i:OBJSET_directoryL1B do
        for a:Address do
          i_directoryL1B[i].cb[a].State := directoryL1B_V__C__I;
          i_directoryL1B[i].cb[a].cl := 0;
          undefine i_directoryL1B[i].cb[a].proxy_msgL1B;
          undefine i_directoryL1B[i].cb[a].proxy_msgL2;
    
        endfor;
      endfor;
    end;
    
    procedure ResetMachine_directoryL1A();
    begin
      for i:OBJSET_directoryL1A do
        for a:Address do
          i_directoryL1A[i].cb[a].State := directoryL1A_I__C__I;
          i_directoryL1A[i].cb[a].cl := 0;
          ClearVector_cacheL1A(i_directoryL1A[i].cb[a].cacheL1A);
          undefine i_directoryL1A[i].cb[a].ownerL1A;
          undefine i_directoryL1A[i].cb[a].proxy_msgL1A;
          undefine i_directoryL1A[i].cb[a].proxy_msgL2;
          i_directoryL1A[i].cb[a].acksReceivedL1A := 0;
          i_directoryL1A[i].cb[a].acksExpectedL1A := 0;
    
        endfor;
      endfor;
    end;
    
    procedure ResetMachine_directoryL2();
    begin
      for i:OBJSET_directoryL2 do
        for a:Address do
          i_directoryL2[i].cb[a].State := directoryL2_I;
          i_directoryL2[i].cb[a].cl := 0;
          ClearVector_cacheL2(i_directoryL2[i].cb[a].cacheL2);
          undefine i_directoryL2[i].cb[a].ownerL2;
          undefine i_directoryL2[i].cb[a].requestorL2;
    
        endfor;
      endfor;
    end;
    
    procedure ResetMachine_cacheL1A();
    begin
      for i:OBJSET_cacheL1A do
        for a:Address do
          i_cacheL1A[i].cb[a].State := cacheL1A_I;
          i_cacheL1A[i].cb[a].cl := 0;
          i_cacheL1A[i].cb[a].acksReceivedL1A := 0;
          i_cacheL1A[i].cb[a].acksExpectedL1A := 0;
    
        endfor;
      endfor;
    end;
    
      procedure ResetMachine_();
      begin
      ResetMachine_cacheL1B();
      ResetMachine_directoryL1B();
      ResetMachine_directoryL1A();
      ResetMachine_directoryL2();
      ResetMachine_cacheL1A();
      
      end;
  ----Backend/Murphi/MurphiModular/Functions/GenFIFOFunc
  ----Backend/Murphi/MurphiModular/Functions/GenNetworkFunc
    procedure Send_resp(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1A) then
        Assert(cnt_resp_cacheL1A[dst.cacheL1A] < O_NET_MAX) "Too many messages: resp_cacheL1A";
        resp_cacheL1A[dst.cacheL1A][cnt_resp_cacheL1A[dst.cacheL1A]] := msg;
        cnt_resp_cacheL1A[dst.cacheL1A] := cnt_resp_cacheL1A[dst.cacheL1A] + 1;
      elsif !isundefined(dst.directoryL1A) then
        Assert(cnt_resp_directoryL1A[dst.directoryL1A] < O_NET_MAX) "Too many messages: resp_directoryL1A";
        resp_directoryL1A[dst.directoryL1A][cnt_resp_directoryL1A[dst.directoryL1A]] := msg;
        cnt_resp_directoryL1A[dst.directoryL1A] := cnt_resp_directoryL1A[dst.directoryL1A] + 1;
      elsif !isundefined(dst.directoryL2) then
        error "Attempt to send to queue resp_directoryL2, which is not modeled"; 
      elsif !isundefined(dst.directoryL1B) then
        Assert(cnt_resp_directoryL1B[dst.directoryL1B] < O_NET_MAX) "Too many messages: resp_directoryL1B";
        resp_directoryL1B[dst.directoryL1B][cnt_resp_directoryL1B[dst.directoryL1B]] := msg;
        cnt_resp_directoryL1B[dst.directoryL1B] := cnt_resp_directoryL1B[dst.directoryL1B] + 1;
      elsif !isundefined(dst.cacheL1B) then
        Assert(cnt_resp_cacheL1B[dst.cacheL1B] < O_NET_MAX) "Too many messages: resp_cacheL1B";
        resp_cacheL1B[dst.cacheL1B][cnt_resp_cacheL1B[dst.cacheL1B]] := msg;
        cnt_resp_cacheL1B[dst.cacheL1B] := cnt_resp_cacheL1B[dst.cacheL1B] + 1;
      else
        error "unknown send machine";
      endif;
      
      endalias;
    end;
    
    procedure Pop_resp(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1A) then
        Assert (cnt_resp_cacheL1A[dst.cacheL1A] > 0) "Trying to advance empty queue: resp_cacheL1A";
        for i := 0 to cnt_resp_cacheL1A[dst.cacheL1A]-1 do
          if i < cnt_resp_cacheL1A[dst.cacheL1A]-1 then
            resp_cacheL1A[dst.cacheL1A][i] := resp_cacheL1A[dst.cacheL1A][i+1];
          else
            undefine resp_cacheL1A[dst.cacheL1A][i];
          endif;
        endfor;
        cnt_resp_cacheL1A[dst.cacheL1A] := cnt_resp_cacheL1A[dst.cacheL1A] - 1;
      elsif !isundefined(dst.directoryL1A) then
        Assert (cnt_resp_directoryL1A[dst.directoryL1A] > 0) "Trying to advance empty queue: resp_directoryL1A";
        for i := 0 to cnt_resp_directoryL1A[dst.directoryL1A]-1 do
          if i < cnt_resp_directoryL1A[dst.directoryL1A]-1 then
            resp_directoryL1A[dst.directoryL1A][i] := resp_directoryL1A[dst.directoryL1A][i+1];
          else
            undefine resp_directoryL1A[dst.directoryL1A][i];
          endif;
        endfor;
        cnt_resp_directoryL1A[dst.directoryL1A] := cnt_resp_directoryL1A[dst.directoryL1A] - 1;
      elsif !isundefined(dst.directoryL2) then
        error "Attempt to pop from queue resp_directoryL2, which is not modeled"; 
      elsif !isundefined(dst.directoryL1B) then
        Assert (cnt_resp_directoryL1B[dst.directoryL1B] > 0) "Trying to advance empty queue: resp_directoryL1B";
        for i := 0 to cnt_resp_directoryL1B[dst.directoryL1B]-1 do
          if i < cnt_resp_directoryL1B[dst.directoryL1B]-1 then
            resp_directoryL1B[dst.directoryL1B][i] := resp_directoryL1B[dst.directoryL1B][i+1];
          else
            undefine resp_directoryL1B[dst.directoryL1B][i];
          endif;
        endfor;
        cnt_resp_directoryL1B[dst.directoryL1B] := cnt_resp_directoryL1B[dst.directoryL1B] - 1;
      elsif !isundefined(dst.cacheL1B) then
        Assert (cnt_resp_cacheL1B[dst.cacheL1B] > 0) "Trying to advance empty queue: resp_cacheL1B";
        for i := 0 to cnt_resp_cacheL1B[dst.cacheL1B]-1 do
          if i < cnt_resp_cacheL1B[dst.cacheL1B]-1 then
            resp_cacheL1B[dst.cacheL1B][i] := resp_cacheL1B[dst.cacheL1B][i+1];
          else
            undefine resp_cacheL1B[dst.cacheL1B][i];
          endif;
        endfor;
        cnt_resp_cacheL1B[dst.cacheL1B] := cnt_resp_cacheL1B[dst.cacheL1B] - 1;
      else
        error "unknown pop machine";
      endif;
      
    end;
    
    procedure Send_req(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1A) then
        error "Attempt to send to queue req_cacheL1A, which is not modeled"; 
      elsif !isundefined(dst.directoryL1A) then
        Assert(cnt_req_directoryL1A[dst.directoryL1A] < O_NET_MAX) "Too many messages: req_directoryL1A";
        req_directoryL1A[dst.directoryL1A][cnt_req_directoryL1A[dst.directoryL1A]] := msg;
        cnt_req_directoryL1A[dst.directoryL1A] := cnt_req_directoryL1A[dst.directoryL1A] + 1;
      elsif !isundefined(dst.directoryL2) then
        error "Attempt to send to queue req_directoryL2, which is not modeled"; 
      elsif !isundefined(dst.directoryL1B) then
        Assert(cnt_req_directoryL1B[dst.directoryL1B] < O_NET_MAX) "Too many messages: req_directoryL1B";
        req_directoryL1B[dst.directoryL1B][cnt_req_directoryL1B[dst.directoryL1B]] := msg;
        cnt_req_directoryL1B[dst.directoryL1B] := cnt_req_directoryL1B[dst.directoryL1B] + 1;
      elsif !isundefined(dst.cacheL1B) then
        error "Attempt to send to queue req_cacheL1B, which is not modeled"; 
      else
        error "unknown send machine";
      endif;
      
      endalias;
    end;
    
    procedure Pop_req(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1A) then
        error "Attempt to pop from queue req_cacheL1A, which is not modeled"; 
      elsif !isundefined(dst.directoryL1A) then
        Assert (cnt_req_directoryL1A[dst.directoryL1A] > 0) "Trying to advance empty queue: req_directoryL1A";
        for i := 0 to cnt_req_directoryL1A[dst.directoryL1A]-1 do
          if i < cnt_req_directoryL1A[dst.directoryL1A]-1 then
            req_directoryL1A[dst.directoryL1A][i] := req_directoryL1A[dst.directoryL1A][i+1];
          else
            undefine req_directoryL1A[dst.directoryL1A][i];
          endif;
        endfor;
        cnt_req_directoryL1A[dst.directoryL1A] := cnt_req_directoryL1A[dst.directoryL1A] - 1;
      elsif !isundefined(dst.directoryL2) then
        error "Attempt to pop from queue req_directoryL2, which is not modeled"; 
      elsif !isundefined(dst.directoryL1B) then
        Assert (cnt_req_directoryL1B[dst.directoryL1B] > 0) "Trying to advance empty queue: req_directoryL1B";
        for i := 0 to cnt_req_directoryL1B[dst.directoryL1B]-1 do
          if i < cnt_req_directoryL1B[dst.directoryL1B]-1 then
            req_directoryL1B[dst.directoryL1B][i] := req_directoryL1B[dst.directoryL1B][i+1];
          else
            undefine req_directoryL1B[dst.directoryL1B][i];
          endif;
        endfor;
        cnt_req_directoryL1B[dst.directoryL1B] := cnt_req_directoryL1B[dst.directoryL1B] - 1;
      elsif !isundefined(dst.cacheL1B) then
        error "Attempt to pop from queue req_cacheL1B, which is not modeled"; 
      else
        error "unknown pop machine";
      endif;
      
    end;
    
    procedure Send_fwd(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1A) then
        Assert(cnt_fwd_cacheL1A[dst.cacheL1A] < O_NET_MAX) "Too many messages: fwd_cacheL1A";
        fwd_cacheL1A[dst.cacheL1A][cnt_fwd_cacheL1A[dst.cacheL1A]] := msg;
        cnt_fwd_cacheL1A[dst.cacheL1A] := cnt_fwd_cacheL1A[dst.cacheL1A] + 1;
      elsif !isundefined(dst.directoryL1A) then
        Assert(cnt_fwd_directoryL1A[dst.directoryL1A] < O_NET_MAX) "Too many messages: fwd_directoryL1A";
        fwd_directoryL1A[dst.directoryL1A][cnt_fwd_directoryL1A[dst.directoryL1A]] := msg;
        cnt_fwd_directoryL1A[dst.directoryL1A] := cnt_fwd_directoryL1A[dst.directoryL1A] + 1;
      elsif !isundefined(dst.directoryL2) then
        error "Attempt to send to queue fwd_directoryL2, which is not modeled"; 
      elsif !isundefined(dst.directoryL1B) then
        Assert(cnt_fwd_directoryL1B[dst.directoryL1B] < O_NET_MAX) "Too many messages: fwd_directoryL1B";
        fwd_directoryL1B[dst.directoryL1B][cnt_fwd_directoryL1B[dst.directoryL1B]] := msg;
        cnt_fwd_directoryL1B[dst.directoryL1B] := cnt_fwd_directoryL1B[dst.directoryL1B] + 1;
      elsif !isundefined(dst.cacheL1B) then
        Assert(cnt_fwd_cacheL1B[dst.cacheL1B] < O_NET_MAX) "Too many messages: fwd_cacheL1B";
        fwd_cacheL1B[dst.cacheL1B][cnt_fwd_cacheL1B[dst.cacheL1B]] := msg;
        cnt_fwd_cacheL1B[dst.cacheL1B] := cnt_fwd_cacheL1B[dst.cacheL1B] + 1;
      else
        error "unknown send machine";
      endif;
      
      endalias;
    end;
    
    procedure Pop_fwd(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1A) then
        Assert (cnt_fwd_cacheL1A[dst.cacheL1A] > 0) "Trying to advance empty queue: fwd_cacheL1A";
        for i := 0 to cnt_fwd_cacheL1A[dst.cacheL1A]-1 do
          if i < cnt_fwd_cacheL1A[dst.cacheL1A]-1 then
            fwd_cacheL1A[dst.cacheL1A][i] := fwd_cacheL1A[dst.cacheL1A][i+1];
          else
            undefine fwd_cacheL1A[dst.cacheL1A][i];
          endif;
        endfor;
        cnt_fwd_cacheL1A[dst.cacheL1A] := cnt_fwd_cacheL1A[dst.cacheL1A] - 1;
      elsif !isundefined(dst.directoryL1A) then
        Assert (cnt_fwd_directoryL1A[dst.directoryL1A] > 0) "Trying to advance empty queue: fwd_directoryL1A";
        for i := 0 to cnt_fwd_directoryL1A[dst.directoryL1A]-1 do
          if i < cnt_fwd_directoryL1A[dst.directoryL1A]-1 then
            fwd_directoryL1A[dst.directoryL1A][i] := fwd_directoryL1A[dst.directoryL1A][i+1];
          else
            undefine fwd_directoryL1A[dst.directoryL1A][i];
          endif;
        endfor;
        cnt_fwd_directoryL1A[dst.directoryL1A] := cnt_fwd_directoryL1A[dst.directoryL1A] - 1;
      elsif !isundefined(dst.directoryL2) then
        error "Attempt to pop from queue fwd_directoryL2, which is not modeled"; 
      elsif !isundefined(dst.directoryL1B) then
        Assert (cnt_fwd_directoryL1B[dst.directoryL1B] > 0) "Trying to advance empty queue: fwd_directoryL1B";
        for i := 0 to cnt_fwd_directoryL1B[dst.directoryL1B]-1 do
          if i < cnt_fwd_directoryL1B[dst.directoryL1B]-1 then
            fwd_directoryL1B[dst.directoryL1B][i] := fwd_directoryL1B[dst.directoryL1B][i+1];
          else
            undefine fwd_directoryL1B[dst.directoryL1B][i];
          endif;
        endfor;
        cnt_fwd_directoryL1B[dst.directoryL1B] := cnt_fwd_directoryL1B[dst.directoryL1B] - 1;
      elsif !isundefined(dst.cacheL1B) then
        Assert (cnt_fwd_cacheL1B[dst.cacheL1B] > 0) "Trying to advance empty queue: fwd_cacheL1B";
        for i := 0 to cnt_fwd_cacheL1B[dst.cacheL1B]-1 do
          if i < cnt_fwd_cacheL1B[dst.cacheL1B]-1 then
            fwd_cacheL1B[dst.cacheL1B][i] := fwd_cacheL1B[dst.cacheL1B][i+1];
          else
            undefine fwd_cacheL1B[dst.cacheL1B][i];
          endif;
        endfor;
        cnt_fwd_cacheL1B[dst.cacheL1B] := cnt_fwd_cacheL1B[dst.cacheL1B] - 1;
      else
        error "unknown pop machine";
      endif;
      
    end;
    
    procedure Send_bisnp(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1A) then
        error "Attempt to send to queue bisnp_cacheL1A, which is not modeled"; 
      elsif !isundefined(dst.directoryL1A) then
        Assert(cnt_bisnp_directoryL1A[dst.directoryL1A] < O_NET_MAX) "Too many messages: bisnp_directoryL1A";
        bisnp_directoryL1A[dst.directoryL1A][cnt_bisnp_directoryL1A[dst.directoryL1A]] := msg;
        cnt_bisnp_directoryL1A[dst.directoryL1A] := cnt_bisnp_directoryL1A[dst.directoryL1A] + 1;
      elsif !isundefined(dst.directoryL2) then
        Assert(cnt_bisnp_directoryL2[dst.directoryL2] < O_NET_MAX) "Too many messages: bisnp_directoryL2";
        bisnp_directoryL2[dst.directoryL2][cnt_bisnp_directoryL2[dst.directoryL2]] := msg;
        cnt_bisnp_directoryL2[dst.directoryL2] := cnt_bisnp_directoryL2[dst.directoryL2] + 1;
      elsif !isundefined(dst.directoryL1B) then
        Assert(cnt_bisnp_directoryL1B[dst.directoryL1B] < O_NET_MAX) "Too many messages: bisnp_directoryL1B";
        bisnp_directoryL1B[dst.directoryL1B][cnt_bisnp_directoryL1B[dst.directoryL1B]] := msg;
        cnt_bisnp_directoryL1B[dst.directoryL1B] := cnt_bisnp_directoryL1B[dst.directoryL1B] + 1;
      elsif !isundefined(dst.cacheL1B) then
        error "Attempt to send to queue bisnp_cacheL1B, which is not modeled"; 
      else
        error "unknown send machine";
      endif;
      
      endalias;
    end;
    
    procedure Pop_bisnp(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1A) then
        error "Attempt to pop from queue bisnp_cacheL1A, which is not modeled"; 
      elsif !isundefined(dst.directoryL1A) then
        Assert (cnt_bisnp_directoryL1A[dst.directoryL1A] > 0) "Trying to advance empty queue: bisnp_directoryL1A";
        for i := 0 to cnt_bisnp_directoryL1A[dst.directoryL1A]-1 do
          if i < cnt_bisnp_directoryL1A[dst.directoryL1A]-1 then
            bisnp_directoryL1A[dst.directoryL1A][i] := bisnp_directoryL1A[dst.directoryL1A][i+1];
          else
            undefine bisnp_directoryL1A[dst.directoryL1A][i];
          endif;
        endfor;
        cnt_bisnp_directoryL1A[dst.directoryL1A] := cnt_bisnp_directoryL1A[dst.directoryL1A] - 1;
      elsif !isundefined(dst.directoryL2) then
        Assert (cnt_bisnp_directoryL2[dst.directoryL2] > 0) "Trying to advance empty queue: bisnp_directoryL2";
        for i := 0 to cnt_bisnp_directoryL2[dst.directoryL2]-1 do
          if i < cnt_bisnp_directoryL2[dst.directoryL2]-1 then
            bisnp_directoryL2[dst.directoryL2][i] := bisnp_directoryL2[dst.directoryL2][i+1];
          else
            undefine bisnp_directoryL2[dst.directoryL2][i];
          endif;
        endfor;
        cnt_bisnp_directoryL2[dst.directoryL2] := cnt_bisnp_directoryL2[dst.directoryL2] - 1;
      elsif !isundefined(dst.directoryL1B) then
        Assert (cnt_bisnp_directoryL1B[dst.directoryL1B] > 0) "Trying to advance empty queue: bisnp_directoryL1B";
        for i := 0 to cnt_bisnp_directoryL1B[dst.directoryL1B]-1 do
          if i < cnt_bisnp_directoryL1B[dst.directoryL1B]-1 then
            bisnp_directoryL1B[dst.directoryL1B][i] := bisnp_directoryL1B[dst.directoryL1B][i+1];
          else
            undefine bisnp_directoryL1B[dst.directoryL1B][i];
          endif;
        endfor;
        cnt_bisnp_directoryL1B[dst.directoryL1B] := cnt_bisnp_directoryL1B[dst.directoryL1B] - 1;
      elsif !isundefined(dst.cacheL1B) then
        error "Attempt to pop from queue bisnp_cacheL1B, which is not modeled"; 
      else
        error "unknown pop machine";
      endif;
      
    end;
    
    procedure Send_req2(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1A) then
        error "Attempt to send to queue req2_cacheL1A, which is not modeled"; 
      elsif !isundefined(dst.directoryL1A) then
        Assert(cnt_req2_directoryL1A[dst.directoryL1A] < O_NET_MAX) "Too many messages: req2_directoryL1A";
        req2_directoryL1A[dst.directoryL1A][cnt_req2_directoryL1A[dst.directoryL1A]] := msg;
        cnt_req2_directoryL1A[dst.directoryL1A] := cnt_req2_directoryL1A[dst.directoryL1A] + 1;
      elsif !isundefined(dst.directoryL2) then
        Assert(cnt_req2_directoryL2[dst.directoryL2] < O_NET_MAX) "Too many messages: req2_directoryL2";
        req2_directoryL2[dst.directoryL2][cnt_req2_directoryL2[dst.directoryL2]] := msg;
        cnt_req2_directoryL2[dst.directoryL2] := cnt_req2_directoryL2[dst.directoryL2] + 1;
      elsif !isundefined(dst.directoryL1B) then
        Assert(cnt_req2_directoryL1B[dst.directoryL1B] < O_NET_MAX) "Too many messages: req2_directoryL1B";
        req2_directoryL1B[dst.directoryL1B][cnt_req2_directoryL1B[dst.directoryL1B]] := msg;
        cnt_req2_directoryL1B[dst.directoryL1B] := cnt_req2_directoryL1B[dst.directoryL1B] + 1;
      elsif !isundefined(dst.cacheL1B) then
        error "Attempt to send to queue req2_cacheL1B, which is not modeled"; 
      else
        error "unknown send machine";
      endif;
      
      endalias;
    end;
    
    procedure Pop_req2(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1A) then
        error "Attempt to pop from queue req2_cacheL1A, which is not modeled"; 
      elsif !isundefined(dst.directoryL1A) then
        Assert (cnt_req2_directoryL1A[dst.directoryL1A] > 0) "Trying to advance empty queue: req2_directoryL1A";
        for i := 0 to cnt_req2_directoryL1A[dst.directoryL1A]-1 do
          if i < cnt_req2_directoryL1A[dst.directoryL1A]-1 then
            req2_directoryL1A[dst.directoryL1A][i] := req2_directoryL1A[dst.directoryL1A][i+1];
          else
            undefine req2_directoryL1A[dst.directoryL1A][i];
          endif;
        endfor;
        cnt_req2_directoryL1A[dst.directoryL1A] := cnt_req2_directoryL1A[dst.directoryL1A] - 1;
      elsif !isundefined(dst.directoryL2) then
        Assert (cnt_req2_directoryL2[dst.directoryL2] > 0) "Trying to advance empty queue: req2_directoryL2";
        for i := 0 to cnt_req2_directoryL2[dst.directoryL2]-1 do
          if i < cnt_req2_directoryL2[dst.directoryL2]-1 then
            req2_directoryL2[dst.directoryL2][i] := req2_directoryL2[dst.directoryL2][i+1];
          else
            undefine req2_directoryL2[dst.directoryL2][i];
          endif;
        endfor;
        cnt_req2_directoryL2[dst.directoryL2] := cnt_req2_directoryL2[dst.directoryL2] - 1;
      elsif !isundefined(dst.directoryL1B) then
        Assert (cnt_req2_directoryL1B[dst.directoryL1B] > 0) "Trying to advance empty queue: req2_directoryL1B";
        for i := 0 to cnt_req2_directoryL1B[dst.directoryL1B]-1 do
          if i < cnt_req2_directoryL1B[dst.directoryL1B]-1 then
            req2_directoryL1B[dst.directoryL1B][i] := req2_directoryL1B[dst.directoryL1B][i+1];
          else
            undefine req2_directoryL1B[dst.directoryL1B][i];
          endif;
        endfor;
        cnt_req2_directoryL1B[dst.directoryL1B] := cnt_req2_directoryL1B[dst.directoryL1B] - 1;
      elsif !isundefined(dst.cacheL1B) then
        error "Attempt to pop from queue req2_cacheL1B, which is not modeled"; 
      else
        error "unknown pop machine";
      endif;
      
    end;
    
    procedure Send_rwd(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1A) then
        error "Attempt to send to queue rwd_cacheL1A, which is not modeled"; 
      elsif !isundefined(dst.directoryL1A) then
        Assert(cnt_rwd_directoryL1A[dst.directoryL1A] < O_NET_MAX) "Too many messages: rwd_directoryL1A";
        rwd_directoryL1A[dst.directoryL1A][cnt_rwd_directoryL1A[dst.directoryL1A]] := msg;
        cnt_rwd_directoryL1A[dst.directoryL1A] := cnt_rwd_directoryL1A[dst.directoryL1A] + 1;
      elsif !isundefined(dst.directoryL2) then
        Assert(cnt_rwd_directoryL2[dst.directoryL2] < O_NET_MAX) "Too many messages: rwd_directoryL2";
        rwd_directoryL2[dst.directoryL2][cnt_rwd_directoryL2[dst.directoryL2]] := msg;
        cnt_rwd_directoryL2[dst.directoryL2] := cnt_rwd_directoryL2[dst.directoryL2] + 1;
      elsif !isundefined(dst.directoryL1B) then
        Assert(cnt_rwd_directoryL1B[dst.directoryL1B] < O_NET_MAX) "Too many messages: rwd_directoryL1B";
        rwd_directoryL1B[dst.directoryL1B][cnt_rwd_directoryL1B[dst.directoryL1B]] := msg;
        cnt_rwd_directoryL1B[dst.directoryL1B] := cnt_rwd_directoryL1B[dst.directoryL1B] + 1;
      elsif !isundefined(dst.cacheL1B) then
        error "Attempt to send to queue rwd_cacheL1B, which is not modeled"; 
      else
        error "unknown send machine";
      endif;
      
      endalias;
    end;
    
    procedure Pop_rwd(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1A) then
        error "Attempt to pop from queue rwd_cacheL1A, which is not modeled"; 
      elsif !isundefined(dst.directoryL1A) then
        Assert (cnt_rwd_directoryL1A[dst.directoryL1A] > 0) "Trying to advance empty queue: rwd_directoryL1A";
        for i := 0 to cnt_rwd_directoryL1A[dst.directoryL1A]-1 do
          if i < cnt_rwd_directoryL1A[dst.directoryL1A]-1 then
            rwd_directoryL1A[dst.directoryL1A][i] := rwd_directoryL1A[dst.directoryL1A][i+1];
          else
            undefine rwd_directoryL1A[dst.directoryL1A][i];
          endif;
        endfor;
        cnt_rwd_directoryL1A[dst.directoryL1A] := cnt_rwd_directoryL1A[dst.directoryL1A] - 1;
      elsif !isundefined(dst.directoryL2) then
        Assert (cnt_rwd_directoryL2[dst.directoryL2] > 0) "Trying to advance empty queue: rwd_directoryL2";
        for i := 0 to cnt_rwd_directoryL2[dst.directoryL2]-1 do
          if i < cnt_rwd_directoryL2[dst.directoryL2]-1 then
            rwd_directoryL2[dst.directoryL2][i] := rwd_directoryL2[dst.directoryL2][i+1];
          else
            undefine rwd_directoryL2[dst.directoryL2][i];
          endif;
        endfor;
        cnt_rwd_directoryL2[dst.directoryL2] := cnt_rwd_directoryL2[dst.directoryL2] - 1;
      elsif !isundefined(dst.directoryL1B) then
        Assert (cnt_rwd_directoryL1B[dst.directoryL1B] > 0) "Trying to advance empty queue: rwd_directoryL1B";
        for i := 0 to cnt_rwd_directoryL1B[dst.directoryL1B]-1 do
          if i < cnt_rwd_directoryL1B[dst.directoryL1B]-1 then
            rwd_directoryL1B[dst.directoryL1B][i] := rwd_directoryL1B[dst.directoryL1B][i+1];
          else
            undefine rwd_directoryL1B[dst.directoryL1B][i];
          endif;
        endfor;
        cnt_rwd_directoryL1B[dst.directoryL1B] := cnt_rwd_directoryL1B[dst.directoryL1B] - 1;
      elsif !isundefined(dst.cacheL1B) then
        error "Attempt to pop from queue rwd_cacheL1B, which is not modeled"; 
      else
        error "unknown pop machine";
      endif;
      
    end;
    
    procedure Send_birsp(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1A) then
        error "Attempt to send to queue birsp_cacheL1A, which is not modeled"; 
      elsif !isundefined(dst.directoryL1A) then
        Assert(cnt_birsp_directoryL1A[dst.directoryL1A] < O_NET_MAX) "Too many messages: birsp_directoryL1A";
        birsp_directoryL1A[dst.directoryL1A][cnt_birsp_directoryL1A[dst.directoryL1A]] := msg;
        cnt_birsp_directoryL1A[dst.directoryL1A] := cnt_birsp_directoryL1A[dst.directoryL1A] + 1;
      elsif !isundefined(dst.directoryL2) then
        Assert(cnt_birsp_directoryL2[dst.directoryL2] < O_NET_MAX) "Too many messages: birsp_directoryL2";
        birsp_directoryL2[dst.directoryL2][cnt_birsp_directoryL2[dst.directoryL2]] := msg;
        cnt_birsp_directoryL2[dst.directoryL2] := cnt_birsp_directoryL2[dst.directoryL2] + 1;
      elsif !isundefined(dst.directoryL1B) then
        Assert(cnt_birsp_directoryL1B[dst.directoryL1B] < O_NET_MAX) "Too many messages: birsp_directoryL1B";
        birsp_directoryL1B[dst.directoryL1B][cnt_birsp_directoryL1B[dst.directoryL1B]] := msg;
        cnt_birsp_directoryL1B[dst.directoryL1B] := cnt_birsp_directoryL1B[dst.directoryL1B] + 1;
      elsif !isundefined(dst.cacheL1B) then
        error "Attempt to send to queue birsp_cacheL1B, which is not modeled"; 
      else
        error "unknown send machine";
      endif;
      
      endalias;
    end;
    
    procedure Pop_birsp(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1A) then
        error "Attempt to pop from queue birsp_cacheL1A, which is not modeled"; 
      elsif !isundefined(dst.directoryL1A) then
        Assert (cnt_birsp_directoryL1A[dst.directoryL1A] > 0) "Trying to advance empty queue: birsp_directoryL1A";
        for i := 0 to cnt_birsp_directoryL1A[dst.directoryL1A]-1 do
          if i < cnt_birsp_directoryL1A[dst.directoryL1A]-1 then
            birsp_directoryL1A[dst.directoryL1A][i] := birsp_directoryL1A[dst.directoryL1A][i+1];
          else
            undefine birsp_directoryL1A[dst.directoryL1A][i];
          endif;
        endfor;
        cnt_birsp_directoryL1A[dst.directoryL1A] := cnt_birsp_directoryL1A[dst.directoryL1A] - 1;
      elsif !isundefined(dst.directoryL2) then
        Assert (cnt_birsp_directoryL2[dst.directoryL2] > 0) "Trying to advance empty queue: birsp_directoryL2";
        for i := 0 to cnt_birsp_directoryL2[dst.directoryL2]-1 do
          if i < cnt_birsp_directoryL2[dst.directoryL2]-1 then
            birsp_directoryL2[dst.directoryL2][i] := birsp_directoryL2[dst.directoryL2][i+1];
          else
            undefine birsp_directoryL2[dst.directoryL2][i];
          endif;
        endfor;
        cnt_birsp_directoryL2[dst.directoryL2] := cnt_birsp_directoryL2[dst.directoryL2] - 1;
      elsif !isundefined(dst.directoryL1B) then
        Assert (cnt_birsp_directoryL1B[dst.directoryL1B] > 0) "Trying to advance empty queue: birsp_directoryL1B";
        for i := 0 to cnt_birsp_directoryL1B[dst.directoryL1B]-1 do
          if i < cnt_birsp_directoryL1B[dst.directoryL1B]-1 then
            birsp_directoryL1B[dst.directoryL1B][i] := birsp_directoryL1B[dst.directoryL1B][i+1];
          else
            undefine birsp_directoryL1B[dst.directoryL1B][i];
          endif;
        endfor;
        cnt_birsp_directoryL1B[dst.directoryL1B] := cnt_birsp_directoryL1B[dst.directoryL1B] - 1;
      elsif !isundefined(dst.cacheL1B) then
        error "Attempt to pop from queue birsp_cacheL1B, which is not modeled"; 
      else
        error "unknown pop machine";
      endif;
      
    end;
    
    procedure Send_drs(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1A) then
        error "Attempt to send to queue drs_cacheL1A, which is not modeled"; 
      elsif !isundefined(dst.directoryL1A) then
        Assert(cnt_drs_directoryL1A[dst.directoryL1A] < O_NET_MAX) "Too many messages: drs_directoryL1A";
        drs_directoryL1A[dst.directoryL1A][cnt_drs_directoryL1A[dst.directoryL1A]] := msg;
        cnt_drs_directoryL1A[dst.directoryL1A] := cnt_drs_directoryL1A[dst.directoryL1A] + 1;
      elsif !isundefined(dst.directoryL2) then
        Assert(cnt_drs_directoryL2[dst.directoryL2] < O_NET_MAX) "Too many messages: drs_directoryL2";
        drs_directoryL2[dst.directoryL2][cnt_drs_directoryL2[dst.directoryL2]] := msg;
        cnt_drs_directoryL2[dst.directoryL2] := cnt_drs_directoryL2[dst.directoryL2] + 1;
      elsif !isundefined(dst.directoryL1B) then
        Assert(cnt_drs_directoryL1B[dst.directoryL1B] < O_NET_MAX) "Too many messages: drs_directoryL1B";
        drs_directoryL1B[dst.directoryL1B][cnt_drs_directoryL1B[dst.directoryL1B]] := msg;
        cnt_drs_directoryL1B[dst.directoryL1B] := cnt_drs_directoryL1B[dst.directoryL1B] + 1;
      elsif !isundefined(dst.cacheL1B) then
        error "Attempt to send to queue drs_cacheL1B, which is not modeled"; 
      else
        error "unknown send machine";
      endif;
      
      endalias;
    end;
    
    procedure Pop_drs(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1A) then
        error "Attempt to pop from queue drs_cacheL1A, which is not modeled"; 
      elsif !isundefined(dst.directoryL1A) then
        Assert (cnt_drs_directoryL1A[dst.directoryL1A] > 0) "Trying to advance empty queue: drs_directoryL1A";
        for i := 0 to cnt_drs_directoryL1A[dst.directoryL1A]-1 do
          if i < cnt_drs_directoryL1A[dst.directoryL1A]-1 then
            drs_directoryL1A[dst.directoryL1A][i] := drs_directoryL1A[dst.directoryL1A][i+1];
          else
            undefine drs_directoryL1A[dst.directoryL1A][i];
          endif;
        endfor;
        cnt_drs_directoryL1A[dst.directoryL1A] := cnt_drs_directoryL1A[dst.directoryL1A] - 1;
      elsif !isundefined(dst.directoryL2) then
        Assert (cnt_drs_directoryL2[dst.directoryL2] > 0) "Trying to advance empty queue: drs_directoryL2";
        for i := 0 to cnt_drs_directoryL2[dst.directoryL2]-1 do
          if i < cnt_drs_directoryL2[dst.directoryL2]-1 then
            drs_directoryL2[dst.directoryL2][i] := drs_directoryL2[dst.directoryL2][i+1];
          else
            undefine drs_directoryL2[dst.directoryL2][i];
          endif;
        endfor;
        cnt_drs_directoryL2[dst.directoryL2] := cnt_drs_directoryL2[dst.directoryL2] - 1;
      elsif !isundefined(dst.directoryL1B) then
        Assert (cnt_drs_directoryL1B[dst.directoryL1B] > 0) "Trying to advance empty queue: drs_directoryL1B";
        for i := 0 to cnt_drs_directoryL1B[dst.directoryL1B]-1 do
          if i < cnt_drs_directoryL1B[dst.directoryL1B]-1 then
            drs_directoryL1B[dst.directoryL1B][i] := drs_directoryL1B[dst.directoryL1B][i+1];
          else
            undefine drs_directoryL1B[dst.directoryL1B][i];
          endif;
        endfor;
        cnt_drs_directoryL1B[dst.directoryL1B] := cnt_drs_directoryL1B[dst.directoryL1B] - 1;
      elsif !isundefined(dst.cacheL1B) then
        error "Attempt to pop from queue drs_cacheL1B, which is not modeled"; 
      else
        error "unknown pop machine";
      endif;
      
    end;
    
    procedure Send_ndr(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1A) then
        error "Attempt to send to queue ndr_cacheL1A, which is not modeled"; 
      elsif !isundefined(dst.directoryL1A) then
        Assert(cnt_ndr_directoryL1A[dst.directoryL1A] < O_NET_MAX) "Too many messages: ndr_directoryL1A";
        ndr_directoryL1A[dst.directoryL1A][cnt_ndr_directoryL1A[dst.directoryL1A]] := msg;
        cnt_ndr_directoryL1A[dst.directoryL1A] := cnt_ndr_directoryL1A[dst.directoryL1A] + 1;
      elsif !isundefined(dst.directoryL2) then
        Assert(cnt_ndr_directoryL2[dst.directoryL2] < O_NET_MAX) "Too many messages: ndr_directoryL2";
        ndr_directoryL2[dst.directoryL2][cnt_ndr_directoryL2[dst.directoryL2]] := msg;
        cnt_ndr_directoryL2[dst.directoryL2] := cnt_ndr_directoryL2[dst.directoryL2] + 1;
      elsif !isundefined(dst.directoryL1B) then
        Assert(cnt_ndr_directoryL1B[dst.directoryL1B] < O_NET_MAX) "Too many messages: ndr_directoryL1B";
        ndr_directoryL1B[dst.directoryL1B][cnt_ndr_directoryL1B[dst.directoryL1B]] := msg;
        cnt_ndr_directoryL1B[dst.directoryL1B] := cnt_ndr_directoryL1B[dst.directoryL1B] + 1;
      elsif !isundefined(dst.cacheL1B) then
        error "Attempt to send to queue ndr_cacheL1B, which is not modeled"; 
      else
        error "unknown send machine";
      endif;
      
      endalias;
    end;
    
    procedure Pop_ndr(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1A) then
        error "Attempt to pop from queue ndr_cacheL1A, which is not modeled"; 
      elsif !isundefined(dst.directoryL1A) then
        Assert (cnt_ndr_directoryL1A[dst.directoryL1A] > 0) "Trying to advance empty queue: ndr_directoryL1A";
        for i := 0 to cnt_ndr_directoryL1A[dst.directoryL1A]-1 do
          if i < cnt_ndr_directoryL1A[dst.directoryL1A]-1 then
            ndr_directoryL1A[dst.directoryL1A][i] := ndr_directoryL1A[dst.directoryL1A][i+1];
          else
            undefine ndr_directoryL1A[dst.directoryL1A][i];
          endif;
        endfor;
        cnt_ndr_directoryL1A[dst.directoryL1A] := cnt_ndr_directoryL1A[dst.directoryL1A] - 1;
      elsif !isundefined(dst.directoryL2) then
        Assert (cnt_ndr_directoryL2[dst.directoryL2] > 0) "Trying to advance empty queue: ndr_directoryL2";
        for i := 0 to cnt_ndr_directoryL2[dst.directoryL2]-1 do
          if i < cnt_ndr_directoryL2[dst.directoryL2]-1 then
            ndr_directoryL2[dst.directoryL2][i] := ndr_directoryL2[dst.directoryL2][i+1];
          else
            undefine ndr_directoryL2[dst.directoryL2][i];
          endif;
        endfor;
        cnt_ndr_directoryL2[dst.directoryL2] := cnt_ndr_directoryL2[dst.directoryL2] - 1;
      elsif !isundefined(dst.directoryL1B) then
        Assert (cnt_ndr_directoryL1B[dst.directoryL1B] > 0) "Trying to advance empty queue: ndr_directoryL1B";
        for i := 0 to cnt_ndr_directoryL1B[dst.directoryL1B]-1 do
          if i < cnt_ndr_directoryL1B[dst.directoryL1B]-1 then
            ndr_directoryL1B[dst.directoryL1B][i] := ndr_directoryL1B[dst.directoryL1B][i+1];
          else
            undefine ndr_directoryL1B[dst.directoryL1B][i];
          endif;
        endfor;
        cnt_ndr_directoryL1B[dst.directoryL1B] := cnt_ndr_directoryL1B[dst.directoryL1B] - 1;
      elsif !isundefined(dst.cacheL1B) then
        error "Attempt to pop from queue ndr_cacheL1B, which is not modeled"; 
      else
        error "unknown pop machine";
      endif;
      
    end;
    
    procedure Multicast_fwd_v_cacheL1A(var msg: Message; dst_vect: v_cacheL1A; src: Machines;);
    begin
      for n : OBJSET_directoryL1B do
        if IsElement_cacheL1A(dst_vect, to_m_directoryL1B(n)) then
          msg.dst := to_m_directoryL1B(n);
          Send_fwd(msg, src);
        endif;
      endfor;
      for n : OBJSET_directoryL2 do
        if IsElement_cacheL1A(dst_vect, to_m_directoryL2(n)) then
          msg.dst := to_m_directoryL2(n);
          Send_fwd(msg, src);
        endif;
      endfor;
      for n : OBJSET_cacheL1B do
        if IsElement_cacheL1A(dst_vect, to_m_cacheL1B(n)) then
          msg.dst := to_m_cacheL1B(n);
          Send_fwd(msg, src);
        endif;
      endfor;
      for n : OBJSET_cacheL1A do
        if IsElement_cacheL1A(dst_vect, to_m_cacheL1A(n)) then
          msg.dst := to_m_cacheL1A(n);
          Send_fwd(msg, src);
        endif;
      endfor;
    
    end;
    
    procedure Multicast_bisnp_v_cacheL2(var msg: Message; dst_vect: v_cacheL2; src: Machines;);
    begin
      for n : OBJSET_directoryL1B do
        if IsElement_cacheL2(dst_vect, to_m_directoryL1B(n)) then
          msg.dst := to_m_directoryL1B(n);
          Send_bisnp(msg, src);
        endif;
      endfor;
      for n : OBJSET_directoryL1A do
        if IsElement_cacheL2(dst_vect, to_m_directoryL1A(n)) then
          msg.dst := to_m_directoryL1A(n);
          Send_bisnp(msg, src);
        endif;
      endfor;
      for n : OBJSET_cacheL1B do
        if IsElement_cacheL2(dst_vect, to_m_cacheL1B(n)) then
          msg.dst := to_m_cacheL1B(n);
          Send_bisnp(msg, src);
        endif;
      endfor;
      for n : OBJSET_cacheL1A do
        if IsElement_cacheL2(dst_vect, to_m_cacheL1A(n)) then
          msg.dst := to_m_cacheL1A(n);
          Send_bisnp(msg, src);
        endif;
      endfor;
    
    end;
    
    function req_network_ready(): boolean;
    begin
      for dst:OBJSET_directoryL1B do
        if cnt_req_directoryL1B[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL1A do
        if cnt_req_directoryL1A[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function rwd_network_ready(): boolean;
    begin
      for dst:OBJSET_directoryL1B do
        if cnt_rwd_directoryL1B[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2 do
        if cnt_rwd_directoryL2[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL1A do
        if cnt_rwd_directoryL1A[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function bisnp_network_ready(): boolean;
    begin
      for dst:OBJSET_directoryL1B do
        if cnt_bisnp_directoryL1B[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2 do
        if cnt_bisnp_directoryL2[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL1A do
        if cnt_bisnp_directoryL1A[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function resp_network_ready(): boolean;
    begin
      for dst:OBJSET_cacheL1A do
        if cnt_resp_cacheL1A[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_cacheL1B do
        if cnt_resp_cacheL1B[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL1B do
        if cnt_resp_directoryL1B[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL1A do
        if cnt_resp_directoryL1A[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function fwd_network_ready(): boolean;
    begin
      for dst:OBJSET_cacheL1A do
        if cnt_fwd_cacheL1A[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_cacheL1B do
        if cnt_fwd_cacheL1B[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL1B do
        if cnt_fwd_directoryL1B[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL1A do
        if cnt_fwd_directoryL1A[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function req2_network_ready(): boolean;
    begin
      for dst:OBJSET_directoryL1B do
        if cnt_req2_directoryL1B[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2 do
        if cnt_req2_directoryL2[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL1A do
        if cnt_req2_directoryL1A[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function birsp_network_ready(): boolean;
    begin
      for dst:OBJSET_directoryL1B do
        if cnt_birsp_directoryL1B[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2 do
        if cnt_birsp_directoryL2[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL1A do
        if cnt_birsp_directoryL1A[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function drs_network_ready(): boolean;
    begin
      for dst:OBJSET_directoryL1B do
        if cnt_drs_directoryL1B[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2 do
        if cnt_drs_directoryL2[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL1A do
        if cnt_drs_directoryL1A[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function ndr_network_ready(): boolean;
    begin
      for dst:OBJSET_directoryL1B do
        if cnt_ndr_directoryL1B[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2 do
        if cnt_ndr_directoryL2[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL1A do
        if cnt_ndr_directoryL1A[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function network_ready(): boolean;
    begin
            if !req_network_ready() then
            return false;
          endif;
    
    
          if !rwd_network_ready() then
            return false;
          endif;
    
    
          if !bisnp_network_ready() then
            return false;
          endif;
    
    
          if !resp_network_ready() then
            return false;
          endif;
    
    
          if !fwd_network_ready() then
            return false;
          endif;
    
    
          if !req2_network_ready() then
            return false;
          endif;
    
    
          if !birsp_network_ready() then
            return false;
          endif;
    
    
          if !drs_network_ready() then
            return false;
          endif;
    
    
          if !ndr_network_ready() then
            return false;
          endif;
    
    
    
      return true;
    end;
    
    procedure Reset_NET_();
    begin
      undefine resp_cacheL1A;
      undefine fwd_cacheL1A;
      for dst:OBJSET_cacheL1A do
        cnt_resp_cacheL1A[dst] := 0;
        cnt_fwd_cacheL1A[dst] := 0;
      endfor;
      
      undefine resp_cacheL1B;
      undefine fwd_cacheL1B;
      for dst:OBJSET_cacheL1B do
        cnt_resp_cacheL1B[dst] := 0;
        cnt_fwd_cacheL1B[dst] := 0;
      endfor;
      
      undefine resp_directoryL1B;
      undefine req_directoryL1B;
      undefine fwd_directoryL1B;
      undefine bisnp_directoryL1B;
      undefine req2_directoryL1B;
      undefine rwd_directoryL1B;
      undefine birsp_directoryL1B;
      undefine drs_directoryL1B;
      undefine ndr_directoryL1B;
      for dst:OBJSET_directoryL1B do
        cnt_resp_directoryL1B[dst] := 0;
        cnt_req_directoryL1B[dst] := 0;
        cnt_fwd_directoryL1B[dst] := 0;
        cnt_bisnp_directoryL1B[dst] := 0;
        cnt_req2_directoryL1B[dst] := 0;
        cnt_rwd_directoryL1B[dst] := 0;
        cnt_birsp_directoryL1B[dst] := 0;
        cnt_drs_directoryL1B[dst] := 0;
        cnt_ndr_directoryL1B[dst] := 0;
      endfor;
      
      undefine bisnp_directoryL2;
      undefine req2_directoryL2;
      undefine rwd_directoryL2;
      undefine birsp_directoryL2;
      undefine drs_directoryL2;
      undefine ndr_directoryL2;
      for dst:OBJSET_directoryL2 do
        cnt_bisnp_directoryL2[dst] := 0;
        cnt_req2_directoryL2[dst] := 0;
        cnt_rwd_directoryL2[dst] := 0;
        cnt_birsp_directoryL2[dst] := 0;
        cnt_drs_directoryL2[dst] := 0;
        cnt_ndr_directoryL2[dst] := 0;
      endfor;
      
      undefine resp_directoryL1A;
      undefine req_directoryL1A;
      undefine fwd_directoryL1A;
      undefine bisnp_directoryL1A;
      undefine req2_directoryL1A;
      undefine rwd_directoryL1A;
      undefine birsp_directoryL1A;
      undefine drs_directoryL1A;
      undefine ndr_directoryL1A;
      for dst:OBJSET_directoryL1A do
        cnt_resp_directoryL1A[dst] := 0;
        cnt_req_directoryL1A[dst] := 0;
        cnt_fwd_directoryL1A[dst] := 0;
        cnt_bisnp_directoryL1A[dst] := 0;
        cnt_req2_directoryL1A[dst] := 0;
        cnt_rwd_directoryL1A[dst] := 0;
        cnt_birsp_directoryL1A[dst] := 0;
        cnt_drs_directoryL1A[dst] := 0;
        cnt_ndr_directoryL1A[dst] := 0;
      endfor;
      
    
    end;
    
  
  ----Backend/Murphi/MurphiModular/Functions/GenMessageConstrFunc
    function RequestL1A(adr: Address; mtype: MessageType; src: Machines; dst: Machines) : Message;
    var Message: Message;
    begin
      Message.adr := adr;
      Message.mtype := mtype;
      Message.src := src;
      Message.dst := dst;
    return Message;
    end;
    
    function AckL1A(adr: Address; mtype: MessageType; src: Machines; dst: Machines) : Message;
    var Message: Message;
    begin
      Message.adr := adr;
      Message.mtype := mtype;
      Message.src := src;
      Message.dst := dst;
    return Message;
    end;
    
    function RespL1A(adr: Address; mtype: MessageType; src: Machines; dst: Machines; cl: ClValue) : Message;
    var Message: Message;
    begin
      Message.adr := adr;
      Message.mtype := mtype;
      Message.src := src;
      Message.dst := dst;
      Message.cl := cl;
    return Message;
    end;
    
    function RespAckL1A(adr: Address; mtype: MessageType; src: Machines; dst: Machines; cl: ClValue; acksExpectedL1A: 0..NrCachesL1A) : Message;
    var Message: Message;
    begin
      Message.adr := adr;
      Message.mtype := mtype;
      Message.src := src;
      Message.dst := dst;
      Message.cl := cl;
      Message.acksExpectedL1A := acksExpectedL1A;
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
    
    function RequestL1B(adr: Address; mtype: MessageType; src: Machines; dst: Machines) : Message;
    var Message: Message;
    begin
      Message.adr := adr;
      Message.mtype := mtype;
      Message.src := src;
      Message.dst := dst;
    return Message;
    end;
    
    function AckL1B(adr: Address; mtype: MessageType; src: Machines; dst: Machines) : Message;
    var Message: Message;
    begin
      Message.adr := adr;
      Message.mtype := mtype;
      Message.src := src;
      Message.dst := dst;
    return Message;
    end;
    
    function RespL1B(adr: Address; mtype: MessageType; src: Machines; dst: Machines; cl: ClValue) : Message;
    var Message: Message;
    begin
      Message.adr := adr;
      Message.mtype := mtype;
      Message.src := src;
      Message.dst := dst;
      Message.cl := cl;
    return Message;
    end;
    
  

--Backend/Murphi/MurphiModular/GenStateMachines

  ----Backend/Murphi/MurphiModular/StateMachines/GenAccessStateMachines
    procedure FSM_Access_cacheL1A_E_evict(adr:Address; mTyped:OBJSET_cacheL1A);
    var msg: Message;
    begin
    alias cbe: i_cacheL1A[mTyped].cb[adr] do
    alias m : to_m_cacheL1A(mTyped) do
      msg := AckL1A(adr,PutEL1A,m,to_m_directoryL1A(directoryL1A));
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1A_E_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1A_E_load(adr:Address; mTyped:OBJSET_cacheL1A);
    begin
    alias cbe: i_cacheL1A[mTyped].cb[adr] do
    alias m : to_m_cacheL1A(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1A_E;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1A_E_store(adr:Address; mTyped:OBJSET_cacheL1A);
    begin
    alias cbe: i_cacheL1A[mTyped].cb[adr] do
    alias m : to_m_cacheL1A(mTyped) do
      Set_perm(store, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1A_M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1A_I_load(adr:Address; mTyped:OBJSET_cacheL1A);
    var msg: Message;
    begin
    alias cbe: i_cacheL1A[mTyped].cb[adr] do
    alias m : to_m_cacheL1A(mTyped) do
      msg := RequestL1A(adr,GetSL1A,m,to_m_directoryL1A(directoryL1A));
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1A_I_load;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1A_I_store(adr:Address; mTyped:OBJSET_cacheL1A);
    var msg: Message;
    begin
    alias cbe: i_cacheL1A[mTyped].cb[adr] do
    alias m : to_m_cacheL1A(mTyped) do
      msg := RequestL1A(adr,GetML1A,m,to_m_directoryL1A(directoryL1A));
      Send_req(msg, m);
      cbe.acksReceivedL1A := 0;
      Clear_perm(adr, m);
      cbe.State := cacheL1A_I_store;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1A_M_evict(adr:Address; mTyped:OBJSET_cacheL1A);
    var msg: Message;
    begin
    alias cbe: i_cacheL1A[mTyped].cb[adr] do
    alias m : to_m_cacheL1A(mTyped) do
      msg := RespL1A(adr,PutML1A,m,to_m_directoryL1A(directoryL1A),cbe.cl);
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1A_M_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1A_M_load(adr:Address; mTyped:OBJSET_cacheL1A);
    begin
    alias cbe: i_cacheL1A[mTyped].cb[adr] do
    alias m : to_m_cacheL1A(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1A_M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1A_M_store(adr:Address; mTyped:OBJSET_cacheL1A);
    begin
    alias cbe: i_cacheL1A[mTyped].cb[adr] do
    alias m : to_m_cacheL1A(mTyped) do
      Set_perm(store, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1A_M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1A_S_evict(adr:Address; mTyped:OBJSET_cacheL1A);
    var msg: Message;
    begin
    alias cbe: i_cacheL1A[mTyped].cb[adr] do
    alias m : to_m_cacheL1A(mTyped) do
      msg := RequestL1A(adr,PutSL1A,m,to_m_directoryL1A(directoryL1A));
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1A_S_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1A_S_load(adr:Address; mTyped:OBJSET_cacheL1A);
    begin
    alias cbe: i_cacheL1A[mTyped].cb[adr] do
    alias m : to_m_cacheL1A(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m);
      cbe.State := cacheL1A_S;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1A_S_store(adr:Address; mTyped:OBJSET_cacheL1A);
    var msg: Message;
    begin
    alias cbe: i_cacheL1A[mTyped].cb[adr] do
    alias m : to_m_cacheL1A(mTyped) do
      msg := RequestL1A(adr,GetML1A,m,to_m_directoryL1A(directoryL1A));
      Send_req(msg, m);
      cbe.acksReceivedL1A := 0;
      Clear_perm(adr, m);
      cbe.State := cacheL1A_S_store;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1A_E__C__M_evict(adr:Address; mTyped:OBJSET_directoryL1A);
    var msg_GetML1A: Message;
    var msg: Message;
    begin
    alias cbe: i_directoryL1A[mTyped].cb[adr] do
    alias m : to_m_directoryL1A(mTyped) do
      msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
      cbe.acksReceivedL1A := 0;
      msg := RequestL1A(adr,Fwd_GetML1A,msg_GetML1A.src,cbe.ownerL1A);
      Send_fwd(msg, m);
      cbe.ownerL1A := msg_GetML1A.src;
      Clear_perm(adr, m);
      cbe.State := directoryL1A_evictdM_x_pI_store__C__M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1A_I__C__E_evict(adr:Address; mTyped:OBJSET_directoryL1A);
    var msg_GetML1A: Message;
    var msg_GetM_Ack_ADL1A: Message;
    var msg_PutML1A: Message;
    var msg_Put_AckL1A: Message;
    var msg: Message;
    begin
    alias cbe: i_directoryL1A[mTyped].cb[adr] do
    alias m : to_m_directoryL1A(mTyped) do
      msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
      cbe.acksReceivedL1A := 0;
      msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
      cbe.ownerL1A := msg_GetML1A.src;
      cbe.cl := msg_GetM_Ack_ADL1A.cl;
      cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
      if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
      cbe.acksExpectedL1A := 0;
      cbe.acksReceivedL1A := 0;
      cbe.acksExpectedL1A := 0;
      cbe.acksReceivedL1A := 0;
      cbe.acksExpectedL1A := 0;
      cbe.acksReceivedL1A := 0;
      cbe.acksExpectedL1A := 0;
      cbe.acksReceivedL1A := 0;
      cbe.acksExpectedL1A := 0;
      cbe.acksReceivedL1A := 0;
      Set_perm(store, adr, m);
      msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
      msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
      RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
      if (cbe.ownerL1A = msg_PutML1A.src) then
      cbe.cl := msg_PutML1A.cl;
      msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2(directoryL2));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := directoryL1A_evictI__C__E_evict;
      return;
      endif;
      endif;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1A_I__C__M_evict(adr:Address; mTyped:OBJSET_directoryL1A);
    var msg_GetML1A: Message;
    var msg_GetM_Ack_ADL1A: Message;
    var msg_PutML1A: Message;
    var msg_Put_AckL1A: Message;
    var msg: Message;
    begin
    alias cbe: i_directoryL1A[mTyped].cb[adr] do
    alias m : to_m_directoryL1A(mTyped) do
      msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
      cbe.acksReceivedL1A := 0;
      msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
      cbe.ownerL1A := msg_GetML1A.src;
      cbe.cl := msg_GetM_Ack_ADL1A.cl;
      cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
      if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
      cbe.acksExpectedL1A := 0;
      cbe.acksReceivedL1A := 0;
      cbe.acksExpectedL1A := 0;
      cbe.acksReceivedL1A := 0;
      cbe.acksExpectedL1A := 0;
      cbe.acksReceivedL1A := 0;
      cbe.acksExpectedL1A := 0;
      cbe.acksReceivedL1A := 0;
      cbe.acksExpectedL1A := 0;
      cbe.acksReceivedL1A := 0;
      Set_perm(store, adr, m);
      msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
      msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
      RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
      if (cbe.ownerL1A = msg_PutML1A.src) then
      cbe.cl := msg_PutML1A.cl;
      msg := RwdL2(adr,MemWr_IL2,m,to_m_directoryL2(directoryL2),cbe.cl);
      Send_rwd(msg, m);
      Clear_perm(adr, m);
      cbe.State := directoryL1A_evictI__C__M_evict;
      return;
      endif;
      endif;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1A_I__C__S_evict(adr:Address; mTyped:OBJSET_directoryL1A);
    var msg_GetML1A: Message;
    var msg_GetM_Ack_ADL1A: Message;
    var msg_PutML1A: Message;
    var msg_Put_AckL1A: Message;
    var msg: Message;
    begin
    alias cbe: i_directoryL1A[mTyped].cb[adr] do
    alias m : to_m_directoryL1A(mTyped) do
      msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
      cbe.acksReceivedL1A := 0;
      msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
      cbe.ownerL1A := msg_GetML1A.src;
      cbe.cl := msg_GetM_Ack_ADL1A.cl;
      cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
      if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
      cbe.acksExpectedL1A := 0;
      cbe.acksReceivedL1A := 0;
      cbe.acksExpectedL1A := 0;
      cbe.acksReceivedL1A := 0;
      cbe.acksExpectedL1A := 0;
      cbe.acksReceivedL1A := 0;
      cbe.acksExpectedL1A := 0;
      cbe.acksReceivedL1A := 0;
      cbe.acksExpectedL1A := 0;
      cbe.acksReceivedL1A := 0;
      Set_perm(store, adr, m);
      msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
      msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
      RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
      if (cbe.ownerL1A = msg_PutML1A.src) then
      cbe.cl := msg_PutML1A.cl;
      msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2(directoryL2));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := directoryL1A_evictI__C__S_evict;
      return;
      endif;
      endif;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1A_M__C__M_evict(adr:Address; mTyped:OBJSET_directoryL1A);
    var msg_GetML1A: Message;
    var msg: Message;
    begin
    alias cbe: i_directoryL1A[mTyped].cb[adr] do
    alias m : to_m_directoryL1A(mTyped) do
      msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
      cbe.acksReceivedL1A := 0;
      msg := RequestL1A(adr,Fwd_GetML1A,msg_GetML1A.src,cbe.ownerL1A);
      Send_fwd(msg, m);
      cbe.ownerL1A := msg_GetML1A.src;
      Clear_perm(adr, m);
      cbe.State := directoryL1A_evictdM_x_pI_store__C__M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1A_S__C__E_evict(adr:Address; mTyped:OBJSET_directoryL1A);
    var msg_GetML1A: Message;
    var msg_GetM_Ack_ADL1A: Message;
    var msg: Message;
    var msg_PutML1A: Message;
    var msg_Put_AckL1A: Message;
    begin
    alias cbe: i_directoryL1A[mTyped].cb[adr] do
    alias m : to_m_directoryL1A(mTyped) do
      msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
      cbe.acksReceivedL1A := 0;
      if (IsElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src)) then
        RemoveElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src);
        msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
        msg := AckL1A(adr,InvL1A,msg_GetML1A.src,msg_GetML1A.src);
        Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
        cbe.ownerL1A := msg_GetML1A.src;
        ClearVector_cacheL1A(cbe.cacheL1A);
        cbe.cl := msg_GetM_Ack_ADL1A.cl;
        cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
        if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          Set_perm(store, adr, m);
          msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
          if (cbe.ownerL1A = msg_PutML1A.src) then
          cbe.cl := msg_PutML1A.cl;
          msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2(directoryL2));
          Send_req2(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictI__C__E_evict;
          return;
          endif;
        endif;
        if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictdM_x_pI_store_GetM_Ack_AD__C__E;
          return;
        endif;
      endif;
      if !(IsElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src)) then
        msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
        msg := AckL1A(adr,InvL1A,msg_GetML1A.src,msg_GetML1A.src);
        Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
        cbe.ownerL1A := msg_GetML1A.src;
        ClearVector_cacheL1A(cbe.cacheL1A);
        cbe.cl := msg_GetM_Ack_ADL1A.cl;
        cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
        if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          Set_perm(store, adr, m);
          msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
          if (cbe.ownerL1A = msg_PutML1A.src) then
          cbe.cl := msg_PutML1A.cl;
          msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2(directoryL2));
          Send_req2(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictI__C__E_evict;
          return;
          endif;
        endif;
        if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictdM_x_pI_store_GetM_Ack_AD__C__E;
          return;
        endif;
      endif;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1A_S__C__M_evict(adr:Address; mTyped:OBJSET_directoryL1A);
    var msg_GetML1A: Message;
    var msg_GetM_Ack_ADL1A: Message;
    var msg: Message;
    var msg_PutML1A: Message;
    var msg_Put_AckL1A: Message;
    begin
    alias cbe: i_directoryL1A[mTyped].cb[adr] do
    alias m : to_m_directoryL1A(mTyped) do
      msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
      cbe.acksReceivedL1A := 0;
      if (IsElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src)) then
        RemoveElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src);
        msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
        msg := AckL1A(adr,InvL1A,msg_GetML1A.src,msg_GetML1A.src);
        Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
        cbe.ownerL1A := msg_GetML1A.src;
        ClearVector_cacheL1A(cbe.cacheL1A);
        cbe.cl := msg_GetM_Ack_ADL1A.cl;
        cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
        if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictdM_x_pI_store_GetM_Ack_AD__C__M;
          return;
        endif;
        if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          Set_perm(store, adr, m);
          msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
          if (cbe.ownerL1A = msg_PutML1A.src) then
          cbe.cl := msg_PutML1A.cl;
          msg := RwdL2(adr,MemWr_IL2,m,to_m_directoryL2(directoryL2),cbe.cl);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictI__C__M_evict;
          return;
          endif;
        endif;
      endif;
      if !(IsElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src)) then
        msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
        msg := AckL1A(adr,InvL1A,msg_GetML1A.src,msg_GetML1A.src);
        Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
        cbe.ownerL1A := msg_GetML1A.src;
        ClearVector_cacheL1A(cbe.cacheL1A);
        cbe.cl := msg_GetM_Ack_ADL1A.cl;
        cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
        if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          Set_perm(store, adr, m);
          msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
          if (cbe.ownerL1A = msg_PutML1A.src) then
          cbe.cl := msg_PutML1A.cl;
          msg := RwdL2(adr,MemWr_IL2,m,to_m_directoryL2(directoryL2),cbe.cl);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictI__C__M_evict;
          return;
          endif;
        endif;
        if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictdM_x_pI_store_GetM_Ack_AD__C__M;
          return;
        endif;
      endif;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1A_S__C__S_evict(adr:Address; mTyped:OBJSET_directoryL1A);
    var msg_GetML1A: Message;
    var msg_GetM_Ack_ADL1A: Message;
    var msg: Message;
    var msg_PutML1A: Message;
    var msg_Put_AckL1A: Message;
    begin
    alias cbe: i_directoryL1A[mTyped].cb[adr] do
    alias m : to_m_directoryL1A(mTyped) do
      msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
      cbe.acksReceivedL1A := 0;
      if !(IsElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src)) then
        msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
        msg := AckL1A(adr,InvL1A,msg_GetML1A.src,msg_GetML1A.src);
        Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
        cbe.ownerL1A := msg_GetML1A.src;
        ClearVector_cacheL1A(cbe.cacheL1A);
        cbe.cl := msg_GetM_Ack_ADL1A.cl;
        cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
        if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          Set_perm(store, adr, m);
          msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
          if (cbe.ownerL1A = msg_PutML1A.src) then
          cbe.cl := msg_PutML1A.cl;
          msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2(directoryL2));
          Send_req2(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictI__C__S_evict;
          return;
          endif;
        endif;
        if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictdM_x_pI_store_GetM_Ack_AD__C__S;
          return;
        endif;
      endif;
      if (IsElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src)) then
        RemoveElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src);
        msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
        msg := AckL1A(adr,InvL1A,msg_GetML1A.src,msg_GetML1A.src);
        Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
        cbe.ownerL1A := msg_GetML1A.src;
        ClearVector_cacheL1A(cbe.cacheL1A);
        cbe.cl := msg_GetM_Ack_ADL1A.cl;
        cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
        if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictdM_x_pI_store_GetM_Ack_AD__C__S;
          return;
        endif;
        if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          Set_perm(store, adr, m);
          msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
          if (cbe.ownerL1A = msg_PutML1A.src) then
          cbe.cl := msg_PutML1A.cl;
          msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2(directoryL2));
          Send_req2(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictI__C__S_evict;
          return;
          endif;
        endif;
      endif;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1B_V__C__E_acq_eventL1B(adr:Address; mTyped:OBJSET_directoryL1B);
    begin
    alias cbe: i_directoryL1B[mTyped].cb[adr] do
    alias m : to_m_directoryL1B(mTyped) do
      ServeRemoteEvent_directoryL1B(directoryL1B_acq_eventL1B, m, adr);
      Clear_perm(adr, m);
      cbe.State := directoryL1B_V__C__E;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1B_V__C__E_evict(adr:Address; mTyped:OBJSET_directoryL1B);
    var msg_GetR_AckL1B: Message;
    var msg_PutRL1B: Message;
    var msg_PutR_AckL1B: Message;
    var msg: Message;
    begin
    alias cbe: i_directoryL1B[mTyped].cb[adr] do
    alias m : to_m_directoryL1B(mTyped) do
      msg_GetR_AckL1B := RespL1B(adr,GetR_AckL1B,m,m,cbe.cl);
      cbe.cl := msg_GetR_AckL1B.cl;
      Set_perm(store, adr, m);
      msg_PutRL1B := RespL1B(adr,PutRL1B,m,m,cbe.cl);
      msg_PutR_AckL1B := AckL1B(adr,PutR_AckL1B,m,msg_PutRL1B.src);
      cbe.cl := msg_PutRL1B.cl;
      msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2(directoryL2));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := directoryL1B_evictV__C__E_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1B_V__C__E_rel_eventL1B(adr:Address; mTyped:OBJSET_directoryL1B);
    begin
    alias cbe: i_directoryL1B[mTyped].cb[adr] do
    alias m : to_m_directoryL1B(mTyped) do
      ServeRemoteEvent_directoryL1B(directoryL1B_rel_eventL1B, m, adr);
      Clear_perm(adr, m);
      cbe.State := directoryL1B_V__C__E;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1B_V__C__I_acq_eventL1B(adr:Address; mTyped:OBJSET_directoryL1B);
    begin
    alias cbe: i_directoryL1B[mTyped].cb[adr] do
    alias m : to_m_directoryL1B(mTyped) do
      ServeRemoteEvent_directoryL1B(directoryL1B_acq_eventL1B, m, adr);
      Clear_perm(adr, m);
      cbe.State := directoryL1B_V__C__I;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1B_V__C__I_rel_eventL1B(adr:Address; mTyped:OBJSET_directoryL1B);
    begin
    alias cbe: i_directoryL1B[mTyped].cb[adr] do
    alias m : to_m_directoryL1B(mTyped) do
      ServeRemoteEvent_directoryL1B(directoryL1B_rel_eventL1B, m, adr);
      Clear_perm(adr, m);
      cbe.State := directoryL1B_V__C__I;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1B_V__C__M_acq_eventL1B(adr:Address; mTyped:OBJSET_directoryL1B);
    begin
    alias cbe: i_directoryL1B[mTyped].cb[adr] do
    alias m : to_m_directoryL1B(mTyped) do
      ServeRemoteEvent_directoryL1B(directoryL1B_acq_eventL1B, m, adr);
      Clear_perm(adr, m);
      cbe.State := directoryL1B_V__C__M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1B_V__C__M_evict(adr:Address; mTyped:OBJSET_directoryL1B);
    var msg_GetR_AckL1B: Message;
    var msg_PutRL1B: Message;
    var msg_PutR_AckL1B: Message;
    var msg: Message;
    begin
    alias cbe: i_directoryL1B[mTyped].cb[adr] do
    alias m : to_m_directoryL1B(mTyped) do
      msg_GetR_AckL1B := RespL1B(adr,GetR_AckL1B,m,m,cbe.cl);
      cbe.cl := msg_GetR_AckL1B.cl;
      Set_perm(store, adr, m);
      msg_PutRL1B := RespL1B(adr,PutRL1B,m,m,cbe.cl);
      msg_PutR_AckL1B := AckL1B(adr,PutR_AckL1B,m,msg_PutRL1B.src);
      cbe.cl := msg_PutRL1B.cl;
      msg := RwdL2(adr,MemWr_IL2,m,to_m_directoryL2(directoryL2),cbe.cl);
      Send_rwd(msg, m);
      Clear_perm(adr, m);
      cbe.State := directoryL1B_evictV__C__M_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1B_V__C__M_rel_eventL1B(adr:Address; mTyped:OBJSET_directoryL1B);
    begin
    alias cbe: i_directoryL1B[mTyped].cb[adr] do
    alias m : to_m_directoryL1B(mTyped) do
      ServeRemoteEvent_directoryL1B(directoryL1B_rel_eventL1B, m, adr);
      Clear_perm(adr, m);
      cbe.State := directoryL1B_V__C__M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1B_V__C__S_acq_eventL1B(adr:Address; mTyped:OBJSET_directoryL1B);
    begin
    alias cbe: i_directoryL1B[mTyped].cb[adr] do
    alias m : to_m_directoryL1B(mTyped) do
      ServeRemoteEvent_directoryL1B(directoryL1B_acq_eventL1B, m, adr);
      Clear_perm(adr, m);
      cbe.State := directoryL1B_V__C__S;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1B_V__C__S_evict(adr:Address; mTyped:OBJSET_directoryL1B);
    var msg_GetR_AckL1B: Message;
    var msg_PutRL1B: Message;
    var msg_PutR_AckL1B: Message;
    var msg: Message;
    begin
    alias cbe: i_directoryL1B[mTyped].cb[adr] do
    alias m : to_m_directoryL1B(mTyped) do
      msg_GetR_AckL1B := RespL1B(adr,GetR_AckL1B,m,m,cbe.cl);
      cbe.cl := msg_GetR_AckL1B.cl;
      Set_perm(store, adr, m);
      msg_PutRL1B := RespL1B(adr,PutRL1B,m,m,cbe.cl);
      msg_PutR_AckL1B := AckL1B(adr,PutR_AckL1B,m,msg_PutRL1B.src);
      cbe.cl := msg_PutRL1B.cl;
      msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2(directoryL2));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := directoryL1B_evictV__C__S_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1B_V__C__S_rel_eventL1B(adr:Address; mTyped:OBJSET_directoryL1B);
    begin
    alias cbe: i_directoryL1B[mTyped].cb[adr] do
    alias m : to_m_directoryL1B(mTyped) do
      ServeRemoteEvent_directoryL1B(directoryL1B_rel_eventL1B, m, adr);
      Clear_perm(adr, m);
      cbe.State := directoryL1B_V__C__S;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_I_acq_eventL1B(adr:Address; mTyped:OBJSET_cacheL1B);
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      ServeRemoteEvent_cacheL1B(cacheL1B_acq_eventL1B, m, adr);
      Clear_perm(adr, m);
      cbe.State := cacheL1B_I;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_I_acquire(adr:Address; mTyped:OBJSET_cacheL1B);
    var msg: Message;
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      msg := RequestL1B(adr,GetVL1B,m,to_m_directoryL1B(directoryL1B));
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1B_I_acquire;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_I_load(adr:Address; mTyped:OBJSET_cacheL1B);
    var msg: Message;
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      msg := RequestL1B(adr,GetVL1B,m,to_m_directoryL1B(directoryL1B));
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1B_I_load;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_I_rel_eventL1B(adr:Address; mTyped:OBJSET_cacheL1B);
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      ServeRemoteEvent_cacheL1B(cacheL1B_rel_eventL1B, m, adr);
      Clear_perm(adr, m);
      cbe.State := cacheL1B_I;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_I_release(adr:Address; mTyped:OBJSET_cacheL1B);
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      IssueEvent_cacheL1B(cacheL1B_rel_eventL1B, m, adr);
      Clear_perm(adr, m);
      cbe.State := cacheL1B_I_release;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_I_store(adr:Address; mTyped:OBJSET_cacheL1B);
    var msg: Message;
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      msg := RequestL1B(adr,GetVL1B,m,to_m_directoryL1B(directoryL1B));
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1B_I_store;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_I_acquire_GetV_Ack_acq_eventL1B(adr:Address; mTyped:OBJSET_cacheL1B);
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1B_VC;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_I_release_rel_eventL1B(adr:Address; mTyped:OBJSET_cacheL1B);
    var msg: Message;
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      msg := RequestL1B(adr,GetRL1B,m,to_m_directoryL1B(directoryL1B));
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1B_I_release_rel_event;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_VC_acq_eventL1B(adr:Address; mTyped:OBJSET_cacheL1B);
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      ServeRemoteEvent_cacheL1B(cacheL1B_acq_eventL1B, m, adr);
      Clear_perm(adr, m);
      cbe.State := cacheL1B_I;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_VC_acquire(adr:Address; mTyped:OBJSET_cacheL1B);
    var msg: Message;
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      msg := RequestL1B(adr,GetVL1B,m,to_m_directoryL1B(directoryL1B));
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1B_VC_acquire;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_VC_evict(adr:Address; mTyped:OBJSET_cacheL1B);
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      Clear_perm(adr, m);
      cbe.State := cacheL1B_I;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_VC_load(adr:Address; mTyped:OBJSET_cacheL1B);
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1B_VC;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_VC_rel_eventL1B(adr:Address; mTyped:OBJSET_cacheL1B);
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      ServeRemoteEvent_cacheL1B(cacheL1B_rel_eventL1B, m, adr);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1B_VC;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_VC_release(adr:Address; mTyped:OBJSET_cacheL1B);
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      IssueEvent_cacheL1B(cacheL1B_rel_eventL1B, m, adr);
      Clear_perm(adr, m);
      cbe.State := cacheL1B_VC_release;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_VC_store(adr:Address; mTyped:OBJSET_cacheL1B);
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      Set_perm(store, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1B_VD;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_VC_acquire_GetV_Ack_acq_eventL1B(adr:Address; mTyped:OBJSET_cacheL1B);
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1B_VC;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_VC_release_rel_eventL1B(adr:Address; mTyped:OBJSET_cacheL1B);
    var msg: Message;
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      Set_perm(store, adr, m);
      msg := RespL1B(adr,PutVL1B,m,to_m_directoryL1B(directoryL1B),cbe.cl);
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1B_VC_release_rel_event;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_VD_acq_eventL1B(adr:Address; mTyped:OBJSET_cacheL1B);
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      ServeRemoteEvent_cacheL1B(cacheL1B_acq_eventL1B, m, adr);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1B_VD;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_VD_acquire(adr:Address; mTyped:OBJSET_cacheL1B);
    var msg: Message;
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      msg := RequestL1B(adr,GetVL1B,m,to_m_directoryL1B(directoryL1B));
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1B_VD_acquire;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_VD_evict(adr:Address; mTyped:OBJSET_cacheL1B);
    var msg: Message;
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      msg := RespL1B(adr,PutVL1B,m,to_m_directoryL1B(directoryL1B),cbe.cl);
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1B_VD_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_VD_load(adr:Address; mTyped:OBJSET_cacheL1B);
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1B_VD;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_VD_rel_eventL1B(adr:Address; mTyped:OBJSET_cacheL1B);
    var msg: Message;
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      msg := RespL1B(adr,PutVL1B,m,to_m_directoryL1B(directoryL1B),cbe.cl);
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1B_VD_rel_event;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_VD_release(adr:Address; mTyped:OBJSET_cacheL1B);
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      IssueEvent_cacheL1B(cacheL1B_rel_eventL1B, m, adr);
      Clear_perm(adr, m);
      cbe.State := cacheL1B_VD_release;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_VD_store(adr:Address; mTyped:OBJSET_cacheL1B);
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      Set_perm(store, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1B_VD;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_VD_acquire_GetV_Ack_acq_eventL1B(adr:Address; mTyped:OBJSET_cacheL1B);
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1B_VC;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_VD_release_rel_eventL1B(adr:Address; mTyped:OBJSET_cacheL1B);
    var msg: Message;
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      Set_perm(store, adr, m);
      msg := RespL1B(adr,PutVL1B,m,to_m_directoryL1B(directoryL1B),cbe.cl);
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1B_VD_release_rel_event;
      return;
    endalias;
    endalias;
    end;
    
  ----Backend/Murphi/MurphiModular/StateMachines/GenMessageStateMachines
    function FSM_MSG_cacheL1B(inmsg:Message; mTyped:OBJSET_cacheL1B) : boolean;
    var msg: Message;
    begin
      alias adr: inmsg.adr do
      alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
    switch cbe.State
      case cacheL1B_I:
      switch inmsg.mtype
        else return false;
      endswitch;
      
      case cacheL1B_I_acquire:
      switch inmsg.mtype
        case GetV_AckL1B:
          cbe.cl := inmsg.cl;
          IssueEvent_cacheL1B(cacheL1B_acq_eventL1B, m, adr);
          Clear_perm(adr, m);
          cbe.State := cacheL1B_I_acquire_GetV_Ack;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1B_I_acquire_GetV_Ack:
      switch inmsg.mtype
        else return false;
      endswitch;
      
      case cacheL1B_I_load:
      switch inmsg.mtype
        case GetV_AckL1B:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL1B_VC;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1B_I_release:
      switch inmsg.mtype
        else return false;
      endswitch;
      
      case cacheL1B_I_release_rel_event:
      switch inmsg.mtype
        case GetR_AckL1B:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg := RespL1B(adr,PutRL1B,m,to_m_directoryL1B(directoryL1B),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1B_I_release_rel_event_GetR_Ack;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1B_I_release_rel_event_GetR_Ack:
      switch inmsg.mtype
        case PutR_AckL1B:
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL1B_VC;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1B_I_store:
      switch inmsg.mtype
        case GetV_AckL1B:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL1B_VD;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1B_VC:
      switch inmsg.mtype
        else return false;
      endswitch;
      
      case cacheL1B_VC_acquire:
      switch inmsg.mtype
        case GetV_AckL1B:
          cbe.cl := inmsg.cl;
          IssueEvent_cacheL1B(cacheL1B_acq_eventL1B, m, adr);
          Clear_perm(adr, m);
          cbe.State := cacheL1B_VC_acquire_GetV_Ack;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1B_VC_acquire_GetV_Ack:
      switch inmsg.mtype
        else return false;
      endswitch;
      
      case cacheL1B_VC_release:
      switch inmsg.mtype
        else return false;
      endswitch;
      
      case cacheL1B_VC_release_rel_event:
      switch inmsg.mtype
        case PutV_AckL1B:
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL1B_VC;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1B_VD:
      switch inmsg.mtype
        else return false;
      endswitch;
      
      case cacheL1B_VD_acquire:
      switch inmsg.mtype
        case GetV_AckL1B:
          cbe.cl := inmsg.cl;
          IssueEvent_cacheL1B(cacheL1B_acq_eventL1B, m, adr);
          Clear_perm(adr, m);
          cbe.State := cacheL1B_VD_acquire_GetV_Ack;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1B_VD_acquire_GetV_Ack:
      switch inmsg.mtype
        else return false;
      endswitch;
      
      case cacheL1B_VD_evict:
      switch inmsg.mtype
        case PutV_AckL1B:
          Clear_perm(adr, m);
          cbe.State := cacheL1B_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1B_VD_rel_event:
      switch inmsg.mtype
        case PutV_AckL1B:
          ServeRemoteEvent_cacheL1B(cacheL1B_rel_eventL1B, m, adr);
          Clear_perm(adr, m);
          cbe.State := cacheL1B_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1B_VD_release:
      switch inmsg.mtype
        else return false;
      endswitch;
      
      case cacheL1B_VD_release_rel_event:
      switch inmsg.mtype
        case PutV_AckL1B:
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL1B_VC;
          return true;
        
        else return false;
      endswitch;
      
    endswitch;
    endalias;
    endalias;
    endalias;
    return false;
    end;
    
    function FSM_MSG_directoryL1B(inmsg:Message; mTyped:OBJSET_directoryL1B) : boolean;
    var msg: Message;
    var msg_GetR_AckL1B: Message;
    var msg_PutRL1B: Message;
    var msg_PutR_AckL1B: Message;
    var msg_GetVL1B: Message;
    var msg_GetV_AckL1B: Message;
    begin
      alias adr: inmsg.adr do
      alias cbe: i_directoryL1B[mTyped].cb[adr] do
    alias m : to_m_directoryL1B(mTyped) do
    switch cbe.State
      case directoryL1B_BIConflictAckL2V__C__M_BIConflictAck:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_BISnpDataL2V__C__M_BISnpData:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspSL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__S;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_BISnpInvL2V__C__M_BISnpInv:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_GetRL1BV_GetR__C__M:
      switch inmsg.mtype
        case PutRL1B:
          msg := AckL1B(adr,PutR_AckL1B,m,inmsg.src);
          Send_fwd(msg, m);
          cbe.cl := inmsg.cl;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_GetRL1BV__C__I_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetRL1BV__C__I_store;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetRL1BV__C__I_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetRL1BV__C__I_store;
          return true;
        
        case Cmp_EL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetRL1BV__C__I_store_Cmp_E;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_GetRL1BV__C__I_store_Cmp_E:
      switch inmsg.mtype
        case MemDataL2:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg := RespL1B(adr,GetR_AckL1B,m,cbe.proxy_msgL1B.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL1B;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetRL1BV_GetR__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_GetRL1BV__C__S_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetRL1BV__C__I_store;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetRL1BV__C__S_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetRL1BV__C__S_store;
          return true;
        
        case Cmp_EL2:
          Set_perm(store, adr, m);
          msg := RespL1B(adr,GetR_AckL1B,m,cbe.proxy_msgL1B.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL1B;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetRL1BV_GetR__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_GetVL1BV__C__I_load:
      switch inmsg.mtype
        case BIConflictAckL2:
          cbe.proxy_msgL2 := inmsg;
          msg_GetR_AckL1B := RespL1B(adr,GetR_AckL1B,m,m,cbe.cl);
          cbe.cl := msg_GetR_AckL1B.cl;
          Set_perm(store, adr, m);
          msg_PutRL1B := RespL1B(adr,PutRL1B,m,m,cbe.cl);
          msg_PutR_AckL1B := AckL1B(adr,PutR_AckL1B,m,msg_PutRL1B.src);
          cbe.cl := msg_PutRL1B.cl;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetVL1BV__C__I_load;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetVL1BV__C__I_load;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetVL1BV__C__I_load;
          return true;
        
        case Cmp_EL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetVL1BV__C__I_load_Cmp_E;
          return true;
        
        case Cmp_SL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetVL1BV__C__I_load_Cmp_S;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_GetVL1BV__C__I_load_Cmp_E:
      switch inmsg.mtype
        case MemDataL2:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          msg := RespL1B(adr,GetV_AckL1B,m,cbe.proxy_msgL1B.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL1B;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__E;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_GetVL1BV__C__I_load_Cmp_S:
      switch inmsg.mtype
        case MemDataL2:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          msg := RespL1B(adr,GetV_AckL1B,m,cbe.proxy_msgL1B.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL1B;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__S;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_PutVL1BV__C__I_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          cbe.proxy_msgL2 := inmsg;
          msg_GetR_AckL1B := RespL1B(adr,GetR_AckL1B,m,m,cbe.cl);
          cbe.cl := msg_GetR_AckL1B.cl;
          Set_perm(store, adr, m);
          msg_PutRL1B := RespL1B(adr,PutRL1B,m,m,cbe.cl);
          msg_PutR_AckL1B := AckL1B(adr,PutR_AckL1B,m,msg_PutRL1B.src);
          cbe.cl := msg_PutRL1B.cl;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_PutVL1BV__C__I_store;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_PutVL1BV__C__I_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_PutVL1BV__C__I_store;
          return true;
        
        case Cmp_EL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1B_PutVL1BV__C__I_store_Cmp_E;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_PutVL1BV__C__I_store_Cmp_E:
      switch inmsg.mtype
        case MemDataL2:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg := AckL1B(adr,PutV_AckL1B,m,cbe.proxy_msgL1B.src);
          Send_fwd(msg, m);
          cbe.cl := cbe.proxy_msgL1B.cl;
          undefine cbe.proxy_msgL1B;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_PutVL1BV__C__S_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          cbe.proxy_msgL2 := inmsg;
          msg_GetR_AckL1B := RespL1B(adr,GetR_AckL1B,m,m,cbe.cl);
          cbe.cl := msg_GetR_AckL1B.cl;
          Set_perm(store, adr, m);
          msg_PutRL1B := RespL1B(adr,PutRL1B,m,m,cbe.cl);
          msg_PutR_AckL1B := AckL1B(adr,PutR_AckL1B,m,msg_PutRL1B.src);
          cbe.cl := msg_PutRL1B.cl;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_PutVL1BV__C__I_store;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_PutVL1BV__C__S_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_PutVL1BV__C__S_store;
          return true;
        
        case Cmp_EL2:
          Set_perm(store, adr, m);
          msg := AckL1B(adr,PutV_AckL1B,m,cbe.proxy_msgL1B.src);
          Send_fwd(msg, m);
          cbe.cl := cbe.proxy_msgL1B.cl;
          undefine cbe.proxy_msgL1B;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_V__C__E:
      switch inmsg.mtype
        case BIConflictAckL2:
          cbe.proxy_msgL2 := inmsg;
          msg_GetR_AckL1B := RespL1B(adr,GetR_AckL1B,m,m,cbe.cl);
          cbe.cl := msg_GetR_AckL1B.cl;
          Set_perm(store, adr, m);
          msg_PutRL1B := RespL1B(adr,PutRL1B,m,m,cbe.cl);
          msg_PutR_AckL1B := AckL1B(adr,PutR_AckL1B,m,msg_PutRL1B.src);
          cbe.cl := msg_PutRL1B.cl;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__I;
          return true;
        
        case BISnpDataL2:
          msg_GetVL1B := RequestL1B(adr,GetVL1B,m,m);
          msg_GetV_AckL1B := RespL1B(adr,GetV_AckL1B,m,msg_GetVL1B.src,cbe.cl);
          cbe.cl := msg_GetV_AckL1B.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspSL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__S;
          return true;
        
        case BISnpInvL2:
          cbe.proxy_msgL2 := inmsg;
          msg_GetR_AckL1B := RespL1B(adr,GetR_AckL1B,m,m,cbe.cl);
          cbe.cl := msg_GetR_AckL1B.cl;
          Set_perm(store, adr, m);
          msg_PutRL1B := RespL1B(adr,PutRL1B,m,m,cbe.cl);
          msg_PutR_AckL1B := AckL1B(adr,PutR_AckL1B,m,msg_PutRL1B.src);
          cbe.cl := msg_PutRL1B.cl;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__I;
          return true;
        
        case GetRL1B:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1B := inmsg;
          msg := RespL1B(adr,GetR_AckL1B,m,cbe.proxy_msgL1B.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL1B;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetRL1BV_GetR__C__M;
          return true;
        
        case GetVL1B:
          Set_perm(load, adr, m);
          cbe.proxy_msgL1B := inmsg;
          msg := RespL1B(adr,GetV_AckL1B,m,cbe.proxy_msgL1B.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL1B;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__E;
          return true;
        
        case PutVL1B:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1B := inmsg;
          msg := AckL1B(adr,PutV_AckL1B,m,cbe.proxy_msgL1B.src);
          Send_fwd(msg, m);
          cbe.cl := cbe.proxy_msgL1B.cl;
          undefine cbe.proxy_msgL1B;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_V__C__I:
      switch inmsg.mtype
        case BIConflictAckL2:
          cbe.proxy_msgL2 := inmsg;
          msg_GetR_AckL1B := RespL1B(adr,GetR_AckL1B,m,m,cbe.cl);
          cbe.cl := msg_GetR_AckL1B.cl;
          Set_perm(store, adr, m);
          msg_PutRL1B := RespL1B(adr,PutRL1B,m,m,cbe.cl);
          msg_PutR_AckL1B := AckL1B(adr,PutR_AckL1B,m,msg_PutRL1B.src);
          cbe.cl := msg_PutRL1B.cl;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__I;
          return true;
        
        case BISnpDataL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__I;
          return true;
        
        case BISnpInvL2:
          cbe.proxy_msgL2 := inmsg;
          msg_GetR_AckL1B := RespL1B(adr,GetR_AckL1B,m,m,cbe.cl);
          cbe.cl := msg_GetR_AckL1B.cl;
          Set_perm(store, adr, m);
          msg_PutRL1B := RespL1B(adr,PutRL1B,m,m,cbe.cl);
          msg_PutR_AckL1B := AckL1B(adr,PutR_AckL1B,m,msg_PutRL1B.src);
          cbe.cl := msg_PutRL1B.cl;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__I;
          return true;
        
        case GetRL1B:
          msg := ReqL2(adr,MemRd_A_SnpInvL2,m,to_m_directoryL2(directoryL2));
          Send_req2(msg, m);
          cbe.proxy_msgL1B := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetRL1BV__C__I_store;
          return true;
        
        case GetVL1B:
          msg := ReqL2(adr,MemRd_S_SnpDataL2,m,to_m_directoryL2(directoryL2));
          Send_req2(msg, m);
          cbe.proxy_msgL1B := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetVL1BV__C__I_load;
          return true;
        
        case PutVL1B:
          msg := ReqL2(adr,MemRd_A_SnpInvL2,m,to_m_directoryL2(directoryL2));
          Send_req2(msg, m);
          cbe.proxy_msgL1B := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_PutVL1BV__C__I_store;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_V__C__M:
      switch inmsg.mtype
        case BIConflictAckL2:
          cbe.proxy_msgL2 := inmsg;
          msg_GetR_AckL1B := RespL1B(adr,GetR_AckL1B,m,m,cbe.cl);
          cbe.cl := msg_GetR_AckL1B.cl;
          Set_perm(store, adr, m);
          msg_PutRL1B := RespL1B(adr,PutRL1B,m,m,cbe.cl);
          msg_PutR_AckL1B := AckL1B(adr,PutR_AckL1B,m,msg_PutRL1B.src);
          cbe.cl := msg_PutRL1B.cl;
          msg := RwdL2(adr,MemWr_IL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_rwd(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_BIConflictAckL2V__C__M_BIConflictAck;
          return true;
        
        case BISnpDataL2:
          msg_GetVL1B := RequestL1B(adr,GetVL1B,m,m);
          msg_GetV_AckL1B := RespL1B(adr,GetV_AckL1B,m,msg_GetVL1B.src,cbe.cl);
          cbe.cl := msg_GetV_AckL1B.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := RwdL2(adr,MemWr_SL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_rwd(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_BISnpDataL2V__C__M_BISnpData;
          return true;
        
        case BISnpInvL2:
          cbe.proxy_msgL2 := inmsg;
          msg_GetR_AckL1B := RespL1B(adr,GetR_AckL1B,m,m,cbe.cl);
          cbe.cl := msg_GetR_AckL1B.cl;
          Set_perm(store, adr, m);
          msg_PutRL1B := RespL1B(adr,PutRL1B,m,m,cbe.cl);
          msg_PutR_AckL1B := AckL1B(adr,PutR_AckL1B,m,msg_PutRL1B.src);
          cbe.cl := msg_PutRL1B.cl;
          msg := RwdL2(adr,MemWr_IL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_rwd(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_BISnpInvL2V__C__M_BISnpInv;
          return true;
        
        case GetRL1B:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1B := inmsg;
          msg := RespL1B(adr,GetR_AckL1B,m,cbe.proxy_msgL1B.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL1B;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetRL1BV_GetR__C__M;
          return true;
        
        case GetVL1B:
          Set_perm(load, adr, m);
          cbe.proxy_msgL1B := inmsg;
          msg := RespL1B(adr,GetV_AckL1B,m,cbe.proxy_msgL1B.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL1B;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__M;
          return true;
        
        case PutVL1B:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1B := inmsg;
          msg := AckL1B(adr,PutV_AckL1B,m,cbe.proxy_msgL1B.src);
          Send_fwd(msg, m);
          cbe.cl := cbe.proxy_msgL1B.cl;
          undefine cbe.proxy_msgL1B;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_V__C__S:
      switch inmsg.mtype
        case BIConflictAckL2:
          cbe.proxy_msgL2 := inmsg;
          msg_GetR_AckL1B := RespL1B(adr,GetR_AckL1B,m,m,cbe.cl);
          cbe.cl := msg_GetR_AckL1B.cl;
          Set_perm(store, adr, m);
          msg_PutRL1B := RespL1B(adr,PutRL1B,m,m,cbe.cl);
          msg_PutR_AckL1B := AckL1B(adr,PutR_AckL1B,m,msg_PutRL1B.src);
          cbe.cl := msg_PutRL1B.cl;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__I;
          return true;
        
        case BISnpDataL2:
          msg_GetVL1B := RequestL1B(adr,GetVL1B,m,m);
          msg_GetV_AckL1B := RespL1B(adr,GetV_AckL1B,m,msg_GetVL1B.src,cbe.cl);
          cbe.cl := msg_GetV_AckL1B.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspSL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__S;
          return true;
        
        case BISnpInvL2:
          cbe.proxy_msgL2 := inmsg;
          msg_GetR_AckL1B := RespL1B(adr,GetR_AckL1B,m,m,cbe.cl);
          cbe.cl := msg_GetR_AckL1B.cl;
          Set_perm(store, adr, m);
          msg_PutRL1B := RespL1B(adr,PutRL1B,m,m,cbe.cl);
          msg_PutR_AckL1B := AckL1B(adr,PutR_AckL1B,m,msg_PutRL1B.src);
          cbe.cl := msg_PutRL1B.cl;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__I;
          return true;
        
        case GetRL1B:
          msg := ReqL2(adr,MemInv_A_SnpInvL2,m,to_m_directoryL2(directoryL2));
          Send_req2(msg, m);
          cbe.proxy_msgL1B := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetRL1BV__C__S_store;
          return true;
        
        case GetVL1B:
          Set_perm(load, adr, m);
          cbe.proxy_msgL1B := inmsg;
          msg := RespL1B(adr,GetV_AckL1B,m,cbe.proxy_msgL1B.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL1B;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__S;
          return true;
        
        case PutVL1B:
          msg := ReqL2(adr,MemInv_A_SnpInvL2,m,to_m_directoryL2(directoryL2));
          Send_req2(msg, m);
          cbe.proxy_msgL1B := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_PutVL1BV__C__S_store;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_evictV__C__E_evict:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_evictV__C__E_evict_x_I;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_evictV__C__E_evict;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_evictV__C__E_evict;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_evictV__C__E_evict_x_I:
      switch inmsg.mtype
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_evictV__C__E_evict_x_I;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_evictV__C__E_evict_x_I;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_evictV__C__M_evict:
      switch inmsg.mtype
        case BIConflictAckL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1B_evictV__C__M_evict_BIConflictAck;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_evictV__C__M_evict;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_evictV__C__M_evict;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_evictV__C__M_evict_BIConflictAck:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_evictV__C__S_evict:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_evictV__C__S_evict_x_I;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_evictV__C__S_evict;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_evictV__C__S_evict;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_evictV__C__S_evict_x_I:
      switch inmsg.mtype
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_evictV__C__S_evict_x_I;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_evictV__C__S_evict_x_I;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1B_V__C__I;
          return true;
        
        else return false;
      endswitch;
      
    endswitch;
    endalias;
    endalias;
    endalias;
    return false;
    end;
    
    function FSM_MSG_directoryL1A(inmsg:Message; mTyped:OBJSET_directoryL1A) : boolean;
    var msg: Message;
    var msg_PutML1A: Message;
    var msg_Put_AckL1A: Message;
    var msg_PutSL1A: Message;
    var msg_GetML1A: Message;
    var msg_GetSL1A: Message;
    var msg_GetM_Ack_ADL1A: Message;
    var msg_GetM_Ack_DL1A: Message;
    var msg_PutEL1A: Message;
    var msg_GetS_AckL1A: Message;
    begin
      alias adr: inmsg.adr do
      alias cbe: i_directoryL1A[mTyped].cb[adr] do
    alias m : to_m_directoryL1A(mTyped) do
    switch cbe.State
      case directoryL1A_BIConflictAckL2I__C__M_BIConflictAck:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__E:
      switch inmsg.mtype
        case Inv_AckL1A:
          cbe.acksReceivedL1A := cbe.acksReceivedL1A+1;
          if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__E;
            return true;
          endif;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            Set_perm(store, adr, m);
            msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
            msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
            RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
            if (cbe.ownerL1A = msg_PutML1A.src) then
            cbe.cl := msg_PutML1A.cl;
            msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
            Send_birsp(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__I;
            return true;
            endif;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__I_store:
      switch inmsg.mtype
        case Inv_AckL1A:
          cbe.acksReceivedL1A := cbe.acksReceivedL1A+1;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            Set_perm(store, adr, m);
            msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
            msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
            RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
            if (cbe.ownerL1A = msg_PutML1A.src) then
            cbe.cl := msg_PutML1A.cl;
            msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
            Send_birsp(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_GetML1AS__C__I_store;
            return true;
            endif;
          endif;
          if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__I_store;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__M:
      switch inmsg.mtype
        case Inv_AckL1A:
          cbe.acksReceivedL1A := cbe.acksReceivedL1A+1;
          if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__M;
            return true;
          endif;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            Set_perm(store, adr, m);
            msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
            msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
            RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
            if (cbe.ownerL1A = msg_PutML1A.src) then
            cbe.cl := msg_PutML1A.cl;
            msg := RwdL2(adr,MemWr_IL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_rwd(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_BIConflictAckL2I__C__M_BIConflictAck;
            return true;
            endif;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__S:
      switch inmsg.mtype
        case Inv_AckL1A:
          cbe.acksReceivedL1A := cbe.acksReceivedL1A+1;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            Set_perm(store, adr, m);
            msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
            msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
            RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
            if (cbe.ownerL1A = msg_PutML1A.src) then
            cbe.cl := msg_PutML1A.cl;
            msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
            Send_birsp(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__I;
            return true;
            endif;
          endif;
          if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__S;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_BIConflictAckL2dM_x_pI_store__C__M:
      switch inmsg.mtype
        case GetM_Ack_DL1A:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
          if (cbe.ownerL1A = msg_PutML1A.src) then
          cbe.cl := msg_PutML1A.cl;
          msg := RwdL2(adr,MemWr_IL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_rwd(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_BIConflictAckL2I__C__M_BIConflictAck;
          return true;
          endif;
        
        case Inv_AckL1A:
          cbe.acksReceivedL1A := cbe.acksReceivedL1A+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_BIConflictAckL2dM_x_pI_store__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_BISnpDataL2I__C__M_BISnpData:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspSL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__S;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_BISnpDataL2S__C__M_BISnpData:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspSL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_S__C__S;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_BISnpDataL2dE_GetS_x_pI_load__C__M:
      switch inmsg.mtype
        case GetS_AckL1A:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_BISnpDataL2dE_GetS_x_pS__C__M;
          return true;
        
        case WBL1A:
          if (inmsg.src = cbe.ownerL1A) then
          cbe.cl := inmsg.cl;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_BISnpDataL2dS_x_pI_load__C__M;
          return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_BISnpDataL2dE_GetS_x_pS__C__M:
      switch inmsg.mtype
        case WBL1A:
          if (inmsg.src = cbe.ownerL1A) then
          cbe.cl := inmsg.cl;
          msg_PutSL1A := RequestL1A(adr,PutSL1A,m,m);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutSL1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutSL1A.src);
          if (VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            msg := RwdL2(adr,MemWr_SL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_rwd(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_BISnpDataL2I__C__M_BISnpData;
            return true;
          endif;
          if !(VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            msg := RwdL2(adr,MemWr_SL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_rwd(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_BISnpDataL2S__C__M_BISnpData;
            return true;
          endif;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_BISnpDataL2dM_GetS_x_pI_load__C__M:
      switch inmsg.mtype
        case GetS_AckL1A:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_BISnpDataL2dM_GetS_x_pS__C__M;
          return true;
        
        case WBL1A:
          if (inmsg.src = cbe.ownerL1A) then
          cbe.cl := inmsg.cl;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_BISnpDataL2dS_x_pI_load__C__M;
          return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_BISnpDataL2dM_GetS_x_pS__C__M:
      switch inmsg.mtype
        case WBL1A:
          if (inmsg.src = cbe.ownerL1A) then
          cbe.cl := inmsg.cl;
          msg_PutSL1A := RequestL1A(adr,PutSL1A,m,m);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutSL1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutSL1A.src);
          if !(VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            msg := RwdL2(adr,MemWr_SL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_rwd(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_BISnpDataL2S__C__M_BISnpData;
            return true;
          endif;
          if (VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            msg := RwdL2(adr,MemWr_SL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_rwd(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_BISnpDataL2I__C__M_BISnpData;
            return true;
          endif;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_BISnpDataL2dS_x_pI_load__C__M:
      switch inmsg.mtype
        case GetS_AckL1A:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          msg_PutSL1A := RequestL1A(adr,PutSL1A,m,m);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutSL1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutSL1A.src);
          if !(VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            msg := RwdL2(adr,MemWr_SL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_rwd(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_BISnpDataL2S__C__M_BISnpData;
            return true;
          endif;
          if (VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            msg := RwdL2(adr,MemWr_SL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_rwd(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_BISnpDataL2I__C__M_BISnpData;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_BISnpInvL2I__C__M_BISnpInv:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__E:
      switch inmsg.mtype
        case Inv_AckL1A:
          cbe.acksReceivedL1A := cbe.acksReceivedL1A+1;
          if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__E;
            return true;
          endif;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            Set_perm(store, adr, m);
            msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
            msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
            RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
            if (cbe.ownerL1A = msg_PutML1A.src) then
            cbe.cl := msg_PutML1A.cl;
            msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
            Send_birsp(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__I;
            return true;
            endif;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__M:
      switch inmsg.mtype
        case Inv_AckL1A:
          cbe.acksReceivedL1A := cbe.acksReceivedL1A+1;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            Set_perm(store, adr, m);
            msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
            msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
            RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
            if (cbe.ownerL1A = msg_PutML1A.src) then
            cbe.cl := msg_PutML1A.cl;
            msg := RwdL2(adr,MemWr_IL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_rwd(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_BISnpInvL2I__C__M_BISnpInv;
            return true;
            endif;
          endif;
          if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__S:
      switch inmsg.mtype
        case Inv_AckL1A:
          cbe.acksReceivedL1A := cbe.acksReceivedL1A+1;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            Set_perm(store, adr, m);
            msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
            msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
            RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
            if (cbe.ownerL1A = msg_PutML1A.src) then
            cbe.cl := msg_PutML1A.cl;
            msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
            Send_birsp(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__I;
            return true;
            endif;
          endif;
          if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__S;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_BISnpInvL2dM_x_pI_store__C__M:
      switch inmsg.mtype
        case GetM_Ack_DL1A:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
          if (cbe.ownerL1A = msg_PutML1A.src) then
          cbe.cl := msg_PutML1A.cl;
          msg := RwdL2(adr,MemWr_IL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_rwd(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_BISnpInvL2I__C__M_BISnpInv;
          return true;
          endif;
        
        case Inv_AckL1A:
          cbe.acksReceivedL1A := cbe.acksReceivedL1A+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_BISnpInvL2dM_x_pI_store__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_E__C__M:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          msg := RequestL1A(adr,Fwd_GetML1A,msg_GetML1A.src,cbe.ownerL1A);
          Send_fwd(msg, m);
          cbe.ownerL1A := msg_GetML1A.src;
          cbe.proxy_msgL2 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_BIConflictAckL2dM_x_pI_store__C__M;
          return true;
        
        case BISnpDataL2:
          msg_GetSL1A := RequestL1A(adr,GetSL1A,m,m);
          msg := RequestL1A(adr,Fwd_GetSL1A,msg_GetSL1A.src,cbe.ownerL1A);
          Send_fwd(msg, m);
          AddElement_cacheL1A(cbe.cacheL1A, msg_GetSL1A.src);
          AddElement_cacheL1A(cbe.cacheL1A, cbe.ownerL1A);
          cbe.proxy_msgL2 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_BISnpDataL2dE_GetS_x_pI_load__C__M;
          return true;
        
        case BISnpInvL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          msg := RequestL1A(adr,Fwd_GetML1A,msg_GetML1A.src,cbe.ownerL1A);
          Send_fwd(msg, m);
          cbe.ownerL1A := msg_GetML1A.src;
          cbe.proxy_msgL2 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_BISnpInvL2dM_x_pI_store__C__M;
          return true;
        
        case GetML1A:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1A := inmsg;
          msg := RequestL1A(adr,Fwd_GetML1A,cbe.proxy_msgL1A.src,cbe.ownerL1A);
          Send_fwd(msg, m);
          cbe.ownerL1A := cbe.proxy_msgL1A.src;
          undefine cbe.proxy_msgL1A;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_M__C__M;
          return true;
        
        case GetSL1A:
          Set_perm(load, adr, m);
          cbe.proxy_msgL1A := inmsg;
          msg := RequestL1A(adr,Fwd_GetSL1A,cbe.proxy_msgL1A.src,cbe.ownerL1A);
          Send_fwd(msg, m);
          AddElement_cacheL1A(cbe.cacheL1A, cbe.proxy_msgL1A.src);
          AddElement_cacheL1A(cbe.cacheL1A, cbe.ownerL1A);
          undefine cbe.proxy_msgL1A;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetSL1AE_GetS__C__M;
          return true;
        
        case PutEL1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if !(cbe.ownerL1A = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_E__C__M;
            return true;
          endif;
          if (cbe.ownerL1A = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__M;
            return true;
          endif;
        
        case PutML1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if (cbe.ownerL1A = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__M;
            return true;
          endif;
          if !(cbe.ownerL1A = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_E__C__M;
            return true;
          endif;
        
        case PutSL1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if !(cbe.ownerL1A = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_E__C__M;
            return true;
          endif;
          if (cbe.ownerL1A = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_GetML1AI__C__I_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
          cbe.ownerL1A := msg_GetML1A.src;
          cbe.cl := msg_GetM_Ack_ADL1A.cl;
          cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          Set_perm(store, adr, m);
          msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
          if (cbe.ownerL1A = msg_PutML1A.src) then
          cbe.cl := msg_PutML1A.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetML1AI__C__I_store;
          return true;
          endif;
          endif;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetML1AI__C__I_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetML1AI__C__I_store;
          return true;
        
        case Cmp_EL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetML1AI__C__I_store_Cmp_E;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_GetML1AI__C__I_store_Cmp_E:
      switch inmsg.mtype
        case MemDataL2:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg := RespAckL1A(adr,GetM_Ack_ADL1A,m,cbe.proxy_msgL1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
          Send_resp(msg, m);
          cbe.ownerL1A := cbe.proxy_msgL1A.src;
          undefine cbe.proxy_msgL1A;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_M__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_GetML1AI__C__S_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
          cbe.ownerL1A := msg_GetML1A.src;
          cbe.cl := msg_GetM_Ack_ADL1A.cl;
          cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          Set_perm(store, adr, m);
          msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
          if (cbe.ownerL1A = msg_PutML1A.src) then
          cbe.cl := msg_PutML1A.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetML1AI__C__I_store;
          return true;
          endif;
          endif;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetML1AI__C__S_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetML1AI__C__S_store;
          return true;
        
        case Cmp_EL2:
          Set_perm(store, adr, m);
          msg := RespAckL1A(adr,GetM_Ack_ADL1A,m,cbe.proxy_msgL1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
          Send_resp(msg, m);
          cbe.ownerL1A := cbe.proxy_msgL1A.src;
          undefine cbe.proxy_msgL1A;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_M__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_GetML1AS__C__I_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          if (IsElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src)) then
            RemoveElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src);
            msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            msg := AckL1A(adr,InvL1A,msg_GetML1A.src,msg_GetML1A.src);
            Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
            cbe.ownerL1A := msg_GetML1A.src;
            ClearVector_cacheL1A(cbe.cacheL1A);
            cbe.cl := msg_GetM_Ack_ADL1A.cl;
            cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
            if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              Set_perm(store, adr, m);
              msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
              msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
              RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
              if (cbe.ownerL1A = msg_PutML1A.src) then
              cbe.cl := msg_PutML1A.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
              Send_birsp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_GetML1AS__C__I_store;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__I_store;
              return true;
            endif;
          endif;
          if !(IsElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src)) then
            msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            msg := AckL1A(adr,InvL1A,msg_GetML1A.src,msg_GetML1A.src);
            Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
            cbe.ownerL1A := msg_GetML1A.src;
            ClearVector_cacheL1A(cbe.cacheL1A);
            cbe.cl := msg_GetM_Ack_ADL1A.cl;
            cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
            if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              Set_perm(store, adr, m);
              msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
              msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
              RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
              if (cbe.ownerL1A = msg_PutML1A.src) then
              cbe.cl := msg_PutML1A.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
              Send_birsp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_GetML1AS__C__I_store;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__I_store;
              return true;
            endif;
          endif;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetML1AS__C__I_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetML1AS__C__I_store;
          return true;
        
        case Cmp_EL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetML1AS__C__I_store_Cmp_E;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_GetML1AS__C__I_store_Cmp_E:
      switch inmsg.mtype
        case MemDataL2:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          if !(IsElement_cacheL1A(cbe.cacheL1A, cbe.proxy_msgL1A.src)) then
            msg := RespAckL1A(adr,GetM_Ack_ADL1A,m,cbe.proxy_msgL1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            Send_resp(msg, m);
            msg := AckL1A(adr,InvL1A,cbe.proxy_msgL1A.src,cbe.proxy_msgL1A.src);
            Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
            cbe.ownerL1A := cbe.proxy_msgL1A.src;
            ClearVector_cacheL1A(cbe.cacheL1A);
            undefine cbe.proxy_msgL1A;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_M__C__M;
            return true;
          endif;
          if (IsElement_cacheL1A(cbe.cacheL1A, cbe.proxy_msgL1A.src)) then
            RemoveElement_cacheL1A(cbe.cacheL1A, cbe.proxy_msgL1A.src);
            msg := RespAckL1A(adr,GetM_Ack_ADL1A,m,cbe.proxy_msgL1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            Send_resp(msg, m);
            msg := AckL1A(adr,InvL1A,cbe.proxy_msgL1A.src,cbe.proxy_msgL1A.src);
            Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
            cbe.ownerL1A := cbe.proxy_msgL1A.src;
            ClearVector_cacheL1A(cbe.cacheL1A);
            undefine cbe.proxy_msgL1A;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_M__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_GetML1AS__C__S_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          if !(IsElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src)) then
            msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            msg := AckL1A(adr,InvL1A,msg_GetML1A.src,msg_GetML1A.src);
            Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
            cbe.ownerL1A := msg_GetML1A.src;
            ClearVector_cacheL1A(cbe.cacheL1A);
            cbe.cl := msg_GetM_Ack_ADL1A.cl;
            cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
            if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              Set_perm(store, adr, m);
              msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
              msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
              RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
              if (cbe.ownerL1A = msg_PutML1A.src) then
              cbe.cl := msg_PutML1A.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
              Send_birsp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_GetML1AS__C__I_store;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__I_store;
              return true;
            endif;
          endif;
          if (IsElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src)) then
            RemoveElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src);
            msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            msg := AckL1A(adr,InvL1A,msg_GetML1A.src,msg_GetML1A.src);
            Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
            cbe.ownerL1A := msg_GetML1A.src;
            ClearVector_cacheL1A(cbe.cacheL1A);
            cbe.cl := msg_GetM_Ack_ADL1A.cl;
            cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
            if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__I_store;
              return true;
            endif;
            if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              Set_perm(store, adr, m);
              msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
              msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
              RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
              if (cbe.ownerL1A = msg_PutML1A.src) then
              cbe.cl := msg_PutML1A.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
              Send_birsp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_GetML1AS__C__I_store;
              return true;
              endif;
            endif;
          endif;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetML1AS__C__S_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetML1AS__C__S_store;
          return true;
        
        case Cmp_EL2:
          Set_perm(store, adr, m);
          if !(IsElement_cacheL1A(cbe.cacheL1A, cbe.proxy_msgL1A.src)) then
            msg := RespAckL1A(adr,GetM_Ack_ADL1A,m,cbe.proxy_msgL1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            Send_resp(msg, m);
            msg := AckL1A(adr,InvL1A,cbe.proxy_msgL1A.src,cbe.proxy_msgL1A.src);
            Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
            cbe.ownerL1A := cbe.proxy_msgL1A.src;
            ClearVector_cacheL1A(cbe.cacheL1A);
            undefine cbe.proxy_msgL1A;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_M__C__M;
            return true;
          endif;
          if (IsElement_cacheL1A(cbe.cacheL1A, cbe.proxy_msgL1A.src)) then
            RemoveElement_cacheL1A(cbe.cacheL1A, cbe.proxy_msgL1A.src);
            msg := RespAckL1A(adr,GetM_Ack_ADL1A,m,cbe.proxy_msgL1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            Send_resp(msg, m);
            msg := AckL1A(adr,InvL1A,cbe.proxy_msgL1A.src,cbe.proxy_msgL1A.src);
            Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
            cbe.ownerL1A := cbe.proxy_msgL1A.src;
            ClearVector_cacheL1A(cbe.cacheL1A);
            undefine cbe.proxy_msgL1A;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_M__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_GetSL1AE_GetS__C__M:
      switch inmsg.mtype
        case WBL1A:
          if !(inmsg.src = cbe.ownerL1A) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_GetSL1AE_GetS__C__M;
            return true;
          endif;
          if (inmsg.src = cbe.ownerL1A) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_S__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_GetSL1AI__C__I_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
          cbe.ownerL1A := msg_GetML1A.src;
          cbe.cl := msg_GetM_Ack_ADL1A.cl;
          cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          Set_perm(store, adr, m);
          msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
          if (cbe.ownerL1A = msg_PutML1A.src) then
          cbe.cl := msg_PutML1A.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetSL1AI__C__I_store;
          return true;
          endif;
          endif;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetSL1AI__C__I_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetSL1AI__C__I_store;
          return true;
        
        case Cmp_EL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetSL1AI__C__I_store_Cmp_E;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_GetSL1AI__C__I_store_Cmp_E:
      switch inmsg.mtype
        case MemDataL2:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg := RespL1A(adr,GetM_Ack_DL1A,m,cbe.proxy_msgL1A.src,cbe.cl);
          Send_resp(msg, m);
          cbe.ownerL1A := cbe.proxy_msgL1A.src;
          undefine cbe.proxy_msgL1A;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_E__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_GetSL1AI__C__S_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
          cbe.ownerL1A := msg_GetML1A.src;
          cbe.cl := msg_GetM_Ack_ADL1A.cl;
          cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          Set_perm(store, adr, m);
          msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
          if (cbe.ownerL1A = msg_PutML1A.src) then
          cbe.cl := msg_PutML1A.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetSL1AI__C__I_store;
          return true;
          endif;
          endif;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetSL1AI__C__S_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetSL1AI__C__S_store;
          return true;
        
        case Cmp_EL2:
          Set_perm(store, adr, m);
          msg := RespL1A(adr,GetM_Ack_DL1A,m,cbe.proxy_msgL1A.src,cbe.cl);
          Send_resp(msg, m);
          cbe.ownerL1A := cbe.proxy_msgL1A.src;
          undefine cbe.proxy_msgL1A;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_E__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_GetSL1AM_GetS__C__M:
      switch inmsg.mtype
        case WBL1A:
          if !(inmsg.src = cbe.ownerL1A) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_GetSL1AM_GetS__C__M;
            return true;
          endif;
          if (inmsg.src = cbe.ownerL1A) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_S__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_I__C__E:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
          cbe.ownerL1A := msg_GetML1A.src;
          cbe.cl := msg_GetM_Ack_ADL1A.cl;
          cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          Set_perm(store, adr, m);
          msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
          if (cbe.ownerL1A = msg_PutML1A.src) then
          cbe.cl := msg_PutML1A.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__I;
          return true;
          endif;
          endif;
        
        case BISnpDataL2:
          msg_GetSL1A := RequestL1A(adr,GetSL1A,m,m);
          msg_GetM_Ack_DL1A := RespL1A(adr,GetM_Ack_DL1A,m,msg_GetSL1A.src,cbe.cl);
          cbe.ownerL1A := msg_GetSL1A.src;
          cbe.cl := msg_GetM_Ack_DL1A.cl;
          Set_perm(load, adr, m);
          msg_PutEL1A := AckL1A(adr,PutEL1A,m,m);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutEL1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutEL1A.src);
          if (cbe.ownerL1A = msg_PutEL1A.src) then
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspSL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__S;
          return true;
          endif;
        
        case BISnpInvL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
          cbe.ownerL1A := msg_GetML1A.src;
          cbe.cl := msg_GetM_Ack_ADL1A.cl;
          cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          Set_perm(store, adr, m);
          msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
          if (cbe.ownerL1A = msg_PutML1A.src) then
          cbe.cl := msg_PutML1A.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__I;
          return true;
          endif;
          endif;
        
        case GetML1A:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1A := inmsg;
          msg := RespAckL1A(adr,GetM_Ack_ADL1A,m,cbe.proxy_msgL1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
          Send_resp(msg, m);
          cbe.ownerL1A := cbe.proxy_msgL1A.src;
          undefine cbe.proxy_msgL1A;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_M__C__M;
          return true;
        
        case GetSL1A:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1A := inmsg;
          msg := RespL1A(adr,GetM_Ack_DL1A,m,cbe.proxy_msgL1A.src,cbe.cl);
          Send_resp(msg, m);
          cbe.ownerL1A := cbe.proxy_msgL1A.src;
          undefine cbe.proxy_msgL1A;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_E__C__M;
          return true;
        
        case PutEL1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if !(cbe.ownerL1A = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__E;
            return true;
          endif;
          if (cbe.ownerL1A = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__E;
            return true;
          endif;
        
        case PutML1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if !(cbe.ownerL1A = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__E;
            return true;
          endif;
          if (cbe.ownerL1A = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__E;
            return true;
          endif;
        
        case PutSL1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if (VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__E;
            return true;
          endif;
          if !(VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__E;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_I__C__I:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
          cbe.ownerL1A := msg_GetML1A.src;
          cbe.cl := msg_GetM_Ack_ADL1A.cl;
          cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          Set_perm(store, adr, m);
          msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
          if (cbe.ownerL1A = msg_PutML1A.src) then
          cbe.cl := msg_PutML1A.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__I;
          return true;
          endif;
          endif;
        
        case BISnpDataL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__I;
          return true;
        
        case BISnpInvL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
          cbe.ownerL1A := msg_GetML1A.src;
          cbe.cl := msg_GetM_Ack_ADL1A.cl;
          cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          Set_perm(store, adr, m);
          msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
          if (cbe.ownerL1A = msg_PutML1A.src) then
          cbe.cl := msg_PutML1A.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__I;
          return true;
          endif;
          endif;
        
        case GetML1A:
          msg := ReqL2(adr,MemRd_A_SnpInvL2,m,to_m_directoryL2(directoryL2));
          Send_req2(msg, m);
          cbe.proxy_msgL1A := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetML1AI__C__I_store;
          return true;
        
        case GetSL1A:
          msg := ReqL2(adr,MemRd_A_SnpInvL2,m,to_m_directoryL2(directoryL2));
          Send_req2(msg, m);
          cbe.proxy_msgL1A := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetSL1AI__C__I_store;
          return true;
        
        case PutEL1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if !(cbe.ownerL1A = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__I;
            return true;
          endif;
          if (cbe.ownerL1A = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__I;
            return true;
          endif;
        
        case PutML1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if (cbe.ownerL1A = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__I;
            return true;
          endif;
          if !(cbe.ownerL1A = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__I;
            return true;
          endif;
        
        case PutSL1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if (VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__I;
            return true;
          endif;
          if !(VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__I;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_I__C__M:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
          cbe.ownerL1A := msg_GetML1A.src;
          cbe.cl := msg_GetM_Ack_ADL1A.cl;
          cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          Set_perm(store, adr, m);
          msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
          if (cbe.ownerL1A = msg_PutML1A.src) then
          cbe.cl := msg_PutML1A.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := RwdL2(adr,MemWr_IL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_rwd(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_BIConflictAckL2I__C__M_BIConflictAck;
          return true;
          endif;
          endif;
        
        case BISnpDataL2:
          msg_GetSL1A := RequestL1A(adr,GetSL1A,m,m);
          msg_GetM_Ack_DL1A := RespL1A(adr,GetM_Ack_DL1A,m,msg_GetSL1A.src,cbe.cl);
          cbe.ownerL1A := msg_GetSL1A.src;
          cbe.cl := msg_GetM_Ack_DL1A.cl;
          Set_perm(load, adr, m);
          msg_PutEL1A := AckL1A(adr,PutEL1A,m,m);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutEL1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutEL1A.src);
          if (cbe.ownerL1A = msg_PutEL1A.src) then
          cbe.proxy_msgL2 := inmsg;
          msg := RwdL2(adr,MemWr_SL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_rwd(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_BISnpDataL2I__C__M_BISnpData;
          return true;
          endif;
        
        case BISnpInvL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
          cbe.ownerL1A := msg_GetML1A.src;
          cbe.cl := msg_GetM_Ack_ADL1A.cl;
          cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          Set_perm(store, adr, m);
          msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
          if (cbe.ownerL1A = msg_PutML1A.src) then
          cbe.cl := msg_PutML1A.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := RwdL2(adr,MemWr_IL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_rwd(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_BISnpInvL2I__C__M_BISnpInv;
          return true;
          endif;
          endif;
        
        case GetML1A:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1A := inmsg;
          msg := RespAckL1A(adr,GetM_Ack_ADL1A,m,cbe.proxy_msgL1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
          Send_resp(msg, m);
          cbe.ownerL1A := cbe.proxy_msgL1A.src;
          undefine cbe.proxy_msgL1A;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_M__C__M;
          return true;
        
        case GetSL1A:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1A := inmsg;
          msg := RespL1A(adr,GetM_Ack_DL1A,m,cbe.proxy_msgL1A.src,cbe.cl);
          Send_resp(msg, m);
          cbe.ownerL1A := cbe.proxy_msgL1A.src;
          undefine cbe.proxy_msgL1A;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_E__C__M;
          return true;
        
        case PutEL1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if !(cbe.ownerL1A = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__M;
            return true;
          endif;
          if (cbe.ownerL1A = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__M;
            return true;
          endif;
        
        case PutML1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if (cbe.ownerL1A = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__M;
            return true;
          endif;
          if !(cbe.ownerL1A = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__M;
            return true;
          endif;
        
        case PutSL1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if !(VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__M;
            return true;
          endif;
          if (VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_I__C__S:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
          cbe.ownerL1A := msg_GetML1A.src;
          cbe.cl := msg_GetM_Ack_ADL1A.cl;
          cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          Set_perm(store, adr, m);
          msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
          if (cbe.ownerL1A = msg_PutML1A.src) then
          cbe.cl := msg_PutML1A.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__I;
          return true;
          endif;
          endif;
        
        case BISnpDataL2:
          msg_GetSL1A := RequestL1A(adr,GetSL1A,m,m);
          msg_GetM_Ack_DL1A := RespL1A(adr,GetM_Ack_DL1A,m,msg_GetSL1A.src,cbe.cl);
          cbe.ownerL1A := msg_GetSL1A.src;
          cbe.cl := msg_GetM_Ack_DL1A.cl;
          Set_perm(load, adr, m);
          msg_PutEL1A := AckL1A(adr,PutEL1A,m,m);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutEL1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutEL1A.src);
          if (cbe.ownerL1A = msg_PutEL1A.src) then
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspSL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__S;
          return true;
          endif;
        
        case BISnpInvL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
          cbe.ownerL1A := msg_GetML1A.src;
          cbe.cl := msg_GetM_Ack_ADL1A.cl;
          cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          cbe.acksExpectedL1A := 0;
          cbe.acksReceivedL1A := 0;
          Set_perm(store, adr, m);
          msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
          if (cbe.ownerL1A = msg_PutML1A.src) then
          cbe.cl := msg_PutML1A.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__I;
          return true;
          endif;
          endif;
        
        case GetML1A:
          msg := ReqL2(adr,MemInv_A_SnpInvL2,m,to_m_directoryL2(directoryL2));
          Send_req2(msg, m);
          cbe.proxy_msgL1A := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetML1AI__C__S_store;
          return true;
        
        case GetSL1A:
          msg := ReqL2(adr,MemInv_A_SnpInvL2,m,to_m_directoryL2(directoryL2));
          Send_req2(msg, m);
          cbe.proxy_msgL1A := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetSL1AI__C__S_store;
          return true;
        
        case PutEL1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if !(cbe.ownerL1A = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__S;
            return true;
          endif;
          if (cbe.ownerL1A = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__S;
            return true;
          endif;
        
        case PutML1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if !(cbe.ownerL1A = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__S;
            return true;
          endif;
          if (cbe.ownerL1A = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__S;
            return true;
          endif;
        
        case PutSL1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if (VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__S;
            return true;
          endif;
          if !(VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__S;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_M__C__M:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          msg := RequestL1A(adr,Fwd_GetML1A,msg_GetML1A.src,cbe.ownerL1A);
          Send_fwd(msg, m);
          cbe.ownerL1A := msg_GetML1A.src;
          cbe.proxy_msgL2 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_BIConflictAckL2dM_x_pI_store__C__M;
          return true;
        
        case BISnpDataL2:
          msg_GetSL1A := RequestL1A(adr,GetSL1A,m,m);
          msg := RequestL1A(adr,Fwd_GetSL1A,msg_GetSL1A.src,cbe.ownerL1A);
          Send_fwd(msg, m);
          AddElement_cacheL1A(cbe.cacheL1A, msg_GetSL1A.src);
          AddElement_cacheL1A(cbe.cacheL1A, cbe.ownerL1A);
          cbe.proxy_msgL2 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_BISnpDataL2dM_GetS_x_pI_load__C__M;
          return true;
        
        case BISnpInvL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          msg := RequestL1A(adr,Fwd_GetML1A,msg_GetML1A.src,cbe.ownerL1A);
          Send_fwd(msg, m);
          cbe.ownerL1A := msg_GetML1A.src;
          cbe.proxy_msgL2 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_BISnpInvL2dM_x_pI_store__C__M;
          return true;
        
        case GetML1A:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1A := inmsg;
          msg := RequestL1A(adr,Fwd_GetML1A,cbe.proxy_msgL1A.src,cbe.ownerL1A);
          Send_fwd(msg, m);
          cbe.ownerL1A := cbe.proxy_msgL1A.src;
          undefine cbe.proxy_msgL1A;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_M__C__M;
          return true;
        
        case GetSL1A:
          Set_perm(load, adr, m);
          cbe.proxy_msgL1A := inmsg;
          msg := RequestL1A(adr,Fwd_GetSL1A,cbe.proxy_msgL1A.src,cbe.ownerL1A);
          Send_fwd(msg, m);
          AddElement_cacheL1A(cbe.cacheL1A, cbe.proxy_msgL1A.src);
          AddElement_cacheL1A(cbe.cacheL1A, cbe.ownerL1A);
          undefine cbe.proxy_msgL1A;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetSL1AM_GetS__C__M;
          return true;
        
        case PutEL1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if !(cbe.ownerL1A = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_M__C__M;
            return true;
          endif;
          if (cbe.ownerL1A = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__M;
            return true;
          endif;
        
        case PutML1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if !(cbe.ownerL1A = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_M__C__M;
            return true;
          endif;
          if (cbe.ownerL1A = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__M;
            return true;
          endif;
        
        case PutSL1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if !(cbe.ownerL1A = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_M__C__M;
            return true;
          endif;
          if (cbe.ownerL1A = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_S__C__E:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          if !(IsElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src)) then
            msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            msg := AckL1A(adr,InvL1A,msg_GetML1A.src,msg_GetML1A.src);
            Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
            cbe.ownerL1A := msg_GetML1A.src;
            ClearVector_cacheL1A(cbe.cacheL1A);
            cbe.cl := msg_GetM_Ack_ADL1A.cl;
            cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
            if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__E;
              return true;
            endif;
            if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              Set_perm(store, adr, m);
              msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
              msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
              RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
              if (cbe.ownerL1A = msg_PutML1A.src) then
              cbe.cl := msg_PutML1A.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
              Send_birsp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_I__C__I;
              return true;
              endif;
            endif;
          endif;
          if (IsElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src)) then
            RemoveElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src);
            msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            msg := AckL1A(adr,InvL1A,msg_GetML1A.src,msg_GetML1A.src);
            Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
            cbe.ownerL1A := msg_GetML1A.src;
            ClearVector_cacheL1A(cbe.cacheL1A);
            cbe.cl := msg_GetM_Ack_ADL1A.cl;
            cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
            if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              Set_perm(store, adr, m);
              msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
              msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
              RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
              if (cbe.ownerL1A = msg_PutML1A.src) then
              cbe.cl := msg_PutML1A.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
              Send_birsp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_I__C__I;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__E;
              return true;
            endif;
          endif;
        
        case BISnpDataL2:
          msg_GetSL1A := RequestL1A(adr,GetSL1A,m,m);
          msg_GetS_AckL1A := RespL1A(adr,GetS_AckL1A,m,msg_GetSL1A.src,cbe.cl);
          AddElement_cacheL1A(cbe.cacheL1A, msg_GetSL1A.src);
          cbe.cl := msg_GetS_AckL1A.cl;
          Set_perm(load, adr, m);
          msg_PutSL1A := RequestL1A(adr,PutSL1A,m,m);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutSL1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutSL1A.src);
          if !(VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            cbe.proxy_msgL2 := inmsg;
            msg := BIRspL2(adr,BIRspSL2,m,cbe.proxy_msgL2.src);
            Send_birsp(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_S__C__S;
            return true;
          endif;
          if (VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            cbe.proxy_msgL2 := inmsg;
            msg := BIRspL2(adr,BIRspSL2,m,cbe.proxy_msgL2.src);
            Send_birsp(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__S;
            return true;
          endif;
        
        case BISnpInvL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          if (IsElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src)) then
            RemoveElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src);
            msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            msg := AckL1A(adr,InvL1A,msg_GetML1A.src,msg_GetML1A.src);
            Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
            cbe.ownerL1A := msg_GetML1A.src;
            ClearVector_cacheL1A(cbe.cacheL1A);
            cbe.cl := msg_GetM_Ack_ADL1A.cl;
            cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
            if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              Set_perm(store, adr, m);
              msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
              msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
              RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
              if (cbe.ownerL1A = msg_PutML1A.src) then
              cbe.cl := msg_PutML1A.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
              Send_birsp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_I__C__I;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__E;
              return true;
            endif;
          endif;
          if !(IsElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src)) then
            msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            msg := AckL1A(adr,InvL1A,msg_GetML1A.src,msg_GetML1A.src);
            Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
            cbe.ownerL1A := msg_GetML1A.src;
            ClearVector_cacheL1A(cbe.cacheL1A);
            cbe.cl := msg_GetM_Ack_ADL1A.cl;
            cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
            if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__E;
              return true;
            endif;
            if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              Set_perm(store, adr, m);
              msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
              msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
              RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
              if (cbe.ownerL1A = msg_PutML1A.src) then
              cbe.cl := msg_PutML1A.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
              Send_birsp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_I__C__I;
              return true;
              endif;
            endif;
          endif;
        
        case GetML1A:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1A := inmsg;
          if (IsElement_cacheL1A(cbe.cacheL1A, cbe.proxy_msgL1A.src)) then
            RemoveElement_cacheL1A(cbe.cacheL1A, cbe.proxy_msgL1A.src);
            msg := RespAckL1A(adr,GetM_Ack_ADL1A,m,cbe.proxy_msgL1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            Send_resp(msg, m);
            msg := AckL1A(adr,InvL1A,cbe.proxy_msgL1A.src,cbe.proxy_msgL1A.src);
            Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
            cbe.ownerL1A := cbe.proxy_msgL1A.src;
            ClearVector_cacheL1A(cbe.cacheL1A);
            undefine cbe.proxy_msgL1A;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_M__C__M;
            return true;
          endif;
          if !(IsElement_cacheL1A(cbe.cacheL1A, cbe.proxy_msgL1A.src)) then
            msg := RespAckL1A(adr,GetM_Ack_ADL1A,m,cbe.proxy_msgL1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            Send_resp(msg, m);
            msg := AckL1A(adr,InvL1A,cbe.proxy_msgL1A.src,cbe.proxy_msgL1A.src);
            Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
            cbe.ownerL1A := cbe.proxy_msgL1A.src;
            ClearVector_cacheL1A(cbe.cacheL1A);
            undefine cbe.proxy_msgL1A;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_M__C__M;
            return true;
          endif;
        
        case GetSL1A:
          Set_perm(load, adr, m);
          cbe.proxy_msgL1A := inmsg;
          msg := RespL1A(adr,GetS_AckL1A,m,cbe.proxy_msgL1A.src,cbe.cl);
          Send_resp(msg, m);
          AddElement_cacheL1A(cbe.cacheL1A, cbe.proxy_msgL1A.src);
          undefine cbe.proxy_msgL1A;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_S__C__E;
          return true;
        
        case PutEL1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if (VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__E;
            return true;
          endif;
          if !(VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_S__C__E;
            return true;
          endif;
        
        case PutML1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if (VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__E;
            return true;
          endif;
          if !(VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_S__C__E;
            return true;
          endif;
        
        case PutSL1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if (VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__E;
            return true;
          endif;
          if !(VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_S__C__E;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_S__C__M:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          if !(IsElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src)) then
            msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            msg := AckL1A(adr,InvL1A,msg_GetML1A.src,msg_GetML1A.src);
            Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
            cbe.ownerL1A := msg_GetML1A.src;
            ClearVector_cacheL1A(cbe.cacheL1A);
            cbe.cl := msg_GetM_Ack_ADL1A.cl;
            cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
            if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__M;
              return true;
            endif;
            if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              Set_perm(store, adr, m);
              msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
              msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
              RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
              if (cbe.ownerL1A = msg_PutML1A.src) then
              cbe.cl := msg_PutML1A.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := RwdL2(adr,MemWr_IL2,m,cbe.proxy_msgL2.src,cbe.cl);
              Send_rwd(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_BIConflictAckL2I__C__M_BIConflictAck;
              return true;
              endif;
            endif;
          endif;
          if (IsElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src)) then
            RemoveElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src);
            msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            msg := AckL1A(adr,InvL1A,msg_GetML1A.src,msg_GetML1A.src);
            Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
            cbe.ownerL1A := msg_GetML1A.src;
            ClearVector_cacheL1A(cbe.cacheL1A);
            cbe.cl := msg_GetM_Ack_ADL1A.cl;
            cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
            if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__M;
              return true;
            endif;
            if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              Set_perm(store, adr, m);
              msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
              msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
              RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
              if (cbe.ownerL1A = msg_PutML1A.src) then
              cbe.cl := msg_PutML1A.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := RwdL2(adr,MemWr_IL2,m,cbe.proxy_msgL2.src,cbe.cl);
              Send_rwd(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_BIConflictAckL2I__C__M_BIConflictAck;
              return true;
              endif;
            endif;
          endif;
        
        case BISnpDataL2:
          msg_GetSL1A := RequestL1A(adr,GetSL1A,m,m);
          msg_GetS_AckL1A := RespL1A(adr,GetS_AckL1A,m,msg_GetSL1A.src,cbe.cl);
          AddElement_cacheL1A(cbe.cacheL1A, msg_GetSL1A.src);
          cbe.cl := msg_GetS_AckL1A.cl;
          Set_perm(load, adr, m);
          msg_PutSL1A := RequestL1A(adr,PutSL1A,m,m);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutSL1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutSL1A.src);
          if (VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            cbe.proxy_msgL2 := inmsg;
            msg := RwdL2(adr,MemWr_SL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_rwd(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_BISnpDataL2I__C__M_BISnpData;
            return true;
          endif;
          if !(VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            cbe.proxy_msgL2 := inmsg;
            msg := RwdL2(adr,MemWr_SL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_rwd(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_BISnpDataL2S__C__M_BISnpData;
            return true;
          endif;
        
        case BISnpInvL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          if !(IsElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src)) then
            msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            msg := AckL1A(adr,InvL1A,msg_GetML1A.src,msg_GetML1A.src);
            Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
            cbe.ownerL1A := msg_GetML1A.src;
            ClearVector_cacheL1A(cbe.cacheL1A);
            cbe.cl := msg_GetM_Ack_ADL1A.cl;
            cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
            if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              Set_perm(store, adr, m);
              msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
              msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
              RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
              if (cbe.ownerL1A = msg_PutML1A.src) then
              cbe.cl := msg_PutML1A.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := RwdL2(adr,MemWr_IL2,m,cbe.proxy_msgL2.src,cbe.cl);
              Send_rwd(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_BISnpInvL2I__C__M_BISnpInv;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__M;
              return true;
            endif;
          endif;
          if (IsElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src)) then
            RemoveElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src);
            msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            msg := AckL1A(adr,InvL1A,msg_GetML1A.src,msg_GetML1A.src);
            Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
            cbe.ownerL1A := msg_GetML1A.src;
            ClearVector_cacheL1A(cbe.cacheL1A);
            cbe.cl := msg_GetM_Ack_ADL1A.cl;
            cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
            if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              Set_perm(store, adr, m);
              msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
              msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
              RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
              if (cbe.ownerL1A = msg_PutML1A.src) then
              cbe.cl := msg_PutML1A.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := RwdL2(adr,MemWr_IL2,m,cbe.proxy_msgL2.src,cbe.cl);
              Send_rwd(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_BISnpInvL2I__C__M_BISnpInv;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__M;
              return true;
            endif;
          endif;
        
        case GetML1A:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1A := inmsg;
          if !(IsElement_cacheL1A(cbe.cacheL1A, cbe.proxy_msgL1A.src)) then
            msg := RespAckL1A(adr,GetM_Ack_ADL1A,m,cbe.proxy_msgL1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            Send_resp(msg, m);
            msg := AckL1A(adr,InvL1A,cbe.proxy_msgL1A.src,cbe.proxy_msgL1A.src);
            Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
            cbe.ownerL1A := cbe.proxy_msgL1A.src;
            ClearVector_cacheL1A(cbe.cacheL1A);
            undefine cbe.proxy_msgL1A;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_M__C__M;
            return true;
          endif;
          if (IsElement_cacheL1A(cbe.cacheL1A, cbe.proxy_msgL1A.src)) then
            RemoveElement_cacheL1A(cbe.cacheL1A, cbe.proxy_msgL1A.src);
            msg := RespAckL1A(adr,GetM_Ack_ADL1A,m,cbe.proxy_msgL1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            Send_resp(msg, m);
            msg := AckL1A(adr,InvL1A,cbe.proxy_msgL1A.src,cbe.proxy_msgL1A.src);
            Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
            cbe.ownerL1A := cbe.proxy_msgL1A.src;
            ClearVector_cacheL1A(cbe.cacheL1A);
            undefine cbe.proxy_msgL1A;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_M__C__M;
            return true;
          endif;
        
        case GetSL1A:
          Set_perm(load, adr, m);
          cbe.proxy_msgL1A := inmsg;
          msg := RespL1A(adr,GetS_AckL1A,m,cbe.proxy_msgL1A.src,cbe.cl);
          Send_resp(msg, m);
          AddElement_cacheL1A(cbe.cacheL1A, cbe.proxy_msgL1A.src);
          undefine cbe.proxy_msgL1A;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_S__C__M;
          return true;
        
        case PutEL1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if !(VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_S__C__M;
            return true;
          endif;
          if (VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__M;
            return true;
          endif;
        
        case PutML1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if !(VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_S__C__M;
            return true;
          endif;
          if (VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__M;
            return true;
          endif;
        
        case PutSL1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if (VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__M;
            return true;
          endif;
          if !(VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_S__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_S__C__S:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          if (IsElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src)) then
            RemoveElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src);
            msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            msg := AckL1A(adr,InvL1A,msg_GetML1A.src,msg_GetML1A.src);
            Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
            cbe.ownerL1A := msg_GetML1A.src;
            ClearVector_cacheL1A(cbe.cacheL1A);
            cbe.cl := msg_GetM_Ack_ADL1A.cl;
            cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
            if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__S;
              return true;
            endif;
            if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              Set_perm(store, adr, m);
              msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
              msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
              RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
              if (cbe.ownerL1A = msg_PutML1A.src) then
              cbe.cl := msg_PutML1A.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
              Send_birsp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_I__C__I;
              return true;
              endif;
            endif;
          endif;
          if !(IsElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src)) then
            msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            msg := AckL1A(adr,InvL1A,msg_GetML1A.src,msg_GetML1A.src);
            Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
            cbe.ownerL1A := msg_GetML1A.src;
            ClearVector_cacheL1A(cbe.cacheL1A);
            cbe.cl := msg_GetM_Ack_ADL1A.cl;
            cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
            if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              Set_perm(store, adr, m);
              msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
              msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
              RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
              if (cbe.ownerL1A = msg_PutML1A.src) then
              cbe.cl := msg_PutML1A.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
              Send_birsp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_I__C__I;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_BIConflictAckL2dM_x_pI_store_GetM_Ack_AD__C__S;
              return true;
            endif;
          endif;
        
        case BISnpDataL2:
          msg_GetSL1A := RequestL1A(adr,GetSL1A,m,m);
          msg_GetS_AckL1A := RespL1A(adr,GetS_AckL1A,m,msg_GetSL1A.src,cbe.cl);
          AddElement_cacheL1A(cbe.cacheL1A, msg_GetSL1A.src);
          cbe.cl := msg_GetS_AckL1A.cl;
          Set_perm(load, adr, m);
          msg_PutSL1A := RequestL1A(adr,PutSL1A,m,m);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutSL1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutSL1A.src);
          if !(VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            cbe.proxy_msgL2 := inmsg;
            msg := BIRspL2(adr,BIRspSL2,m,cbe.proxy_msgL2.src);
            Send_birsp(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_S__C__S;
            return true;
          endif;
          if (VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            cbe.proxy_msgL2 := inmsg;
            msg := BIRspL2(adr,BIRspSL2,m,cbe.proxy_msgL2.src);
            Send_birsp(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__S;
            return true;
          endif;
        
        case BISnpInvL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          if (IsElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src)) then
            RemoveElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src);
            msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            msg := AckL1A(adr,InvL1A,msg_GetML1A.src,msg_GetML1A.src);
            Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
            cbe.ownerL1A := msg_GetML1A.src;
            ClearVector_cacheL1A(cbe.cacheL1A);
            cbe.cl := msg_GetM_Ack_ADL1A.cl;
            cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
            if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__S;
              return true;
            endif;
            if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              Set_perm(store, adr, m);
              msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
              msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
              RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
              if (cbe.ownerL1A = msg_PutML1A.src) then
              cbe.cl := msg_PutML1A.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
              Send_birsp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_I__C__I;
              return true;
              endif;
            endif;
          endif;
          if !(IsElement_cacheL1A(cbe.cacheL1A, msg_GetML1A.src)) then
            msg_GetM_Ack_ADL1A := RespAckL1A(adr,GetM_Ack_ADL1A,m,msg_GetML1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            msg := AckL1A(adr,InvL1A,msg_GetML1A.src,msg_GetML1A.src);
            Multicast_fwd_v_cacheL1A(msg, cbe.cacheL1A, m);
            cbe.ownerL1A := msg_GetML1A.src;
            ClearVector_cacheL1A(cbe.cacheL1A);
            cbe.cl := msg_GetM_Ack_ADL1A.cl;
            cbe.acksExpectedL1A := msg_GetM_Ack_ADL1A.acksExpectedL1A;
            if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              cbe.acksExpectedL1A := 0;
              cbe.acksReceivedL1A := 0;
              Set_perm(store, adr, m);
              msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
              msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
              RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
              if (cbe.ownerL1A = msg_PutML1A.src) then
              cbe.cl := msg_PutML1A.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
              Send_birsp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_I__C__I;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_BISnpInvL2dM_x_pI_store_GetM_Ack_AD__C__S;
              return true;
            endif;
          endif;
        
        case GetML1A:
          msg := ReqL2(adr,MemInv_A_SnpInvL2,m,to_m_directoryL2(directoryL2));
          Send_req2(msg, m);
          cbe.proxy_msgL1A := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetML1AS__C__S_store;
          return true;
        
        case GetSL1A:
          Set_perm(load, adr, m);
          cbe.proxy_msgL1A := inmsg;
          msg := RespL1A(adr,GetS_AckL1A,m,cbe.proxy_msgL1A.src,cbe.cl);
          Send_resp(msg, m);
          AddElement_cacheL1A(cbe.cacheL1A, cbe.proxy_msgL1A.src);
          undefine cbe.proxy_msgL1A;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_S__C__S;
          return true;
        
        case PutEL1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if !(VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_S__C__S;
            return true;
          endif;
          if (VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__S;
            return true;
          endif;
        
        case PutML1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if !(VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_S__C__S;
            return true;
          endif;
          if (VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__S;
            return true;
          endif;
        
        case PutSL1A:
          msg := AckL1A(adr,Put_AckL1A,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1A(cbe.cacheL1A, inmsg.src);
          if (VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__S;
            return true;
          endif;
          if !(VectorCount_cacheL1A(cbe.cacheL1A) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_S__C__S;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_evictI__C__E_evict:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictI__C__E_evict_x_I;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictI__C__E_evict;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictI__C__E_evict;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_evictI__C__E_evict_x_I:
      switch inmsg.mtype
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictI__C__E_evict_x_I;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictI__C__E_evict_x_I;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_evictI__C__M_evict:
      switch inmsg.mtype
        case BIConflictAckL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictI__C__M_evict_BIConflictAck;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictI__C__M_evict;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictI__C__M_evict;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_evictI__C__M_evict_BIConflictAck:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_evictI__C__S_evict:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictI__C__S_evict_x_I;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictI__C__S_evict;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictI__C__S_evict;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_evictI__C__S_evict_x_I:
      switch inmsg.mtype
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictI__C__S_evict_x_I;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictI__C__S_evict_x_I;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_evictdM_x_pI_store_GetM_Ack_AD__C__E:
      switch inmsg.mtype
        case Inv_AckL1A:
          cbe.acksReceivedL1A := cbe.acksReceivedL1A+1;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            Set_perm(store, adr, m);
            msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
            msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
            RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
            if (cbe.ownerL1A = msg_PutML1A.src) then
            cbe.cl := msg_PutML1A.cl;
            msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2(directoryL2));
            Send_req2(msg, m);
            Clear_perm(adr, m);
            cbe.State := directoryL1A_evictI__C__E_evict;
            return true;
            endif;
          endif;
          if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_evictdM_x_pI_store_GetM_Ack_AD__C__E;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_evictdM_x_pI_store_GetM_Ack_AD__C__M:
      switch inmsg.mtype
        case Inv_AckL1A:
          cbe.acksReceivedL1A := cbe.acksReceivedL1A+1;
          if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_evictdM_x_pI_store_GetM_Ack_AD__C__M;
            return true;
          endif;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            Set_perm(store, adr, m);
            msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
            msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
            RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
            if (cbe.ownerL1A = msg_PutML1A.src) then
            cbe.cl := msg_PutML1A.cl;
            msg := RwdL2(adr,MemWr_IL2,m,to_m_directoryL2(directoryL2),cbe.cl);
            Send_rwd(msg, m);
            Clear_perm(adr, m);
            cbe.State := directoryL1A_evictI__C__M_evict;
            return true;
            endif;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_evictdM_x_pI_store_GetM_Ack_AD__C__S:
      switch inmsg.mtype
        case Inv_AckL1A:
          cbe.acksReceivedL1A := cbe.acksReceivedL1A+1;
          if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_evictdM_x_pI_store_GetM_Ack_AD__C__S;
            return true;
          endif;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            Set_perm(store, adr, m);
            msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
            msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
            RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
            if (cbe.ownerL1A = msg_PutML1A.src) then
            cbe.cl := msg_PutML1A.cl;
            msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2(directoryL2));
            Send_req2(msg, m);
            Clear_perm(adr, m);
            cbe.State := directoryL1A_evictI__C__S_evict;
            return true;
            endif;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_evictdM_x_pI_store__C__M:
      switch inmsg.mtype
        case GetM_Ack_DL1A:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
          if (cbe.ownerL1A = msg_PutML1A.src) then
          cbe.cl := msg_PutML1A.cl;
          msg := RwdL2(adr,MemWr_IL2,m,to_m_directoryL2(directoryL2),cbe.cl);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictI__C__M_evict;
          return true;
          endif;
        
        case Inv_AckL1A:
          cbe.acksReceivedL1A := cbe.acksReceivedL1A+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictdM_x_pI_store__C__M;
          return true;
        
        else return false;
      endswitch;
      
    endswitch;
    endalias;
    endalias;
    endalias;
    return false;
    end;
    
    function FSM_MSG_directoryL2(inmsg:Message; mTyped:OBJSET_directoryL2) : boolean;
    var msg: Message;
    begin
      alias adr: inmsg.adr do
      alias cbe: i_directoryL2[mTyped].cb[adr] do
    alias m : to_m_directoryL2(mTyped) do
    switch cbe.State
      case directoryL2_E:
      switch inmsg.mtype
        case MemClnEvct_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_E;
            return true;
          endif;
          if (cbe.ownerL2 = inmsg.src) then
            undefine cbe.ownerL2;
            Clear_perm(adr, m);
            cbe.State := directoryL2_I;
            return true;
          endif;
        
        case MemInv_A_SnpInvL2:
          msg := BISnpL2(adr,BISnpInvL2,m,cbe.ownerL2);
          Send_bisnp(msg, m);
          cbe.requestorL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2_E_MemInv_A_SnpInv;
          return true;
        
        case MemRd_A_SnpInvL2:
          msg := BISnpL2(adr,BISnpInvL2,m,cbe.ownerL2);
          Send_bisnp(msg, m);
          cbe.requestorL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2_E_MemRd_A_SnpInv;
          return true;
        
        case MemRd_S_SnpDataL2:
          msg := BISnpL2(adr,BISnpDataL2,m,cbe.ownerL2);
          Send_bisnp(msg, m);
          cbe.requestorL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2_E_MemRd_S_SnpData;
          return true;
        
        case MemWr_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if (cbe.ownerL2 = inmsg.src) then
            cbe.cl := inmsg.cl;
            undefine cbe.ownerL2;
            Clear_perm(adr, m);
            cbe.State := directoryL2_I;
            return true;
          endif;
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_E;
            return true;
          endif;
        
        case MemWr_SL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_E;
            return true;
          endif;
          if (cbe.ownerL2 = inmsg.src) then
            cbe.cl := inmsg.cl;
            undefine cbe.ownerL2;
            AddElement_cacheL2(cbe.cacheL2, inmsg.src);
            Clear_perm(adr, m);
            cbe.State := directoryL2_S;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2_E_MemInv_A_SnpInv:
      switch inmsg.mtype
        case BIConflictL2:
          msg := NdrL2(adr,BIConflictAckL2,m,inmsg.src);
          Send_ndr(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL2_E_MemInv_A_SnpInv;
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
          cbe.State := directoryL2_M;
          return true;
        
        case MemWr_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          if !(inmsg.src = cbe.ownerL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_E_MemInv_A_SnpInv;
            return true;
          endif;
          if (inmsg.src = cbe.ownerL2) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2_E_MemInv_A_SnpInv;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2_E_MemRd_A_SnpInv:
      switch inmsg.mtype
        case BIConflictL2:
          msg := NdrL2(adr,BIConflictAckL2,m,inmsg.src);
          Send_ndr(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL2_E_MemRd_A_SnpInv;
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
          cbe.State := directoryL2_M;
          return true;
        
        case MemWr_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          if (inmsg.src = cbe.ownerL2) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2_E_MemRd_A_SnpInv;
            return true;
          endif;
          if !(inmsg.src = cbe.ownerL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_E_MemRd_A_SnpInv;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2_E_MemRd_S_SnpData:
      switch inmsg.mtype
        case BIConflictL2:
          msg := NdrL2(adr,BIConflictAckL2,m,inmsg.src);
          Send_ndr(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL2_E_MemRd_S_SnpData;
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
          cbe.State := directoryL2_S;
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
          cbe.State := directoryL2_S;
          return true;
        
        case MemWr_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          if !(inmsg.src = cbe.ownerL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_E_MemRd_S_SnpData;
            return true;
          endif;
          if (inmsg.src = cbe.ownerL2) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2_E_MemRd_S_SnpData;
            return true;
          endif;
        
        case MemWr_SL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          if (inmsg.src = cbe.ownerL2) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2_E_MemRd_S_SnpData;
            return true;
          endif;
          if !(inmsg.src = cbe.ownerL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_E_MemRd_S_SnpData;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2_I:
      switch inmsg.mtype
        case MemClnEvct_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if (cbe.ownerL2 = inmsg.src) then
            undefine cbe.ownerL2;
            Clear_perm(adr, m);
            cbe.State := directoryL2_I;
            return true;
          endif;
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_I;
            return true;
          endif;
        
        case MemInv_A_SnpInvL2:
          msg := NdrL2(adr,Cmp_EL2,m,inmsg.src);
          Send_ndr(msg, m);
          msg := DrsL2(adr,MemDataL2,m,inmsg.src,cbe.cl);
          Send_drs(msg, m);
          cbe.ownerL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2_M;
          return true;
        
        case MemRd_A_SnpInvL2:
          msg := NdrL2(adr,Cmp_EL2,m,inmsg.src);
          Send_ndr(msg, m);
          msg := DrsL2(adr,MemDataL2,m,inmsg.src,cbe.cl);
          Send_drs(msg, m);
          cbe.ownerL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2_M;
          return true;
        
        case MemRd_S_SnpDataL2:
          msg := NdrL2(adr,Cmp_EL2,m,inmsg.src);
          Send_ndr(msg, m);
          msg := DrsL2(adr,MemDataL2,m,inmsg.src,cbe.cl);
          Send_drs(msg, m);
          cbe.ownerL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2_E;
          return true;
        
        case MemWr_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_I;
            return true;
          endif;
          if (cbe.ownerL2 = inmsg.src) then
            cbe.cl := inmsg.cl;
            undefine cbe.ownerL2;
            Clear_perm(adr, m);
            cbe.State := directoryL2_I;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2_M:
      switch inmsg.mtype
        case MemClnEvct_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if (cbe.ownerL2 = inmsg.src) then
            undefine cbe.ownerL2;
            Clear_perm(adr, m);
            cbe.State := directoryL2_I;
            return true;
          endif;
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_M;
            return true;
          endif;
        
        case MemInv_A_SnpInvL2:
          msg := BISnpL2(adr,BISnpInvL2,m,cbe.ownerL2);
          Send_bisnp(msg, m);
          cbe.requestorL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2_M_MemInv_A_SnpInv;
          return true;
        
        case MemRd_A_SnpInvL2:
          msg := BISnpL2(adr,BISnpInvL2,m,cbe.ownerL2);
          Send_bisnp(msg, m);
          cbe.requestorL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2_M_MemRd_A_SnpInv;
          return true;
        
        case MemRd_S_SnpDataL2:
          msg := BISnpL2(adr,BISnpDataL2,m,cbe.ownerL2);
          Send_bisnp(msg, m);
          cbe.requestorL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2_M_MemRd_S_SnpData;
          return true;
        
        case MemWr_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if (cbe.ownerL2 = inmsg.src) then
            cbe.cl := inmsg.cl;
            undefine cbe.ownerL2;
            Clear_perm(adr, m);
            cbe.State := directoryL2_I;
            return true;
          endif;
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_M;
            return true;
          endif;
        
        case MemWr_SL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          if (cbe.ownerL2 = inmsg.src) then
            cbe.cl := inmsg.cl;
            undefine cbe.ownerL2;
            Clear_perm(adr, m);
            cbe.State := directoryL2_S;
            return true;
          endif;
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2_M_MemInv_A_SnpInv:
      switch inmsg.mtype
        case BIConflictL2:
          msg := NdrL2(adr,BIConflictAckL2,m,inmsg.src);
          Send_ndr(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL2_M_MemInv_A_SnpInv;
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
          cbe.State := directoryL2_M;
          return true;
        
        case MemWr_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          if (inmsg.src = cbe.ownerL2) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2_M_MemInv_A_SnpInv;
            return true;
          endif;
          if !(inmsg.src = cbe.ownerL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_M_MemInv_A_SnpInv;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2_M_MemRd_A_SnpInv:
      switch inmsg.mtype
        case BIConflictL2:
          msg := NdrL2(adr,BIConflictAckL2,m,inmsg.src);
          Send_ndr(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL2_M_MemRd_A_SnpInv;
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
          cbe.State := directoryL2_M;
          return true;
        
        case MemWr_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          if (inmsg.src = cbe.ownerL2) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2_M_MemRd_A_SnpInv;
            return true;
          endif;
          if !(inmsg.src = cbe.ownerL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_M_MemRd_A_SnpInv;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2_M_MemRd_S_SnpData:
      switch inmsg.mtype
        case BIConflictL2:
          msg := NdrL2(adr,BIConflictAckL2,m,inmsg.src);
          Send_ndr(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL2_M_MemRd_S_SnpData;
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
          cbe.State := directoryL2_S;
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
          cbe.State := directoryL2_S;
          return true;
        
        case MemWr_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          if (inmsg.src = cbe.ownerL2) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2_M_MemRd_S_SnpData;
            return true;
          endif;
          if !(inmsg.src = cbe.ownerL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_M_MemRd_S_SnpData;
            return true;
          endif;
        
        case MemWr_SL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          if (inmsg.src = cbe.ownerL2) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2_M_MemRd_S_SnpData;
            return true;
          endif;
          if !(inmsg.src = cbe.ownerL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_M_MemRd_S_SnpData;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2_S:
      switch inmsg.mtype
        case MemClnEvct_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if (VectorCount_cacheL2(cbe.cacheL2) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_I;
            return true;
          endif;
          if !(VectorCount_cacheL2(cbe.cacheL2) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_S;
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
              cbe.State := directoryL2_M;
              return true;
            endif;
            if !(VectorCount_cacheL2(cbe.cacheL2) = 0) then
              msg := BISnpL2(adr,BISnpInvL2,m,m);
              Multicast_bisnp_v_cacheL2(msg, cbe.cacheL2, m);
              AddElement_cacheL2(cbe.cacheL2, cbe.requestorL2);
              Clear_perm(adr, m);
              cbe.State := directoryL2_S_MemInv_A_SnpInv;
              return true;
            endif;
          endif;
          if !(IsElement_cacheL2(cbe.cacheL2, cbe.requestorL2)) then
            msg := BISnpL2(adr,BISnpInvL2,m,m);
            Multicast_bisnp_v_cacheL2(msg, cbe.cacheL2, m);
            Clear_perm(adr, m);
            cbe.State := directoryL2_S_MemInv_A_SnpInv;
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
              cbe.State := directoryL2_S_MemRd_A_SnpInv;
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
              cbe.State := directoryL2_M;
              return true;
            endif;
          endif;
          if !(IsElement_cacheL2(cbe.cacheL2, inmsg.src)) then
            msg := BISnpL2(adr,BISnpInvL2,m,m);
            Multicast_bisnp_v_cacheL2(msg, cbe.cacheL2, m);
            Clear_perm(adr, m);
            cbe.State := directoryL2_S_MemRd_A_SnpInv;
            return true;
          endif;
        
        case MemRd_S_SnpDataL2:
          msg := NdrL2(adr,Cmp_SL2,m,inmsg.src);
          Send_ndr(msg, m);
          msg := DrsL2(adr,MemDataL2,m,inmsg.src,cbe.cl);
          Send_drs(msg, m);
          AddElement_cacheL2(cbe.cacheL2, inmsg.src);
          Clear_perm(adr, m);
          cbe.State := directoryL2_S;
          return true;
        
        case MemWr_IL2:
          msg := NdrL2(adr,CmpL2,m,inmsg.src);
          Send_ndr(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if !(VectorCount_cacheL2(cbe.cacheL2) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_S;
            return true;
          endif;
          if (VectorCount_cacheL2(cbe.cacheL2) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_I;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2_S_MemInv_A_SnpInv:
      switch inmsg.mtype
        case BIConflictL2:
          msg := NdrL2(adr,BIConflictAckL2,m,inmsg.src);
          Send_ndr(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL2_S_MemInv_A_SnpInv;
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
                cbe.State := directoryL2_M;
                return true;
              endif;
              if !(IsElement_cacheL2(cbe.cacheL2, cbe.requestorL2)) then
                Clear_perm(adr, m);
                cbe.State := directoryL2_S_MemInv_A_SnpInv;
                return true;
              endif;
            endif;
            if !(VectorCount_cacheL2(cbe.cacheL2) = 1) then
              Clear_perm(adr, m);
              cbe.State := directoryL2_S_MemInv_A_SnpInv;
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
            cbe.State := directoryL2_M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2_S_MemRd_A_SnpInv:
      switch inmsg.mtype
        case BIConflictL2:
          msg := NdrL2(adr,BIConflictAckL2,m,inmsg.src);
          Send_ndr(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL2_S_MemRd_A_SnpInv;
          return true;
        
        case BIRspIL2:
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if !(VectorCount_cacheL2(cbe.cacheL2) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_S_MemRd_A_SnpInv;
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
            cbe.State := directoryL2_M;
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
    
    function FSM_MSG_cacheL1A(inmsg:Message; mTyped:OBJSET_cacheL1A) : boolean;
    var msg: Message;
    begin
      alias adr: inmsg.adr do
      alias cbe: i_cacheL1A[mTyped].cb[adr] do
    alias m : to_m_cacheL1A(mTyped) do
    switch cbe.State
      case cacheL1A_E:
      switch inmsg.mtype
        case Fwd_GetML1A:
          msg := RespL1A(adr,GetM_Ack_DL1A,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1A_I;
          return true;
        
        case Fwd_GetSL1A:
          msg := RespL1A(adr,GetS_AckL1A,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL1A(adr,WBL1A,m,to_m_directoryL1A(directoryL1A),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := cacheL1A_S;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1A_E_evict:
      switch inmsg.mtype
        case Fwd_GetML1A:
          msg := RespL1A(adr,GetM_Ack_DL1A,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1A_E_evict_x_I;
          return true;
        
        case Fwd_GetSL1A:
          msg := RespL1A(adr,GetS_AckL1A,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL1A(adr,WBL1A,m,to_m_directoryL1A(directoryL1A),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1A_S_evict;
          return true;
        
        case Put_AckL1A:
          Clear_perm(adr, m);
          cbe.State := cacheL1A_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1A_E_evict_x_I:
      switch inmsg.mtype
        case Put_AckL1A:
          Clear_perm(adr, m);
          cbe.State := cacheL1A_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1A_I:
      switch inmsg.mtype
        else return false;
      endswitch;
      
      case cacheL1A_I_load:
      switch inmsg.mtype
        case GetM_Ack_DL1A:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL1A_E;
          return true;
        
        case GetS_AckL1A:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := cacheL1A_S;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1A_I_store:
      switch inmsg.mtype
        case GetM_Ack_ADL1A:
          cbe.cl := inmsg.cl;
          cbe.acksExpectedL1A := inmsg.acksExpectedL1A;
          if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            Clear_perm(adr, m);
            cbe.State := cacheL1A_I_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            Set_perm(store, adr, m);
            Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
            cbe.State := cacheL1A_M;
            return true;
          endif;
        
        case GetM_Ack_DL1A:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL1A_M;
          return true;
        
        case Inv_AckL1A:
          cbe.acksReceivedL1A := cbe.acksReceivedL1A+1;
          Clear_perm(adr, m);
          cbe.State := cacheL1A_I_store;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1A_I_store_GetM_Ack_AD:
      switch inmsg.mtype
        case Inv_AckL1A:
          cbe.acksReceivedL1A := cbe.acksReceivedL1A+1;
          if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            Clear_perm(adr, m);
            cbe.State := cacheL1A_I_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            Set_perm(store, adr, m);
            Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
            cbe.State := cacheL1A_M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case cacheL1A_M:
      switch inmsg.mtype
        case Fwd_GetML1A:
          msg := RespL1A(adr,GetM_Ack_DL1A,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1A_I;
          return true;
        
        case Fwd_GetSL1A:
          msg := RespL1A(adr,GetS_AckL1A,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL1A(adr,WBL1A,m,to_m_directoryL1A(directoryL1A),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := cacheL1A_S;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1A_M_evict:
      switch inmsg.mtype
        case Fwd_GetML1A:
          msg := RespL1A(adr,GetM_Ack_DL1A,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1A_M_evict_x_I;
          return true;
        
        case Fwd_GetSL1A:
          msg := RespL1A(adr,GetS_AckL1A,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL1A(adr,WBL1A,m,to_m_directoryL1A(directoryL1A),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1A_S_evict;
          return true;
        
        case Put_AckL1A:
          Clear_perm(adr, m);
          cbe.State := cacheL1A_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1A_M_evict_x_I:
      switch inmsg.mtype
        case Put_AckL1A:
          Clear_perm(adr, m);
          cbe.State := cacheL1A_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1A_S:
      switch inmsg.mtype
        case InvL1A:
          msg := RespL1A(adr,Inv_AckL1A,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1A_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1A_S_evict:
      switch inmsg.mtype
        case InvL1A:
          msg := RespL1A(adr,Inv_AckL1A,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1A_S_evict_x_I;
          return true;
        
        case Put_AckL1A:
          Clear_perm(adr, m);
          cbe.State := cacheL1A_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1A_S_evict_x_I:
      switch inmsg.mtype
        case Put_AckL1A:
          Clear_perm(adr, m);
          cbe.State := cacheL1A_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1A_S_store:
      switch inmsg.mtype
        case GetM_Ack_ADL1A:
          cbe.acksExpectedL1A := inmsg.acksExpectedL1A;
          if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            Clear_perm(adr, m);
            cbe.State := cacheL1A_S_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            Set_perm(store, adr, m);
            Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
            cbe.State := cacheL1A_M;
            return true;
          endif;
        
        case GetM_Ack_DL1A:
          Set_perm(store, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL1A_M;
          return true;
        
        case InvL1A:
          msg := RespL1A(adr,Inv_AckL1A,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1A_I_store;
          return true;
        
        case Inv_AckL1A:
          cbe.acksReceivedL1A := cbe.acksReceivedL1A+1;
          Clear_perm(adr, m);
          cbe.State := cacheL1A_S_store;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1A_S_store_GetM_Ack_AD:
      switch inmsg.mtype
        case Inv_AckL1A:
          cbe.acksReceivedL1A := cbe.acksReceivedL1A+1;
          if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            Clear_perm(adr, m);
            cbe.State := cacheL1A_S_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            cbe.acksExpectedL1A := 0;
            cbe.acksReceivedL1A := 0;
            Set_perm(store, adr, m);
            Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
            cbe.State := cacheL1A_M;
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
  ResetEvent_();
  end;
  

--Backend/Murphi/MurphiModular/GenRules
  ----Backend/Murphi/MurphiModular/Rules/GenAccessRuleSet
    ruleset m:OBJSET_cacheL1B do
    ruleset adr:Address do
      alias cbe:i_cacheL1B[m].cb[adr] do
    
      rule "cacheL1B_I_store"
        cbe.State = cacheL1B_I & network_ready() 
      ==>
        FSM_Access_cacheL1B_I_store(adr, m);
        
      endrule;
    
      rule "cacheL1B_I_acquire"
        cbe.State = cacheL1B_I & network_ready() & TestAtomicEvent_cacheL1B(m)
      ==>
        FSM_Access_cacheL1B_I_acquire(adr, m);
        LockAtomicEvent_cacheL1B(m, adr);
      endrule;
    
      rule "cacheL1B_I_release"
        cbe.State = cacheL1B_I & TestAtomicEvent_cacheL1B(m)
      ==>
        FSM_Access_cacheL1B_I_release(adr, m);
        LockAtomicEvent_cacheL1B(m, adr);
      endrule;
    
      rule "cacheL1B_I_load"
        cbe.State = cacheL1B_I & network_ready() 
      ==>
        FSM_Access_cacheL1B_I_load(adr, m);
        
      endrule;
    
      rule "cacheL1B_VC_load"
        cbe.State = cacheL1B_VC 
      ==>
        FSM_Access_cacheL1B_VC_load(adr, m);
        
      endrule;
    
      rule "cacheL1B_VC_evict"
        cbe.State = cacheL1B_VC 
      ==>
        FSM_Access_cacheL1B_VC_evict(adr, m);
        
      endrule;
    
      rule "cacheL1B_VC_acquire"
        cbe.State = cacheL1B_VC & network_ready() & TestAtomicEvent_cacheL1B(m)
      ==>
        FSM_Access_cacheL1B_VC_acquire(adr, m);
        LockAtomicEvent_cacheL1B(m, adr);
      endrule;
    
      rule "cacheL1B_VC_release"
        cbe.State = cacheL1B_VC & TestAtomicEvent_cacheL1B(m)
      ==>
        FSM_Access_cacheL1B_VC_release(adr, m);
        LockAtomicEvent_cacheL1B(m, adr);
      endrule;
    
      rule "cacheL1B_VC_store"
        cbe.State = cacheL1B_VC 
      ==>
        FSM_Access_cacheL1B_VC_store(adr, m);
        
      endrule;
    
      rule "cacheL1B_VD_evict"
        cbe.State = cacheL1B_VD & network_ready() 
      ==>
        FSM_Access_cacheL1B_VD_evict(adr, m);
        
      endrule;
    
      rule "cacheL1B_VD_acquire"
        cbe.State = cacheL1B_VD & network_ready() & TestAtomicEvent_cacheL1B(m)
      ==>
        FSM_Access_cacheL1B_VD_acquire(adr, m);
        LockAtomicEvent_cacheL1B(m, adr);
      endrule;
    
      rule "cacheL1B_VD_release"
        cbe.State = cacheL1B_VD & TestAtomicEvent_cacheL1B(m)
      ==>
        FSM_Access_cacheL1B_VD_release(adr, m);
        LockAtomicEvent_cacheL1B(m, adr);
      endrule;
    
      rule "cacheL1B_VD_load"
        cbe.State = cacheL1B_VD 
      ==>
        FSM_Access_cacheL1B_VD_load(adr, m);
        
      endrule;
    
      rule "cacheL1B_VD_store"
        cbe.State = cacheL1B_VD 
      ==>
        FSM_Access_cacheL1B_VD_store(adr, m);
        
      endrule;
    
    
      endalias;
    endruleset;
    endruleset;
    
    ruleset m:OBJSET_directoryL1B do
    ruleset adr:Address do
      alias cbe:i_directoryL1B[m].cb[adr] do
    
      rule "directoryL1B_V__C__E_evict"
        cbe.State = directoryL1B_V__C__E & network_ready() 
      ==>
        FSM_Access_directoryL1B_V__C__E_evict(adr, m);
        
      endrule;
    
      rule "directoryL1B_V__C__M_evict"
        cbe.State = directoryL1B_V__C__M & network_ready() 
      ==>
        FSM_Access_directoryL1B_V__C__M_evict(adr, m);
        
      endrule;
    
      rule "directoryL1B_V__C__S_evict"
        cbe.State = directoryL1B_V__C__S & network_ready() 
      ==>
        FSM_Access_directoryL1B_V__C__S_evict(adr, m);
        
      endrule;
    
    
      endalias;
    endruleset;
    endruleset;
    
    ruleset m:OBJSET_directoryL1A do
    ruleset adr:Address do
      alias cbe:i_directoryL1A[m].cb[adr] do
    
      rule "directoryL1A_E__C__M_evict"
        cbe.State = directoryL1A_E__C__M & network_ready() 
      ==>
        FSM_Access_directoryL1A_E__C__M_evict(adr, m);
        
      endrule;
    
      rule "directoryL1A_I__C__E_evict"
        cbe.State = directoryL1A_I__C__E & network_ready() 
      ==>
        FSM_Access_directoryL1A_I__C__E_evict(adr, m);
        
      endrule;
    
      rule "directoryL1A_I__C__M_evict"
        cbe.State = directoryL1A_I__C__M & network_ready() 
      ==>
        FSM_Access_directoryL1A_I__C__M_evict(adr, m);
        
      endrule;
    
      rule "directoryL1A_I__C__S_evict"
        cbe.State = directoryL1A_I__C__S & network_ready() 
      ==>
        FSM_Access_directoryL1A_I__C__S_evict(adr, m);
        
      endrule;
    
      rule "directoryL1A_M__C__M_evict"
        cbe.State = directoryL1A_M__C__M & network_ready() 
      ==>
        FSM_Access_directoryL1A_M__C__M_evict(adr, m);
        
      endrule;
    
      rule "directoryL1A_S__C__E_evict"
        cbe.State = directoryL1A_S__C__E & network_ready() 
      ==>
        FSM_Access_directoryL1A_S__C__E_evict(adr, m);
        
      endrule;
    
      rule "directoryL1A_S__C__M_evict"
        cbe.State = directoryL1A_S__C__M & network_ready() 
      ==>
        FSM_Access_directoryL1A_S__C__M_evict(adr, m);
        
      endrule;
    
      rule "directoryL1A_S__C__S_evict"
        cbe.State = directoryL1A_S__C__S & network_ready() 
      ==>
        FSM_Access_directoryL1A_S__C__S_evict(adr, m);
        
      endrule;
    
    
      endalias;
    endruleset;
    endruleset;
    
    ruleset m:OBJSET_cacheL1A do
    ruleset adr:Address do
      alias cbe:i_cacheL1A[m].cb[adr] do
    
      rule "cacheL1A_E_load"
        cbe.State = cacheL1A_E 
      ==>
        FSM_Access_cacheL1A_E_load(adr, m);
        
      endrule;
    
      rule "cacheL1A_E_evict"
        cbe.State = cacheL1A_E & network_ready() 
      ==>
        FSM_Access_cacheL1A_E_evict(adr, m);
        
      endrule;
    
      rule "cacheL1A_E_store"
        cbe.State = cacheL1A_E 
      ==>
        FSM_Access_cacheL1A_E_store(adr, m);
        
      endrule;
    
      rule "cacheL1A_I_store"
        cbe.State = cacheL1A_I & network_ready() 
      ==>
        FSM_Access_cacheL1A_I_store(adr, m);
        
      endrule;
    
      rule "cacheL1A_I_load"
        cbe.State = cacheL1A_I & network_ready() 
      ==>
        FSM_Access_cacheL1A_I_load(adr, m);
        
      endrule;
    
      rule "cacheL1A_M_evict"
        cbe.State = cacheL1A_M & network_ready() 
      ==>
        FSM_Access_cacheL1A_M_evict(adr, m);
        
      endrule;
    
      rule "cacheL1A_M_load"
        cbe.State = cacheL1A_M 
      ==>
        FSM_Access_cacheL1A_M_load(adr, m);
        
      endrule;
    
      rule "cacheL1A_M_store"
        cbe.State = cacheL1A_M 
      ==>
        FSM_Access_cacheL1A_M_store(adr, m);
        
      endrule;
    
      rule "cacheL1A_S_load"
        cbe.State = cacheL1A_S 
      ==>
        FSM_Access_cacheL1A_S_load(adr, m);
        
      endrule;
    
      rule "cacheL1A_S_store"
        cbe.State = cacheL1A_S & network_ready() 
      ==>
        FSM_Access_cacheL1A_S_store(adr, m);
        
      endrule;
    
      rule "cacheL1A_S_evict"
        cbe.State = cacheL1A_S & network_ready() 
      ==>
        FSM_Access_cacheL1A_S_evict(adr, m);
        
      endrule;
    
    
      endalias;
    endruleset;
    endruleset;
    
  ----Backend/Murphi/MurphiModular/Rules/GenEventRuleSet
    ruleset m:OBJSET_directoryL1B do
    ruleset adr:Address do
      alias cbe:i_directoryL1B[m].cb[adr] do
    
      rule "directoryL1B_V__C__E_rel_eventL1B"
        cbe.State = directoryL1B_V__C__E & CheckRemoteEvent_directoryL1B(directoryL1B_rel_eventL1B, m, adr) 
      ==>
        FSM_Access_directoryL1B_V__C__E_rel_eventL1B(adr, m);
      endrule;
    
      rule "directoryL1B_V__C__E_acq_eventL1B"
        cbe.State = directoryL1B_V__C__E & CheckRemoteEvent_directoryL1B(directoryL1B_acq_eventL1B, m, adr) 
      ==>
        FSM_Access_directoryL1B_V__C__E_acq_eventL1B(adr, m);
      endrule;
    
      rule "directoryL1B_V__C__I_acq_eventL1B"
        cbe.State = directoryL1B_V__C__I & CheckRemoteEvent_directoryL1B(directoryL1B_acq_eventL1B, m, adr) 
      ==>
        FSM_Access_directoryL1B_V__C__I_acq_eventL1B(adr, m);
      endrule;
    
      rule "directoryL1B_V__C__I_rel_eventL1B"
        cbe.State = directoryL1B_V__C__I & CheckRemoteEvent_directoryL1B(directoryL1B_rel_eventL1B, m, adr) 
      ==>
        FSM_Access_directoryL1B_V__C__I_rel_eventL1B(adr, m);
      endrule;
    
      rule "directoryL1B_V__C__M_acq_eventL1B"
        cbe.State = directoryL1B_V__C__M & CheckRemoteEvent_directoryL1B(directoryL1B_acq_eventL1B, m, adr) 
      ==>
        FSM_Access_directoryL1B_V__C__M_acq_eventL1B(adr, m);
      endrule;
    
      rule "directoryL1B_V__C__M_rel_eventL1B"
        cbe.State = directoryL1B_V__C__M & CheckRemoteEvent_directoryL1B(directoryL1B_rel_eventL1B, m, adr) 
      ==>
        FSM_Access_directoryL1B_V__C__M_rel_eventL1B(adr, m);
      endrule;
    
      rule "directoryL1B_V__C__S_rel_eventL1B"
        cbe.State = directoryL1B_V__C__S & CheckRemoteEvent_directoryL1B(directoryL1B_rel_eventL1B, m, adr) 
      ==>
        FSM_Access_directoryL1B_V__C__S_rel_eventL1B(adr, m);
      endrule;
    
      rule "directoryL1B_V__C__S_acq_eventL1B"
        cbe.State = directoryL1B_V__C__S & CheckRemoteEvent_directoryL1B(directoryL1B_acq_eventL1B, m, adr) 
      ==>
        FSM_Access_directoryL1B_V__C__S_acq_eventL1B(adr, m);
      endrule;
    
    
      endalias;
    endruleset;
    endruleset;
    
    ruleset m:OBJSET_directoryL1B do
    ruleset adr:Address do
      alias cbe:i_directoryL1B[m].cb[adr] do
    
    rule "directoryL1B_V__C__S_UnlockAtomicEvent_"
      cbe.State = directoryL1B_V__C__S
    ==>
      UnlockAtomicEvent_directoryL1B(m, adr);
    endrule;
    rule "directoryL1B_V__C__E_UnlockAtomicEvent_"
      cbe.State = directoryL1B_V__C__E
    ==>
      UnlockAtomicEvent_directoryL1B(m, adr);
    endrule;
    rule "directoryL1B_V__C__M_UnlockAtomicEvent_"
      cbe.State = directoryL1B_V__C__M
    ==>
      UnlockAtomicEvent_directoryL1B(m, adr);
    endrule;
    rule "directoryL1B_V__C__I_UnlockAtomicEvent_"
      cbe.State = directoryL1B_V__C__I
    ==>
      UnlockAtomicEvent_directoryL1B(m, adr);
    endrule;
    
      endalias;
    endruleset;
    endruleset;
    
    ruleset m:OBJSET_directoryL1B do
    ruleset adr:Address do
      alias cbe:i_directoryL1B[m].cb[adr] do
    
      rule "directoryL1B_V__C__E_rel_eventL1B"
        cbe.State = directoryL1B_V__C__E & CheckRemoteEvent_directoryL1B(directoryL1B_rel_eventL1B, m, adr) 
      ==>
        FSM_Access_directoryL1B_V__C__E_rel_eventL1B(adr, m);
      endrule;
    
      rule "directoryL1B_V__C__E_acq_eventL1B"
        cbe.State = directoryL1B_V__C__E & CheckRemoteEvent_directoryL1B(directoryL1B_acq_eventL1B, m, adr) 
      ==>
        FSM_Access_directoryL1B_V__C__E_acq_eventL1B(adr, m);
      endrule;
    
      rule "directoryL1B_V__C__I_acq_eventL1B"
        cbe.State = directoryL1B_V__C__I & CheckRemoteEvent_directoryL1B(directoryL1B_acq_eventL1B, m, adr) 
      ==>
        FSM_Access_directoryL1B_V__C__I_acq_eventL1B(adr, m);
      endrule;
    
      rule "directoryL1B_V__C__I_rel_eventL1B"
        cbe.State = directoryL1B_V__C__I & CheckRemoteEvent_directoryL1B(directoryL1B_rel_eventL1B, m, adr) 
      ==>
        FSM_Access_directoryL1B_V__C__I_rel_eventL1B(adr, m);
      endrule;
    
      rule "directoryL1B_V__C__M_acq_eventL1B"
        cbe.State = directoryL1B_V__C__M & CheckRemoteEvent_directoryL1B(directoryL1B_acq_eventL1B, m, adr) 
      ==>
        FSM_Access_directoryL1B_V__C__M_acq_eventL1B(adr, m);
      endrule;
    
      rule "directoryL1B_V__C__M_rel_eventL1B"
        cbe.State = directoryL1B_V__C__M & CheckRemoteEvent_directoryL1B(directoryL1B_rel_eventL1B, m, adr) 
      ==>
        FSM_Access_directoryL1B_V__C__M_rel_eventL1B(adr, m);
      endrule;
    
      rule "directoryL1B_V__C__S_rel_eventL1B"
        cbe.State = directoryL1B_V__C__S & CheckRemoteEvent_directoryL1B(directoryL1B_rel_eventL1B, m, adr) 
      ==>
        FSM_Access_directoryL1B_V__C__S_rel_eventL1B(adr, m);
      endrule;
    
      rule "directoryL1B_V__C__S_acq_eventL1B"
        cbe.State = directoryL1B_V__C__S & CheckRemoteEvent_directoryL1B(directoryL1B_acq_eventL1B, m, adr) 
      ==>
        FSM_Access_directoryL1B_V__C__S_acq_eventL1B(adr, m);
      endrule;
    
    
      endalias;
    endruleset;
    endruleset;
    
    ruleset m:OBJSET_directoryL1B do
    ruleset adr:Address do
      alias cbe:i_directoryL1B[m].cb[adr] do
    
    rule "directoryL1B_V__C__S_UnlockAtomicEvent_"
      cbe.State = directoryL1B_V__C__S
    ==>
      UnlockAtomicEvent_directoryL1B(m, adr);
    endrule;
    rule "directoryL1B_V__C__E_UnlockAtomicEvent_"
      cbe.State = directoryL1B_V__C__E
    ==>
      UnlockAtomicEvent_directoryL1B(m, adr);
    endrule;
    rule "directoryL1B_V__C__M_UnlockAtomicEvent_"
      cbe.State = directoryL1B_V__C__M
    ==>
      UnlockAtomicEvent_directoryL1B(m, adr);
    endrule;
    rule "directoryL1B_V__C__I_UnlockAtomicEvent_"
      cbe.State = directoryL1B_V__C__I
    ==>
      UnlockAtomicEvent_directoryL1B(m, adr);
    endrule;
    
      endalias;
    endruleset;
    endruleset;
    
    ruleset m:OBJSET_cacheL1B do
    ruleset adr:Address do
      alias cbe:i_cacheL1B[m].cb[adr] do
    
      rule "cacheL1B_I_rel_eventL1B"
        cbe.State = cacheL1B_I & CheckRemoteEvent_cacheL1B(cacheL1B_rel_eventL1B, m, adr) 
      ==>
        FSM_Access_cacheL1B_I_rel_eventL1B(adr, m);
      endrule;
    
      rule "cacheL1B_I_acq_eventL1B"
        cbe.State = cacheL1B_I & CheckRemoteEvent_cacheL1B(cacheL1B_acq_eventL1B, m, adr) 
      ==>
        FSM_Access_cacheL1B_I_acq_eventL1B(adr, m);
      endrule;
    
      rule "cacheL1B_I_acquire_GetV_Ack_acq_eventL1B"
        cbe.State = cacheL1B_I_acquire_GetV_Ack & CheckInitEvent_cacheL1B(cacheL1B_acq_eventL1B, m, adr) 
      ==>
        ServeInitEvent_cacheL1B(cacheL1B_acq_eventL1B, m, adr);
        FSM_Access_cacheL1B_I_acquire_GetV_Ack_acq_eventL1B(adr, m);
      endrule;
    
      rule "cacheL1B_I_release_rel_eventL1B"
        cbe.State = cacheL1B_I_release & CheckInitEvent_cacheL1B(cacheL1B_rel_eventL1B, m, adr) & network_ready()
      ==>
        ServeInitEvent_cacheL1B(cacheL1B_rel_eventL1B, m, adr);
        FSM_Access_cacheL1B_I_release_rel_eventL1B(adr, m);
      endrule;
    
      rule "cacheL1B_VC_rel_eventL1B"
        cbe.State = cacheL1B_VC & CheckRemoteEvent_cacheL1B(cacheL1B_rel_eventL1B, m, adr) 
      ==>
        FSM_Access_cacheL1B_VC_rel_eventL1B(adr, m);
      endrule;
    
      rule "cacheL1B_VC_acq_eventL1B"
        cbe.State = cacheL1B_VC & CheckRemoteEvent_cacheL1B(cacheL1B_acq_eventL1B, m, adr) 
      ==>
        FSM_Access_cacheL1B_VC_acq_eventL1B(adr, m);
      endrule;
    
      rule "cacheL1B_VC_acquire_GetV_Ack_acq_eventL1B"
        cbe.State = cacheL1B_VC_acquire_GetV_Ack & CheckInitEvent_cacheL1B(cacheL1B_acq_eventL1B, m, adr) 
      ==>
        ServeInitEvent_cacheL1B(cacheL1B_acq_eventL1B, m, adr);
        FSM_Access_cacheL1B_VC_acquire_GetV_Ack_acq_eventL1B(adr, m);
      endrule;
    
      rule "cacheL1B_VC_release_rel_eventL1B"
        cbe.State = cacheL1B_VC_release & CheckInitEvent_cacheL1B(cacheL1B_rel_eventL1B, m, adr) & network_ready()
      ==>
        ServeInitEvent_cacheL1B(cacheL1B_rel_eventL1B, m, adr);
        FSM_Access_cacheL1B_VC_release_rel_eventL1B(adr, m);
      endrule;
    
      rule "cacheL1B_VD_rel_eventL1B"
        cbe.State = cacheL1B_VD & CheckRemoteEvent_cacheL1B(cacheL1B_rel_eventL1B, m, adr) & network_ready()
      ==>
        FSM_Access_cacheL1B_VD_rel_eventL1B(adr, m);
      endrule;
    
      rule "cacheL1B_VD_acq_eventL1B"
        cbe.State = cacheL1B_VD & CheckRemoteEvent_cacheL1B(cacheL1B_acq_eventL1B, m, adr) 
      ==>
        FSM_Access_cacheL1B_VD_acq_eventL1B(adr, m);
      endrule;
    
      rule "cacheL1B_VD_acquire_GetV_Ack_acq_eventL1B"
        cbe.State = cacheL1B_VD_acquire_GetV_Ack & CheckInitEvent_cacheL1B(cacheL1B_acq_eventL1B, m, adr) 
      ==>
        ServeInitEvent_cacheL1B(cacheL1B_acq_eventL1B, m, adr);
        FSM_Access_cacheL1B_VD_acquire_GetV_Ack_acq_eventL1B(adr, m);
      endrule;
    
      rule "cacheL1B_VD_release_rel_eventL1B"
        cbe.State = cacheL1B_VD_release & CheckInitEvent_cacheL1B(cacheL1B_rel_eventL1B, m, adr) & network_ready()
      ==>
        ServeInitEvent_cacheL1B(cacheL1B_rel_eventL1B, m, adr);
        FSM_Access_cacheL1B_VD_release_rel_eventL1B(adr, m);
      endrule;
    
    
      endalias;
    endruleset;
    endruleset;
    
    ruleset m:OBJSET_cacheL1B do
    ruleset adr:Address do
      alias cbe:i_cacheL1B[m].cb[adr] do
    
    rule "cacheL1B_VD_UnlockAtomicEvent_"
      cbe.State = cacheL1B_VD
    ==>
      UnlockAtomicEvent_cacheL1B(m, adr);
    endrule;
    rule "cacheL1B_I_UnlockAtomicEvent_"
      cbe.State = cacheL1B_I
    ==>
      UnlockAtomicEvent_cacheL1B(m, adr);
    endrule;
    rule "cacheL1B_VC_UnlockAtomicEvent_"
      cbe.State = cacheL1B_VC
    ==>
      UnlockAtomicEvent_cacheL1B(m, adr);
    endrule;
    
      endalias;
    endruleset;
    endruleset;
    
  ----Backend/Murphi/MurphiModular/Rules/GenNetworkRule
    -- cacheL1B
    ruleset n:OBJSET_cacheL1B do
      alias msg:resp_cacheL1B[n][0] do
        rule "Receive cacheL1B resp"
          cnt_resp_cacheL1B[n] > 0
          
        ==>
          if FSM_MSG_cacheL1B(msg, n) then
            Pop_resp(to_m_cacheL1B(n), to_m_cacheL1B(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_cacheL1B do
      alias msg:fwd_cacheL1B[n][0] do
        rule "Receive cacheL1B fwd"
          cnt_fwd_cacheL1B[n] > 0
          
        ==>
          if FSM_MSG_cacheL1B(msg, n) then
            Pop_fwd(to_m_cacheL1B(n), to_m_cacheL1B(n));
          endif;
        endrule;
      endalias;
    endruleset;
    
    -- cacheL1A
    ruleset n:OBJSET_cacheL1A do
      alias msg:resp_cacheL1A[n][0] do
        rule "Receive cacheL1A resp"
          cnt_resp_cacheL1A[n] > 0
          
        ==>
          if FSM_MSG_cacheL1A(msg, n) then
            Pop_resp(to_m_cacheL1A(n), to_m_cacheL1A(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_cacheL1A do
      alias msg:fwd_cacheL1A[n][0] do
        rule "Receive cacheL1A fwd"
          cnt_fwd_cacheL1A[n] > 0
          
        ==>
          if FSM_MSG_cacheL1A(msg, n) then
            Pop_fwd(to_m_cacheL1A(n), to_m_cacheL1A(n));
          endif;
        endrule;
      endalias;
    endruleset;
    
    -- directoryL1B
    ruleset n:OBJSET_directoryL1B do
      alias msg:resp_directoryL1B[n][0] do
        rule "Receive directoryL1B resp"
          cnt_resp_directoryL1B[n] > 0
          
        ==>
          if FSM_MSG_directoryL1B(msg, n) then
            Pop_resp(to_m_directoryL1B(n), to_m_directoryL1B(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1B do
      alias msg:req_directoryL1B[n][0] do
        rule "Receive directoryL1B req"
          cnt_req_directoryL1B[n] > 0
          
        ==>
          if FSM_MSG_directoryL1B(msg, n) then
            Pop_req(to_m_directoryL1B(n), to_m_directoryL1B(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1B do
      alias msg:fwd_directoryL1B[n][0] do
        rule "Receive directoryL1B fwd"
          cnt_fwd_directoryL1B[n] > 0
          
        ==>
          if FSM_MSG_directoryL1B(msg, n) then
            Pop_fwd(to_m_directoryL1B(n), to_m_directoryL1B(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1B do
      alias msg:bisnp_directoryL1B[n][0] do
        rule "Receive directoryL1B bisnp"
          cnt_bisnp_directoryL1B[n] > 0
          
        ==>
          if FSM_MSG_directoryL1B(msg, n) then
            Pop_bisnp(to_m_directoryL1B(n), to_m_directoryL1B(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1B do
      alias msg:req2_directoryL1B[n][0] do
        rule "Receive directoryL1B req2"
          cnt_req2_directoryL1B[n] > 0
          
        ==>
          if FSM_MSG_directoryL1B(msg, n) then
            Pop_req2(to_m_directoryL1B(n), to_m_directoryL1B(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1B do
      alias msg:rwd_directoryL1B[n][0] do
        rule "Receive directoryL1B rwd"
          cnt_rwd_directoryL1B[n] > 0
          
        ==>
          if FSM_MSG_directoryL1B(msg, n) then
            Pop_rwd(to_m_directoryL1B(n), to_m_directoryL1B(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1B do
      alias msg:birsp_directoryL1B[n][0] do
        rule "Receive directoryL1B birsp"
          cnt_birsp_directoryL1B[n] > 0
          
        ==>
          if FSM_MSG_directoryL1B(msg, n) then
            Pop_birsp(to_m_directoryL1B(n), to_m_directoryL1B(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1B do
      alias msg:drs_directoryL1B[n][0] do
        rule "Receive directoryL1B drs"
          cnt_drs_directoryL1B[n] > 0
          
        ==>
          if FSM_MSG_directoryL1B(msg, n) then
            Pop_drs(to_m_directoryL1B(n), to_m_directoryL1B(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1B do
      alias msg:ndr_directoryL1B[n][0] do
        rule "Receive directoryL1B ndr"
          cnt_ndr_directoryL1B[n] > 0
          
        ==>
          if FSM_MSG_directoryL1B(msg, n) then
            Pop_ndr(to_m_directoryL1B(n), to_m_directoryL1B(n));
          endif;
        endrule;
      endalias;
    endruleset;
    
    -- directoryL2
    ruleset n:OBJSET_directoryL2 do
      alias msg:bisnp_directoryL2[n][0] do
        rule "Receive directoryL2 bisnp"
          cnt_bisnp_directoryL2[n] > 0
          
        ==>
          if FSM_MSG_directoryL2(msg, n) then
            Pop_bisnp(to_m_directoryL2(n), to_m_directoryL2(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL2 do
      alias msg:req2_directoryL2[n][0] do
        rule "Receive directoryL2 req2"
          cnt_req2_directoryL2[n] > 0
          
        ==>
          if FSM_MSG_directoryL2(msg, n) then
            Pop_req2(to_m_directoryL2(n), to_m_directoryL2(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL2 do
      alias msg:rwd_directoryL2[n][0] do
        rule "Receive directoryL2 rwd"
          cnt_rwd_directoryL2[n] > 0
          
        ==>
          if FSM_MSG_directoryL2(msg, n) then
            Pop_rwd(to_m_directoryL2(n), to_m_directoryL2(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL2 do
      alias msg:birsp_directoryL2[n][0] do
        rule "Receive directoryL2 birsp"
          cnt_birsp_directoryL2[n] > 0
          
        ==>
          if FSM_MSG_directoryL2(msg, n) then
            Pop_birsp(to_m_directoryL2(n), to_m_directoryL2(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL2 do
      alias msg:drs_directoryL2[n][0] do
        rule "Receive directoryL2 drs"
          cnt_drs_directoryL2[n] > 0
          
        ==>
          if FSM_MSG_directoryL2(msg, n) then
            Pop_drs(to_m_directoryL2(n), to_m_directoryL2(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL2 do
      alias msg:ndr_directoryL2[n][0] do
        rule "Receive directoryL2 ndr"
          cnt_ndr_directoryL2[n] > 0
          
        ==>
          if FSM_MSG_directoryL2(msg, n) then
            Pop_ndr(to_m_directoryL2(n), to_m_directoryL2(n));
          endif;
        endrule;
      endalias;
    endruleset;
    
    -- directoryL1A
    ruleset n:OBJSET_directoryL1A do
      alias msg:resp_directoryL1A[n][0] do
        rule "Receive directoryL1A resp"
          cnt_resp_directoryL1A[n] > 0
          
        ==>
          if FSM_MSG_directoryL1A(msg, n) then
            Pop_resp(to_m_directoryL1A(n), to_m_directoryL1A(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1A do
      alias msg:req_directoryL1A[n][0] do
        rule "Receive directoryL1A req"
          cnt_req_directoryL1A[n] > 0
          
        ==>
          if FSM_MSG_directoryL1A(msg, n) then
            Pop_req(to_m_directoryL1A(n), to_m_directoryL1A(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1A do
      alias msg:fwd_directoryL1A[n][0] do
        rule "Receive directoryL1A fwd"
          cnt_fwd_directoryL1A[n] > 0
          
        ==>
          if FSM_MSG_directoryL1A(msg, n) then
            Pop_fwd(to_m_directoryL1A(n), to_m_directoryL1A(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1A do
      alias msg:bisnp_directoryL1A[n][0] do
        rule "Receive directoryL1A bisnp"
          cnt_bisnp_directoryL1A[n] > 0
          
        ==>
          if FSM_MSG_directoryL1A(msg, n) then
            Pop_bisnp(to_m_directoryL1A(n), to_m_directoryL1A(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1A do
      alias msg:req2_directoryL1A[n][0] do
        rule "Receive directoryL1A req2"
          cnt_req2_directoryL1A[n] > 0
          
        ==>
          if FSM_MSG_directoryL1A(msg, n) then
            Pop_req2(to_m_directoryL1A(n), to_m_directoryL1A(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1A do
      alias msg:rwd_directoryL1A[n][0] do
        rule "Receive directoryL1A rwd"
          cnt_rwd_directoryL1A[n] > 0
          
        ==>
          if FSM_MSG_directoryL1A(msg, n) then
            Pop_rwd(to_m_directoryL1A(n), to_m_directoryL1A(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1A do
      alias msg:birsp_directoryL1A[n][0] do
        rule "Receive directoryL1A birsp"
          cnt_birsp_directoryL1A[n] > 0
          
        ==>
          if FSM_MSG_directoryL1A(msg, n) then
            Pop_birsp(to_m_directoryL1A(n), to_m_directoryL1A(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1A do
      alias msg:drs_directoryL1A[n][0] do
        rule "Receive directoryL1A drs"
          cnt_drs_directoryL1A[n] > 0
          
        ==>
          if FSM_MSG_directoryL1A(msg, n) then
            Pop_drs(to_m_directoryL1A(n), to_m_directoryL1A(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1A do
      alias msg:ndr_directoryL1A[n][0] do
        rule "Receive directoryL1A ndr"
          cnt_ndr_directoryL1A[n] > 0
          
        ==>
          if FSM_MSG_directoryL1A(msg, n) then
            Pop_ndr(to_m_directoryL1A(n), to_m_directoryL1A(n));
          endif;
        endrule;
      endalias;
    endruleset;
    
    -- cacheL1B
    
    -- cacheL1A
    
    -- directoryL1B
    
    -- directoryL2
    
    -- directoryL1A
    

--Backend/Murphi/MurphiModular/GenStartStates

  startstate
    System_Reset();
  endstartstate;

--Backend/Murphi/MurphiModular/GenInvariant
ruleset adr:Address do
    liveness "cacheL1A is able to eventually read" live_cacheL1A(adr, load);
    liveness "cacheL1A is able to eventually write" live_cacheL1A(adr, store);
endruleset;

ruleset adr:Address do
    liveness "cacheL1B is able to eventually read" live_cacheL1B(adr, load);
    liveness "cacheL1B is able to eventually write" live_cacheL1B(adr, store);
endruleset;

