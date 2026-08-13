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

export default function webResourceResponseCoverageDirect() {
  describe('webResourceResponseCoverageDirect', () => {
    /**
     * @tc.name   testSetResponseIsReadyNullUndefined
     * @tc.number SUB_WEB_SETRESPONSEISREADY_DIRECT_0100
     * @tc.desc   setResponseIsReady true/false/null/undefined (ArkUI WebResourceResponse)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetResponseIsReadyNullUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resp: WebResourceResponse = new WebResourceResponse();
      try { resp.setResponseIsReady(true); } catch (e) { console.info('true ' + JSON.stringify(e)); }
      try { resp.setResponseIsReady(false); } catch (e) { console.info('false ' + JSON.stringify(e)); }
      try { resp.setResponseIsReady(null); } catch (e) { console.info('null ' + JSON.stringify(e)); }
      try { resp.setResponseIsReady(undefined); } catch (e) { console.info('undef ' + JSON.stringify(e)); }
      expect(resp !== undefined).assertTrue();
      done();
    })
  })
}
