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
 
export default function ArcSwiperAttributeTest() {
 
  describe('ArcSwiperAttributeTest', () => {
 
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });
 
    /**
     * @tc.name   ArcSwiperDurationTest_001
     * @tc.number SUB_ARKUI_ARCSWIPERDURATION_TEST_0100
     * @tc.desc   Test NODE_ARC_SWIPER_DURATION with normal value 1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcSwiperDuration001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcSwiperDuration001()).assertEqual(0)
      done()
    })
 
    /**
     * @tc.name   ArcSwiperDurationTest_002
     * @tc.number SUB_ARKUI_ARCSWIPERDURATION_TEST_0200
     * @tc.desc   Test NODE_ARC_SWIPER_DURATION with zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcSwiperDuration002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcSwiperDuration002()).assertEqual(0)
      done()
    })
 
    /**
     * @tc.name   ArcSwiperDurationTest_003
     * @tc.number SUB_ARKUI_ARCSWIPERDURATION_TEST_0300
     * @tc.desc   Test NODE_ARC_SWIPER_DURATION with invalid negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArcSwiperDuration003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testArcSwiperDuration003()).assertEqual(0)
      done()
    })
 
    /**
     * @tc.name   ArcSwiperEffectModeTest_001
     * @tc.number SUB_ARKUI_ARCSWIPEREFFECTMODE_TEST_0100
     * @tc.desc   Test NODE_ARC_SWIPER_EFFECT_MODE with value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcSwiperEffectMode001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcSwiperEffectMode001()).assertEqual(0)
      done()
    })
 
    /**
     * @tc.name   ArcSwiperEffectModeTest_002
     * @tc.number SUB_ARKUI_ARCSWIPEREFFECTMODE_TEST_0200
     * @tc.desc   Test NODE_ARC_SWIPER_EFFECT_MODE with value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcSwiperEffectMode002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcSwiperEffectMode002()).assertEqual(0)
      done()
    })
 
    /**
     * @tc.name   ArcSwiperVerticalTest_001
     * @tc.number SUB_ARKUI_ARCSWIPERVERTICAL_TEST_0100
     * @tc.desc   Test NODE_ARC_SWIPER_VERTICAL with value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcSwiperVertical001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcSwiperVertical001()).assertEqual(0)
      done()
    })
 
    /**
     * @tc.name   ArcSwiperVerticalTest_002
     * @tc.number SUB_ARKUI_ARCSWIPERVERTICAL_TEST_0200
     * @tc.desc   Test NODE_ARC_SWIPER_VERTICAL with value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcSwiperVertical002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcSwiperVertical002()).assertEqual(0)
      done()
    })
 
    /**
     * @tc.name   ArcSwiperIndicatorTest_001
     * @tc.number SUB_ARKUI_ARCSWIPERINDICATOR_TEST_0100
     * @tc.desc   Test NODE_ARC_SWIPER_INDICATOR with value OH_ARKUI_ARCDIRECTION_THREE_CLOCK_DIRECTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcSwiperIndicator001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcSwiperIndicator001()).assertEqual(0)
      done()
    })
 
    /**
     * @tc.name   ArcSwiperIndicatorTest_002
     * @tc.number SUB_ARKUI_ARCSWIPERINDICATOR_TEST_0200
     * @tc.desc   Test NODE_ARC_SWIPER_INDICATOR with value OH_ARKUI_ARCDIRECTION_SIX_CLOCK_DIRECTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcSwiperIndicator002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcSwiperIndicator002()).assertEqual(0)
      done()
    })
 
    /**
     * @tc.name   ArcSwiperIndicatorTest_003
     * @tc.number SUB_ARKUI_ARCSWIPERINDICATOR_TEST_0300
     * @tc.desc   Test NODE_ARC_SWIPER_INDICATOR with value OH_ARKUI_ARCDIRECTION_NINE_CLOCK_DIRECTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcSwiperIndicator003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcSwiperIndicator003()).assertEqual(0)
      done()
    })
 
    /**
     * @tc.name   ArcSwiperDisableSwipeTest_001
     * @tc.number SUB_ARKUI_ARCSWIPERDISABLESWIPE_TEST_0100
     * @tc.desc   Test NODE_ARC_SWIPER_DISABLE_SWIPE with value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcSwiperDisableSwipe001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcSwiperDisableSwipe001()).assertEqual(0)
      done()
    })
 
    /**
     * @tc.name   ArcSwiperDisableSwipeTest_002
     * @tc.number SUB_ARKUI_ARCSWIPERDISABLESWIPE_TEST_0200
     * @tc.desc   Test NODE_ARC_SWIPER_DISABLE_SWIPE with value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcSwiperDisableSwipe002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcSwiperDisableSwipe002()).assertEqual(0)
      done()
    })
 
    /**
     * @tc.name   ArcSwiperDisableTransitionAnimationTest_001
     * @tc.number SUB_ARKUI_ARCSWIPERDISABLETRANSITIONANIMATION_TEST_0100
     * @tc.desc   Test NODE_ARC_SWIPER_DISABLE_TRANSITION_ANIMATION with value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcSwiperDisableTransitionAnimation001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcSwiperDisableTransitionAnimation001()).assertEqual(0)
      done()
    })
 
    /**
     * @tc.name   ArcSwiperDisableTransitionAnimationTest_002
     * @tc.number SUB_ARKUI_ARCSWIPERDISABLETRANSITIONANIMATION_TEST_0200
     * @tc.desc   Test NODE_ARC_SWIPER_DISABLE_TRANSITION_ANIMATION with value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcSwiperDisableTransitionAnimation002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcSwiperDisableTransitionAnimation002()).assertEqual(0)
      done()
    })
 
    /**
     * @tc.name   ArcSwiperDigitalCrownSensitivityTest_001
     * @tc.number SUB_ARKUI_ARCSWIPERDIGITALCROWSENSITIVITY_TEST_0100
     * @tc.desc   Test NODE_ARC_SWIPER_DIGITAL_CROWN_SENSITIVITY with value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcSwiperDigitalCrownSensitivity001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcSwiperDigitalCrownSensitivity001()).assertEqual(0)
      done()
    })
 
    /**
     * @tc.name   ArcSwiperDigitalCrownSensitivityTest_002
     * @tc.number SUB_ARKUI_ARCSWIPERDIGITALCROWSENSITIVITY_TEST_0200
     * @tc.desc   Test NODE_ARC_SWIPER_DIGITAL_CROWN_SENSITIVITY with value 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcSwiperDigitalCrownSensitivity002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcSwiperDigitalCrownSensitivity002()).assertEqual(0)
      done()
    })
 
    /**
     * @tc.name   ArcSwiperIndexTest_001
     * @tc.number SUB_ARKUI_ARCSWIPERINDEX_TEST_0100
     * @tc.desc   Test NODE_ARC_SWIPER_INDEX with value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcSwiperIndex001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcSwiperIndex001()).assertEqual(0)
      done()
    })
 
    /**
     * @tc.name   ArcSwiperIndexTest_002
     * @tc.number SUB_ARKUI_ARCSWIPERINDEX_TEST_0200
     * @tc.desc   Test NODE_ARC_SWIPER_INDEX with value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcSwiperIndex002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcSwiperIndex002()).assertEqual(0)
      done()
    })
 
    /**
     * @tc.name   ArcSwiperIndexTest_003
     * @tc.number SUB_ARKUI_ARCSWIPERINDEX_TEST_0300
     * @tc.desc   Test NODE_ARC_SWIPER_INDEX with invalid negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArcSwiperIndex003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testArcSwiperIndex003()).assertEqual(0)
      done()
    })
  })
}