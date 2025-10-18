import dataManagerTest from "./DataManagerHasCard.test";
import dataJsunit from './DataJsunit.test'
import data from '@ohos.telephony.data';
import sim from '@ohos.telephony.sim';
import EmptyTest from './Empty.test'
let simState: sim.SimState = sim.getSimStateSync(0);

export default function testsuite() {
    if (sim.getMaxSimCount()!=0){
    if(sim.hasSimCardSync(0) && simState != sim.SimState.SIM_STATE_UNKNOWN){
      let isOpen: boolean = data.isCellularDataEnabledSync();
      if( isOpen ){
        dataManagerTest();
      }else{
        EmptyTest();
      } 
    } else {
      EmptyTest();
    }
  }else{
    EmptyTest()
  }
}
