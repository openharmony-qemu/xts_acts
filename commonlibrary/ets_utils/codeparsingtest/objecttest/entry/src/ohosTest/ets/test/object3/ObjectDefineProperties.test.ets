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
import * as ObjectDefineProperties from './ObjectDefineProperties';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectDefinePropertiesTest() {
  describe('ObjectDefinePropertiesTest', () => {
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
     * @tc.name   ObjectDefinePropertiesTest001
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_0100
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest001()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest002
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_0200
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest002()).assertEqual('test');
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest003
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_0300
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest003()).assertEqual('myFunc');
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest004
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_0400
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest004()).assertEqual(123);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest005
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_0500
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest005()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest006
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_0600
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest006()).assertEqual(10);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest007
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_0700
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest007()).assertEqual('test');
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest008
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_0800
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest008()).assertEqual(255);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest009
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_0900
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest009()).assertEqual('buffer');
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest010
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_1000
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest010()).assertEqual(100);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest011
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_1100
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest011()).assertEqual('promise-value');
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest012
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_1200
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest012()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest013
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_1300
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest013()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest014
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_1400
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest014()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest015
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_1500
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest015()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest016
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_1600
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest016()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest017
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_1700
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest017()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest018
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_1800
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest018()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest019
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_1900
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest019()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest020
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_2000
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest020()).assertEqual(2);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest021
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_2100
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest021()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest022
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_2200
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest022()).assertDeepEquals([2, 1]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest023
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_2300
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest023()).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest024
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_2400
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest024()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest025
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_2500
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest025()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest026
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_2600
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest026()).assertEqual(0);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest029
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_2900
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest029()).assertEqual(0);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest030
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_3000
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest030()).assertDeepEquals(['sym-value', 'normal-value']);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest031
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_3100
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest031()).assertDeepEquals([undefined, 2]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest032
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_3200
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest032()).assertDeepEquals([1, 1, 1]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest033
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_3300
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest033()).assertDeepEquals([42, 3.14, -100, 0]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest034
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_3400
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest034()).assertDeepEquals([Infinity, -Infinity, true, true]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest035
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_3500
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest035()).assertDeepEquals([
        Number.MAX_VALUE,
        Number.MIN_VALUE,
        Number.MAX_SAFE_INTEGER,
        Number.MIN_SAFE_INTEGER
      ]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest036
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_3600
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest036()).assertDeepEquals([
        '',
        'hello',
        '!@#$%^&*()',
        '你好世界',
        '👆👿👀💯🎅'
      ]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest037
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_3700
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest037()).assertDeepEquals([
        'line1\nline2',
        'col1\tcol2',
        'path\\to\\file',
        'say "hello"'
      ]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest038
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_3800
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest038()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest039
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_3900
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest039()).assertDeepEquals([undefined, true]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest040
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_4000
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest040()).assertDeepEquals([null, true]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest041
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_4100
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest041()).assertDeepEquals([1, 3]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest042
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_4200
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest042()).assertDeepEquals([42, 'arrow']);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest043
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_4300
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest043()).assertDeepEquals([0, 3, 4]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest044
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_4400
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest044()).assertDeepEquals(["1", "255", "1.5", "9007199254740991"]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest045
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_4500
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest045()).assertEqual('symbol');
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest046
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_4600
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest046()).assertDeepEquals([
        "123456789012345678901234567890",
        "-999999999999999999999999"
      ]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest047
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_4700
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest047()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest048
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_4800
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest048()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest049
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_4900
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest049()).assertEqual('value1');
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest050
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_5000
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest050()).assertEqual(3);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest051
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_5100
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest051()).assertEqual(16);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest052
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_5200
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest052()).assertEqual(16);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest054
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_5400
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest054()).assertEqual(42);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest055
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_5500
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest055()).assertEqual('modified');
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest056
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_5600
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest056()).assertEqual('initial');
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest057
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_5700
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest057()).assertEqual('test');
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest058
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_5800
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest058()).assertDeepEquals([3]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest059
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_5900
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest059()).assertEqual(100);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest060
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_6000
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest060()).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest061
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_6100
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest061()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest062
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_6200
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest062()).assertDeepEquals([undefined, false, false, false]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest063
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_6300
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest063()).assertDeepEquals([42, false, false, false]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest064
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_6400
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest064()).assertDeepEquals([undefined, true, false, false]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest065
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_6500
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest065()).assertEqual(42);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest066
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_6600
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest066()).assertDeepEquals([30, 35]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest067
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_6700
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest067()).assertDeepEquals([undefined, 100]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest068
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_6800
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest068()).assertDeepEquals(['secret', 'new secret']);

    });

    /**
     * @tc.name   ObjectDefinePropertiesTest069
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_6900
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest069()).assertEqual('Getter error');
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest070
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_7000
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest070()).assertDeepEquals([undefined, true]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest071
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_7100
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest071()).assertEqual(null);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest072
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_7200
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest072()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest073
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_7300
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest073()).assertEqual(15);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest075
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_7500
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest075()).assertEqual(10);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest076
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_7600
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest076()).assertDeepEquals([
        'computed value',
        1,
        'computed value',
        1
      ]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest077
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_7700
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest077()).assertDeepEquals([undefined, 42]);

    });

    /**
     * @tc.name   ObjectDefinePropertiesTest078
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_7800
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest078()).assertEqual(100);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest079
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_7900
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest079()).assertDeepEquals(['Jane', 'Smith']);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest080
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_8000
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest080()).assertDeepEquals([25, 'Invalid age']);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest081
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_8100
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest081()).assertDeepEquals([
        { old: 0, new: 10 },
        { old: 10, new: 20 }
      ]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest082
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_8200
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest082()).assertEqual(100);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest083
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_8300
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest083()).assertEqual('Setter error');
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest084
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_8400
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest084()).assertDeepEquals([42, 'number']);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest085
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_8500
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest085()).assertDeepEquals([9, 27]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest086
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_8600
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest086()).assertDeepEquals([42, 42]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest087
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_8700
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest087()).assertDeepEquals([10, 20]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest088
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_8800
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest088()).assertEqual(42);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest089
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_8900
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest089()).assertDeepEquals(['constant', 'constant']);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest090
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_9000
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest090()).assertDeepEquals([undefined, 42]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest091
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_9100
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest091()).assertDeepEquals(['secret', 'new secret']);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest092
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_9200
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest092()).assertDeepEquals([['visible'], 2]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest093
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_9300
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest093()).assertEqual(42);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest094
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_9400
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest094()).assertEqual('second');
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest095
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_9500
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest095()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest096
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_9600
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest096()).assertDeepEquals(['data value', 'modified']);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest097
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_9700
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest097()).assertDeepEquals([undefined, undefined, undefined, false]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest098
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_9800
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest098()).assertDeepEquals([undefined, false]);
    });

    /**
     * @tc.name   ObjectDefinePropertiesTest099
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES_TEST_9900
     * @tc.desc   Object Define Properties Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefinePropertiesTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties.ObjectDefinePropertiesTest099()).assertDeepEquals([2, 3]);
    });
  });
}