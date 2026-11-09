'use static';


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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

export default function Int16ArrayIndexSetTest03(): void {
  describe('Int16ArrayIndexSetTest03', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_0500
     * @tc.name testInt16ArrayIndexSetTestThree005
     * @tc.desc Verify $_set(0, 10) $_get(2) expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(90, 91, 92);
      arr.$_set(0, 10);
      try {
        arr.$_set(-50, 555);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      arr.$_set(1, 20);
      try {
        arr.$_set(100, 666);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      arr.$_set(2, 30);
      let r1: number = arr.$_get(2);
      let e1: int = 30;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_0700
     * @tc.name testInt16ArrayIndexSetTestThree007
     * @tc.desc Verify $_set(0, 99) empty array $_get(0) expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Int16Array(0);
      try {
        empty.$_set(0, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const normal = Int16Array.of(1, 2, 3);
      let r1: number = normal.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_1200
     * @tc.name testInt16ArrayIndexSetTestThree012
     * @tc.desc Verify $_set(1, NaN) leaves index 0 unchanged at 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(50, 60, 70);
      arr.$_set(1, Number.NaN);
      let r1: number = arr.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_1500
     * @tc.name testInt16ArrayIndexSetTestThree015
     * @tc.desc Verify $_set(1, NaN) NaN $_get(1) expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      arr.$_set(1, Number.NaN);
      arr.$_set(1, 99);
      let r1: number = arr.$_get(1);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_1600
     * @tc.name testInt16ArrayIndexSetTestThree016
     * @tc.desc Verify $_set(0, Infinity) Infinity $_get(0) expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      arr.$_set(0, Number.POSITIVE_INFINITY);
      arr.$_set(0, 77);
      let r1: number = arr.$_get(0);
      let e1: int = 77;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_2000
     * @tc.name testInt16ArrayIndexSetTestThree020
     * @tc.desc Verify $_set(0, 65535) $_get(1) expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      arr.$_set(0, 65535);
      let r1: number = arr.$_get(1);
      let e1: int = 20;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_2100
     * @tc.name testInt16ArrayIndexSetTestThree021
     * @tc.desc Verify $_set(1, -65535) $_get(1) expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0, 0, 0);
      arr.$_set(1, -65535);
      let r1: number = arr.$_get(1);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_2200
     * @tc.name testInt16ArrayIndexSetTestThree022
     * @tc.desc Verify $_set(1, 2147483647) 2147483647 index=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0, 0, 0);
      arr.$_set(1, 2147483647);
      const result = arr.$_get(1);
      let r1: string = typeof result;
      let e1: string = 'number';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_2300
     * @tc.name testInt16ArrayIndexSetTestThree023
     * @tc.desc Verify $_set(0, 32768.9) $_get(0) expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, 32768.9);
      let r1: number = arr.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_2500
     * @tc.name testInt16ArrayIndexSetTestThree025
     * @tc.desc Verify $_set(88, Infinity) Infinity $_get(2) expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(35, 45, 55);
      try {
        arr.$_set(88, Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(2);
      let e1: int = 55;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_2900
     * @tc.name testInt16ArrayIndexSetTestThree029
     * @tc.desc Verify $_set void undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      const result: void = arr.$_set(0, 42);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_3900
     * @tc.name testInt16ArrayIndexSetTestThree039
     * @tc.desc Verify $_set(0, 49152) value=49152 0xC000 -16384
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, 49152);
      let r1: number = arr.$_get(0);
      let e1: int = -16384;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_4000
     * @tc.name testInt16ArrayIndexSetTestThree040
     * @tc.desc Verify $_set(0, -49153) value=-49153 16383
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, -49153);
      let r1: number = arr.$_get(0);
      let e1: int = 16383;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_4100
     * @tc.name testInt16ArrayIndexSetTestThree041
     * @tc.desc Verify $_set(0, 65537) value=65537 1 2^16+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, 65537);
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_4200
     * @tc.name testInt16ArrayIndexSetTestThree042
     * @tc.desc Verify $_set(0, -65537) value=-65537 -1 2^16-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, -65537);
      let r1: number = arr.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_4300
     * @tc.name testInt16ArrayIndexSetTestThree043
     * @tc.desc Verify $_set(0, 131072) value=131072 0 2*2^16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, 131072);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_4400
     * @tc.name testInt16ArrayIndexSetTestThree044
     * @tc.desc Verify $_set(0, 131071) $_get(0) expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, 131071);
      let r1: number = arr.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_4500
     * @tc.name testInt16ArrayIndexSetTestThree045
     * @tc.desc Verify $_set(0, 15000) short overload $_get(0) expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrNum = Int16Array.of(0, 0);
      const arrE = Int16Array.of(0, 0);
      const sv: short = 15000;
      arrNum.$_set(0, 15000);
      arrE.$_set(0, sv);
      let r1: number = arrNum.$_get(0);
      let e1: number = arrE.$_get(0);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_4600
     * @tc.name testInt16ArrayIndexSetTestThree046
     * @tc.desc Verify $_set(0, 32768) then $_set(0, 100) overwrites, $_get(0) returns 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, 32768);
      arr.$_set(0, 100);
      let r1: number = arr.$_get(0);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_5500
     * @tc.name testInt16ArrayIndexSetTestThree055
     * @tc.desc Verify $_get/$_set/$_get (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(42, 0, 0);
      const val: number = arr.$_get(0);
      arr.$_set(1, val);
      let r1: number = arr.$_get(1);
      let e1: int = 42;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(0);
      let e2: int = 42;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_5600
     * @tc.name testInt16ArrayIndexSetTestThree056
     * @tc.desc Verify $_set/$_set/$_set (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0, 0, 0, 0);
      arr.$_set(3, 40);
      arr.$_set(2, 30);
      arr.$_set(1, 20);
      arr.$_set(0, 10);
      let r1: number = arr.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 30;
      expect(r3).assertEqual(e3);
      let r4: number = arr.$_get(3);
      let e4: int = 40;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_5700
     * @tc.name testInt16ArrayIndexSetTestThree057
     * @tc.desc Verify $_set/$_set/$_set (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0, 0, 0);
      arr.$_set(0, 5);
      arr.$_set(1, 15);
      arr.$_set(2, 25);
      const results: number[] = [];
      for (let i = 0; i < arr.length; i++) {
        results.push(arr.$_get(i));
      }
      let r1: number = results[0];
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = results[1];
      let e2: int = 15;
      expect(r2).assertEqual(e2);
      let r3: number = results[2];
      let e3: int = 25;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_5900
     * @tc.name testInt16ArrayIndexSetTestThree059
     * @tc.desc Verify $_set (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0, 20, 30);
      arr.$_set(0, 99);
      let r1 = arr.at(0);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });
  });
}
