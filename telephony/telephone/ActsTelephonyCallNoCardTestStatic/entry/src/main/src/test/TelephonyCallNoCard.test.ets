'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import sim from '@ohos.telephony.sim';
import { Driver, ON, MatchPattern, Component } from '@ohos.UiTest';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'CallNoCardTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, `exportFail failed err: ${JSON.stringify(err)}`);
  }
};

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, `exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

const CALL_NUMBER: string = '10086';

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

export default function TelephonyCallNoCardTest() {
  describe('TelephonyCallNoCardTest', (): void => {
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
     * @tc.name   testTelephonyCallManagerMakeDirectCallNoCard_static_0100
     * @tc.number SUB_Telephony_CallManager_MakeDirectCall_NoCard_0100
     * @tc.desc   No SIM card in the device, application makes calls with one tap with a valid phone number by promise with ohos.permission.DIRECT_CALL granted, network is not in service, expect error code 8300006.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyCallManagerMakeDirectCallNoCard_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerMakeDirectCallNoCard_static_0100';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      if (sim.hasSimCardSync(0)) {
        hilog.info(domain, tag, '%{public}s', caseName + ' failed, have card');
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---test end');
        done();
      } else {
        try {
          await call.makeDirectCall(CALL_NUMBER);
          hilog.info(domain, tag, '%{public}s', caseName + ' makeDirectCall success unexpectedly without card');
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} catch err ->error.code: ${JSON.stringify(error.code)}, error?.message: ${JSON.stringify(error?.message)}`);
          ExpectTrue(error.code === 8300006);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      }
    });

  })
}
