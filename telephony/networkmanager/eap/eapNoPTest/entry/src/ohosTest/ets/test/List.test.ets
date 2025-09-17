import eapNoPTest from './eapNoP.test';
import EmptyTest from './Empty.test';

export default function testsuite() {
  if(canIUse('SystemCapability.Communication.NetManager.Eap')){
    eapNoPTest();
  }else{
    EmptyTest();
  }
}