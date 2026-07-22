
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

import testNapi from 'libentry.so';

const TAG = 'SUB_Ability_AbilityRuntime_StartOptionsGetValueTest';

export default function ndkStartOptionsGetValueTest() {
  describe('ActsNdkStartOptionsGetValueTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsWindowModeValue_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsWindowModeValue_0100
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsWindowModeValue with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsWindowModeValue_0100', Level.LEVEL1, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsWindowModeValue_0100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsWindowModeValue_0100();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsWindowModeValue_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsWindowModeValue_0200
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsWindowModeValue with nullptr startOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsWindowModeValue_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsWindowModeValue_0200';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsWindowModeValue_0200();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsWindowModeValue_0300
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsWindowModeValue_0300
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsWindowModeValue with nullptr windowMode output
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsWindowModeValue_0300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsWindowModeValue_0300';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsWindowModeValue_0300();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsDisplayIdValue_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsDisplayIdValue_0100
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsDisplayIdValue with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsDisplayIdValue_0100', Level.LEVEL1, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsDisplayIdValue_0100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsDisplayIdValue_0100();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsDisplayIdValue_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsDisplayIdValue_0200
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsDisplayIdValue with nullptr startOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsDisplayIdValue_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsDisplayIdValue_0200';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsDisplayIdValue_0200();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsDisplayIdValue_0300
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsDisplayIdValue_0300
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsDisplayIdValue with nullptr displayId output
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsDisplayIdValue_0300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsDisplayIdValue_0300';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsDisplayIdValue_0300();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsWithAnimationValue_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsWithAnimationValue_0100
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsWithAnimationValue with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsWithAnimationValue_0100', Level.LEVEL1, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsWithAnimationValue_0100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsWithAnimationValue_0100();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsWithAnimationValue_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsWithAnimationValue_0200
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsWithAnimationValue with nullptr startOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsWithAnimationValue_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsWithAnimationValue_0200';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsWithAnimationValue_0200();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsWithAnimationValue_0300
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsWithAnimationValue_0300
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsWithAnimationValue with nullptr withAnimation output
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsWithAnimationValue_0300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsWithAnimationValue_0300';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsWithAnimationValue_0300();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsWindowLeftValue_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsWindowLeftValue_0100
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsWindowLeftValue with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsWindowLeftValue_0100', Level.LEVEL1, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsWindowLeftValue_0100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsWindowLeftValue_0100();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsWindowLeftValue_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsWindowLeftValue_0200
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsWindowLeftValue with nullptr startOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsWindowLeftValue_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsWindowLeftValue_0200';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsWindowLeftValue_0200();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsWindowLeftValue_0300
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsWindowLeftValue_0300
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsWindowLeftValue with nullptr windowLeft output
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsWindowLeftValue_0300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsWindowLeftValue_0300';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsWindowLeftValue_0300();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsWindowTopValue_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsWindowTopValue_0100
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsWindowTopValue with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsWindowTopValue_0100', Level.LEVEL1, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsWindowTopValue_0100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsWindowTopValue_0100();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsWindowTopValue_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsWindowTopValue_0200
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsWindowTopValue with nullptr startOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsWindowTopValue_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsWindowTopValue_0200';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsWindowTopValue_0200();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsWindowTopValue_0300
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsWindowTopValue_0300
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsWindowTopValue with nullptr windowTop output
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsWindowTopValue_0300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsWindowTopValue_0300';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsWindowTopValue_0300();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsWindowHeightValue_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsWindowHeightValue_0100
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsWindowHeightValue with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsWindowHeightValue_0100', Level.LEVEL1, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsWindowHeightValue_0100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsWindowHeightValue_0100();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsWindowHeightValue_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsWindowHeightValue_0200
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsWindowHeightValue with nullptr startOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsWindowHeightValue_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsWindowHeightValue_0200';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsWindowHeightValue_0200();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsWindowHeightValue_0300
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsWindowHeightValue_0300
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsWindowHeightValue with nullptr windowHeight output
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsWindowHeightValue_0300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsWindowHeightValue_0300';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsWindowHeightValue_0300();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsWindowWidthValue_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsWindowWidthValue_0100
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsWindowWidthValue with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsWindowWidthValue_0100', Level.LEVEL1, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsWindowWidthValue_0100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsWindowWidthValue_0100();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsWindowWidthValue_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsWindowWidthValue_0200
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsWindowWidthValue with nullptr startOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsWindowWidthValue_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsWindowWidthValue_0200';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsWindowWidthValue_0200();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsWindowWidthValue_0300
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsWindowWidthValue_0300
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsWindowWidthValue with nullptr windowWidth output
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsWindowWidthValue_0300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsWindowWidthValue_0300';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsWindowWidthValue_0300();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsStartVisibilityValue_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsStartVisibilityValue_0100
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsStartVisibilityValue with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsStartVisibilityValue_0100', Level.LEVEL1, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsStartVisibilityValue_0100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsStartVisibilityValue_0100();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsStartVisibilityValue_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsStartVisibilityValue_0200
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsStartVisibilityValue with nullptr startOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsStartVisibilityValue_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsStartVisibilityValue_0200';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsStartVisibilityValue_0200();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsStartVisibilityValue_0300
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsStartVisibilityValue_0300
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsStartVisibilityValue with nullptr startVisibility output
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsStartVisibilityValue_0300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsStartVisibilityValue_0300';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsStartVisibilityValue_0300();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0100
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0100', Level.LEVEL1, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsStartWindowBackgroundColorValue_0100();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0200
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue with nullptr startOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0200';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsStartWindowBackgroundColorValue_0200();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0300
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0300
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue with nullptr startWindowBackgroundColor output
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0300';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsStartWindowBackgroundColorValue_0300();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0400
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0400
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue with nullptr size output
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0400', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0400';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsStartWindowBackgroundColorValue_0400();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0100
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsSupportedWindowModesValue with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0100', Level.LEVEL1, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsSupportedWindowModesValue_0100();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0200
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsSupportedWindowModesValue with nullptr startOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0200';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsSupportedWindowModesValue_0200();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0300
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0300
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsSupportedWindowModesValue with nullptr supportedWindowModes output
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0300';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsSupportedWindowModesValue_0300();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0400
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0400
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsSupportedWindowModesValue with nullptr size output
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0400', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0400';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsSupportedWindowModesValue_0400();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowWidthValue_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowWidthValue_0100
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsMinWindowWidthValue with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowWidthValue_0100', Level.LEVEL1, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowWidthValue_0100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsMinWindowWidthValue_0100();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowWidthValue_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowWidthValue_0200
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsMinWindowWidthValue with nullptr startOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowWidthValue_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowWidthValue_0200';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsMinWindowWidthValue_0200();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowWidthValue_0300
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowWidthValue_0300
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsMinWindowWidthValue with nullptr minWindowWidth output
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowWidthValue_0300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowWidthValue_0300';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsMinWindowWidthValue_0300();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowWidthValue_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowWidthValue_0100
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsMaxWindowWidthValue with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowWidthValue_0100', Level.LEVEL1, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowWidthValue_0100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsMaxWindowWidthValue_0100();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowWidthValue_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowWidthValue_0200
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsMaxWindowWidthValue with nullptr startOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowWidthValue_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowWidthValue_0200';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsMaxWindowWidthValue_0200();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowWidthValue_0300
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowWidthValue_0300
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsMaxWindowWidthValue with nullptr maxWindowWidth output
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowWidthValue_0300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowWidthValue_0300';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsMaxWindowWidthValue_0300();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowHeightValue_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowHeightValue_0100
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsMinWindowHeightValue with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowHeightValue_0100', Level.LEVEL1, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowHeightValue_0100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsMinWindowHeightValue_0100();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowHeightValue_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowHeightValue_0200
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsMinWindowHeightValue with nullptr startOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowHeightValue_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowHeightValue_0200';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsMinWindowHeightValue_0200();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowHeightValue_0300
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowHeightValue_0300
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsMinWindowHeightValue with nullptr minWindowHeight output
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowHeightValue_0300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowHeightValue_0300';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsMinWindowHeightValue_0300();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowHeightValue_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowHeightValue_0100
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsMaxWindowHeightValue with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowHeightValue_0100', Level.LEVEL1, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowHeightValue_0100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsMaxWindowHeightValue_0100();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowHeightValue_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowHeightValue_0200
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsMaxWindowHeightValue with nullptr startOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowHeightValue_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowHeightValue_0200';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsMaxWindowHeightValue_0200();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowHeightValue_0300
     * @tc.number SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowHeightValue_0300
     * @tc.desc   Test OH_AbilityRuntime_GetStartOptionsMaxWindowHeightValue with nullptr maxWindowHeight output
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowHeightValue_0300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowHeightValue_0300';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkGetStartOptionsMaxWindowHeightValue_0300();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} execute result:` + result);
      expect(result).assertEqual(401);
      done();
    })
  })
}