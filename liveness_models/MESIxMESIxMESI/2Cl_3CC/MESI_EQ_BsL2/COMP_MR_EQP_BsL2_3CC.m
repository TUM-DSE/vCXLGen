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
    O_NET_MAX: 20;
    U_NET_MAX: 20;
  
  ---- Cluster network constants
    CACHE_NET_MAX : 6;
    C1_LHS_NET_MAX : 9;
    C2_LHS_NET_MAX : 7;
    C2_RHS_NET_MAX : 7;
  
  ---- SSP declaration constants
    NrCachesL1: 4;
    NrCachesL2: 2;
  
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
        GetSL2, 
        GetML2, 
        PutSL2, 
        Inv_AckL2, 
        GetM_Ack_DL2, 
        GetS_AckL2, 
        WBL2, 
        PutML2, 
        PutEL2, 
        GetM_Ack_ADL2, 
        InvL2, 
        Put_AckL2, 
        Fwd_GetSL2, 
        Fwd_GetML2, 
        GetSL2store, 
        GetSL2load, 
        GetML2store
      };
      
      ------Backend/Murphi/MurphiModular/Types/Enums/SubEnums/GenArchEnums
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
      
      s_cacheL2RHS: enum {
        cacheL2RHS_S_store_GetM_Ack_AD,
        cacheL2RHS_S_store,
        cacheL2RHS_S_evict_x_I,
        cacheL2RHS_S_evict,
        cacheL2RHS_S,
        cacheL2RHS_M_evict_x_I,
        cacheL2RHS_M_evict,
        cacheL2RHS_M,
        cacheL2RHS_I_store_GetM_Ack_AD,
        cacheL2RHS_I_store,
        cacheL2RHS_I_load,
        cacheL2RHS_I,
        cacheL2RHS_E_evict_x_I,
        cacheL2RHS_E_evict,
        cacheL2RHS_E
      };
      
      s_directoryL2RHS: enum {
        directoryL2RHS_S,
        directoryL2RHS_M_GetS,
        directoryL2RHS_M,
        directoryL2RHS_I,
        directoryL2RHS_E_GetS,
        directoryL2RHS_E
      };
      
      s_cacheL2LHS: enum {
        cacheL2LHS_S_store_GetM_Ack_AD,
        cacheL2LHS_S_store,
        cacheL2LHS_S_evict_x_I,
        cacheL2LHS_S_evict,
        cacheL2LHS_S,
        cacheL2LHS_M_evict_x_I,
        cacheL2LHS_M_evict,
        cacheL2LHS_M,
        cacheL2LHS_I_store_GetM_Ack_AD,
        cacheL2LHS_I_store,
        cacheL2LHS_I_load,
        cacheL2LHS_I,
        cacheL2LHS_E_evict_x_I,
        cacheL2LHS_E_evict,
        cacheL2LHS_E
      };
      
      s_directoryL1LHS: enum {
        directoryL1LHS_evictdM_x_pI_store__C__M,
        directoryL1LHS_evictdM_x_pI_store_GetM_Ack_AD__C__M,
        directoryL1LHS_evictI__C__S_evict_x_I,
        directoryL1LHS_evictI__C__S_evict,
        directoryL1LHS_evictI__C__M_evict_x_I,
        directoryL1LHS_evictI__C__M_evict,
        directoryL1LHS_S__C__M,
        directoryL1LHS_M__C__M,
        directoryL1LHS_I__C__S,
        directoryL1LHS_I__C__M,
        directoryL1LHS_I__C__I,
        directoryL1LHS_GetSL1M_GetS__C__M,
        directoryL1LHS_GetSL1I__C__S_store_GetM_Ack_AD,
        directoryL1LHS_GetSL1I__C__S_store,
        directoryL1LHS_GetSL1I__C__I_store_GetM_Ack_AD,
        directoryL1LHS_GetSL1I__C__I_store,
        directoryL1LHS_GetSL1E_GetS__C__M,
        directoryL1LHS_GetML1I__C__S_store_GetM_Ack_AD,
        directoryL1LHS_GetML1I__C__S_store,
        directoryL1LHS_GetML1I__C__I_store_GetM_Ack_AD,
        directoryL1LHS_GetML1I__C__I_store,
        directoryL1LHS_Fwd_GetSL2dM_x_pI_store__C__M,
        directoryL1LHS_Fwd_GetSL2dM_x_pI_store_GetM_Ack_AD__C__M,
        directoryL1LHS_Fwd_GetML2dM_x_pI_store__C__M,
        directoryL1LHS_Fwd_GetML2dM_x_pI_store_GetM_Ack_AD__C__M,
        directoryL1LHS_E__C__M
      };
      
      s_abstractionRHS: enum {
        abstractionRHS_S_store_GetM_Ack_AD,
        abstractionRHS_S_store,
        abstractionRHS_S_evict_x_I,
        abstractionRHS_S_evict,
        abstractionRHS_S,
        abstractionRHS_M_evict_x_I,
        abstractionRHS_M_evict,
        abstractionRHS_M,
        abstractionRHS_I_store_GetM_Ack_AD,
        abstractionRHS_I_store,
        abstractionRHS_I_load,
        abstractionRHS_I,
        abstractionRHS_E_evict_x_I,
        abstractionRHS_E_evict,
        abstractionRHS_E
      };
      
      s_directoryL2LHS: enum {
        directoryL2LHS_S,
        directoryL2LHS_M_GetS,
        directoryL2LHS_M,
        directoryL2LHS_I,
        directoryL2LHS_E_GetS,
        directoryL2LHS_E
      };
      
      SystemStates: enum { systemLHS, systemRHS, systemLHSExt, systemRHSExt };
    ----Backend/Murphi/MurphiModular/Types/GenMachineSets
      -- Cluster: C1_LHS
      OBJSET_directoryL1LHS: enum{directoryL1LHS};
      OBJSET_cacheL1LHS: scalarset(3);
      C1_LHSMachines: record
        directoryL1LHS: OBJSET_directoryL1LHS;
        cacheL1LHS: OBJSET_cacheL1LHS;
      end;
      -- Cluster: C2_LHS
      OBJSET_cacheL2LHS: enum{cacheL2LHS};
      OBJSET_directoryL2LHS: enum{directoryL2LHS};
      C2_LHSMachines: record
        cacheL2LHS: OBJSET_cacheL2LHS;
        directoryL1LHS: OBJSET_directoryL1LHS;
        directoryL2LHS: OBJSET_directoryL2LHS;
      end;
      -- Cluster: C2_RHS
      OBJSET_abstractionRHS: enum{abstractionRHS};
      OBJSET_cacheL2RHS: OBJSET_cacheL2LHS;
      OBJSET_directoryL2RHS: OBJSET_directoryL2LHS;
      C2_RHSMachines: record
        cacheL2RHS: OBJSET_cacheL2RHS;
        abstractionRHS: OBJSET_abstractionRHS;
        directoryL2RHS: OBJSET_directoryL2RHS;
      end;
      
      Machines: record
        directoryL1LHS: OBJSET_directoryL1LHS;
        cacheL1LHS: OBJSET_cacheL1LHS;
        cacheL2LHS: OBJSET_cacheL2LHS;
        directoryL2LHS: OBJSET_directoryL2LHS;
        cacheL2RHS: OBJSET_cacheL2RHS;
        abstractionRHS: OBJSET_abstractionRHS;
        directoryL2RHS: OBJSET_directoryL2RHS;
      end;
      CntMachines: 0..9;
    
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
        acksExpectedL2: 0..NrCachesL2;
      end;
      
    ----Backend/Murphi/MurphiModular/Types/GenNetwork
      NET_fwd_directoryL1LHS: array[OBJSET_directoryL1LHS] of array[0..(C2_LHS_NET_MAX)-1] of Message;
      NET_req_directoryL1LHS: array[OBJSET_directoryL1LHS] of array[0..(C1_LHS_NET_MAX)-1] of Message;
      NET_resp_directoryL1LHS: array[OBJSET_directoryL1LHS] of array[0..(C1_LHS_NET_MAX+C2_LHS_NET_MAX)-1] of Message;
      NET_directoryL1LHS_cnt: array[OBJSET_directoryL1LHS] of 0..O_NET_MAX;
      NET_fwd_cacheL1LHS: array[OBJSET_cacheL1LHS] of array[0..(C1_LHS_NET_MAX)-1] of Message;
      NET_resp_cacheL1LHS: array[OBJSET_cacheL1LHS] of array[0..(C1_LHS_NET_MAX)-1] of Message;
      NET_cacheL1LHS_cnt: array[OBJSET_cacheL1LHS] of 0..O_NET_MAX;
      NET_fwd_cacheL2LHS: array[OBJSET_cacheL2LHS] of array[0..(C2_LHS_NET_MAX)-1] of Message;
      NET_resp_cacheL2LHS: array[OBJSET_cacheL2LHS] of array[0..(C2_LHS_NET_MAX)-1] of Message;
      NET_cacheL2LHS_cnt: array[OBJSET_cacheL2LHS] of 0..O_NET_MAX;
      NET_req_directoryL2LHS: array[OBJSET_directoryL2LHS] of array[0..(C2_LHS_NET_MAX)-1] of Message;
      NET_resp_directoryL2LHS: array[OBJSET_directoryL2LHS] of array[0..(C2_LHS_NET_MAX)-1] of Message;
      NET_directoryL2LHS_cnt: array[OBJSET_directoryL2LHS] of 0..O_NET_MAX;
      NET_fwd_cacheL2RHS: array[OBJSET_cacheL2RHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_resp_cacheL2RHS: array[OBJSET_cacheL2RHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_cacheL2RHS_cnt: array[OBJSET_cacheL2RHS] of 0..O_NET_MAX;
      NET_fwd_abstractionRHS: array[OBJSET_abstractionRHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_req_abstractionRHS: array[OBJSET_abstractionRHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_resp_abstractionRHS: array[OBJSET_abstractionRHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_abstractionRHS_cnt: array[OBJSET_abstractionRHS] of 0..O_NET_MAX;
      NET_req_directoryL2RHS: array[OBJSET_directoryL2RHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_resp_directoryL2RHS: array[OBJSET_directoryL2RHS] of array[0..(C2_RHS_NET_MAX)-1] of Message;
      NET_directoryL2RHS_cnt: array[OBJSET_directoryL2RHS] of 0..O_NET_MAX;
    
    ----Backend/Murphi/MurphiModular/Types/GenMachines
      
      ENTRY_cacheL2LHS: record
        State: s_cacheL2LHS;
        cl: ClValue;
        acksReceivedL2: 0..NrCachesL2;
        acksExpectedL2: 0..NrCachesL2;
      end;
      
      MACH_cacheL2LHS: record
        cb: array[Address] of ENTRY_cacheL2LHS;
      end;
      
      OBJ_cacheL2LHS: array[OBJSET_cacheL2LHS] of MACH_cacheL2LHS;
      v_cacheL1: record
        cacheL1LHS: array[OBJSET_cacheL1LHS] of boolean;
        cacheL2LHS: array[OBJSET_cacheL2LHS] of boolean;
        directoryL2LHS: array[OBJSET_directoryL2LHS] of boolean;
        cacheL2RHS: array[OBJSET_cacheL2RHS] of boolean;
        abstractionRHS: array[OBJSET_abstractionRHS] of boolean;
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
        acksReceivedL2: 0..NrCachesL2;
        acksExpectedL2: 0..NrCachesL2;
      end;
      
      MACH_directoryL1LHS: record
        cb: array[Address] of ENTRY_directoryL1LHS;
      end;
      
      OBJ_directoryL1LHS: array[OBJSET_directoryL1LHS] of MACH_directoryL1LHS;
      
      ENTRY_abstractionRHS: record
        State: s_abstractionRHS;
        cl: ClValue;
        acksReceivedL2: 0..NrCachesL2;
        acksExpectedL2: 0..NrCachesL2;
      end;
      
      MACH_abstractionRHS: record
        cb: array[Address] of ENTRY_abstractionRHS;
      end;
      
      OBJ_abstractionRHS: array[OBJSET_abstractionRHS] of MACH_abstractionRHS;
      v_cacheL2: record
        directoryL1LHS: array[OBJSET_directoryL1LHS] of boolean;
        cacheL1LHS: array[OBJSET_cacheL1LHS] of boolean;
        cacheL2LHS: array[OBJSET_cacheL2LHS] of boolean;
        cacheL2RHS: array[OBJSET_cacheL2RHS] of boolean;
        abstractionRHS: array[OBJSET_abstractionRHS] of boolean;
        directoryL2RHS: array[OBJSET_directoryL2RHS] of boolean;
      end;
      cnt_v_cacheL2: 0..NrCachesL2;
      
      ENTRY_directoryL2LHS: record
        State: s_directoryL2LHS;
        cl: ClValue;
        cacheL2: v_cacheL2;
        ownerL2: Machines;
      end;
      
      MACH_directoryL2LHS: record
        cb: array[Address] of ENTRY_directoryL2LHS;
      end;
      
      OBJ_directoryL2LHS: array[OBJSET_directoryL2LHS] of MACH_directoryL2LHS;
      
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
      
      ENTRY_cacheL2RHS: record
        State: s_cacheL2RHS;
        cl: ClValue;
        acksReceivedL2: 0..NrCachesL2;
        acksExpectedL2: 0..NrCachesL2;
      end;
      
      MACH_cacheL2RHS: record
        cb: array[Address] of ENTRY_cacheL2RHS;
      end;
      
      OBJ_cacheL2RHS: array[OBJSET_cacheL2RHS] of MACH_cacheL2RHS;
      
      ENTRY_directoryL2RHS: record
        State: s_directoryL2RHS;
        cl: ClValue;
        cacheL2: v_cacheL2;
        ownerL2: Machines;
      end;
      
      MACH_directoryL2RHS: record
        cb: array[Address] of ENTRY_directoryL2RHS;
      end;
      
      OBJ_directoryL2RHS: array[OBJSET_directoryL2RHS] of MACH_directoryL2RHS;
    

  var
    --Backend/Murphi/MurphiModular/GenVars
      g_system_state: SystemStates;
      g_progress_tracking: boolean;
      resp_directoryL1LHS: NET_resp_directoryL1LHS;
      cnt_resp_directoryL1LHS: NET_directoryL1LHS_cnt;
      req_directoryL1LHS: NET_req_directoryL1LHS;
      cnt_req_directoryL1LHS: NET_directoryL1LHS_cnt;
      fwd_directoryL1LHS: NET_fwd_directoryL1LHS;
      cnt_fwd_directoryL1LHS: NET_directoryL1LHS_cnt;
    
      resp_cacheL1LHS: NET_resp_cacheL1LHS;
      cnt_resp_cacheL1LHS: NET_cacheL1LHS_cnt;
      fwd_cacheL1LHS: NET_fwd_cacheL1LHS;
      cnt_fwd_cacheL1LHS: NET_cacheL1LHS_cnt;
    
      resp_cacheL2LHS: NET_resp_cacheL2LHS;
      cnt_resp_cacheL2LHS: NET_cacheL2LHS_cnt;
      fwd_cacheL2LHS: NET_fwd_cacheL2LHS;
      cnt_fwd_cacheL2LHS: NET_cacheL2LHS_cnt;
    
      resp_directoryL2LHS: NET_resp_directoryL2LHS;
      cnt_resp_directoryL2LHS: NET_directoryL2LHS_cnt;
      req_directoryL2LHS: NET_req_directoryL2LHS;
      cnt_req_directoryL2LHS: NET_directoryL2LHS_cnt;
    
      resp_cacheL2RHS: NET_resp_cacheL2RHS;
      cnt_resp_cacheL2RHS: NET_cacheL2RHS_cnt;
      resp_cacheL2RHS_BKUP: NET_resp_cacheL2RHS;
      cnt_resp_cacheL2RHS_BKUP: NET_cacheL2RHS_cnt;
      fwd_cacheL2RHS: NET_fwd_cacheL2RHS;
      cnt_fwd_cacheL2RHS: NET_cacheL2RHS_cnt;
      fwd_cacheL2RHS_BKUP: NET_fwd_cacheL2RHS;
      cnt_fwd_cacheL2RHS_BKUP: NET_cacheL2RHS_cnt;
    
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
    
      resp_directoryL2RHS: NET_resp_directoryL2RHS;
      cnt_resp_directoryL2RHS: NET_directoryL2RHS_cnt;
      resp_directoryL2RHS_BKUP: NET_resp_directoryL2RHS;
      cnt_resp_directoryL2RHS_BKUP: NET_directoryL2RHS_cnt;
      req_directoryL2RHS: NET_req_directoryL2RHS;
      cnt_req_directoryL2RHS: NET_directoryL2RHS_cnt;
      req_directoryL2RHS_BKUP: NET_req_directoryL2RHS;
      cnt_req_directoryL2RHS_BKUP: NET_directoryL2RHS_cnt;
    
    
    
      g_perm: PermMonitor;
      i_cacheL2LHS: OBJ_cacheL2LHS;
      i_directoryL1LHS: OBJ_directoryL1LHS;
      i_abstractionRHS: OBJ_abstractionRHS;
      i_abstractionRHS_BKUP: OBJ_abstractionRHS;
      i_directoryL2LHS: OBJ_directoryL2LHS;
      i_cacheL1LHS: OBJ_cacheL1LHS;
      i_cacheL2RHS: OBJ_cacheL2RHS;
      i_cacheL2RHS_BKUP: OBJ_cacheL2RHS;
      i_directoryL2RHS: OBJ_directoryL2RHS;
      i_directoryL2RHS_BKUP: OBJ_directoryL2RHS;
  
--Backend/Murphi/MurphiModular/GenFunctions

  ----Backend/Murphi/MurphiModular/Functions/GenTypeFunc
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
  
    function map_cacheL2LHS_to_cacheL2RHS(m: OBJSET_cacheL2LHS): OBJSET_cacheL2RHS
    begin
      return from_m_cacheL2RHS(map_LHS_to_RHS(to_m_cacheL2LHS(m)));
    end;
  
    function map_directoryL2LHS_to_directoryL2RHS(m: OBJSET_directoryL2LHS): OBJSET_directoryL2RHS
    begin
      return from_m_directoryL2RHS(map_LHS_to_RHS(to_m_directoryL2LHS(m)));
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
        if isundefined(lhs_m.acksExpectedL2) then
          undefine rhs_m.acksExpectedL2;
        else
          rhs_m.acksExpectedL2 := lhs_m.acksExpectedL2;
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
      
        if isundefined(lhs_m.acksExpectedL2) & !isundefined(rhs_m.acksExpectedL2) then
          return false;
        elsif !isundefined(lhs_m.acksExpectedL2) & isundefined(rhs_m.acksExpectedL2) then
          return false; 
        elsif !isundefined(lhs_m.acksExpectedL2) & !isundefined(rhs_m.acksExpectedL2)  then
          if lhs_m.acksExpectedL2 != rhs_m.acksExpectedL2 then
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
      
          undefine resp_cacheL2RHS_BKUP[elem];
          cnt_resp_cacheL2RHS_BKUP[elem] := cnt_resp_cacheL2RHS[elem];
          if cnt_resp_cacheL2RHS[elem] > 0 then
            for idx := 0 to cnt_resp_cacheL2RHS[elem]-1 do  
              resp_cacheL2RHS_BKUP[elem][idx] := (resp_cacheL2RHS[elem][idx]);
            endfor;
          endif;
      
          undefine fwd_cacheL2RHS_BKUP[elem];
          cnt_fwd_cacheL2RHS_BKUP[elem] := cnt_fwd_cacheL2RHS[elem];
          if cnt_fwd_cacheL2RHS[elem] > 0 then
            for idx := 0 to cnt_fwd_cacheL2RHS[elem]-1 do  
              fwd_cacheL2RHS_BKUP[elem][idx] := (fwd_cacheL2RHS[elem][idx]);
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
      
        endfor;
        for elem : OBJSET_directoryL2RHS do 
          i_directoryL2RHS_BKUP[elem] := i_directoryL2RHS[elem];
      
          undefine req_directoryL2RHS_BKUP[elem];
          cnt_req_directoryL2RHS_BKUP[elem] := cnt_req_directoryL2RHS[elem];
          if cnt_req_directoryL2RHS[elem] > 0 then
            for idx := 0 to cnt_req_directoryL2RHS[elem]-1 do  
              req_directoryL2RHS_BKUP[elem][idx] := (req_directoryL2RHS[elem][idx]);
            endfor;
          endif;
      
          undefine resp_directoryL2RHS_BKUP[elem];
          cnt_resp_directoryL2RHS_BKUP[elem] := cnt_resp_directoryL2RHS[elem];
          if cnt_resp_directoryL2RHS[elem] > 0 then
            for idx := 0 to cnt_resp_directoryL2RHS[elem]-1 do  
              resp_directoryL2RHS_BKUP[elem][idx] := (resp_directoryL2RHS[elem][idx]);
            endfor;
          endif;
      
        endfor;
      end;
      
      procedure RestoreRHSBackup();
      begin
        for elem : OBJSET_cacheL2RHS do 
          i_cacheL2RHS[elem] := i_cacheL2RHS_BKUP[elem];
      
          undefine resp_cacheL2RHS[elem];
          cnt_resp_cacheL2RHS[elem] := cnt_resp_cacheL2RHS_BKUP[elem];
          if cnt_resp_cacheL2RHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_resp_cacheL2RHS_BKUP[elem]-1 do  
              resp_cacheL2RHS[elem][idx] := (resp_cacheL2RHS_BKUP[elem][idx]);
            endfor;
          endif;
      
          undefine fwd_cacheL2RHS[elem];
          cnt_fwd_cacheL2RHS[elem] := cnt_fwd_cacheL2RHS_BKUP[elem];
          if cnt_fwd_cacheL2RHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_fwd_cacheL2RHS_BKUP[elem]-1 do  
              fwd_cacheL2RHS[elem][idx] := (fwd_cacheL2RHS_BKUP[elem][idx]);
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
      
        endfor;
        for elem : OBJSET_directoryL2RHS do 
          i_directoryL2RHS[elem] := i_directoryL2RHS_BKUP[elem];
      
          undefine req_directoryL2RHS[elem];
          cnt_req_directoryL2RHS[elem] := cnt_req_directoryL2RHS_BKUP[elem];
          if cnt_req_directoryL2RHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_req_directoryL2RHS_BKUP[elem]-1 do  
              req_directoryL2RHS[elem][idx] := (req_directoryL2RHS_BKUP[elem][idx]);
            endfor;
          endif;
      
          undefine resp_directoryL2RHS[elem];
          cnt_resp_directoryL2RHS[elem] := cnt_resp_directoryL2RHS_BKUP[elem];
          if cnt_resp_directoryL2RHS_BKUP[elem] > 0 then
            for idx := 0 to cnt_resp_directoryL2RHS_BKUP[elem]-1 do  
              resp_directoryL2RHS[elem][idx] := (resp_directoryL2RHS_BKUP[elem][idx]);
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
    procedure ResetMachine_cacheL2LHS();
    begin
      for i:OBJSET_cacheL2LHS do
        for a:Address do
          i_cacheL2LHS[i].cb[a].State := cacheL2LHS_I;
          i_cacheL2LHS[i].cb[a].cl := 0;
          i_cacheL2LHS[i].cb[a].acksReceivedL2 := 0;
          i_cacheL2LHS[i].cb[a].acksExpectedL2 := 0;
    
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
          i_directoryL1LHS[i].cb[a].acksReceivedL2 := 0;
          i_directoryL1LHS[i].cb[a].acksExpectedL2 := 0;
    
        endfor;
      endfor;
    end;
    
    procedure ResetMachine_abstractionRHS();
    begin
      for i:OBJSET_abstractionRHS do
        for a:Address do
          i_abstractionRHS[i].cb[a].State := abstractionRHS_I;
          i_abstractionRHS[i].cb[a].cl := 0;
          i_abstractionRHS[i].cb[a].acksReceivedL2 := 0;
          i_abstractionRHS[i].cb[a].acksExpectedL2 := 0;
    
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
    
    procedure ResetMachine_cacheL2RHS();
    begin
      for i:OBJSET_cacheL2RHS do
        for a:Address do
          i_cacheL2RHS[i].cb[a].State := cacheL2RHS_I;
          i_cacheL2RHS[i].cb[a].cl := 0;
          i_cacheL2RHS[i].cb[a].acksReceivedL2 := 0;
          i_cacheL2RHS[i].cb[a].acksExpectedL2 := 0;
    
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
    
        endfor;
      endfor;
    end;
    
      procedure ResetMachine_();
      begin
      ResetMachine_cacheL2LHS();
      ResetMachine_directoryL1LHS();
      ResetMachine_abstractionRHS();
      ResetMachine_directoryL2LHS();
      ResetMachine_cacheL1LHS();
      ResetMachine_cacheL2RHS();
      ResetMachine_directoryL1LHS();
      ResetMachine_directoryL2RHS();
      
      g_system_state := systemLHS;
      
      g_progress_tracking := false;
      
      end;
  ----Backend/Murphi/MurphiModular/Functions/GenFIFOFunc
  ----Backend/Murphi/MurphiModular/Functions/GenNetworkFunc
    procedure Send_resp(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.directoryL1LHS) then
        Assert(cnt_resp_directoryL1LHS[dst.directoryL1LHS] < O_NET_MAX) "Too many messages: resp_directoryL1LHS";
        resp_directoryL1LHS[dst.directoryL1LHS][cnt_resp_directoryL1LHS[dst.directoryL1LHS]] := msg;
        cnt_resp_directoryL1LHS[dst.directoryL1LHS] := cnt_resp_directoryL1LHS[dst.directoryL1LHS] + 1;
      elsif !isundefined(dst.cacheL1LHS) then
        Assert(cnt_resp_cacheL1LHS[dst.cacheL1LHS] < O_NET_MAX) "Too many messages: resp_cacheL1LHS";
        resp_cacheL1LHS[dst.cacheL1LHS][cnt_resp_cacheL1LHS[dst.cacheL1LHS]] := msg;
        cnt_resp_cacheL1LHS[dst.cacheL1LHS] := cnt_resp_cacheL1LHS[dst.cacheL1LHS] + 1;
      elsif !isundefined(dst.cacheL2LHS) then
        Assert(cnt_resp_cacheL2LHS[dst.cacheL2LHS] < O_NET_MAX) "Too many messages: resp_cacheL2LHS";
        resp_cacheL2LHS[dst.cacheL2LHS][cnt_resp_cacheL2LHS[dst.cacheL2LHS]] := msg;
        cnt_resp_cacheL2LHS[dst.cacheL2LHS] := cnt_resp_cacheL2LHS[dst.cacheL2LHS] + 1;
      elsif !isundefined(dst.directoryL2LHS) then
        Assert(cnt_resp_directoryL2LHS[dst.directoryL2LHS] < O_NET_MAX) "Too many messages: resp_directoryL2LHS";
        resp_directoryL2LHS[dst.directoryL2LHS][cnt_resp_directoryL2LHS[dst.directoryL2LHS]] := msg;
        cnt_resp_directoryL2LHS[dst.directoryL2LHS] := cnt_resp_directoryL2LHS[dst.directoryL2LHS] + 1;
      elsif !isundefined(dst.cacheL2RHS) then
        Assert(cnt_resp_cacheL2RHS[dst.cacheL2RHS] < O_NET_MAX) "Too many messages: resp_cacheL2RHS";
        resp_cacheL2RHS[dst.cacheL2RHS][cnt_resp_cacheL2RHS[dst.cacheL2RHS]] := msg;
        cnt_resp_cacheL2RHS[dst.cacheL2RHS] := cnt_resp_cacheL2RHS[dst.cacheL2RHS] + 1;
      elsif !isundefined(dst.abstractionRHS) then
        Assert(cnt_resp_abstractionRHS[dst.abstractionRHS] < O_NET_MAX) "Too many messages: resp_abstractionRHS";
        resp_abstractionRHS[dst.abstractionRHS][cnt_resp_abstractionRHS[dst.abstractionRHS]] := msg;
        cnt_resp_abstractionRHS[dst.abstractionRHS] := cnt_resp_abstractionRHS[dst.abstractionRHS] + 1;
      elsif !isundefined(dst.directoryL2RHS) then
        Assert(cnt_resp_directoryL2RHS[dst.directoryL2RHS] < O_NET_MAX) "Too many messages: resp_directoryL2RHS";
        resp_directoryL2RHS[dst.directoryL2RHS][cnt_resp_directoryL2RHS[dst.directoryL2RHS]] := msg;
        cnt_resp_directoryL2RHS[dst.directoryL2RHS] := cnt_resp_directoryL2RHS[dst.directoryL2RHS] + 1;
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
      if !isundefined(dst.directoryL1LHS) then
        Assert (cnt_resp_directoryL1LHS[dst.directoryL1LHS] > 0) "Trying to advance empty queue: resp_directoryL1LHS";
        for i := 0 to cnt_resp_directoryL1LHS[dst.directoryL1LHS]-1 do
          if i < cnt_resp_directoryL1LHS[dst.directoryL1LHS]-1 then
            resp_directoryL1LHS[dst.directoryL1LHS][i] := resp_directoryL1LHS[dst.directoryL1LHS][i+1];
          else
            undefine resp_directoryL1LHS[dst.directoryL1LHS][i];
          endif;
        endfor;
        cnt_resp_directoryL1LHS[dst.directoryL1LHS] := cnt_resp_directoryL1LHS[dst.directoryL1LHS] - 1;
      elsif !isundefined(dst.cacheL1LHS) then
        Assert (cnt_resp_cacheL1LHS[dst.cacheL1LHS] > 0) "Trying to advance empty queue: resp_cacheL1LHS";
        for i := 0 to cnt_resp_cacheL1LHS[dst.cacheL1LHS]-1 do
          if i < cnt_resp_cacheL1LHS[dst.cacheL1LHS]-1 then
            resp_cacheL1LHS[dst.cacheL1LHS][i] := resp_cacheL1LHS[dst.cacheL1LHS][i+1];
          else
            undefine resp_cacheL1LHS[dst.cacheL1LHS][i];
          endif;
        endfor;
        cnt_resp_cacheL1LHS[dst.cacheL1LHS] := cnt_resp_cacheL1LHS[dst.cacheL1LHS] - 1;
      elsif !isundefined(dst.cacheL2LHS) then
        Assert (cnt_resp_cacheL2LHS[dst.cacheL2LHS] > 0) "Trying to advance empty queue: resp_cacheL2LHS";
        for i := 0 to cnt_resp_cacheL2LHS[dst.cacheL2LHS]-1 do
          if i < cnt_resp_cacheL2LHS[dst.cacheL2LHS]-1 then
            resp_cacheL2LHS[dst.cacheL2LHS][i] := resp_cacheL2LHS[dst.cacheL2LHS][i+1];
          else
            undefine resp_cacheL2LHS[dst.cacheL2LHS][i];
          endif;
        endfor;
        cnt_resp_cacheL2LHS[dst.cacheL2LHS] := cnt_resp_cacheL2LHS[dst.cacheL2LHS] - 1;
      elsif !isundefined(dst.directoryL2LHS) then
        Assert (cnt_resp_directoryL2LHS[dst.directoryL2LHS] > 0) "Trying to advance empty queue: resp_directoryL2LHS";
        for i := 0 to cnt_resp_directoryL2LHS[dst.directoryL2LHS]-1 do
          if i < cnt_resp_directoryL2LHS[dst.directoryL2LHS]-1 then
            resp_directoryL2LHS[dst.directoryL2LHS][i] := resp_directoryL2LHS[dst.directoryL2LHS][i+1];
          else
            undefine resp_directoryL2LHS[dst.directoryL2LHS][i];
          endif;
        endfor;
        cnt_resp_directoryL2LHS[dst.directoryL2LHS] := cnt_resp_directoryL2LHS[dst.directoryL2LHS] - 1;
      elsif !isundefined(dst.cacheL2RHS) then
        Assert (cnt_resp_cacheL2RHS[dst.cacheL2RHS] > 0) "Trying to advance empty queue: resp_cacheL2RHS";
        for i := 0 to cnt_resp_cacheL2RHS[dst.cacheL2RHS]-1 do
          if i < cnt_resp_cacheL2RHS[dst.cacheL2RHS]-1 then
            resp_cacheL2RHS[dst.cacheL2RHS][i] := resp_cacheL2RHS[dst.cacheL2RHS][i+1];
          else
            undefine resp_cacheL2RHS[dst.cacheL2RHS][i];
          endif;
        endfor;
        cnt_resp_cacheL2RHS[dst.cacheL2RHS] := cnt_resp_cacheL2RHS[dst.cacheL2RHS] - 1;
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
      elsif !isundefined(dst.directoryL2RHS) then
        Assert (cnt_resp_directoryL2RHS[dst.directoryL2RHS] > 0) "Trying to advance empty queue: resp_directoryL2RHS";
        for i := 0 to cnt_resp_directoryL2RHS[dst.directoryL2RHS]-1 do
          if i < cnt_resp_directoryL2RHS[dst.directoryL2RHS]-1 then
            resp_directoryL2RHS[dst.directoryL2RHS][i] := resp_directoryL2RHS[dst.directoryL2RHS][i+1];
          else
            undefine resp_directoryL2RHS[dst.directoryL2RHS][i];
          endif;
        endfor;
        cnt_resp_directoryL2RHS[dst.directoryL2RHS] := cnt_resp_directoryL2RHS[dst.directoryL2RHS] - 1;
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
      if !isundefined(dst.directoryL1LHS) then
        Assert(cnt_req_directoryL1LHS[dst.directoryL1LHS] < O_NET_MAX) "Too many messages: req_directoryL1LHS";
        req_directoryL1LHS[dst.directoryL1LHS][cnt_req_directoryL1LHS[dst.directoryL1LHS]] := msg;
        cnt_req_directoryL1LHS[dst.directoryL1LHS] := cnt_req_directoryL1LHS[dst.directoryL1LHS] + 1;
      elsif !isundefined(dst.cacheL1LHS) then
        error "Attempt to send to queue req_cacheL1LHS, which is not modeled"; 
      elsif !isundefined(dst.cacheL2LHS) then
        error "Attempt to send to queue req_cacheL2LHS, which is not modeled"; 
      elsif !isundefined(dst.directoryL2LHS) then
        Assert(cnt_req_directoryL2LHS[dst.directoryL2LHS] < O_NET_MAX) "Too many messages: req_directoryL2LHS";
        req_directoryL2LHS[dst.directoryL2LHS][cnt_req_directoryL2LHS[dst.directoryL2LHS]] := msg;
        cnt_req_directoryL2LHS[dst.directoryL2LHS] := cnt_req_directoryL2LHS[dst.directoryL2LHS] + 1;
      elsif !isundefined(dst.cacheL2RHS) then
        error "Attempt to send to queue req_cacheL2RHS, which is not modeled"; 
      elsif !isundefined(dst.abstractionRHS) then
        Assert(cnt_req_abstractionRHS[dst.abstractionRHS] < O_NET_MAX) "Too many messages: req_abstractionRHS";
        req_abstractionRHS[dst.abstractionRHS][cnt_req_abstractionRHS[dst.abstractionRHS]] := msg;
        cnt_req_abstractionRHS[dst.abstractionRHS] := cnt_req_abstractionRHS[dst.abstractionRHS] + 1;
      elsif !isundefined(dst.directoryL2RHS) then
        Assert(cnt_req_directoryL2RHS[dst.directoryL2RHS] < O_NET_MAX) "Too many messages: req_directoryL2RHS";
        req_directoryL2RHS[dst.directoryL2RHS][cnt_req_directoryL2RHS[dst.directoryL2RHS]] := msg;
        cnt_req_directoryL2RHS[dst.directoryL2RHS] := cnt_req_directoryL2RHS[dst.directoryL2RHS] + 1;
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
      if !isundefined(dst.directoryL1LHS) then
        Assert (cnt_req_directoryL1LHS[dst.directoryL1LHS] > 0) "Trying to advance empty queue: req_directoryL1LHS";
        for i := 0 to cnt_req_directoryL1LHS[dst.directoryL1LHS]-1 do
          if i < cnt_req_directoryL1LHS[dst.directoryL1LHS]-1 then
            req_directoryL1LHS[dst.directoryL1LHS][i] := req_directoryL1LHS[dst.directoryL1LHS][i+1];
          else
            undefine req_directoryL1LHS[dst.directoryL1LHS][i];
          endif;
        endfor;
        cnt_req_directoryL1LHS[dst.directoryL1LHS] := cnt_req_directoryL1LHS[dst.directoryL1LHS] - 1;
      elsif !isundefined(dst.cacheL1LHS) then
        error "Attempt to pop from queue req_cacheL1LHS, which is not modeled"; 
      elsif !isundefined(dst.cacheL2LHS) then
        error "Attempt to pop from queue req_cacheL2LHS, which is not modeled"; 
      elsif !isundefined(dst.directoryL2LHS) then
        Assert (cnt_req_directoryL2LHS[dst.directoryL2LHS] > 0) "Trying to advance empty queue: req_directoryL2LHS";
        for i := 0 to cnt_req_directoryL2LHS[dst.directoryL2LHS]-1 do
          if i < cnt_req_directoryL2LHS[dst.directoryL2LHS]-1 then
            req_directoryL2LHS[dst.directoryL2LHS][i] := req_directoryL2LHS[dst.directoryL2LHS][i+1];
          else
            undefine req_directoryL2LHS[dst.directoryL2LHS][i];
          endif;
        endfor;
        cnt_req_directoryL2LHS[dst.directoryL2LHS] := cnt_req_directoryL2LHS[dst.directoryL2LHS] - 1;
      elsif !isundefined(dst.cacheL2RHS) then
        error "Attempt to pop from queue req_cacheL2RHS, which is not modeled"; 
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
      elsif !isundefined(dst.directoryL2RHS) then
        Assert (cnt_req_directoryL2RHS[dst.directoryL2RHS] > 0) "Trying to advance empty queue: req_directoryL2RHS";
        for i := 0 to cnt_req_directoryL2RHS[dst.directoryL2RHS]-1 do
          if i < cnt_req_directoryL2RHS[dst.directoryL2RHS]-1 then
            req_directoryL2RHS[dst.directoryL2RHS][i] := req_directoryL2RHS[dst.directoryL2RHS][i+1];
          else
            undefine req_directoryL2RHS[dst.directoryL2RHS][i];
          endif;
        endfor;
        cnt_req_directoryL2RHS[dst.directoryL2RHS] := cnt_req_directoryL2RHS[dst.directoryL2RHS] - 1;
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
      if !isundefined(dst.directoryL1LHS) then
        Assert(cnt_fwd_directoryL1LHS[dst.directoryL1LHS] < O_NET_MAX) "Too many messages: fwd_directoryL1LHS";
        fwd_directoryL1LHS[dst.directoryL1LHS][cnt_fwd_directoryL1LHS[dst.directoryL1LHS]] := msg;
        cnt_fwd_directoryL1LHS[dst.directoryL1LHS] := cnt_fwd_directoryL1LHS[dst.directoryL1LHS] + 1;
      elsif !isundefined(dst.cacheL1LHS) then
        Assert(cnt_fwd_cacheL1LHS[dst.cacheL1LHS] < O_NET_MAX) "Too many messages: fwd_cacheL1LHS";
        fwd_cacheL1LHS[dst.cacheL1LHS][cnt_fwd_cacheL1LHS[dst.cacheL1LHS]] := msg;
        cnt_fwd_cacheL1LHS[dst.cacheL1LHS] := cnt_fwd_cacheL1LHS[dst.cacheL1LHS] + 1;
      elsif !isundefined(dst.cacheL2LHS) then
        Assert(cnt_fwd_cacheL2LHS[dst.cacheL2LHS] < O_NET_MAX) "Too many messages: fwd_cacheL2LHS";
        fwd_cacheL2LHS[dst.cacheL2LHS][cnt_fwd_cacheL2LHS[dst.cacheL2LHS]] := msg;
        cnt_fwd_cacheL2LHS[dst.cacheL2LHS] := cnt_fwd_cacheL2LHS[dst.cacheL2LHS] + 1;
      elsif !isundefined(dst.directoryL2LHS) then
        error "Attempt to send to queue fwd_directoryL2LHS, which is not modeled"; 
      elsif !isundefined(dst.cacheL2RHS) then
        Assert(cnt_fwd_cacheL2RHS[dst.cacheL2RHS] < O_NET_MAX) "Too many messages: fwd_cacheL2RHS";
        fwd_cacheL2RHS[dst.cacheL2RHS][cnt_fwd_cacheL2RHS[dst.cacheL2RHS]] := msg;
        cnt_fwd_cacheL2RHS[dst.cacheL2RHS] := cnt_fwd_cacheL2RHS[dst.cacheL2RHS] + 1;
      elsif !isundefined(dst.abstractionRHS) then
        Assert(cnt_fwd_abstractionRHS[dst.abstractionRHS] < O_NET_MAX) "Too many messages: fwd_abstractionRHS";
        fwd_abstractionRHS[dst.abstractionRHS][cnt_fwd_abstractionRHS[dst.abstractionRHS]] := msg;
        cnt_fwd_abstractionRHS[dst.abstractionRHS] := cnt_fwd_abstractionRHS[dst.abstractionRHS] + 1;
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
      if !isundefined(dst.directoryL1LHS) then
        Assert (cnt_fwd_directoryL1LHS[dst.directoryL1LHS] > 0) "Trying to advance empty queue: fwd_directoryL1LHS";
        for i := 0 to cnt_fwd_directoryL1LHS[dst.directoryL1LHS]-1 do
          if i < cnt_fwd_directoryL1LHS[dst.directoryL1LHS]-1 then
            fwd_directoryL1LHS[dst.directoryL1LHS][i] := fwd_directoryL1LHS[dst.directoryL1LHS][i+1];
          else
            undefine fwd_directoryL1LHS[dst.directoryL1LHS][i];
          endif;
        endfor;
        cnt_fwd_directoryL1LHS[dst.directoryL1LHS] := cnt_fwd_directoryL1LHS[dst.directoryL1LHS] - 1;
      elsif !isundefined(dst.cacheL1LHS) then
        Assert (cnt_fwd_cacheL1LHS[dst.cacheL1LHS] > 0) "Trying to advance empty queue: fwd_cacheL1LHS";
        for i := 0 to cnt_fwd_cacheL1LHS[dst.cacheL1LHS]-1 do
          if i < cnt_fwd_cacheL1LHS[dst.cacheL1LHS]-1 then
            fwd_cacheL1LHS[dst.cacheL1LHS][i] := fwd_cacheL1LHS[dst.cacheL1LHS][i+1];
          else
            undefine fwd_cacheL1LHS[dst.cacheL1LHS][i];
          endif;
        endfor;
        cnt_fwd_cacheL1LHS[dst.cacheL1LHS] := cnt_fwd_cacheL1LHS[dst.cacheL1LHS] - 1;
      elsif !isundefined(dst.cacheL2LHS) then
        Assert (cnt_fwd_cacheL2LHS[dst.cacheL2LHS] > 0) "Trying to advance empty queue: fwd_cacheL2LHS";
        for i := 0 to cnt_fwd_cacheL2LHS[dst.cacheL2LHS]-1 do
          if i < cnt_fwd_cacheL2LHS[dst.cacheL2LHS]-1 then
            fwd_cacheL2LHS[dst.cacheL2LHS][i] := fwd_cacheL2LHS[dst.cacheL2LHS][i+1];
          else
            undefine fwd_cacheL2LHS[dst.cacheL2LHS][i];
          endif;
        endfor;
        cnt_fwd_cacheL2LHS[dst.cacheL2LHS] := cnt_fwd_cacheL2LHS[dst.cacheL2LHS] - 1;
      elsif !isundefined(dst.directoryL2LHS) then
        error "Attempt to pop from queue fwd_directoryL2LHS, which is not modeled"; 
      elsif !isundefined(dst.cacheL2RHS) then
        Assert (cnt_fwd_cacheL2RHS[dst.cacheL2RHS] > 0) "Trying to advance empty queue: fwd_cacheL2RHS";
        for i := 0 to cnt_fwd_cacheL2RHS[dst.cacheL2RHS]-1 do
          if i < cnt_fwd_cacheL2RHS[dst.cacheL2RHS]-1 then
            fwd_cacheL2RHS[dst.cacheL2RHS][i] := fwd_cacheL2RHS[dst.cacheL2RHS][i+1];
          else
            undefine fwd_cacheL2RHS[dst.cacheL2RHS][i];
          endif;
        endfor;
        cnt_fwd_cacheL2RHS[dst.cacheL2RHS] := cnt_fwd_cacheL2RHS[dst.cacheL2RHS] - 1;
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
    
    procedure Multicast_fwd_v_cacheL2(var msg: Message; dst_vect: v_cacheL2; src: Machines;);
    begin
      for n : OBJSET_directoryL1LHS do
        if IsElement_cacheL2(dst_vect, to_m_directoryL1LHS(n)) then
          msg.dst := to_m_directoryL1LHS(n);
          Send_fwd(msg, src);
        endif;
      endfor;
      for n : OBJSET_cacheL2RHS do
        if IsElement_cacheL2(dst_vect, to_m_cacheL2RHS(n)) then
          msg.dst := to_m_cacheL2RHS(n);
          Send_fwd(msg, src);
        endif;
      endfor;
      for n : OBJSET_abstractionRHS do
        if IsElement_cacheL2(dst_vect, to_m_abstractionRHS(n)) then
          msg.dst := to_m_abstractionRHS(n);
          Send_fwd(msg, src);
        endif;
      endfor;
      for n : OBJSET_cacheL2LHS do
        if IsElement_cacheL2(dst_vect, to_m_cacheL2LHS(n)) then
          msg.dst := to_m_cacheL2LHS(n);
          Send_fwd(msg, src);
        endif;
      endfor;
      for n : OBJSET_cacheL1LHS do
        if IsElement_cacheL2(dst_vect, to_m_cacheL1LHS(n)) then
          msg.dst := to_m_cacheL1LHS(n);
          Send_fwd(msg, src);
        endif;
      endfor;
      for n : OBJSET_directoryL2RHS do
        if IsElement_cacheL2(dst_vect, to_m_directoryL2RHS(n)) then
          msg.dst := to_m_directoryL2RHS(n);
          Send_fwd(msg, src);
        endif;
      endfor;
    
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
    
    function resp_LHS_network_ready(): boolean;
    begin
      for dst:OBJSET_directoryL1LHS do
        if cnt_resp_directoryL1LHS[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_cacheL2LHS do
        if cnt_resp_cacheL2LHS[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_cacheL1LHS do
        if cnt_resp_cacheL1LHS[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2LHS do
        if cnt_resp_directoryL2LHS[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function resp_RHS_network_ready(): boolean;
    begin
      for dst:OBJSET_cacheL2RHS do
        if cnt_resp_cacheL2RHS[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_abstractionRHS do
        if cnt_resp_abstractionRHS[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2RHS do
        if cnt_resp_directoryL2RHS[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function fwd_LHS_network_ready(): boolean;
    begin
      for dst:OBJSET_directoryL1LHS do
        if cnt_fwd_directoryL1LHS[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_cacheL2LHS do
        if cnt_fwd_cacheL2LHS[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_cacheL1LHS do
        if cnt_fwd_cacheL1LHS[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function fwd_RHS_network_ready(): boolean;
    begin
      for dst:OBJSET_cacheL2RHS do
        if cnt_fwd_cacheL2RHS[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_abstractionRHS do
        if cnt_fwd_abstractionRHS[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function req_LHS_network_ready(): boolean;
    begin
      for dst:OBJSET_directoryL1LHS do
        if cnt_req_directoryL1LHS[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2LHS do
        if cnt_req_directoryL2LHS[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function req_RHS_network_ready(): boolean;
    begin
      for dst:OBJSET_abstractionRHS do
        if cnt_req_abstractionRHS[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2RHS do
        if cnt_req_directoryL2RHS[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function network_LHS_ready(): boolean;
    begin
            if !resp_LHS_network_ready() then
            return false;
          endif;
    
    
          if !fwd_LHS_network_ready() then
            return false;
          endif;
    
    
          if !req_LHS_network_ready() then
            return false;
          endif;
    
    
    
      return true;
    end;
    function network_RHS_ready(): boolean;
    begin
            if !resp_RHS_network_ready() then
            return false;
          endif;
    
    
          if !fwd_RHS_network_ready() then
            return false;
          endif;
    
    
          if !req_RHS_network_ready() then
            return false;
          endif;
    
    
    
      return true;
    end;
    
    function resp_LHS_network_used(): boolean;
    begin
      for dst:OBJSET_directoryL1LHS do
        if cnt_resp_directoryL1LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_cacheL2LHS do
        if cnt_resp_cacheL2LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_cacheL1LHS do
        if cnt_resp_cacheL1LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_directoryL2LHS do
        if cnt_resp_directoryL2LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
    
    
      return false ;
    end;
    function resp_RHS_network_used(): boolean;
    begin
      for dst:OBJSET_cacheL2RHS do
        if cnt_resp_cacheL2RHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_abstractionRHS do
        if cnt_resp_abstractionRHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_directoryL2RHS do
        if cnt_resp_directoryL2RHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
    
    
      return false ;
    end;
    function fwd_LHS_network_used(): boolean;
    begin
      for dst:OBJSET_directoryL1LHS do
        if cnt_fwd_directoryL1LHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_cacheL2LHS do
        if cnt_fwd_cacheL2LHS[dst] >= 1 then
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
      for dst:OBJSET_cacheL2RHS do
        if cnt_fwd_cacheL2RHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
      for dst:OBJSET_abstractionRHS do
        if cnt_fwd_abstractionRHS[dst] >= 1 then
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
      for dst:OBJSET_directoryL2LHS do
        if cnt_req_directoryL2LHS[dst] >= 1 then
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
      for dst:OBJSET_directoryL2RHS do
        if cnt_req_directoryL2RHS[dst] >= 1 then
          return true ;
        endif;
      endfor;
    
    
      return false ;
    end;
    function network_LHS_used(): boolean;
    begin
            if resp_LHS_network_used() then
            return true ;
          endif;
    
    
          if fwd_LHS_network_used() then
            return true ;
          endif;
    
    
          if req_LHS_network_used() then
            return true ;
          endif;
    
    
    
      return false ;
    end;
    function network_RHS_used(): boolean;
    begin
            if resp_RHS_network_used() then
            return true ;
          endif;
    
    
          if fwd_RHS_network_used() then
            return true ;
          endif;
    
    
          if req_RHS_network_used() then
            return true ;
          endif;
    
    
    
      return false ;
    end;
    
    procedure Reset_NET_();
    begin
      undefine resp_directoryL1LHS;
      undefine req_directoryL1LHS;
      undefine fwd_directoryL1LHS;
      for dst:OBJSET_directoryL1LHS do
        cnt_resp_directoryL1LHS[dst] := 0;
        cnt_req_directoryL1LHS[dst] := 0;
        cnt_fwd_directoryL1LHS[dst] := 0;
      endfor;
      
      undefine resp_cacheL2RHS;
      undefine fwd_cacheL2RHS;
      for dst:OBJSET_cacheL2RHS do
        cnt_resp_cacheL2RHS[dst] := 0;
        cnt_fwd_cacheL2RHS[dst] := 0;
      endfor;
      
      undefine resp_abstractionRHS;
      undefine req_abstractionRHS;
      undefine fwd_abstractionRHS;
      for dst:OBJSET_abstractionRHS do
        cnt_resp_abstractionRHS[dst] := 0;
        cnt_req_abstractionRHS[dst] := 0;
        cnt_fwd_abstractionRHS[dst] := 0;
      endfor;
      
      undefine resp_cacheL2LHS;
      undefine fwd_cacheL2LHS;
      for dst:OBJSET_cacheL2LHS do
        cnt_resp_cacheL2LHS[dst] := 0;
        cnt_fwd_cacheL2LHS[dst] := 0;
      endfor;
      
      undefine resp_cacheL1LHS;
      undefine fwd_cacheL1LHS;
      for dst:OBJSET_cacheL1LHS do
        cnt_resp_cacheL1LHS[dst] := 0;
        cnt_fwd_cacheL1LHS[dst] := 0;
      endfor;
      
      undefine resp_directoryL2RHS;
      undefine req_directoryL2RHS;
      for dst:OBJSET_directoryL2RHS do
        cnt_resp_directoryL2RHS[dst] := 0;
        cnt_req_directoryL2RHS[dst] := 0;
      endfor;
      
      undefine resp_directoryL2LHS;
      undefine req_directoryL2LHS;
      for dst:OBJSET_directoryL2LHS do
        cnt_resp_directoryL2LHS[dst] := 0;
        cnt_req_directoryL2LHS[dst] := 0;
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
    
    function RequestL2(adr: Address; mtype: MessageType; src: Machines; dst: Machines) : Message;
    var Message: Message;
    begin
      Message.adr := adr;
      Message.mtype := mtype;
      Message.src := src;
      Message.dst := dst;
    return Message;
    end;
    
    function AckL2(adr: Address; mtype: MessageType; src: Machines; dst: Machines) : Message;
    var Message: Message;
    begin
      Message.adr := adr;
      Message.mtype := mtype;
      Message.src := src;
      Message.dst := dst;
    return Message;
    end;
    
    function RespL2(adr: Address; mtype: MessageType; src: Machines; dst: Machines; cl: ClValue) : Message;
    var Message: Message;
    begin
      Message.adr := adr;
      Message.mtype := mtype;
      Message.src := src;
      Message.dst := dst;
      Message.cl := cl;
    return Message;
    end;
    
    function RespAckL2(adr: Address; mtype: MessageType; src: Machines; dst: Machines; cl: ClValue; acksExpectedL2: 0..NrCachesL2) : Message;
    var Message: Message;
    begin
      Message.adr := adr;
      Message.mtype := mtype;
      Message.src := src;
      Message.dst := dst;
      Message.cl := cl;
      Message.acksExpectedL2 := acksExpectedL2;
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
          if cnt_resp_cacheL2LHS[elem] > 0 then
            for idx := 0 to cnt_resp_cacheL2LHS[elem]-1 do
              if is_machine_in_state(resp_cacheL2LHS[elem][idx].src, systemLHS) then
                if cnt_resp_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(resp_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHS) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_resp_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(resp_cacheL2LHS[elem][idx], resp_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_resp_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)] > (cnt_resp_cacheL2LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_resp_cacheL2LHS[elem] - lhs_offset + rhs_offset) to cnt_resp_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)]-1 do
              if is_machine_in_state(resp_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)][idx].src, systemRHS) then
                return false;
              endif;
            endfor;
          endif;
        
          lhs_offset := 0;
          rhs_offset := 0;
          if cnt_fwd_cacheL2LHS[elem] > 0 then
            for idx := 0 to cnt_fwd_cacheL2LHS[elem]-1 do
              if is_machine_in_state(fwd_cacheL2LHS[elem][idx].src, systemLHS) then
                if cnt_fwd_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(fwd_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHS) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_fwd_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(fwd_cacheL2LHS[elem][idx], fwd_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_fwd_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)] > (cnt_fwd_cacheL2LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_fwd_cacheL2LHS[elem] - lhs_offset + rhs_offset) to cnt_fwd_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)]-1 do
              if is_machine_in_state(fwd_cacheL2RHS[map_cacheL2LHS_to_cacheL2RHS(elem)][idx].src, systemRHS) then
                return false;
              endif;
            endfor;
          endif;
        
        endfor;
        
        for elem : OBJSET_directoryL2LHS do
          lhs_offset := 0;
          rhs_offset := 0;
          if cnt_req_directoryL2LHS[elem] > 0 then
            for idx := 0 to cnt_req_directoryL2LHS[elem]-1 do
              if is_machine_in_state(req_directoryL2LHS[elem][idx].src, systemLHS) then
                if cnt_req_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(req_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHS) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_req_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(req_directoryL2LHS[elem][idx], req_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_req_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)] > (cnt_req_directoryL2LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_req_directoryL2LHS[elem] - lhs_offset + rhs_offset) to cnt_req_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)]-1 do
              if is_machine_in_state(req_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)][idx].src, systemRHS) then
                return false;
              endif;
            endfor;
          endif;
        
          lhs_offset := 0;
          rhs_offset := 0;
          if cnt_resp_directoryL2LHS[elem] > 0 then
            for idx := 0 to cnt_resp_directoryL2LHS[elem]-1 do
              if is_machine_in_state(resp_directoryL2LHS[elem][idx].src, systemLHS) then
                if cnt_resp_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                  return false;
                endif;
                while !is_machine_in_state(resp_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)][idx - lhs_offset + rhs_offset].src, systemRHS) do
                  rhs_offset := rhs_offset + 1;
                  if cnt_resp_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)] <= (idx - lhs_offset + rhs_offset) then
                    return false;
                  endif;
                endwhile;
                if !is_LHS_msg_eq_RHS(resp_directoryL2LHS[elem][idx], resp_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)][idx - lhs_offset + rhs_offset]) then
                    return false;
                endif;
              else
                  lhs_offset := lhs_offset + 1;
              endif;
            endfor;
          endif;
          if cnt_resp_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)] > (cnt_resp_directoryL2LHS[elem] - lhs_offset + rhs_offset) then
            for idx := (cnt_resp_directoryL2LHS[elem] - lhs_offset + rhs_offset) to cnt_resp_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)]-1 do
              if is_machine_in_state(resp_directoryL2RHS[map_directoryL2LHS_to_directoryL2RHS(elem)][idx].src, systemRHS) then
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
        
        endalias;
        
        -- Outputs
        for elem : OBJSET_cacheL2LHS do
          rhs_offset := 0;
          lhs_offset := 0;
          alias elem_rhs : map_cacheL2LHS_to_cacheL2RHS(elem) do
              if cnt_resp_cacheL2RHS[elem_rhs] > 0 then
              for idx := 0 to cnt_resp_cacheL2RHS[elem_rhs]-1 do
                  if is_machine_in_state(resp_cacheL2RHS[elem_rhs][idx].src, systemRHS) then
                  if cnt_resp_cacheL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                      return false;
                  endif;
                  while !is_machine_in_state(resp_cacheL2LHS[elem][idx - rhs_offset + lhs_offset].src, systemLHS) do
                      lhs_offset := lhs_offset + 1;
                      if cnt_resp_cacheL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                        return false;
                      endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(resp_cacheL2LHS[elem][idx - rhs_offset + lhs_offset], resp_cacheL2RHS[elem_rhs][idx]) then
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
              if cnt_fwd_cacheL2RHS[elem_rhs] > 0 then
              for idx := 0 to cnt_fwd_cacheL2RHS[elem_rhs]-1 do
                  if is_machine_in_state(fwd_cacheL2RHS[elem_rhs][idx].src, systemRHS) then
                  if cnt_fwd_cacheL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                      return false;
                  endif;
                  while !is_machine_in_state(fwd_cacheL2LHS[elem][idx - rhs_offset + lhs_offset].src, systemLHS) do
                      lhs_offset := lhs_offset + 1;
                      if cnt_fwd_cacheL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                        return false;
                      endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(fwd_cacheL2LHS[elem][idx - rhs_offset + lhs_offset], fwd_cacheL2RHS[elem_rhs][idx]) then
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
              if cnt_req_directoryL2RHS[elem_rhs] > 0 then
              for idx := 0 to cnt_req_directoryL2RHS[elem_rhs]-1 do
                  if is_machine_in_state(req_directoryL2RHS[elem_rhs][idx].src, systemRHS) then
                  if cnt_req_directoryL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                      return false;
                  endif;
                  while !is_machine_in_state(req_directoryL2LHS[elem][idx - rhs_offset + lhs_offset].src, systemLHS) do
                      lhs_offset := lhs_offset + 1;
                      if cnt_req_directoryL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                        return false;
                      endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(req_directoryL2LHS[elem][idx - rhs_offset + lhs_offset], req_directoryL2RHS[elem_rhs][idx]) then
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
              if cnt_resp_directoryL2RHS[elem_rhs] > 0 then
              for idx := 0 to cnt_resp_directoryL2RHS[elem_rhs]-1 do
                  if is_machine_in_state(resp_directoryL2RHS[elem_rhs][idx].src, systemRHS) then
                  if cnt_resp_directoryL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                      return false;
                  endif;
                  while !is_machine_in_state(resp_directoryL2LHS[elem][idx - rhs_offset + lhs_offset].src, systemLHS) do
                      lhs_offset := lhs_offset + 1;
                      if cnt_resp_directoryL2LHS[elem] <= (idx - rhs_offset + lhs_offset) then
                        return false;
                      endif;
                  endwhile;
                  if !is_LHS_msg_eq_RHS(resp_directoryL2LHS[elem][idx - rhs_offset + lhs_offset], resp_directoryL2RHS[elem_rhs][idx]) then
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
          return true;
        elsif state = systemRHS then
          if !g_progress_tracking then
            return sameOutputOB() ;
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
          return !sameOutputOB();
        elsif state = systemLHSExt then
          return sameOutputOB() & !g_progress_tracking;
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
                return sameOutputOB(); -- as long as no OB was caused continue
              endif
          elsif state = systemLHSExt then
              return sameOutputOB();
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
      cbe.acksExpectedL1 := 0;
      cbe.acksReceivedL1 := 0;
      Set_perm(store, adr, m);
      msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
      msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
      RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
      if (cbe.ownerL1 = msg_PutML1.src) then
      cbe.cl := msg_PutML1.cl;
      msg := RespL2(adr,PutML2,m,to_m_directoryL2LHS(directoryL2LHS),cbe.cl);
      Send_req(msg, m);
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
      cbe.acksExpectedL1 := 0;
      cbe.acksReceivedL1 := 0;
      Set_perm(store, adr, m);
      msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
      msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
      RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
      if (cbe.ownerL1 = msg_PutML1.src) then
      cbe.cl := msg_PutML1.cl;
      msg := RequestL2(adr,PutSL2,m,to_m_directoryL2LHS(directoryL2LHS));
      Send_req(msg, m);
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
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          msg := RespL2(adr,PutML2,m,to_m_directoryL2LHS(directoryL2LHS),cbe.cl);
          Send_req(msg, m);
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
        if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictdM_x_pI_store_GetM_Ack_AD__C__M;
          return;
        endif;
        if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          msg := RespL2(adr,PutML2,m,to_m_directoryL2LHS(directoryL2LHS),cbe.cl);
          Send_req(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictI__C__M_evict;
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
      msg := AckL2(adr,PutEL2,m,to_m_directoryL2LHS(directoryL2LHS));
      Send_req(msg, m);
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
      msg := RequestL2(adr,GetSL2,m,to_m_directoryL2LHS(directoryL2LHS));
      Send_req(msg, m);
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
      msg := RequestL2(adr,GetML2,m,to_m_directoryL2LHS(directoryL2LHS));
      Send_req(msg, m);
      cbe.acksReceivedL2 := 0;
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
      msg := RespL2(adr,PutML2,m,to_m_directoryL2LHS(directoryL2LHS),cbe.cl);
      Send_req(msg, m);
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
      msg := RequestL2(adr,PutSL2,m,to_m_directoryL2LHS(directoryL2LHS));
      Send_req(msg, m);
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
      msg := RequestL2(adr,GetML2,m,to_m_directoryL2LHS(directoryL2LHS));
      Send_req(msg, m);
      cbe.acksReceivedL2 := 0;
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
      msg := AckL2(adr,PutEL2,m,to_m_directoryL2RHS(directoryL2LHS));
      Send_req(msg, m);
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
      msg := RequestL2(adr,GetSL2,m,to_m_directoryL2RHS(directoryL2LHS));
      Send_req(msg, m);
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
      msg := RequestL2(adr,GetML2,m,to_m_directoryL2RHS(directoryL2LHS));
      Send_req(msg, m);
      cbe.acksReceivedL2 := 0;
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
      msg := RespL2(adr,PutML2,m,to_m_directoryL2RHS(directoryL2LHS),cbe.cl);
      Send_req(msg, m);
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
      msg := RequestL2(adr,PutSL2,m,to_m_directoryL2RHS(directoryL2LHS));
      Send_req(msg, m);
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
      msg := RequestL2(adr,GetML2,m,to_m_directoryL2RHS(directoryL2LHS));
      Send_req(msg, m);
      cbe.acksReceivedL2 := 0;
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
      msg := AckL2(adr,PutEL2,m,to_m_directoryL2RHS(directoryL2LHS));
      Send_req(msg, m);
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
      msg := RequestL2(adr,GetSL2,m,to_m_directoryL2RHS(directoryL2LHS));
      Send_req(msg, m);
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
      msg := RequestL2(adr,GetML2,m,to_m_directoryL2RHS(directoryL2LHS));
      Send_req(msg, m);
      cbe.acksReceivedL2 := 0;
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
      msg := RespL2(adr,PutML2,m,to_m_directoryL2RHS(directoryL2LHS),cbe.cl);
      Send_req(msg, m);
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
      msg := RequestL2(adr,PutSL2,m,to_m_directoryL2RHS(directoryL2LHS));
      Send_req(msg, m);
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
      msg := RequestL2(adr,GetML2,m,to_m_directoryL2RHS(directoryL2LHS));
      Send_req(msg, m);
      cbe.acksReceivedL2 := 0;
      Clear_perm(adr, m);
      cbe.State := cacheL2RHS_S_store;
      return;
    endalias;
    endalias;
    end;
    
  ----Backend/Murphi/MurphiModular/StateMachines/GenMessageStateMachines
    function FSM_MSG_cacheL2LHS(inmsg:Message; mTyped:OBJSET_cacheL2LHS) : boolean;
    var msg: Message;
    begin
      alias adr: inmsg.adr do
      alias cbe: i_cacheL2LHS[mTyped].cb[adr] do
    alias m : to_m_cacheL2LHS(mTyped) do
    switch cbe.State
      case cacheL2LHS_E:
      switch inmsg.mtype
        case Fwd_GetML2:
          msg := RespL2(adr,GetM_Ack_DL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I;
          return true;
        
        case Fwd_GetSL2:
          msg := RespL2(adr,GetS_AckL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL2(adr,WBL2,m,to_m_directoryL2LHS(directoryL2LHS),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := cacheL2LHS_S;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_E_evict:
      switch inmsg.mtype
        case Fwd_GetML2:
          msg := RespL2(adr,GetM_Ack_DL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_E_evict_x_I;
          return true;
        
        case Fwd_GetSL2:
          msg := RespL2(adr,GetS_AckL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL2(adr,WBL2,m,to_m_directoryL2LHS(directoryL2LHS),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_S_evict;
          return true;
        
        case Put_AckL2:
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_E_evict_x_I:
      switch inmsg.mtype
        case Put_AckL2:
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_I:
      switch inmsg.mtype
        else return false;
      endswitch;
      
      case cacheL2LHS_I_load:
      switch inmsg.mtype
        case GetM_Ack_DL2:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL2LHS_E;
          return true;
        
        case GetS_AckL2:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := cacheL2LHS_S;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_I_store:
      switch inmsg.mtype
        case GetM_Ack_ADL2:
          cbe.cl := inmsg.cl;
          cbe.acksExpectedL2 := inmsg.acksExpectedL2;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := cacheL2LHS_I_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
              Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
              cbe.State := cacheL2LHS_M;
              return true;
            cbe.acksExpectedL2 := 0;
              cbe.acksReceivedL2 := 0;
              Set_perm(store, adr, m);
              Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
              cbe.State := cacheL2LHS_M;
              return true;
          endif;
        
        case GetM_Ack_DL2:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL2LHS_M;
          return true;
        
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I_store;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_I_store_GetM_Ack_AD:
      switch inmsg.mtype
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := cacheL2LHS_I_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
              Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
              cbe.State := cacheL2LHS_M;
              return true;
            cbe.acksExpectedL2 := 0;
              cbe.acksReceivedL2 := 0;
              Set_perm(store, adr, m);
              Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
              cbe.State := cacheL2LHS_M;
              return true;
          endif;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_M:
      switch inmsg.mtype
        case Fwd_GetML2:
          msg := RespL2(adr,GetM_Ack_DL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I;
          return true;
        
        case Fwd_GetSL2:
          msg := RespL2(adr,GetS_AckL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL2(adr,WBL2,m,to_m_directoryL2LHS(directoryL2LHS),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := cacheL2LHS_S;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_M_evict:
      switch inmsg.mtype
        case Fwd_GetML2:
          msg := RespL2(adr,GetM_Ack_DL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_M_evict_x_I;
          return true;
        
        case Fwd_GetSL2:
          msg := RespL2(adr,GetS_AckL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL2(adr,WBL2,m,to_m_directoryL2LHS(directoryL2LHS),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_S_evict;
          return true;
        
        case Put_AckL2:
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_M_evict_x_I:
      switch inmsg.mtype
        case Put_AckL2:
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_S:
      switch inmsg.mtype
        case InvL2:
          msg := RespL2(adr,Inv_AckL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_S_evict:
      switch inmsg.mtype
        case InvL2:
          msg := RespL2(adr,Inv_AckL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_S_evict_x_I;
          return true;
        
        case Put_AckL2:
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_S_evict_x_I:
      switch inmsg.mtype
        case Put_AckL2:
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_S_store:
      switch inmsg.mtype
        case GetM_Ack_ADL2:
          cbe.acksExpectedL2 := inmsg.acksExpectedL2;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := cacheL2LHS_S_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
            cbe.State := cacheL2LHS_M;
            return true;
          endif;
        
        case GetM_Ack_DL2:
          Set_perm(store, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL2LHS_M;
          return true;
        
        case InvL2:
          msg := RespL2(adr,Inv_AckL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_I_store;
          return true;
        
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          Clear_perm(adr, m);
          cbe.State := cacheL2LHS_S_store;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2LHS_S_store_GetM_Ack_AD:
      switch inmsg.mtype
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
            cbe.State := cacheL2LHS_M;
            return true;
          endif;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := cacheL2LHS_S_store_GetM_Ack_AD;
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
    
    function FSM_MSG_directoryL1LHS(inmsg:Message; mTyped:OBJSET_directoryL1LHS) : boolean;
    var msg_GetML1: Message;
    var msg: Message;
    var msg_PutML1: Message;
    var msg_Put_AckL1: Message;
    var msg_GetM_Ack_ADL1: Message;
    begin
      alias adr: inmsg.adr do
      alias cbe: i_directoryL1LHS[mTyped].cb[adr] do
    alias m : to_m_directoryL1LHS(mTyped) do
    switch cbe.State
      case directoryL1LHS_E__C__M:
      switch inmsg.mtype
        case Fwd_GetML2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg := RequestL1(adr,Fwd_GetML1,msg_GetML1.src,cbe.ownerL1);
          Send_fwd(msg, m);
          cbe.ownerL1 := msg_GetML1.src;
          cbe.proxy_msgL2 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_Fwd_GetML2dM_x_pI_store__C__M;
          return true;
        
        case Fwd_GetSL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg := RequestL1(adr,Fwd_GetML1,msg_GetML1.src,cbe.ownerL1);
          Send_fwd(msg, m);
          cbe.ownerL1 := msg_GetML1.src;
          cbe.proxy_msgL2 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_Fwd_GetSL2dM_x_pI_store__C__M;
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
      
      case directoryL1LHS_Fwd_GetML2dM_x_pI_store_GetM_Ack_AD__C__M:
      switch inmsg.mtype
        case Inv_AckL1:
          cbe.acksReceivedL1 := cbe.acksReceivedL1+1;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            cbe.acksExpectedL1 := 0;
            cbe.acksReceivedL1 := 0;
            cbe.acksExpectedL1 := 0;
            cbe.acksReceivedL1 := 0;
            Set_perm(store, adr, m);
            msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
            msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
            RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
            if (cbe.ownerL1 = msg_PutML1.src) then
            cbe.cl := msg_PutML1.cl;
            msg := RespL2(adr,GetM_Ack_DL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_resp(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__I;
            return true;
            endif;
          endif;
          if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_Fwd_GetML2dM_x_pI_store_GetM_Ack_AD__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_Fwd_GetML2dM_x_pI_store__C__M:
      switch inmsg.mtype
        case GetM_Ack_DL1:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          msg := RespL2(adr,GetM_Ack_DL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__I;
          return true;
          endif;
        
        case Inv_AckL1:
          cbe.acksReceivedL1 := cbe.acksReceivedL1+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_Fwd_GetML2dM_x_pI_store__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_Fwd_GetSL2dM_x_pI_store_GetM_Ack_AD__C__M:
      switch inmsg.mtype
        case Inv_AckL1:
          cbe.acksReceivedL1 := cbe.acksReceivedL1+1;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            cbe.acksExpectedL1 := 0;
            cbe.acksReceivedL1 := 0;
            cbe.acksExpectedL1 := 0;
            cbe.acksReceivedL1 := 0;
            Set_perm(store, adr, m);
            msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
            msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
            RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
            if (cbe.ownerL1 = msg_PutML1.src) then
            cbe.cl := msg_PutML1.cl;
            msg := RespL2(adr,GetS_AckL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_resp(msg, m);
            msg := RespL2(adr,WBL2,m,to_m_directoryL2LHS(directoryL2LHS),cbe.cl);
            Send_resp(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_I__C__S;
            return true;
            endif;
          endif;
          if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_Fwd_GetSL2dM_x_pI_store_GetM_Ack_AD__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_Fwd_GetSL2dM_x_pI_store__C__M:
      switch inmsg.mtype
        case GetM_Ack_DL1:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          msg := RespL2(adr,GetS_AckL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL2(adr,WBL2,m,to_m_directoryL2LHS(directoryL2LHS),cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__S;
          return true;
          endif;
        
        case Inv_AckL1:
          cbe.acksReceivedL1 := cbe.acksReceivedL1+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_Fwd_GetSL2dM_x_pI_store__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_GetML1I__C__I_store:
      switch inmsg.mtype
        case GetM_Ack_ADL2:
          cbe.cl := inmsg.cl;
          cbe.acksExpectedL2 := inmsg.acksExpectedL2;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            msg := RespAckL1(adr,GetM_Ack_ADL1,m,cbe.proxy_msgL1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            Send_resp(msg, m);
            cbe.ownerL1 := cbe.proxy_msgL1.src;
            undefine cbe.proxy_msgL1;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_M__C__M;
            return true;
          endif;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_GetML1I__C__I_store_GetM_Ack_AD;
            return true;
          endif;
        
        case GetM_Ack_DL2:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg := RespAckL1(adr,GetM_Ack_ADL1,m,cbe.proxy_msgL1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
          Send_resp(msg, m);
          cbe.ownerL1 := cbe.proxy_msgL1.src;
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_M__C__M;
          return true;
        
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetML1I__C__I_store;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_GetML1I__C__I_store_GetM_Ack_AD:
      switch inmsg.mtype
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            msg := RespAckL1(adr,GetM_Ack_ADL1,m,cbe.proxy_msgL1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            Send_resp(msg, m);
            cbe.ownerL1 := cbe.proxy_msgL1.src;
            undefine cbe.proxy_msgL1;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_M__C__M;
            return true;
          endif;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_GetML1I__C__I_store_GetM_Ack_AD;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_GetML1I__C__S_store:
      switch inmsg.mtype
        case GetM_Ack_ADL2:
          cbe.acksExpectedL2 := inmsg.acksExpectedL2;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            msg := RespAckL1(adr,GetM_Ack_ADL1,m,cbe.proxy_msgL1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            Send_resp(msg, m);
            cbe.ownerL1 := cbe.proxy_msgL1.src;
            undefine cbe.proxy_msgL1;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_M__C__M;
            return true;
          endif;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_GetML1I__C__S_store_GetM_Ack_AD;
            return true;
          endif;
        
        case GetM_Ack_DL2:
          Set_perm(store, adr, m);
          msg := RespAckL1(adr,GetM_Ack_ADL1,m,cbe.proxy_msgL1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
          Send_resp(msg, m);
          cbe.ownerL1 := cbe.proxy_msgL1.src;
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_M__C__M;
          return true;
        
        case InvL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
          cbe.ownerL1 := msg_GetML1.src;
          cbe.cl := msg_GetM_Ack_ADL1.cl;
          cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := RespL2(adr,Inv_AckL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetML1I__C__I_store;
          return true;
          endif;
          endif;
        
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetML1I__C__S_store;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_GetML1I__C__S_store_GetM_Ack_AD:
      switch inmsg.mtype
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            msg := RespAckL1(adr,GetM_Ack_ADL1,m,cbe.proxy_msgL1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
            Send_resp(msg, m);
            cbe.ownerL1 := cbe.proxy_msgL1.src;
            undefine cbe.proxy_msgL1;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_M__C__M;
            return true;
          endif;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_GetML1I__C__S_store_GetM_Ack_AD;
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
        case GetM_Ack_ADL2:
          cbe.cl := inmsg.cl;
          cbe.acksExpectedL2 := inmsg.acksExpectedL2;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_GetSL1I__C__I_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            msg := RespL1(adr,GetM_Ack_DL1,m,cbe.proxy_msgL1.src,cbe.cl);
            Send_resp(msg, m);
            cbe.ownerL1 := cbe.proxy_msgL1.src;
            undefine cbe.proxy_msgL1;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_E__C__M;
            return true;
          endif;
        
        case GetM_Ack_DL2:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg := RespL1(adr,GetM_Ack_DL1,m,cbe.proxy_msgL1.src,cbe.cl);
          Send_resp(msg, m);
          cbe.ownerL1 := cbe.proxy_msgL1.src;
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_E__C__M;
          return true;
        
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetSL1I__C__I_store;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_GetSL1I__C__I_store_GetM_Ack_AD:
      switch inmsg.mtype
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_GetSL1I__C__I_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            msg := RespL1(adr,GetM_Ack_DL1,m,cbe.proxy_msgL1.src,cbe.cl);
            Send_resp(msg, m);
            cbe.ownerL1 := cbe.proxy_msgL1.src;
            undefine cbe.proxy_msgL1;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_E__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_GetSL1I__C__S_store:
      switch inmsg.mtype
        case GetM_Ack_ADL2:
          cbe.acksExpectedL2 := inmsg.acksExpectedL2;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_GetSL1I__C__S_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            msg := RespL1(adr,GetM_Ack_DL1,m,cbe.proxy_msgL1.src,cbe.cl);
            Send_resp(msg, m);
            cbe.ownerL1 := cbe.proxy_msgL1.src;
            undefine cbe.proxy_msgL1;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_E__C__M;
            return true;
          endif;
        
        case GetM_Ack_DL2:
          Set_perm(store, adr, m);
          msg := RespL1(adr,GetM_Ack_DL1,m,cbe.proxy_msgL1.src,cbe.cl);
          Send_resp(msg, m);
          cbe.ownerL1 := cbe.proxy_msgL1.src;
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_E__C__M;
          return true;
        
        case InvL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
          cbe.ownerL1 := msg_GetML1.src;
          cbe.cl := msg_GetM_Ack_ADL1.cl;
          cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := RespL2(adr,Inv_AckL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetSL1I__C__I_store;
          return true;
          endif;
          endif;
        
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetSL1I__C__S_store;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_GetSL1I__C__S_store_GetM_Ack_AD:
      switch inmsg.mtype
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_GetSL1I__C__S_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            msg := RespL1(adr,GetM_Ack_DL1,m,cbe.proxy_msgL1.src,cbe.cl);
            Send_resp(msg, m);
            cbe.ownerL1 := cbe.proxy_msgL1.src;
            undefine cbe.proxy_msgL1;
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_E__C__M;
            return true;
          endif;
        
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
      
      case directoryL1LHS_I__C__I:
      switch inmsg.mtype
        case GetML1:
          msg := RequestL2(adr,GetML2,m,to_m_directoryL2LHS(directoryL2LHS));
          Send_req(msg, m);
          cbe.acksReceivedL2 := 0;
          cbe.proxy_msgL1 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetML1I__C__I_store;
          return true;
        
        case GetSL1:
          msg := RequestL2(adr,GetML2,m,to_m_directoryL2LHS(directoryL2LHS));
          Send_req(msg, m);
          cbe.acksReceivedL2 := 0;
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
        case Fwd_GetML2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
          cbe.ownerL1 := msg_GetML1.src;
          cbe.cl := msg_GetM_Ack_ADL1.cl;
          cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := RespL2(adr,GetM_Ack_DL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__I;
          return true;
          endif;
          endif;
        
        case Fwd_GetSL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
          cbe.ownerL1 := msg_GetML1.src;
          cbe.cl := msg_GetM_Ack_ADL1.cl;
          cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := RespL2(adr,GetS_AckL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL2(adr,WBL2,m,to_m_directoryL2LHS(directoryL2LHS),cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__S;
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
        case GetML1:
          msg := RequestL2(adr,GetML2,m,to_m_directoryL2LHS(directoryL2LHS));
          Send_req(msg, m);
          cbe.acksReceivedL2 := 0;
          cbe.proxy_msgL1 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetML1I__C__S_store;
          return true;
        
        case GetSL1:
          msg := RequestL2(adr,GetML2,m,to_m_directoryL2LHS(directoryL2LHS));
          Send_req(msg, m);
          cbe.acksReceivedL2 := 0;
          cbe.proxy_msgL1 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_GetSL1I__C__S_store;
          return true;
        
        case InvL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg_GetM_Ack_ADL1 := RespAckL1(adr,GetM_Ack_ADL1,m,msg_GetML1.src,cbe.cl,VectorCount_cacheL1(cbe.cacheL1));
          cbe.ownerL1 := msg_GetML1.src;
          cbe.cl := msg_GetM_Ack_ADL1.cl;
          cbe.acksExpectedL1 := msg_GetM_Ack_ADL1.acksExpectedL1;
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          cbe.acksExpectedL1 := 0;
          cbe.acksReceivedL1 := 0;
          Set_perm(store, adr, m);
          msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
          msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
          RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
          if (cbe.ownerL1 = msg_PutML1.src) then
          cbe.cl := msg_PutML1.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := RespL2(adr,Inv_AckL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__I;
          return true;
          endif;
          endif;
        
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
        case Fwd_GetML2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg := RequestL1(adr,Fwd_GetML1,msg_GetML1.src,cbe.ownerL1);
          Send_fwd(msg, m);
          cbe.ownerL1 := msg_GetML1.src;
          cbe.proxy_msgL2 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_Fwd_GetML2dM_x_pI_store__C__M;
          return true;
        
        case Fwd_GetSL2:
          msg_GetML1 := RequestL1(adr,GetML1,m,m);
          cbe.acksReceivedL1 := 0;
          msg := RequestL1(adr,Fwd_GetML1,msg_GetML1.src,cbe.ownerL1);
          Send_fwd(msg, m);
          cbe.ownerL1 := msg_GetML1.src;
          cbe.proxy_msgL2 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_Fwd_GetSL2dM_x_pI_store__C__M;
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
      
      case directoryL1LHS_S__C__M:
      switch inmsg.mtype
        case Fwd_GetML2:
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
              cbe.acksExpectedL1 := 0;
              cbe.acksReceivedL1 := 0;
              Set_perm(store, adr, m);
              msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
              msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
              RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
              if (cbe.ownerL1 = msg_PutML1.src) then
              cbe.cl := msg_PutML1.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := RespL2(adr,GetM_Ack_DL2,m,cbe.proxy_msgL2.src,cbe.cl);
              Send_resp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_I__C__I;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_Fwd_GetML2dM_x_pI_store_GetM_Ack_AD__C__M;
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
              cbe.acksExpectedL1 := 0;
              cbe.acksReceivedL1 := 0;
              Set_perm(store, adr, m);
              msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
              msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
              RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
              if (cbe.ownerL1 = msg_PutML1.src) then
              cbe.cl := msg_PutML1.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := RespL2(adr,GetM_Ack_DL2,m,cbe.proxy_msgL2.src,cbe.cl);
              Send_resp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_I__C__I;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_Fwd_GetML2dM_x_pI_store_GetM_Ack_AD__C__M;
              return true;
            endif;
          endif;
        
        case Fwd_GetSL2:
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
              cbe.State := directoryL1LHS_Fwd_GetSL2dM_x_pI_store_GetM_Ack_AD__C__M;
              return true;
            endif;
            if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.acksExpectedL1 := 0;
              cbe.acksReceivedL1 := 0;
              cbe.acksExpectedL1 := 0;
              cbe.acksReceivedL1 := 0;
              Set_perm(store, adr, m);
              msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
              msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
              RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
              if (cbe.ownerL1 = msg_PutML1.src) then
              cbe.cl := msg_PutML1.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := RespL2(adr,GetS_AckL2,m,cbe.proxy_msgL2.src,cbe.cl);
              Send_resp(msg, m);
              msg := RespL2(adr,WBL2,m,to_m_directoryL2LHS(directoryL2LHS),cbe.cl);
              Send_resp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_I__C__S;
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
            if !(cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_Fwd_GetSL2dM_x_pI_store_GetM_Ack_AD__C__M;
              return true;
            endif;
            if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
              cbe.acksExpectedL1 := 0;
              cbe.acksReceivedL1 := 0;
              cbe.acksExpectedL1 := 0;
              cbe.acksReceivedL1 := 0;
              Set_perm(store, adr, m);
              msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
              msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
              RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
              if (cbe.ownerL1 = msg_PutML1.src) then
              cbe.cl := msg_PutML1.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := RespL2(adr,GetS_AckL2,m,cbe.proxy_msgL2.src,cbe.cl);
              Send_resp(msg, m);
              msg := RespL2(adr,WBL2,m,to_m_directoryL2LHS(directoryL2LHS),cbe.cl);
              Send_resp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1LHS_I__C__S;
              return true;
              endif;
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
      
      case directoryL1LHS_evictI__C__M_evict:
      switch inmsg.mtype
        case Fwd_GetML2:
          msg := RespL2(adr,GetM_Ack_DL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictI__C__M_evict_x_I;
          return true;
        
        case Fwd_GetSL2:
          msg := RespL2(adr,GetS_AckL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL2(adr,WBL2,m,to_m_directoryL2LHS(directoryL2LHS),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictI__C__S_evict;
          return true;
        
        case Put_AckL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_evictI__C__M_evict_x_I:
      switch inmsg.mtype
        case Put_AckL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_evictI__C__S_evict:
      switch inmsg.mtype
        case InvL2:
          msg := RespL2(adr,Inv_AckL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_evictI__C__S_evict_x_I;
          return true;
        
        case Put_AckL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1LHS_evictI__C__S_evict_x_I:
      switch inmsg.mtype
        case Put_AckL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1LHS_I__C__I;
          return true;
        
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
            cbe.acksExpectedL1 := 0;
            cbe.acksReceivedL1 := 0;
            Set_perm(store, adr, m);
            msg_PutML1 := RespL1(adr,PutML1,m,m,cbe.cl);
            msg_Put_AckL1 := AckL1(adr,Put_AckL1,m,msg_PutML1.src);
            RemoveElement_cacheL1(cbe.cacheL1, msg_PutML1.src);
            if (cbe.ownerL1 = msg_PutML1.src) then
            cbe.cl := msg_PutML1.cl;
            msg := RespL2(adr,PutML2,m,to_m_directoryL2LHS(directoryL2LHS),cbe.cl);
            Send_req(msg, m);
            Clear_perm(adr, m);
            cbe.State := directoryL1LHS_evictI__C__M_evict;
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
          msg := RespL2(adr,PutML2,m,to_m_directoryL2LHS(directoryL2LHS),cbe.cl);
          Send_req(msg, m);
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
    
    function FSM_MSG_abstractionRHS(inmsg:Message; mTyped:OBJSET_abstractionRHS) : boolean;
    var msg: Message;
    begin
      alias adr: inmsg.adr do
      alias cbe: i_abstractionRHS[mTyped].cb[adr] do
    alias m : to_m_abstractionRHS(mTyped) do
    switch cbe.State
      case abstractionRHS_E:
      switch inmsg.mtype
        case Fwd_GetML2:
          msg := RespL2(adr,GetM_Ack_DL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I;
          return true;
        
        case Fwd_GetSL2:
          msg := RespL2(adr,GetS_AckL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL2(adr,WBL2,m,to_m_directoryL2RHS(directoryL2LHS),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := abstractionRHS_S;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_E_evict:
      switch inmsg.mtype
        case Fwd_GetML2:
          msg := RespL2(adr,GetM_Ack_DL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_E_evict_x_I;
          return true;
        
        case Fwd_GetSL2:
          msg := RespL2(adr,GetS_AckL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL2(adr,WBL2,m,to_m_directoryL2RHS(directoryL2LHS),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_S_evict;
          return true;
        
        case Put_AckL2:
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_E_evict_x_I:
      switch inmsg.mtype
        case Put_AckL2:
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_I:
      switch inmsg.mtype
        else return false;
      endswitch;
      
      case abstractionRHS_I_load:
      switch inmsg.mtype
        case GetM_Ack_DL2:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := abstractionRHS_E;
          return true;
        
        case GetS_AckL2:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := abstractionRHS_S;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_I_store:
      switch inmsg.mtype
        case GetM_Ack_ADL2:
          cbe.cl := inmsg.cl;
          cbe.acksExpectedL2 := inmsg.acksExpectedL2;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := abstractionRHS_I_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
              Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
              cbe.State := abstractionRHS_M;
              return true;
            cbe.acksExpectedL2 := 0;
              cbe.acksReceivedL2 := 0;
              Set_perm(store, adr, m);
              Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
              cbe.State := abstractionRHS_M;
              return true;
          endif;
        
        case GetM_Ack_DL2:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := abstractionRHS_M;
          return true;
        
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I_store;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_I_store_GetM_Ack_AD:
      switch inmsg.mtype
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := abstractionRHS_I_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
              Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
              cbe.State := abstractionRHS_M;
              return true;
            cbe.acksExpectedL2 := 0;
              cbe.acksReceivedL2 := 0;
              Set_perm(store, adr, m);
              Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
              cbe.State := abstractionRHS_M;
              return true;
          endif;
        
        else return false;
      endswitch;
      
      case abstractionRHS_M:
      switch inmsg.mtype
        case Fwd_GetML2:
          msg := RespL2(adr,GetM_Ack_DL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I;
          return true;
        
        case Fwd_GetSL2:
          msg := RespL2(adr,GetS_AckL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL2(adr,WBL2,m,to_m_directoryL2RHS(directoryL2LHS),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := abstractionRHS_S;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_M_evict:
      switch inmsg.mtype
        case Fwd_GetML2:
          msg := RespL2(adr,GetM_Ack_DL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_M_evict_x_I;
          return true;
        
        case Fwd_GetSL2:
          msg := RespL2(adr,GetS_AckL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL2(adr,WBL2,m,to_m_directoryL2RHS(directoryL2LHS),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_S_evict;
          return true;
        
        case Put_AckL2:
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_M_evict_x_I:
      switch inmsg.mtype
        case Put_AckL2:
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_S:
      switch inmsg.mtype
        case InvL2:
          msg := RespL2(adr,Inv_AckL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_S_evict:
      switch inmsg.mtype
        case InvL2:
          msg := RespL2(adr,Inv_AckL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_S_evict_x_I;
          return true;
        
        case Put_AckL2:
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_S_evict_x_I:
      switch inmsg.mtype
        case Put_AckL2:
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_S_store:
      switch inmsg.mtype
        case GetM_Ack_ADL2:
          cbe.acksExpectedL2 := inmsg.acksExpectedL2;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := abstractionRHS_S_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
            cbe.State := abstractionRHS_M;
            return true;
          endif;
        
        case GetM_Ack_DL2:
          Set_perm(store, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := abstractionRHS_M;
          return true;
        
        case InvL2:
          msg := RespL2(adr,Inv_AckL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_I_store;
          return true;
        
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          Clear_perm(adr, m);
          cbe.State := abstractionRHS_S_store;
          return true;
        
        else return false;
      endswitch;
      
      case abstractionRHS_S_store_GetM_Ack_AD:
      switch inmsg.mtype
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
            cbe.State := abstractionRHS_M;
            return true;
          endif;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := abstractionRHS_S_store_GetM_Ack_AD;
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
    
    function FSM_MSG_directoryL2LHS(inmsg:Message; mTyped:OBJSET_directoryL2LHS) : boolean;
    var msg: Message;
    begin
      alias adr: inmsg.adr do
      alias cbe: i_directoryL2LHS[mTyped].cb[adr] do
    alias m : to_m_directoryL2LHS(mTyped) do
    switch cbe.State
      case directoryL2LHS_E:
      switch inmsg.mtype
        case GetML2:
          msg := RequestL2(adr,Fwd_GetML2,inmsg.src,cbe.ownerL2);
          Send_fwd(msg, m);
          cbe.ownerL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_M;
          return true;
        
        case GetSL2:
          msg := RequestL2(adr,Fwd_GetSL2,inmsg.src,cbe.ownerL2);
          Send_fwd(msg, m);
          AddElement_cacheL2(cbe.cacheL2, inmsg.src);
          AddElement_cacheL2(cbe.cacheL2, cbe.ownerL2);
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_E_GetS;
          return true;
        
        case PutEL2:
          msg := AckL2(adr,Put_AckL2,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_E;
            return true;
          endif;
          if (cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_I;
            return true;
          endif;
        
        case PutML2:
          msg := AckL2(adr,Put_AckL2,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_E;
            return true;
          endif;
          if (cbe.ownerL2 = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_I;
            return true;
          endif;
        
        case PutSL2:
          msg := AckL2(adr,Put_AckL2,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if (cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_I;
            return true;
          endif;
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_E;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2LHS_E_GetS:
      switch inmsg.mtype
        case WBL2:
          if (inmsg.src = cbe.ownerL2) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_S;
            return true;
          endif;
          if !(inmsg.src = cbe.ownerL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_E_GetS;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2LHS_I:
      switch inmsg.mtype
        case GetML2:
          msg := RespAckL2(adr,GetM_Ack_ADL2,m,inmsg.src,cbe.cl,VectorCount_cacheL2(cbe.cacheL2));
          Send_resp(msg, m);
          cbe.ownerL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_M;
          return true;
        
        case GetSL2:
          msg := RespL2(adr,GetM_Ack_DL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          cbe.ownerL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_E;
          return true;
        
        case PutEL2:
          msg := AckL2(adr,Put_AckL2,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if (cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_I;
            return true;
          endif;
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_I;
            return true;
          endif;
        
        case PutML2:
          msg := AckL2(adr,Put_AckL2,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if (cbe.ownerL2 = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_I;
            return true;
          endif;
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_I;
            return true;
          endif;
        
        case PutSL2:
          msg := AckL2(adr,Put_AckL2,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if !(VectorCount_cacheL2(cbe.cacheL2) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_I;
            return true;
          endif;
          if (VectorCount_cacheL2(cbe.cacheL2) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_I;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2LHS_M:
      switch inmsg.mtype
        case GetML2:
          msg := RequestL2(adr,Fwd_GetML2,inmsg.src,cbe.ownerL2);
          Send_fwd(msg, m);
          cbe.ownerL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_M;
          return true;
        
        case GetSL2:
          msg := RequestL2(adr,Fwd_GetSL2,inmsg.src,cbe.ownerL2);
          Send_fwd(msg, m);
          AddElement_cacheL2(cbe.cacheL2, inmsg.src);
          AddElement_cacheL2(cbe.cacheL2, cbe.ownerL2);
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_M_GetS;
          return true;
        
        case PutEL2:
          msg := AckL2(adr,Put_AckL2,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_M;
            return true;
          endif;
          if (cbe.ownerL2 = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_I;
            return true;
          endif;
        
        case PutML2:
          msg := AckL2(adr,Put_AckL2,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_M;
            return true;
          endif;
          if (cbe.ownerL2 = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_I;
            return true;
          endif;
        
        case PutSL2:
          msg := AckL2(adr,Put_AckL2,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_M;
            return true;
          endif;
          if (cbe.ownerL2 = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_I;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2LHS_M_GetS:
      switch inmsg.mtype
        case WBL2:
          if (inmsg.src = cbe.ownerL2) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_S;
            return true;
          endif;
          if !(inmsg.src = cbe.ownerL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_M_GetS;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2LHS_S:
      switch inmsg.mtype
        case GetML2:
          if !(IsElement_cacheL2(cbe.cacheL2, inmsg.src)) then
            msg := RespAckL2(adr,GetM_Ack_ADL2,m,inmsg.src,cbe.cl,VectorCount_cacheL2(cbe.cacheL2));
            Send_resp(msg, m);
            msg := AckL2(adr,InvL2,inmsg.src,inmsg.src);
            Multicast_fwd_v_cacheL2(msg, cbe.cacheL2, m);
            cbe.ownerL2 := inmsg.src;
            ClearVector_cacheL2(cbe.cacheL2);
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_M;
            return true;
          endif;
          if (IsElement_cacheL2(cbe.cacheL2, inmsg.src)) then
            RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
            msg := RespAckL2(adr,GetM_Ack_ADL2,m,inmsg.src,cbe.cl,VectorCount_cacheL2(cbe.cacheL2));
            Send_resp(msg, m);
            msg := AckL2(adr,InvL2,inmsg.src,inmsg.src);
            Multicast_fwd_v_cacheL2(msg, cbe.cacheL2, m);
            cbe.ownerL2 := inmsg.src;
            ClearVector_cacheL2(cbe.cacheL2);
            Clear_perm(adr, m);
            cbe.State := directoryL2LHS_M;
            return true;
          endif;
        
        case GetSL2:
          msg := RespL2(adr,GetS_AckL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          AddElement_cacheL2(cbe.cacheL2, inmsg.src);
          Clear_perm(adr, m);
          cbe.State := directoryL2LHS_S;
          return true;
        
        case PutEL2:
          msg := AckL2(adr,Put_AckL2,m,inmsg.src);
          Send_fwd(msg, m);
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
        
        case PutML2:
          msg := AckL2(adr,Put_AckL2,m,inmsg.src);
          Send_fwd(msg, m);
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
        
        case PutSL2:
          msg := AckL2(adr,Put_AckL2,m,inmsg.src);
          Send_fwd(msg, m);
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
          if (cbe.acksExpectedL1 = cbe.acksReceivedL1) then
            cbe.acksExpectedL1 := 0;
            cbe.acksReceivedL1 := 0;
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
    
      rule "cacheL2LHS_I_load"
        cbe.State = cacheL2LHS_I & continue_run(systemLHSExt, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_cacheL2LHS_I_load(adr, m);
        
      endrule;
    
      rule "cacheL2LHS_I_store"
        cbe.State = cacheL2LHS_I & continue_run(systemLHSExt, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_cacheL2LHS_I_store(adr, m);
        
      endrule;
    
      rule "cacheL2LHS_M_evict"
        cbe.State = cacheL2LHS_M & continue_run(systemLHSExt, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_cacheL2LHS_M_evict(adr, m);
        
      endrule;
    
      rule "cacheL2LHS_M_load"
        cbe.State = cacheL2LHS_M & continue_run(systemLHSExt, g_system_state) 
      ==>
        FSM_Access_cacheL2LHS_M_load(adr, m);
        
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
    
    ruleset m:OBJSET_directoryL1LHS do
    ruleset adr:Address do
      alias cbe:i_directoryL1LHS[m].cb[adr] do
    
      rule "directoryL1LHS_E__C__M_evict"
        cbe.State = directoryL1LHS_E__C__M & continue_run(systemLHS, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_directoryL1LHS_E__C__M_evict(adr, m);
        
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
    
      rule "directoryL1LHS_S__C__M_evict"
        cbe.State = directoryL1LHS_S__C__M & continue_run(systemLHS, g_system_state) & network_LHS_ready()
      ==>
        FSM_Access_directoryL1LHS_S__C__M_evict(adr, m);
        
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
    
    -- Impossible due to effective MI downgrade 
    --  rule "abstractionRHS_I_load"
    --    cbe.State = abstractionRHS_I & continue_run(systemRHS, g_system_state) & network_RHS_ready()
    --  ==>
    --    FSM_Access_abstractionRHS_I_load(adr, m);
    --    
    --  endrule;
    --
      rule "abstractionRHS_I_store"
        cbe.State = abstractionRHS_I & continue_run(systemRHS, g_system_state) & network_RHS_ready()
      ==>
        FSM_Access_abstractionRHS_I_store(adr, m);
        
      endrule;
    
      rule "abstractionRHS_M_evict"
        cbe.State = abstractionRHS_M & continue_run(systemRHS, g_system_state) & network_RHS_ready()
      ==>
        FSM_Access_abstractionRHS_M_evict(adr, m);
        
      endrule;
    
    -- Impossible due to effective MI downgrade 
    --  rule "abstractionRHS_M_load"
    --    cbe.State = abstractionRHS_M & continue_run(systemRHS, g_system_state) 
    --  ==>
    --    FSM_Access_abstractionRHS_M_load(adr, m);
    --    
    --  endrule;
    --
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
    
    -- cacheL2LHS
    ruleset n:OBJSET_cacheL2LHS do
      alias msg:resp_cacheL2LHS[n][0] do
        rule "Receive cacheL2LHS resp"
          cnt_resp_cacheL2LHS[n] > 0
          & continue_run(systemLHSExt, g_system_state) 
        ==>
          if FSM_MSG_cacheL2LHS(msg, n) then
            Pop_resp(to_m_cacheL2LHS(n), to_m_cacheL2LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_cacheL2LHS do
      alias msg:fwd_cacheL2LHS[n][0] do
        rule "Receive cacheL2LHS fwd"
          cnt_fwd_cacheL2LHS[n] > 0
          & continue_run(systemLHSExt, g_system_state) 
        ==>
          if FSM_MSG_cacheL2LHS(msg, n) then
            Pop_fwd(to_m_cacheL2LHS(n), to_m_cacheL2LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    
    -- directoryL2RHS
    -- directoryL2LHS
    ruleset n:OBJSET_directoryL2LHS do
      alias msg:resp_directoryL2LHS[n][0] do
        rule "Receive directoryL2LHS resp"
          cnt_resp_directoryL2LHS[n] > 0
          & continue_run(systemLHSExt, g_system_state) 
        ==>
          if FSM_MSG_directoryL2LHS(msg, n) then
            Pop_resp(to_m_directoryL2LHS(n), to_m_directoryL2LHS(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL2LHS do
      alias msg:req_directoryL2LHS[n][0] do
        rule "Receive directoryL2LHS req"
          cnt_req_directoryL2LHS[n] > 0
          & continue_run(systemLHSExt, g_system_state) 
        ==>
          if FSM_MSG_directoryL2LHS(msg, n) then
            Pop_req(to_m_directoryL2LHS(n), to_m_directoryL2LHS(n));
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
