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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium/index'
import observer from '@ohos.telephony.observer';
import data from '@ohos.telephony.data';
import sim from '@ohos.telephony.sim';
import call from '@ohos.telephony.call';
import radio from '@ohos.telephony.radio';
import { BusinessError } from '@ohos.base';
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

async function runTestCaseWithJudgeHasSimCard(testCaseName: string, done:  ()=>void, runTest: () => Promise<void>) {
  try {
    hilog.info(domain, tag, `${testCaseName} test start`);
    let hasSim = await sim.hasSimCard(0);
    if (hasSim) {
      runTest();
    } else {
      hilog.info(domain, tag, `${testCaseName}. Do not have sim card but this test case must be need.`);
      ExpectTrue(false);
      done();
    }
  } catch (error) {
    hilog.info(domain, tag, `${testCaseName} error->${JSON.stringify(error)}.`);
    ExpectTrue(false);
    done();
  }
  hilog.info(domain, tag, `${testCaseName} test end`);
}



export default function ObserverNoCardTest() {
  describe("ObserverNoCardTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');


    /**
     * @tc.number: SUB_Telephony_Observer_CallStateChangeOn_0600
     * @tc.name  : testTelephonyObserverCallStateChangeOn_static_0600
     * @tc.desc  : Subscribe to call status change event.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 0
     */
    it('testTelephonyObserverCallStateChangeOn_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverCallStateChangeOn_static_0600';
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        hilog.info(domain, tag, `${caseName} hasSim ${JSON.stringify(hasSim)}`);
        ExpectTrue(hasSim === false);

        await sim.setDefaultVoiceSlotId(0);
        observer.on('callStateChange', (value: observer.CallStateInfo) => {
          hilog.info(domain, tag, `${caseName} data ${JSON.stringify(value)}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(error)}`);
        ExpectTrue(error?.code == 8300004);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });

  });
}