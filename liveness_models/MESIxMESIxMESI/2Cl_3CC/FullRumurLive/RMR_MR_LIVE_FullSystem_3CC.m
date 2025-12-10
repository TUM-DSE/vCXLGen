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
    NrCachesL1B: 4;
    NrCachesL2: 3;
    NrCachesL1A: 4;
  
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
        GetSL1B, 
        GetML1B, 
        PutSL1B, 
        Inv_AckL1B, 
        GetM_Ack_DL1B, 
        GetS_AckL1B, 
        WBL1B, 
        PutML1B, 
        PutEL1B, 
        GetM_Ack_ADL1B, 
        InvL1B, 
        Put_AckL1B, 
        Fwd_GetSL1B, 
        Fwd_GetML1B, 
        GetSL1Bstore, 
        GetSL1Bload, 
        GetML1Bstore, 
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
        GetML2store, 
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
        GetML1Astore
      };
      
      ------Backend/Murphi/MurphiModular/Types/Enums/SubEnums/GenArchEnums
      s_directoryL2: enum {
        directoryL2_S,
        directoryL2_M_GetS,
        directoryL2_M,
        directoryL2_I,
        directoryL2_E_GetS,
        directoryL2_E
      };
      
      s_cacheL1B: enum {
        cacheL1B_S_store_GetM_Ack_AD,
        cacheL1B_S_store,
        cacheL1B_S_evict_x_I,
        cacheL1B_S_evict,
        cacheL1B_S,
        cacheL1B_M_evict_x_I,
        cacheL1B_M_evict,
        cacheL1B_M,
        cacheL1B_I_store_GetM_Ack_AD,
        cacheL1B_I_store,
        cacheL1B_I_load,
        cacheL1B_I,
        cacheL1B_E_evict_x_I,
        cacheL1B_E_evict,
        cacheL1B_E
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
      
      s_directoryL1B: enum {
        directoryL1B_evictdM_x_pI_store__C__M,
        directoryL1B_evictdM_x_pI_store_GetM_Ack_AD__C__M,
        directoryL1B_evictI__C__S_evict_x_I,
        directoryL1B_evictI__C__S_evict,
        directoryL1B_evictI__C__M_evict_x_I,
        directoryL1B_evictI__C__M_evict,
        directoryL1B_S__C__M,
        directoryL1B_M__C__M,
        directoryL1B_I__C__S,
        directoryL1B_I__C__M,
        directoryL1B_I__C__I,
        directoryL1B_GetSL1BM_GetS__C__M,
        directoryL1B_GetSL1BI__C__S_store_GetM_Ack_AD,
        directoryL1B_GetSL1BI__C__S_store,
        directoryL1B_GetSL1BI__C__I_store_GetM_Ack_AD,
        directoryL1B_GetSL1BI__C__I_store,
        directoryL1B_GetSL1BE_GetS__C__M,
        directoryL1B_GetML1BI__C__S_store_GetM_Ack_AD,
        directoryL1B_GetML1BI__C__S_store,
        directoryL1B_GetML1BI__C__I_store_GetM_Ack_AD,
        directoryL1B_GetML1BI__C__I_store,
        directoryL1B_Fwd_GetSL2dM_x_pI_store__C__M,
        directoryL1B_Fwd_GetSL2dM_x_pI_store_GetM_Ack_AD__C__M,
        directoryL1B_Fwd_GetML2dM_x_pI_store__C__M,
        directoryL1B_Fwd_GetML2dM_x_pI_store_GetM_Ack_AD__C__M,
        directoryL1B_E__C__M
      };
      
      s_directoryL1A: enum {
        directoryL1A_evictdM_x_pI_store__C__M,
        directoryL1A_evictdM_x_pI_store_GetM_Ack_AD__C__M,
        directoryL1A_evictI__C__S_evict_x_I,
        directoryL1A_evictI__C__S_evict,
        directoryL1A_evictI__C__M_evict_x_I,
        directoryL1A_evictI__C__M_evict,
        directoryL1A_S__C__M,
        directoryL1A_M__C__M,
        directoryL1A_I__C__S,
        directoryL1A_I__C__M,
        directoryL1A_I__C__I,
        directoryL1A_GetSL1AM_GetS__C__M,
        directoryL1A_GetSL1AI__C__S_store_GetM_Ack_AD,
        directoryL1A_GetSL1AI__C__S_store,
        directoryL1A_GetSL1AI__C__I_store_GetM_Ack_AD,
        directoryL1A_GetSL1AI__C__I_store,
        directoryL1A_GetSL1AE_GetS__C__M,
        directoryL1A_GetML1AI__C__S_store_GetM_Ack_AD,
        directoryL1A_GetML1AI__C__S_store,
        directoryL1A_GetML1AI__C__I_store_GetM_Ack_AD,
        directoryL1A_GetML1AI__C__I_store,
        directoryL1A_Fwd_GetSL2dM_x_pI_store__C__M,
        directoryL1A_Fwd_GetSL2dM_x_pI_store_GetM_Ack_AD__C__M,
        directoryL1A_Fwd_GetML2dM_x_pI_store__C__M,
        directoryL1A_Fwd_GetML2dM_x_pI_store_GetM_Ack_AD__C__M,
        directoryL1A_E__C__M
      };
      
    ----Backend/Murphi/MurphiModular/Types/GenMachineSets
      -- Cluster: C1A
      OBJSET_directoryL1A: enum{directoryL1A};
      OBJSET_cacheL1A: scalarset(3);
      C1AMachines: record
        directoryL1A: OBJSET_directoryL1A;
        cacheL1A: OBJSET_cacheL1A;
      end;
      -- Cluster: C2
      OBJSET_directoryL2: enum{directoryL2};
      OBJSET_directoryL1B: enum{directoryL1B};
      C2Machines: record
        directoryL1A: OBJSET_directoryL1A;
        directoryL2: OBJSET_directoryL2;
        directoryL1B: OBJSET_directoryL1B;
      end;
      -- Cluster: C1B
      OBJSET_cacheL1B: scalarset(3);
      C1BMachines: record
        directoryL1B: OBJSET_directoryL1B;
        cacheL1B: OBJSET_cacheL1B;
      end;
      
      Machines: record
        directoryL1A: OBJSET_directoryL1A;
        cacheL1A: OBJSET_cacheL1A;
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
        acksExpectedL2: 0..NrCachesL2;
        acksExpectedL1B: 0..NrCachesL1B;
      end;
      
    ----Backend/Murphi/MurphiModular/Types/GenNetwork
      NET_fwd_directoryL1A: array[OBJSET_directoryL1A] of array[0..(C2_NET_MAX)-1] of Message;
      NET_req_directoryL1A: array[OBJSET_directoryL1A] of array[0..(C1A_NET_MAX)-1] of Message;
      NET_resp_directoryL1A: array[OBJSET_directoryL1A] of array[0..(C1A_NET_MAX+C2_NET_MAX)-1] of Message;
      NET_directoryL1A_cnt: array[OBJSET_directoryL1A] of 0..O_NET_MAX;
      NET_fwd_cacheL1A: array[OBJSET_cacheL1A] of array[0..(C1A_NET_MAX)-1] of Message;
      NET_resp_cacheL1A: array[OBJSET_cacheL1A] of array[0..(C1A_NET_MAX)-1] of Message;
      NET_cacheL1A_cnt: array[OBJSET_cacheL1A] of 0..O_NET_MAX;
      NET_req_directoryL2: array[OBJSET_directoryL2] of array[0..(C2_NET_MAX)-1] of Message;
      NET_resp_directoryL2: array[OBJSET_directoryL2] of array[0..(C2_NET_MAX)-1] of Message;
      NET_directoryL2_cnt: array[OBJSET_directoryL2] of 0..O_NET_MAX;
      NET_fwd_directoryL1B: array[OBJSET_directoryL1B] of array[0..(C2_NET_MAX)-1] of Message;
      NET_req_directoryL1B: array[OBJSET_directoryL1B] of array[0..(C1B_NET_MAX)-1] of Message;
      NET_resp_directoryL1B: array[OBJSET_directoryL1B] of array[0..(C2_NET_MAX+C1B_NET_MAX)-1] of Message;
      NET_directoryL1B_cnt: array[OBJSET_directoryL1B] of 0..O_NET_MAX;
      NET_fwd_cacheL1B: array[OBJSET_cacheL1B] of array[0..(C1B_NET_MAX)-1] of Message;
      NET_resp_cacheL1B: array[OBJSET_cacheL1B] of array[0..(C1B_NET_MAX)-1] of Message;
      NET_cacheL1B_cnt: array[OBJSET_cacheL1B] of 0..O_NET_MAX;
    
    ----Backend/Murphi/MurphiModular/Types/GenMachines
      v_cacheL2: record
        directoryL1A: array[OBJSET_directoryL1A] of boolean;
        cacheL1A: array[OBJSET_cacheL1A] of boolean;
        directoryL1B: array[OBJSET_directoryL1B] of boolean;
        cacheL1B: array[OBJSET_cacheL1B] of boolean;
      end;
      cnt_v_cacheL2: 0..NrCachesL2;
      
      ENTRY_directoryL2: record
        State: s_directoryL2;
        cl: ClValue;
        cacheL2: v_cacheL2;
        ownerL2: Machines;
      end;
      
      MACH_directoryL2: record
        cb: array[Address] of ENTRY_directoryL2;
      end;
      
      OBJ_directoryL2: array[OBJSET_directoryL2] of MACH_directoryL2;
      v_cacheL1B: record
        directoryL1A: array[OBJSET_directoryL1A] of boolean;
        cacheL1A: array[OBJSET_cacheL1A] of boolean;
        directoryL2: array[OBJSET_directoryL2] of boolean;
        cacheL1B: array[OBJSET_cacheL1B] of boolean;
      end;
      cnt_v_cacheL1B: 0..NrCachesL1B;
      
      ENTRY_directoryL1B: record
        State: s_directoryL1B;
        cl: ClValue;
        cacheL1B: v_cacheL1B;
        ownerL1B: Machines;
        acksReceivedL1B: 0..NrCachesL1B;
        acksExpectedL1B: 0..NrCachesL1B;
        proxy_msgL1B: Message;
        proxy_msgL2: Message;
        acksReceivedL2: 0..NrCachesL2;
        acksExpectedL2: 0..NrCachesL2;
      end;
      
      MACH_directoryL1B: record
        cb: array[Address] of ENTRY_directoryL1B;
      end;
      
      OBJ_directoryL1B: array[OBJSET_directoryL1B] of MACH_directoryL1B;
      
      ENTRY_cacheL1B: record
        State: s_cacheL1B;
        cl: ClValue;
        acksReceivedL1B: 0..NrCachesL1B;
        acksExpectedL1B: 0..NrCachesL1B;
      end;
      
      MACH_cacheL1B: record
        cb: array[Address] of ENTRY_cacheL1B;
      end;
      
      OBJ_cacheL1B: array[OBJSET_cacheL1B] of MACH_cacheL1B;
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
        acksReceivedL2: 0..NrCachesL2;
        acksExpectedL2: 0..NrCachesL2;
      end;
      
      MACH_directoryL1A: record
        cb: array[Address] of ENTRY_directoryL1A;
      end;
      
      OBJ_directoryL1A: array[OBJSET_directoryL1A] of MACH_directoryL1A;
      
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
      resp_directoryL1A: NET_resp_directoryL1A;
      cnt_resp_directoryL1A: NET_directoryL1A_cnt;
      req_directoryL1A: NET_req_directoryL1A;
      cnt_req_directoryL1A: NET_directoryL1A_cnt;
      fwd_directoryL1A: NET_fwd_directoryL1A;
      cnt_fwd_directoryL1A: NET_directoryL1A_cnt;
    
      resp_cacheL1A: NET_resp_cacheL1A;
      cnt_resp_cacheL1A: NET_cacheL1A_cnt;
      fwd_cacheL1A: NET_fwd_cacheL1A;
      cnt_fwd_cacheL1A: NET_cacheL1A_cnt;
    
      resp_directoryL2: NET_resp_directoryL2;
      cnt_resp_directoryL2: NET_directoryL2_cnt;
      req_directoryL2: NET_req_directoryL2;
      cnt_req_directoryL2: NET_directoryL2_cnt;
    
      resp_directoryL1B: NET_resp_directoryL1B;
      cnt_resp_directoryL1B: NET_directoryL1B_cnt;
      req_directoryL1B: NET_req_directoryL1B;
      cnt_req_directoryL1B: NET_directoryL1B_cnt;
      fwd_directoryL1B: NET_fwd_directoryL1B;
      cnt_fwd_directoryL1B: NET_directoryL1B_cnt;
    
      resp_cacheL1B: NET_resp_cacheL1B;
      cnt_resp_cacheL1B: NET_cacheL1B_cnt;
      fwd_cacheL1B: NET_fwd_cacheL1B;
      cnt_fwd_cacheL1B: NET_cacheL1B_cnt;
    
    
    
      g_perm: PermMonitor;
      i_directoryL2: OBJ_directoryL2;
      i_directoryL1B: OBJ_directoryL1B;
      i_cacheL1B: OBJ_cacheL1B;
      i_directoryL1A: OBJ_directoryL1A;
      i_cacheL1A: OBJ_cacheL1A;
  
--Backend/Murphi/MurphiModular/GenFunctions

  ----Backend/Murphi/MurphiModular/Functions/GenTypeFunc
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
    procedure AddElement_cacheL2(var sv:v_cacheL2; n:Machines);
    begin
      if !isundefined(n.directoryL1B) then
        sv.directoryL1B[n.directoryL1B] := true;
      endif;
      if !isundefined(n.cacheL1A) then
        sv.cacheL1A[n.cacheL1A] := true;
      endif;
      if !isundefined(n.cacheL1B) then
        sv.cacheL1B[n.cacheL1B] := true;
      endif;
      if !isundefined(n.directoryL1A) then
        sv.directoryL1A[n.directoryL1A] := true;
      endif;
    
    end;
    
    -- .del()
    procedure RemoveElement_cacheL2(var sv:v_cacheL2; n:Machines);
    begin
      if !isundefined(n.directoryL1B) then
        sv.directoryL1B[n.directoryL1B] := false;
      endif;
      if !isundefined(n.cacheL1A) then
        sv.cacheL1A[n.cacheL1A] := false;
      endif;
      if !isundefined(n.cacheL1B) then
        sv.cacheL1B[n.cacheL1B] := false;
      endif;
      if !isundefined(n.directoryL1A) then
        sv.directoryL1A[n.directoryL1A] := false;
      endif;
    
    end;
    
    -- .clear()
    procedure ClearVector_cacheL2(var sv:v_cacheL2;);
    begin
      for m : OBJSET_directoryL1B do
        sv.directoryL1B[m] := false;
      endfor;
      for m : OBJSET_cacheL1A do
        sv.cacheL1A[m] := false;
      endfor;
      for m : OBJSET_cacheL1B do
        sv.cacheL1B[m] := false;
      endfor;
      for m : OBJSET_directoryL1A do
        sv.directoryL1A[m] := false;
      endfor;
    
    end;
    
    -- .contains()
    function IsElement_cacheL2(sv:v_cacheL2; n:Machines) : boolean;
    begin
      if !isundefined(n.directoryL1B) then
        return sv.directoryL1B[n.directoryL1B];
      endif;
      if !isundefined(n.cacheL1A) then
        return sv.cacheL1A[n.cacheL1A];
      endif;
      if !isundefined(n.cacheL1B) then
        return sv.cacheL1B[n.cacheL1B];
      endif;
      if !isundefined(n.directoryL1A) then
        return sv.directoryL1A[n.directoryL1A];
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
      for m : OBJSET_cacheL1A do
        if sv.cacheL1A[m] then
          cnt := cnt + 1;
        endif;
      endfor;
      for m : OBJSET_cacheL1B do
        if sv.cacheL1B[m] then
          cnt := cnt + 1;
        endif;
      endfor;
      for m : OBJSET_directoryL1A do
        if sv.directoryL1A[m] then
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
    
    
    -- .add()
    procedure AddElement_cacheL1B(var sv:v_cacheL1B; n:Machines);
    begin
      if !isundefined(n.cacheL1B) then
        sv.cacheL1B[n.cacheL1B] := true;
      endif;
      if !isundefined(n.cacheL1A) then
        sv.cacheL1A[n.cacheL1A] := true;
      endif;
      if !isundefined(n.directoryL2) then
        sv.directoryL2[n.directoryL2] := true;
      endif;
      if !isundefined(n.directoryL1A) then
        sv.directoryL1A[n.directoryL1A] := true;
      endif;
    
    end;
    
    -- .del()
    procedure RemoveElement_cacheL1B(var sv:v_cacheL1B; n:Machines);
    begin
      if !isundefined(n.cacheL1B) then
        sv.cacheL1B[n.cacheL1B] := false;
      endif;
      if !isundefined(n.cacheL1A) then
        sv.cacheL1A[n.cacheL1A] := false;
      endif;
      if !isundefined(n.directoryL2) then
        sv.directoryL2[n.directoryL2] := false;
      endif;
      if !isundefined(n.directoryL1A) then
        sv.directoryL1A[n.directoryL1A] := false;
      endif;
    
    end;
    
    -- .clear()
    procedure ClearVector_cacheL1B(var sv:v_cacheL1B;);
    begin
      for m : OBJSET_cacheL1B do
        sv.cacheL1B[m] := false;
      endfor;
      for m : OBJSET_cacheL1A do
        sv.cacheL1A[m] := false;
      endfor;
      for m : OBJSET_directoryL2 do
        sv.directoryL2[m] := false;
      endfor;
      for m : OBJSET_directoryL1A do
        sv.directoryL1A[m] := false;
      endfor;
    
    end;
    
    -- .contains()
    function IsElement_cacheL1B(sv:v_cacheL1B; n:Machines) : boolean;
    begin
      if !isundefined(n.cacheL1B) then
        return sv.cacheL1B[n.cacheL1B];
      endif;
      if !isundefined(n.cacheL1A) then
        return sv.cacheL1A[n.cacheL1A];
      endif;
      if !isundefined(n.directoryL2) then
        return sv.directoryL2[n.directoryL2];
      endif;
      if !isundefined(n.directoryL1A) then
        return sv.directoryL1A[n.directoryL1A];
      endif;
    
      return false;
    end;
    
    -- .count()
    function VectorCount_cacheL1B(sv:v_cacheL1B) : cnt_v_cacheL1B;
    var cnt : cnt_v_cacheL1B;
    begin
      cnt := 0;
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
      for m : OBJSET_directoryL2 do
        if sv.directoryL2[m] then
          cnt := cnt + 1;
        endif;
      endfor;
      for m : OBJSET_directoryL1A do
        if sv.directoryL1A[m] then
          cnt := cnt + 1;
        endif;
      endfor;
    
      return cnt;
    end;
    
    -- .empty()
    function HasElement_cacheL1B(sv:v_cacheL1B) : boolean;
    begin
        return VectorCount_cacheL1B(sv) > 0;
    end;
    
    
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
    
    
  ----Backend/Murphi/MurphiModular/Functions/GenResetFunc
    procedure ResetMachine_directoryL2();
    begin
      for i:OBJSET_directoryL2 do
        for a:Address do
          i_directoryL2[i].cb[a].State := directoryL2_I;
          i_directoryL2[i].cb[a].cl := 0;
          ClearVector_cacheL2(i_directoryL2[i].cb[a].cacheL2);
          undefine i_directoryL2[i].cb[a].ownerL2;
    
        endfor;
      endfor;
    end;
    
    procedure ResetMachine_directoryL1B();
    begin
      for i:OBJSET_directoryL1B do
        for a:Address do
          i_directoryL1B[i].cb[a].State := directoryL1B_I__C__I;
          i_directoryL1B[i].cb[a].cl := 0;
          ClearVector_cacheL1B(i_directoryL1B[i].cb[a].cacheL1B);
          undefine i_directoryL1B[i].cb[a].ownerL1B;
          undefine i_directoryL1B[i].cb[a].proxy_msgL1B;
          undefine i_directoryL1B[i].cb[a].proxy_msgL2;
          i_directoryL1B[i].cb[a].acksReceivedL1B := 0;
          i_directoryL1B[i].cb[a].acksExpectedL1B := 0;
          i_directoryL1B[i].cb[a].acksReceivedL2 := 0;
          i_directoryL1B[i].cb[a].acksExpectedL2 := 0;
    
        endfor;
      endfor;
    end;
    
    procedure ResetMachine_cacheL1B();
    begin
      for i:OBJSET_cacheL1B do
        for a:Address do
          i_cacheL1B[i].cb[a].State := cacheL1B_I;
          i_cacheL1B[i].cb[a].cl := 0;
          i_cacheL1B[i].cb[a].acksReceivedL1B := 0;
          i_cacheL1B[i].cb[a].acksExpectedL1B := 0;
    
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
          i_directoryL1A[i].cb[a].acksReceivedL2 := 0;
          i_directoryL1A[i].cb[a].acksExpectedL2 := 0;
    
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
      ResetMachine_directoryL2();
      ResetMachine_directoryL1B();
      ResetMachine_cacheL1B();
      ResetMachine_directoryL1A();
      ResetMachine_cacheL1A();
      
      end;
  ----Backend/Murphi/MurphiModular/Functions/GenFIFOFunc
  ----Backend/Murphi/MurphiModular/Functions/GenNetworkFunc
    procedure Send_resp(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.directoryL1A) then
        Assert(cnt_resp_directoryL1A[dst.directoryL1A] < O_NET_MAX) "Too many messages: resp_directoryL1A";
        resp_directoryL1A[dst.directoryL1A][cnt_resp_directoryL1A[dst.directoryL1A]] := msg;
        cnt_resp_directoryL1A[dst.directoryL1A] := cnt_resp_directoryL1A[dst.directoryL1A] + 1;
      elsif !isundefined(dst.cacheL1A) then
        Assert(cnt_resp_cacheL1A[dst.cacheL1A] < O_NET_MAX) "Too many messages: resp_cacheL1A";
        resp_cacheL1A[dst.cacheL1A][cnt_resp_cacheL1A[dst.cacheL1A]] := msg;
        cnt_resp_cacheL1A[dst.cacheL1A] := cnt_resp_cacheL1A[dst.cacheL1A] + 1;
      elsif !isundefined(dst.directoryL2) then
        Assert(cnt_resp_directoryL2[dst.directoryL2] < O_NET_MAX) "Too many messages: resp_directoryL2";
        resp_directoryL2[dst.directoryL2][cnt_resp_directoryL2[dst.directoryL2]] := msg;
        cnt_resp_directoryL2[dst.directoryL2] := cnt_resp_directoryL2[dst.directoryL2] + 1;
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
      if !isundefined(dst.directoryL1A) then
        Assert (cnt_resp_directoryL1A[dst.directoryL1A] > 0) "Trying to advance empty queue: resp_directoryL1A";
        for i := 0 to cnt_resp_directoryL1A[dst.directoryL1A]-1 do
          if i < cnt_resp_directoryL1A[dst.directoryL1A]-1 then
            resp_directoryL1A[dst.directoryL1A][i] := resp_directoryL1A[dst.directoryL1A][i+1];
          else
            undefine resp_directoryL1A[dst.directoryL1A][i];
          endif;
        endfor;
        cnt_resp_directoryL1A[dst.directoryL1A] := cnt_resp_directoryL1A[dst.directoryL1A] - 1;
      elsif !isundefined(dst.cacheL1A) then
        Assert (cnt_resp_cacheL1A[dst.cacheL1A] > 0) "Trying to advance empty queue: resp_cacheL1A";
        for i := 0 to cnt_resp_cacheL1A[dst.cacheL1A]-1 do
          if i < cnt_resp_cacheL1A[dst.cacheL1A]-1 then
            resp_cacheL1A[dst.cacheL1A][i] := resp_cacheL1A[dst.cacheL1A][i+1];
          else
            undefine resp_cacheL1A[dst.cacheL1A][i];
          endif;
        endfor;
        cnt_resp_cacheL1A[dst.cacheL1A] := cnt_resp_cacheL1A[dst.cacheL1A] - 1;
      elsif !isundefined(dst.directoryL2) then
        Assert (cnt_resp_directoryL2[dst.directoryL2] > 0) "Trying to advance empty queue: resp_directoryL2";
        for i := 0 to cnt_resp_directoryL2[dst.directoryL2]-1 do
          if i < cnt_resp_directoryL2[dst.directoryL2]-1 then
            resp_directoryL2[dst.directoryL2][i] := resp_directoryL2[dst.directoryL2][i+1];
          else
            undefine resp_directoryL2[dst.directoryL2][i];
          endif;
        endfor;
        cnt_resp_directoryL2[dst.directoryL2] := cnt_resp_directoryL2[dst.directoryL2] - 1;
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
      if !isundefined(dst.directoryL1A) then
        Assert(cnt_req_directoryL1A[dst.directoryL1A] < O_NET_MAX) "Too many messages: req_directoryL1A";
        req_directoryL1A[dst.directoryL1A][cnt_req_directoryL1A[dst.directoryL1A]] := msg;
        cnt_req_directoryL1A[dst.directoryL1A] := cnt_req_directoryL1A[dst.directoryL1A] + 1;
      elsif !isundefined(dst.cacheL1A) then
        error "Attempt to send to queue req_cacheL1A, which is not modeled"; 
      elsif !isundefined(dst.directoryL2) then
        Assert(cnt_req_directoryL2[dst.directoryL2] < O_NET_MAX) "Too many messages: req_directoryL2";
        req_directoryL2[dst.directoryL2][cnt_req_directoryL2[dst.directoryL2]] := msg;
        cnt_req_directoryL2[dst.directoryL2] := cnt_req_directoryL2[dst.directoryL2] + 1;
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
      if !isundefined(dst.directoryL1A) then
        Assert (cnt_req_directoryL1A[dst.directoryL1A] > 0) "Trying to advance empty queue: req_directoryL1A";
        for i := 0 to cnt_req_directoryL1A[dst.directoryL1A]-1 do
          if i < cnt_req_directoryL1A[dst.directoryL1A]-1 then
            req_directoryL1A[dst.directoryL1A][i] := req_directoryL1A[dst.directoryL1A][i+1];
          else
            undefine req_directoryL1A[dst.directoryL1A][i];
          endif;
        endfor;
        cnt_req_directoryL1A[dst.directoryL1A] := cnt_req_directoryL1A[dst.directoryL1A] - 1;
      elsif !isundefined(dst.cacheL1A) then
        error "Attempt to pop from queue req_cacheL1A, which is not modeled"; 
      elsif !isundefined(dst.directoryL2) then
        Assert (cnt_req_directoryL2[dst.directoryL2] > 0) "Trying to advance empty queue: req_directoryL2";
        for i := 0 to cnt_req_directoryL2[dst.directoryL2]-1 do
          if i < cnt_req_directoryL2[dst.directoryL2]-1 then
            req_directoryL2[dst.directoryL2][i] := req_directoryL2[dst.directoryL2][i+1];
          else
            undefine req_directoryL2[dst.directoryL2][i];
          endif;
        endfor;
        cnt_req_directoryL2[dst.directoryL2] := cnt_req_directoryL2[dst.directoryL2] - 1;
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
      if !isundefined(dst.directoryL1A) then
        Assert(cnt_fwd_directoryL1A[dst.directoryL1A] < O_NET_MAX) "Too many messages: fwd_directoryL1A";
        fwd_directoryL1A[dst.directoryL1A][cnt_fwd_directoryL1A[dst.directoryL1A]] := msg;
        cnt_fwd_directoryL1A[dst.directoryL1A] := cnt_fwd_directoryL1A[dst.directoryL1A] + 1;
      elsif !isundefined(dst.cacheL1A) then
        Assert(cnt_fwd_cacheL1A[dst.cacheL1A] < O_NET_MAX) "Too many messages: fwd_cacheL1A";
        fwd_cacheL1A[dst.cacheL1A][cnt_fwd_cacheL1A[dst.cacheL1A]] := msg;
        cnt_fwd_cacheL1A[dst.cacheL1A] := cnt_fwd_cacheL1A[dst.cacheL1A] + 1;
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
      if !isundefined(dst.directoryL1A) then
        Assert (cnt_fwd_directoryL1A[dst.directoryL1A] > 0) "Trying to advance empty queue: fwd_directoryL1A";
        for i := 0 to cnt_fwd_directoryL1A[dst.directoryL1A]-1 do
          if i < cnt_fwd_directoryL1A[dst.directoryL1A]-1 then
            fwd_directoryL1A[dst.directoryL1A][i] := fwd_directoryL1A[dst.directoryL1A][i+1];
          else
            undefine fwd_directoryL1A[dst.directoryL1A][i];
          endif;
        endfor;
        cnt_fwd_directoryL1A[dst.directoryL1A] := cnt_fwd_directoryL1A[dst.directoryL1A] - 1;
      elsif !isundefined(dst.cacheL1A) then
        Assert (cnt_fwd_cacheL1A[dst.cacheL1A] > 0) "Trying to advance empty queue: fwd_cacheL1A";
        for i := 0 to cnt_fwd_cacheL1A[dst.cacheL1A]-1 do
          if i < cnt_fwd_cacheL1A[dst.cacheL1A]-1 then
            fwd_cacheL1A[dst.cacheL1A][i] := fwd_cacheL1A[dst.cacheL1A][i+1];
          else
            undefine fwd_cacheL1A[dst.cacheL1A][i];
          endif;
        endfor;
        cnt_fwd_cacheL1A[dst.cacheL1A] := cnt_fwd_cacheL1A[dst.cacheL1A] - 1;
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
    
    procedure Multicast_fwd_v_cacheL2(var msg: Message; dst_vect: v_cacheL2; src: Machines;);
    begin
      for n : OBJSET_directoryL1B do
        if IsElement_cacheL2(dst_vect, to_m_directoryL1B(n)) then
          msg.dst := to_m_directoryL1B(n);
          Send_fwd(msg, src);
        endif;
      endfor;
      for n : OBJSET_cacheL1A do
        if IsElement_cacheL2(dst_vect, to_m_cacheL1A(n)) then
          msg.dst := to_m_cacheL1A(n);
          Send_fwd(msg, src);
        endif;
      endfor;
      for n : OBJSET_cacheL1B do
        if IsElement_cacheL2(dst_vect, to_m_cacheL1B(n)) then
          msg.dst := to_m_cacheL1B(n);
          Send_fwd(msg, src);
        endif;
      endfor;
      for n : OBJSET_directoryL1A do
        if IsElement_cacheL2(dst_vect, to_m_directoryL1A(n)) then
          msg.dst := to_m_directoryL1A(n);
          Send_fwd(msg, src);
        endif;
      endfor;
    
    end;
    
    procedure Multicast_fwd_v_cacheL1B(var msg: Message; dst_vect: v_cacheL1B; src: Machines;);
    begin
      for n : OBJSET_cacheL1B do
        if IsElement_cacheL1B(dst_vect, to_m_cacheL1B(n)) then
          msg.dst := to_m_cacheL1B(n);
          Send_fwd(msg, src);
        endif;
      endfor;
      for n : OBJSET_cacheL1A do
        if IsElement_cacheL1B(dst_vect, to_m_cacheL1A(n)) then
          msg.dst := to_m_cacheL1A(n);
          Send_fwd(msg, src);
        endif;
      endfor;
      for n : OBJSET_directoryL2 do
        if IsElement_cacheL1B(dst_vect, to_m_directoryL2(n)) then
          msg.dst := to_m_directoryL2(n);
          Send_fwd(msg, src);
        endif;
      endfor;
      for n : OBJSET_directoryL1A do
        if IsElement_cacheL1B(dst_vect, to_m_directoryL1A(n)) then
          msg.dst := to_m_directoryL1A(n);
          Send_fwd(msg, src);
        endif;
      endfor;
    
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
      for dst:OBJSET_directoryL2 do
        if cnt_resp_directoryL2[dst] >= (O_NET_MAX-13) then
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
    function req_network_ready(): boolean;
    begin
      for dst:OBJSET_directoryL1B do
        if cnt_req_directoryL1B[dst] >= (O_NET_MAX-13) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2 do
        if cnt_req_directoryL2[dst] >= (O_NET_MAX-13) then
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
    function network_ready(): boolean;
    begin
            if !fwd_network_ready() then
            return false;
          endif;
    
    
          if !resp_network_ready() then
            return false;
          endif;
    
    
          if !req_network_ready() then
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
      for dst:OBJSET_directoryL1B do
        cnt_resp_directoryL1B[dst] := 0;
        cnt_req_directoryL1B[dst] := 0;
        cnt_fwd_directoryL1B[dst] := 0;
      endfor;
      
      undefine resp_directoryL2;
      undefine req_directoryL2;
      for dst:OBJSET_directoryL2 do
        cnt_resp_directoryL2[dst] := 0;
        cnt_req_directoryL2[dst] := 0;
      endfor;
      
      undefine resp_directoryL1A;
      undefine req_directoryL1A;
      undefine fwd_directoryL1A;
      for dst:OBJSET_directoryL1A do
        cnt_resp_directoryL1A[dst] := 0;
        cnt_req_directoryL1A[dst] := 0;
        cnt_fwd_directoryL1A[dst] := 0;
      endfor;
      
    
    end;
    
  
  ----Backend/Murphi/MurphiModular/Functions/GenMessageConstrFunc
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
    
    function RespAckL1B(adr: Address; mtype: MessageType; src: Machines; dst: Machines; cl: ClValue; acksExpectedL1B: 0..NrCachesL1B) : Message;
    var Message: Message;
    begin
      Message.adr := adr;
      Message.mtype := mtype;
      Message.src := src;
      Message.dst := dst;
      Message.cl := cl;
      Message.acksExpectedL1B := acksExpectedL1B;
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
      msg := RespL2(adr,PutML2,m,to_m_directoryL2(directoryL2),cbe.cl);
      Send_req(msg, m);
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
      msg := RequestL2(adr,PutSL2,m,to_m_directoryL2(directoryL2));
      Send_req(msg, m);
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
          msg := RespL2(adr,PutML2,m,to_m_directoryL2(directoryL2),cbe.cl);
          Send_req(msg, m);
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
          msg := RespL2(adr,PutML2,m,to_m_directoryL2(directoryL2),cbe.cl);
          Send_req(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictI__C__M_evict;
          return;
          endif;
        endif;
      endif;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1B_E__C__M_evict(adr:Address; mTyped:OBJSET_directoryL1B);
    var msg_GetML1B: Message;
    var msg: Message;
    begin
    alias cbe: i_directoryL1B[mTyped].cb[adr] do
    alias m : to_m_directoryL1B(mTyped) do
      msg_GetML1B := RequestL1B(adr,GetML1B,m,m);
      cbe.acksReceivedL1B := 0;
      msg := RequestL1B(adr,Fwd_GetML1B,msg_GetML1B.src,cbe.ownerL1B);
      Send_fwd(msg, m);
      cbe.ownerL1B := msg_GetML1B.src;
      Clear_perm(adr, m);
      cbe.State := directoryL1B_evictdM_x_pI_store__C__M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1B_I__C__M_evict(adr:Address; mTyped:OBJSET_directoryL1B);
    var msg_GetML1B: Message;
    var msg_GetM_Ack_ADL1B: Message;
    var msg_PutML1B: Message;
    var msg_Put_AckL1B: Message;
    var msg: Message;
    begin
    alias cbe: i_directoryL1B[mTyped].cb[adr] do
    alias m : to_m_directoryL1B(mTyped) do
      msg_GetML1B := RequestL1B(adr,GetML1B,m,m);
      cbe.acksReceivedL1B := 0;
      msg_GetM_Ack_ADL1B := RespAckL1B(adr,GetM_Ack_ADL1B,m,msg_GetML1B.src,cbe.cl,VectorCount_cacheL1B(cbe.cacheL1B));
      cbe.ownerL1B := msg_GetML1B.src;
      cbe.cl := msg_GetM_Ack_ADL1B.cl;
      cbe.acksExpectedL1B := msg_GetM_Ack_ADL1B.acksExpectedL1B;
      if (cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
      cbe.acksExpectedL1B := 0;
      cbe.acksReceivedL1B := 0;
      cbe.acksExpectedL1B := 0;
      cbe.acksReceivedL1B := 0;
      cbe.acksExpectedL1B := 0;
      cbe.acksReceivedL1B := 0;
      cbe.acksExpectedL1B := 0;
      cbe.acksReceivedL1B := 0;
      cbe.acksExpectedL1B := 0;
      cbe.acksReceivedL1B := 0;
      Set_perm(store, adr, m);
      msg_PutML1B := RespL1B(adr,PutML1B,m,m,cbe.cl);
      msg_Put_AckL1B := AckL1B(adr,Put_AckL1B,m,msg_PutML1B.src);
      RemoveElement_cacheL1B(cbe.cacheL1B, msg_PutML1B.src);
      if (cbe.ownerL1B = msg_PutML1B.src) then
      cbe.cl := msg_PutML1B.cl;
      msg := RespL2(adr,PutML2,m,to_m_directoryL2(directoryL2),cbe.cl);
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := directoryL1B_evictI__C__M_evict;
      return;
      endif;
      endif;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1B_I__C__S_evict(adr:Address; mTyped:OBJSET_directoryL1B);
    var msg_GetML1B: Message;
    var msg_GetM_Ack_ADL1B: Message;
    var msg_PutML1B: Message;
    var msg_Put_AckL1B: Message;
    var msg: Message;
    begin
    alias cbe: i_directoryL1B[mTyped].cb[adr] do
    alias m : to_m_directoryL1B(mTyped) do
      msg_GetML1B := RequestL1B(adr,GetML1B,m,m);
      cbe.acksReceivedL1B := 0;
      msg_GetM_Ack_ADL1B := RespAckL1B(adr,GetM_Ack_ADL1B,m,msg_GetML1B.src,cbe.cl,VectorCount_cacheL1B(cbe.cacheL1B));
      cbe.ownerL1B := msg_GetML1B.src;
      cbe.cl := msg_GetM_Ack_ADL1B.cl;
      cbe.acksExpectedL1B := msg_GetM_Ack_ADL1B.acksExpectedL1B;
      if (cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
      cbe.acksExpectedL1B := 0;
      cbe.acksReceivedL1B := 0;
      cbe.acksExpectedL1B := 0;
      cbe.acksReceivedL1B := 0;
      cbe.acksExpectedL1B := 0;
      cbe.acksReceivedL1B := 0;
      cbe.acksExpectedL1B := 0;
      cbe.acksReceivedL1B := 0;
      cbe.acksExpectedL1B := 0;
      cbe.acksReceivedL1B := 0;
      Set_perm(store, adr, m);
      msg_PutML1B := RespL1B(adr,PutML1B,m,m,cbe.cl);
      msg_Put_AckL1B := AckL1B(adr,Put_AckL1B,m,msg_PutML1B.src);
      RemoveElement_cacheL1B(cbe.cacheL1B, msg_PutML1B.src);
      if (cbe.ownerL1B = msg_PutML1B.src) then
      cbe.cl := msg_PutML1B.cl;
      msg := RequestL2(adr,PutSL2,m,to_m_directoryL2(directoryL2));
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := directoryL1B_evictI__C__S_evict;
      return;
      endif;
      endif;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1B_M__C__M_evict(adr:Address; mTyped:OBJSET_directoryL1B);
    var msg_GetML1B: Message;
    var msg: Message;
    begin
    alias cbe: i_directoryL1B[mTyped].cb[adr] do
    alias m : to_m_directoryL1B(mTyped) do
      msg_GetML1B := RequestL1B(adr,GetML1B,m,m);
      cbe.acksReceivedL1B := 0;
      msg := RequestL1B(adr,Fwd_GetML1B,msg_GetML1B.src,cbe.ownerL1B);
      Send_fwd(msg, m);
      cbe.ownerL1B := msg_GetML1B.src;
      Clear_perm(adr, m);
      cbe.State := directoryL1B_evictdM_x_pI_store__C__M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1B_S__C__M_evict(adr:Address; mTyped:OBJSET_directoryL1B);
    var msg_GetML1B: Message;
    var msg_GetM_Ack_ADL1B: Message;
    var msg: Message;
    var msg_PutML1B: Message;
    var msg_Put_AckL1B: Message;
    begin
    alias cbe: i_directoryL1B[mTyped].cb[adr] do
    alias m : to_m_directoryL1B(mTyped) do
      msg_GetML1B := RequestL1B(adr,GetML1B,m,m);
      cbe.acksReceivedL1B := 0;
      if (IsElement_cacheL1B(cbe.cacheL1B, msg_GetML1B.src)) then
        RemoveElement_cacheL1B(cbe.cacheL1B, msg_GetML1B.src);
        msg_GetM_Ack_ADL1B := RespAckL1B(adr,GetM_Ack_ADL1B,m,msg_GetML1B.src,cbe.cl,VectorCount_cacheL1B(cbe.cacheL1B));
        msg := AckL1B(adr,InvL1B,msg_GetML1B.src,msg_GetML1B.src);
        Multicast_fwd_v_cacheL1B(msg, cbe.cacheL1B, m);
        cbe.ownerL1B := msg_GetML1B.src;
        ClearVector_cacheL1B(cbe.cacheL1B);
        cbe.cl := msg_GetM_Ack_ADL1B.cl;
        cbe.acksExpectedL1B := msg_GetM_Ack_ADL1B.acksExpectedL1B;
        if !(cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
          Clear_perm(adr, m);
          cbe.State := directoryL1B_evictdM_x_pI_store_GetM_Ack_AD__C__M;
          return;
        endif;
        if (cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          Set_perm(store, adr, m);
          msg_PutML1B := RespL1B(adr,PutML1B,m,m,cbe.cl);
          msg_Put_AckL1B := AckL1B(adr,Put_AckL1B,m,msg_PutML1B.src);
          RemoveElement_cacheL1B(cbe.cacheL1B, msg_PutML1B.src);
          if (cbe.ownerL1B = msg_PutML1B.src) then
          cbe.cl := msg_PutML1B.cl;
          msg := RespL2(adr,PutML2,m,to_m_directoryL2(directoryL2),cbe.cl);
          Send_req(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_evictI__C__M_evict;
          return;
          endif;
        endif;
      endif;
      if !(IsElement_cacheL1B(cbe.cacheL1B, msg_GetML1B.src)) then
        msg_GetM_Ack_ADL1B := RespAckL1B(adr,GetM_Ack_ADL1B,m,msg_GetML1B.src,cbe.cl,VectorCount_cacheL1B(cbe.cacheL1B));
        msg := AckL1B(adr,InvL1B,msg_GetML1B.src,msg_GetML1B.src);
        Multicast_fwd_v_cacheL1B(msg, cbe.cacheL1B, m);
        cbe.ownerL1B := msg_GetML1B.src;
        ClearVector_cacheL1B(cbe.cacheL1B);
        cbe.cl := msg_GetM_Ack_ADL1B.cl;
        cbe.acksExpectedL1B := msg_GetM_Ack_ADL1B.acksExpectedL1B;
        if (cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          Set_perm(store, adr, m);
          msg_PutML1B := RespL1B(adr,PutML1B,m,m,cbe.cl);
          msg_Put_AckL1B := AckL1B(adr,Put_AckL1B,m,msg_PutML1B.src);
          RemoveElement_cacheL1B(cbe.cacheL1B, msg_PutML1B.src);
          if (cbe.ownerL1B = msg_PutML1B.src) then
          cbe.cl := msg_PutML1B.cl;
          msg := RespL2(adr,PutML2,m,to_m_directoryL2(directoryL2),cbe.cl);
          Send_req(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_evictI__C__M_evict;
          return;
          endif;
        endif;
        if !(cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
          Clear_perm(adr, m);
          cbe.State := directoryL1B_evictdM_x_pI_store_GetM_Ack_AD__C__M;
          return;
        endif;
      endif;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_E_evict(adr:Address; mTyped:OBJSET_cacheL1B);
    var msg: Message;
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      msg := AckL1B(adr,PutEL1B,m,to_m_directoryL1B(directoryL1B));
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1B_E_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_E_load(adr:Address; mTyped:OBJSET_cacheL1B);
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1B_E;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_E_store(adr:Address; mTyped:OBJSET_cacheL1B);
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      Set_perm(store, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1B_M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_I_load(adr:Address; mTyped:OBJSET_cacheL1B);
    var msg: Message;
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      msg := RequestL1B(adr,GetSL1B,m,to_m_directoryL1B(directoryL1B));
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1B_I_load;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_I_store(adr:Address; mTyped:OBJSET_cacheL1B);
    var msg: Message;
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      msg := RequestL1B(adr,GetML1B,m,to_m_directoryL1B(directoryL1B));
      Send_req(msg, m);
      cbe.acksReceivedL1B := 0;
      Clear_perm(adr, m);
      cbe.State := cacheL1B_I_store;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_M_evict(adr:Address; mTyped:OBJSET_cacheL1B);
    var msg: Message;
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      msg := RespL1B(adr,PutML1B,m,to_m_directoryL1B(directoryL1B),cbe.cl);
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1B_M_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_M_load(adr:Address; mTyped:OBJSET_cacheL1B);
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1B_M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_M_store(adr:Address; mTyped:OBJSET_cacheL1B);
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      Set_perm(store, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1B_M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_S_evict(adr:Address; mTyped:OBJSET_cacheL1B);
    var msg: Message;
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      msg := RequestL1B(adr,PutSL1B,m,to_m_directoryL1B(directoryL1B));
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1B_S_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_S_load(adr:Address; mTyped:OBJSET_cacheL1B);
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m);
      cbe.State := cacheL1B_S;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1B_S_store(adr:Address; mTyped:OBJSET_cacheL1B);
    var msg: Message;
    begin
    alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
      msg := RequestL1B(adr,GetML1B,m,to_m_directoryL1B(directoryL1B));
      Send_req(msg, m);
      cbe.acksReceivedL1B := 0;
      Clear_perm(adr, m);
      cbe.State := cacheL1B_S_store;
      return;
    endalias;
    endalias;
    end;
    
  ----Backend/Murphi/MurphiModular/StateMachines/GenMessageStateMachines
    function FSM_MSG_directoryL2(inmsg:Message; mTyped:OBJSET_directoryL2) : boolean;
    var msg: Message;
    begin
      alias adr: inmsg.adr do
      alias cbe: i_directoryL2[mTyped].cb[adr] do
    alias m : to_m_directoryL2(mTyped) do
    switch cbe.State
      case directoryL2_E:
      switch inmsg.mtype
        case GetML2:
          msg := RequestL2(adr,Fwd_GetML2,inmsg.src,cbe.ownerL2);
          Send_fwd(msg, m);
          cbe.ownerL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2_M;
          return true;
        
        case GetSL2:
          msg := RequestL2(adr,Fwd_GetSL2,inmsg.src,cbe.ownerL2);
          Send_fwd(msg, m);
          AddElement_cacheL2(cbe.cacheL2, inmsg.src);
          AddElement_cacheL2(cbe.cacheL2, cbe.ownerL2);
          Clear_perm(adr, m);
          cbe.State := directoryL2_E_GetS;
          return true;
        
        case PutEL2:
          msg := AckL2(adr,Put_AckL2,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_E;
            return true;
          endif;
          if (cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_I;
            return true;
          endif;
        
        case PutML2:
          msg := AckL2(adr,Put_AckL2,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_E;
            return true;
          endif;
          if (cbe.ownerL2 = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2_I;
            return true;
          endif;
        
        case PutSL2:
          msg := AckL2(adr,Put_AckL2,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if (cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_I;
            return true;
          endif;
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_E;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2_E_GetS:
      switch inmsg.mtype
        case WBL2:
          if (inmsg.src = cbe.ownerL2) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2_S;
            return true;
          endif;
          if !(inmsg.src = cbe.ownerL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_E_GetS;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2_I:
      switch inmsg.mtype
        case GetML2:
          msg := RespAckL2(adr,GetM_Ack_ADL2,m,inmsg.src,cbe.cl,VectorCount_cacheL2(cbe.cacheL2));
          Send_resp(msg, m);
          cbe.ownerL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2_M;
          return true;
        
        case GetSL2:
          msg := RespL2(adr,GetM_Ack_DL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          cbe.ownerL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2_E;
          return true;
        
        case PutEL2:
          msg := AckL2(adr,Put_AckL2,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if (cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_I;
            return true;
          endif;
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_I;
            return true;
          endif;
        
        case PutML2:
          msg := AckL2(adr,Put_AckL2,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if (cbe.ownerL2 = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2_I;
            return true;
          endif;
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_I;
            return true;
          endif;
        
        case PutSL2:
          msg := AckL2(adr,Put_AckL2,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if !(VectorCount_cacheL2(cbe.cacheL2) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_I;
            return true;
          endif;
          if (VectorCount_cacheL2(cbe.cacheL2) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_I;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2_M:
      switch inmsg.mtype
        case GetML2:
          msg := RequestL2(adr,Fwd_GetML2,inmsg.src,cbe.ownerL2);
          Send_fwd(msg, m);
          cbe.ownerL2 := inmsg.src;
          Clear_perm(adr, m);
          cbe.State := directoryL2_M;
          return true;
        
        case GetSL2:
          msg := RequestL2(adr,Fwd_GetSL2,inmsg.src,cbe.ownerL2);
          Send_fwd(msg, m);
          AddElement_cacheL2(cbe.cacheL2, inmsg.src);
          AddElement_cacheL2(cbe.cacheL2, cbe.ownerL2);
          Clear_perm(adr, m);
          cbe.State := directoryL2_M_GetS;
          return true;
        
        case PutEL2:
          msg := AckL2(adr,Put_AckL2,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_M;
            return true;
          endif;
          if (cbe.ownerL2 = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2_I;
            return true;
          endif;
        
        case PutML2:
          msg := AckL2(adr,Put_AckL2,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_M;
            return true;
          endif;
          if (cbe.ownerL2 = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2_I;
            return true;
          endif;
        
        case PutSL2:
          msg := AckL2(adr,Put_AckL2,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL2(cbe.cacheL2, inmsg.src);
          if !(cbe.ownerL2 = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_M;
            return true;
          endif;
          if (cbe.ownerL2 = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2_I;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2_M_GetS:
      switch inmsg.mtype
        case WBL2:
          if (inmsg.src = cbe.ownerL2) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL2_S;
            return true;
          endif;
          if !(inmsg.src = cbe.ownerL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL2_M_GetS;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL2_S:
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
            cbe.State := directoryL2_M;
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
            cbe.State := directoryL2_M;
            return true;
          endif;
        
        case GetSL2:
          msg := RespL2(adr,GetS_AckL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          AddElement_cacheL2(cbe.cacheL2, inmsg.src);
          Clear_perm(adr, m);
          cbe.State := directoryL2_S;
          return true;
        
        case PutEL2:
          msg := AckL2(adr,Put_AckL2,m,inmsg.src);
          Send_fwd(msg, m);
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
        
        case PutML2:
          msg := AckL2(adr,Put_AckL2,m,inmsg.src);
          Send_fwd(msg, m);
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
        
        case PutSL2:
          msg := AckL2(adr,Put_AckL2,m,inmsg.src);
          Send_fwd(msg, m);
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
        
        else return false;
      endswitch;
      
    endswitch;
    endalias;
    endalias;
    endalias;
    return false;
    end;
    
    function FSM_MSG_directoryL1B(inmsg:Message; mTyped:OBJSET_directoryL1B) : boolean;
    var msg_GetML1B: Message;
    var msg: Message;
    var msg_PutML1B: Message;
    var msg_Put_AckL1B: Message;
    var msg_GetM_Ack_ADL1B: Message;
    begin
      alias adr: inmsg.adr do
      alias cbe: i_directoryL1B[mTyped].cb[adr] do
    alias m : to_m_directoryL1B(mTyped) do
    switch cbe.State
      case directoryL1B_E__C__M:
      switch inmsg.mtype
        case Fwd_GetML2:
          msg_GetML1B := RequestL1B(adr,GetML1B,m,m);
          cbe.acksReceivedL1B := 0;
          msg := RequestL1B(adr,Fwd_GetML1B,msg_GetML1B.src,cbe.ownerL1B);
          Send_fwd(msg, m);
          cbe.ownerL1B := msg_GetML1B.src;
          cbe.proxy_msgL2 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_Fwd_GetML2dM_x_pI_store__C__M;
          return true;
        
        case Fwd_GetSL2:
          msg_GetML1B := RequestL1B(adr,GetML1B,m,m);
          cbe.acksReceivedL1B := 0;
          msg := RequestL1B(adr,Fwd_GetML1B,msg_GetML1B.src,cbe.ownerL1B);
          Send_fwd(msg, m);
          cbe.ownerL1B := msg_GetML1B.src;
          cbe.proxy_msgL2 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_Fwd_GetSL2dM_x_pI_store__C__M;
          return true;
        
        case GetML1B:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1B := inmsg;
          msg := RequestL1B(adr,Fwd_GetML1B,cbe.proxy_msgL1B.src,cbe.ownerL1B);
          Send_fwd(msg, m);
          cbe.ownerL1B := cbe.proxy_msgL1B.src;
          undefine cbe.proxy_msgL1B;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_M__C__M;
          return true;
        
        case GetSL1B:
          Set_perm(load, adr, m);
          cbe.proxy_msgL1B := inmsg;
          msg := RequestL1B(adr,Fwd_GetSL1B,cbe.proxy_msgL1B.src,cbe.ownerL1B);
          Send_fwd(msg, m);
          AddElement_cacheL1B(cbe.cacheL1B, cbe.proxy_msgL1B.src);
          AddElement_cacheL1B(cbe.cacheL1B, cbe.ownerL1B);
          undefine cbe.proxy_msgL1B;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetSL1BE_GetS__C__M;
          return true;
        
        case PutEL1B:
          msg := AckL1B(adr,Put_AckL1B,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1B(cbe.cacheL1B, inmsg.src);
          if (cbe.ownerL1B = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__M;
            return true;
          endif;
          if !(cbe.ownerL1B = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_E__C__M;
            return true;
          endif;
        
        case PutML1B:
          msg := AckL1B(adr,Put_AckL1B,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1B(cbe.cacheL1B, inmsg.src);
          if !(cbe.ownerL1B = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_E__C__M;
            return true;
          endif;
          if (cbe.ownerL1B = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__M;
            return true;
          endif;
        
        case PutSL1B:
          msg := AckL1B(adr,Put_AckL1B,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1B(cbe.cacheL1B, inmsg.src);
          if (cbe.ownerL1B = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__M;
            return true;
          endif;
          if !(cbe.ownerL1B = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_E__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1B_Fwd_GetML2dM_x_pI_store_GetM_Ack_AD__C__M:
      switch inmsg.mtype
        case Inv_AckL1B:
          cbe.acksReceivedL1B := cbe.acksReceivedL1B+1;
          if (cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            Set_perm(store, adr, m);
            msg_PutML1B := RespL1B(adr,PutML1B,m,m,cbe.cl);
            msg_Put_AckL1B := AckL1B(adr,Put_AckL1B,m,msg_PutML1B.src);
            RemoveElement_cacheL1B(cbe.cacheL1B, msg_PutML1B.src);
            if (cbe.ownerL1B = msg_PutML1B.src) then
            cbe.cl := msg_PutML1B.cl;
            msg := RespL2(adr,GetM_Ack_DL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_resp(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__I;
            return true;
            endif;
          endif;
          if !(cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_Fwd_GetML2dM_x_pI_store_GetM_Ack_AD__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1B_Fwd_GetML2dM_x_pI_store__C__M:
      switch inmsg.mtype
        case GetM_Ack_DL1B:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg_PutML1B := RespL1B(adr,PutML1B,m,m,cbe.cl);
          msg_Put_AckL1B := AckL1B(adr,Put_AckL1B,m,msg_PutML1B.src);
          RemoveElement_cacheL1B(cbe.cacheL1B, msg_PutML1B.src);
          if (cbe.ownerL1B = msg_PutML1B.src) then
          cbe.cl := msg_PutML1B.cl;
          msg := RespL2(adr,GetM_Ack_DL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_I__C__I;
          return true;
          endif;
        
        case Inv_AckL1B:
          cbe.acksReceivedL1B := cbe.acksReceivedL1B+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_Fwd_GetML2dM_x_pI_store__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_Fwd_GetSL2dM_x_pI_store_GetM_Ack_AD__C__M:
      switch inmsg.mtype
        case Inv_AckL1B:
          cbe.acksReceivedL1B := cbe.acksReceivedL1B+1;
          if !(cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_Fwd_GetSL2dM_x_pI_store_GetM_Ack_AD__C__M;
            return true;
          endif;
          if (cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            Set_perm(store, adr, m);
            msg_PutML1B := RespL1B(adr,PutML1B,m,m,cbe.cl);
            msg_Put_AckL1B := AckL1B(adr,Put_AckL1B,m,msg_PutML1B.src);
            RemoveElement_cacheL1B(cbe.cacheL1B, msg_PutML1B.src);
            if (cbe.ownerL1B = msg_PutML1B.src) then
            cbe.cl := msg_PutML1B.cl;
            msg := RespL2(adr,GetS_AckL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_resp(msg, m);
            msg := RespL2(adr,WBL2,m,to_m_directoryL2(directoryL2),cbe.cl);
            Send_resp(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__S;
            return true;
            endif;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1B_Fwd_GetSL2dM_x_pI_store__C__M:
      switch inmsg.mtype
        case GetM_Ack_DL1B:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg_PutML1B := RespL1B(adr,PutML1B,m,m,cbe.cl);
          msg_Put_AckL1B := AckL1B(adr,Put_AckL1B,m,msg_PutML1B.src);
          RemoveElement_cacheL1B(cbe.cacheL1B, msg_PutML1B.src);
          if (cbe.ownerL1B = msg_PutML1B.src) then
          cbe.cl := msg_PutML1B.cl;
          msg := RespL2(adr,GetS_AckL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL2(adr,WBL2,m,to_m_directoryL2(directoryL2),cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_I__C__S;
          return true;
          endif;
        
        case Inv_AckL1B:
          cbe.acksReceivedL1B := cbe.acksReceivedL1B+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_Fwd_GetSL2dM_x_pI_store__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_GetML1BI__C__I_store:
      switch inmsg.mtype
        case GetM_Ack_ADL2:
          cbe.cl := inmsg.cl;
          cbe.acksExpectedL2 := inmsg.acksExpectedL2;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_GetML1BI__C__I_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            msg := RespAckL1B(adr,GetM_Ack_ADL1B,m,cbe.proxy_msgL1B.src,cbe.cl,VectorCount_cacheL1B(cbe.cacheL1B));
            Send_resp(msg, m);
            cbe.ownerL1B := cbe.proxy_msgL1B.src;
            undefine cbe.proxy_msgL1B;
            Clear_perm(adr, m);
            cbe.State := directoryL1B_M__C__M;
            return true;
          endif;
        
        case GetM_Ack_DL2:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg := RespAckL1B(adr,GetM_Ack_ADL1B,m,cbe.proxy_msgL1B.src,cbe.cl,VectorCount_cacheL1B(cbe.cacheL1B));
          Send_resp(msg, m);
          cbe.ownerL1B := cbe.proxy_msgL1B.src;
          undefine cbe.proxy_msgL1B;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_M__C__M;
          return true;
        
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetML1BI__C__I_store;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_GetML1BI__C__I_store_GetM_Ack_AD:
      switch inmsg.mtype
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_GetML1BI__C__I_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            msg := RespAckL1B(adr,GetM_Ack_ADL1B,m,cbe.proxy_msgL1B.src,cbe.cl,VectorCount_cacheL1B(cbe.cacheL1B));
            Send_resp(msg, m);
            cbe.ownerL1B := cbe.proxy_msgL1B.src;
            undefine cbe.proxy_msgL1B;
            Clear_perm(adr, m);
            cbe.State := directoryL1B_M__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1B_GetML1BI__C__S_store:
      switch inmsg.mtype
        case GetM_Ack_ADL2:
          cbe.acksExpectedL2 := inmsg.acksExpectedL2;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            msg := RespAckL1B(adr,GetM_Ack_ADL1B,m,cbe.proxy_msgL1B.src,cbe.cl,VectorCount_cacheL1B(cbe.cacheL1B));
            Send_resp(msg, m);
            cbe.ownerL1B := cbe.proxy_msgL1B.src;
            undefine cbe.proxy_msgL1B;
            Clear_perm(adr, m);
            cbe.State := directoryL1B_M__C__M;
            return true;
          endif;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_GetML1BI__C__S_store_GetM_Ack_AD;
            return true;
          endif;
        
        case GetM_Ack_DL2:
          Set_perm(store, adr, m);
          msg := RespAckL1B(adr,GetM_Ack_ADL1B,m,cbe.proxy_msgL1B.src,cbe.cl,VectorCount_cacheL1B(cbe.cacheL1B));
          Send_resp(msg, m);
          cbe.ownerL1B := cbe.proxy_msgL1B.src;
          undefine cbe.proxy_msgL1B;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_M__C__M;
          return true;
        
        case InvL2:
          msg_GetML1B := RequestL1B(adr,GetML1B,m,m);
          cbe.acksReceivedL1B := 0;
          msg_GetM_Ack_ADL1B := RespAckL1B(adr,GetM_Ack_ADL1B,m,msg_GetML1B.src,cbe.cl,VectorCount_cacheL1B(cbe.cacheL1B));
          cbe.ownerL1B := msg_GetML1B.src;
          cbe.cl := msg_GetM_Ack_ADL1B.cl;
          cbe.acksExpectedL1B := msg_GetM_Ack_ADL1B.acksExpectedL1B;
          if (cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          Set_perm(store, adr, m);
          msg_PutML1B := RespL1B(adr,PutML1B,m,m,cbe.cl);
          msg_Put_AckL1B := AckL1B(adr,Put_AckL1B,m,msg_PutML1B.src);
          RemoveElement_cacheL1B(cbe.cacheL1B, msg_PutML1B.src);
          if (cbe.ownerL1B = msg_PutML1B.src) then
          cbe.cl := msg_PutML1B.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := RespL2(adr,Inv_AckL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetML1BI__C__I_store;
          return true;
          endif;
          endif;
        
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetML1BI__C__S_store;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_GetML1BI__C__S_store_GetM_Ack_AD:
      switch inmsg.mtype
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_GetML1BI__C__S_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            msg := RespAckL1B(adr,GetM_Ack_ADL1B,m,cbe.proxy_msgL1B.src,cbe.cl,VectorCount_cacheL1B(cbe.cacheL1B));
            Send_resp(msg, m);
            cbe.ownerL1B := cbe.proxy_msgL1B.src;
            undefine cbe.proxy_msgL1B;
            Clear_perm(adr, m);
            cbe.State := directoryL1B_M__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1B_GetSL1BE_GetS__C__M:
      switch inmsg.mtype
        case WBL1B:
          if !(inmsg.src = cbe.ownerL1B) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_GetSL1BE_GetS__C__M;
            return true;
          endif;
          if (inmsg.src = cbe.ownerL1B) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1B_S__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1B_GetSL1BI__C__I_store:
      switch inmsg.mtype
        case GetM_Ack_ADL2:
          cbe.cl := inmsg.cl;
          cbe.acksExpectedL2 := inmsg.acksExpectedL2;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_GetSL1BI__C__I_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            msg := RespL1B(adr,GetM_Ack_DL1B,m,cbe.proxy_msgL1B.src,cbe.cl);
            Send_resp(msg, m);
            cbe.ownerL1B := cbe.proxy_msgL1B.src;
            undefine cbe.proxy_msgL1B;
            Clear_perm(adr, m);
            cbe.State := directoryL1B_E__C__M;
            return true;
          endif;
        
        case GetM_Ack_DL2:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg := RespL1B(adr,GetM_Ack_DL1B,m,cbe.proxy_msgL1B.src,cbe.cl);
          Send_resp(msg, m);
          cbe.ownerL1B := cbe.proxy_msgL1B.src;
          undefine cbe.proxy_msgL1B;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_E__C__M;
          return true;
        
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetSL1BI__C__I_store;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_GetSL1BI__C__I_store_GetM_Ack_AD:
      switch inmsg.mtype
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            msg := RespL1B(adr,GetM_Ack_DL1B,m,cbe.proxy_msgL1B.src,cbe.cl);
            Send_resp(msg, m);
            cbe.ownerL1B := cbe.proxy_msgL1B.src;
            undefine cbe.proxy_msgL1B;
            Clear_perm(adr, m);
            cbe.State := directoryL1B_E__C__M;
            return true;
          endif;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_GetSL1BI__C__I_store_GetM_Ack_AD;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1B_GetSL1BI__C__S_store:
      switch inmsg.mtype
        case GetM_Ack_ADL2:
          cbe.acksExpectedL2 := inmsg.acksExpectedL2;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            msg := RespL1B(adr,GetM_Ack_DL1B,m,cbe.proxy_msgL1B.src,cbe.cl);
            Send_resp(msg, m);
            cbe.ownerL1B := cbe.proxy_msgL1B.src;
            undefine cbe.proxy_msgL1B;
            Clear_perm(adr, m);
            cbe.State := directoryL1B_E__C__M;
            return true;
          endif;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_GetSL1BI__C__S_store_GetM_Ack_AD;
            return true;
          endif;
        
        case GetM_Ack_DL2:
          Set_perm(store, adr, m);
          msg := RespL1B(adr,GetM_Ack_DL1B,m,cbe.proxy_msgL1B.src,cbe.cl);
          Send_resp(msg, m);
          cbe.ownerL1B := cbe.proxy_msgL1B.src;
          undefine cbe.proxy_msgL1B;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_E__C__M;
          return true;
        
        case InvL2:
          msg_GetML1B := RequestL1B(adr,GetML1B,m,m);
          cbe.acksReceivedL1B := 0;
          msg_GetM_Ack_ADL1B := RespAckL1B(adr,GetM_Ack_ADL1B,m,msg_GetML1B.src,cbe.cl,VectorCount_cacheL1B(cbe.cacheL1B));
          cbe.ownerL1B := msg_GetML1B.src;
          cbe.cl := msg_GetM_Ack_ADL1B.cl;
          cbe.acksExpectedL1B := msg_GetM_Ack_ADL1B.acksExpectedL1B;
          if (cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          Set_perm(store, adr, m);
          msg_PutML1B := RespL1B(adr,PutML1B,m,m,cbe.cl);
          msg_Put_AckL1B := AckL1B(adr,Put_AckL1B,m,msg_PutML1B.src);
          RemoveElement_cacheL1B(cbe.cacheL1B, msg_PutML1B.src);
          if (cbe.ownerL1B = msg_PutML1B.src) then
          cbe.cl := msg_PutML1B.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := RespL2(adr,Inv_AckL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetSL1BI__C__I_store;
          return true;
          endif;
          endif;
        
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetSL1BI__C__S_store;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_GetSL1BI__C__S_store_GetM_Ack_AD:
      switch inmsg.mtype
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            msg := RespL1B(adr,GetM_Ack_DL1B,m,cbe.proxy_msgL1B.src,cbe.cl);
            Send_resp(msg, m);
            cbe.ownerL1B := cbe.proxy_msgL1B.src;
            undefine cbe.proxy_msgL1B;
            Clear_perm(adr, m);
            cbe.State := directoryL1B_E__C__M;
            return true;
          endif;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_GetSL1BI__C__S_store_GetM_Ack_AD;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1B_GetSL1BM_GetS__C__M:
      switch inmsg.mtype
        case WBL1B:
          if !(inmsg.src = cbe.ownerL1B) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_GetSL1BM_GetS__C__M;
            return true;
          endif;
          if (inmsg.src = cbe.ownerL1B) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1B_S__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1B_I__C__I:
      switch inmsg.mtype
        case GetML1B:
          msg := RequestL2(adr,GetML2,m,to_m_directoryL2(directoryL2));
          Send_req(msg, m);
          cbe.acksReceivedL2 := 0;
          cbe.proxy_msgL1B := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetML1BI__C__I_store;
          return true;
        
        case GetSL1B:
          msg := RequestL2(adr,GetML2,m,to_m_directoryL2(directoryL2));
          Send_req(msg, m);
          cbe.acksReceivedL2 := 0;
          cbe.proxy_msgL1B := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetSL1BI__C__I_store;
          return true;
        
        case PutEL1B:
          msg := AckL1B(adr,Put_AckL1B,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1B(cbe.cacheL1B, inmsg.src);
          if !(cbe.ownerL1B = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__I;
            return true;
          endif;
          if (cbe.ownerL1B = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__I;
            return true;
          endif;
        
        case PutML1B:
          msg := AckL1B(adr,Put_AckL1B,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1B(cbe.cacheL1B, inmsg.src);
          if !(cbe.ownerL1B = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__I;
            return true;
          endif;
          if (cbe.ownerL1B = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__I;
            return true;
          endif;
        
        case PutSL1B:
          msg := AckL1B(adr,Put_AckL1B,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1B(cbe.cacheL1B, inmsg.src);
          if (VectorCount_cacheL1B(cbe.cacheL1B) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__I;
            return true;
          endif;
          if !(VectorCount_cacheL1B(cbe.cacheL1B) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__I;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1B_I__C__M:
      switch inmsg.mtype
        case Fwd_GetML2:
          msg_GetML1B := RequestL1B(adr,GetML1B,m,m);
          cbe.acksReceivedL1B := 0;
          msg_GetM_Ack_ADL1B := RespAckL1B(adr,GetM_Ack_ADL1B,m,msg_GetML1B.src,cbe.cl,VectorCount_cacheL1B(cbe.cacheL1B));
          cbe.ownerL1B := msg_GetML1B.src;
          cbe.cl := msg_GetM_Ack_ADL1B.cl;
          cbe.acksExpectedL1B := msg_GetM_Ack_ADL1B.acksExpectedL1B;
          if (cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          Set_perm(store, adr, m);
          msg_PutML1B := RespL1B(adr,PutML1B,m,m,cbe.cl);
          msg_Put_AckL1B := AckL1B(adr,Put_AckL1B,m,msg_PutML1B.src);
          RemoveElement_cacheL1B(cbe.cacheL1B, msg_PutML1B.src);
          if (cbe.ownerL1B = msg_PutML1B.src) then
          cbe.cl := msg_PutML1B.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := RespL2(adr,GetM_Ack_DL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_I__C__I;
          return true;
          endif;
          endif;
        
        case Fwd_GetSL2:
          msg_GetML1B := RequestL1B(adr,GetML1B,m,m);
          cbe.acksReceivedL1B := 0;
          msg_GetM_Ack_ADL1B := RespAckL1B(adr,GetM_Ack_ADL1B,m,msg_GetML1B.src,cbe.cl,VectorCount_cacheL1B(cbe.cacheL1B));
          cbe.ownerL1B := msg_GetML1B.src;
          cbe.cl := msg_GetM_Ack_ADL1B.cl;
          cbe.acksExpectedL1B := msg_GetM_Ack_ADL1B.acksExpectedL1B;
          if (cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          Set_perm(store, adr, m);
          msg_PutML1B := RespL1B(adr,PutML1B,m,m,cbe.cl);
          msg_Put_AckL1B := AckL1B(adr,Put_AckL1B,m,msg_PutML1B.src);
          RemoveElement_cacheL1B(cbe.cacheL1B, msg_PutML1B.src);
          if (cbe.ownerL1B = msg_PutML1B.src) then
          cbe.cl := msg_PutML1B.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := RespL2(adr,GetS_AckL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL2(adr,WBL2,m,to_m_directoryL2(directoryL2),cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_I__C__S;
          return true;
          endif;
          endif;
        
        case GetML1B:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1B := inmsg;
          msg := RespAckL1B(adr,GetM_Ack_ADL1B,m,cbe.proxy_msgL1B.src,cbe.cl,VectorCount_cacheL1B(cbe.cacheL1B));
          Send_resp(msg, m);
          cbe.ownerL1B := cbe.proxy_msgL1B.src;
          undefine cbe.proxy_msgL1B;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_M__C__M;
          return true;
        
        case GetSL1B:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1B := inmsg;
          msg := RespL1B(adr,GetM_Ack_DL1B,m,cbe.proxy_msgL1B.src,cbe.cl);
          Send_resp(msg, m);
          cbe.ownerL1B := cbe.proxy_msgL1B.src;
          undefine cbe.proxy_msgL1B;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_E__C__M;
          return true;
        
        case PutEL1B:
          msg := AckL1B(adr,Put_AckL1B,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1B(cbe.cacheL1B, inmsg.src);
          if !(cbe.ownerL1B = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__M;
            return true;
          endif;
          if (cbe.ownerL1B = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__M;
            return true;
          endif;
        
        case PutML1B:
          msg := AckL1B(adr,Put_AckL1B,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1B(cbe.cacheL1B, inmsg.src);
          if !(cbe.ownerL1B = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__M;
            return true;
          endif;
          if (cbe.ownerL1B = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__M;
            return true;
          endif;
        
        case PutSL1B:
          msg := AckL1B(adr,Put_AckL1B,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1B(cbe.cacheL1B, inmsg.src);
          if (VectorCount_cacheL1B(cbe.cacheL1B) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__M;
            return true;
          endif;
          if !(VectorCount_cacheL1B(cbe.cacheL1B) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1B_I__C__S:
      switch inmsg.mtype
        case GetML1B:
          msg := RequestL2(adr,GetML2,m,to_m_directoryL2(directoryL2));
          Send_req(msg, m);
          cbe.acksReceivedL2 := 0;
          cbe.proxy_msgL1B := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetML1BI__C__S_store;
          return true;
        
        case GetSL1B:
          msg := RequestL2(adr,GetML2,m,to_m_directoryL2(directoryL2));
          Send_req(msg, m);
          cbe.acksReceivedL2 := 0;
          cbe.proxy_msgL1B := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetSL1BI__C__S_store;
          return true;
        
        case InvL2:
          msg_GetML1B := RequestL1B(adr,GetML1B,m,m);
          cbe.acksReceivedL1B := 0;
          msg_GetM_Ack_ADL1B := RespAckL1B(adr,GetM_Ack_ADL1B,m,msg_GetML1B.src,cbe.cl,VectorCount_cacheL1B(cbe.cacheL1B));
          cbe.ownerL1B := msg_GetML1B.src;
          cbe.cl := msg_GetM_Ack_ADL1B.cl;
          cbe.acksExpectedL1B := msg_GetM_Ack_ADL1B.acksExpectedL1B;
          if (cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          cbe.acksExpectedL1B := 0;
          cbe.acksReceivedL1B := 0;
          Set_perm(store, adr, m);
          msg_PutML1B := RespL1B(adr,PutML1B,m,m,cbe.cl);
          msg_Put_AckL1B := AckL1B(adr,Put_AckL1B,m,msg_PutML1B.src);
          RemoveElement_cacheL1B(cbe.cacheL1B, msg_PutML1B.src);
          if (cbe.ownerL1B = msg_PutML1B.src) then
          cbe.cl := msg_PutML1B.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := RespL2(adr,Inv_AckL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_I__C__I;
          return true;
          endif;
          endif;
        
        case PutEL1B:
          msg := AckL1B(adr,Put_AckL1B,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1B(cbe.cacheL1B, inmsg.src);
          if !(cbe.ownerL1B = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__S;
            return true;
          endif;
          if (cbe.ownerL1B = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__S;
            return true;
          endif;
        
        case PutML1B:
          msg := AckL1B(adr,Put_AckL1B,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1B(cbe.cacheL1B, inmsg.src);
          if !(cbe.ownerL1B = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__S;
            return true;
          endif;
          if (cbe.ownerL1B = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__S;
            return true;
          endif;
        
        case PutSL1B:
          msg := AckL1B(adr,Put_AckL1B,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1B(cbe.cacheL1B, inmsg.src);
          if !(VectorCount_cacheL1B(cbe.cacheL1B) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__S;
            return true;
          endif;
          if (VectorCount_cacheL1B(cbe.cacheL1B) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__S;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1B_M__C__M:
      switch inmsg.mtype
        case Fwd_GetML2:
          msg_GetML1B := RequestL1B(adr,GetML1B,m,m);
          cbe.acksReceivedL1B := 0;
          msg := RequestL1B(adr,Fwd_GetML1B,msg_GetML1B.src,cbe.ownerL1B);
          Send_fwd(msg, m);
          cbe.ownerL1B := msg_GetML1B.src;
          cbe.proxy_msgL2 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_Fwd_GetML2dM_x_pI_store__C__M;
          return true;
        
        case Fwd_GetSL2:
          msg_GetML1B := RequestL1B(adr,GetML1B,m,m);
          cbe.acksReceivedL1B := 0;
          msg := RequestL1B(adr,Fwd_GetML1B,msg_GetML1B.src,cbe.ownerL1B);
          Send_fwd(msg, m);
          cbe.ownerL1B := msg_GetML1B.src;
          cbe.proxy_msgL2 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_Fwd_GetSL2dM_x_pI_store__C__M;
          return true;
        
        case GetML1B:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1B := inmsg;
          msg := RequestL1B(adr,Fwd_GetML1B,cbe.proxy_msgL1B.src,cbe.ownerL1B);
          Send_fwd(msg, m);
          cbe.ownerL1B := cbe.proxy_msgL1B.src;
          undefine cbe.proxy_msgL1B;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_M__C__M;
          return true;
        
        case GetSL1B:
          Set_perm(load, adr, m);
          cbe.proxy_msgL1B := inmsg;
          msg := RequestL1B(adr,Fwd_GetSL1B,cbe.proxy_msgL1B.src,cbe.ownerL1B);
          Send_fwd(msg, m);
          AddElement_cacheL1B(cbe.cacheL1B, cbe.proxy_msgL1B.src);
          AddElement_cacheL1B(cbe.cacheL1B, cbe.ownerL1B);
          undefine cbe.proxy_msgL1B;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_GetSL1BM_GetS__C__M;
          return true;
        
        case PutEL1B:
          msg := AckL1B(adr,Put_AckL1B,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1B(cbe.cacheL1B, inmsg.src);
          if (cbe.ownerL1B = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__M;
            return true;
          endif;
          if !(cbe.ownerL1B = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_M__C__M;
            return true;
          endif;
        
        case PutML1B:
          msg := AckL1B(adr,Put_AckL1B,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1B(cbe.cacheL1B, inmsg.src);
          if !(cbe.ownerL1B = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_M__C__M;
            return true;
          endif;
          if (cbe.ownerL1B = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__M;
            return true;
          endif;
        
        case PutSL1B:
          msg := AckL1B(adr,Put_AckL1B,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1B(cbe.cacheL1B, inmsg.src);
          if (cbe.ownerL1B = inmsg.src) then
            cbe.cl := inmsg.cl;
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__M;
            return true;
          endif;
          if !(cbe.ownerL1B = inmsg.src) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_M__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1B_S__C__M:
      switch inmsg.mtype
        case Fwd_GetML2:
          msg_GetML1B := RequestL1B(adr,GetML1B,m,m);
          cbe.acksReceivedL1B := 0;
          if !(IsElement_cacheL1B(cbe.cacheL1B, msg_GetML1B.src)) then
            msg_GetM_Ack_ADL1B := RespAckL1B(adr,GetM_Ack_ADL1B,m,msg_GetML1B.src,cbe.cl,VectorCount_cacheL1B(cbe.cacheL1B));
            msg := AckL1B(adr,InvL1B,msg_GetML1B.src,msg_GetML1B.src);
            Multicast_fwd_v_cacheL1B(msg, cbe.cacheL1B, m);
            cbe.ownerL1B := msg_GetML1B.src;
            ClearVector_cacheL1B(cbe.cacheL1B);
            cbe.cl := msg_GetM_Ack_ADL1B.cl;
            cbe.acksExpectedL1B := msg_GetM_Ack_ADL1B.acksExpectedL1B;
            if (cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
              cbe.acksExpectedL1B := 0;
              cbe.acksReceivedL1B := 0;
              cbe.acksExpectedL1B := 0;
              cbe.acksReceivedL1B := 0;
              cbe.acksExpectedL1B := 0;
              cbe.acksReceivedL1B := 0;
              cbe.acksExpectedL1B := 0;
              cbe.acksReceivedL1B := 0;
              cbe.acksExpectedL1B := 0;
              cbe.acksReceivedL1B := 0;
              Set_perm(store, adr, m);
              msg_PutML1B := RespL1B(adr,PutML1B,m,m,cbe.cl);
              msg_Put_AckL1B := AckL1B(adr,Put_AckL1B,m,msg_PutML1B.src);
              RemoveElement_cacheL1B(cbe.cacheL1B, msg_PutML1B.src);
              if (cbe.ownerL1B = msg_PutML1B.src) then
              cbe.cl := msg_PutML1B.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := RespL2(adr,GetM_Ack_DL2,m,cbe.proxy_msgL2.src,cbe.cl);
              Send_resp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1B_I__C__I;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1B_Fwd_GetML2dM_x_pI_store_GetM_Ack_AD__C__M;
              return true;
            endif;
          endif;
          if (IsElement_cacheL1B(cbe.cacheL1B, msg_GetML1B.src)) then
            RemoveElement_cacheL1B(cbe.cacheL1B, msg_GetML1B.src);
            msg_GetM_Ack_ADL1B := RespAckL1B(adr,GetM_Ack_ADL1B,m,msg_GetML1B.src,cbe.cl,VectorCount_cacheL1B(cbe.cacheL1B));
            msg := AckL1B(adr,InvL1B,msg_GetML1B.src,msg_GetML1B.src);
            Multicast_fwd_v_cacheL1B(msg, cbe.cacheL1B, m);
            cbe.ownerL1B := msg_GetML1B.src;
            ClearVector_cacheL1B(cbe.cacheL1B);
            cbe.cl := msg_GetM_Ack_ADL1B.cl;
            cbe.acksExpectedL1B := msg_GetM_Ack_ADL1B.acksExpectedL1B;
            if (cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
              cbe.acksExpectedL1B := 0;
              cbe.acksReceivedL1B := 0;
              cbe.acksExpectedL1B := 0;
              cbe.acksReceivedL1B := 0;
              cbe.acksExpectedL1B := 0;
              cbe.acksReceivedL1B := 0;
              cbe.acksExpectedL1B := 0;
              cbe.acksReceivedL1B := 0;
              cbe.acksExpectedL1B := 0;
              cbe.acksReceivedL1B := 0;
              Set_perm(store, adr, m);
              msg_PutML1B := RespL1B(adr,PutML1B,m,m,cbe.cl);
              msg_Put_AckL1B := AckL1B(adr,Put_AckL1B,m,msg_PutML1B.src);
              RemoveElement_cacheL1B(cbe.cacheL1B, msg_PutML1B.src);
              if (cbe.ownerL1B = msg_PutML1B.src) then
              cbe.cl := msg_PutML1B.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := RespL2(adr,GetM_Ack_DL2,m,cbe.proxy_msgL2.src,cbe.cl);
              Send_resp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1B_I__C__I;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1B_Fwd_GetML2dM_x_pI_store_GetM_Ack_AD__C__M;
              return true;
            endif;
          endif;
        
        case Fwd_GetSL2:
          msg_GetML1B := RequestL1B(adr,GetML1B,m,m);
          cbe.acksReceivedL1B := 0;
          if (IsElement_cacheL1B(cbe.cacheL1B, msg_GetML1B.src)) then
            RemoveElement_cacheL1B(cbe.cacheL1B, msg_GetML1B.src);
            msg_GetM_Ack_ADL1B := RespAckL1B(adr,GetM_Ack_ADL1B,m,msg_GetML1B.src,cbe.cl,VectorCount_cacheL1B(cbe.cacheL1B));
            msg := AckL1B(adr,InvL1B,msg_GetML1B.src,msg_GetML1B.src);
            Multicast_fwd_v_cacheL1B(msg, cbe.cacheL1B, m);
            cbe.ownerL1B := msg_GetML1B.src;
            ClearVector_cacheL1B(cbe.cacheL1B);
            cbe.cl := msg_GetM_Ack_ADL1B.cl;
            cbe.acksExpectedL1B := msg_GetM_Ack_ADL1B.acksExpectedL1B;
            if !(cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1B_Fwd_GetSL2dM_x_pI_store_GetM_Ack_AD__C__M;
              return true;
            endif;
            if (cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
              cbe.acksExpectedL1B := 0;
              cbe.acksReceivedL1B := 0;
              cbe.acksExpectedL1B := 0;
              cbe.acksReceivedL1B := 0;
              cbe.acksExpectedL1B := 0;
              cbe.acksReceivedL1B := 0;
              cbe.acksExpectedL1B := 0;
              cbe.acksReceivedL1B := 0;
              cbe.acksExpectedL1B := 0;
              cbe.acksReceivedL1B := 0;
              Set_perm(store, adr, m);
              msg_PutML1B := RespL1B(adr,PutML1B,m,m,cbe.cl);
              msg_Put_AckL1B := AckL1B(adr,Put_AckL1B,m,msg_PutML1B.src);
              RemoveElement_cacheL1B(cbe.cacheL1B, msg_PutML1B.src);
              if (cbe.ownerL1B = msg_PutML1B.src) then
              cbe.cl := msg_PutML1B.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := RespL2(adr,GetS_AckL2,m,cbe.proxy_msgL2.src,cbe.cl);
              Send_resp(msg, m);
              msg := RespL2(adr,WBL2,m,to_m_directoryL2(directoryL2),cbe.cl);
              Send_resp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1B_I__C__S;
              return true;
              endif;
            endif;
          endif;
          if !(IsElement_cacheL1B(cbe.cacheL1B, msg_GetML1B.src)) then
            msg_GetM_Ack_ADL1B := RespAckL1B(adr,GetM_Ack_ADL1B,m,msg_GetML1B.src,cbe.cl,VectorCount_cacheL1B(cbe.cacheL1B));
            msg := AckL1B(adr,InvL1B,msg_GetML1B.src,msg_GetML1B.src);
            Multicast_fwd_v_cacheL1B(msg, cbe.cacheL1B, m);
            cbe.ownerL1B := msg_GetML1B.src;
            ClearVector_cacheL1B(cbe.cacheL1B);
            cbe.cl := msg_GetM_Ack_ADL1B.cl;
            cbe.acksExpectedL1B := msg_GetM_Ack_ADL1B.acksExpectedL1B;
            if !(cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1B_Fwd_GetSL2dM_x_pI_store_GetM_Ack_AD__C__M;
              return true;
            endif;
            if (cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
              cbe.acksExpectedL1B := 0;
              cbe.acksReceivedL1B := 0;
              cbe.acksExpectedL1B := 0;
              cbe.acksReceivedL1B := 0;
              cbe.acksExpectedL1B := 0;
              cbe.acksReceivedL1B := 0;
              cbe.acksExpectedL1B := 0;
              cbe.acksReceivedL1B := 0;
              cbe.acksExpectedL1B := 0;
              cbe.acksReceivedL1B := 0;
              Set_perm(store, adr, m);
              msg_PutML1B := RespL1B(adr,PutML1B,m,m,cbe.cl);
              msg_Put_AckL1B := AckL1B(adr,Put_AckL1B,m,msg_PutML1B.src);
              RemoveElement_cacheL1B(cbe.cacheL1B, msg_PutML1B.src);
              if (cbe.ownerL1B = msg_PutML1B.src) then
              cbe.cl := msg_PutML1B.cl;
              cbe.proxy_msgL2 := inmsg;
              msg := RespL2(adr,GetS_AckL2,m,cbe.proxy_msgL2.src,cbe.cl);
              Send_resp(msg, m);
              msg := RespL2(adr,WBL2,m,to_m_directoryL2(directoryL2),cbe.cl);
              Send_resp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1B_I__C__S;
              return true;
              endif;
            endif;
          endif;
        
        case GetML1B:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1B := inmsg;
          if !(IsElement_cacheL1B(cbe.cacheL1B, cbe.proxy_msgL1B.src)) then
            msg := RespAckL1B(adr,GetM_Ack_ADL1B,m,cbe.proxy_msgL1B.src,cbe.cl,VectorCount_cacheL1B(cbe.cacheL1B));
            Send_resp(msg, m);
            msg := AckL1B(adr,InvL1B,cbe.proxy_msgL1B.src,cbe.proxy_msgL1B.src);
            Multicast_fwd_v_cacheL1B(msg, cbe.cacheL1B, m);
            cbe.ownerL1B := cbe.proxy_msgL1B.src;
            ClearVector_cacheL1B(cbe.cacheL1B);
            undefine cbe.proxy_msgL1B;
            Clear_perm(adr, m);
            cbe.State := directoryL1B_M__C__M;
            return true;
          endif;
          if (IsElement_cacheL1B(cbe.cacheL1B, cbe.proxy_msgL1B.src)) then
            RemoveElement_cacheL1B(cbe.cacheL1B, cbe.proxy_msgL1B.src);
            msg := RespAckL1B(adr,GetM_Ack_ADL1B,m,cbe.proxy_msgL1B.src,cbe.cl,VectorCount_cacheL1B(cbe.cacheL1B));
            Send_resp(msg, m);
            msg := AckL1B(adr,InvL1B,cbe.proxy_msgL1B.src,cbe.proxy_msgL1B.src);
            Multicast_fwd_v_cacheL1B(msg, cbe.cacheL1B, m);
            cbe.ownerL1B := cbe.proxy_msgL1B.src;
            ClearVector_cacheL1B(cbe.cacheL1B);
            undefine cbe.proxy_msgL1B;
            Clear_perm(adr, m);
            cbe.State := directoryL1B_M__C__M;
            return true;
          endif;
        
        case GetSL1B:
          Set_perm(load, adr, m);
          cbe.proxy_msgL1B := inmsg;
          msg := RespL1B(adr,GetS_AckL1B,m,cbe.proxy_msgL1B.src,cbe.cl);
          Send_resp(msg, m);
          AddElement_cacheL1B(cbe.cacheL1B, cbe.proxy_msgL1B.src);
          undefine cbe.proxy_msgL1B;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_S__C__M;
          return true;
        
        case PutEL1B:
          msg := AckL1B(adr,Put_AckL1B,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1B(cbe.cacheL1B, inmsg.src);
          if (VectorCount_cacheL1B(cbe.cacheL1B) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__M;
            return true;
          endif;
          if !(VectorCount_cacheL1B(cbe.cacheL1B) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_S__C__M;
            return true;
          endif;
        
        case PutML1B:
          msg := AckL1B(adr,Put_AckL1B,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1B(cbe.cacheL1B, inmsg.src);
          if !(VectorCount_cacheL1B(cbe.cacheL1B) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_S__C__M;
            return true;
          endif;
          if (VectorCount_cacheL1B(cbe.cacheL1B) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__M;
            return true;
          endif;
        
        case PutSL1B:
          msg := AckL1B(adr,Put_AckL1B,m,inmsg.src);
          Send_fwd(msg, m);
          RemoveElement_cacheL1B(cbe.cacheL1B, inmsg.src);
          if (VectorCount_cacheL1B(cbe.cacheL1B) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_I__C__M;
            return true;
          endif;
          if !(VectorCount_cacheL1B(cbe.cacheL1B) = 0) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_S__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1B_evictI__C__M_evict:
      switch inmsg.mtype
        case Fwd_GetML2:
          msg := RespL2(adr,GetM_Ack_DL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_evictI__C__M_evict_x_I;
          return true;
        
        case Fwd_GetSL2:
          msg := RespL2(adr,GetS_AckL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL2(adr,WBL2,m,to_m_directoryL2(directoryL2),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_evictI__C__S_evict;
          return true;
        
        case Put_AckL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1B_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_evictI__C__M_evict_x_I:
      switch inmsg.mtype
        case Put_AckL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1B_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_evictI__C__S_evict:
      switch inmsg.mtype
        case InvL2:
          msg := RespL2(adr,Inv_AckL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_evictI__C__S_evict_x_I;
          return true;
        
        case Put_AckL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1B_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_evictI__C__S_evict_x_I:
      switch inmsg.mtype
        case Put_AckL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1B_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1B_evictdM_x_pI_store_GetM_Ack_AD__C__M:
      switch inmsg.mtype
        case Inv_AckL1B:
          cbe.acksReceivedL1B := cbe.acksReceivedL1B+1;
          if !(cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
            Clear_perm(adr, m);
            cbe.State := directoryL1B_evictdM_x_pI_store_GetM_Ack_AD__C__M;
            return true;
          endif;
          if (cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            Set_perm(store, adr, m);
            msg_PutML1B := RespL1B(adr,PutML1B,m,m,cbe.cl);
            msg_Put_AckL1B := AckL1B(adr,Put_AckL1B,m,msg_PutML1B.src);
            RemoveElement_cacheL1B(cbe.cacheL1B, msg_PutML1B.src);
            if (cbe.ownerL1B = msg_PutML1B.src) then
            cbe.cl := msg_PutML1B.cl;
            msg := RespL2(adr,PutML2,m,to_m_directoryL2(directoryL2),cbe.cl);
            Send_req(msg, m);
            Clear_perm(adr, m);
            cbe.State := directoryL1B_evictI__C__M_evict;
            return true;
            endif;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1B_evictdM_x_pI_store__C__M:
      switch inmsg.mtype
        case GetM_Ack_DL1B:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg_PutML1B := RespL1B(adr,PutML1B,m,m,cbe.cl);
          msg_Put_AckL1B := AckL1B(adr,Put_AckL1B,m,msg_PutML1B.src);
          RemoveElement_cacheL1B(cbe.cacheL1B, msg_PutML1B.src);
          if (cbe.ownerL1B = msg_PutML1B.src) then
          cbe.cl := msg_PutML1B.cl;
          msg := RespL2(adr,PutML2,m,to_m_directoryL2(directoryL2),cbe.cl);
          Send_req(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1B_evictI__C__M_evict;
          return true;
          endif;
        
        case Inv_AckL1B:
          cbe.acksReceivedL1B := cbe.acksReceivedL1B+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1B_evictdM_x_pI_store__C__M;
          return true;
        
        else return false;
      endswitch;
      
    endswitch;
    endalias;
    endalias;
    endalias;
    return false;
    end;
    
    function FSM_MSG_cacheL1B(inmsg:Message; mTyped:OBJSET_cacheL1B) : boolean;
    var msg: Message;
    begin
      alias adr: inmsg.adr do
      alias cbe: i_cacheL1B[mTyped].cb[adr] do
    alias m : to_m_cacheL1B(mTyped) do
    switch cbe.State
      case cacheL1B_E:
      switch inmsg.mtype
        case Fwd_GetML1B:
          msg := RespL1B(adr,GetM_Ack_DL1B,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1B_I;
          return true;
        
        case Fwd_GetSL1B:
          msg := RespL1B(adr,GetS_AckL1B,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL1B(adr,WBL1B,m,to_m_directoryL1B(directoryL1B),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := cacheL1B_S;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1B_E_evict:
      switch inmsg.mtype
        case Fwd_GetML1B:
          msg := RespL1B(adr,GetM_Ack_DL1B,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1B_E_evict_x_I;
          return true;
        
        case Fwd_GetSL1B:
          msg := RespL1B(adr,GetS_AckL1B,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL1B(adr,WBL1B,m,to_m_directoryL1B(directoryL1B),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1B_S_evict;
          return true;
        
        case Put_AckL1B:
          Clear_perm(adr, m);
          cbe.State := cacheL1B_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1B_E_evict_x_I:
      switch inmsg.mtype
        case Put_AckL1B:
          Clear_perm(adr, m);
          cbe.State := cacheL1B_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1B_I:
      switch inmsg.mtype
        else return false;
      endswitch;
      
      case cacheL1B_I_load:
      switch inmsg.mtype
        case GetM_Ack_DL1B:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL1B_E;
          return true;
        
        case GetS_AckL1B:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := cacheL1B_S;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1B_I_store:
      switch inmsg.mtype
        case GetM_Ack_ADL1B:
          cbe.cl := inmsg.cl;
          cbe.acksExpectedL1B := inmsg.acksExpectedL1B;
          if !(cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
            Clear_perm(adr, m);
            cbe.State := cacheL1B_I_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            Set_perm(store, adr, m);
            Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
            cbe.State := cacheL1B_M;
            return true;
          endif;
        
        case GetM_Ack_DL1B:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL1B_M;
          return true;
        
        case Inv_AckL1B:
          cbe.acksReceivedL1B := cbe.acksReceivedL1B+1;
          Clear_perm(adr, m);
          cbe.State := cacheL1B_I_store;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1B_I_store_GetM_Ack_AD:
      switch inmsg.mtype
        case Inv_AckL1B:
          cbe.acksReceivedL1B := cbe.acksReceivedL1B+1;
          if (cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            Set_perm(store, adr, m);
            Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
            cbe.State := cacheL1B_M;
            return true;
          endif;
          if !(cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
            Clear_perm(adr, m);
            cbe.State := cacheL1B_I_store_GetM_Ack_AD;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case cacheL1B_M:
      switch inmsg.mtype
        case Fwd_GetML1B:
          msg := RespL1B(adr,GetM_Ack_DL1B,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1B_I;
          return true;
        
        case Fwd_GetSL1B:
          msg := RespL1B(adr,GetS_AckL1B,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL1B(adr,WBL1B,m,to_m_directoryL1B(directoryL1B),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := cacheL1B_S;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1B_M_evict:
      switch inmsg.mtype
        case Fwd_GetML1B:
          msg := RespL1B(adr,GetM_Ack_DL1B,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1B_M_evict_x_I;
          return true;
        
        case Fwd_GetSL1B:
          msg := RespL1B(adr,GetS_AckL1B,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL1B(adr,WBL1B,m,to_m_directoryL1B(directoryL1B),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1B_S_evict;
          return true;
        
        case Put_AckL1B:
          Clear_perm(adr, m);
          cbe.State := cacheL1B_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1B_M_evict_x_I:
      switch inmsg.mtype
        case Put_AckL1B:
          Clear_perm(adr, m);
          cbe.State := cacheL1B_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1B_S:
      switch inmsg.mtype
        case InvL1B:
          msg := RespL1B(adr,Inv_AckL1B,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1B_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1B_S_evict:
      switch inmsg.mtype
        case InvL1B:
          msg := RespL1B(adr,Inv_AckL1B,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1B_S_evict_x_I;
          return true;
        
        case Put_AckL1B:
          Clear_perm(adr, m);
          cbe.State := cacheL1B_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1B_S_evict_x_I:
      switch inmsg.mtype
        case Put_AckL1B:
          Clear_perm(adr, m);
          cbe.State := cacheL1B_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1B_S_store:
      switch inmsg.mtype
        case GetM_Ack_ADL1B:
          cbe.acksExpectedL1B := inmsg.acksExpectedL1B;
          if (cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            Set_perm(store, adr, m);
            Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
            cbe.State := cacheL1B_M;
            return true;
          endif;
          if !(cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
            Clear_perm(adr, m);
            cbe.State := cacheL1B_S_store_GetM_Ack_AD;
            return true;
          endif;
        
        case GetM_Ack_DL1B:
          Set_perm(store, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL1B_M;
          return true;
        
        case InvL1B:
          msg := RespL1B(adr,Inv_AckL1B,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1B_I_store;
          return true;
        
        case Inv_AckL1B:
          cbe.acksReceivedL1B := cbe.acksReceivedL1B+1;
          Clear_perm(adr, m);
          cbe.State := cacheL1B_S_store;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1B_S_store_GetM_Ack_AD:
      switch inmsg.mtype
        case Inv_AckL1B:
          cbe.acksReceivedL1B := cbe.acksReceivedL1B+1;
          if !(cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
            Clear_perm(adr, m);
            cbe.State := cacheL1B_S_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL1B = cbe.acksReceivedL1B) then
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            cbe.acksExpectedL1B := 0;
            cbe.acksReceivedL1B := 0;
            Set_perm(store, adr, m);
            Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
            cbe.State := cacheL1B_M;
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
    
    function FSM_MSG_directoryL1A(inmsg:Message; mTyped:OBJSET_directoryL1A) : boolean;
    var msg_GetML1A: Message;
    var msg: Message;
    var msg_PutML1A: Message;
    var msg_Put_AckL1A: Message;
    var msg_GetM_Ack_ADL1A: Message;
    begin
      alias adr: inmsg.adr do
      alias cbe: i_directoryL1A[mTyped].cb[adr] do
    alias m : to_m_directoryL1A(mTyped) do
    switch cbe.State
      case directoryL1A_E__C__M:
      switch inmsg.mtype
        case Fwd_GetML2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          msg := RequestL1A(adr,Fwd_GetML1A,msg_GetML1A.src,cbe.ownerL1A);
          Send_fwd(msg, m);
          cbe.ownerL1A := msg_GetML1A.src;
          cbe.proxy_msgL2 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_Fwd_GetML2dM_x_pI_store__C__M;
          return true;
        
        case Fwd_GetSL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          msg := RequestL1A(adr,Fwd_GetML1A,msg_GetML1A.src,cbe.ownerL1A);
          Send_fwd(msg, m);
          cbe.ownerL1A := msg_GetML1A.src;
          cbe.proxy_msgL2 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_Fwd_GetSL2dM_x_pI_store__C__M;
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
      
      case directoryL1A_Fwd_GetML2dM_x_pI_store_GetM_Ack_AD__C__M:
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
            msg := RespL2(adr,GetM_Ack_DL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_resp(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__I;
            return true;
            endif;
          endif;
          if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_Fwd_GetML2dM_x_pI_store_GetM_Ack_AD__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_Fwd_GetML2dM_x_pI_store__C__M:
      switch inmsg.mtype
        case GetM_Ack_DL1A:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
          if (cbe.ownerL1A = msg_PutML1A.src) then
          cbe.cl := msg_PutML1A.cl;
          msg := RespL2(adr,GetM_Ack_DL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__I;
          return true;
          endif;
        
        case Inv_AckL1A:
          cbe.acksReceivedL1A := cbe.acksReceivedL1A+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_Fwd_GetML2dM_x_pI_store__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_Fwd_GetSL2dM_x_pI_store_GetM_Ack_AD__C__M:
      switch inmsg.mtype
        case Inv_AckL1A:
          cbe.acksReceivedL1A := cbe.acksReceivedL1A+1;
          if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_Fwd_GetSL2dM_x_pI_store_GetM_Ack_AD__C__M;
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
            msg := RespL2(adr,GetS_AckL2,m,cbe.proxy_msgL2.src,cbe.cl);
            Send_resp(msg, m);
            msg := RespL2(adr,WBL2,m,to_m_directoryL2(directoryL2),cbe.cl);
            Send_resp(msg, m);
            undefine cbe.proxy_msgL2;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_I__C__S;
            return true;
            endif;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_Fwd_GetSL2dM_x_pI_store__C__M:
      switch inmsg.mtype
        case GetM_Ack_DL1A:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg_PutML1A := RespL1A(adr,PutML1A,m,m,cbe.cl);
          msg_Put_AckL1A := AckL1A(adr,Put_AckL1A,m,msg_PutML1A.src);
          RemoveElement_cacheL1A(cbe.cacheL1A, msg_PutML1A.src);
          if (cbe.ownerL1A = msg_PutML1A.src) then
          cbe.cl := msg_PutML1A.cl;
          msg := RespL2(adr,GetS_AckL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL2(adr,WBL2,m,to_m_directoryL2(directoryL2),cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__S;
          return true;
          endif;
        
        case Inv_AckL1A:
          cbe.acksReceivedL1A := cbe.acksReceivedL1A+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_Fwd_GetSL2dM_x_pI_store__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_GetML1AI__C__I_store:
      switch inmsg.mtype
        case GetM_Ack_ADL2:
          cbe.cl := inmsg.cl;
          cbe.acksExpectedL2 := inmsg.acksExpectedL2;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_GetML1AI__C__I_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            msg := RespAckL1A(adr,GetM_Ack_ADL1A,m,cbe.proxy_msgL1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            Send_resp(msg, m);
            cbe.ownerL1A := cbe.proxy_msgL1A.src;
            undefine cbe.proxy_msgL1A;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_M__C__M;
            return true;
          endif;
        
        case GetM_Ack_DL2:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg := RespAckL1A(adr,GetM_Ack_ADL1A,m,cbe.proxy_msgL1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
          Send_resp(msg, m);
          cbe.ownerL1A := cbe.proxy_msgL1A.src;
          undefine cbe.proxy_msgL1A;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_M__C__M;
          return true;
        
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetML1AI__C__I_store;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_GetML1AI__C__I_store_GetM_Ack_AD:
      switch inmsg.mtype
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_GetML1AI__C__I_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            msg := RespAckL1A(adr,GetM_Ack_ADL1A,m,cbe.proxy_msgL1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            Send_resp(msg, m);
            cbe.ownerL1A := cbe.proxy_msgL1A.src;
            undefine cbe.proxy_msgL1A;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_M__C__M;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_GetML1AI__C__S_store:
      switch inmsg.mtype
        case GetM_Ack_ADL2:
          cbe.acksExpectedL2 := inmsg.acksExpectedL2;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            msg := RespAckL1A(adr,GetM_Ack_ADL1A,m,cbe.proxy_msgL1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            Send_resp(msg, m);
            cbe.ownerL1A := cbe.proxy_msgL1A.src;
            undefine cbe.proxy_msgL1A;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_M__C__M;
            return true;
          endif;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_GetML1AI__C__S_store_GetM_Ack_AD;
            return true;
          endif;
        
        case GetM_Ack_DL2:
          Set_perm(store, adr, m);
          msg := RespAckL1A(adr,GetM_Ack_ADL1A,m,cbe.proxy_msgL1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
          Send_resp(msg, m);
          cbe.ownerL1A := cbe.proxy_msgL1A.src;
          undefine cbe.proxy_msgL1A;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_M__C__M;
          return true;
        
        case InvL2:
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
          msg := RespL2(adr,Inv_AckL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetML1AI__C__I_store;
          return true;
          endif;
          endif;
        
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetML1AI__C__S_store;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_GetML1AI__C__S_store_GetM_Ack_AD:
      switch inmsg.mtype
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            msg := RespAckL1A(adr,GetM_Ack_ADL1A,m,cbe.proxy_msgL1A.src,cbe.cl,VectorCount_cacheL1A(cbe.cacheL1A));
            Send_resp(msg, m);
            cbe.ownerL1A := cbe.proxy_msgL1A.src;
            undefine cbe.proxy_msgL1A;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_M__C__M;
            return true;
          endif;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_GetML1AI__C__S_store_GetM_Ack_AD;
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
        case GetM_Ack_ADL2:
          cbe.cl := inmsg.cl;
          cbe.acksExpectedL2 := inmsg.acksExpectedL2;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_GetSL1AI__C__I_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            msg := RespL1A(adr,GetM_Ack_DL1A,m,cbe.proxy_msgL1A.src,cbe.cl);
            Send_resp(msg, m);
            cbe.ownerL1A := cbe.proxy_msgL1A.src;
            undefine cbe.proxy_msgL1A;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_E__C__M;
            return true;
          endif;
        
        case GetM_Ack_DL2:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg := RespL1A(adr,GetM_Ack_DL1A,m,cbe.proxy_msgL1A.src,cbe.cl);
          Send_resp(msg, m);
          cbe.ownerL1A := cbe.proxy_msgL1A.src;
          undefine cbe.proxy_msgL1A;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_E__C__M;
          return true;
        
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetSL1AI__C__I_store;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_GetSL1AI__C__I_store_GetM_Ack_AD:
      switch inmsg.mtype
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            msg := RespL1A(adr,GetM_Ack_DL1A,m,cbe.proxy_msgL1A.src,cbe.cl);
            Send_resp(msg, m);
            cbe.ownerL1A := cbe.proxy_msgL1A.src;
            undefine cbe.proxy_msgL1A;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_E__C__M;
            return true;
          endif;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_GetSL1AI__C__I_store_GetM_Ack_AD;
            return true;
          endif;
        
        else return false;
      endswitch;
      
      case directoryL1A_GetSL1AI__C__S_store:
      switch inmsg.mtype
        case GetM_Ack_ADL2:
          cbe.acksExpectedL2 := inmsg.acksExpectedL2;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_GetSL1AI__C__S_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            msg := RespL1A(adr,GetM_Ack_DL1A,m,cbe.proxy_msgL1A.src,cbe.cl);
            Send_resp(msg, m);
            cbe.ownerL1A := cbe.proxy_msgL1A.src;
            undefine cbe.proxy_msgL1A;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_E__C__M;
            return true;
          endif;
        
        case GetM_Ack_DL2:
          Set_perm(store, adr, m);
          msg := RespL1A(adr,GetM_Ack_DL1A,m,cbe.proxy_msgL1A.src,cbe.cl);
          Send_resp(msg, m);
          cbe.ownerL1A := cbe.proxy_msgL1A.src;
          undefine cbe.proxy_msgL1A;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_E__C__M;
          return true;
        
        case InvL2:
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
          msg := RespL2(adr,Inv_AckL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetSL1AI__C__I_store;
          return true;
          endif;
          endif;
        
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetSL1AI__C__S_store;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_GetSL1AI__C__S_store_GetM_Ack_AD:
      switch inmsg.mtype
        case Inv_AckL2:
          cbe.acksReceivedL2 := cbe.acksReceivedL2+1;
          if !(cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_GetSL1AI__C__S_store_GetM_Ack_AD;
            return true;
          endif;
          if (cbe.acksExpectedL2 = cbe.acksReceivedL2) then
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            cbe.acksExpectedL2 := 0;
            cbe.acksReceivedL2 := 0;
            Set_perm(store, adr, m);
            msg := RespL1A(adr,GetM_Ack_DL1A,m,cbe.proxy_msgL1A.src,cbe.cl);
            Send_resp(msg, m);
            cbe.ownerL1A := cbe.proxy_msgL1A.src;
            undefine cbe.proxy_msgL1A;
            Clear_perm(adr, m);
            cbe.State := directoryL1A_E__C__M;
            return true;
          endif;
        
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
      
      case directoryL1A_I__C__I:
      switch inmsg.mtype
        case GetML1A:
          msg := RequestL2(adr,GetML2,m,to_m_directoryL2(directoryL2));
          Send_req(msg, m);
          cbe.acksReceivedL2 := 0;
          cbe.proxy_msgL1A := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetML1AI__C__I_store;
          return true;
        
        case GetSL1A:
          msg := RequestL2(adr,GetML2,m,to_m_directoryL2(directoryL2));
          Send_req(msg, m);
          cbe.acksReceivedL2 := 0;
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
        case Fwd_GetML2:
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
          msg := RespL2(adr,GetM_Ack_DL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__I;
          return true;
          endif;
          endif;
        
        case Fwd_GetSL2:
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
          msg := RespL2(adr,GetS_AckL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL2(adr,WBL2,m,to_m_directoryL2(directoryL2),cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__S;
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
        case GetML1A:
          msg := RequestL2(adr,GetML2,m,to_m_directoryL2(directoryL2));
          Send_req(msg, m);
          cbe.acksReceivedL2 := 0;
          cbe.proxy_msgL1A := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetML1AI__C__S_store;
          return true;
        
        case GetSL1A:
          msg := RequestL2(adr,GetML2,m,to_m_directoryL2(directoryL2));
          Send_req(msg, m);
          cbe.acksReceivedL2 := 0;
          cbe.proxy_msgL1A := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_GetSL1AI__C__S_store;
          return true;
        
        case InvL2:
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
          msg := RespL2(adr,Inv_AckL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__I;
          return true;
          endif;
          endif;
        
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
        case Fwd_GetML2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          msg := RequestL1A(adr,Fwd_GetML1A,msg_GetML1A.src,cbe.ownerL1A);
          Send_fwd(msg, m);
          cbe.ownerL1A := msg_GetML1A.src;
          cbe.proxy_msgL2 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_Fwd_GetML2dM_x_pI_store__C__M;
          return true;
        
        case Fwd_GetSL2:
          msg_GetML1A := RequestL1A(adr,GetML1A,m,m);
          cbe.acksReceivedL1A := 0;
          msg := RequestL1A(adr,Fwd_GetML1A,msg_GetML1A.src,cbe.ownerL1A);
          Send_fwd(msg, m);
          cbe.ownerL1A := msg_GetML1A.src;
          cbe.proxy_msgL2 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1A_Fwd_GetSL2dM_x_pI_store__C__M;
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
      
      case directoryL1A_S__C__M:
      switch inmsg.mtype
        case Fwd_GetML2:
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
              cbe.State := directoryL1A_Fwd_GetML2dM_x_pI_store_GetM_Ack_AD__C__M;
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
              msg := RespL2(adr,GetM_Ack_DL2,m,cbe.proxy_msgL2.src,cbe.cl);
              Send_resp(msg, m);
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
              msg := RespL2(adr,GetM_Ack_DL2,m,cbe.proxy_msgL2.src,cbe.cl);
              Send_resp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_I__C__I;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_Fwd_GetML2dM_x_pI_store_GetM_Ack_AD__C__M;
              return true;
            endif;
          endif;
        
        case Fwd_GetSL2:
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
              cbe.State := directoryL1A_Fwd_GetSL2dM_x_pI_store_GetM_Ack_AD__C__M;
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
              msg := RespL2(adr,GetS_AckL2,m,cbe.proxy_msgL2.src,cbe.cl);
              Send_resp(msg, m);
              msg := RespL2(adr,WBL2,m,to_m_directoryL2(directoryL2),cbe.cl);
              Send_resp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_I__C__S;
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
              msg := RespL2(adr,GetS_AckL2,m,cbe.proxy_msgL2.src,cbe.cl);
              Send_resp(msg, m);
              msg := RespL2(adr,WBL2,m,to_m_directoryL2(directoryL2),cbe.cl);
              Send_resp(msg, m);
              undefine cbe.proxy_msgL2;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_I__C__S;
              return true;
              endif;
            endif;
            if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
              cbe.proxy_msgL2 := inmsg;
              Clear_perm(adr, m);
              cbe.State := directoryL1A_Fwd_GetSL2dM_x_pI_store_GetM_Ack_AD__C__M;
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
      
      case directoryL1A_evictI__C__M_evict:
      switch inmsg.mtype
        case Fwd_GetML2:
          msg := RespL2(adr,GetM_Ack_DL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictI__C__M_evict_x_I;
          return true;
        
        case Fwd_GetSL2:
          msg := RespL2(adr,GetS_AckL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          msg := RespL2(adr,WBL2,m,to_m_directoryL2(directoryL2),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictI__C__S_evict;
          return true;
        
        case Put_AckL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_evictI__C__M_evict_x_I:
      switch inmsg.mtype
        case Put_AckL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_evictI__C__S_evict:
      switch inmsg.mtype
        case InvL2:
          msg := RespL2(adr,Inv_AckL2,m,inmsg.src,cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1A_evictI__C__S_evict_x_I;
          return true;
        
        case Put_AckL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_evictI__C__S_evict_x_I:
      switch inmsg.mtype
        case Put_AckL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1A_I__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1A_evictdM_x_pI_store_GetM_Ack_AD__C__M:
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
            msg := RespL2(adr,PutML2,m,to_m_directoryL2(directoryL2),cbe.cl);
            Send_req(msg, m);
            Clear_perm(adr, m);
            cbe.State := directoryL1A_evictI__C__M_evict;
            return true;
            endif;
          endif;
          if !(cbe.acksExpectedL1A = cbe.acksReceivedL1A) then
            Clear_perm(adr, m);
            cbe.State := directoryL1A_evictdM_x_pI_store_GetM_Ack_AD__C__M;
            return true;
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
          msg := RespL2(adr,PutML2,m,to_m_directoryL2(directoryL2),cbe.cl);
          Send_req(msg, m);
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
  end;
  

--Backend/Murphi/MurphiModular/GenRules
  ----Backend/Murphi/MurphiModular/Rules/GenAccessRuleSet
    ruleset m:OBJSET_directoryL1B do
    ruleset adr:Address do
      alias cbe:i_directoryL1B[m].cb[adr] do
    
      rule "directoryL1B_E__C__M_evict"
        cbe.State = directoryL1B_E__C__M & network_ready() 
      ==>
        FSM_Access_directoryL1B_E__C__M_evict(adr, m);
        
      endrule;
    
      rule "directoryL1B_I__C__M_evict"
        cbe.State = directoryL1B_I__C__M & network_ready() 
      ==>
        FSM_Access_directoryL1B_I__C__M_evict(adr, m);
        
      endrule;
    
      rule "directoryL1B_I__C__S_evict"
        cbe.State = directoryL1B_I__C__S & network_ready() 
      ==>
        FSM_Access_directoryL1B_I__C__S_evict(adr, m);
        
      endrule;
    
      rule "directoryL1B_M__C__M_evict"
        cbe.State = directoryL1B_M__C__M & network_ready() 
      ==>
        FSM_Access_directoryL1B_M__C__M_evict(adr, m);
        
      endrule;
    
      rule "directoryL1B_S__C__M_evict"
        cbe.State = directoryL1B_S__C__M & network_ready() 
      ==>
        FSM_Access_directoryL1B_S__C__M_evict(adr, m);
        
      endrule;
    
    
      endalias;
    endruleset;
    endruleset;
    
    ruleset m:OBJSET_cacheL1B do
    ruleset adr:Address do
      alias cbe:i_cacheL1B[m].cb[adr] do
    
      rule "cacheL1B_E_load"
        cbe.State = cacheL1B_E 
      ==>
        FSM_Access_cacheL1B_E_load(adr, m);
        
      endrule;
    
      rule "cacheL1B_E_store"
        cbe.State = cacheL1B_E 
      ==>
        FSM_Access_cacheL1B_E_store(adr, m);
        
      endrule;
    
      rule "cacheL1B_E_evict"
        cbe.State = cacheL1B_E & network_ready() 
      ==>
        FSM_Access_cacheL1B_E_evict(adr, m);
        
      endrule;
    
      rule "cacheL1B_I_load"
        cbe.State = cacheL1B_I & network_ready() 
      ==>
        FSM_Access_cacheL1B_I_load(adr, m);
        
      endrule;
    
      rule "cacheL1B_I_store"
        cbe.State = cacheL1B_I & network_ready() 
      ==>
        FSM_Access_cacheL1B_I_store(adr, m);
        
      endrule;
    
      rule "cacheL1B_M_load"
        cbe.State = cacheL1B_M 
      ==>
        FSM_Access_cacheL1B_M_load(adr, m);
        
      endrule;
    
      rule "cacheL1B_M_evict"
        cbe.State = cacheL1B_M & network_ready() 
      ==>
        FSM_Access_cacheL1B_M_evict(adr, m);
        
      endrule;
    
      rule "cacheL1B_M_store"
        cbe.State = cacheL1B_M 
      ==>
        FSM_Access_cacheL1B_M_store(adr, m);
        
      endrule;
    
      rule "cacheL1B_S_store"
        cbe.State = cacheL1B_S & network_ready() 
      ==>
        FSM_Access_cacheL1B_S_store(adr, m);
        
      endrule;
    
      rule "cacheL1B_S_load"
        cbe.State = cacheL1B_S 
      ==>
        FSM_Access_cacheL1B_S_load(adr, m);
        
      endrule;
    
      rule "cacheL1B_S_evict"
        cbe.State = cacheL1B_S & network_ready() 
      ==>
        FSM_Access_cacheL1B_S_evict(adr, m);
        
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
    
      rule "directoryL1A_S__C__M_evict"
        cbe.State = directoryL1A_S__C__M & network_ready() 
      ==>
        FSM_Access_directoryL1A_S__C__M_evict(adr, m);
        
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
    
      rule "cacheL1A_E_store"
        cbe.State = cacheL1A_E 
      ==>
        FSM_Access_cacheL1A_E_store(adr, m);
        
      endrule;
    
      rule "cacheL1A_E_evict"
        cbe.State = cacheL1A_E & network_ready() 
      ==>
        FSM_Access_cacheL1A_E_evict(adr, m);
        
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
    
    -- directoryL2
    ruleset n:OBJSET_directoryL2 do
      alias msg:resp_directoryL2[n][0] do
        rule "Receive directoryL2 resp"
          cnt_resp_directoryL2[n] > 0
          
        ==>
          if FSM_MSG_directoryL2(msg, n) then
            Pop_resp(to_m_directoryL2(n), to_m_directoryL2(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL2 do
      alias msg:req_directoryL2[n][0] do
        rule "Receive directoryL2 req"
          cnt_req_directoryL2[n] > 0
          
        ==>
          if FSM_MSG_directoryL2(msg, n) then
            Pop_req(to_m_directoryL2(n), to_m_directoryL2(n));
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

