/**
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import call from '@ohos.telephony.call'
import radio from '@ohos.telephony.radio'
import sim from '@ohos.telephony.sim'
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'ObserverTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, "expectInfo", `test failed`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, "expectInfo", `test failed`);
  }
}
export default function telSyncTest() {
  describe('telSyncTest', () => {
    hilog.info(domain, tag, '%{public}s','==========> Sync Test start ==========>');
    /*
     * @tc.number  SUB_Telephony_call_hasCallSync_0100
     * @tc.name    Call interface hasCallSync
     * @tc.desc    Function test
     */
    it('SUB_Telephony_call_hasCallSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
        try {
          hilog.info(domain, tag, '%{public}s','SUB_Telephony_call_hasCallSync_0100 hasCallSync '+ call.hasCallSync());
          expect(call.hasCallSync()).assertFalse();
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s','SUB_Telephony_call_hasCallSync_0100 hasCallSync '+ JSON.stringify(err));
          expect(true).assertFalse();
          done();
        }
    });

    /*
     * @tc.number  SUB_Telephony_call_getCallStateSync_0100
     * @tc.name    Call interface getCallStateSync
     * @tc.desc    Function test
     */
    it('SUB_Telephony_call_getCallStateSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      let simState: sim.SimState = sim.getSimStateSync(0);
      if(simState == sim.SimState.SIM_STATE_UNKNOWN)
      {
        hilog.info(domain, tag, '%{public}s', 'SUB_Telephony_call_getCallStateSync_0100' + ' faild, SIM_STATE_UNKNOWN');
        done();
      }else {
        try {
          console.info("SUB_Telephony_call_getCallStateSync_0100 getCallStateSync " + call.getCallStateSync());
          expect(call.getCallStateSync()).assertEqual(call.CallState.CALL_STATE_IDLE);
          done();
        } catch (err) {
          console.info("SUB_Telephony_call_getCallStateSync_0100 " + JSON.stringify(err));
          expect(true).assertFalse();
          done();
        }
      }
    });

    /*
     * @tc.number  SUB_Telephony_sim_getOpNameSync_0100
     * @tc.name    Call interface getOpNameSync
     * @tc.desc    Function test
     */
    it('SUB_Telephony_sim_getOpNameSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Telephony_sim_getOpNameSync_static_0100';
      try{
        let simState: sim.SimState = sim.getSimStateSync(0);
        if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
          hilog.info(domain, tag, `${caseName} failed, SIM STATE IS UNKNOWN`);
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        } else {
          sim.hasSimCard(0, (err: BusinessError<void>|null, data: boolean|undefined) => {
            if (!data) {
              try {
                let slotId = 0;
                hilog.info(domain, tag, "SUB_Telephony_sim_getOpNameSync_static_0100 " + sim.getOpKeySync(slotId));
                expect(sim.getOpNameSync(slotId)).assertEqual("");
                done();
              } catch (error: Error) {
                let err = error as  BusinessError;
                hilog.info(domain, tag, "SUB_Telephony_sim_getOpNameSync_static_0100 err " + JSON.stringify(err));
                expect(false).assertTrue();
                done();
              }
            } else {
              hilog.info(domain, tag, `SUB_Telephony_sim_getOpNameSync_static_0100 fail: has card`);
              hilog.info(domain, tag, `SUB_Telephony_sim_getOpNameSync_static_0100 test end `);
              done();
            }
          })
        }
      }catch(err:Error){
        let error = err as BusinessError;
        hilog.info(domain, tag, caseName +'  catch error is '+JSON.stringify(error));
        ExpectFail();
        done();
      }
    });


    /*
     * @tc.number  SUB_Telephony_sim_getOpKeySync_0100
     * @tc.name    Call interface getOpKeySync
     * @tc.desc    Function test
     */
    it('SUB_Telephony_sim_getOpKeySync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Telephony_sim_getOpKeySync_static_0100';
      try{
        let simState: sim.SimState = sim.getSimStateSync(0);
        if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
          hilog.info(domain, tag, `${caseName} failed, SIM STATE IS UNKNOWN`);
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        } else {
          sim.hasSimCard(0, (err: BusinessError<void>|null, data: boolean|undefined) => {
            if (!data) {
              try {
                let slotId = 0;
                hilog.info(domain, tag, "SUB_Telephony_sim_getOpKeySync_static_0100 " + sim.getOpKeySync(slotId));
                expect(sim.getOpKeySync(slotId)).assertEqual("");
                done();
              } catch (error: Error) {
                let err = error as  BusinessError;
                hilog.info(domain, tag, "SUB_Telephony_sim_getOpKeySync_static_0100 err " + JSON.stringify(err));
                expect(false).assertTrue();
                done();
              }
            } else {
              hilog.info(domain, tag, `SUB_Telephony_sim_getOpKeySync_static_0100 fail: has card`);
              hilog.info(domain, tag, `SUB_Telephony_sim_getOpKeySync_static_0100 test end `);
              done();
            }
          })
        }
      }catch(err:Error){
        let error = err as BusinessError;
        hilog.info(domain, tag, caseName +'  catch error is '+JSON.stringify(error));
        ExpectFail();
        done();
      }
    });


    /*
     * @tc.number  SUB_Telephony_sim_getCardTypeSync_0100
     * @tc.name    Call interface getCardTypeSync
     * @tc.desc    Function test
     */
    it('SUB_Telephony_sim_getCardTypeSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Telephony_sim_getCardTypeSync_static_0100';
      try{
        let simState: sim.SimState =  sim.getSimStateSync(0);
        if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
          hilog.info(domain, tag, `${caseName} failed, SIM STATE IS UNKNOWN`);
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        } else {
          try {
            let slotId = 0;
            hilog.info(domain, tag, "SUB_Telephony_sim_getCardTypeSync_static_0100 " + sim.getCardTypeSync(slotId));
            expect(sim.getCardTypeSync(slotId) >= -1).assertTrue();
            done();
          } catch (error: Error) {
            let err = error as  BusinessError;
            hilog.info(domain, tag, "SUB_Telephony_sim_getCardTypeSync_static_0100 err " + JSON.stringify(err));
            expect(err?.code == 8300004).assertTrue();
            done();
          }
        }
      }catch(err:Error){
        let error = err as BusinessError;
        hilog.info(domain, tag, caseName +'  catch error is '+JSON.stringify(error));
        ExpectFail();
        done();
      }
    });


    /*
     * @tc.number  SUB_Telephony_sim_getSimSpnSync_0100
     * @tc.name    Call interface getSimSpnSync
     * @tc.desc    Function test
     */
    it('SUB_Telephony_sim_getSimSpnSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Telephony_sim_getSimSpnSync_static_0100';
      try{
        let simState: sim.SimState = sim.getSimStateSync(0);
        if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
          hilog.info(domain, tag, `${caseName} failed, SIM STATE IS UNKNOWN`);
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        } else {
          let slotId = 0;
          sim.hasSimCard(slotId, (err: BusinessError<void>|null, data: boolean|undefined) => {
            if (data) {
              try {
                let slotId = 0;
                hilog.info(domain, tag, "SUB_Telephony_sim_getSimSpnSync_static_0100 " + sim.getSimSpnSync(slotId));
                expect(sim.getSimSpnSync(slotId) != "").assertTrue();
                done();
              } catch (error: Error) {
                let err = error as  BusinessError;
                hilog.info(domain, tag, "SUB_Telephony_sim_getSimSpnSync_static_0100 err " + JSON.stringify(err));
                expect(err?.code == 8300004).assertTrue();
                done();
              }
            } else {
              try {
                let slotId = 0;
                hilog.info(domain, tag, "SUB_Telephony_sim_getSimSpnSync_static_0100 " + sim.getSimSpnSync(slotId));
                expect(sim.getSimSpnSync(slotId) == "").assertTrue();
                done();
              } catch (error: Error) {
                let err = error as  BusinessError;
                hilog.info(domain, tag, "SUB_Telephony_sim_getSimSpnSync_static_0100 err " + JSON.stringify(err));
                expect(err?.code == 8300004).assertTrue();
                done();
              }
            }
          });
        }
      }catch(err:Error){
        let error = err as BusinessError;
        hilog.info(domain, tag, caseName +'  catch error is '+JSON.stringify(error));
        ExpectFail();
        done();
      }
    });

    /*
     * @tc.number  SUB_Telephony_sim_getSimOperatorNumericSync_0100
     * @tc.name    Call interface getSimOperatorNumericSync
     * @tc.desc    Function test
     */
    it('SUB_Telephony_sim_getSimOperatorNumericSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Telephony_sim_getSimOperatorNumericSync_static_0100';
      try{
        let simState: sim.SimState = sim.getSimStateSync(0);
        if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
          hilog.info(domain, tag, `${caseName} failed, SIM STATE IS UNKNOWN`);
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        } else {
          let slotId = 0;
          sim.hasSimCard(slotId, (err: BusinessError<void>|null, data: boolean|undefined) => {
            if (data) {
              try {
                let slotId = 0;
                hilog.info(domain, tag, "SUB_Telephony_sim_getSimOperatorNumericSync_static_0100 " +
                sim.getSimOperatorNumericSync(slotId));
                expect(sim.getSimOperatorNumericSync(slotId) != "").assertTrue();
                done();
              } catch (error: Error) {
                let err = error as  BusinessError;
                hilog.info(domain, tag, "SUB_Telephony_sim_getSimOperatorNumericSync_static_0100 err " + JSON.stringify(err));
                expect(err?.code == 8300004).assertTrue();
                done();
              }
            } else {
              try {
                let slotId = 0;
                hilog.info(domain, tag, "SUB_Telephony_sim_getSimOperatorNumericSync_static_0100 " +
                sim.getSimOperatorNumericSync(slotId));
                expect(sim.getSimOperatorNumericSync(slotId) == "").assertTrue();
                done();
              } catch (error: Error) {
                let err = error as  BusinessError;
                hilog.info(domain, tag, "SUB_Telephony_sim_getSimOperatorNumericSync_static_0100 err " + JSON.stringify(err));
                expect(err?.code == 8300004).assertTrue();
                done();
              }
            }
          });
        }
      }catch(err:Error){
        let error = err as BusinessError;
        hilog.info(domain, tag, caseName +'  catch error is '+JSON.stringify(error));
        ExpectFail();
        done();
      }
    });


    /*
     * @tc.number  SUB_Telephony_sim_hasSimCardSync_0100
     * @tc.name    Call interface hasSimCardSync
     * @tc.desc    Function test
     */
    it('SUB_Telephony_sim_hasSimCardSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Telephony_sim_hasSimCardSync_static_0100';
      try{
        let simState: sim.SimState = sim.getSimStateSync(0);
        if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
          hilog.info(domain, tag, `${caseName} failed, SIM STATE IS UNKNOWN`);
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        } else {
          let slotId = 0;
          sim.hasSimCard(slotId, (err: BusinessError<void>|null, data: boolean|undefined) => {
            hilog.info(domain, tag, (`callback: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`));
            if (data) {
              try {
                hilog.info(domain, tag, "SUB_Telephony_sim_hasSimCardSync_static_0100 " + sim.hasSimCardSync(slotId));
                expect(sim.hasSimCardSync(slotId)).assertTrue();
                done();
              } catch (error: Error) {
                let err = error as  BusinessError;
                hilog.info(domain, tag, "SUB_Telephony_sim_hasSimCardSync_static_0100 err " + JSON.stringify(err));
                expect(false).assertTrue();
                done();
              }
            } else {
              try {
                hilog.info(domain, tag, "SUB_Telephony_sim_hasSimCardSync_static_0100 " + sim.hasSimCardSync(slotId));
                expect(sim.hasSimCardSync(slotId)).assertFalse();
                done();
              } catch (error: Error) {
                let err = error as  BusinessError;
                hilog.info(domain, tag, "SUB_Telephony_sim_hasSimCardSync_static_0100 err " + JSON.stringify(err));
                expect(false).assertTrue();
                done();
              }
            }
          });
        }
      }catch(err:Error){
        let error = err as BusinessError;
        hilog.info(domain, tag, caseName +'  catch error is '+JSON.stringify(error));
        ExpectFail();
        done();
      }
    });

    /*
     * @tc.number  SUB_Telephony_sim_getISOCountryCodeForSimSync_0100
     * @tc.name    Call interface getISOCountryCodeForSimSync
     * @tc.desc    Function test
     */
    it('SUB_Telephony_sim_getISOCountryCodeForSimSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Telephony_sim_getISOCountryCodeForSimSync_static_0100';
      try{
        let simState: sim.SimState = sim.getSimStateSync(0);
        if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
          hilog.info(domain, tag, `${caseName} failed, SIM STATE IS UNKNOWN`);
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        } else {
          let slotId = 0;
          sim.hasSimCard(slotId, (err: BusinessError<void>|null, data: boolean|undefined) => {
            if (data) {
              try {
                let slotId = 0;
                hilog.info(domain, tag, "SUB_Telephony_sim_getISOCountryCodeForSimSync_static_0100 " +
                sim.getISOCountryCodeForSimSync(slotId));
                expect(sim.getISOCountryCodeForSimSync(slotId) != "").assertTrue();
                done();
              } catch (error: Error) {
                let err = error as  BusinessError;
                hilog.info(domain, tag, "SUB_Telephony_sim_getISOCountryCodeForSimSync_static_0100 err " + JSON.stringify(err));
                expect(err?.code == 8300004).assertTrue();
                done();
              }
            } else {
              try {
                let slotId = 0;
                hilog.info(domain, tag, "SUB_Telephony_sim_getISOCountryCodeForSimSync_static_0100 " +
                sim.getISOCountryCodeForSimSync(slotId));
                expect(sim.getISOCountryCodeForSimSync(slotId) == "").assertTrue();
                done();
              } catch (error: Error) {
                let err = error as  BusinessError;
                hilog.info(domain, tag, "SUB_Telephony_sim_getISOCountryCodeForSimSync_static_0100 err " + JSON.stringify(err));
                expect(err?.code == 8300004).assertTrue();
                done();
              }
            }
          });
        }
      }catch(err:Error){
        let error = err as BusinessError;
        hilog.info(domain, tag, caseName +'  catch error is '+JSON.stringify(error));
        ExpectFail();
        done();
      }
    });

    /*
     * @tc.number  SUB_Telephony_radio_getISOCountryCodeForNetworkSync_0100
     * @tc.name    SUB_Telephony_radio_getISOCountryCodeForNetworkSync_static_0100
     * @tc.desc    Function test
     */
    it('SUB_Telephony_radio_getISOCountryCodeForNetworkSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Telephony_radio_getISOCountryCodeForNetworkSync_static_0100';
      let simState: sim.SimState = sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        hilog.info(domain, tag,`${caseName} failed, SIM STATE IS UNKNOWN`);
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      } else {
        let slotId = 0;
        sim.hasSimCard(slotId, (err: BusinessError<void>|null, data: boolean|undefined) => {
          if (data) {
            try {
              hilog.info(domain, tag, "SUB_Telephony_radio_getISOCountryCodeForNetworkSync_0100 " +
              radio.getISOCountryCodeForNetworkSync(slotId));
              expect(radio.getISOCountryCodeForNetworkSync(slotId) !== "").assertTrue();
              done();
            } catch (error: Error) {
              let err = error as BusinessError;
              hilog.info(domain, tag,"SUB_Telephony_radio_getISOCountryCodeForNetworkSync_0100 err " + JSON.stringify(err));
              expect(true).assertFalse();
              done();
            }
          } else {
            try {
              hilog.info(domain, tag,"SUB_Telephony_radio_getISOCountryCodeForNetworkSync_0100 " +
              radio.getISOCountryCodeForNetworkSync(slotId));
              done();
            } catch (error: Error) {
              let err = error as BusinessError;
              hilog.info(domain, tag, "SUB_Telephony_radio_getISOCountryCodeForNetworkSync_0100 err " + JSON.stringify(err));
              expect(true).assertFalse();
              done();
            }
          }
        });
      }
    });

    /*
     * @tc.number  SUB_Telephony_radio_getSignalInformationSync_0100
     * @tc.name    SUB_Telephony_radio_getSignalInformationSync_static_0100
     * @tc.desc    Function test
     */
    it('SUB_Telephony_radio_getSignalInformationSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      let caseName = 'SUB_Telephony_radio_getSignalInformationSync_static_0100';
      let simState: sim.SimState = sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        hilog.info(domain, tag,`${caseName} failed, SIM STATE IS UNKNOWN`);
        hilog.info(domain, tag,`${caseName} test end`);
        done();
      } else {
        let slotId = 0;
        radio.isRadioOn((err: BusinessError<void>|null, data: boolean|undefined) => {
          if (err?.code !== 0) {
            try {
              hilog.info(domain, tag,"SUB_Telephony_radio_getSignalInformationSync_0100 111  " +
              radio.getSignalInformationSync(slotId));
              expect(radio.getSignalInformationSync(slotId).length).assertEqual(0);
              done();
            } catch (error: Error) {
              let err = error as BusinessError;
              hilog.info(domain, tag,"SUB_Telephony_radio_getSignalInformationSync_0100 err " + JSON.stringify(err));
              expect(true).assertFalse();
              done();
            }
          } else {
            try {
              hilog.info(domain, tag,"SUB_Telephony_radio_getSignalInformationSync_0100 " +
              radio.getSignalInformationSync(slotId));
              expect(radio.getSignalInformationSync(slotId).length >= 0).assertTrue();
              done();
            } catch (error: Error) {
              let err = error as BusinessError;
              hilog.info(domain, tag,"SUB_Telephony_radio_getSignalInformationSync_0100 err " + JSON.stringify(err));
              expect(true).assertFalse();
              done();
            }
          }
        });
      }
    });

    /*
     * @tc.number  SUB_Telephony_radio_getOperatorNameSync_0100
     * @tc.name    SUB_Telephony_radio_getOperatorNameSync_static_0100
     * @tc.desc    Function test
     */
    it('SUB_Telephony_radio_getOperatorNameSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      let caseName = 'SUB_Telephony_radio_getOperatorNameSync_static_0100';
      let simState: sim.SimState = sim.getSimStateSync(0);
      if (simState == sim.SimState.SIM_STATE_UNKNOWN) {
        hilog.info(domain, tag,`${caseName} failed, SIM STATE IS UNKNOWN`);
        hilog.info(domain, tag,`${caseName} test end`);
        done();
      } else {
        let slotId = 0;
        sim.hasSimCard(slotId, (err: BusinessError<void>|null, data: boolean|undefined) => {
          if (data) {
            try {
              hilog.info(domain, tag, "SUB_Telephony_radio_getOperatorNameSync_0100 " + radio.getOperatorNameSync(slotId));
              expect(radio.getOperatorNameSync(slotId) !== "").assertTrue();
              done();
            } catch (error: Error) {
              let err = error as BusinessError;
              hilog.info(domain, tag, "SUB_Telephony_radio_getOperatorNameSync_0100 err " + JSON.stringify(err));
              expect(true).assertFalse();
              done();
            }
          } else {
            try {
              hilog.info(domain, tag, "SUB_Telephony_radio_getOperatorNameSync_0100 " + radio.getOperatorNameSync(slotId));
              expect(true).assertTrue();
              done();
            } catch (error: Error) {
              let err = error as BusinessError;
              hilog.info(domain, tag, "SUB_Telephony_radio_getOperatorNameSync_0100 err " + JSON.stringify(err));
              expect(true).assertFalse();
              done();
            }
          }
        });
      }
    });

    /*
     * @tc.number  SUB_Telephony_radio_getRadioTechSync_0100
     * @tc.name    SUB_Telephony_radio_getRadioTechSync_static_0100
     * @tc.desc    Function test
     */
    it('SUB_Telephony_radio_getRadioTechSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> =>  {
      try {
        let slotId = 0;
        hilog.info(domain, tag, "SUB_Telephony_radio_getRadioTechSync_static_0100 " + radio.getRadioTechSync(slotId));
        expect(radio.getRadioTechSync(slotId).psRadioTech >= -1).assertTrue();
        done();
      } catch (error: Error) {
        let err = error as BusinessError;
        hilog.info(domain, tag, "SUB_Telephony_radio_getRadioTechSync_static_0100 err " + JSON.stringify(err));
        expect(err != "").assertTrue();
        done();
      }
    });

    /*
     * @tc.number  SUB_Telephony_radio_getRadioTechSync_0200
     * @tc.name    SUB_Telephony_radio_getRadioTechSync__static_0200
     * @tc.desc    Function test
     */
    it('SUB_Telephony_radio_getRadioTechSync__static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> =>   {
      try {
        let slotId = 0;
        hilog.info(domain, tag, "SUB_Telephony_radio_getRadioTechSync__static_0200 " + radio.getRadioTechSync(slotId));
        expect(radio.getRadioTechSync(slotId).csRadioTech >= -1).assertTrue();
        done();
      } catch (error: Error) {
        let err = error as BusinessError;
        hilog.info(domain, tag, "SUB_Telephony_radio_getRadioTechSync__static_0200 err " + JSON.stringify(err));
        expect(err != "").assertTrue();
        done();
      }
    });
    hilog.info(domain, tag, '%{public}s','==========> Sync Test end ==========>');
  });
}