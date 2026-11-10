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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic'
import observer from '@ohos.telephony.observer';
import hilog from '@ohos.hilog'


let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'ObserverCallTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

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

export default function ObserverCallManagerTest() {
  describe("ObserverCallManagerTest", (): void => {
    hilog.info(domain, tag, `describe start`);

    /**
     * @tc.name   testTelephonyObserverVoIPCallType_static_0100
     * @tc.number SUB_Telephony_Observer_VoIPCallType_0100
     * @tc.desc   Verify all enumeration values of VoIPCallType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyObserverVoIPCallType_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverVoIPCallType_static_0100';
      hilog.info(domain, tag, `${caseName} start`);
      try {
        hilog.info(domain, tag, `${caseName} VoIPCallType.VOICE is ${observer.VoIPCallType.VOICE}`);
        ExpectTrue(observer.VoIPCallType.VOICE === 0);
        hilog.info(domain, tag, `${caseName} VoIPCallType.VIDEO is ${observer.VoIPCallType.VIDEO}`);
        ExpectTrue(observer.VoIPCallType.VIDEO === 1);
        hilog.info(domain, tag, `${caseName}---test end`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->error.code: ${JSON.stringify(error.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---test end`);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyObserverVoIPCallState_static_0100
     * @tc.number SUB_Telephony_Observer_VoIPCallState_0100
     * @tc.desc   Verify all enumeration values of VoIPCallState.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyObserverVoIPCallState_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverVoIPCallState_static_0100';
      hilog.info(domain, tag, `${caseName} start`);
      try {
        hilog.info(domain, tag, `${caseName} VoIPCallState.IDLE is ${observer.VoIPCallState.IDLE}`);
        ExpectTrue(observer.VoIPCallState.IDLE === 0);
        hilog.info(domain, tag, `${caseName} VoIPCallState.INCOMING is ${observer.VoIPCallState.INCOMING}`);
        ExpectTrue(observer.VoIPCallState.INCOMING === 1);
        hilog.info(domain, tag, `${caseName} VoIPCallState.OUTGOING is ${observer.VoIPCallState.OUTGOING}`);
        ExpectTrue(observer.VoIPCallState.OUTGOING === 2);
        hilog.info(domain, tag, `${caseName} VoIPCallState.DIALING is ${observer.VoIPCallState.DIALING}`);
        ExpectTrue(observer.VoIPCallState.DIALING === 3);
        hilog.info(domain, tag, `${caseName} VoIPCallState.ANSWERED is ${observer.VoIPCallState.ANSWERED}`);
        ExpectTrue(observer.VoIPCallState.ANSWERED === 4);
        hilog.info(domain, tag, `${caseName} VoIPCallState.ACTIVE is ${observer.VoIPCallState.ACTIVE}`);
        ExpectTrue(observer.VoIPCallState.ACTIVE === 5);
        hilog.info(domain, tag, `${caseName} VoIPCallState.HOLDING is ${observer.VoIPCallState.HOLDING}`);
        ExpectTrue(observer.VoIPCallState.HOLDING === 6);
        hilog.info(domain, tag, `${caseName} VoIPCallState.DISCONNECTING is ${observer.VoIPCallState.DISCONNECTING}`);
        ExpectTrue(observer.VoIPCallState.DISCONNECTING === 7);
        hilog.info(domain, tag, `${caseName} VoIPCallState.DISCONNECTED is ${observer.VoIPCallState.DISCONNECTED}`);
        ExpectTrue(observer.VoIPCallState.DISCONNECTED === 8);
        hilog.info(domain, tag, `${caseName}---test end`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->error.code: ${JSON.stringify(error.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---test end`);
        done();
      }
    });

  })
}
