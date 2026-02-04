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
     * @tc.name   vpeVideoNdk_01
     * @tc.number vpeVideoNdk_01
     * @tc.desc   vpeVideoNdk_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_01', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(0)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_02
     * @tc.number vpeVideoNdk_02
     * @tc.desc   vpeVideoNdk_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_02', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(1)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_03
     * @tc.number vpeVideoNdk_03
     * @tc.desc   vpeVideoNdk_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_03', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(2)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_05
     * @tc.number vpeVideoNdk_05
     * @tc.desc   vpeVideoNdk_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_05', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(3)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_06
     * @tc.number vpeVideoNdk_06
     * @tc.desc   vpeVideoNdk_06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_06', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(4)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_07
     * @tc.number vpeVideoNdk_07
     * @tc.desc   vpeVideoNdk_07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_07', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(5)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_08
     * @tc.number vpeVideoNdk_08
     * @tc.desc   vpeVideoNdk_08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_08', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(6)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_09
     * @tc.number vpeVideoNdk_09
     * @tc.desc   vpeVideoNdk_09
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_09', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(7)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_10
     * @tc.number vpeVideoNdk_10
     * @tc.desc   vpeVideoNdk_10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_10', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(8)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_11
     * @tc.number vpeVideoNdk_11
     * @tc.desc   vpeVideoNdk_11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_11', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(9)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_12
     * @tc.number vpeVideoNdk_12
     * @tc.desc   vpeVideoNdk_12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_12', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(10)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_13
     * @tc.number vpeVideoNdk_13
     * @tc.desc   vpeVideoNdk_13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_13', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(11)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_14
     * @tc.number vpeVideoNdk_14
     * @tc.desc   vpeVideoNdk_14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_14', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(12)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_15
     * @tc.number vpeVideoNdk_15
     * @tc.desc   vpeVideoNdk_15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_15', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(13)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_16
     * @tc.number vpeVideoNdk_16
     * @tc.desc   vpeVideoNdk_16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_16', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(14)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_17
     * @tc.number vpeVideoNdk_17
     * @tc.desc   vpeVideoNdk_17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_17', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(15)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_18
     * @tc.number vpeVideoNdk_18
     * @tc.desc   vpeVideoNdk_18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_18', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(16)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_19
     * @tc.number vpeVideoNdk_19
     * @tc.desc   vpeVideoNdk_19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_19', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(17)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_20
     * @tc.number vpeVideoNdk_20
     * @tc.desc   vpeVideoNdk_20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_20', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(18)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_21
     * @tc.number vpeVideoNdk_21
     * @tc.desc   vpeVideoNdk_21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_21', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(19)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_22
     * @tc.number vpeVideoNdk_22
     * @tc.desc   vpeVideoNdk_22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_22', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(20)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_23
     * @tc.number vpeVideoNdk_23
     * @tc.desc   vpeVideoNdk_23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_23', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(21)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_24
     * @tc.number vpeVideoNdk_24
     * @tc.desc   vpeVideoNdk_24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_24', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(22)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_25
     * @tc.number vpeVideoNdk_25
     * @tc.desc   vpeVideoNdk_25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_25', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(23)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_26
     * @tc.number vpeVideoNdk_26
     * @tc.desc   vpeVideoNdk_26
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_26', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(24)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_27
     * @tc.number vpeVideoNdk_27
     * @tc.desc   vpeVideoNdk_27
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_27', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(25)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_28
     * @tc.number vpeVideoNdk_28
     * @tc.desc   vpeVideoNdk_28
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_28', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(26)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_29
     * @tc.number vpeVideoNdk_29
     * @tc.desc   vpeVideoNdk_29
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_29', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(27)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_30
     * @tc.number vpeVideoNdk_30
     * @tc.desc   vpeVideoNdk_30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_30', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(28)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_31
     * @tc.number vpeVideoNdk_31
     * @tc.desc   vpeVideoNdk_31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_31', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(29)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_32
     * @tc.number vpeVideoNdk_32
     * @tc.desc   vpeVideoNdk_32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_32', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(30)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_33
     * @tc.number vpeVideoNdk_33
     * @tc.desc   vpeVideoNdk_33
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_33', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(31)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_34
     * @tc.number vpeVideoNdk_34
     * @tc.desc   vpeVideoNdk_34
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_34', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(32)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_34_2
     * @tc.number vpeVideoNdk_34_2
     * @tc.desc   vpeVideoNdk_34_2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_34_2', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(33)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_35
     * @tc.number vpeVideoNdk_35
     * @tc.desc   vpeVideoNdk_35
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_35', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(34)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_37
     * @tc.number vpeVideoNdk_37
     * @tc.desc   vpeVideoNdk_37
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_37', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(35)).assertEqual(0);
    })

    /**
     * @tc.name   vpeVideoNdk_38
     * @tc.number vpeVideoNdk_38
     * @tc.desc   vpeVideoNdk_38
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('vpeVideoNdk_38', Level.LEVEL0, () => {
      expect(libNdk.VPE_VIDEO_NDK(36)).assertEqual(0);
    })

  })
}