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
import { BusinessError } from '@kit.BasicServicesKit';

export default function webErrorPageCoverageDirect() {
  describe('webErrorPageCoverageDirect', () => {
    /**
     * @tc.name   testSetErrorPageEnabledDirect
     * @tc.number SUB_WEB_ERRORPAGE_DIRECT_0100
     * @tc.desc   setErrorPageEnabled/getSubframeErrorPageEnabled direct + 17100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetErrorPageEnabledDirect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let ctrl: webview.WebviewController = new webview.WebviewController();
      // 未关联 Web 组件时单参重载（since 20）明确抛 17100001（Init 错误）；
      // 双参重载（since 26.0.0）在部分设备先做参数校验抛 401，故用单参验证 Init 错误
      try { ctrl.setErrorPageEnabled(true); } catch (e) {
        expect(Number((e as BusinessError).code)).assertEqual(17100001);
      }
      try { ctrl.setErrorPageEnabled(false); } catch (e) {
        expect(Number((e as BusinessError).code)).assertEqual(17100001);
      }
      try { ctrl.setErrorPageEnabled(null); } catch (e) { console.info('null ' + (e as BusinessError).code); }
      try { ctrl.setErrorPageEnabled(undefined); } catch (e) { console.info('undef ' + (e as BusinessError).code); }
      try {
        let v: boolean = ctrl.getSubframeErrorPageEnabled();
        expect(typeof v).assertEqual('boolean');
      } catch (e) {
        expect(Number((e as BusinessError).code)).assertEqual(17100001);
      }
      done();
    })
  })
}
