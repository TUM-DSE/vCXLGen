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
    CACHE_NET_MAX : 5;
    C1_NET_MAX : 9;
    C2_NET_MAX : 7;
  
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
        acquire, 
        release, 
        none
      };
      
      ------Backend/Murphi/MurphiModular/Types/Enums/SubEnums/GenMessageTypes
      MessageType: enum {
        GetVL1, 
        GetRL1, 
        PutRL1, 
        PutVL1, 
        GetV_AckL1, 
        GetR_AckL1, 
        PutR_AckL1, 
        PutV_AckL1, 
        GetVL1acquire, 
        GetVL1load, 
        PutRL1release, 
        GetRL1release, 
        PutVL1release, 
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
      s_cacheL1: enum {
        cacheL1_VD_release_rel_event,
        cacheL1_VD_release,
        cacheL1_VD_rel_event,
        cacheL1_VD_evict,
        cacheL1_VD_acquire_GetV_Ack,
        cacheL1_VD_acquire,
        cacheL1_VD,
        cacheL1_VC_release_rel_event,
        cacheL1_VC_release,
        cacheL1_VC_acquire_GetV_Ack,
        cacheL1_VC_acquire,
        cacheL1_VC,
        cacheL1_I_store,
        cacheL1_I_release_rel_event_GetR_Ack,
        cacheL1_I_release_rel_event,
        cacheL1_I_release,
        cacheL1_I_load,
        cacheL1_I_acquire_GetV_Ack,
        cacheL1_I_acquire,
        cacheL1_I
      };
      
      e_cacheL1: enum {
        cacheL1_rel_eventL1,
        cacheL1_acq_eventL1
      };
      
      s_cacheL2: enum {
        cacheL2_S_store,
        cacheL2_S_evict_x_I,
        cacheL2_S_evict,
        cacheL2_S,
        cacheL2_M_evict_BIConflictAck,
        cacheL2_M_evict,
        cacheL2_M_BISnpInv,
        cacheL2_M_BISnpData,
        cacheL2_M_BIConflictAck,
        cacheL2_M,
        cacheL2_I_store_Cmp_E,
        cacheL2_I_store,
        cacheL2_I_load_Cmp_S,
        cacheL2_I_load_Cmp_E,
        cacheL2_I_load,
        cacheL2_I,
        cacheL2_E_evict_x_I,
        cacheL2_E_evict,
        cacheL2_E
      };
      
      s_directoryL1: enum {
        directoryL1_evictV__C__S_evict_x_I,
        directoryL1_evictV__C__S_evict,
        directoryL1_evictV__C__M_evict_BIConflictAck,
        directoryL1_evictV__C__M_evict,
        directoryL1_evictV__C__E_evict_x_I,
        directoryL1_evictV__C__E_evict,
        directoryL1_V__C__S,
        directoryL1_V__C__M,
        directoryL1_V__C__I,
        directoryL1_V__C__E,
        directoryL1_PutVL1V__C__S_store,
        directoryL1_PutVL1V__C__I_store_Cmp_E,
        directoryL1_PutVL1V__C__I_store,
        directoryL1_GetVL1V__C__I_load_Cmp_S,
        directoryL1_GetVL1V__C__I_load_Cmp_E,
        directoryL1_GetVL1V__C__I_load,
        directoryL1_GetRL1V__C__S_store,
        directoryL1_GetRL1V__C__I_store_Cmp_E,
        directoryL1_GetRL1V__C__I_store,
        directoryL1_GetRL1V_GetR__C__M,
        directoryL1_BISnpInvL2V__C__M_BISnpInv,
        directoryL1_BISnpDataL2V__C__M_BISnpData,
        directoryL1_BIConflictAckL2V__C__M_BIConflictAck
      };
      
      e_directoryL1: enum {
        directoryL1_rel_eventL1,
        directoryL1_acq_eventL1
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
      
    ----Backend/Murphi/MurphiModular/Types/GenMachineSets
      -- Cluster: C1
      OBJSET_cacheL1: scalarset(3);
      OBJSET_directoryL1: enum{directoryL1};
      C1Machines: record
        cacheL1: OBJSET_cacheL1;
        directoryL1: OBJSET_directoryL1;
      end;
      -- Cluster: C2
      OBJSET_cacheL2: enum{cacheL2};
      OBJSET_directoryL2: enum{directoryL2};
      C2Machines: record
        cacheL2: OBJSET_cacheL2;
        directoryL1: OBJSET_directoryL1;
        directoryL2: OBJSET_directoryL2;
      end;
      
      Machines: record
        cacheL1: OBJSET_cacheL1;
        directoryL1: OBJSET_directoryL1;
        cacheL2: OBJSET_cacheL2;
        directoryL2: OBJSET_directoryL2;
      end;
      CntMachines: 0..6;
    
    ----Backend/Murphi/MurphiModular/Types/GenScalarMaps
    
    ----Backend/Murphi/MurphiModular/Types/GenCheckTypes
      ------Backend/Murphi/MurphiModular/Types/CheckTypes/GenPermType
        acc_type_obj: array[PermissionType] of boolean;
        PermMonitor: record
          cacheL2: array[OBJSET_cacheL2] of array[Address] of acc_type_obj;
          cacheL1: array[OBJSET_cacheL1] of array[Address] of acc_type_obj;
        
        end;
      
    
    ----Backend/Murphi/MurphiModular/Types/GenMessage
      Message: record
        adr: Address;
        mtype: MessageType;
        src: Machines;
        dst: Machines;
        cl: ClValue;
      end;
      
    ----Backend/Murphi/MurphiModular/Types/GenNetwork
      NET_fwd_cacheL1: array[OBJSET_cacheL1] of array[0..(C1_NET_MAX)-1] of Message;
      NET_resp_cacheL1: array[OBJSET_cacheL1] of array[0..(C1_NET_MAX)-1] of Message;
      NET_cacheL1_cnt: array[OBJSET_cacheL1] of 0..O_NET_MAX;
      NET_fwd_directoryL1: array[OBJSET_directoryL1] of array[0..1-1] of Message;
      NET_req_directoryL1: array[OBJSET_directoryL1] of array[0..(C1_NET_MAX)-1] of Message;
      NET_birsp_directoryL1: array[OBJSET_directoryL1] of array[0..(C2_NET_MAX)-1] of Message;
      NET_drs_directoryL1: array[OBJSET_directoryL1] of array[0..(C2_NET_MAX)-1] of Message;
      NET_rwd_directoryL1: array[OBJSET_directoryL1] of array[0..(C2_NET_MAX)-1] of Message;
      NET_req2_directoryL1: array[OBJSET_directoryL1] of array[0..(C2_NET_MAX)-1] of Message;
      NET_ndr_directoryL1: array[OBJSET_directoryL1] of array[0..(C2_NET_MAX)-1] of Message;
      NET_bisnp_directoryL1: array[OBJSET_directoryL1] of array[0..(C2_NET_MAX)-1] of Message;
      NET_resp_directoryL1: array[OBJSET_directoryL1] of array[0..(C1_NET_MAX)-1] of Message;
      NET_directoryL1_cnt: array[OBJSET_directoryL1] of 0..O_NET_MAX;
      NET_birsp_cacheL2: array[OBJSET_cacheL2] of array[0..(C2_NET_MAX)-1] of Message;
      NET_drs_cacheL2: array[OBJSET_cacheL2] of array[0..(C2_NET_MAX)-1] of Message;
      NET_rwd_cacheL2: array[OBJSET_cacheL2] of array[0..(C2_NET_MAX)-1] of Message;
      NET_req2_cacheL2: array[OBJSET_cacheL2] of array[0..(C2_NET_MAX)-1] of Message;
      NET_ndr_cacheL2: array[OBJSET_cacheL2] of array[0..(C2_NET_MAX)-1] of Message;
      NET_bisnp_cacheL2: array[OBJSET_cacheL2] of array[0..(C2_NET_MAX)-1] of Message;
      NET_cacheL2_cnt: array[OBJSET_cacheL2] of 0..O_NET_MAX;
      NET_birsp_directoryL2: array[OBJSET_directoryL2] of array[0..(C2_NET_MAX)-1] of Message;
      NET_drs_directoryL2: array[OBJSET_directoryL2] of array[0..(C2_NET_MAX)-1] of Message;
      NET_rwd_directoryL2: array[OBJSET_directoryL2] of array[0..(C2_NET_MAX)-1] of Message;
      NET_req2_directoryL2: array[OBJSET_directoryL2] of array[0..(C2_NET_MAX)-1] of Message;
      NET_ndr_directoryL2: array[OBJSET_directoryL2] of array[0..(C2_NET_MAX)-1] of Message;
      NET_bisnp_directoryL2: array[OBJSET_directoryL2] of array[0..(C2_NET_MAX)-1] of Message;
      NET_directoryL2_cnt: array[OBJSET_directoryL2] of 0..O_NET_MAX;
    
    ----Backend/Murphi/MurphiModular/Types/GenMachines
      
      ENTRY_cacheL1: record
        State: s_cacheL1;
        cl: ClValue;
      end;
      
      EVENT_ENTRY_cacheL1: record
          evt_type: e_cacheL1;
          evt_adr: Address;
      end;
      
      EVENT_cacheL1: record
          event_queue: array[0..ADR_COUNT] of EVENT_ENTRY_cacheL1;
          event_queue_index: 0..ADR_COUNT+1;
          pend_adr: array[Address] of boolean;
          event_lock_adr: Address;
      
      end;
      
      MACH_cacheL1: record
        cb: array[Address] of ENTRY_cacheL1;
        evt: EVENT_cacheL1;
      end;
      
      OBJ_cacheL1: array[OBJSET_cacheL1] of MACH_cacheL1;
      
      ENTRY_directoryL1: record
        State: s_directoryL1;
        cl: ClValue;
        proxy_msgL1: Message;
        proxy_msgL2: Message;
      end;
      
      EVENT_ENTRY_directoryL1: record
          evt_type: e_directoryL1;
          evt_adr: Address;
      end;
      
      EVENT_directoryL1: record
          event_queue: array[0..ADR_COUNT] of EVENT_ENTRY_directoryL1;
          event_queue_index: 0..ADR_COUNT+1;
          pend_adr: array[Address] of boolean;
          event_lock_adr: Address;
      
      end;
      
      MACH_directoryL1: record
        cb: array[Address] of ENTRY_directoryL1;
        evt: EVENT_directoryL1;
      end;
      
      OBJ_directoryL1: array[OBJSET_directoryL1] of MACH_directoryL1;
      
      ENTRY_cacheL2: record
        State: s_cacheL2;
        cl: ClValue;
      end;
      
      MACH_cacheL2: record
        cb: array[Address] of ENTRY_cacheL2;
      end;
      
      OBJ_cacheL2: array[OBJSET_cacheL2] of MACH_cacheL2;
      v_cacheL2: record
        cacheL1: array[OBJSET_cacheL1] of boolean;
        directoryL1: array[OBJSET_directoryL1] of boolean;
        cacheL2: array[OBJSET_cacheL2] of boolean;
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
    

  var
    --Backend/Murphi/MurphiModular/GenVars
      resp_cacheL1: NET_resp_cacheL1;
      cnt_resp_cacheL1: NET_cacheL1_cnt;
      fwd_cacheL1: NET_fwd_cacheL1;
      cnt_fwd_cacheL1: NET_cacheL1_cnt;
    
      resp_directoryL1: NET_resp_directoryL1;
      cnt_resp_directoryL1: NET_directoryL1_cnt;
      req_directoryL1: NET_req_directoryL1;
      cnt_req_directoryL1: NET_directoryL1_cnt;
      fwd_directoryL1: NET_fwd_directoryL1;
      cnt_fwd_directoryL1: NET_directoryL1_cnt;
      bisnp_directoryL1: NET_bisnp_directoryL1;
      cnt_bisnp_directoryL1: NET_directoryL1_cnt;
      req2_directoryL1: NET_req2_directoryL1;
      cnt_req2_directoryL1: NET_directoryL1_cnt;
      rwd_directoryL1: NET_rwd_directoryL1;
      cnt_rwd_directoryL1: NET_directoryL1_cnt;
      birsp_directoryL1: NET_birsp_directoryL1;
      cnt_birsp_directoryL1: NET_directoryL1_cnt;
      drs_directoryL1: NET_drs_directoryL1;
      cnt_drs_directoryL1: NET_directoryL1_cnt;
      ndr_directoryL1: NET_ndr_directoryL1;
      cnt_ndr_directoryL1: NET_directoryL1_cnt;
    
      bisnp_cacheL2: NET_bisnp_cacheL2;
      cnt_bisnp_cacheL2: NET_cacheL2_cnt;
      req2_cacheL2: NET_req2_cacheL2;
      cnt_req2_cacheL2: NET_cacheL2_cnt;
      rwd_cacheL2: NET_rwd_cacheL2;
      cnt_rwd_cacheL2: NET_cacheL2_cnt;
      birsp_cacheL2: NET_birsp_cacheL2;
      cnt_birsp_cacheL2: NET_cacheL2_cnt;
      drs_cacheL2: NET_drs_cacheL2;
      cnt_drs_cacheL2: NET_cacheL2_cnt;
      ndr_cacheL2: NET_ndr_cacheL2;
      cnt_ndr_cacheL2: NET_cacheL2_cnt;
    
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
    
    
    
      g_perm: PermMonitor;
      i_cacheL1: OBJ_cacheL1;
      i_directoryL1: OBJ_directoryL1;
      i_cacheL2: OBJ_cacheL2;
      i_directoryL2: OBJ_directoryL2;
  
--Backend/Murphi/MurphiModular/GenFunctions

  ----Backend/Murphi/MurphiModular/Functions/GenTypeFunc
    function to_m_cacheL1(o: OBJSET_cacheL1) : Machines;
    var m: Machines;
    begin
      undefine m;
      m.cacheL1 := o;
      return m;
    end
    
    function from_m_cacheL1(m: Machines) : OBJSET_cacheL1;
    begin
      return m.cacheL1;
    end
    
    function to_m_directoryL1(o: OBJSET_directoryL1) : Machines;
    var m: Machines;
    begin
      undefine m;
      m.directoryL1 := o;
      return m;
    end
    
    function from_m_directoryL1(m: Machines) : OBJSET_directoryL1;
    begin
      return m.directoryL1;
    end
    
    function to_m_cacheL2(o: OBJSET_cacheL2) : Machines;
    var m: Machines;
    begin
      undefine m;
      m.cacheL2 := o;
      return m;
    end
    
    function from_m_cacheL2(m: Machines) : OBJSET_cacheL2;
    begin
      return m.cacheL2;
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
    
  ----Backend/Murphi/MurphiModular/Functions/GenEventFunc
    procedure NextEvent_cacheL1(m: OBJSET_cacheL1);
    begin
      alias evt_entry: i_cacheL1[m].evt do
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
    
    procedure PopEvent_cacheL1(m: OBJSET_cacheL1);
    begin
      alias evt_entry: i_cacheL1[m].evt do
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
    
    procedure ResetEvent_cacheL1();
    begin
      for m: OBJSET_cacheL1 do
        alias evt_entry: i_cacheL1[m].evt do
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
    
    procedure IssueEvent_cacheL1(evt_type: e_cacheL1; machine: Machines; adr: Address);
    begin
      alias m : from_m_cacheL1(machine) do
      alias evt_entry: i_cacheL1[m].evt do
      alias evt_index: evt_entry.event_queue_index do
    
        evt_entry.event_queue[evt_index].evt_type := evt_type;
        evt_entry.event_queue[evt_index].evt_adr := adr;
        evt_index := evt_index + 1;
    
        NextEvent_cacheL1(m);
    
      endalias;
      endalias;
      endalias;
    end;
    
    /* Event: Checks if the currently pending event has been served*/
    function CheckRemoteEvent_cacheL1(cur_evt_type: e_cacheL1; m: OBJSET_cacheL1; adr: Address): boolean;
    begin
      alias evt_entry: i_cacheL1[m].evt do
      alias pend_adr: i_cacheL1[m].evt.pend_adr do
    
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
    
    procedure ServeRemoteEvent_cacheL1(cur_evt_type: e_cacheL1; machine: Machines; adr: Address);
    begin
      alias m : from_m_cacheL1(machine) do
      alias evt_entry: i_cacheL1[m].evt do
      alias pend_adr: i_cacheL1[m].evt.pend_adr do
    
        /* Check if the event type matches and the event still need to be served for this address */
        if evt_entry.event_queue[0].evt_type = cur_evt_type & pend_adr[adr] then
            pend_adr[adr] := false;
        endif;
    
      endalias;
      endalias;
      endalias;
    end;
    
    /* Event Ack: Checks if the currently pending event has been served by all addresses */
    function CheckInitEvent_cacheL1(cur_evt_type: e_cacheL1; m: OBJSET_cacheL1; adr: Address): boolean;
    begin
      alias evt_entry: i_cacheL1[m].evt do
      alias pend_adr: i_cacheL1[m].evt.pend_adr do
    
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
    
    procedure ServeInitEvent_cacheL1(cur_evt_type: e_cacheL1; m: OBJSET_cacheL1; adr: Address);
    begin
      alias evt_entry: i_cacheL1[m].evt do
      alias pend_adr: i_cacheL1[m].evt.pend_adr do
    
        for adr: Address do
          if pend_adr[adr] then
            return;
          endif;
        endfor;
        if evt_entry.event_queue[0].evt_type = cur_evt_type then
            PopEvent_cacheL1(m);
            NextEvent_cacheL1(m);
        endif;
    
      endalias;
      endalias;
    end;
    
    function TestAtomicEvent_cacheL1(m: OBJSET_cacheL1): boolean;
    begin
        if isundefined(i_cacheL1[m].evt.event_lock_adr) then
            return true;
        else
            return false;
        endif;
    end;
    
    procedure LockAtomicEvent_cacheL1(m: OBJSET_cacheL1; adr: Address);
    begin
      i_cacheL1[m].evt.event_lock_adr := adr;
    end;
    
    procedure UnlockAtomicEvent_cacheL1(m: OBJSET_cacheL1; adr: Address);
    begin
        if !isundefined(i_cacheL1[m].evt.event_lock_adr) then
            if i_cacheL1[m].evt.event_lock_adr = adr then
                undefine i_cacheL1[m].evt.event_lock_adr;
            endif;
        endif;
    end;
    
    procedure NextEvent_directoryL1(m: OBJSET_directoryL1);
    begin
      alias evt_entry: i_directoryL1[m].evt do
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
    
    procedure PopEvent_directoryL1(m: OBJSET_directoryL1);
    begin
      alias evt_entry: i_directoryL1[m].evt do
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
    
    procedure ResetEvent_directoryL1();
    begin
      for m: OBJSET_directoryL1 do
        alias evt_entry: i_directoryL1[m].evt do
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
    
    procedure IssueEvent_directoryL1(evt_type: e_directoryL1; machine: Machines; adr: Address);
    begin
      alias m : from_m_directoryL1(machine) do
      alias evt_entry: i_directoryL1[m].evt do
      alias evt_index: evt_entry.event_queue_index do
    
        evt_entry.event_queue[evt_index].evt_type := evt_type;
        evt_entry.event_queue[evt_index].evt_adr := adr;
        evt_index := evt_index + 1;
    
        NextEvent_directoryL1(m);
    
      endalias;
      endalias;
      endalias;
    end;
    
    /* Event: Checks if the currently pending event has been served*/
    function CheckRemoteEvent_directoryL1(cur_evt_type: e_directoryL1; m: OBJSET_directoryL1; adr: Address): boolean;
    begin
      alias evt_entry: i_directoryL1[m].evt do
      alias pend_adr: i_directoryL1[m].evt.pend_adr do
    
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
    
    procedure ServeRemoteEvent_directoryL1(cur_evt_type: e_directoryL1; machine: Machines; adr: Address);
    begin
      alias m : from_m_directoryL1(machine) do
      alias evt_entry: i_directoryL1[m].evt do
      alias pend_adr: i_directoryL1[m].evt.pend_adr do
    
        /* Check if the event type matches and the event still need to be served for this address */
        if evt_entry.event_queue[0].evt_type = cur_evt_type & pend_adr[adr] then
            pend_adr[adr] := false;
        endif;
    
      endalias;
      endalias;
      endalias;
    end;
    
    /* Event Ack: Checks if the currently pending event has been served by all addresses */
    function CheckInitEvent_directoryL1(cur_evt_type: e_directoryL1; m: OBJSET_directoryL1; adr: Address): boolean;
    begin
      alias evt_entry: i_directoryL1[m].evt do
      alias pend_adr: i_directoryL1[m].evt.pend_adr do
    
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
    
    procedure ServeInitEvent_directoryL1(cur_evt_type: e_directoryL1; m: OBJSET_directoryL1; adr: Address);
    begin
      alias evt_entry: i_directoryL1[m].evt do
      alias pend_adr: i_directoryL1[m].evt.pend_adr do
    
        for adr: Address do
          if pend_adr[adr] then
            return;
          endif;
        endfor;
        if evt_entry.event_queue[0].evt_type = cur_evt_type then
            PopEvent_directoryL1(m);
            NextEvent_directoryL1(m);
        endif;
    
      endalias;
      endalias;
    end;
    
    function TestAtomicEvent_directoryL1(m: OBJSET_directoryL1): boolean;
    begin
        if isundefined(i_directoryL1[m].evt.event_lock_adr) then
            return true;
        else
            return false;
        endif;
    end;
    
    procedure LockAtomicEvent_directoryL1(m: OBJSET_directoryL1; adr: Address);
    begin
      i_directoryL1[m].evt.event_lock_adr := adr;
    end;
    
    procedure UnlockAtomicEvent_directoryL1(m: OBJSET_directoryL1; adr: Address);
    begin
        if !isundefined(i_directoryL1[m].evt.event_lock_adr) then
            if i_directoryL1[m].evt.event_lock_adr = adr then
                undefine i_directoryL1[m].evt.event_lock_adr;
            endif;
        endif;
    end;
    
    procedure ResetEvent_();
    begin
      ResetEvent_cacheL1();
      ResetEvent_directoryL1();
    
    end;
  ----Backend/Murphi/MurphiModular/Functions/GenPermFunc
    procedure Clear_perm(adr: Address; m: Machines);
    begin
      for acc : PermissionType do
        if !isundefined(m.cacheL2) then
          g_perm.cacheL2[m.cacheL2][adr][acc] := false;
        endif;
        if !isundefined(m.cacheL1) then
          g_perm.cacheL1[m.cacheL1][adr][acc] := false;
        endif;
    
      endfor;
    end;
    
    procedure Set_perm(acc: PermissionType; adr: Address; m: Machines);
    begin
      if !isundefined(m.cacheL2) then
        g_perm.cacheL2[m.cacheL2][adr][acc] := true;
      endif;
      if !isundefined(m.cacheL1) then
        g_perm.cacheL1[m.cacheL1][adr][acc] := true;
      endif;
    
    end;
    
    procedure Reset_perm();
    begin
      for acc : PermissionType do
        for adr : Address do
          for o : OBJSET_cacheL2 do
            g_perm.cacheL2[o][adr][acc] := false;
          endfor;
          for o : OBJSET_cacheL1 do
            g_perm.cacheL1[o][adr][acc] := false;
          endfor;
    
        endfor;
      endfor;
    end;
    
  
    function live_cacheL1(adr: Address; acc: PermissionType): boolean
    begin
      for n : OBJSET_cacheL1 do
        if g_perm.cacheL1[n][adr][acc] then
          return true;
        endif;
      endfor;
    
      return false;
    end;
  
  ----Backend/Murphi/MurphiModular/Functions/GenVectorFunc
    -- .add()
    procedure AddElement_cacheL2(var sv:v_cacheL2; n:Machines);
    begin
      if !isundefined(n.cacheL2) then
        sv.cacheL2[n.cacheL2] := true;
      endif;
      if !isundefined(n.cacheL1) then
        sv.cacheL1[n.cacheL1] := true;
      endif;
      if !isundefined(n.directoryL1) then
        sv.directoryL1[n.directoryL1] := true;
      endif;
    
    end;
    
    -- .del()
    procedure RemoveElement_cacheL2(var sv:v_cacheL2; n:Machines);
    begin
      if !isundefined(n.cacheL2) then
        sv.cacheL2[n.cacheL2] := false;
      endif;
      if !isundefined(n.cacheL1) then
        sv.cacheL1[n.cacheL1] := false;
      endif;
      if !isundefined(n.directoryL1) then
        sv.directoryL1[n.directoryL1] := false;
      endif;
    
    end;
    
    -- .clear()
    procedure ClearVector_cacheL2(var sv:v_cacheL2;);
    begin
      for m : OBJSET_cacheL2 do
        sv.cacheL2[m] := false;
      endfor;
      for m : OBJSET_cacheL1 do
        sv.cacheL1[m] := false;
      endfor;
      for m : OBJSET_directoryL1 do
        sv.directoryL1[m] := false;
      endfor;
    
    end;
    
    -- .contains()
    function IsElement_cacheL2(sv:v_cacheL2; n:Machines) : boolean;
    begin
      if !isundefined(n.cacheL2) then
        return sv.cacheL2[n.cacheL2];
      endif;
      if !isundefined(n.cacheL1) then
        return sv.cacheL1[n.cacheL1];
      endif;
      if !isundefined(n.directoryL1) then
        return sv.directoryL1[n.directoryL1];
      endif;
    
      return false;
    end;
    
    -- .count()
    function VectorCount_cacheL2(sv:v_cacheL2) : cnt_v_cacheL2;
    var cnt : cnt_v_cacheL2;
    begin
      cnt := 0;
      for m : OBJSET_cacheL2 do
        if sv.cacheL2[m] then
          cnt := cnt + 1;
        endif;
      endfor;
      for m : OBJSET_cacheL1 do
        if sv.cacheL1[m] then
          cnt := cnt + 1;
        endif;
      endfor;
      for m : OBJSET_directoryL1 do
        if sv.directoryL1[m] then
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
    procedure ResetMachine_cacheL1();
    begin
      for i:OBJSET_cacheL1 do
        for a:Address do
          i_cacheL1[i].cb[a].State := cacheL1_I;
          i_cacheL1[i].cb[a].cl := 0;
    
        endfor;
      endfor;
    end;
    
    procedure ResetMachine_directoryL1();
    begin
      for i:OBJSET_directoryL1 do
        for a:Address do
          i_directoryL1[i].cb[a].State := directoryL1_V__C__I;
          i_directoryL1[i].cb[a].cl := 0;
          undefine i_directoryL1[i].cb[a].proxy_msgL1;
          undefine i_directoryL1[i].cb[a].proxy_msgL2;
    
        endfor;
      endfor;
    end;
    
    procedure ResetMachine_cacheL2();
    begin
      for i:OBJSET_cacheL2 do
        for a:Address do
          i_cacheL2[i].cb[a].State := cacheL2_I;
          i_cacheL2[i].cb[a].cl := 0;
    
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
    
      procedure ResetMachine_();
      begin
      ResetMachine_cacheL1();
      ResetMachine_directoryL1();
      ResetMachine_cacheL2();
      ResetMachine_directoryL2();
      
      end;
  ----Backend/Murphi/MurphiModular/Functions/GenFIFOFunc
  ----Backend/Murphi/MurphiModular/Functions/GenNetworkFunc
    procedure Send_resp(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1) then
        Assert(cnt_resp_cacheL1[dst.cacheL1] < O_NET_MAX) "Too many messages: resp_cacheL1";
        resp_cacheL1[dst.cacheL1][cnt_resp_cacheL1[dst.cacheL1]] := msg;
        cnt_resp_cacheL1[dst.cacheL1] := cnt_resp_cacheL1[dst.cacheL1] + 1;
      elsif !isundefined(dst.directoryL1) then
        Assert(cnt_resp_directoryL1[dst.directoryL1] < O_NET_MAX) "Too many messages: resp_directoryL1";
        resp_directoryL1[dst.directoryL1][cnt_resp_directoryL1[dst.directoryL1]] := msg;
        cnt_resp_directoryL1[dst.directoryL1] := cnt_resp_directoryL1[dst.directoryL1] + 1;
      elsif !isundefined(dst.cacheL2) then
        error "Attempt to send to queue resp_cacheL2, which is not modeled"; 
      elsif !isundefined(dst.directoryL2) then
        error "Attempt to send to queue resp_directoryL2, which is not modeled"; 
      else
        error "unknown send machine";
      endif;
      
      endalias;
    end;
    
    procedure Pop_resp(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1) then
        Assert (cnt_resp_cacheL1[dst.cacheL1] > 0) "Trying to advance empty queue: resp_cacheL1";
        for i := 0 to cnt_resp_cacheL1[dst.cacheL1]-1 do
          if i < cnt_resp_cacheL1[dst.cacheL1]-1 then
            resp_cacheL1[dst.cacheL1][i] := resp_cacheL1[dst.cacheL1][i+1];
          else
            undefine resp_cacheL1[dst.cacheL1][i];
          endif;
        endfor;
        cnt_resp_cacheL1[dst.cacheL1] := cnt_resp_cacheL1[dst.cacheL1] - 1;
      elsif !isundefined(dst.directoryL1) then
        Assert (cnt_resp_directoryL1[dst.directoryL1] > 0) "Trying to advance empty queue: resp_directoryL1";
        for i := 0 to cnt_resp_directoryL1[dst.directoryL1]-1 do
          if i < cnt_resp_directoryL1[dst.directoryL1]-1 then
            resp_directoryL1[dst.directoryL1][i] := resp_directoryL1[dst.directoryL1][i+1];
          else
            undefine resp_directoryL1[dst.directoryL1][i];
          endif;
        endfor;
        cnt_resp_directoryL1[dst.directoryL1] := cnt_resp_directoryL1[dst.directoryL1] - 1;
      elsif !isundefined(dst.cacheL2) then
        error "Attempt to pop from queue resp_cacheL2, which is not modeled"; 
      elsif !isundefined(dst.directoryL2) then
        error "Attempt to pop from queue resp_directoryL2, which is not modeled"; 
      else
        error "unknown pop machine";
      endif;
      
    end;
    
    procedure Send_req(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1) then
        error "Attempt to send to queue req_cacheL1, which is not modeled"; 
      elsif !isundefined(dst.directoryL1) then
        Assert(cnt_req_directoryL1[dst.directoryL1] < O_NET_MAX) "Too many messages: req_directoryL1";
        req_directoryL1[dst.directoryL1][cnt_req_directoryL1[dst.directoryL1]] := msg;
        cnt_req_directoryL1[dst.directoryL1] := cnt_req_directoryL1[dst.directoryL1] + 1;
      elsif !isundefined(dst.cacheL2) then
        error "Attempt to send to queue req_cacheL2, which is not modeled"; 
      elsif !isundefined(dst.directoryL2) then
        error "Attempt to send to queue req_directoryL2, which is not modeled"; 
      else
        error "unknown send machine";
      endif;
      
      endalias;
    end;
    
    procedure Pop_req(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1) then
        error "Attempt to pop from queue req_cacheL1, which is not modeled"; 
      elsif !isundefined(dst.directoryL1) then
        Assert (cnt_req_directoryL1[dst.directoryL1] > 0) "Trying to advance empty queue: req_directoryL1";
        for i := 0 to cnt_req_directoryL1[dst.directoryL1]-1 do
          if i < cnt_req_directoryL1[dst.directoryL1]-1 then
            req_directoryL1[dst.directoryL1][i] := req_directoryL1[dst.directoryL1][i+1];
          else
            undefine req_directoryL1[dst.directoryL1][i];
          endif;
        endfor;
        cnt_req_directoryL1[dst.directoryL1] := cnt_req_directoryL1[dst.directoryL1] - 1;
      elsif !isundefined(dst.cacheL2) then
        error "Attempt to pop from queue req_cacheL2, which is not modeled"; 
      elsif !isundefined(dst.directoryL2) then
        error "Attempt to pop from queue req_directoryL2, which is not modeled"; 
      else
        error "unknown pop machine";
      endif;
      
    end;
    
    procedure Send_fwd(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1) then
        Assert(cnt_fwd_cacheL1[dst.cacheL1] < O_NET_MAX) "Too many messages: fwd_cacheL1";
        fwd_cacheL1[dst.cacheL1][cnt_fwd_cacheL1[dst.cacheL1]] := msg;
        cnt_fwd_cacheL1[dst.cacheL1] := cnt_fwd_cacheL1[dst.cacheL1] + 1;
      elsif !isundefined(dst.directoryL1) then
        Assert(cnt_fwd_directoryL1[dst.directoryL1] < O_NET_MAX) "Too many messages: fwd_directoryL1";
        fwd_directoryL1[dst.directoryL1][cnt_fwd_directoryL1[dst.directoryL1]] := msg;
        cnt_fwd_directoryL1[dst.directoryL1] := cnt_fwd_directoryL1[dst.directoryL1] + 1;
      elsif !isundefined(dst.cacheL2) then
        error "Attempt to send to queue fwd_cacheL2, which is not modeled"; 
      elsif !isundefined(dst.directoryL2) then
        error "Attempt to send to queue fwd_directoryL2, which is not modeled"; 
      else
        error "unknown send machine";
      endif;
      
      endalias;
    end;
    
    procedure Pop_fwd(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1) then
        Assert (cnt_fwd_cacheL1[dst.cacheL1] > 0) "Trying to advance empty queue: fwd_cacheL1";
        for i := 0 to cnt_fwd_cacheL1[dst.cacheL1]-1 do
          if i < cnt_fwd_cacheL1[dst.cacheL1]-1 then
            fwd_cacheL1[dst.cacheL1][i] := fwd_cacheL1[dst.cacheL1][i+1];
          else
            undefine fwd_cacheL1[dst.cacheL1][i];
          endif;
        endfor;
        cnt_fwd_cacheL1[dst.cacheL1] := cnt_fwd_cacheL1[dst.cacheL1] - 1;
      elsif !isundefined(dst.directoryL1) then
        Assert (cnt_fwd_directoryL1[dst.directoryL1] > 0) "Trying to advance empty queue: fwd_directoryL1";
        for i := 0 to cnt_fwd_directoryL1[dst.directoryL1]-1 do
          if i < cnt_fwd_directoryL1[dst.directoryL1]-1 then
            fwd_directoryL1[dst.directoryL1][i] := fwd_directoryL1[dst.directoryL1][i+1];
          else
            undefine fwd_directoryL1[dst.directoryL1][i];
          endif;
        endfor;
        cnt_fwd_directoryL1[dst.directoryL1] := cnt_fwd_directoryL1[dst.directoryL1] - 1;
      elsif !isundefined(dst.cacheL2) then
        error "Attempt to pop from queue fwd_cacheL2, which is not modeled"; 
      elsif !isundefined(dst.directoryL2) then
        error "Attempt to pop from queue fwd_directoryL2, which is not modeled"; 
      else
        error "unknown pop machine";
      endif;
      
    end;
    
    procedure Send_bisnp(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1) then
        error "Attempt to send to queue bisnp_cacheL1, which is not modeled"; 
      elsif !isundefined(dst.directoryL1) then
        Assert(cnt_bisnp_directoryL1[dst.directoryL1] < O_NET_MAX) "Too many messages: bisnp_directoryL1";
        bisnp_directoryL1[dst.directoryL1][cnt_bisnp_directoryL1[dst.directoryL1]] := msg;
        cnt_bisnp_directoryL1[dst.directoryL1] := cnt_bisnp_directoryL1[dst.directoryL1] + 1;
      elsif !isundefined(dst.cacheL2) then
        Assert(cnt_bisnp_cacheL2[dst.cacheL2] < O_NET_MAX) "Too many messages: bisnp_cacheL2";
        bisnp_cacheL2[dst.cacheL2][cnt_bisnp_cacheL2[dst.cacheL2]] := msg;
        cnt_bisnp_cacheL2[dst.cacheL2] := cnt_bisnp_cacheL2[dst.cacheL2] + 1;
      elsif !isundefined(dst.directoryL2) then
        Assert(cnt_bisnp_directoryL2[dst.directoryL2] < O_NET_MAX) "Too many messages: bisnp_directoryL2";
        bisnp_directoryL2[dst.directoryL2][cnt_bisnp_directoryL2[dst.directoryL2]] := msg;
        cnt_bisnp_directoryL2[dst.directoryL2] := cnt_bisnp_directoryL2[dst.directoryL2] + 1;
      else
        error "unknown send machine";
      endif;
      
      endalias;
    end;
    
    procedure Pop_bisnp(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1) then
        error "Attempt to pop from queue bisnp_cacheL1, which is not modeled"; 
      elsif !isundefined(dst.directoryL1) then
        Assert (cnt_bisnp_directoryL1[dst.directoryL1] > 0) "Trying to advance empty queue: bisnp_directoryL1";
        for i := 0 to cnt_bisnp_directoryL1[dst.directoryL1]-1 do
          if i < cnt_bisnp_directoryL1[dst.directoryL1]-1 then
            bisnp_directoryL1[dst.directoryL1][i] := bisnp_directoryL1[dst.directoryL1][i+1];
          else
            undefine bisnp_directoryL1[dst.directoryL1][i];
          endif;
        endfor;
        cnt_bisnp_directoryL1[dst.directoryL1] := cnt_bisnp_directoryL1[dst.directoryL1] - 1;
      elsif !isundefined(dst.cacheL2) then
        Assert (cnt_bisnp_cacheL2[dst.cacheL2] > 0) "Trying to advance empty queue: bisnp_cacheL2";
        for i := 0 to cnt_bisnp_cacheL2[dst.cacheL2]-1 do
          if i < cnt_bisnp_cacheL2[dst.cacheL2]-1 then
            bisnp_cacheL2[dst.cacheL2][i] := bisnp_cacheL2[dst.cacheL2][i+1];
          else
            undefine bisnp_cacheL2[dst.cacheL2][i];
          endif;
        endfor;
        cnt_bisnp_cacheL2[dst.cacheL2] := cnt_bisnp_cacheL2[dst.cacheL2] - 1;
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
      else
        error "unknown pop machine";
      endif;
      
    end;
    
    procedure Send_req2(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1) then
        error "Attempt to send to queue req2_cacheL1, which is not modeled"; 
      elsif !isundefined(dst.directoryL1) then
        Assert(cnt_req2_directoryL1[dst.directoryL1] < O_NET_MAX) "Too many messages: req2_directoryL1";
        req2_directoryL1[dst.directoryL1][cnt_req2_directoryL1[dst.directoryL1]] := msg;
        cnt_req2_directoryL1[dst.directoryL1] := cnt_req2_directoryL1[dst.directoryL1] + 1;
      elsif !isundefined(dst.cacheL2) then
        Assert(cnt_req2_cacheL2[dst.cacheL2] < O_NET_MAX) "Too many messages: req2_cacheL2";
        req2_cacheL2[dst.cacheL2][cnt_req2_cacheL2[dst.cacheL2]] := msg;
        cnt_req2_cacheL2[dst.cacheL2] := cnt_req2_cacheL2[dst.cacheL2] + 1;
      elsif !isundefined(dst.directoryL2) then
        Assert(cnt_req2_directoryL2[dst.directoryL2] < O_NET_MAX) "Too many messages: req2_directoryL2";
        req2_directoryL2[dst.directoryL2][cnt_req2_directoryL2[dst.directoryL2]] := msg;
        cnt_req2_directoryL2[dst.directoryL2] := cnt_req2_directoryL2[dst.directoryL2] + 1;
      else
        error "unknown send machine";
      endif;
      
      endalias;
    end;
    
    procedure Pop_req2(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1) then
        error "Attempt to pop from queue req2_cacheL1, which is not modeled"; 
      elsif !isundefined(dst.directoryL1) then
        Assert (cnt_req2_directoryL1[dst.directoryL1] > 0) "Trying to advance empty queue: req2_directoryL1";
        for i := 0 to cnt_req2_directoryL1[dst.directoryL1]-1 do
          if i < cnt_req2_directoryL1[dst.directoryL1]-1 then
            req2_directoryL1[dst.directoryL1][i] := req2_directoryL1[dst.directoryL1][i+1];
          else
            undefine req2_directoryL1[dst.directoryL1][i];
          endif;
        endfor;
        cnt_req2_directoryL1[dst.directoryL1] := cnt_req2_directoryL1[dst.directoryL1] - 1;
      elsif !isundefined(dst.cacheL2) then
        Assert (cnt_req2_cacheL2[dst.cacheL2] > 0) "Trying to advance empty queue: req2_cacheL2";
        for i := 0 to cnt_req2_cacheL2[dst.cacheL2]-1 do
          if i < cnt_req2_cacheL2[dst.cacheL2]-1 then
            req2_cacheL2[dst.cacheL2][i] := req2_cacheL2[dst.cacheL2][i+1];
          else
            undefine req2_cacheL2[dst.cacheL2][i];
          endif;
        endfor;
        cnt_req2_cacheL2[dst.cacheL2] := cnt_req2_cacheL2[dst.cacheL2] - 1;
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
      else
        error "unknown pop machine";
      endif;
      
    end;
    
    procedure Send_rwd(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1) then
        error "Attempt to send to queue rwd_cacheL1, which is not modeled"; 
      elsif !isundefined(dst.directoryL1) then
        Assert(cnt_rwd_directoryL1[dst.directoryL1] < O_NET_MAX) "Too many messages: rwd_directoryL1";
        rwd_directoryL1[dst.directoryL1][cnt_rwd_directoryL1[dst.directoryL1]] := msg;
        cnt_rwd_directoryL1[dst.directoryL1] := cnt_rwd_directoryL1[dst.directoryL1] + 1;
      elsif !isundefined(dst.cacheL2) then
        Assert(cnt_rwd_cacheL2[dst.cacheL2] < O_NET_MAX) "Too many messages: rwd_cacheL2";
        rwd_cacheL2[dst.cacheL2][cnt_rwd_cacheL2[dst.cacheL2]] := msg;
        cnt_rwd_cacheL2[dst.cacheL2] := cnt_rwd_cacheL2[dst.cacheL2] + 1;
      elsif !isundefined(dst.directoryL2) then
        Assert(cnt_rwd_directoryL2[dst.directoryL2] < O_NET_MAX) "Too many messages: rwd_directoryL2";
        rwd_directoryL2[dst.directoryL2][cnt_rwd_directoryL2[dst.directoryL2]] := msg;
        cnt_rwd_directoryL2[dst.directoryL2] := cnt_rwd_directoryL2[dst.directoryL2] + 1;
      else
        error "unknown send machine";
      endif;
      
      endalias;
    end;
    
    procedure Pop_rwd(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1) then
        error "Attempt to pop from queue rwd_cacheL1, which is not modeled"; 
      elsif !isundefined(dst.directoryL1) then
        Assert (cnt_rwd_directoryL1[dst.directoryL1] > 0) "Trying to advance empty queue: rwd_directoryL1";
        for i := 0 to cnt_rwd_directoryL1[dst.directoryL1]-1 do
          if i < cnt_rwd_directoryL1[dst.directoryL1]-1 then
            rwd_directoryL1[dst.directoryL1][i] := rwd_directoryL1[dst.directoryL1][i+1];
          else
            undefine rwd_directoryL1[dst.directoryL1][i];
          endif;
        endfor;
        cnt_rwd_directoryL1[dst.directoryL1] := cnt_rwd_directoryL1[dst.directoryL1] - 1;
      elsif !isundefined(dst.cacheL2) then
        Assert (cnt_rwd_cacheL2[dst.cacheL2] > 0) "Trying to advance empty queue: rwd_cacheL2";
        for i := 0 to cnt_rwd_cacheL2[dst.cacheL2]-1 do
          if i < cnt_rwd_cacheL2[dst.cacheL2]-1 then
            rwd_cacheL2[dst.cacheL2][i] := rwd_cacheL2[dst.cacheL2][i+1];
          else
            undefine rwd_cacheL2[dst.cacheL2][i];
          endif;
        endfor;
        cnt_rwd_cacheL2[dst.cacheL2] := cnt_rwd_cacheL2[dst.cacheL2] - 1;
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
      else
        error "unknown pop machine";
      endif;
      
    end;
    
    procedure Send_birsp(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1) then
        error "Attempt to send to queue birsp_cacheL1, which is not modeled"; 
      elsif !isundefined(dst.directoryL1) then
        Assert(cnt_birsp_directoryL1[dst.directoryL1] < O_NET_MAX) "Too many messages: birsp_directoryL1";
        birsp_directoryL1[dst.directoryL1][cnt_birsp_directoryL1[dst.directoryL1]] := msg;
        cnt_birsp_directoryL1[dst.directoryL1] := cnt_birsp_directoryL1[dst.directoryL1] + 1;
      elsif !isundefined(dst.cacheL2) then
        Assert(cnt_birsp_cacheL2[dst.cacheL2] < O_NET_MAX) "Too many messages: birsp_cacheL2";
        birsp_cacheL2[dst.cacheL2][cnt_birsp_cacheL2[dst.cacheL2]] := msg;
        cnt_birsp_cacheL2[dst.cacheL2] := cnt_birsp_cacheL2[dst.cacheL2] + 1;
      elsif !isundefined(dst.directoryL2) then
        Assert(cnt_birsp_directoryL2[dst.directoryL2] < O_NET_MAX) "Too many messages: birsp_directoryL2";
        birsp_directoryL2[dst.directoryL2][cnt_birsp_directoryL2[dst.directoryL2]] := msg;
        cnt_birsp_directoryL2[dst.directoryL2] := cnt_birsp_directoryL2[dst.directoryL2] + 1;
      else
        error "unknown send machine";
      endif;
      
      endalias;
    end;
    
    procedure Pop_birsp(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1) then
        error "Attempt to pop from queue birsp_cacheL1, which is not modeled"; 
      elsif !isundefined(dst.directoryL1) then
        Assert (cnt_birsp_directoryL1[dst.directoryL1] > 0) "Trying to advance empty queue: birsp_directoryL1";
        for i := 0 to cnt_birsp_directoryL1[dst.directoryL1]-1 do
          if i < cnt_birsp_directoryL1[dst.directoryL1]-1 then
            birsp_directoryL1[dst.directoryL1][i] := birsp_directoryL1[dst.directoryL1][i+1];
          else
            undefine birsp_directoryL1[dst.directoryL1][i];
          endif;
        endfor;
        cnt_birsp_directoryL1[dst.directoryL1] := cnt_birsp_directoryL1[dst.directoryL1] - 1;
      elsif !isundefined(dst.cacheL2) then
        Assert (cnt_birsp_cacheL2[dst.cacheL2] > 0) "Trying to advance empty queue: birsp_cacheL2";
        for i := 0 to cnt_birsp_cacheL2[dst.cacheL2]-1 do
          if i < cnt_birsp_cacheL2[dst.cacheL2]-1 then
            birsp_cacheL2[dst.cacheL2][i] := birsp_cacheL2[dst.cacheL2][i+1];
          else
            undefine birsp_cacheL2[dst.cacheL2][i];
          endif;
        endfor;
        cnt_birsp_cacheL2[dst.cacheL2] := cnt_birsp_cacheL2[dst.cacheL2] - 1;
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
      else
        error "unknown pop machine";
      endif;
      
    end;
    
    procedure Send_drs(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1) then
        error "Attempt to send to queue drs_cacheL1, which is not modeled"; 
      elsif !isundefined(dst.directoryL1) then
        Assert(cnt_drs_directoryL1[dst.directoryL1] < O_NET_MAX) "Too many messages: drs_directoryL1";
        drs_directoryL1[dst.directoryL1][cnt_drs_directoryL1[dst.directoryL1]] := msg;
        cnt_drs_directoryL1[dst.directoryL1] := cnt_drs_directoryL1[dst.directoryL1] + 1;
      elsif !isundefined(dst.cacheL2) then
        Assert(cnt_drs_cacheL2[dst.cacheL2] < O_NET_MAX) "Too many messages: drs_cacheL2";
        drs_cacheL2[dst.cacheL2][cnt_drs_cacheL2[dst.cacheL2]] := msg;
        cnt_drs_cacheL2[dst.cacheL2] := cnt_drs_cacheL2[dst.cacheL2] + 1;
      elsif !isundefined(dst.directoryL2) then
        Assert(cnt_drs_directoryL2[dst.directoryL2] < O_NET_MAX) "Too many messages: drs_directoryL2";
        drs_directoryL2[dst.directoryL2][cnt_drs_directoryL2[dst.directoryL2]] := msg;
        cnt_drs_directoryL2[dst.directoryL2] := cnt_drs_directoryL2[dst.directoryL2] + 1;
      else
        error "unknown send machine";
      endif;
      
      endalias;
    end;
    
    procedure Pop_drs(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1) then
        error "Attempt to pop from queue drs_cacheL1, which is not modeled"; 
      elsif !isundefined(dst.directoryL1) then
        Assert (cnt_drs_directoryL1[dst.directoryL1] > 0) "Trying to advance empty queue: drs_directoryL1";
        for i := 0 to cnt_drs_directoryL1[dst.directoryL1]-1 do
          if i < cnt_drs_directoryL1[dst.directoryL1]-1 then
            drs_directoryL1[dst.directoryL1][i] := drs_directoryL1[dst.directoryL1][i+1];
          else
            undefine drs_directoryL1[dst.directoryL1][i];
          endif;
        endfor;
        cnt_drs_directoryL1[dst.directoryL1] := cnt_drs_directoryL1[dst.directoryL1] - 1;
      elsif !isundefined(dst.cacheL2) then
        Assert (cnt_drs_cacheL2[dst.cacheL2] > 0) "Trying to advance empty queue: drs_cacheL2";
        for i := 0 to cnt_drs_cacheL2[dst.cacheL2]-1 do
          if i < cnt_drs_cacheL2[dst.cacheL2]-1 then
            drs_cacheL2[dst.cacheL2][i] := drs_cacheL2[dst.cacheL2][i+1];
          else
            undefine drs_cacheL2[dst.cacheL2][i];
          endif;
        endfor;
        cnt_drs_cacheL2[dst.cacheL2] := cnt_drs_cacheL2[dst.cacheL2] - 1;
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
      else
        error "unknown pop machine";
      endif;
      
    end;
    
    procedure Send_ndr(msg:Message; src: Machines;);
    begin
      alias dst : msg.dst do
      if !isundefined(dst.cacheL1) then
        error "Attempt to send to queue ndr_cacheL1, which is not modeled"; 
      elsif !isundefined(dst.directoryL1) then
        Assert(cnt_ndr_directoryL1[dst.directoryL1] < O_NET_MAX) "Too many messages: ndr_directoryL1";
        ndr_directoryL1[dst.directoryL1][cnt_ndr_directoryL1[dst.directoryL1]] := msg;
        cnt_ndr_directoryL1[dst.directoryL1] := cnt_ndr_directoryL1[dst.directoryL1] + 1;
      elsif !isundefined(dst.cacheL2) then
        Assert(cnt_ndr_cacheL2[dst.cacheL2] < O_NET_MAX) "Too many messages: ndr_cacheL2";
        ndr_cacheL2[dst.cacheL2][cnt_ndr_cacheL2[dst.cacheL2]] := msg;
        cnt_ndr_cacheL2[dst.cacheL2] := cnt_ndr_cacheL2[dst.cacheL2] + 1;
      elsif !isundefined(dst.directoryL2) then
        Assert(cnt_ndr_directoryL2[dst.directoryL2] < O_NET_MAX) "Too many messages: ndr_directoryL2";
        ndr_directoryL2[dst.directoryL2][cnt_ndr_directoryL2[dst.directoryL2]] := msg;
        cnt_ndr_directoryL2[dst.directoryL2] := cnt_ndr_directoryL2[dst.directoryL2] + 1;
      else
        error "unknown send machine";
      endif;
      
      endalias;
    end;
    
    procedure Pop_ndr(dst:Machines; src: Machines;);
    begin
      if !isundefined(dst.cacheL1) then
        error "Attempt to pop from queue ndr_cacheL1, which is not modeled"; 
      elsif !isundefined(dst.directoryL1) then
        Assert (cnt_ndr_directoryL1[dst.directoryL1] > 0) "Trying to advance empty queue: ndr_directoryL1";
        for i := 0 to cnt_ndr_directoryL1[dst.directoryL1]-1 do
          if i < cnt_ndr_directoryL1[dst.directoryL1]-1 then
            ndr_directoryL1[dst.directoryL1][i] := ndr_directoryL1[dst.directoryL1][i+1];
          else
            undefine ndr_directoryL1[dst.directoryL1][i];
          endif;
        endfor;
        cnt_ndr_directoryL1[dst.directoryL1] := cnt_ndr_directoryL1[dst.directoryL1] - 1;
      elsif !isundefined(dst.cacheL2) then
        Assert (cnt_ndr_cacheL2[dst.cacheL2] > 0) "Trying to advance empty queue: ndr_cacheL2";
        for i := 0 to cnt_ndr_cacheL2[dst.cacheL2]-1 do
          if i < cnt_ndr_cacheL2[dst.cacheL2]-1 then
            ndr_cacheL2[dst.cacheL2][i] := ndr_cacheL2[dst.cacheL2][i+1];
          else
            undefine ndr_cacheL2[dst.cacheL2][i];
          endif;
        endfor;
        cnt_ndr_cacheL2[dst.cacheL2] := cnt_ndr_cacheL2[dst.cacheL2] - 1;
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
      else
        error "unknown pop machine";
      endif;
      
    end;
    
    procedure Multicast_bisnp_v_cacheL2(var msg: Message; dst_vect: v_cacheL2; src: Machines;);
    begin
      for n : OBJSET_cacheL2 do
        if IsElement_cacheL2(dst_vect, to_m_cacheL2(n)) then
          msg.dst := to_m_cacheL2(n);
          Send_bisnp(msg, src);
        endif;
      endfor;
      for n : OBJSET_cacheL1 do
        if IsElement_cacheL2(dst_vect, to_m_cacheL1(n)) then
          msg.dst := to_m_cacheL1(n);
          Send_bisnp(msg, src);
        endif;
      endfor;
      for n : OBJSET_directoryL1 do
        if IsElement_cacheL2(dst_vect, to_m_directoryL1(n)) then
          msg.dst := to_m_directoryL1(n);
          Send_bisnp(msg, src);
        endif;
      endfor;
    
    end;
    
    function req2_network_ready(): boolean;
    begin
      for dst:OBJSET_cacheL2 do
        if cnt_req2_cacheL2[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2 do
        if cnt_req2_directoryL2[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL1 do
        if cnt_req2_directoryL1[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function ndr_network_ready(): boolean;
    begin
      for dst:OBJSET_cacheL2 do
        if cnt_ndr_cacheL2[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2 do
        if cnt_ndr_directoryL2[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL1 do
        if cnt_ndr_directoryL1[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function drs_network_ready(): boolean;
    begin
      for dst:OBJSET_cacheL2 do
        if cnt_drs_cacheL2[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2 do
        if cnt_drs_directoryL2[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL1 do
        if cnt_drs_directoryL1[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function fwd_network_ready(): boolean;
    begin
      for dst:OBJSET_cacheL1 do
        if cnt_fwd_cacheL1[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL1 do
        if cnt_fwd_directoryL1[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function resp_network_ready(): boolean;
    begin
      for dst:OBJSET_cacheL1 do
        if cnt_resp_cacheL1[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL1 do
        if cnt_resp_directoryL1[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function bisnp_network_ready(): boolean;
    begin
      for dst:OBJSET_cacheL2 do
        if cnt_bisnp_cacheL2[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2 do
        if cnt_bisnp_directoryL2[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL1 do
        if cnt_bisnp_directoryL1[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function birsp_network_ready(): boolean;
    begin
      for dst:OBJSET_cacheL2 do
        if cnt_birsp_cacheL2[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2 do
        if cnt_birsp_directoryL2[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL1 do
        if cnt_birsp_directoryL1[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function req_network_ready(): boolean;
    begin
      for dst:OBJSET_directoryL1 do
        if cnt_req_directoryL1[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function rwd_network_ready(): boolean;
    begin
      for dst:OBJSET_cacheL2 do
        if cnt_rwd_cacheL2[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL2 do
        if cnt_rwd_directoryL2[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
      for dst:OBJSET_directoryL1 do
        if cnt_rwd_directoryL1[dst] >= (O_NET_MAX-9) then
          return false;
        endif;
      endfor;
    
    
      return true;
    end;
    function network_ready(): boolean;
    begin
            if !req2_network_ready() then
            return false;
          endif;
    
    
          if !ndr_network_ready() then
            return false;
          endif;
    
    
          if !drs_network_ready() then
            return false;
          endif;
    
    
          if !fwd_network_ready() then
            return false;
          endif;
    
    
          if !resp_network_ready() then
            return false;
          endif;
    
    
          if !bisnp_network_ready() then
            return false;
          endif;
    
    
          if !birsp_network_ready() then
            return false;
          endif;
    
    
          if !req_network_ready() then
            return false;
          endif;
    
    
          if !rwd_network_ready() then
            return false;
          endif;
    
    
    
      return true;
    end;
    
    procedure Reset_NET_();
    begin
      undefine bisnp_cacheL2;
      undefine req2_cacheL2;
      undefine rwd_cacheL2;
      undefine birsp_cacheL2;
      undefine drs_cacheL2;
      undefine ndr_cacheL2;
      for dst:OBJSET_cacheL2 do
        cnt_bisnp_cacheL2[dst] := 0;
        cnt_req2_cacheL2[dst] := 0;
        cnt_rwd_cacheL2[dst] := 0;
        cnt_birsp_cacheL2[dst] := 0;
        cnt_drs_cacheL2[dst] := 0;
        cnt_ndr_cacheL2[dst] := 0;
      endfor;
      
      undefine resp_cacheL1;
      undefine fwd_cacheL1;
      for dst:OBJSET_cacheL1 do
        cnt_resp_cacheL1[dst] := 0;
        cnt_fwd_cacheL1[dst] := 0;
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
      
      undefine resp_directoryL1;
      undefine req_directoryL1;
      undefine fwd_directoryL1;
      undefine bisnp_directoryL1;
      undefine req2_directoryL1;
      undefine rwd_directoryL1;
      undefine birsp_directoryL1;
      undefine drs_directoryL1;
      undefine ndr_directoryL1;
      for dst:OBJSET_directoryL1 do
        cnt_resp_directoryL1[dst] := 0;
        cnt_req_directoryL1[dst] := 0;
        cnt_fwd_directoryL1[dst] := 0;
        cnt_bisnp_directoryL1[dst] := 0;
        cnt_req2_directoryL1[dst] := 0;
        cnt_rwd_directoryL1[dst] := 0;
        cnt_birsp_directoryL1[dst] := 0;
        cnt_drs_directoryL1[dst] := 0;
        cnt_ndr_directoryL1[dst] := 0;
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
    
  

--Backend/Murphi/MurphiModular/GenStateMachines

  ----Backend/Murphi/MurphiModular/StateMachines/GenAccessStateMachines
    procedure FSM_Access_cacheL1_I_acq_eventL1(adr:Address; mTyped:OBJSET_cacheL1);
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      ServeRemoteEvent_cacheL1(cacheL1_acq_eventL1, m, adr);
      Clear_perm(adr, m);
      cbe.State := cacheL1_I;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_I_acquire(adr:Address; mTyped:OBJSET_cacheL1);
    var msg: Message;
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      msg := RequestL1(adr,GetVL1,m,to_m_directoryL1(directoryL1));
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1_I_acquire;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_I_load(adr:Address; mTyped:OBJSET_cacheL1);
    var msg: Message;
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      msg := RequestL1(adr,GetVL1,m,to_m_directoryL1(directoryL1));
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1_I_load;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_I_rel_eventL1(adr:Address; mTyped:OBJSET_cacheL1);
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      ServeRemoteEvent_cacheL1(cacheL1_rel_eventL1, m, adr);
      Clear_perm(adr, m);
      cbe.State := cacheL1_I;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_I_release(adr:Address; mTyped:OBJSET_cacheL1);
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      IssueEvent_cacheL1(cacheL1_rel_eventL1, m, adr);
      Clear_perm(adr, m);
      cbe.State := cacheL1_I_release;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_I_store(adr:Address; mTyped:OBJSET_cacheL1);
    var msg: Message;
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      msg := RequestL1(adr,GetVL1,m,to_m_directoryL1(directoryL1));
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1_I_store;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_I_acquire_GetV_Ack_acq_eventL1(adr:Address; mTyped:OBJSET_cacheL1);
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1_VC;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_I_release_rel_eventL1(adr:Address; mTyped:OBJSET_cacheL1);
    var msg: Message;
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      msg := RequestL1(adr,GetRL1,m,to_m_directoryL1(directoryL1));
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1_I_release_rel_event;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_VC_acq_eventL1(adr:Address; mTyped:OBJSET_cacheL1);
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      ServeRemoteEvent_cacheL1(cacheL1_acq_eventL1, m, adr);
      Clear_perm(adr, m);
      cbe.State := cacheL1_I;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_VC_acquire(adr:Address; mTyped:OBJSET_cacheL1);
    var msg: Message;
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      msg := RequestL1(adr,GetVL1,m,to_m_directoryL1(directoryL1));
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1_VC_acquire;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_VC_evict(adr:Address; mTyped:OBJSET_cacheL1);
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      Clear_perm(adr, m);
      cbe.State := cacheL1_I;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_VC_load(adr:Address; mTyped:OBJSET_cacheL1);
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1_VC;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_VC_rel_eventL1(adr:Address; mTyped:OBJSET_cacheL1);
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      ServeRemoteEvent_cacheL1(cacheL1_rel_eventL1, m, adr);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1_VC;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_VC_release(adr:Address; mTyped:OBJSET_cacheL1);
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      IssueEvent_cacheL1(cacheL1_rel_eventL1, m, adr);
      Clear_perm(adr, m);
      cbe.State := cacheL1_VC_release;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_VC_store(adr:Address; mTyped:OBJSET_cacheL1);
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      Set_perm(store, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1_VD;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_VC_acquire_GetV_Ack_acq_eventL1(adr:Address; mTyped:OBJSET_cacheL1);
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1_VC;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_VC_release_rel_eventL1(adr:Address; mTyped:OBJSET_cacheL1);
    var msg: Message;
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      Set_perm(store, adr, m);
      msg := RespL1(adr,PutVL1,m,to_m_directoryL1(directoryL1),cbe.cl);
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1_VC_release_rel_event;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_VD_acq_eventL1(adr:Address; mTyped:OBJSET_cacheL1);
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      ServeRemoteEvent_cacheL1(cacheL1_acq_eventL1, m, adr);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1_VD;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_VD_acquire(adr:Address; mTyped:OBJSET_cacheL1);
    var msg: Message;
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      msg := RequestL1(adr,GetVL1,m,to_m_directoryL1(directoryL1));
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1_VD_acquire;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_VD_evict(adr:Address; mTyped:OBJSET_cacheL1);
    var msg: Message;
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      msg := RespL1(adr,PutVL1,m,to_m_directoryL1(directoryL1),cbe.cl);
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1_VD_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_VD_load(adr:Address; mTyped:OBJSET_cacheL1);
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1_VD;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_VD_rel_eventL1(adr:Address; mTyped:OBJSET_cacheL1);
    var msg: Message;
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      msg := RespL1(adr,PutVL1,m,to_m_directoryL1(directoryL1),cbe.cl);
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1_VD_rel_event;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_VD_release(adr:Address; mTyped:OBJSET_cacheL1);
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      IssueEvent_cacheL1(cacheL1_rel_eventL1, m, adr);
      Clear_perm(adr, m);
      cbe.State := cacheL1_VD_release;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_VD_store(adr:Address; mTyped:OBJSET_cacheL1);
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      Set_perm(store, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1_VD;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_VD_acquire_GetV_Ack_acq_eventL1(adr:Address; mTyped:OBJSET_cacheL1);
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL1_VC;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL1_VD_release_rel_eventL1(adr:Address; mTyped:OBJSET_cacheL1);
    var msg: Message;
    begin
    alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
      Set_perm(store, adr, m);
      msg := RespL1(adr,PutVL1,m,to_m_directoryL1(directoryL1),cbe.cl);
      Send_req(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL1_VD_release_rel_event;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1_V__C__E_acq_eventL1(adr:Address; mTyped:OBJSET_directoryL1);
    begin
    alias cbe: i_directoryL1[mTyped].cb[adr] do
    alias m : to_m_directoryL1(mTyped) do
      ServeRemoteEvent_directoryL1(directoryL1_acq_eventL1, m, adr);
      Clear_perm(adr, m);
      cbe.State := directoryL1_V__C__E;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1_V__C__E_evict(adr:Address; mTyped:OBJSET_directoryL1);
    var msg_GetR_AckL1: Message;
    var msg_PutRL1: Message;
    var msg_PutR_AckL1: Message;
    var msg: Message;
    begin
    alias cbe: i_directoryL1[mTyped].cb[adr] do
    alias m : to_m_directoryL1(mTyped) do
      msg_GetR_AckL1 := RespL1(adr,GetR_AckL1,m,m,cbe.cl);
      cbe.cl := msg_GetR_AckL1.cl;
      Set_perm(store, adr, m);
      msg_PutRL1 := RespL1(adr,PutRL1,m,m,cbe.cl);
      msg_PutR_AckL1 := AckL1(adr,PutR_AckL1,m,msg_PutRL1.src);
      cbe.cl := msg_PutRL1.cl;
      msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2(directoryL2));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := directoryL1_evictV__C__E_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1_V__C__E_rel_eventL1(adr:Address; mTyped:OBJSET_directoryL1);
    begin
    alias cbe: i_directoryL1[mTyped].cb[adr] do
    alias m : to_m_directoryL1(mTyped) do
      ServeRemoteEvent_directoryL1(directoryL1_rel_eventL1, m, adr);
      Clear_perm(adr, m);
      cbe.State := directoryL1_V__C__E;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1_V__C__I_acq_eventL1(adr:Address; mTyped:OBJSET_directoryL1);
    begin
    alias cbe: i_directoryL1[mTyped].cb[adr] do
    alias m : to_m_directoryL1(mTyped) do
      ServeRemoteEvent_directoryL1(directoryL1_acq_eventL1, m, adr);
      Clear_perm(adr, m);
      cbe.State := directoryL1_V__C__I;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1_V__C__I_rel_eventL1(adr:Address; mTyped:OBJSET_directoryL1);
    begin
    alias cbe: i_directoryL1[mTyped].cb[adr] do
    alias m : to_m_directoryL1(mTyped) do
      ServeRemoteEvent_directoryL1(directoryL1_rel_eventL1, m, adr);
      Clear_perm(adr, m);
      cbe.State := directoryL1_V__C__I;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1_V__C__M_acq_eventL1(adr:Address; mTyped:OBJSET_directoryL1);
    begin
    alias cbe: i_directoryL1[mTyped].cb[adr] do
    alias m : to_m_directoryL1(mTyped) do
      ServeRemoteEvent_directoryL1(directoryL1_acq_eventL1, m, adr);
      Clear_perm(adr, m);
      cbe.State := directoryL1_V__C__M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1_V__C__M_evict(adr:Address; mTyped:OBJSET_directoryL1);
    var msg_GetR_AckL1: Message;
    var msg_PutRL1: Message;
    var msg_PutR_AckL1: Message;
    var msg: Message;
    begin
    alias cbe: i_directoryL1[mTyped].cb[adr] do
    alias m : to_m_directoryL1(mTyped) do
      msg_GetR_AckL1 := RespL1(adr,GetR_AckL1,m,m,cbe.cl);
      cbe.cl := msg_GetR_AckL1.cl;
      Set_perm(store, adr, m);
      msg_PutRL1 := RespL1(adr,PutRL1,m,m,cbe.cl);
      msg_PutR_AckL1 := AckL1(adr,PutR_AckL1,m,msg_PutRL1.src);
      cbe.cl := msg_PutRL1.cl;
      msg := RwdL2(adr,MemWr_IL2,m,to_m_directoryL2(directoryL2),cbe.cl);
      Send_rwd(msg, m);
      Clear_perm(adr, m);
      cbe.State := directoryL1_evictV__C__M_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1_V__C__M_rel_eventL1(adr:Address; mTyped:OBJSET_directoryL1);
    begin
    alias cbe: i_directoryL1[mTyped].cb[adr] do
    alias m : to_m_directoryL1(mTyped) do
      ServeRemoteEvent_directoryL1(directoryL1_rel_eventL1, m, adr);
      Clear_perm(adr, m);
      cbe.State := directoryL1_V__C__M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1_V__C__S_acq_eventL1(adr:Address; mTyped:OBJSET_directoryL1);
    begin
    alias cbe: i_directoryL1[mTyped].cb[adr] do
    alias m : to_m_directoryL1(mTyped) do
      ServeRemoteEvent_directoryL1(directoryL1_acq_eventL1, m, adr);
      Clear_perm(adr, m);
      cbe.State := directoryL1_V__C__S;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1_V__C__S_evict(adr:Address; mTyped:OBJSET_directoryL1);
    var msg_GetR_AckL1: Message;
    var msg_PutRL1: Message;
    var msg_PutR_AckL1: Message;
    var msg: Message;
    begin
    alias cbe: i_directoryL1[mTyped].cb[adr] do
    alias m : to_m_directoryL1(mTyped) do
      msg_GetR_AckL1 := RespL1(adr,GetR_AckL1,m,m,cbe.cl);
      cbe.cl := msg_GetR_AckL1.cl;
      Set_perm(store, adr, m);
      msg_PutRL1 := RespL1(adr,PutRL1,m,m,cbe.cl);
      msg_PutR_AckL1 := AckL1(adr,PutR_AckL1,m,msg_PutRL1.src);
      cbe.cl := msg_PutRL1.cl;
      msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2(directoryL2));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := directoryL1_evictV__C__S_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_directoryL1_V__C__S_rel_eventL1(adr:Address; mTyped:OBJSET_directoryL1);
    begin
    alias cbe: i_directoryL1[mTyped].cb[adr] do
    alias m : to_m_directoryL1(mTyped) do
      ServeRemoteEvent_directoryL1(directoryL1_rel_eventL1, m, adr);
      Clear_perm(adr, m);
      cbe.State := directoryL1_V__C__S;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2_E_evict(adr:Address; mTyped:OBJSET_cacheL2);
    var msg: Message;
    begin
    alias cbe: i_cacheL2[mTyped].cb[adr] do
    alias m : to_m_cacheL2(mTyped) do
      msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2(directoryL2));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL2_E_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2_E_load(adr:Address; mTyped:OBJSET_cacheL2);
    begin
    alias cbe: i_cacheL2[mTyped].cb[adr] do
    alias m : to_m_cacheL2(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL2_E;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2_E_store(adr:Address; mTyped:OBJSET_cacheL2);
    begin
    alias cbe: i_cacheL2[mTyped].cb[adr] do
    alias m : to_m_cacheL2(mTyped) do
      Set_perm(store, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL2_M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2_I_load(adr:Address; mTyped:OBJSET_cacheL2);
    var msg: Message;
    begin
    alias cbe: i_cacheL2[mTyped].cb[adr] do
    alias m : to_m_cacheL2(mTyped) do
      msg := ReqL2(adr,MemRd_S_SnpDataL2,m,to_m_directoryL2(directoryL2));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL2_I_load;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2_I_store(adr:Address; mTyped:OBJSET_cacheL2);
    var msg: Message;
    begin
    alias cbe: i_cacheL2[mTyped].cb[adr] do
    alias m : to_m_cacheL2(mTyped) do
      msg := ReqL2(adr,MemRd_A_SnpInvL2,m,to_m_directoryL2(directoryL2));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL2_I_store;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2_M_evict(adr:Address; mTyped:OBJSET_cacheL2);
    var msg: Message;
    begin
    alias cbe: i_cacheL2[mTyped].cb[adr] do
    alias m : to_m_cacheL2(mTyped) do
      msg := RwdL2(adr,MemWr_IL2,m,to_m_directoryL2(directoryL2),cbe.cl);
      Send_rwd(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL2_M_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2_M_load(adr:Address; mTyped:OBJSET_cacheL2);
    begin
    alias cbe: i_cacheL2[mTyped].cb[adr] do
    alias m : to_m_cacheL2(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL2_M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2_M_store(adr:Address; mTyped:OBJSET_cacheL2);
    begin
    alias cbe: i_cacheL2[mTyped].cb[adr] do
    alias m : to_m_cacheL2(mTyped) do
      Set_perm(store, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
      cbe.State := cacheL2_M;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2_S_evict(adr:Address; mTyped:OBJSET_cacheL2);
    var msg: Message;
    begin
    alias cbe: i_cacheL2[mTyped].cb[adr] do
    alias m : to_m_cacheL2(mTyped) do
      msg := ReqL2(adr,MemClnEvct_IL2,m,to_m_directoryL2(directoryL2));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL2_S_evict;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2_S_load(adr:Address; mTyped:OBJSET_cacheL2);
    begin
    alias cbe: i_cacheL2[mTyped].cb[adr] do
    alias m : to_m_cacheL2(mTyped) do
      Set_perm(load, adr, m);
      Clear_perm(adr, m); Set_perm(load, adr, m);
      cbe.State := cacheL2_S;
      return;
    endalias;
    endalias;
    end;
    
    procedure FSM_Access_cacheL2_S_store(adr:Address; mTyped:OBJSET_cacheL2);
    var msg: Message;
    begin
    alias cbe: i_cacheL2[mTyped].cb[adr] do
    alias m : to_m_cacheL2(mTyped) do
      msg := ReqL2(adr,MemInv_A_SnpInvL2,m,to_m_directoryL2(directoryL2));
      Send_req2(msg, m);
      Clear_perm(adr, m);
      cbe.State := cacheL2_S_store;
      return;
    endalias;
    endalias;
    end;
    
  ----Backend/Murphi/MurphiModular/StateMachines/GenMessageStateMachines
    function FSM_MSG_cacheL1(inmsg:Message; mTyped:OBJSET_cacheL1) : boolean;
    var msg: Message;
    begin
      alias adr: inmsg.adr do
      alias cbe: i_cacheL1[mTyped].cb[adr] do
    alias m : to_m_cacheL1(mTyped) do
    switch cbe.State
      case cacheL1_I:
      switch inmsg.mtype
        else return false;
      endswitch;
      
      case cacheL1_I_acquire:
      switch inmsg.mtype
        case GetV_AckL1:
          cbe.cl := inmsg.cl;
          IssueEvent_cacheL1(cacheL1_acq_eventL1, m, adr);
          Clear_perm(adr, m);
          cbe.State := cacheL1_I_acquire_GetV_Ack;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1_I_acquire_GetV_Ack:
      switch inmsg.mtype
        else return false;
      endswitch;
      
      case cacheL1_I_load:
      switch inmsg.mtype
        case GetV_AckL1:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL1_VC;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1_I_release:
      switch inmsg.mtype
        else return false;
      endswitch;
      
      case cacheL1_I_release_rel_event:
      switch inmsg.mtype
        case GetR_AckL1:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg := RespL1(adr,PutRL1,m,to_m_directoryL1(directoryL1),cbe.cl);
          Send_resp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL1_I_release_rel_event_GetR_Ack;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1_I_release_rel_event_GetR_Ack:
      switch inmsg.mtype
        case PutR_AckL1:
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL1_VC;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1_I_store:
      switch inmsg.mtype
        case GetV_AckL1:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL1_VD;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1_VC:
      switch inmsg.mtype
        else return false;
      endswitch;
      
      case cacheL1_VC_acquire:
      switch inmsg.mtype
        case GetV_AckL1:
          cbe.cl := inmsg.cl;
          IssueEvent_cacheL1(cacheL1_acq_eventL1, m, adr);
          Clear_perm(adr, m);
          cbe.State := cacheL1_VC_acquire_GetV_Ack;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1_VC_acquire_GetV_Ack:
      switch inmsg.mtype
        else return false;
      endswitch;
      
      case cacheL1_VC_release:
      switch inmsg.mtype
        else return false;
      endswitch;
      
      case cacheL1_VC_release_rel_event:
      switch inmsg.mtype
        case PutV_AckL1:
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL1_VC;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1_VD:
      switch inmsg.mtype
        else return false;
      endswitch;
      
      case cacheL1_VD_acquire:
      switch inmsg.mtype
        case GetV_AckL1:
          cbe.cl := inmsg.cl;
          IssueEvent_cacheL1(cacheL1_acq_eventL1, m, adr);
          Clear_perm(adr, m);
          cbe.State := cacheL1_VD_acquire_GetV_Ack;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1_VD_acquire_GetV_Ack:
      switch inmsg.mtype
        else return false;
      endswitch;
      
      case cacheL1_VD_evict:
      switch inmsg.mtype
        case PutV_AckL1:
          Clear_perm(adr, m);
          cbe.State := cacheL1_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1_VD_rel_event:
      switch inmsg.mtype
        case PutV_AckL1:
          ServeRemoteEvent_cacheL1(cacheL1_rel_eventL1, m, adr);
          Clear_perm(adr, m);
          cbe.State := cacheL1_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL1_VD_release:
      switch inmsg.mtype
        else return false;
      endswitch;
      
      case cacheL1_VD_release_rel_event:
      switch inmsg.mtype
        case PutV_AckL1:
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL1_VC;
          return true;
        
        else return false;
      endswitch;
      
    endswitch;
    endalias;
    endalias;
    endalias;
    return false;
    end;
    
    function FSM_MSG_directoryL1(inmsg:Message; mTyped:OBJSET_directoryL1) : boolean;
    var msg: Message;
    var msg_GetR_AckL1: Message;
    var msg_PutRL1: Message;
    var msg_PutR_AckL1: Message;
    var msg_GetVL1: Message;
    var msg_GetV_AckL1: Message;
    begin
      alias adr: inmsg.adr do
      alias cbe: i_directoryL1[mTyped].cb[adr] do
    alias m : to_m_directoryL1(mTyped) do
    switch cbe.State
      case directoryL1_BIConflictAckL2V__C__M_BIConflictAck:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1_BISnpDataL2V__C__M_BISnpData:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspSL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__S;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1_BISnpInvL2V__C__M_BISnpInv:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1_GetRL1V_GetR__C__M:
      switch inmsg.mtype
        case PutRL1:
          msg := AckL1(adr,PutR_AckL1,m,inmsg.src);
          Send_fwd(msg, m);
          cbe.cl := inmsg.cl;
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1_GetRL1V__C__I_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_GetRL1V__C__I_store;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_GetRL1V__C__I_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_GetRL1V__C__I_store;
          return true;
        
        case Cmp_EL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1_GetRL1V__C__I_store_Cmp_E;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1_GetRL1V__C__I_store_Cmp_E:
      switch inmsg.mtype
        case MemDataL2:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg := RespL1(adr,GetR_AckL1,m,cbe.proxy_msgL1.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1_GetRL1V_GetR__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1_GetRL1V__C__S_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_GetRL1V__C__I_store;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_GetRL1V__C__S_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_GetRL1V__C__S_store;
          return true;
        
        case Cmp_EL2:
          Set_perm(store, adr, m);
          msg := RespL1(adr,GetR_AckL1,m,cbe.proxy_msgL1.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1_GetRL1V_GetR__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1_GetVL1V__C__I_load:
      switch inmsg.mtype
        case BIConflictAckL2:
          cbe.proxy_msgL2 := inmsg;
          msg_GetR_AckL1 := RespL1(adr,GetR_AckL1,m,m,cbe.cl);
          cbe.cl := msg_GetR_AckL1.cl;
          Set_perm(store, adr, m);
          msg_PutRL1 := RespL1(adr,PutRL1,m,m,cbe.cl);
          msg_PutR_AckL1 := AckL1(adr,PutR_AckL1,m,msg_PutRL1.src);
          cbe.cl := msg_PutRL1.cl;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1_GetVL1V__C__I_load;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_GetVL1V__C__I_load;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_GetVL1V__C__I_load;
          return true;
        
        case Cmp_EL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1_GetVL1V__C__I_load_Cmp_E;
          return true;
        
        case Cmp_SL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1_GetVL1V__C__I_load_Cmp_S;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1_GetVL1V__C__I_load_Cmp_E:
      switch inmsg.mtype
        case MemDataL2:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          msg := RespL1(adr,GetV_AckL1,m,cbe.proxy_msgL1.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__E;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1_GetVL1V__C__I_load_Cmp_S:
      switch inmsg.mtype
        case MemDataL2:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          msg := RespL1(adr,GetV_AckL1,m,cbe.proxy_msgL1.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__S;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1_PutVL1V__C__I_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          cbe.proxy_msgL2 := inmsg;
          msg_GetR_AckL1 := RespL1(adr,GetR_AckL1,m,m,cbe.cl);
          cbe.cl := msg_GetR_AckL1.cl;
          Set_perm(store, adr, m);
          msg_PutRL1 := RespL1(adr,PutRL1,m,m,cbe.cl);
          msg_PutR_AckL1 := AckL1(adr,PutR_AckL1,m,msg_PutRL1.src);
          cbe.cl := msg_PutRL1.cl;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1_PutVL1V__C__I_store;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_PutVL1V__C__I_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_PutVL1V__C__I_store;
          return true;
        
        case Cmp_EL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1_PutVL1V__C__I_store_Cmp_E;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1_PutVL1V__C__I_store_Cmp_E:
      switch inmsg.mtype
        case MemDataL2:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          msg := AckL1(adr,PutV_AckL1,m,cbe.proxy_msgL1.src);
          Send_fwd(msg, m);
          cbe.cl := cbe.proxy_msgL1.cl;
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1_PutVL1V__C__S_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          cbe.proxy_msgL2 := inmsg;
          msg_GetR_AckL1 := RespL1(adr,GetR_AckL1,m,m,cbe.cl);
          cbe.cl := msg_GetR_AckL1.cl;
          Set_perm(store, adr, m);
          msg_PutRL1 := RespL1(adr,PutRL1,m,m,cbe.cl);
          msg_PutR_AckL1 := AckL1(adr,PutR_AckL1,m,msg_PutRL1.src);
          cbe.cl := msg_PutRL1.cl;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1_PutVL1V__C__I_store;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_PutVL1V__C__S_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_PutVL1V__C__S_store;
          return true;
        
        case Cmp_EL2:
          Set_perm(store, adr, m);
          msg := AckL1(adr,PutV_AckL1,m,cbe.proxy_msgL1.src);
          Send_fwd(msg, m);
          cbe.cl := cbe.proxy_msgL1.cl;
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1_V__C__E:
      switch inmsg.mtype
        case BIConflictAckL2:
          cbe.proxy_msgL2 := inmsg;
          msg_GetR_AckL1 := RespL1(adr,GetR_AckL1,m,m,cbe.cl);
          cbe.cl := msg_GetR_AckL1.cl;
          Set_perm(store, adr, m);
          msg_PutRL1 := RespL1(adr,PutRL1,m,m,cbe.cl);
          msg_PutR_AckL1 := AckL1(adr,PutR_AckL1,m,msg_PutRL1.src);
          cbe.cl := msg_PutRL1.cl;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__I;
          return true;
        
        case BISnpDataL2:
          msg_GetVL1 := RequestL1(adr,GetVL1,m,m);
          msg_GetV_AckL1 := RespL1(adr,GetV_AckL1,m,msg_GetVL1.src,cbe.cl);
          cbe.cl := msg_GetV_AckL1.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspSL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__S;
          return true;
        
        case BISnpInvL2:
          cbe.proxy_msgL2 := inmsg;
          msg_GetR_AckL1 := RespL1(adr,GetR_AckL1,m,m,cbe.cl);
          cbe.cl := msg_GetR_AckL1.cl;
          Set_perm(store, adr, m);
          msg_PutRL1 := RespL1(adr,PutRL1,m,m,cbe.cl);
          msg_PutR_AckL1 := AckL1(adr,PutR_AckL1,m,msg_PutRL1.src);
          cbe.cl := msg_PutRL1.cl;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__I;
          return true;
        
        case GetRL1:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1 := inmsg;
          msg := RespL1(adr,GetR_AckL1,m,cbe.proxy_msgL1.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1_GetRL1V_GetR__C__M;
          return true;
        
        case GetVL1:
          Set_perm(load, adr, m);
          cbe.proxy_msgL1 := inmsg;
          msg := RespL1(adr,GetV_AckL1,m,cbe.proxy_msgL1.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__E;
          return true;
        
        case PutVL1:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1 := inmsg;
          msg := AckL1(adr,PutV_AckL1,m,cbe.proxy_msgL1.src);
          Send_fwd(msg, m);
          cbe.cl := cbe.proxy_msgL1.cl;
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1_V__C__I:
      switch inmsg.mtype
        case BIConflictAckL2:
          cbe.proxy_msgL2 := inmsg;
          msg_GetR_AckL1 := RespL1(adr,GetR_AckL1,m,m,cbe.cl);
          cbe.cl := msg_GetR_AckL1.cl;
          Set_perm(store, adr, m);
          msg_PutRL1 := RespL1(adr,PutRL1,m,m,cbe.cl);
          msg_PutR_AckL1 := AckL1(adr,PutR_AckL1,m,msg_PutRL1.src);
          cbe.cl := msg_PutRL1.cl;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__I;
          return true;
        
        case BISnpDataL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__I;
          return true;
        
        case BISnpInvL2:
          cbe.proxy_msgL2 := inmsg;
          msg_GetR_AckL1 := RespL1(adr,GetR_AckL1,m,m,cbe.cl);
          cbe.cl := msg_GetR_AckL1.cl;
          Set_perm(store, adr, m);
          msg_PutRL1 := RespL1(adr,PutRL1,m,m,cbe.cl);
          msg_PutR_AckL1 := AckL1(adr,PutR_AckL1,m,msg_PutRL1.src);
          cbe.cl := msg_PutRL1.cl;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__I;
          return true;
        
        case GetRL1:
          msg := ReqL2(adr,MemRd_A_SnpInvL2,m,to_m_directoryL2(directoryL2));
          Send_req2(msg, m);
          cbe.proxy_msgL1 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1_GetRL1V__C__I_store;
          return true;
        
        case GetVL1:
          msg := ReqL2(adr,MemRd_S_SnpDataL2,m,to_m_directoryL2(directoryL2));
          Send_req2(msg, m);
          cbe.proxy_msgL1 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1_GetVL1V__C__I_load;
          return true;
        
        case PutVL1:
          msg := ReqL2(adr,MemRd_A_SnpInvL2,m,to_m_directoryL2(directoryL2));
          Send_req2(msg, m);
          cbe.proxy_msgL1 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1_PutVL1V__C__I_store;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1_V__C__M:
      switch inmsg.mtype
        case BIConflictAckL2:
          cbe.proxy_msgL2 := inmsg;
          msg_GetR_AckL1 := RespL1(adr,GetR_AckL1,m,m,cbe.cl);
          cbe.cl := msg_GetR_AckL1.cl;
          Set_perm(store, adr, m);
          msg_PutRL1 := RespL1(adr,PutRL1,m,m,cbe.cl);
          msg_PutR_AckL1 := AckL1(adr,PutR_AckL1,m,msg_PutRL1.src);
          cbe.cl := msg_PutRL1.cl;
          msg := RwdL2(adr,MemWr_IL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_rwd(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1_BIConflictAckL2V__C__M_BIConflictAck;
          return true;
        
        case BISnpDataL2:
          msg_GetVL1 := RequestL1(adr,GetVL1,m,m);
          msg_GetV_AckL1 := RespL1(adr,GetV_AckL1,m,msg_GetVL1.src,cbe.cl);
          cbe.cl := msg_GetV_AckL1.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := RwdL2(adr,MemWr_SL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_rwd(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1_BISnpDataL2V__C__M_BISnpData;
          return true;
        
        case BISnpInvL2:
          cbe.proxy_msgL2 := inmsg;
          msg_GetR_AckL1 := RespL1(adr,GetR_AckL1,m,m,cbe.cl);
          cbe.cl := msg_GetR_AckL1.cl;
          Set_perm(store, adr, m);
          msg_PutRL1 := RespL1(adr,PutRL1,m,m,cbe.cl);
          msg_PutR_AckL1 := AckL1(adr,PutR_AckL1,m,msg_PutRL1.src);
          cbe.cl := msg_PutRL1.cl;
          msg := RwdL2(adr,MemWr_IL2,m,cbe.proxy_msgL2.src,cbe.cl);
          Send_rwd(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1_BISnpInvL2V__C__M_BISnpInv;
          return true;
        
        case GetRL1:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1 := inmsg;
          msg := RespL1(adr,GetR_AckL1,m,cbe.proxy_msgL1.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1_GetRL1V_GetR__C__M;
          return true;
        
        case GetVL1:
          Set_perm(load, adr, m);
          cbe.proxy_msgL1 := inmsg;
          msg := RespL1(adr,GetV_AckL1,m,cbe.proxy_msgL1.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__M;
          return true;
        
        case PutVL1:
          Set_perm(store, adr, m);
          cbe.proxy_msgL1 := inmsg;
          msg := AckL1(adr,PutV_AckL1,m,cbe.proxy_msgL1.src);
          Send_fwd(msg, m);
          cbe.cl := cbe.proxy_msgL1.cl;
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__M;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1_V__C__S:
      switch inmsg.mtype
        case BIConflictAckL2:
          cbe.proxy_msgL2 := inmsg;
          msg_GetR_AckL1 := RespL1(adr,GetR_AckL1,m,m,cbe.cl);
          cbe.cl := msg_GetR_AckL1.cl;
          Set_perm(store, adr, m);
          msg_PutRL1 := RespL1(adr,PutRL1,m,m,cbe.cl);
          msg_PutR_AckL1 := AckL1(adr,PutR_AckL1,m,msg_PutRL1.src);
          cbe.cl := msg_PutRL1.cl;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__I;
          return true;
        
        case BISnpDataL2:
          msg_GetVL1 := RequestL1(adr,GetVL1,m,m);
          msg_GetV_AckL1 := RespL1(adr,GetV_AckL1,m,msg_GetVL1.src,cbe.cl);
          cbe.cl := msg_GetV_AckL1.cl;
          cbe.proxy_msgL2 := inmsg;
          msg := BIRspL2(adr,BIRspSL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__S;
          return true;
        
        case BISnpInvL2:
          cbe.proxy_msgL2 := inmsg;
          msg_GetR_AckL1 := RespL1(adr,GetR_AckL1,m,m,cbe.cl);
          cbe.cl := msg_GetR_AckL1.cl;
          Set_perm(store, adr, m);
          msg_PutRL1 := RespL1(adr,PutRL1,m,m,cbe.cl);
          msg_PutR_AckL1 := AckL1(adr,PutR_AckL1,m,msg_PutRL1.src);
          cbe.cl := msg_PutRL1.cl;
          msg := BIRspL2(adr,BIRspIL2,m,cbe.proxy_msgL2.src);
          Send_birsp(msg, m);
          undefine cbe.proxy_msgL2;
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__I;
          return true;
        
        case GetRL1:
          msg := ReqL2(adr,MemInv_A_SnpInvL2,m,to_m_directoryL2(directoryL2));
          Send_req2(msg, m);
          cbe.proxy_msgL1 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1_GetRL1V__C__S_store;
          return true;
        
        case GetVL1:
          Set_perm(load, adr, m);
          cbe.proxy_msgL1 := inmsg;
          msg := RespL1(adr,GetV_AckL1,m,cbe.proxy_msgL1.src,cbe.cl);
          Send_resp(msg, m);
          undefine cbe.proxy_msgL1;
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__S;
          return true;
        
        case PutVL1:
          msg := ReqL2(adr,MemInv_A_SnpInvL2,m,to_m_directoryL2(directoryL2));
          Send_req2(msg, m);
          cbe.proxy_msgL1 := inmsg;
          Clear_perm(adr, m);
          cbe.State := directoryL1_PutVL1V__C__S_store;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1_evictV__C__E_evict:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_evictV__C__E_evict_x_I;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_evictV__C__E_evict;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_evictV__C__E_evict;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1_evictV__C__E_evict_x_I:
      switch inmsg.mtype
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_evictV__C__E_evict_x_I;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_evictV__C__E_evict_x_I;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1_evictV__C__M_evict:
      switch inmsg.mtype
        case BIConflictAckL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1_evictV__C__M_evict_BIConflictAck;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_evictV__C__M_evict;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_evictV__C__M_evict;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1_evictV__C__M_evict_BIConflictAck:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1_evictV__C__S_evict:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_evictV__C__S_evict_x_I;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_evictV__C__S_evict;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_evictV__C__S_evict;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__I;
          return true;
        
        else return false;
      endswitch;
      
      case directoryL1_evictV__C__S_evict_x_I:
      switch inmsg.mtype
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_evictV__C__S_evict_x_I;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := directoryL1_evictV__C__S_evict_x_I;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := directoryL1_V__C__I;
          return true;
        
        else return false;
      endswitch;
      
    endswitch;
    endalias;
    endalias;
    endalias;
    return false;
    end;
    
    function FSM_MSG_cacheL2(inmsg:Message; mTyped:OBJSET_cacheL2) : boolean;
    var msg: Message;
    begin
      alias adr: inmsg.adr do
      alias cbe: i_cacheL2[mTyped].cb[adr] do
    alias m : to_m_cacheL2(mTyped) do
    switch cbe.State
      case cacheL2_E:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_I;
          return true;
        
        case BISnpDataL2:
          msg := BIRspL2(adr,BIRspSL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := cacheL2_S;
          return true;
        
        case BISnpInvL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2_E_evict:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_E_evict_x_I;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_E_evict;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_E_evict;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := cacheL2_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2_E_evict_x_I:
      switch inmsg.mtype
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_E_evict_x_I;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_E_evict_x_I;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := cacheL2_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2_I:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_I;
          return true;
        
        case BISnpDataL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_I;
          return true;
        
        case BISnpInvL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2_I_load:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_I_load;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_I_load;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_I_load;
          return true;
        
        case Cmp_EL2:
          Clear_perm(adr, m);
          cbe.State := cacheL2_I_load_Cmp_E;
          return true;
        
        case Cmp_SL2:
          Clear_perm(adr, m);
          cbe.State := cacheL2_I_load_Cmp_S;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2_I_load_Cmp_E:
      switch inmsg.mtype
        case MemDataL2:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL2_E;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2_I_load_Cmp_S:
      switch inmsg.mtype
        case MemDataL2:
          cbe.cl := inmsg.cl;
          Set_perm(load, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := cacheL2_S;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2_I_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_I_store;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_I_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_I_store;
          return true;
        
        case Cmp_EL2:
          Clear_perm(adr, m);
          cbe.State := cacheL2_I_store_Cmp_E;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2_I_store_Cmp_E:
      switch inmsg.mtype
        case MemDataL2:
          cbe.cl := inmsg.cl;
          Set_perm(store, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL2_M;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2_M:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := RwdL2(adr,MemWr_IL2,m,inmsg.src,cbe.cl);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_M_BIConflictAck;
          return true;
        
        case BISnpDataL2:
          msg := RwdL2(adr,MemWr_SL2,m,inmsg.src,cbe.cl);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_M_BISnpData;
          return true;
        
        case BISnpInvL2:
          msg := RwdL2(adr,MemWr_IL2,m,inmsg.src,cbe.cl);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_M_BISnpInv;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2_M_BIConflictAck:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2_M_BISnpData:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspSL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := cacheL2_S;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2_M_BISnpInv:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2_M_evict:
      switch inmsg.mtype
        case BIConflictAckL2:
          Clear_perm(adr, m);
          cbe.State := cacheL2_M_evict_BIConflictAck;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_M_evict;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_M_evict;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := cacheL2_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2_M_evict_BIConflictAck:
      switch inmsg.mtype
        case CmpL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2_S:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_I;
          return true;
        
        case BISnpDataL2:
          msg := BIRspL2(adr,BIRspSL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m); Set_perm(load, adr, m);
          cbe.State := cacheL2_S;
          return true;
        
        case BISnpInvL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2_S_evict:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_S_evict_x_I;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_S_evict;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_S_evict;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := cacheL2_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2_S_evict_x_I:
      switch inmsg.mtype
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_S_evict_x_I;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_S_evict_x_I;
          return true;
        
        case CmpL2:
          Clear_perm(adr, m);
          cbe.State := cacheL2_I;
          return true;
        
        else return false;
      endswitch;
      
      case cacheL2_S_store:
      switch inmsg.mtype
        case BIConflictAckL2:
          msg := BIRspL2(adr,BIRspIL2,m,inmsg.src);
          Send_birsp(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_I_store;
          return true;
        
        case BISnpDataL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_S_store;
          return true;
        
        case BISnpInvL2:
          msg := ReqL2(adr,BIConflictL2,m,inmsg.src);
          Send_rwd(msg, m);
          Clear_perm(adr, m);
          cbe.State := cacheL2_S_store;
          return true;
        
        case Cmp_EL2:
          Set_perm(store, adr, m);
          Clear_perm(adr, m); Set_perm(load, adr, m); Set_perm(store, adr, m);
          cbe.State := cacheL2_M;
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
    ruleset m:OBJSET_cacheL1 do
    ruleset adr:Address do
      alias cbe:i_cacheL1[m].cb[adr] do
    
      rule "cacheL1_I_store"
        cbe.State = cacheL1_I & network_ready() 
      ==>
        FSM_Access_cacheL1_I_store(adr, m);
        
      endrule;
    
      rule "cacheL1_I_load"
        cbe.State = cacheL1_I & network_ready() 
      ==>
        FSM_Access_cacheL1_I_load(adr, m);
        
      endrule;
    
      rule "cacheL1_I_acquire"
        cbe.State = cacheL1_I & network_ready() & TestAtomicEvent_cacheL1(m)
      ==>
        FSM_Access_cacheL1_I_acquire(adr, m);
        LockAtomicEvent_cacheL1(m, adr);
      endrule;
    
      rule "cacheL1_I_release"
        cbe.State = cacheL1_I & TestAtomicEvent_cacheL1(m)
      ==>
        FSM_Access_cacheL1_I_release(adr, m);
        LockAtomicEvent_cacheL1(m, adr);
      endrule;
    
      rule "cacheL1_VC_load"
        cbe.State = cacheL1_VC 
      ==>
        FSM_Access_cacheL1_VC_load(adr, m);
        
      endrule;
    
      rule "cacheL1_VC_evict"
        cbe.State = cacheL1_VC 
      ==>
        FSM_Access_cacheL1_VC_evict(adr, m);
        
      endrule;
    
      rule "cacheL1_VC_acquire"
        cbe.State = cacheL1_VC & network_ready() & TestAtomicEvent_cacheL1(m)
      ==>
        FSM_Access_cacheL1_VC_acquire(adr, m);
        LockAtomicEvent_cacheL1(m, adr);
      endrule;
    
      rule "cacheL1_VC_release"
        cbe.State = cacheL1_VC & TestAtomicEvent_cacheL1(m)
      ==>
        FSM_Access_cacheL1_VC_release(adr, m);
        LockAtomicEvent_cacheL1(m, adr);
      endrule;
    
      rule "cacheL1_VC_store"
        cbe.State = cacheL1_VC 
      ==>
        FSM_Access_cacheL1_VC_store(adr, m);
        
      endrule;
    
      rule "cacheL1_VD_release"
        cbe.State = cacheL1_VD & TestAtomicEvent_cacheL1(m)
      ==>
        FSM_Access_cacheL1_VD_release(adr, m);
        LockAtomicEvent_cacheL1(m, adr);
      endrule;
    
      rule "cacheL1_VD_acquire"
        cbe.State = cacheL1_VD & network_ready() & TestAtomicEvent_cacheL1(m)
      ==>
        FSM_Access_cacheL1_VD_acquire(adr, m);
        LockAtomicEvent_cacheL1(m, adr);
      endrule;
    
      rule "cacheL1_VD_load"
        cbe.State = cacheL1_VD 
      ==>
        FSM_Access_cacheL1_VD_load(adr, m);
        
      endrule;
    
      rule "cacheL1_VD_evict"
        cbe.State = cacheL1_VD & network_ready() 
      ==>
        FSM_Access_cacheL1_VD_evict(adr, m);
        
      endrule;
    
      rule "cacheL1_VD_store"
        cbe.State = cacheL1_VD 
      ==>
        FSM_Access_cacheL1_VD_store(adr, m);
        
      endrule;
    
    
      endalias;
    endruleset;
    endruleset;
    
    ruleset m:OBJSET_directoryL1 do
    ruleset adr:Address do
      alias cbe:i_directoryL1[m].cb[adr] do
    
      rule "directoryL1_V__C__E_evict"
        cbe.State = directoryL1_V__C__E & network_ready() 
      ==>
        FSM_Access_directoryL1_V__C__E_evict(adr, m);
        
      endrule;
    
      rule "directoryL1_V__C__M_evict"
        cbe.State = directoryL1_V__C__M & network_ready() 
      ==>
        FSM_Access_directoryL1_V__C__M_evict(adr, m);
        
      endrule;
    
      rule "directoryL1_V__C__S_evict"
        cbe.State = directoryL1_V__C__S & network_ready() 
      ==>
        FSM_Access_directoryL1_V__C__S_evict(adr, m);
        
      endrule;
    
    
      endalias;
    endruleset;
    endruleset;
    
    ruleset m:OBJSET_cacheL2 do
    ruleset adr:Address do
      alias cbe:i_cacheL2[m].cb[adr] do
    
    -- Impossible due to effective MI downgrade 
    --  rule "cacheL2_E_load"
    --    cbe.State = cacheL2_E 
    --  ==>
    --    FSM_Access_cacheL2_E_load(adr, m);
    --    
    --  endrule;
    --
      rule "cacheL2_E_store"
        cbe.State = cacheL2_E 
      ==>
        FSM_Access_cacheL2_E_store(adr, m);
        
      endrule;
    
      rule "cacheL2_E_evict"
        cbe.State = cacheL2_E & network_ready() 
      ==>
        FSM_Access_cacheL2_E_evict(adr, m);
        
      endrule;
    
      rule "cacheL2_I_store"
        cbe.State = cacheL2_I & network_ready() 
      ==>
        FSM_Access_cacheL2_I_store(adr, m);
        
      endrule;
    
    -- Impossible due to effective MI downgrade 
    --  rule "cacheL2_I_load"
    --    cbe.State = cacheL2_I & network_ready() 
    --  ==>
    --    FSM_Access_cacheL2_I_load(adr, m);
    --    
    --  endrule;
    --
    -- Impossible due to effective MI downgrade 
    --  rule "cacheL2_M_load"
    --    cbe.State = cacheL2_M 
    --  ==>
    --    FSM_Access_cacheL2_M_load(adr, m);
    --    
    --  endrule;
    --
      rule "cacheL2_M_evict"
        cbe.State = cacheL2_M & network_ready() 
      ==>
        FSM_Access_cacheL2_M_evict(adr, m);
        
      endrule;
    
      rule "cacheL2_M_store"
        cbe.State = cacheL2_M 
      ==>
        FSM_Access_cacheL2_M_store(adr, m);
        
      endrule;
    
    -- Impossible due to effective MI downgrade 
    --  rule "cacheL2_S_load"
    --    cbe.State = cacheL2_S 
    --  ==>
    --    FSM_Access_cacheL2_S_load(adr, m);
    --    
    --  endrule;
    --
      rule "cacheL2_S_evict"
        cbe.State = cacheL2_S & network_ready() 
      ==>
        FSM_Access_cacheL2_S_evict(adr, m);
        
      endrule;
    
      rule "cacheL2_S_store"
        cbe.State = cacheL2_S & network_ready() 
      ==>
        FSM_Access_cacheL2_S_store(adr, m);
        
      endrule;
    
    
      endalias;
    endruleset;
    endruleset;
    
  ----Backend/Murphi/MurphiModular/Rules/GenEventRuleSet
    ruleset m:OBJSET_cacheL1 do
    ruleset adr:Address do
      alias cbe:i_cacheL1[m].cb[adr] do
    
      rule "cacheL1_I_rel_eventL1"
        cbe.State = cacheL1_I & CheckRemoteEvent_cacheL1(cacheL1_rel_eventL1, m, adr) 
      ==>
        FSM_Access_cacheL1_I_rel_eventL1(adr, m);
      endrule;
    
      rule "cacheL1_I_acq_eventL1"
        cbe.State = cacheL1_I & CheckRemoteEvent_cacheL1(cacheL1_acq_eventL1, m, adr) 
      ==>
        FSM_Access_cacheL1_I_acq_eventL1(adr, m);
      endrule;
    
      rule "cacheL1_I_acquire_GetV_Ack_acq_eventL1"
        cbe.State = cacheL1_I_acquire_GetV_Ack & CheckInitEvent_cacheL1(cacheL1_acq_eventL1, m, adr) 
      ==>
        ServeInitEvent_cacheL1(cacheL1_acq_eventL1, m, adr);
        FSM_Access_cacheL1_I_acquire_GetV_Ack_acq_eventL1(adr, m);
      endrule;
    
      rule "cacheL1_I_release_rel_eventL1"
        cbe.State = cacheL1_I_release & CheckInitEvent_cacheL1(cacheL1_rel_eventL1, m, adr) & network_ready()
      ==>
        ServeInitEvent_cacheL1(cacheL1_rel_eventL1, m, adr);
        FSM_Access_cacheL1_I_release_rel_eventL1(adr, m);
      endrule;
    
      rule "cacheL1_VC_rel_eventL1"
        cbe.State = cacheL1_VC & CheckRemoteEvent_cacheL1(cacheL1_rel_eventL1, m, adr) 
      ==>
        FSM_Access_cacheL1_VC_rel_eventL1(adr, m);
      endrule;
    
      rule "cacheL1_VC_acq_eventL1"
        cbe.State = cacheL1_VC & CheckRemoteEvent_cacheL1(cacheL1_acq_eventL1, m, adr) 
      ==>
        FSM_Access_cacheL1_VC_acq_eventL1(adr, m);
      endrule;
    
      rule "cacheL1_VC_acquire_GetV_Ack_acq_eventL1"
        cbe.State = cacheL1_VC_acquire_GetV_Ack & CheckInitEvent_cacheL1(cacheL1_acq_eventL1, m, adr) 
      ==>
        ServeInitEvent_cacheL1(cacheL1_acq_eventL1, m, adr);
        FSM_Access_cacheL1_VC_acquire_GetV_Ack_acq_eventL1(adr, m);
      endrule;
    
      rule "cacheL1_VC_release_rel_eventL1"
        cbe.State = cacheL1_VC_release & CheckInitEvent_cacheL1(cacheL1_rel_eventL1, m, adr) & network_ready()
      ==>
        ServeInitEvent_cacheL1(cacheL1_rel_eventL1, m, adr);
        FSM_Access_cacheL1_VC_release_rel_eventL1(adr, m);
      endrule;
    
      rule "cacheL1_VD_rel_eventL1"
        cbe.State = cacheL1_VD & CheckRemoteEvent_cacheL1(cacheL1_rel_eventL1, m, adr) & network_ready()
      ==>
        FSM_Access_cacheL1_VD_rel_eventL1(adr, m);
      endrule;
    
      rule "cacheL1_VD_acq_eventL1"
        cbe.State = cacheL1_VD & CheckRemoteEvent_cacheL1(cacheL1_acq_eventL1, m, adr) 
      ==>
        FSM_Access_cacheL1_VD_acq_eventL1(adr, m);
      endrule;
    
      rule "cacheL1_VD_acquire_GetV_Ack_acq_eventL1"
        cbe.State = cacheL1_VD_acquire_GetV_Ack & CheckInitEvent_cacheL1(cacheL1_acq_eventL1, m, adr) 
      ==>
        ServeInitEvent_cacheL1(cacheL1_acq_eventL1, m, adr);
        FSM_Access_cacheL1_VD_acquire_GetV_Ack_acq_eventL1(adr, m);
      endrule;
    
      rule "cacheL1_VD_release_rel_eventL1"
        cbe.State = cacheL1_VD_release & CheckInitEvent_cacheL1(cacheL1_rel_eventL1, m, adr) & network_ready()
      ==>
        ServeInitEvent_cacheL1(cacheL1_rel_eventL1, m, adr);
        FSM_Access_cacheL1_VD_release_rel_eventL1(adr, m);
      endrule;
    
    
      endalias;
    endruleset;
    endruleset;
    
    ruleset m:OBJSET_cacheL1 do
    ruleset adr:Address do
      alias cbe:i_cacheL1[m].cb[adr] do
    
    rule "cacheL1_VD_UnlockAtomicEvent_"
      cbe.State = cacheL1_VD
    ==>
      UnlockAtomicEvent_cacheL1(m, adr);
    endrule;
    rule "cacheL1_I_UnlockAtomicEvent_"
      cbe.State = cacheL1_I
    ==>
      UnlockAtomicEvent_cacheL1(m, adr);
    endrule;
    rule "cacheL1_VC_UnlockAtomicEvent_"
      cbe.State = cacheL1_VC
    ==>
      UnlockAtomicEvent_cacheL1(m, adr);
    endrule;
    
      endalias;
    endruleset;
    endruleset;
    
    ruleset m:OBJSET_directoryL1 do
    ruleset adr:Address do
      alias cbe:i_directoryL1[m].cb[adr] do
    
      rule "directoryL1_V__C__E_rel_eventL1"
        cbe.State = directoryL1_V__C__E & CheckRemoteEvent_directoryL1(directoryL1_rel_eventL1, m, adr) 
      ==>
        FSM_Access_directoryL1_V__C__E_rel_eventL1(adr, m);
      endrule;
    
      rule "directoryL1_V__C__E_acq_eventL1"
        cbe.State = directoryL1_V__C__E & CheckRemoteEvent_directoryL1(directoryL1_acq_eventL1, m, adr) 
      ==>
        FSM_Access_directoryL1_V__C__E_acq_eventL1(adr, m);
      endrule;
    
      rule "directoryL1_V__C__I_rel_eventL1"
        cbe.State = directoryL1_V__C__I & CheckRemoteEvent_directoryL1(directoryL1_rel_eventL1, m, adr) 
      ==>
        FSM_Access_directoryL1_V__C__I_rel_eventL1(adr, m);
      endrule;
    
      rule "directoryL1_V__C__I_acq_eventL1"
        cbe.State = directoryL1_V__C__I & CheckRemoteEvent_directoryL1(directoryL1_acq_eventL1, m, adr) 
      ==>
        FSM_Access_directoryL1_V__C__I_acq_eventL1(adr, m);
      endrule;
    
      rule "directoryL1_V__C__M_acq_eventL1"
        cbe.State = directoryL1_V__C__M & CheckRemoteEvent_directoryL1(directoryL1_acq_eventL1, m, adr) 
      ==>
        FSM_Access_directoryL1_V__C__M_acq_eventL1(adr, m);
      endrule;
    
      rule "directoryL1_V__C__M_rel_eventL1"
        cbe.State = directoryL1_V__C__M & CheckRemoteEvent_directoryL1(directoryL1_rel_eventL1, m, adr) 
      ==>
        FSM_Access_directoryL1_V__C__M_rel_eventL1(adr, m);
      endrule;
    
      rule "directoryL1_V__C__S_rel_eventL1"
        cbe.State = directoryL1_V__C__S & CheckRemoteEvent_directoryL1(directoryL1_rel_eventL1, m, adr) 
      ==>
        FSM_Access_directoryL1_V__C__S_rel_eventL1(adr, m);
      endrule;
    
      rule "directoryL1_V__C__S_acq_eventL1"
        cbe.State = directoryL1_V__C__S & CheckRemoteEvent_directoryL1(directoryL1_acq_eventL1, m, adr) 
      ==>
        FSM_Access_directoryL1_V__C__S_acq_eventL1(adr, m);
      endrule;
    
    
      endalias;
    endruleset;
    endruleset;
    
    ruleset m:OBJSET_directoryL1 do
    ruleset adr:Address do
      alias cbe:i_directoryL1[m].cb[adr] do
    
    rule "directoryL1_V__C__M_UnlockAtomicEvent_"
      cbe.State = directoryL1_V__C__M
    ==>
      UnlockAtomicEvent_directoryL1(m, adr);
    endrule;
    rule "directoryL1_V__C__E_UnlockAtomicEvent_"
      cbe.State = directoryL1_V__C__E
    ==>
      UnlockAtomicEvent_directoryL1(m, adr);
    endrule;
    rule "directoryL1_V__C__S_UnlockAtomicEvent_"
      cbe.State = directoryL1_V__C__S
    ==>
      UnlockAtomicEvent_directoryL1(m, adr);
    endrule;
    rule "directoryL1_V__C__I_UnlockAtomicEvent_"
      cbe.State = directoryL1_V__C__I
    ==>
      UnlockAtomicEvent_directoryL1(m, adr);
    endrule;
    
      endalias;
    endruleset;
    endruleset;
    
    ruleset m:OBJSET_directoryL1 do
    ruleset adr:Address do
      alias cbe:i_directoryL1[m].cb[adr] do
    
      rule "directoryL1_V__C__E_rel_eventL1"
        cbe.State = directoryL1_V__C__E & CheckRemoteEvent_directoryL1(directoryL1_rel_eventL1, m, adr) 
      ==>
        FSM_Access_directoryL1_V__C__E_rel_eventL1(adr, m);
      endrule;
    
      rule "directoryL1_V__C__E_acq_eventL1"
        cbe.State = directoryL1_V__C__E & CheckRemoteEvent_directoryL1(directoryL1_acq_eventL1, m, adr) 
      ==>
        FSM_Access_directoryL1_V__C__E_acq_eventL1(adr, m);
      endrule;
    
      rule "directoryL1_V__C__I_rel_eventL1"
        cbe.State = directoryL1_V__C__I & CheckRemoteEvent_directoryL1(directoryL1_rel_eventL1, m, adr) 
      ==>
        FSM_Access_directoryL1_V__C__I_rel_eventL1(adr, m);
      endrule;
    
      rule "directoryL1_V__C__I_acq_eventL1"
        cbe.State = directoryL1_V__C__I & CheckRemoteEvent_directoryL1(directoryL1_acq_eventL1, m, adr) 
      ==>
        FSM_Access_directoryL1_V__C__I_acq_eventL1(adr, m);
      endrule;
    
      rule "directoryL1_V__C__M_acq_eventL1"
        cbe.State = directoryL1_V__C__M & CheckRemoteEvent_directoryL1(directoryL1_acq_eventL1, m, adr) 
      ==>
        FSM_Access_directoryL1_V__C__M_acq_eventL1(adr, m);
      endrule;
    
      rule "directoryL1_V__C__M_rel_eventL1"
        cbe.State = directoryL1_V__C__M & CheckRemoteEvent_directoryL1(directoryL1_rel_eventL1, m, adr) 
      ==>
        FSM_Access_directoryL1_V__C__M_rel_eventL1(adr, m);
      endrule;
    
      rule "directoryL1_V__C__S_rel_eventL1"
        cbe.State = directoryL1_V__C__S & CheckRemoteEvent_directoryL1(directoryL1_rel_eventL1, m, adr) 
      ==>
        FSM_Access_directoryL1_V__C__S_rel_eventL1(adr, m);
      endrule;
    
      rule "directoryL1_V__C__S_acq_eventL1"
        cbe.State = directoryL1_V__C__S & CheckRemoteEvent_directoryL1(directoryL1_acq_eventL1, m, adr) 
      ==>
        FSM_Access_directoryL1_V__C__S_acq_eventL1(adr, m);
      endrule;
    
    
      endalias;
    endruleset;
    endruleset;
    
    ruleset m:OBJSET_directoryL1 do
    ruleset adr:Address do
      alias cbe:i_directoryL1[m].cb[adr] do
    
    rule "directoryL1_V__C__M_UnlockAtomicEvent_"
      cbe.State = directoryL1_V__C__M
    ==>
      UnlockAtomicEvent_directoryL1(m, adr);
    endrule;
    rule "directoryL1_V__C__E_UnlockAtomicEvent_"
      cbe.State = directoryL1_V__C__E
    ==>
      UnlockAtomicEvent_directoryL1(m, adr);
    endrule;
    rule "directoryL1_V__C__S_UnlockAtomicEvent_"
      cbe.State = directoryL1_V__C__S
    ==>
      UnlockAtomicEvent_directoryL1(m, adr);
    endrule;
    rule "directoryL1_V__C__I_UnlockAtomicEvent_"
      cbe.State = directoryL1_V__C__I
    ==>
      UnlockAtomicEvent_directoryL1(m, adr);
    endrule;
    
      endalias;
    endruleset;
    endruleset;
    
  ----Backend/Murphi/MurphiModular/Rules/GenNetworkRule
    -- cacheL2
    ruleset n:OBJSET_cacheL2 do
      alias msg:bisnp_cacheL2[n][0] do
        rule "Receive cacheL2 bisnp"
          cnt_bisnp_cacheL2[n] > 0
          
        ==>
          if FSM_MSG_cacheL2(msg, n) then
            Pop_bisnp(to_m_cacheL2(n), to_m_cacheL2(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_cacheL2 do
      alias msg:req2_cacheL2[n][0] do
        rule "Receive cacheL2 req2"
          cnt_req2_cacheL2[n] > 0
          
        ==>
          if FSM_MSG_cacheL2(msg, n) then
            Pop_req2(to_m_cacheL2(n), to_m_cacheL2(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_cacheL2 do
      alias msg:rwd_cacheL2[n][0] do
        rule "Receive cacheL2 rwd"
          cnt_rwd_cacheL2[n] > 0
          
        ==>
          if FSM_MSG_cacheL2(msg, n) then
            Pop_rwd(to_m_cacheL2(n), to_m_cacheL2(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_cacheL2 do
      alias msg:birsp_cacheL2[n][0] do
        rule "Receive cacheL2 birsp"
          cnt_birsp_cacheL2[n] > 0
          
        ==>
          if FSM_MSG_cacheL2(msg, n) then
            Pop_birsp(to_m_cacheL2(n), to_m_cacheL2(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_cacheL2 do
      alias msg:drs_cacheL2[n][0] do
        rule "Receive cacheL2 drs"
          cnt_drs_cacheL2[n] > 0
          
        ==>
          if FSM_MSG_cacheL2(msg, n) then
            Pop_drs(to_m_cacheL2(n), to_m_cacheL2(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_cacheL2 do
      alias msg:ndr_cacheL2[n][0] do
        rule "Receive cacheL2 ndr"
          cnt_ndr_cacheL2[n] > 0
          
        ==>
          if FSM_MSG_cacheL2(msg, n) then
            Pop_ndr(to_m_cacheL2(n), to_m_cacheL2(n));
          endif;
        endrule;
      endalias;
    endruleset;
    
    -- cacheL1
    ruleset n:OBJSET_cacheL1 do
      alias msg:resp_cacheL1[n][0] do
        rule "Receive cacheL1 resp"
          cnt_resp_cacheL1[n] > 0
          
        ==>
          if FSM_MSG_cacheL1(msg, n) then
            Pop_resp(to_m_cacheL1(n), to_m_cacheL1(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_cacheL1 do
      alias msg:fwd_cacheL1[n][0] do
        rule "Receive cacheL1 fwd"
          cnt_fwd_cacheL1[n] > 0
          
        ==>
          if FSM_MSG_cacheL1(msg, n) then
            Pop_fwd(to_m_cacheL1(n), to_m_cacheL1(n));
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
    
    -- directoryL1
    ruleset n:OBJSET_directoryL1 do
      alias msg:resp_directoryL1[n][0] do
        rule "Receive directoryL1 resp"
          cnt_resp_directoryL1[n] > 0
          
        ==>
          if FSM_MSG_directoryL1(msg, n) then
            Pop_resp(to_m_directoryL1(n), to_m_directoryL1(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1 do
      alias msg:req_directoryL1[n][0] do
        rule "Receive directoryL1 req"
          cnt_req_directoryL1[n] > 0
          
        ==>
          if FSM_MSG_directoryL1(msg, n) then
            Pop_req(to_m_directoryL1(n), to_m_directoryL1(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1 do
      alias msg:fwd_directoryL1[n][0] do
        rule "Receive directoryL1 fwd"
          cnt_fwd_directoryL1[n] > 0
          
        ==>
          if FSM_MSG_directoryL1(msg, n) then
            Pop_fwd(to_m_directoryL1(n), to_m_directoryL1(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1 do
      alias msg:bisnp_directoryL1[n][0] do
        rule "Receive directoryL1 bisnp"
          cnt_bisnp_directoryL1[n] > 0
          
        ==>
          if FSM_MSG_directoryL1(msg, n) then
            Pop_bisnp(to_m_directoryL1(n), to_m_directoryL1(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1 do
      alias msg:req2_directoryL1[n][0] do
        rule "Receive directoryL1 req2"
          cnt_req2_directoryL1[n] > 0
          
        ==>
          if FSM_MSG_directoryL1(msg, n) then
            Pop_req2(to_m_directoryL1(n), to_m_directoryL1(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1 do
      alias msg:rwd_directoryL1[n][0] do
        rule "Receive directoryL1 rwd"
          cnt_rwd_directoryL1[n] > 0
          
        ==>
          if FSM_MSG_directoryL1(msg, n) then
            Pop_rwd(to_m_directoryL1(n), to_m_directoryL1(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1 do
      alias msg:birsp_directoryL1[n][0] do
        rule "Receive directoryL1 birsp"
          cnt_birsp_directoryL1[n] > 0
          
        ==>
          if FSM_MSG_directoryL1(msg, n) then
            Pop_birsp(to_m_directoryL1(n), to_m_directoryL1(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1 do
      alias msg:drs_directoryL1[n][0] do
        rule "Receive directoryL1 drs"
          cnt_drs_directoryL1[n] > 0
          
        ==>
          if FSM_MSG_directoryL1(msg, n) then
            Pop_drs(to_m_directoryL1(n), to_m_directoryL1(n));
          endif;
        endrule;
      endalias;
    endruleset;
    ruleset n:OBJSET_directoryL1 do
      alias msg:ndr_directoryL1[n][0] do
        rule "Receive directoryL1 ndr"
          cnt_ndr_directoryL1[n] > 0
          
        ==>
          if FSM_MSG_directoryL1(msg, n) then
            Pop_ndr(to_m_directoryL1(n), to_m_directoryL1(n));
          endif;
        endrule;
      endalias;
    endruleset;
    
    -- cacheL2
    
    -- cacheL1
    
    -- directoryL2
    
    -- directoryL1
    

--Backend/Murphi/MurphiModular/GenStartStates

  startstate
    System_Reset();
  endstartstate;

--Backend/Murphi/MurphiModular/GenInvariant
ruleset adr:Address do
    liveness "cacheL1 is able to eventually read" live_cacheL1(adr, load);
    liveness "cacheL1 is able to eventually write" live_cacheL1(adr, store);
endruleset;

