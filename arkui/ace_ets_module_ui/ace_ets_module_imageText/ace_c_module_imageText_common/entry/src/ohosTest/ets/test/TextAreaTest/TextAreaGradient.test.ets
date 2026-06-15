/**
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

import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import nativeFunc from 'libnativefunc.so'

export default function TextAreaGradientTest() {
  describe('TextAreaGradientTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextAreaGradientTest beforeEach start");
      done();
    })

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_AREA_LINEAR_GRADIENT_0100
     * @tc.number SUB_ARKUI_NODE_TEXT_AREA_LINEAR_GRADIENT_0100
     * @tc.desc   Test NODE_TEXT_AREA_LINEAR_GRADIENT setAttribute and getAttribute
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_NODE_TEXT_AREA_LINEAR_GRADIENT_0100', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_AREA_LINEAR_GRADIENT_0100 START');
      expect(nativeFunc.TextAreaGradientTest_001()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_AREA_LINEAR_GRADIENT_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_AREA_RADIAL_GRADIENT_0200
     * @tc.number SUB_ARKUI_NODE_TEXT_AREA_RADIAL_GRADIENT_0200
     * @tc.desc   Test NODE_TEXT_AREA_RADIAL_GRADIENT setAttribute and getAttribute
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_AREA_RADIAL_GRADIENT_0200', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_AREA_RADIAL_GRADIENT_0200 START');
      expect(nativeFunc.TextAreaGradientTest_002()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_AREA_RADIAL_GRADIENT_0200 END');
    });
  });
}