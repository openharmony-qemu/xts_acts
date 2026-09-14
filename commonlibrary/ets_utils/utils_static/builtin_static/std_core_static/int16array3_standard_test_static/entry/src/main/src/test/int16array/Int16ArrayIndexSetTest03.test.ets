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
} from '../../../../hypium/index';
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_0100
     * @tc.name testInt16ArrayIndexSetTestThree001
     * @tc.desc Verify $_set(4, 999) length=4 index=4 index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(101, 102, 103, 104);
      try {
        arr.$_set(4, 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 101;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_0200
     * @tc.name testInt16ArrayIndexSetTestThree002
     * @tc.desc Verify $_set(-1, 888) length=4 index=-1 index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(201, 202, 203, 204);
      try {
        arr.$_set(-1, 888);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 201;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_0300
     * @tc.name testInt16ArrayIndexSetTestThree003
     * @tc.desc Verify $_set(-5, 777) length=4 index=-5 index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(301, 302, 303, 304);
      try {
        arr.$_set(-5, 777);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 301;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_0400
     * @tc.name testInt16ArrayIndexSetTestThree004
     * @tc.desc Verify $_set(99, 555) $_get(0) expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3, 4);
      try {
        arr.$_set(99, 555);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      arr.$_set(0, 42);
      let r1: number = arr.$_get(0);
      let e1: int = 42;
      expect(r1).assertEqual(e1);
    });

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_0600
     * @tc.name testInt16ArrayIndexSetTestThree006
     * @tc.desc Verify $_set(0, 1) empty array length check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(0);
      try {
        arr.$_set(0, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        arr.$_set(-1, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        arr.$_set(1, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        arr.$_set(999, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: int = arr.length;
      let e1: int = 0;
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_0800
     * @tc.name testInt16ArrayIndexSetTestThree008
     * @tc.desc Verify $_set(-2, 77) $_get(0) expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(42);
      try {
        arr.$_set(-2, 77);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 42;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_0900
     * @tc.name testInt16ArrayIndexSetTestThree009
     * @tc.desc Verify $_set(2, 88) on length-1 array throws RangeError, length stays 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(42);
      try {
        arr.$_set(2, 88);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: int = arr.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_1000
     * @tc.name testInt16ArrayIndexSetTestThree010
     * @tc.desc Verify $_set(99, 77) $_get(0) expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(42);
      try {
        arr.$_set(99, 77);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      arr.$_set(0, 55);
      let r1: number = arr.$_get(0);
      let e1: int = 55;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_1100
     * @tc.name testInt16ArrayIndexSetTestThree011
     * @tc.desc Verify $_set(1, NaN) NaN index=1 0 index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(50, 60, 70);
      arr.$_set(1, Number.NaN);
      let r1: number = arr.$_get(1);
      let e1: int = 0;
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_1300
     * @tc.name testInt16ArrayIndexSetTestThree013
     * @tc.desc Verify $_set(2, Infinity) Infinity $_get(2) expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      arr.$_set(2, Number.POSITIVE_INFINITY);
      let r1: number = arr.$_get(2);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_1400
     * @tc.name testInt16ArrayIndexSetTestThree014
     * @tc.desc Verify $_set(1, -Infinity) yields 0, $_get(1) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      arr.$_set(1, Number.NEGATIVE_INFINITY);
      let r1: number = arr.$_get(1);
      let e1: int = 0;
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_1700
     * @tc.name testInt16ArrayIndexSetTestThree017
     * @tc.desc Verify $_set(1, 32768) 32768 index=1 -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3, 4, 5);
      arr.$_set(1, 32768);
      let r1: number = arr.$_get(1);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_1800
     * @tc.name testInt16ArrayIndexSetTestThree018
     * @tc.desc Verify $_set(4, -32769) $_get(4) expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3, 4, 5);
      arr.$_set(4, -32769);
      let r1: number = arr.$_get(4);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_1900
     * @tc.name testInt16ArrayIndexSetTestThree019
     * @tc.desc Verify $_set(2, 65536) $_get(2) expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30, 40);
      arr.$_set(2, 65536);
      let r1: number = arr.$_get(2);
      let e1: int = 0;
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_2400
     * @tc.name testInt16ArrayIndexSetTestThree024
     * @tc.desc Verify $_set(88, NaN) NaN $_get(0) expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(35, 45, 55);
      try {
        arr.$_set(88, Number.NaN);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 35;
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_2600
     * @tc.name testInt16ArrayIndexSetTestThree026
     * @tc.desc Verify $_set(-1, v) on length-3 array throws RangeError, index 0 stays 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(15, 25, 35);
      const v: short = 50;
      try {
        arr.$_set(-1, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 15;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_2700
     * @tc.name testInt16ArrayIndexSetTestThree027
     * @tc.desc Verify $_set(4, v) at index=length throws RangeError, index 0 stays 65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(65, 75, 85, 95);
      const v: short = 33;
      try {
        arr.$_set(4, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 65;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_2800
     * @tc.name testInt16ArrayIndexSetTestThree028
     * @tc.desc Verify $_set(0, NaN) E NaN short number NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, Number.NaN);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_3000
     * @tc.name testInt16ArrayIndexSetTestThree030
     * @tc.desc Verify NaN $_set undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      const result: void = arr.$_set(0, Number.NaN);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_3100
     * @tc.name testInt16ArrayIndexSetTestThree031
     * @tc.desc Verify $_set(3, 99) out of range throws RangeError, index 0 stays 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(7, 14, 21);
      try {
        arr.$_set(3, 99);
        let r1: number = arr.$_get(0);
        let e1: int = 7;
        expect(r1).assertEqual(e1);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_3200
     * @tc.name testInt16ArrayIndexSetTestThree032
     * @tc.desc Verify $_set(4, 88) out of range throws RangeError, index 1 stays 14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(7, 14, 21);
      try {
        arr.$_set(4, 88);
        let r1: number = arr.$_get(1);
        let e1: int = 14;
        expect(r1).assertEqual(e1);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_3300
     * @tc.name testInt16ArrayIndexSetTestThree033
     * @tc.desc Verify $_set(-3, 77) out of range throws RangeError, index 2 stays 21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(7, 14, 21);
      try {
        arr.$_set(-3, 77);
        let r1: number = arr.$_get(2);
        let e1: int = 21;
        expect(r1).assertEqual(e1);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_3400
     * @tc.name testInt16ArrayIndexSetTestThree034
     * @tc.desc Verify $_set(-4, 66) out of range throws RangeError, index 0 stays 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(7, 14, 21);
      try {
        arr.$_set(-4, 66);
        let r1: number = arr.$_get(0);
        let e1: int = 7;
        expect(r1).assertEqual(e1);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_3500
     * @tc.name testInt16ArrayIndexSetTestThree035
     * @tc.desc Verify $_set(-100000, 55) out of range throws RangeError, index 0 stays 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(8, 16, 24);
      try {
        arr.$_set(-100000, 55);
        let r1: number = arr.$_get(0);
        let e1: int = 8;
        expect(r1).assertEqual(e1);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_3600
     * @tc.name testInt16ArrayIndexSetTestThree036
     * @tc.desc Verify $_set(100000, 44) out of range throws RangeError, index 0 stays 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(8, 16, 24);
      try {
        arr.$_set(100000, 44);
        let r1: number = arr.$_get(0);
        let e1: int = 8;
        expect(r1).assertEqual(e1);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_3700
     * @tc.name testInt16ArrayIndexSetTestThree037
     * @tc.desc Verify $_set(0, 32768) no throw $_get(0) expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(9, 18, 27);
      try {
        arr.$_set(0, 32768);
        let r1: number = arr.$_get(0);
        let e1: int = -32768;
        expect(r1).assertEqual(e1);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_3800
     * @tc.name testInt16ArrayIndexSetTestThree038
     * @tc.desc Verify $_set(0, -Infinity) yields 0, $_get(0) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(9, 18, 27);
      try {
        arr.$_set(0, Number.NEGATIVE_INFINITY);
        let r1: number = arr.$_get(0);
        let e1: int = 0;
        expect(r1).assertEqual(e1);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_4700
     * @tc.name testInt16ArrayIndexSetTestThree047
     * @tc.desc Verify $_set(0, 100) $_get(0) expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, 100);
      arr.$_set(0, 32768);
      let r1: number = arr.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_4800
     * @tc.name testInt16ArrayIndexSetTestThree048
     * @tc.desc Verify $_set/$_get (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      arr.$_set(0, 99);
      let r1: number = arr.$_get(1);
      let e1: int = 20;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_4900
     * @tc.name testInt16ArrayIndexSetTestThree049
     * @tc.desc Verify $_set/$_get (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      arr.$_set(1, 99);
      let r1: number = arr.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_5000
     * @tc.name testInt16ArrayIndexSetTestThree050
     * @tc.desc Verify $_set/$_get (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      arr.$_set(2, 99);
      let r1: number = arr.$_get(1);
      let e1: int = 20;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_5100
     * @tc.name testInt16ArrayIndexSetTestThree051
     * @tc.desc Verify $_set/$_set/$_set (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0, 0, 0);
      arr.$_set(0, 11);
      arr.$_set(1, 22);
      arr.$_set(2, 33);
      let r1: number = arr.$_get(0);
      let e1: int = 11;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 22;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 33;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_5200
     * @tc.name testInt16ArrayIndexSetTestThree052
     * @tc.desc Verify $_set (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30, 40, 50);
      arr.$_set(2, 99);
      let r1: int = arr.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_5300
     * @tc.name testInt16ArrayIndexSetTestThree053
     * @tc.desc Verify $_set/$_set/$_get (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      arr.$_set(0, 5);
      arr.$_set(0, 99);
      let r1: number = arr.$_get(1);
      let e1: int = 20;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_5400
     * @tc.name testInt16ArrayIndexSetTestThree054
     * @tc.desc Verify $_set/$_set/$_get (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      arr.$_set(0, 5);
      arr.$_set(0, 99);
      let r1: number = arr.$_get(2);
      let e1: int = 30;
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_THREE_5800
     * @tc.name testInt16ArrayIndexSetTestThree058
     * @tc.desc Verify forEach/$_set/$_set (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0, 0, 0);
      arr.$_set(0, 7);
      arr.$_set(1, 17);
      arr.$_set(2, 27);
      let sum: number = 0;
      arr.forEach((value: number) => {
        sum = sum + value;
      });
      expect(sum).assertEqual(51);
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
