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

export default function ArcSwiperMethodTest() {

  describe('ArcSwiperMethodTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   ArcSwiperShowNextTest_001
     * @tc.number SUB_ARKUI_ARCSWIPERSHOWNEXT_TEST_0100
     * @tc.desc   Test OH_ArkUI_ArcSwiper_ShowNext with valid node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcSwiperShowNext001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcSwiperShowNext001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcSwiperShowNextTest_002
     * @tc.number SUB_ARKUI_ARCSWIPERSHOWNEXT_TEST_0200
     * @tc.desc   Test OH_ArkUI_ArcSwiper_ShowNext with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArcSwiperShowNext002', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testArcSwiperShowNext002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcSwiperShowPreviousTest_001
     * @tc.number SUB_ARKUI_ARCSWIPERSHOWPREVIOUS_TEST_0100
     * @tc.desc   Test OH_ArkUI_ArcSwiper_ShowPrevious with valid node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcSwiperShowPrevious001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcSwiperShowPrevious001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcSwiperShowPreviousTest_002
     * @tc.number SUB_ARKUI_ARCSWIPERSHOWPREVIOUS_TEST_0200
     * @tc.desc   Test OH_ArkUI_ArcSwiper_ShowPrevious with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArcSwiperShowPrevious002', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testArcSwiperShowPrevious002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcSwiperFinishAnimationTest_001
     * @tc.number SUB_ARKUI_ARCSWIPERFINISHANIMATION_TEST_0100
     * @tc.desc   Test OH_ArkUI_ArcSwiper_FinishAnimation with valid node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcSwiperFinishAnimation001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcSwiperFinishAnimation001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcSwiperFinishAnimationTest_002
     * @tc.number SUB_ARKUI_ARCSWIPERFINISHANIMATION_TEST_0200
     * @tc.desc   Test OH_ArkUI_ArcSwiper_FinishAnimation with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArcSwiperFinishAnimation002', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testArcSwiperFinishAnimation002()).assertEqual(0)
      done()
    })
  })
}