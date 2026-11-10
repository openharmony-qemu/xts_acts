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
import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import observer from '@ohos.telephony.observer';

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

export default function ObserverCallNopTest() {
  describe("ObserverCallNopTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   testTelephonyObserverVoIPStateChangeOn0100
     * @tc.number SUB_Telephony_Observer_VoIPStateChangeOn_0100
     * @tc.desc   Subscribe to VoIP call state change event without permission, expect error code 201.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyObserverVoIPStateChangeOn0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverVoIPStateChangeOn0100';
      console.info(`${caseName} test start`);
      try {
        let callback: (data: observer.VoIPCallStateInfo) => void = (data: observer.VoIPCallStateInfo) => {
          console.info(`${caseName} data: ${JSON.stringify(data)}`);
          ExpectFail();
          done();
        };
        observer.onVoIPStateChange(callback);
      } catch (error) {
        console.info(`${caseName} catchError ` + error?.code);
        ExpectTrue(error?.code === 201);
        done();
      }
      console.info(`${caseName} test end`);
    });
  })
}
