/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libNdk from 'libentry.so';

export default function VpeVideoNdkTest() {
  describe('VpeVideoNdkTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   VpeVideoNdk0100
     * @tc.number VpeVideoNdk0100
     * @tc.desc   VpeVideoNdk0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk0100', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(0)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk0200
     * @tc.number VpeVideoNdk0200
     * @tc.desc   VpeVideoNdk0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk0200', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(1)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk0300
     * @tc.number VpeVideoNdk0300
     * @tc.desc   VpeVideoNdk0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk0300', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(2)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk0500
     * @tc.number VpeVideoNdk0500
     * @tc.desc   VpeVideoNdk0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk0500', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(3)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk0600
     * @tc.number VpeVideoNdk0600
     * @tc.desc   VpeVideoNdk0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk0600', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(4)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk0700
     * @tc.number VpeVideoNdk0700
     * @tc.desc   VpeVideoNdk0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk0700', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(5)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk0800
     * @tc.number VpeVideoNdk0800
     * @tc.desc   VpeVideoNdk0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk0800', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(6)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk0900
     * @tc.number VpeVideoNdk0900
     * @tc.desc   VpeVideoNdk0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk0900', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(7)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk1000
     * @tc.number VpeVideoNdk1000
     * @tc.desc   VpeVideoNdk1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk1000', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(8)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk1100
     * @tc.number VpeVideoNdk1100
     * @tc.desc   VpeVideoNdk1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk1100', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(9)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk1200
     * @tc.number VpeVideoNdk1200
     * @tc.desc   VpeVideoNdk1200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk1200', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(10)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk1300
     * @tc.number VpeVideoNdk1300
     * @tc.desc   VpeVideoNdk1300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk1300', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(11)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk1400
     * @tc.number VpeVideoNdk1400
     * @tc.desc   VpeVideoNdk1400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk1400', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(12)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk1500
     * @tc.number VpeVideoNdk1500
     * @tc.desc   VpeVideoNdk1500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk1500', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(13)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk1600
     * @tc.number VpeVideoNdk1600
     * @tc.desc   VpeVideoNdk1600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk1600', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(14)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk1700
     * @tc.number VpeVideoNdk1700
     * @tc.desc   VpeVideoNdk1700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk1700', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(15)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk1800
     * @tc.number VpeVideoNdk1800
     * @tc.desc   VpeVideoNdk1800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk1800', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(16)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk1900
     * @tc.number VpeVideoNdk1900
     * @tc.desc   VpeVideoNdk1900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk1900', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(17)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk2000
     * @tc.number VpeVideoNdk2000
     * @tc.desc   VpeVideoNdk2000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk2000', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(18)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk2100
     * @tc.number VpeVideoNdk2100
     * @tc.desc   VpeVideoNdk2100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk2100', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(19)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk2200
     * @tc.number VpeVideoNdk2200
     * @tc.desc   VpeVideoNdk2200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk2200', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(20)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk2300
     * @tc.number VpeVideoNdk2300
     * @tc.desc   VpeVideoNdk2300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk2300', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(21)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk2400
     * @tc.number VpeVideoNdk2400
     * @tc.desc   VpeVideoNdk2400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk2400', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(22)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk2500
     * @tc.number VpeVideoNdk2500
     * @tc.desc   VpeVideoNdk2500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk2500', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(23)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk2600
     * @tc.number VpeVideoNdk2600
     * @tc.desc   VpeVideoNdk2600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk2600', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(24)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk2700
     * @tc.number VpeVideoNdk2700
     * @tc.desc   VpeVideoNdk2700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk2700', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(25)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk2800
     * @tc.number VpeVideoNdk2800
     * @tc.desc   VpeVideoNdk2800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk2800', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(26)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk2900
     * @tc.number VpeVideoNdk2900
     * @tc.desc   VpeVideoNdk2900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk2900', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(27)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk3000
     * @tc.number VpeVideoNdk3000
     * @tc.desc   VpeVideoNdk3000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk3000', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(28)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk3100
     * @tc.number VpeVideoNdk3100
     * @tc.desc   VpeVideoNdk3100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk3100', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(29)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk3200
     * @tc.number VpeVideoNdk3200
     * @tc.desc   VpeVideoNdk3200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk3200', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(30)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk3300
     * @tc.number VpeVideoNdk3300
     * @tc.desc   VpeVideoNdk3300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk3300', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(31)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk3400
     * @tc.number VpeVideoNdk3400
     * @tc.desc   VpeVideoNdk3400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk3400', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(32)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk3420
     * @tc.number VpeVideoNdk3420
     * @tc.desc   VpeVideoNdk3420
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk3420', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(33)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk3500
     * @tc.number VpeVideoNdk3500
     * @tc.desc   VpeVideoNdk3500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk3500', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(34)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk3700
     * @tc.number VpeVideoNdk3700
     * @tc.desc   VpeVideoNdk3700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk3700', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(35)).assertEqual(0);
    })

    /**
     * @tc.name   VpeVideoNdk3800
     * @tc.number VpeVideoNdk3800
     * @tc.desc   VpeVideoNdk3800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeVideoNdk3800', Level.LEVEL0, () => {
      expect(libNdk.VpeVideoTest(36)).assertEqual(0);
    })

  })
}