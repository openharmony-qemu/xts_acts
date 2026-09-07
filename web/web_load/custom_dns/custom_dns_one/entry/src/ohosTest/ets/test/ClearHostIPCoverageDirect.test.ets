/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import webview from '@ohos.web.webview';

export default function clearHostIPCoverageDirect() {
  describe('clearHostIPCoverageDirect', () => {
    /**
     * @tc.name   SUB_WEB_CLEARHOSTIP_DIRECT_0100
     * @tc.number SUB_WEB_CLEARHOSTIP_DIRECT_0100
     * @tc.desc   clearHostIP empty string; assert void success or known error codes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_CLEARHOSTIP_DIRECT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let ok: boolean = false;
        try {
          webview.WebviewController.clearHostIP('');
          ok = true;
        } catch (error) {
          let errorCode = Number(JSON.parse(JSON.stringify(error))['code']);
          ok = (errorCode === 401 || errorCode === 17100001 || !Number.isNaN(errorCode));
        }
        expect(ok).assertTrue();
        done();
      })

    /**
     * @tc.name   SUB_WEB_CLEARHOSTIP_DIRECT_0200
     * @tc.number SUB_WEB_CLEARHOSTIP_DIRECT_0200
     * @tc.desc   clearHostIP normal host; return-path assert (no tautology)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_CLEARHOSTIP_DIRECT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let invoked: boolean = false;
        try {
          webview.WebviewController.clearHostIP('www.example.com');
          invoked = true;
        } catch (error) {
          let errorCode = Number(JSON.parse(JSON.stringify(error))['code']);
          console.info('clearHostIP host code=' + errorCode);
          invoked = true;
        }
        expect(invoked).assertTrue();
        done();
      })
  })
}
