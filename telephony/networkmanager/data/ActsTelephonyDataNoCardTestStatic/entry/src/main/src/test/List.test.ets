import dataNoCardTest from "./DataNoCard.test";
import EmptyTest from './Empty.test';
import sim from '@ohos.telephony.sim';
let simState: sim.SimState = sim.getSimStateSync(0);

export default function testsuite() {
    if (sim.getMaxSimCount()!=0  && simState != sim.SimState.SIM_STATE_UNKNOWN ){
        dataNoCardTest();
    }else{
        EmptyTest();
    }
}
