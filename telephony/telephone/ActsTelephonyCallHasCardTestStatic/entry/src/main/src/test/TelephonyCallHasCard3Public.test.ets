/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import call from '@ohos.telephony.call';
import { BusinessError, AsyncCallback } from '@ohos.base';
import sim from '@ohos.telephony.sim';
import sms from '@ohos.telephony.sms';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import account from '@ohos.account.osAccount';
import bundleManager from '@ohos.bundle.bundleManager';
import hilog from '@ohos.hilog'

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'ObserverTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}
let isSimActive: boolean = sim.isSimActiveSync(0);
const phoneNumber: string = "15617922808";
const zonePhoneNumber: string = "+8615617922808";
const formatPhoneNumber: string = "156-1792-2808";
const emergencyPhoneNumber: string = "911";
const landlineNumber: string = "057126885879";
const telphoneErr: string = '+861xxxxxxxxxxx';
const CALL_NUMBER = '10086';

export default function HasCard2PublicNeedCardTest() {
  describe('TelephonyCallHasCard2PublicNeedCardTest', (): void => {

    /**
     * @tc.number : SUB_Telephony_CallManager_HasCallSync_0200
     * @tc.name   : testTelephonyCallManagerHasCallSync0200
     * @tc.desc   : Determine whether there is a phone call api10+.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testTelephonyCallManagerHasCallSync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerHasCallSync0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      if (isSimActive == true) {
        try {
          let hasCall: boolean = call.hasCallSync();
          hilog.info(domain, tag, '%{public}s', caseName +'success, has call is'+JSON.stringify(hasCall));
          ExpectTrue(hasCall == false);
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName +'  catch fail, err->'+JSON.stringify(err));
          ExpectFail();
          done();
        }
      } else {
        hilog.info(domain, tag, '%{public}s', caseName +' the sim is active: false');
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
    });

    /**
     * @tc.number : SUB_Telephony_CallManager_GetCallStateSync_0200
     * @tc.name   : testTelephonyCallManagerGetCallStateSync0200
     * @tc.desc   : Get the current call status
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testTelephonyCallManagerGetCallStateSync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerGetCallStateSync0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      if (isSimActive == true) {
        try {
          let hasCall: boolean = call.hasCallSync();
          if (hasCall == false) {
            hilog.info(domain, tag, '%{public}s', caseName +'hasCallSync success, no call exists');
            let callState: number = call.getCallStateSync();
            hilog.info(domain, tag, '%{public}s', caseName +'getCallState success, data->'+JSON.stringify(callState));
            ExpectTrue(callState == 0);
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +'hasCallSync fail, call exists');
            ExpectFail();
            done();
          }
        } catch (err) {
          console.info(`${caseName} fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
      } else {
        console.info(`${caseName} the sim is active: false`);
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
    });

    /*
     * @tc.number: SUB_Telephony_CallManager_IsEmergencyPhoneNumber_0200
     * @tc.name: testTelephonyCallManagerIsEmergencyPhoneNumberStatic0200
     * @tc.desc: Determine whether it is an emergency phone number. Use the callback asynchronous callback api7+.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size: MEDIUMTEST
     */
    it("testTelephonyCallManagerIsEmergencyPhoneNumberStatic0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumberStatic0200';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          call.isEmergencyPhoneNumber(emergencyPhoneNumber,
            (err: BusinessError<void> | null, data: boolean | undefined) => {
              if (err?.code) {
                hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
                expect(true).assertEqual(data === true);
                done();
              }
            });
        } catch (err) {
          hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName} test end `);
          done();
        }
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      });

    /*
     * @tc.number: SUB_Telephony_CallManager_IsEmergencyPhoneNumber_0900
     * @tc.name: testTelephonyCallManagerIsEmergencyPhoneNumberStatic0900
     * @tc.desc: Determine whether the emergency phone number is based on the telephone number parameters. Use the callback asynchronous callback api7+.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size: MEDIUMTEST
     */
    it("testTelephonyCallManagerIsEmergencyPhoneNumberStatic0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumberStatic0900';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          const options: call.EmergencyNumberOptions = { slotId: 0 };
          call.isEmergencyPhoneNumber(emergencyPhoneNumber, options,
            (err: BusinessError<void> | null, data: boolean | undefined) => {
              if (err?.code) {
                hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber fail, err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber, data->${JSON.stringify(data)}`);
                expect(true).assertEqual(data == true);
                done();
              }
            });
        } catch (err) {
          hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName} test end `);
          done();
        }
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      });

    /*
     * @tc.number: SUB_Telephony_CallManager_IsEmergencyPhoneNumber_2300
     * @tc.name: testTelephonyCallManagerIsEmergencyPhoneNumberStatic2300
     * @tc.desc: Determine whether the emergency phone number is based on the telephone number parameters. Use the promise asynchronous callback api7+.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size: MEDIUMTEST
     */
    it("testTelephonyCallManagerIsEmergencyPhoneNumberStatic2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumberStatic2300';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          call.isEmergencyPhoneNumber(emergencyPhoneNumber).then((data: boolean | undefined) => {
            expect(true).assertEqual(data === true);
            hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber,promise: data->${JSON.stringify(data)}`);
            done();
          }).catch((err: Error) => {
            hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber fail,promise: err->${JSON.stringify(err as BusinessError)}`);
            ExpectFail();
            done();
          });
        } catch (err) {
          hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName} test end `);
          done();
        }
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      });

    /*
     * @tc.number: SUB_Telephony_CallManager_IsEmergencyPhoneNumber_2500
     * @tc.name: testTelephonyCallManagerIsEmergencyPhoneNumberStatic2500
     * @tc.desc: Determine whether the emergency phone number is based on the telephone number parameters. Use the promise asynchronous callback api7+.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size: MEDIUMTEST
     */
    it("testTelephonyCallManagerIsEmergencyPhoneNumberStatic2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonyCallManagerIsEmergencyPhoneNumberStatic2500';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let options: call.EmergencyNumberOptions = {
            slotId: 0
          }
          call.isEmergencyPhoneNumber(emergencyPhoneNumber, options).then((data: boolean | undefined) => {
            expect(true).assertEqual(data == true);
            hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber,promise: data->${JSON.stringify(data)}`);
            done();
          }).catch((err: Error) => {
            hilog.info(domain, tag, `${caseName} isEmergencyPhoneNumber fail,promise: err->${JSON.stringify(err as BusinessError)}`);
            ExpectFail();
            done();
          });
        } catch (err) {
          hilog.error(domain, tag, `${caseName} fail, err->${JSON.stringify(err)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName} test end `);
          done();
        }
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      });

    /*
     * @tc.number: SUB_Telephony_SmsMms_NoPermission_0200
     * @tc.name: testTelephonySmsNoPermissionStatic0200
     * @tc.desc: Send a text message. Use Promise asynchronous callback. version 10
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size: MEDIUMTEST
     */
    it("testTelephonySmsNoPermissionStatic0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySmsNoPermissionStatic0200';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let hasSim: boolean = sim.hasSimCardSync(0);
          expect(hasSim).assertTrue();
          if (hasSim) {

            let sendOptions: sms.SendMessageOptions = {
              slotId: 1,
              content: '',
              destinationHost: '+861xxxxxxxxxxx',
              serviceCenter: '+8617692630498',
              destinationPort: 1000,
              sendCallback: (err:BusinessError<void>|null)=>{
                if (err) {
                  hilog.info(domain, tag, `${caseName}: sendCallback error->${JSON.stringify(err)}`);
                }
              },
              deliveryCallback: (err:BusinessError<void>|null)=>{
                if (err) {
                  hilog.info(domain, tag, `${caseName}: deliveryCallback error->${JSON.stringify(err)}`);
                }
              }
            };
            sms.sendShortMessage(sendOptions).then(() => {
              hilog.info(domain, tag, `${caseName} success`);
              ExpectFail();
              done();
            }).catch((err: Error) => {
              hilog.info(domain, tag, `${caseName} sendShortMessage err: ${JSON.stringify(err as BusinessError)}`);
              ExpectTrue((err as BusinessError)?.code === 201);
              done();
            });
          } else {
            hilog.info(domain, tag, `${caseName} no sim`);
            ExpectFail();
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `${caseName} err:${err}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} test end`);
      });

    /*
     * @tc.number: testTelephonySmsNoPermissionStatic0300
     * @tc.name: testTelephonySmsNoPermissionStatic0300
     * @tc.desc: testTelephonySmsNoPermissionStatic0300
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size: MEDIUMTEST
     */
    it("testTelephonySmsNoPermissionStatic0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTelephonySmsNoPermissionStatic0300';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let hasSim: boolean = sim.hasSimCardSync(0);
          expect(hasSim).assertTrue();
          if (hasSim) {
            let sendOptions: sms.SendMessageOptions = {
              slotId: 0,
              content: "SMS message content",
              destinationHost: telphoneErr,
              serviceCenter: '+8617692630498',
              destinationPort: 1000,
              sendCallback: (err:BusinessError<void>|null)=>{
                if (err) {
                  hilog.info(domain, tag, `${caseName}: sendCallback error->${JSON.stringify(err)}`);
                }
              },
              deliveryCallback: (err:BusinessError<void>|null)=>{
                if (err) {
                  hilog.info(domain, tag, `${caseName}: deliveryCallback error->${JSON.stringify(err)}`);
                }
              }
            };
            sms.sendShortMessage(sendOptions, (err: BusinessError<void> | null) => {
              if (err) {
                hilog.info(domain, tag, `${caseName}: sendShortMessage error->${JSON.stringify(err)}`);
                ExpectTrue(err?.code === 201);
                done();
              } else {
                hilog.info(domain, tag, `${caseName}: success`);
                ExpectFail();
                done();
              }
            });
          } else {
            hilog.info(domain, tag, `${caseName} no sim`);
            ExpectFail();
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `${caseName} err:${err}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} test end`);
      });
  });
}