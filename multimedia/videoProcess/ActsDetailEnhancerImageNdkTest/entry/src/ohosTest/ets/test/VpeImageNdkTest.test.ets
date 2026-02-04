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
     * @tc.name   vpeImageNdk_01
     * @tc.number vpeImageNdk_01
     * @tc.desc   vpeImageNdk_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_01', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(0)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_02
     * @tc.number vpeImageNdk_02
     * @tc.desc   vpeImageNdk_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_02', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(1)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_03
     * @tc.number vpeImageNdk_03
     * @tc.desc   vpeImageNdk_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_03', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(2)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_04
     * @tc.number vpeImageNdk_04
     * @tc.desc   vpeImageNdk_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_04', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(3)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_05
     * @tc.number vpeImageNdk_05
     * @tc.desc   vpeImageNdk_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_05', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(4)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_06
     * @tc.number vpeImageNdk_06
     * @tc.desc   vpeImageNdk_06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_06', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(5)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_07
     * @tc.number vpeImageNdk_07
     * @tc.desc   vpeImageNdk_07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_07', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(6)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_08
     * @tc.number vpeImageNdk_08
     * @tc.desc   vpeImageNdk_08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_08', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(7)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_09
     * @tc.number vpeImageNdk_09
     * @tc.desc   vpeImageNdk_09
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_09', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(8)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_10
     * @tc.number vpeImageNdk_10
     * @tc.desc   vpeImageNdk_10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_10', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(9)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_11
     * @tc.number vpeImageNdk_11
     * @tc.desc   vpeImageNdk_11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_11', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(10)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_11_2
     * @tc.number vpeImageNdk_11_2
     * @tc.desc   vpeImageNdk_11_2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_11_2', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(11)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_11_3
     * @tc.number vpeImageNdk_11_3
     * @tc.desc   vpeImageNdk_11_3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_11_3', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(12)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_11_4
     * @tc.number vpeImageNdk_11_4
     * @tc.desc   vpeImageNdk_11_4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_11_4', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(13)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_11_5
     * @tc.number vpeImageNdk_11_5
     * @tc.desc   vpeImageNdk_11_5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_11_5', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(14)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_12
     * @tc.number vpeImageNdk_12
     * @tc.desc   vpeImageNdk_12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_12', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(15)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_13
     * @tc.number vpeImageNdk_13
     * @tc.desc   vpeImageNdk_13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_13', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(16)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_14
     * @tc.number vpeImageNdk_14
     * @tc.desc   vpeImageNdk_14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_14', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(17)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_15
     * @tc.number vpeImageNdk_15
     * @tc.desc   vpeImageNdk_15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_15', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(18)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_16
     * @tc.number vpeImageNdk_16
     * @tc.desc   vpeImageNdk_16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_16', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(19)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_17
     * @tc.number vpeImageNdk_17
     * @tc.desc   vpeImageNdk_17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_17', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(20)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_18
     * @tc.number vpeImageNdk_18
     * @tc.desc   vpeImageNdk_18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_18', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(21)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_19
     * @tc.number vpeImageNdk_19
     * @tc.desc   vpeImageNdk_19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_19', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(22)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_20
     * @tc.number vpeImageNdk_20
     * @tc.desc   vpeImageNdk_20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_20', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(23)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_21
     * @tc.number vpeImageNdk_21
     * @tc.desc   vpeImageNdk_21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_21', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(24)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_22
     * @tc.number vpeImageNdk_22
     * @tc.desc   vpeImageNdk_22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_22', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(25)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_23
     * @tc.number vpeImageNdk_23
     * @tc.desc   vpeImageNdk_23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_23', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(26)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_24
     * @tc.number vpeImageNdk_24
     * @tc.desc   vpeImageNdk_24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_24', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(27)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_25
     * @tc.number vpeImageNdk_25
     * @tc.desc   vpeImageNdk_25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_25', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(28)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_26
     * @tc.number vpeImageNdk_26
     * @tc.desc   vpeImageNdk_26
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_26', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(29)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_27
     * @tc.number vpeImageNdk_27
     * @tc.desc   vpeImageNdk_27
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_27', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(30)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_28
     * @tc.number vpeImageNdk_28
     * @tc.desc   vpeImageNdk_28
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_28', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(31)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_29
     * @tc.number vpeImageNdk_29
     * @tc.desc   vpeImageNdk_29
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_29', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(32)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_30
     * @tc.number vpeImageNdk_30
     * @tc.desc   vpeImageNdk_30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_30', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(33)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_31
     * @tc.number vpeImageNdk_31
     * @tc.desc   vpeImageNdk_31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_31', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(34)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_32
     * @tc.number vpeImageNdk_32
     * @tc.desc   vpeImageNdk_32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_32', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(35)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_33
     * @tc.number vpeImageNdk_33
     * @tc.desc   vpeImageNdk_33
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_33', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(36)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_34
     * @tc.number vpeImageNdk_34
     * @tc.desc   vpeImageNdk_34
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_34', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(37)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_35
     * @tc.number vpeImageNdk_35
     * @tc.desc   vpeImageNdk_35
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_35', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(38)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_36
     * @tc.number vpeImageNdk_36
     * @tc.desc   vpeImageNdk_36
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_36', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(39)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_37
     * @tc.number vpeImageNdk_37
     * @tc.desc   vpeImageNdk_37
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_37', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(40)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_38
     * @tc.number vpeImageNdk_38
     * @tc.desc   vpeImageNdk_38
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_38', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(41)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_39
     * @tc.number vpeImageNdk_39
     * @tc.desc   vpeImageNdk_39
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_39', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(42)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_40
     * @tc.number vpeImageNdk_40
     * @tc.desc   vpeImageNdk_40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_40', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(43)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_41
     * @tc.number vpeImageNdk_41
     * @tc.desc   vpeImageNdk_41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_41', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(44)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_42
     * @tc.number vpeImageNdk_42
     * @tc.desc   vpeImageNdk_42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_42', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(45)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_43
     * @tc.number vpeImageNdk_43
     * @tc.desc   vpeImageNdk_43
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_43', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(46)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_44
     * @tc.number vpeImageNdk_44
     * @tc.desc   vpeImageNdk_44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_44', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(47)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_45
     * @tc.number vpeImageNdk_45
     * @tc.desc   vpeImageNdk_45
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_45', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(48)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_46
     * @tc.number vpeImageNdk_46
     * @tc.desc   vpeImageNdk_46
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_46', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(49)).assertEqual(0);
    })

    /**
     * @tc.name   vpeImageNdk_47
     * @tc.number vpeImageNdk_47
     * @tc.desc   vpeImageNdk_47
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeImageNdk_47', Level.LEVEL0, () => {
      expect(libNdk.VPE_IMAGE_NDK(50)).assertEqual(0);
    })
  })
}