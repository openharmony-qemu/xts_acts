'use static';
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

import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll } from "@ohos/hypium-static/src/main/indexStatic";
import call from '@ohos.telephony.call';
import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';
import { Driver, ON, MatchPattern, Component } from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import Utils from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'ObserverTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, `exportFail failed err: ${JSON.stringify(err)}`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, `exportTrue failed err: ${JSON.stringify(err)}`);
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

async function getPermissions(): Promise<void> {
  hilog.info(domain, tag, '%{public}s', 'click allow start');
  let driver: Driver = Driver.create();
  for (let index = 0; index < 10; index++) {
    await driver.delayMs(1000);
    try {
      let allowButton: Component | null = await driver.findComponent(ON.text('允许', MatchPattern.EQUALS));
      if (allowButton !== null) {
        await allowButton.click();
        await driver.delayMs(1000);
        hilog.info(domain, tag, `click allow button success, round ${index}`);
        break;
      }
      hilog.info(domain, tag, `allow button not found, round ${index}`);
    } catch (error) {
      hilog.info(domain, tag, `click allow button round ${index} failed, error: ${JSON.stringify(error)}`);
    }
  }
  hilog.info(domain, tag, '%{public}s', 'click allow end');
}

export default function HasCard2PublicNeedCardTest() {
  describe('TelephonyCallHasCard2PublicNeedCardTest', (): void => {
    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'getPermission beforeAll');
      await getPermissions();
      done();
    });

    afterAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'click cancel start');
      let driver: Driver = Driver.create();
      for (let index = 0; index < 5; index++) {
        await driver.delayMs(1000);
        try {
          let cancelButton: Component | null = await driver.findComponent(ON.text('取消', MatchPattern.EQUALS));
          if (cancelButton !== null) {
            await cancelButton.click();
            await driver.delayMs(1000);
            hilog.info(domain, tag, `click cancel button success, round ${index}`);
            break;
          }
        } catch (error) {
          hilog.info(domain, tag, `click cancel button round ${index} failed, error: ${JSON.stringify(error)}`);
        }
      }
      hilog.info(domain, tag, '%{public}s', 'click cancel end');
      done();
    });

    /**
     * @tc.name   testTelephonyCallManagerHasCallSync0200
     * @tc.number SUB_Telephony_CallManager_HasCallSync_0200
     * @tc.desc   Determine whether there is a phone call api10+.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
        } catch (error) {
          hilog.info(domain, tag, `${caseName} catch err ->error.code: ${JSON.stringify(error.code)}, error?.message: ${JSON.stringify(error?.message)}`);
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
     * @tc.name   testTelephonyCallManagerGetCallStateSync0200
     * @tc.number SUB_Telephony_CallManager_GetCallStateSync_0200
     * @tc.desc   Get the current call status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
            const callStateSyncAry: number[] = [
              call.CallState.CALL_STATE_UNKNOWN,
              call.CallState.CALL_STATE_IDLE,
              call.CallState.CALL_STATE_RINGING,
              call.CallState.CALL_STATE_OFFHOOK,
              call.CallState.CALL_STATE_ANSWERED
            ]
            ExpectTrue(callStateSyncAry.includes(callState));
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +'hasCallSync fail, call exists');
            ExpectFail();
            done();
          }
        } catch (error) {
          hilog.info(domain, tag, `${caseName} catch err ->error.code: ${JSON.stringify(error.code)}, error?.message: ${JSON.stringify(error?.message)}`);
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

    /**
     * @tc.name   testTelephonyCallManagerMakeDirectCall_static_0100
     * @tc.number SUB_Telephony_CallManager_MakeDirectCall_0100
     * @tc.desc   Application makes calls with one tap with a valid phone number by promise with ohos.permission.DIRECT_CALL granted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyCallManagerMakeDirectCall_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerMakeDirectCall_static_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      if (!sim.hasSimCardSync(0)) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' failed, NO SIM');
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } else {
        try {
          await call.makeDirectCall(CALL_NUMBER);
          hilog.info(domain, tag, '%{public}s', caseName+ ' makeDirectCall success');
        } catch (error) {
          hilog.info(domain, tag, `${caseName} makeDirectCall fail ->error.code: ${JSON.stringify(error.code)}, error?.message: ${JSON.stringify(error?.message)}`);
          ExpectFail();
        } finally {
          await Utils.msSleep(5000);
          try {
            call.hangUpCall((error: BusinessError | null) => {
              if (error?.code) {
                hilog.info(domain, tag, `${caseName} hangUpCall fail ->error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
              } else {
                hilog.info(domain, tag, '%{public}s', caseName+ ' hangUpCall success');
              }
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            });
          } catch (error) {
            hilog.info(domain, tag, `${caseName} hangUpCall throw ->error.code: ${JSON.stringify(error.code)}, error?.message: ${JSON.stringify(error?.message)}`);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        }
      }
    });

  });
}