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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium';
import * as ObjectIsSealed2 from './ObjectIsSealed2';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectIsSealed2Test() {
  describe('ObjectIsSealed2Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(20);
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
     * @tc.name   ObjectIsSealed2Test001
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_0100
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test001()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsSealed2Test002
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_0200
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test002()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsSealed2Test003
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_0300
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test003()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsSealed2Test004
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_0400
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test004()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsSealed2Test005
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_0500
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test005()).assertDeepEquals([false, true, false]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test006
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_0600
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test006()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test007
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_0700
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test007()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test008
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_0800
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test008()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test009
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_0900
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test009()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test010
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_1000
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test010()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test011
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_1100
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test011()).assertDeepEquals([false, true, false]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test012
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_1200
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test012()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test013
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_1300
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test013()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test014
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_1400
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test014()).assertDeepEquals([false, true, false]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test015
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_1500
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test015()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsSealed2Test016
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_1600
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test016()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test017
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_1700
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test017()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test018
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_1800
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test018()).assertDeepEquals([undefined, false]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test019
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_1900
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test019()).assertDeepEquals([1, true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test020
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_2000
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test020()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsSealed2Test021
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_2100
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test021()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test022
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_2200
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test022()).assertDeepEquals([2, true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test025
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_2500
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test025()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test026
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_2600
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test026()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test027
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_2700
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test027()).assertDeepEquals([true, false, true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test028
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_2800
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test028()).assertDeepEquals([false, false, true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test029
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_2900
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test029()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test030
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_3000
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test030()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsSealed2Test031
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_3100
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test031()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test032
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_3200
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test032()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test033
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_3300
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test033()).assertDeepEquals([true, false, false, false, false, true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test034
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_3400
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test034()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test035
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_3500
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test035()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test036
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_3600
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test036()).assertDeepEquals([false, true, true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test037
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_3700
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test037()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test039
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_3900
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test039()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test040
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_4000
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test040()).assertDeepEquals([true, true, undefined]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test041
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_4100
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test041()).assertDeepEquals([1, true, false, true, true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test042
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_4200
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test042()).assertDeepEquals([false, false, true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test043
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_4300
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test043()).assertDeepEquals([['a', 'b', 'c'], true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test044
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_4400
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test044()).assertDeepEquals([['a', 'b'], true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test046
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_4600
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test046()).assertDeepEquals([1, 2, true, false]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test047
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_4700
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test047()).assertDeepEquals([100, true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test048
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_4800
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test048()).assertDeepEquals([true, false, 1]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test049
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_4900
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test049()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test050
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_5000
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test050()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test051
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_5100
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test051()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsSealed2Test052
     * @tc.number SUB_BUILTINS_OBJECT_SEALED2_TEST_5200
     * @tc.desc   Object IsSealed2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealed2Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed2.ObjectIsSealed2Test052()).assertDeepEquals([false, true, true]);
    });
  });
}
    