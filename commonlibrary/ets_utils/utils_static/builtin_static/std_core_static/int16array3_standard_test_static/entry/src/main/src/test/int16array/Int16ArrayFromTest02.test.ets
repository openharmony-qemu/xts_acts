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

export default function Int16ArrayFromTest02(): void {
  describe('Int16ArrayFromTest02', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_0100
     * @tc.name testInt16ArrayFromTestTwo001
     * @tc.desc Verify Int16Array.from Set insert order 2 1 0 preserves reverse order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(2);
      s.add(1);
      s.add(0);
      let result: Int16Array = Int16Array.from(s);
      let r1: number = result.$_get(0);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_0200
     * @tc.name testInt16ArrayFromTestTwo002
     * @tc.desc Verify Int16Array.from Set insert order -1 0 1 preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(-1);
      s.add(0);
      s.add(1);
      let result: Int16Array = Int16Array.from(s);
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 1;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_0300
     * @tc.name testInt16ArrayFromTestTwo003
     * @tc.desc Verify Int16Array.from Set insert order MAX 0 MIN preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(32767);
      s.add(0);
      s.add(-32768);
      let result: Int16Array = Int16Array.from(s);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = -32768;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_0400
     * @tc.name testInt16ArrayFromTestTwo004
     * @tc.desc Verify Int16Array.from Set insert order MIN 0 MAX preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(-32768);
      s.add(0);
      s.add(32767);
      let result: Int16Array = Int16Array.from(s);
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 32767;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_0500
     * @tc.name testInt16ArrayFromTestTwo005
     * @tc.desc Verify Int16Array.from Set [32767,32768] wraps second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(32767);
      s.add(32768);
      let result: Int16Array = Int16Array.from(s);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_0600
     * @tc.name testInt16ArrayFromTestTwo006
     * @tc.desc Verify Int16Array.from Set [-32768,-32769] wraps second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(-32768);
      s.add(-32769);
      let result: Int16Array = Int16Array.from(s);
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 32767;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_0700
     * @tc.name testInt16ArrayFromTestTwo007
     * @tc.desc Verify Int16Array.from Set [32768,-32769] both wrap around
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(32768);
      s.add(-32769);
      let result: Int16Array = Int16Array.from(s);
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 32767;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_0800
     * @tc.name testInt16ArrayFromTestTwo008
     * @tc.desc Verify Int16Array.from Set [0,32768,-1] middle overflow wraps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(0);
      s.add(32768);
      s.add(-1);
      let result: Int16Array = Int16Array.from(s);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = -1;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_0900
     * @tc.name testInt16ArrayFromTestTwo009
     * @tc.desc Verify Int16Array.from Set [65535,32768,-32769] three overflow values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(65535);
      s.add(32768);
      s.add(-32769);
      let result: Int16Array = Int16Array.from(s);
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 32767;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_1000
     * @tc.name testInt16ArrayFromTestTwo010
     * @tc.desc Verify Int16Array.from all-positive Set keeps positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      s.add(100);
      s.add(32767);
      let result: Int16Array = Int16Array.from(s);
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 100;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 32767;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_1100
     * @tc.name testInt16ArrayFromTestTwo011
     * @tc.desc Verify Int16Array.from all-negative Set keeps negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(-1);
      s.add(-100);
      s.add(-32768);
      let result: Int16Array = Int16Array.from(s);
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -100;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = -32768;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_1200
     * @tc.name testInt16ArrayFromTestTwo012
     * @tc.desc Verify Int16Array.from Set with duplicate adds keeps unique length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(5);
      s.add(5);
      s.add(5);
      let result: Int16Array = Int16Array.from(s);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 5;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_1300
     * @tc.name testInt16ArrayFromTestTwo013
     * @tc.desc Verify Int16Array.from large Set of 100 elements returns length 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      for (let i: int = 0; i < 100; i++) {
        s.add(i);
      }
      let result: Int16Array = Int16Array.from(s);
      let r1: int = result.length;
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_1400
     * @tc.name testInt16ArrayFromTestTwo014
     * @tc.desc Verify Int16Array.from large Set first element is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      for (let i: int = 0; i < 100; i++) {
        s.add(i);
      }
      let result: Int16Array = Int16Array.from(s);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_1500
     * @tc.name testInt16ArrayFromTestTwo015
     * @tc.desc Verify Int16Array.from Set with boundary and overflow values length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(-32768);
      s.add(32767);
      s.add(32768);
      s.add(-32769);
      s.add(0);
      let result: Int16Array = Int16Array.from(s);
      let r1: int = result.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_1600
     * @tc.name testInt16ArrayFromTestTwo016
     * @tc.desc Verify Int16Array.from empty Set returns Int16Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      let result: Int16Array = Int16Array.from(s);
      let r1: boolean = result instanceof Int16Array;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_1700
     * @tc.name testInt16ArrayFromTestTwo017
     * @tc.desc Verify Int16Array.from single-element Set length equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(42);
      let result: Int16Array = Int16Array.from(s);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_1800
     * @tc.name testInt16ArrayFromTestTwo018
     * @tc.desc Verify Int16Array.from multi-element Set length equals Set size 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      s.add(2);
      s.add(3);
      let result: Int16Array = Int16Array.from(s);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_1900
     * @tc.name testInt16ArrayFromTestTwo019
     * @tc.desc Verify Int16Array.from empty Set byteLength equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      let result: Int16Array = Int16Array.from(s);
      let r1: int = result.byteLength;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_2000
     * @tc.name testInt16ArrayFromTestTwo020
     * @tc.desc Verify Int16Array.from single-element Set byteLength equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      let result: Int16Array = Int16Array.from(s);
      let r1: int = result.byteLength;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_2100
     * @tc.name testInt16ArrayFromTestTwo021
     * @tc.desc Verify Int16Array.from three-element Set byteLength equals length times 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(10);
      s.add(20);
      s.add(30);
      let result: Int16Array = Int16Array.from(s);
      let r1: int = result.byteLength;
      let e1: int = 6;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_2200
     * @tc.name testInt16ArrayFromTestTwo022
     * @tc.desc Verify Int16Array.from Set result BYTES_PER_ELEMENT equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(0);
      let result: Int16Array = Int16Array.from(s);
      let r1: int = result.BYTES_PER_ELEMENT;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_2300
     * @tc.name testInt16ArrayFromTestTwo023
     * @tc.desc Verify Int16Array.from Set result byteOffset equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(0);
      let result: Int16Array = Int16Array.from(s);
      let r1: int = result.byteOffset;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_2400
     * @tc.name testInt16ArrayFromTestTwo024
     * @tc.desc Verify Int16Array.from Set result buffer is not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(0);
      let result: Int16Array = Int16Array.from(s);
      let r1: boolean = result.buffer !== null;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_2500
     * @tc.name testInt16ArrayFromTestTwo025
     * @tc.desc Verify Int16Array.from Set buffer.byteLength equals result.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      s.add(2);
      let result: Int16Array = Int16Array.from(s);
      let r1: int = result.buffer.byteLength;
      let e1: number = result.byteLength;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_2600
     * @tc.name testInt16ArrayFromTestTwo026
     * @tc.desc Verify Int16Array.from Set[0,1] $_get(0) equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(0);
      s.add(1);
      let result: Int16Array = Int16Array.from(s);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_2700
     * @tc.name testInt16ArrayFromTestTwo027
     * @tc.desc Verify Int16Array.from Set[0,1] $_get(1) equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(0);
      s.add(1);
      let result: Int16Array = Int16Array.from(s);
      let r1: number = result.$_get(1);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_2800
     * @tc.name testInt16ArrayFromTestTwo028
     * @tc.desc Verify Int16Array.from Set[MAX,MIN] $_get(0) equals 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(32767);
      s.add(-32768);
      let result: Int16Array = Int16Array.from(s);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_2900
     * @tc.name testInt16ArrayFromTestTwo029
     * @tc.desc Verify Int16Array.from Set[MAX,MIN] $_get(1) equals -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(32767);
      s.add(-32768);
      let result: Int16Array = Int16Array.from(s);
      let r1: number = result.$_get(1);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_3000
     * @tc.name testInt16ArrayFromTestTwo030
     * @tc.desc Verify mutating Int16Array.from result does not affect original Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      s.add(2);
      let result: Int16Array = Int16Array.from(s);
      result.$_set(0, 99);
      let r1: boolean = s.has(1);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_3100
     * @tc.name testInt16ArrayFromTestTwo031
     * @tc.desc Verify adding to Set after Int16Array.from does not change result length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      let result: Int16Array = Int16Array.from(s);
      s.add(2);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_3200
     * @tc.name testInt16ArrayFromTestTwo032
     * @tc.desc Verify two Int16Array.from calls yield independent instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      let r1: Int16Array = Int16Array.from(s);
      let r2: Int16Array = Int16Array.from(s);
      r1.$_set(0, 99);
      let v1: number = r2.$_get(0);
      let e1: int = 1;
      expect(v1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_3300
     * @tc.name testInt16ArrayFromTestTwo033
     * @tc.desc Verify two Int16Array.from calls yield equal element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      s.add(2);
      let r1: Int16Array = Int16Array.from(s);
      let r2: Int16Array = Int16Array.from(s);
      let v1: number = r1.$_get(0);
      let e1: number = r2.$_get(0);
      expect(v1).assertEqual(e1);
      let v2: number = r1.$_get(1);
      let e2: number = r2.$_get(1);
      expect(v2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_3400
     * @tc.name testInt16ArrayFromTestTwo034
     * @tc.desc Verify Int16Array.from(Set).fill(0) zeros all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      s.add(2);
      s.add(3);
      let result: Int16Array = Int16Array.from(s).fill(0);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_3500
     * @tc.name testInt16ArrayFromTestTwo035
     * @tc.desc Verify Int16Array.from(Set).reverse() reverses element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      s.add(2);
      s.add(3);
      let result: Int16Array = Int16Array.from(s).reverse();
      let r1: number = result.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 1;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_3600
     * @tc.name testInt16ArrayFromTestTwo036
     * @tc.desc Verify Int16Array.from(Set).sort() sorts elements ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(3);
      s.add(1);
      s.add(2);
      let result: Int16Array = Int16Array.from(s).sort();
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 3;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_3700
     * @tc.name testInt16ArrayFromTestTwo037
     * @tc.desc Verify Int16Array.from result can be copied via new Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      s.add(2);
      let intermediate: Int16Array = Int16Array.from(s);
      let result: Int16Array = new Int16Array(intermediate);
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_3800
     * @tc.name testInt16ArrayFromTestTwo038
     * @tc.desc Verify Int16Array.from result can be used as set source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(10);
      s.add(20);
      let source: Int16Array = Int16Array.from(s);
      let target: Int16Array = new Int16Array(2);
      target.set(source);
      let r1: number = target.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(1);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_3900
     * @tc.name testInt16ArrayFromTestTwo039
     * @tc.desc Verify Int16Array.from result $_get(-1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      let result: Int16Array = Int16Array.from(s);
      try {
        result.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_4000
     * @tc.name testInt16ArrayFromTestTwo040
     * @tc.desc Verify Int16Array.from result $_get(length) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      let result: Int16Array = Int16Array.from(s);
      try {
        result.$_get(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_4100
     * @tc.name testInt16ArrayFromTestTwo041
     * @tc.desc Verify Int16Array.from result $_set beyond length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      let result: Int16Array = Int16Array.from(s);
      try {
        result.$_set(5, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_4200
     * @tc.name testInt16ArrayFromTestTwo042
     * @tc.desc Verify Int16Array.from Set with overflow value keeps length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(32768);
      let result: Int16Array = Int16Array.from(s);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_4300
     * @tc.name testInt16ArrayFromTestTwo043
     * @tc.desc Verify Int16Array.from large Set returns byteLength 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      for (let i: int = 0; i < 100; i++) {
        s.add(i);
      }
      let result: Int16Array = Int16Array.from(s);
      let r1: int = result.byteLength;
      let e1: int = 200;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_4400
     * @tc.name testInt16ArrayFromTestTwo044
     * @tc.desc Verify Int16Array.from with exactly 1 argument (Int16Array source) creates a copy successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([10, 20]);
      const result = Int16Array.from(src);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1);
      let e3: int = 20;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_4500
     * @tc.name testInt16ArrayFromTestTwo045
     * @tc.desc Verify Int16Array.from with empty Int16Array (length 0) returns empty Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array(0);
      const result = Int16Array.from(src);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: boolean = result instanceof Int16Array;
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_4600
     * @tc.name testInt16ArrayFromTestTwo046
     * @tc.desc Verify Int16Array.from with empty Int16Array result byteLength equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array(0);
      const result = Int16Array.from(src);
      let r1: int = result.byteLength;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_4700
     * @tc.name testInt16ArrayFromTestTwo047
     * @tc.desc Verify Int16Array.from with single-element Int16Array containing positive normal value 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([42]);
      const result = Int16Array.from(src);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 42;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_4800
     * @tc.name testInt16ArrayFromTestTwo048
     * @tc.desc Verify Int16Array.from with single-element Int16Array containing MAX value 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([32767]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_4900
     * @tc.name testInt16ArrayFromTestTwo049
     * @tc.desc Verify Int16Array.from with single-element Int16Array containing MIN value -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([-32768]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_5000
     * @tc.name testInt16ArrayFromTestTwo050
     * @tc.desc Verify Int16Array.from with single-element Int16Array containing value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([-1]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_5100
     * @tc.name testInt16ArrayFromTestTwo051
     * @tc.desc Verify Int16Array.from with single-element Int16Array containing value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([0]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_5200
     * @tc.name testInt16ArrayFromTestTwo052
     * @tc.desc Verify Int16Array.from with single-element Int16Array containing value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_5300
     * @tc.name testInt16ArrayFromTestTwo053
     * @tc.desc Verify Int16Array.from with multi-element Int16Array of consecutive positive values preserves all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([10, 20, 30, 40]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 30;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3);
      let e4: int = 40;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_5400
     * @tc.name testInt16ArrayFromTestTwo054
     * @tc.desc Verify Int16Array.from with multi-element Int16Array of consecutive negative values preserves all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([-10, -20, -30, -40]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -10;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -20;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = -30;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3);
      let e4: int = -40;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_5500
     * @tc.name testInt16ArrayFromTestTwo055
     * @tc.desc Verify Int16Array.from with multi-element Int16Array of mixed sign values preserves each element sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([-100, 0, 100, -200, 200]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -100;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 100;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3);
      let e4: int = -200;
      expect(r4).assertEqual(e4);
      let r5: number = result.$_get(4);
      let e5: int = 200;
      expect(r5).assertEqual(e5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_5600
     * @tc.name testInt16ArrayFromTestTwo056
     * @tc.desc Verify Int16Array.from with Int16Array containing only MAX boundary values (32767 repeated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([32767, 32767, 32767]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 32767;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 32767;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_5700
     * @tc.name testInt16ArrayFromTestTwo057
     * @tc.desc Verify Int16Array.from with Int16Array containing only MIN boundary values (-32768 repeated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([-32768, -32768, -32768]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = -32768;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_5800
     * @tc.name testInt16ArrayFromTestTwo058
     * @tc.desc Verify Int16Array.from with Int16Array containing both MIN and MAX boundaries at opposite ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([-32768, 0, 32767]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 32767;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_5900
     * @tc.name testInt16ArrayFromTestTwo059
     * @tc.desc Verify Int16Array.from with all-zero Int16Array preserves every zero element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([0, 0, 0, 0]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3);
      let e4: int = 0;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_6000
     * @tc.name testInt16ArrayFromTestTwo060
     * @tc.desc Verify Int16Array.from with source constructed via new Int16Array(length) copies initialized zero elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array(5);
      const result = Int16Array.from(src);
      let r1: int = result.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(4);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_6100
     * @tc.name testInt16ArrayFromTestTwo061
     * @tc.desc Verify Int16Array.from with source constructed via new Int16Array([...]) copies elements correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([7, 14, 21]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 7;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 14;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 21;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_6200
     * @tc.name testInt16ArrayFromTestTwo062
     * @tc.desc Verify Int16Array.from with source backed by full ArrayBuffer copies element values not buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const src = new Int16Array(buf, 0, 3);
      src.$_set(0, 100);
      src.$_set(1, 200);
      src.$_set(2, 300);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 200;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 300;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_6300
     * @tc.name testInt16ArrayFromTestTwo063
     * @tc.desc Verify Int16Array.from with source backed by ArrayBuffer at non-zero byteOffset copies correct element subset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(10);
      const src = new Int16Array(buf, 2, 4);
      src.$_set(0, 11);
      src.$_set(1, 22);
      src.$_set(2, 33);
      src.$_set(3, 44);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 11;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(3);
      let e2: int = 44;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_6400
     * @tc.name testInt16ArrayFromTestTwo064
     * @tc.desc Verify Int16Array.from with source containing int16 overflow value 32768 wraps to -32768 preserves wrapped value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const src = new Int16Array(buf, 0, 1);
      src.$_set(0, 32768);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_6500
     * @tc.name testInt16ArrayFromTestTwo065
     * @tc.desc Verify Int16Array.from with source containing int16 underflow value -32769 wraps to 32767 preserves wrapped value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const src = new Int16Array(buf, 0, 1);
      src.$_set(0, -32769);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_6600
     * @tc.name testInt16ArrayFromTestTwo066
     * @tc.desc Verify Int16Array.from with source where $_set was called with NaN converted to 0 preserves the 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const src = new Int16Array(buf, 0, 1);
      src.$_set(0, Float.NaN);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_6700
     * @tc.name testInt16ArrayFromTestTwo067
     * @tc.desc Verify Int16Array.from with source where $_set was called with Infinity converted to 0 preserves the 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const src = new Int16Array(buf, 0, 1);
      src.$_set(0, Float.POSITIVE_INFINITY);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_6800
     * @tc.name testInt16ArrayFromTestTwo068
     * @tc.desc Verify Int16Array.from with source where $_set was called with -Infinity converted to 0 preserves the 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const src = new Int16Array(buf, 0, 1);
      src.$_set(0, Float.NEGATIVE_INFINITY);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_6900
     * @tc.name testInt16ArrayFromTestTwo069
     * @tc.desc Verify Int16Array.from with source containing truncated float 3.7 becomes 3 preserves truncated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const src = new Int16Array(buf, 0, 1);
      src.$_set(0, 3.7);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_7000
     * @tc.name testInt16ArrayFromTestTwo070
     * @tc.desc Verify Int16Array.from with source containing truncated float -3.7 becomes -3 preserves truncated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const src = new Int16Array(buf, 0, 1);
      src.$_set(0, -3.7);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_7100
     * @tc.name testInt16ArrayFromTestTwo071
     * @tc.desc Verify Int16Array.from with large Int16Array source of length 1000 preserves first and last elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array(1000);
      src.$_set(0, 99);
      src.$_set(999, -88);
      const result = Int16Array.from(src);
      let r1: int = result.length;
      let e1: int = 1000;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 99;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(999);
      let e3: int = -88;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_7200
     * @tc.name testInt16ArrayFromTestTwo072
     * @tc.desc Verify Int16Array.from preserves ascending element order from first to last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 2, 3, 4, 5, 6, 7, 8]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(3);
      let e2: int = 4;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(7);
      let e3: int = 8;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_7300
     * @tc.name testInt16ArrayFromTestTwo073
     * @tc.desc Verify Int16Array.from preserves descending element order from first to last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([8, 7, 6, 5, 4, 3, 2, 1]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 8;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(7);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_7400
     * @tc.name testInt16ArrayFromTestTwo074
     * @tc.desc Verify Int16Array.from with source of odd length 3 preserves middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([-5, 0, 5]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(1);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_7500
     * @tc.name testInt16ArrayFromTestTwo075
     * @tc.desc Verify Int16Array.from with source where every element is -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([-1, -1, -1, -1]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(3);
      let e2: int = -1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_7600
     * @tc.name testInt16ArrayFromTestTwo076
     * @tc.desc Verify Int16Array.from with source where every element is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 1, 1, 1]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(3);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_7700
     * @tc.name testInt16ArrayFromTestTwo077
     * @tc.desc Verify Int16Array.from with source where first element is MIN and last element is MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([-32768, 100, 200, 32767]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(3);
      let e2: int = 32767;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_7800
     * @tc.name testInt16ArrayFromTestTwo078
     * @tc.desc Verify Int16Array.from with source containing alternating sign values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([-1, 1, -2, 2, -3, 3]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(4);
      let e3: int = -3;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(5);
      let e4: int = 3;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_7900
     * @tc.name testInt16ArrayFromTestTwo079
     * @tc.desc Verify Int16Array.from with source containing zero at middle positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([5, 0, 5, 0, 5]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(1);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(3);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_8000
     * @tc.name testInt16ArrayFromTestTwo080
     * @tc.desc Verify Int16Array.from with source where last element is MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([0, 0, 0, 32767]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(3);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_8100
     * @tc.name testInt16ArrayFromTestTwo081
     * @tc.desc Verify Int16Array.from with source where last element is MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([0, 0, 0, -32768]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(3);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_8200
     * @tc.name testInt16ArrayFromTestTwo082
     * @tc.desc Verify Int16Array.from with source containing value just below MAX (32766)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([32766]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 32766;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_8300
     * @tc.name testInt16ArrayFromTestTwo083
     * @tc.desc Verify Int16Array.from with source containing value just above MIN (-32767)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([-32767]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_8400
     * @tc.name testInt16ArrayFromTestTwo084
     * @tc.desc Verify Int16Array.from with source of length 2 containing only zero and MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([0, 32767]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 32767;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_8500
     * @tc.name testInt16ArrayFromTestTwo085
     * @tc.desc Verify Int16Array.from with source of length 2 containing only zero and MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([0, -32768]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_8600
     * @tc.name testInt16ArrayFromTestTwo086
     * @tc.desc Verify Int16Array.from result is instanceof Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 2, 3]);
      const result = Int16Array.from(src);
      let r1: boolean = result instanceof Int16Array;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_8700
     * @tc.name testInt16ArrayFromTestTwo087
     * @tc.desc Verify Int16Array.from result length matches source length for multi-element source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([5, 10, 15, 20]);
      const result = Int16Array.from(src);
      let r1: int = result.length;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_TWO_8800
     * @tc.name testInt16ArrayFromTestTwo088
     * @tc.desc Verify Int16Array.from result byteLength equals length multiplied by BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 2, 3]);
      const result = Int16Array.from(src);
      let r1: int = result.byteLength;
      let e1: int = 6;
      expect(r1).assertEqual(e1);
    });
  });
}
