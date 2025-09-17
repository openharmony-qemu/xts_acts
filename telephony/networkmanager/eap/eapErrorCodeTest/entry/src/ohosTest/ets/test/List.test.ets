import EmptyTest from './Empty.test';
import EapErrorCodeTest from './eapErrorCode.test';

export default function testsuite() {
  if(canIUse('SystemCapability.Communication.NetManager.Eap')){
    EapErrorCodeTest();
  }else{
    EmptyTest();
  }
}