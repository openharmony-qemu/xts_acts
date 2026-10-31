'use static'
/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, afterEach, afterAll, beforeAll, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';
import socket from '@ohos.net.socket';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'networkManagerSocketTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

function expectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, 'assertion failure');
  }
}

export default function NetworkManagerSocketTest(): void {
  describe("NetworkManagerSocketTest", ()=> {

    /**
     * @tc.name   testTelephonyNetstackUNIXSocketXts_static_0100
     * @tc.number SUB_Telephony_Netstack_UNIX_Socket_Xts_0100
     * @tc.desc   Function Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonyNetstackUNIXSocketXts_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void>=> {
      let caseName = "testTelephonyNetstackUNIXSocketXts_static_0100";
      try {
        let client = socket.constructLocalSocketInstance();
        client.getExtraOptions().then((data) => {
          hilog.info(domain, tag, `${caseName} getExtraOptions success, data: ${JSON.stringify(data)}`);
          done();
        }).catch((error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} getExtraOptions fail, data: ${JSON.stringify(err)}`);
          expect(err != undefined).assertEqual(true);
          done();
        })
      } catch(err) {
        hilog.error(domain, tag, `${caseName} getExtraOptions failed, err.code -> ${err.code}`)
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   testTelephonyNetstackUNIXSocketXts_static_0200
     * @tc.number SUB_Telephony_Netstack_UNIX_Socket_Xts_0200
     * @tc.desc   Function Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonyNetstackUNIXSocketXts_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void>=> {
      let caseName = "testTelephonyNetstackUNIXSocketXts_static_0200";
      try {
        let server = socket.constructLocalSocketServerInstance();
        server.getExtraOptions().then((data) => {
          hilog.info(domain, tag, `${caseName} getExtraOptions success, data: ${JSON.stringify(data)}`);
          done();
        }).catch((error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} getExtraOptions fail, data: ${JSON.stringify(err)}`);
          expect(err != undefined).assertEqual(true);
          done();
        })
      } catch(err) {
        hilog.error(domain, tag, `${caseName} getExtraOptions failed, err.code -> ${err.code}`)
        expect().assertFail();
        done();
      }
    })
  })
}

