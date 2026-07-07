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
import * as ObjectPrototypeConstructor from './ObjectPrototypeConstructor';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectPrototypeConstructorTest() {
  describe('ObjectPrototypeConstructorTest', () => {
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
     * @tc.name   ObjectPrototypeConstructorTest001
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_0100
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest001()).assertDeepEquals([true, 'Object']);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest002
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_0200
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest002()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest003
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_0300
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest003()).assertDeepEquals(["function", true]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest004
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_0400
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest004()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest005
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_0500
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest005()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest007
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_0700
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest007()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest008
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_0800
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest008()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest009
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_0900
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest009()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest010
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_1000
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest010()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest011
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_1100
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest011()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest012
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_1200
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest012()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest013
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_1300
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest013()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest014
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_1400
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest014()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest015
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_1500
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest015()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest016
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_1600
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest016()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest017
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_1700
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest017()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest018
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_1800
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest018()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest019
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_1900
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest019()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest020
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_2000
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest020()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest022
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_2200
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest022()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest023
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_2300
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest023()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest024
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_2400
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest024()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest025
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_2500
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest025()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest026
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_2600
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest026()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest027
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_2700
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest027()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest028
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_2800
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest028()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest029
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_2900
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest029()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest030
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_3000
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest030()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest031
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_3100
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest031()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest032
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_3200
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest032()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest033
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_3300
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest033()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest034
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_3400
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest034()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest035
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_3500
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest035()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest036
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_3600
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest036()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest037
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_3700
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest037()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest038
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_3800
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest038()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest039
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_3900
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest039()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest040
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_4000
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest040()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest041
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_4100
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest041()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest044
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_4400
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest044()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest045
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_4500
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest045()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest046
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_4600
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest046()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest047
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_4700
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest047()).assertDeepEquals([undefined, false]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest048
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_4800
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest048()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest049
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_4900
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest049()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest050
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_5000
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest050()).assertDeepEquals([true, false, true]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest051
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_5100
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest051()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest052
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_5200
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest052()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest053
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_5300
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest053()).assertEqual(null);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest054
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_5400
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest054()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest055
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_5500
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest055()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest056
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_5600
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest056()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest057
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_5700
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest057()).assertDeepEquals([false, "[object Object]"]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest058
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_5800
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest058()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest059
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_5900
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest059()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest060
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_6000
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest060()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest061
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_6100
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest061()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest062
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_6200
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest062()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest063
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_6300
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest063()).assertDeepEquals([true, "PersonClass"]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest064
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_6400
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest064()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest065
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_6500
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest065()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest066
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_6600
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest066()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest067
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_6700
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest067()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest069
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_6900
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest069()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest070
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_7000
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest070()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest071
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_7100
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest071()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest072
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_7200
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest072()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest073
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_7300
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest073()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest074
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_7400
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest074()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest075
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_7500
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest075()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest076
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_7600
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest076()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest077
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_7700
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest077()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest078
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_7800
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest078()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest079
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_7900
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest079()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest080
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_8000
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest080()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest081
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_8100
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest081()).assertEqual("function");
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest082
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_8200
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest082()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest083
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_8300
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest083()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest084
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_8400
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest084()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest085
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_8500
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest085()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest086
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_8600
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest086()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest087
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_8700
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest087()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest088
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_8800
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest088()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest089
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_8900
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest089()).assertDeepEquals([[4,5,6], true]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest090
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_9000
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest090()).assertDeepEquals([true, [1, 2, 3]]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest091
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_9100
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest091()).assertDeepEquals([{ a: 1, b: { c: 2 } }, true]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest092
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_9200
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest092()).assertDeepEquals([true, true, true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest093
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_9300
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest093()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest094
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_9400
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest094()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest095
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_9500
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest095()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest096
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_9600
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest096()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest097
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_9700
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest097()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest098
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_9800
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest098()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeConstructorTest099
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_CONSTRUCTOR_TEST_9900
     * @tc.desc   Object Prototype Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeConstructorTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeConstructor.ObjectPrototypeConstructorTest099()).assertDeepEquals(["not a function", "string"]);
    });
  });
}