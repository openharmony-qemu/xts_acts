/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export default function webResourceErrorGetCustomErrorCodeCoverageDirect() {
  describe('webResourceErrorGetCustomErrorCodeCoverageDirect', () => {
    /**
     * @tc.name   testGetCustomErrorCodeCallDirect001
     * @tc.number SUB_WEB_WEBRESOURCEERROR_GETCUSTOMERRORCODE_CALL_0100
     * @tc.desc   test WebResourceError getCustomErrorCode call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCustomErrorCodeCallDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let error: WebResourceError = new WebResourceError();
        let code: number = error.getCustomErrorCode();
        expect(typeof code).assertEqual('number');
        done();
      })

    /**
     * @tc.name   testGetCustomErrorCodeReturnDirect001
     * @tc.number SUB_WEB_WEBRESOURCEERROR_GETCUSTOMERRORCODE_RETURN_0100
     * @tc.desc   test WebResourceError getCustomErrorCode number return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCustomErrorCodeReturnDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let error: WebResourceError = new WebResourceError();
        let code: number = error.getCustomErrorCode();
        expect(typeof code).assertEqual('number');
        done();
      })
  })
}
