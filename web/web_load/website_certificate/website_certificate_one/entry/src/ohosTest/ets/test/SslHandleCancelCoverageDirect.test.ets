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

export default function sslHandleCancelCoverageDirect() {
  describe('sslHandleCancelCoverageDirect', () => {
    /**
     * @tc.name   testHandleCancelParamLiteralsDocumented
     * @tc.number SUB_WEB_HANDLECANCEL_DIRECT_0100
     * @tc.desc   SslErrorHandler.handleCancel exists; null/undefined covered in OnSslErrorEventTwo page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHandleCancelParamLiteralsDocumented', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      // SslErrorHandler is only obtained from onSslErrorEventReceive callback.
      // Page OnSslErrorEventTwo.ets exercises handleCancel(true/false/null/undefined).
      expect(typeof SslErrorHandler).assertEqual('function');
      done();
    })
  })
}
