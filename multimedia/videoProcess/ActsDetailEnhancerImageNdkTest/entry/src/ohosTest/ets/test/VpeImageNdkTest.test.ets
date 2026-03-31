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

export default function VpeImageNdkTest() {
  describe('VpeImageNdkTest', () => {
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
     * @tc.name   VpeImageNdk0100
     * @tc.number VpeImageNdk0100
     * @tc.desc   VpeImageNdk0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk0100', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(0)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk0200
     * @tc.number VpeImageNdk0200
     * @tc.desc   VpeImageNdk0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk0200', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(1)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk0300
     * @tc.number VpeImageNdk0300
     * @tc.desc   VpeImageNdk0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk0300', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(2)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk0400
     * @tc.number VpeImageNdk0400
     * @tc.desc   VpeImageNdk0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk0400', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(3)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk0500
     * @tc.number VpeImageNdk0500
     * @tc.desc   VpeImageNdk0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk0500', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(4)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk0600
     * @tc.number VpeImageNdk0600
     * @tc.desc   VpeImageNdk0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk0600', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(5)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk0700
     * @tc.number VpeImageNdk0700
     * @tc.desc   VpeImageNdk0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk0700', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(6)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk0800
     * @tc.number VpeImageNdk0800
     * @tc.desc   VpeImageNdk0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk0800', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(7)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk0900
     * @tc.number VpeImageNdk0900
     * @tc.desc   VpeImageNdk0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk0900', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(8)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk1000
     * @tc.number VpeImageNdk1000
     * @tc.desc   VpeImageNdk1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk1000', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(9)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk110
     * @tc.number VpeImageNdk110
     * @tc.desc   VpeImageNdk110
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk110', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(10)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk1120
     * @tc.number VpeImageNdk1120
     * @tc.desc   VpeImageNdk1120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk1120', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(11)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk1130
     * @tc.number VpeImageNdk1130
     * @tc.desc   VpeImageNdk1130
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk1130', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(12)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk1140
     * @tc.number VpeImageNdk1140
     * @tc.desc   VpeImageNdk1140
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk1140', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(13)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk11500
     * @tc.number VpeImageNdk11500
     * @tc.desc   VpeImageNdk11500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk11500', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(14)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk1200
     * @tc.number VpeImageNdk1200
     * @tc.desc   VpeImageNdk1200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk1200', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(15)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk1300
     * @tc.number VpeImageNdk1300
     * @tc.desc   VpeImageNdk1300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk1300', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(16)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk1400
     * @tc.number VpeImageNdk1400
     * @tc.desc   VpeImageNdk1400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk1400', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(17)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk1500
     * @tc.number VpeImageNdk1500
     * @tc.desc   VpeImageNdk1500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk1500', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(18)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk1600
     * @tc.number VpeImageNdk1600
     * @tc.desc   VpeImageNdk1600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk1600', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(19)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk1700
     * @tc.number VpeImageNdk1700
     * @tc.desc   VpeImageNdk1700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk1700', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(20)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk1800
     * @tc.number VpeImageNdk1800
     * @tc.desc   VpeImageNdk1800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk1800', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(21)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk1900
     * @tc.number VpeImageNdk1900
     * @tc.desc   VpeImageNdk1900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk1900', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(22)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk2000
     * @tc.number VpeImageNdk2000
     * @tc.desc   VpeImageNdk2000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk2000', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(23)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk2100
     * @tc.number VpeImageNdk2100
     * @tc.desc   VpeImageNdk2100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk2100', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(24)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk2200
     * @tc.number VpeImageNdk2200
     * @tc.desc   VpeImageNdk2200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk2200', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(25)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk2300
     * @tc.number VpeImageNdk2300
     * @tc.desc   VpeImageNdk2300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk2300', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(26)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk2400
     * @tc.number VpeImageNdk2400
     * @tc.desc   VpeImageNdk2400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk2400', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(27)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk2500
     * @tc.number VpeImageNdk2500
     * @tc.desc   VpeImageNdk2500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk2500', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(28)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk2600
     * @tc.number VpeImageNdk2600
     * @tc.desc   VpeImageNdk2600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk2600', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(29)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk2700
     * @tc.number VpeImageNdk2700
     * @tc.desc   VpeImageNdk2700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk2700', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(30)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk2800
     * @tc.number VpeImageNdk2800
     * @tc.desc   VpeImageNdk2800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk2800', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(31)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk2900
     * @tc.number VpeImageNdk2900
     * @tc.desc   VpeImageNdk2900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk2900', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(32)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk3000
     * @tc.number VpeImageNdk3000
     * @tc.desc   VpeImageNdk3000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk3000', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(33)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk3100
     * @tc.number VpeImageNdk3100
     * @tc.desc   VpeImageNdk3100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk3100', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(34)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk3200
     * @tc.number VpeImageNdk3200
     * @tc.desc   VpeImageNdk3200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk3200', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(35)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk3300
     * @tc.number VpeImageNdk3300
     * @tc.desc   VpeImageNdk3300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk3300', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(36)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk3400
     * @tc.number VpeImageNdk3400
     * @tc.desc   VpeImageNdk3400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk3400', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(37)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk3500
     * @tc.number VpeImageNdk3500
     * @tc.desc   VpeImageNdk3500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk3500', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(38)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk3600
     * @tc.number VpeImageNdk3600
     * @tc.desc   VpeImageNdk3600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk3600', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(39)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk3700
     * @tc.number VpeImageNdk3700
     * @tc.desc   VpeImageNdk3700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk3700', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(40)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk3800
     * @tc.number VpeImageNdk3800
     * @tc.desc   VpeImageNdk3800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk3800', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(41)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk3900
     * @tc.number VpeImageNdk3900
     * @tc.desc   VpeImageNdk3900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk3900', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(42)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk4000
     * @tc.number VpeImageNdk4000
     * @tc.desc   VpeImageNdk4000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk4000', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(43)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk4100
     * @tc.number VpeImageNdk4100
     * @tc.desc   VpeImageNdk4100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk4100', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(44)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk4200
     * @tc.number VpeImageNdk4200
     * @tc.desc   VpeImageNdk4200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk4200', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(45)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk4300
     * @tc.number VpeImageNdk4300
     * @tc.desc   VpeImageNdk4300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk4300', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(46)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk4400
     * @tc.number VpeImageNdk4400
     * @tc.desc   VpeImageNdk4400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk4400', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(47)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk4500
     * @tc.number VpeImageNdk4500
     * @tc.desc   VpeImageNdk4500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk4500', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(48)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk4600
     * @tc.number VpeImageNdk4600
     * @tc.desc   VpeImageNdk4600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk4600', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(49)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk4700
     * @tc.number VpeImageNdk4700
     * @tc.desc   VpeImageNdk4700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk4700', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(50)).assertEqual(0);
    })

    /**
     * @tc.name   VpeImageNdk4800
     * @tc.number VpeImageNdk4800
     * @tc.desc   VpeImageNdk4800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VpeImageNdk4800', Level.LEVEL0, () => {
      expect(libNdk.VpeImageTest(51)).assertEqual(0);
    })
  })
}