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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function UIAgentGetPageTextTest() {

  describe('UIAgentGetPageTextTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTGETPAGETEXT_0100
     * @tc.name   UIAgentGetPageTextTest001
     * @tc.desc   Collect page text with valid context, expect NO_ERROR and non-null json
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentGetPageTextTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentGetPageTextTest001()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTGETPAGETEXT_0200
     * @tc.name   UIAgentGetPageTextTest002
     * @tc.desc   Collect page text with null context, expect UI_CONTEXT_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentGetPageTextTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentGetPageTextTest002()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTGETPAGETEXT_0300
     * @tc.name   UIAgentGetPageTextTest003
     * @tc.desc   Collect page text with null pageText out param, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIAgentGetPageTextTest003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.UIAgentGetPageTextTest003()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTGETPAGETEXT_0400
     * @tc.name   UIAgentGetPageTextTest004
     * @tc.desc   Collect page text with null context and null pageText, expect PARAM_INVALID or UI_CONTEXT_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UIAgentGetPageTextTest004', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.UIAgentGetPageTextTest004()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_UIAGENTGETPAGETEXT_0500
     * @tc.name   UIAgentGetPageTextTest005
     * @tc.desc   Collect page text repeatedly with valid context, expect NO_ERROR each time
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UIAgentGetPageTextTest005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.UIAgentGetPageTextTest005()).assertEqual(0)
      done()
    })
  })
}
