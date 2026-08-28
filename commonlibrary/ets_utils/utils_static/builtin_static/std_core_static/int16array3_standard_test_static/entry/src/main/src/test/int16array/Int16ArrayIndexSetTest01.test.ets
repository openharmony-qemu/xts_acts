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

export default function Int16ArrayIndexSetTest01(): void {
  describe('Int16ArrayIndexSetTest01', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_0100
     * @tc.name testInt16ArrayIndexSetTestOne001
     * @tc.desc Verify $_set(0, 42) writes and $_get(0) returns 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, 42);
      let r1: number = arr.$_get(0);
      let e1: int = 42;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_0200
     * @tc.name testInt16ArrayIndexSetTestOne002
     * @tc.desc Verify $_set with int index variable writes and $_get reads back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      const idx: int = 1;
      arr.$_set(idx, 99);
      let r1: number = arr.$_get(1);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_0300
     * @tc.name testInt16ArrayIndexSetTestOne003
     * @tc.desc Verify $_set with number value variable writes and $_get reads back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      const val: number = 55;
      arr.$_set(2, val);
      let r1: number = arr.$_get(2);
      let e1: int = 55;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_0400
     * @tc.name testInt16ArrayIndexSetTestOne004
     * @tc.desc Verify $_set with expression index arr.length-1 writes tail element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(arr.length - 1, 77);
      let r1: number = arr.$_get(2);
      let e1: int = 77;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_0500
     * @tc.name testInt16ArrayIndexSetTestOne005
     * @tc.desc Verify $_set(1, 15) writes second element and $_get(1) returns 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      arr.$_set(1, 15);
      let r1: number = arr.$_get(1);
      let e1: int = 15;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_0600
     * @tc.name testInt16ArrayIndexSetTestOne006
     * @tc.desc Verify $_set at length-1 writes tail and $_get returns new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      arr.$_set(2, 25);
      let r1: number = arr.$_get(2);
      let e1: int = 25;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_0700
     * @tc.name testInt16ArrayIndexSetTestOne007
     * @tc.desc Verify $_set(0, 0) writes zero and $_get(0) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      arr.$_set(0, 0);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_0800
     * @tc.name testInt16ArrayIndexSetTestOne008
     * @tc.desc Verify $_set(0, -1) writes negative one and $_get(0) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      arr.$_set(0, -1);
      let r1: number = arr.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_0900
     * @tc.name testInt16ArrayIndexSetTestOne009
     * @tc.desc Verify $_set(0, 32767) writes int16 max and $_get(0) returns 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, 32767);
      let r1: number = arr.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_1000
     * @tc.name testInt16ArrayIndexSetTestOne010
     * @tc.desc Verify $_set(0, -32768) writes int16 min and $_get(0) returns -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, -32768);
      let r1: number = arr.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_1100
     * @tc.name testInt16ArrayIndexSetTestOne011
     * @tc.desc Verify $_set overwrites same index twice and last value wins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      arr.$_set(0, 5);
      arr.$_set(0, 99);
      let r1: number = arr.$_get(0);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_1200
     * @tc.name testInt16ArrayIndexSetTestOne012
     * @tc.desc Verify $_set at length is silent no-op and $_get(0) unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      try {
        arr.$_set(3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_1300
     * @tc.name testInt16ArrayIndexSetTestOne013
     * @tc.desc Verify $_set with max int index is silent no-op and $_get(0) unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      const bigIdx: int = 2147483647;
      try {
        arr.$_set(bigIdx, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_1400
     * @tc.name testInt16ArrayIndexSetTestOne014
     * @tc.desc Verify $_set with min-like negative int index is silent no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      const negBigIdx: int = -2147483647;
      try {
        arr.$_set(negBigIdx, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_1500
     * @tc.name testInt16ArrayIndexSetTestOne015
     * @tc.desc Verify $_set OOB write leaves first element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(11, 22, 33);
      try {
        arr.$_set(999, 88);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 11;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_1600
     * @tc.name testInt16ArrayIndexSetTestOne016
     * @tc.desc Verify $_set negative index leaves first element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(44, 55, 66);
      try {
        arr.$_set(-5, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 44;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_1700
     * @tc.name testInt16ArrayIndexSetTestOne017
     * @tc.desc Verify $_set OOB write leaves middle element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(100, 200, 300, 400, 500);
      try {
        arr.$_set(999, 77);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(2);
      let e1: int = 300;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_1800
     * @tc.name testInt16ArrayIndexSetTestOne018
     * @tc.desc Verify $_set negative index leaves middle element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(100, 200, 300, 400, 500);
      try {
        arr.$_set(-999, 77);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(2);
      let e1: int = 300;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_1900
     * @tc.name testInt16ArrayIndexSetTestOne019
     * @tc.desc Verify $_set at tail leaves first element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      arr.$_set(2, 99);
      let r1: number = arr.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_2000
     * @tc.name testInt16ArrayIndexSetTestOne020
     * @tc.desc Verify $_set at head leaves last element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      arr.$_set(0, 99);
      let r1: number = arr.$_get(2);
      let e1: int = 30;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_2100
     * @tc.name testInt16ArrayIndexSetTestOne021
     * @tc.desc Verify successive $_set writes at three indexes and middle $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0, 0, 0);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      let r1: number = arr.$_get(1);
      let e1: int = 20;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_2200
     * @tc.name testInt16ArrayIndexSetTestOne022
     * @tc.desc Verify $_set(0) on single-element Int16Array writes value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(5);
      arr.$_set(0, 99);
      let r1: number = arr.$_get(0);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_2300
     * @tc.name testInt16ArrayIndexSetTestOne023
     * @tc.desc Verify $_set(1) on single-element array is silent no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(5);
      try {
        arr.$_set(1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 5;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_2400
     * @tc.name testInt16ArrayIndexSetTestOne024
     * @tc.desc Verify $_set(-1) on single-element array is silent no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(5);
      try {
        arr.$_set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: int = 5;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_2500
     * @tc.name testInt16ArrayIndexSetTestOne025
     * @tc.desc Verify $_set with short value 0 writes and $_get returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      const v: short = 0;
      arr.$_set(0, v);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_2600
     * @tc.name testInt16ArrayIndexSetTestOne026
     * @tc.desc Verify $_set with short value 1 writes and $_get returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      const v: short = 1;
      arr.$_set(0, v);
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_2700
     * @tc.name testInt16ArrayIndexSetTestOne027
     * @tc.desc Verify $_set with short value -1 writes and $_get returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      const v: short = -1;
      arr.$_set(0, v);
      let r1: number = arr.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_2800
     * @tc.name testInt16ArrayIndexSetTestOne028
     * @tc.desc Verify $_set with short.MAX 32767 writes and $_get returns 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      const v: short = 32767;
      arr.$_set(0, v);
      let r1: number = arr.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_2900
     * @tc.name testInt16ArrayIndexSetTestOne029
     * @tc.desc Verify $_set with short.MIN -32768 writes and $_get returns -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      const v: short = -32768;
      arr.$_set(0, v);
      let r1: number = arr.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_3000
     * @tc.name testInt16ArrayIndexSetTestOne030
     * @tc.desc Verify $_set with short value 100 writes middle index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      const v: short = 100;
      arr.$_set(1, v);
      let r1: number = arr.$_get(1);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_3100
     * @tc.name testInt16ArrayIndexSetTestOne031
     * @tc.desc Verify $_set with short value -100 writes middle index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      const v: short = -100;
      arr.$_set(1, v);
      let r1: number = arr.$_get(1);
      let e1: int = -100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_3200
     * @tc.name testInt16ArrayIndexSetTestOne032
     * @tc.desc Verify $_set with short value 42 writes tail index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      const v: short = 42;
      arr.$_set(2, v);
      let r1: number = arr.$_get(2);
      let e1: int = 42;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_3300
     * @tc.name testInt16ArrayIndexSetTestOne033
     * @tc.desc Verify $_set with number value 0 writes and $_get returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      const v: number = 0;
      arr.$_set(0, v);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_3400
     * @tc.name testInt16ArrayIndexSetTestOne034
     * @tc.desc Verify $_set with number value 42 writes and $_get returns 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      const v: number = 42;
      arr.$_set(0, v);
      let r1: number = arr.$_get(0);
      let e1: int = 42;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_3500
     * @tc.name testInt16ArrayIndexSetTestOne035
     * @tc.desc Verify $_set with number int16.MAX 32767 writes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      const v: number = 32767;
      arr.$_set(0, v);
      let r1: number = arr.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_3600
     * @tc.name testInt16ArrayIndexSetTestOne036
     * @tc.desc Verify $_set with number int16.MIN -32768 writes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      const v: number = -32768;
      arr.$_set(0, v);
      let r1: number = arr.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_3700
     * @tc.name testInt16ArrayIndexSetTestOne037
     * @tc.desc Verify $_set(0, 32768) wraps to -32768 via ToInt16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, 32768);
      let r1: number = arr.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_3800
     * @tc.name testInt16ArrayIndexSetTestOne038
     * @tc.desc Verify $_set(0, 32769) wraps to -32767 via ToInt16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, 32769);
      let r1: number = arr.$_get(0);
      let e1: int = -32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_3900
     * @tc.name testInt16ArrayIndexSetTestOne039
     * @tc.desc Verify $_set(0, 65535) wraps to -1 via ToInt16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, 65535);
      let r1: number = arr.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_4000
     * @tc.name testInt16ArrayIndexSetTestOne040
     * @tc.desc Verify $_set(0, 65536) wraps to 0 via ToInt16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, 65536);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_4100
     * @tc.name testInt16ArrayIndexSetTestOne041
     * @tc.desc Verify $_set(0, -32769) wraps to 32767 via ToInt16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, -32769);
      let r1: number = arr.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_4200
     * @tc.name testInt16ArrayIndexSetTestOne042
     * @tc.desc Verify $_set(0, -32770) wraps to 32766 via ToInt16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, -32770);
      let r1: number = arr.$_get(0);
      let e1: int = 32766;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_4300
     * @tc.name testInt16ArrayIndexSetTestOne043
     * @tc.desc Verify $_set(0, -65535) wraps to 1 via ToInt16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, -65535);
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_4400
     * @tc.name testInt16ArrayIndexSetTestOne044
     * @tc.desc Verify $_set(0, -65536) wraps to 0 via ToInt16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, -65536);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_4500
     * @tc.name testInt16ArrayIndexSetTestOne045
     * @tc.desc Verify $_set(0, 100000) wraps with signed 16-bit truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, 100000);
      let r1: number = arr.$_get(0);
      let e1: int = -31072;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_4600
     * @tc.name testInt16ArrayIndexSetTestOne046
     * @tc.desc Verify $_set(0, -100000) wraps with signed 16-bit truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, -100000);
      let r1: number = arr.$_get(0);
      let e1: int = 31072;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_4700
     * @tc.name testInt16ArrayIndexSetTestOne047
     * @tc.desc Verify $_set with NaN coerces to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      const v: number = Number.NaN;
      arr.$_set(0, v);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_4800
     * @tc.name testInt16ArrayIndexSetTestOne048
     * @tc.desc Verify $_set with +Infinity coerces to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      const v: number = Number.POSITIVE_INFINITY;
      arr.$_set(0, v);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_4900
     * @tc.name testInt16ArrayIndexSetTestOne049
     * @tc.desc Verify $_set with -Infinity coerces to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      const v: number = -Number.POSITIVE_INFINITY;
      arr.$_set(0, v);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_5000
     * @tc.name testInt16ArrayIndexSetTestOne050
     * @tc.desc Verify $_set with 3.7 truncates toward zero to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, 3.7);
      let r1: number = arr.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_5100
     * @tc.name testInt16ArrayIndexSetTestOne051
     * @tc.desc Verify $_set with -3.7 truncates toward zero to -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, -3.7);
      let r1: number = arr.$_get(0);
      let e1: int = -3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_5200
     * @tc.name testInt16ArrayIndexSetTestOne052
     * @tc.desc Verify $_set with 0.9 truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      arr.$_set(0, 0.9);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_5300
     * @tc.name testInt16ArrayIndexSetTestOne053
     * @tc.desc Verify $_set with -0.9 truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      arr.$_set(0, -0.9);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_5400
     * @tc.name testInt16ArrayIndexSetTestOne054
     * @tc.desc Verify $_set with 32767.9 truncates to 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, 32767.9);
      let r1: number = arr.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_5500
     * @tc.name testInt16ArrayIndexSetTestOne055
     * @tc.desc Verify $_set with -32768.9 truncates to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, -32768.9);
      let r1: number = arr.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_5600
     * @tc.name testInt16ArrayIndexSetTestOne056
     * @tc.desc Verify $_set with 32768.1 truncates then wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, 32768.1);
      let r1: number = arr.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_5700
     * @tc.name testInt16ArrayIndexSetTestOne057
     * @tc.desc Verify $_set with max double literal truncates/wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, 1.7976931348623157e308);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_5800
     * @tc.name testInt16ArrayIndexSetTestOne058
     * @tc.desc Verify $_set short overload writes 50 same as number path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      const eshort: short = 50;
      arr.$_set(0, eshort);
      let r1: number = arr.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_5900
     * @tc.name testInt16ArrayIndexSetTestOne059
     * @tc.desc Verify $_set number overload writes 50 same as short path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      const nval: number = 50;
      arr.$_set(0, nval);
      let r1: number = arr.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_6000
     * @tc.name testInt16ArrayIndexSetTestOne060
     * @tc.desc Verify $_set short overload with short.MAX at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      const v: short = 32767;
      arr.$_set(1, v);
      let r1: number = arr.$_get(1);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_6100
     * @tc.name testInt16ArrayIndexSetTestOne061
     * @tc.desc Verify $_set number overload with int16.MAX at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      const v: number = 32767;
      arr.$_set(1, v);
      let r1: number = arr.$_get(1);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_6200
     * @tc.name testInt16ArrayIndexSetTestOne062
     * @tc.desc Verify $_set short overload with short.MIN at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      const v: short = -32768;
      arr.$_set(2, v);
      let r1: number = arr.$_get(2);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_6300
     * @tc.name testInt16ArrayIndexSetTestOne063
     * @tc.desc Verify $_set number overload with -32769 wraps to 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      const v: number = -32769;
      arr.$_set(2, v);
      let r1: number = arr.$_get(2);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_6400
     * @tc.name testInt16ArrayIndexSetTestOne064
     * @tc.desc Verify $_set short and number overloads write equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Int16Array.of(0, 0, 0);
      const arr2 = Int16Array.of(0, 0, 0);
      const sv: short = 100;
      const nv: number = 100;
      arr1.$_set(0, sv);
      arr2.$_set(0, nv);
      let r1: number = arr1.$_get(0);
      let e1: number = arr2.$_get(0);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_6500
     * @tc.name testInt16ArrayIndexSetTestOne065
     * @tc.desc Verify $_set does not change array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.$_set(0, 99);
      let r1: int = arr.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_6600
     * @tc.name testInt16ArrayIndexSetTestOne066
     * @tc.desc Verify $_set OOB index does not throw and is silent no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      try {
        arr.$_set(999, 99);
        let r1: number = arr.$_get(0);
        let e1: int = 10;
        expect(r1).assertEqual(e1);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_6700
     * @tc.name testInt16ArrayIndexSetTestOne067
     * @tc.desc Verify $_set negative index does not throw and is silent no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      try {
        arr.$_set(-1, 99);
        let r1: number = arr.$_get(0);
        let e1: int = 10;
        expect(r1).assertEqual(e1);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_6800
     * @tc.name testInt16ArrayIndexSetTestOne068
     * @tc.desc Verify $_set valid index does not throw and writes value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      try {
        arr.$_set(0, 99);
        let r1: number = arr.$_get(0);
        let e1: int = 99;
        expect(r1).assertEqual(e1);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_6900
     * @tc.name testInt16ArrayIndexSetTestOne069
     * @tc.desc Verify $_set with NaN does not throw and stores 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      try {
        arr.$_set(0, Number.NaN);
        let r1: number = arr.$_get(0);
        let e1: int = 0;
        expect(r1).assertEqual(e1);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_7000
     * @tc.name testInt16ArrayIndexSetTestOne070
     * @tc.desc Verify $_set with Infinity does not throw and stores 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      try {
        arr.$_set(0, Number.POSITIVE_INFINITY);
        let r1: number = arr.$_get(0);
        let e1: int = 0;
        expect(r1).assertEqual(e1);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_7100
     * @tc.name testInt16ArrayIndexSetTestOne071
     * @tc.desc Verify $_set(int ) typeof undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let val: short = 10;
      let ret = arr.$_set(0, val);
      let r1: string = typeof ret;
      let e1: string = 'undefined';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_7200
     * @tc.name testInt16ArrayIndexSetTestOne072
     * @tc.desc Verify $_set(int ) Int16Array.of typeof undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3);
      let val: short = 5;
      let ret = arr.$_set(0, val);
      let r1: string = typeof ret;
      let e1: string = 'undefined';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_7300
     * @tc.name testInt16ArrayIndexSetTestOne073
     * @tc.desc Verify $_set(number ) Int16Array.from typeof undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, 2, 3];
      let arr = Int16Array.from(src);
      let ret = arr.$_set(1, 99);
      let r1: string = typeof ret;
      let e1: string = 'undefined';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_7400
     * @tc.name testInt16ArrayIndexSetTestOne074
     * @tc.desc Verify $_set ArrayBuffer typeof undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let arr = new Int16Array(buf, 0, 3);
      let val: short = 10;
      let ret = arr.$_set(0, val);
      let r1: string = typeof ret;
      let e1: string = 'undefined';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_7500
     * @tc.name testInt16ArrayIndexSetTestOne075
     * @tc.desc Verify $_set(number ) int16 typeof undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2]);
      let ret = arr.$_set(0, 32767);
      let r1: string = typeof ret;
      let e1: string = 'undefined';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_7600
     * @tc.name testInt16ArrayIndexSetTestOne076
     * @tc.desc Verify $_set(number ) int16 typeof undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2]);
      let ret = arr.$_set(0, -32768);
      let r1: string = typeof ret;
      let e1: string = 'undefined';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_7700
     * @tc.name testInt16ArrayIndexSetTestOne077
     * @tc.desc Verify $_set instanceof (void )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2]);
      let val: short = 10;
      let ret = arr.$_set(0, val);
      let r1: boolean = ret instanceof Object;
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_7800
     * @tc.name testInt16ArrayIndexSetTestOne078
     * @tc.desc Verify $_set null (void null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2]);
      let ret = arr.$_set(0, 10);
      let r1: boolean = ret === null;
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_7900
     * @tc.name testInt16ArrayIndexSetTestOne079
     * @tc.desc Verify $_set(int ) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([42]);
      let val: short = 7;
      let ret = arr.$_set(0, val);
      let r1: boolean = ret === undefined;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_8000
     * @tc.name testInt16ArrayIndexSetTestOne080
     * @tc.desc Verify $_set(number ) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([42]);
      let ret = arr.$_set(0, 7);
      let r1: boolean = ret === undefined;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_8100
     * @tc.name testInt16ArrayIndexSetTestOne081
     * @tc.desc Verify $_set(number ) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let r1 = arr.$_set(0, 10);
      let r2 = arr.$_set(1, 20);
      let r3 = arr.$_set(2, 30);
      let v1: boolean = r1 === undefined;
      expect(v1).assertTrue();
      let v2: boolean = r2 === undefined;
      expect(v2).assertTrue();
      let v3: boolean = r3 === undefined;
      expect(v3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_8200
     * @tc.name testInt16ArrayIndexSetTestOne082
     * @tc.desc Verify $_set(int ) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3, 4, 5]);
      let lenBefore = arr.length;
      let val: short = 99;
      arr.$_set(0, val);
      let r1: int = arr.length;
      let e1: number = lenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_8300
     * @tc.name testInt16ArrayIndexSetTestOne083
     * @tc.desc Verify $_set(number ) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3, 4, 5]);
      let lenBefore = arr.length;
      arr.$_set(0, 99);
      let r1: int = arr.length;
      let e1: number = lenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_8400
     * @tc.name testInt16ArrayIndexSetTestOne084
     * @tc.desc Verify $_set(number ) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let lenBefore = arr.length;
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      let r1: int = arr.length;
      let e1: number = lenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_8500
     * @tc.name testInt16ArrayIndexSetTestOne085
     * @tc.desc Verify $_set(int ) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([42]);
      let lenBefore = arr.length;
      let val: short = 7;
      arr.$_set(0, val);
      let r1: int = arr.length;
      let e1: number = lenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_8600
     * @tc.name testInt16ArrayIndexSetTestOne086
     * @tc.desc Verify $_set(number ) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([42]);
      let lenBefore = arr.length;
      arr.$_set(0, 7);
      let r1: int = arr.length;
      let e1: number = lenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_8700
     * @tc.name testInt16ArrayIndexSetTestOne087
     * @tc.desc Verify $_set(number ) int16 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let lenBefore = arr.length;
      arr.$_set(0, 32767);
      let r1: int = arr.length;
      let e1: number = lenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_8800
     * @tc.name testInt16ArrayIndexSetTestOne088
     * @tc.desc Verify $_set(number ) int16 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let lenBefore = arr.length;
      arr.$_set(0, -32768);
      let r1: int = arr.length;
      let e1: number = lenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_8900
     * @tc.name testInt16ArrayIndexSetTestOne089
     * @tc.desc Verify $_set(int ) ArrayBuffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      let arr = new Int16Array(buf, 2, 3);
      let lenBefore = arr.length;
      let val: short = 5;
      arr.$_set(0, val);
      let r1: int = arr.length;
      let e1: number = lenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_9000
     * @tc.name testInt16ArrayIndexSetTestOne090
     * @tc.desc Verify $_set(number ) Int16Array.of length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      let lenBefore = arr.length;
      arr.$_set(1, 99);
      let r1: int = arr.length;
      let e1: number = lenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXSET_ONE_9100
     * @tc.name testInt16ArrayIndexSetTestOne091
     * @tc.desc Verify $_set(number ) Int16Array.from length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayIndexSetTestOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [5, 10, 15];
      let arr = Int16Array.from(src);
      let lenBefore = arr.length;
      arr.$_set(2, 99);
      let r1: int = arr.length;
      let e1: number = lenBefore;
      expect(r1).assertEqual(e1);
    });
  });
}
