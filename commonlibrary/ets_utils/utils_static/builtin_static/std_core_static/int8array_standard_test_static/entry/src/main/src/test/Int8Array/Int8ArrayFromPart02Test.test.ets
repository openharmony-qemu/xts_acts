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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int8ArrayFromPart02Test(): void {
  describe('Int8ArrayFromPart02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_0100
     * @tc.name int8ArrayFromPart02Test001
     * @tc.desc Verify Int8Array.from(s) arity=1 Set<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(42);
      let arr: Int8Array = Int8Array.from(s);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_0200
     * @tc.name int8ArrayFromPart02Test002
     * @tc.desc Verify Int8Array.from(empty Set) returns length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      let arr: Int8Array = Int8Array.from(s);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_0300
     * @tc.name int8ArrayFromPart02Test003
     * @tc.desc Verify Int8Array.from(s) Set {0}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(0);
      let arr: Int8Array = Int8Array.from(s);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_0400
     * @tc.name int8ArrayFromPart02Test004
     * @tc.desc Verify Int8Array.from(s) Set {127}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(INT8_MAX);
      let arr: Int8Array = Int8Array.from(s);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_0500
     * @tc.name int8ArrayFromPart02Test005
     * @tc.desc Verify Int8Array.from(s) Set {-128}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(INT8_MIN);
      let arr: Int8Array = Int8Array.from(s);
      expect(arr.length).assertEqual(1);
      let r1: number = arr[0];
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_0600
     * @tc.name int8ArrayFromPart02Test006
     * @tc.desc Verify Int8Array.from(s) Set {1,-1,2,-2}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      s.add(-1);
      s.add(2);
      s.add(-2);
      let arr: Int8Array = Int8Array.from(s);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(-1);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_0700
     * @tc.name int8ArrayFromPart02Test007
     * @tc.desc Verify Int8Array.from(s) Set {5,5,5}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(5);
      s.add(5);
      s.add(5);
      let arr: Int8Array = Int8Array.from(s);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_0800
     * @tc.name int8ArrayFromPart02Test008
     * @tc.desc Verify Int8Array.from(s) Set {128} overflow to INT8_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(128);
      let arr: Int8Array = Int8Array.from(s);
      expect(arr.length).assertEqual(1);
      let r1: number = arr[0];
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_0900
     * @tc.name int8ArrayFromPart02Test009
     * @tc.desc Verify Int8Array.from(s) Set -129
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(-129);
      let arr: Int8Array = Int8Array.from(s);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_1000
     * @tc.name int8ArrayFromPart02Test010
     * @tc.desc Verify Int8Array.from(Set with 255) clamps to -1, length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(255);
      let arr: Int8Array = Int8Array.from(s);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_1100
     * @tc.name int8ArrayFromPart02Test011
     * @tc.desc Verify Int8Array.from(Set with 256) clamps to 0, length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(256);
      let arr: Int8Array = Int8Array.from(s);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_1200
     * @tc.name int8ArrayFromPart02Test012
     * @tc.desc Verify Int8Array.from(Set with 2147483647) clamps to -1, length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(2147483647);
      let arr: Int8Array = Int8Array.from(s);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_1300
     * @tc.name int8ArrayFromPart02Test013
     * @tc.desc Verify Int8Array.from(s) Set -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(-2147483648);
      let arr: Int8Array = Int8Array.from(s);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_1400
     * @tc.name int8ArrayFromPart02Test014
     * @tc.desc Verify Int8Array.from(s) Set {3,1,2}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(3);
      s.add(1);
      s.add(2);
      let arr: Int8Array = Int8Array.from(s);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_1500
     * @tc.name int8ArrayFromPart02Test015
     * @tc.desc Verify Int8Array.from(s) Set {1,2,1,3,2}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      s.add(2);
      s.add(1);
      s.add(3);
      s.add(2);
      let arr: Int8Array = Int8Array.from(s);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_1600
     * @tc.name int8ArrayFromPart02Test016
     * @tc.desc Verify Int8Array.from(s) Set {-128,0,127}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(INT8_MIN);
      s.add(0);
      s.add(INT8_MAX);
      let arr: Int8Array = Int8Array.from(s);
      expect(arr.length).assertEqual(3);
      let r1: number = arr[0];
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_1700
     * @tc.name int8ArrayFromPart02Test017
     * @tc.desc Verify Int8Array.from(Set of 100) returns length 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      for (let i: int = 0; i < 100; i = i + 1) {
        s.add(i);
      }
      let arr: Int8Array = Int8Array.from(s);
      expect(arr.length).assertEqual(100);
      expect(arr[0]).assertEqual(0);
      expect(arr[99]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_1800
     * @tc.name int8ArrayFromPart02Test018
     * @tc.desc Verify Int8Array.from(s) length equals Set.size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      s.add(2);
      let arr: Int8Array = Int8Array.from(s);
      let r1: int = arr.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: int = arr.byteOffset;
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_1900
     * @tc.name int8ArrayFromPart02Test019
     * @tc.desc Verify Int8Array.from(s) length Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(10);
      s.add(20);
      s.add(30);
      let arr: Int8Array = Int8Array.from(s);
      expect(arr.length).assertEqual(3);
      expect(arr.at(-1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_2000
     * @tc.name int8ArrayFromPart02Test020
     * @tc.desc Verify Int8Array.from results are independent copies - modifying arr1 does not affect arr2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      s.add(2);
      let arr1: Int8Array = Int8Array.from(s);
      let arr2: Int8Array = Int8Array.from(s);
      arr1[0] = 99;
      expect(arr2[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_2100
     * @tc.name int8ArrayFromPart02Test021
     * @tc.desc Verify Int8Array.from(s) byteLength behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      s.add(2);
      s.add(3);
      s.add(4);
      let arr: Int8Array = Int8Array.from(s);
      let r1: int = arr.byteLength;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_2200
     * @tc.name int8ArrayFromPart02Test022
     * @tc.desc Verify Int8Array.from(s) BYTES_PER_ELEMENT behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      let arr: Int8Array = Int8Array.from(s);
      let r1: int = arr.BYTES_PER_ELEMENT;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_2300
     * @tc.name int8ArrayFromPart02Test023
     * @tc.desc Verify Int8Array.from(s) toString() behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      s.add(2);
      s.add(3);
      let arr: Int8Array = Int8Array.from(s);
      let r1: string = arr.toString();
      let e1: string = '1,2,3';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_2400
     * @tc.name int8ArrayFromPart02Test024
     * @tc.desc Verify Int8Array.from(s) {128,-129,255} [-128,127,-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(128);
      s.add(-129);
      s.add(255);
      let arr: Int8Array = Int8Array.from(s);
      let r1: int = arr.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = arr[0];
      let e2: number = INT8_MIN;
      expect(r2).assertEqual(e2);
      let r3: number = arr[1];
      let e3: number = INT8_MAX;
      expect(r3).assertEqual(e3);
      let r4: number = arr[2];
      let e4: int = -1;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_2500
     * @tc.name int8ArrayFromPart02Test025
     * @tc.desc Verify Int8Array.from(src) arity=1 Iterable<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [10, 20, 30];
      let arr: Int8Array = Int8Array.from(src);
      let r1: int = arr.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = arr[0];
      let e2: int = 10;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_2600
     * @tc.name int8ArrayFromPart02Test026
     * @tc.desc Verify Int8Array.from arity=2 Iterable<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        return v;
      });
      expect(arr.length).assertEqual(3);
      let r1: number = arr[0];
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_2700
     * @tc.name int8ArrayFromPart02Test027
     * @tc.desc Verify Int8Array.from(src) TypedArray Iterable<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let srcTyped: Int8Array = new Int8Array([5, 10, 15]);
      let src: Iterable<number> = srcTyped;
      let arr: Int8Array = Int8Array.from(src);
      expect(arr.length).assertEqual(3);
      let r1: number = arr[0];
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = arr[1];
      let e2: int = 10;
      expect(r2).assertEqual(e2);
      let r3: number = arr[2];
      let e3: int = 15;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_2800
     * @tc.name int8ArrayFromPart02Test028
     * @tc.desc Verify Int8Array.from(src) Array<number> Iterable<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [7, 8, 9];
      let arr: Int8Array = Int8Array.from(src);
      expect(arr.length).assertEqual(3);
      let r1: number = arr[0];
      let e1: int = 7;
      expect(r1).assertEqual(e1);
      let r2: number = arr[1];
      let e2: int = 8;
      expect(r2).assertEqual(e2);
      let r3: number = arr[2];
      let e3: int = 9;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_2900
     * @tc.name int8ArrayFromPart02Test029
     * @tc.desc Verify Int8Array.from(empty Array source) returns length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [];
      let arr: Int8Array = Int8Array.from(src);
      let r1: int = arr.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_3000
     * @tc.name int8ArrayFromPart02Test030
     * @tc.desc Verify Int8Array.from(src) Iterable [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [42];
      let arr: Int8Array = Int8Array.from(src);
      let r1: int = arr.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr[0];
      let e2: int = 42;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_3100
     * @tc.name int8ArrayFromPart02Test031
     * @tc.desc Verify Int8Array.from(Array source [1,-1,2,-2]) returns length 4 with elements preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, -1, 2, -2];
      let arr: Int8Array = Int8Array.from(src);
      let r1: int = arr.length;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = arr[0];
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = arr[1];
      let e3: int = -1;
      expect(r3).assertEqual(e3);
      let r4: number = arr[2];
      let e4: int = 2;
      expect(r4).assertEqual(e4);
      let r5: number = arr[3];
      let e5: int = -2;
      expect(r5).assertEqual(e5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_3200
     * @tc.name int8ArrayFromPart02Test032
     * @tc.desc Verify Int8Array.from(Array source [INT8_MIN]) preserves -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [INT8_MIN];
      let arr: Int8Array = Int8Array.from(src);
      let r1: number = arr[0];
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_3300
     * @tc.name int8ArrayFromPart02Test033
     * @tc.desc Verify Int8Array.from expects INT8_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [INT8_MAX];
      let arr: Int8Array = Int8Array.from(src);
      let r1: number = arr[0];
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_3400
     * @tc.name int8ArrayFromPart02Test034
     * @tc.desc Verify Int8Array.from clamps source 128 to -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [128];
      let arr: Int8Array = Int8Array.from(src);
      let r1: number = arr[0];
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_3500
     * @tc.name int8ArrayFromPart02Test035
     * @tc.desc Verify Int8Array.from(src) Iterable -129
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [-129];
      let arr: Int8Array = Int8Array.from(src);
      expect(arr[0]).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_3600
     * @tc.name int8ArrayFromPart02Test036
     * @tc.desc Verify Int8Array.from(src) Iterable -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [255];
      let arr: Int8Array = Int8Array.from(src);
      let r1: number = arr[0];
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_3700
     * @tc.name int8ArrayFromPart02Test037
     * @tc.desc Verify Int8Array.from clamps source 256 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [256];
      let arr: Int8Array = Int8Array.from(src);
      let r1: number = arr[0];
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_3800
     * @tc.name int8ArrayFromPart02Test038
     * @tc.desc Verify Int8Array.from(src) Iterable Number.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [Number.NaN];
      let arr: Int8Array = Int8Array.from(src);
      let r1: number = arr[0];
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_3900
     * @tc.name int8ArrayFromPart02Test039
     * @tc.desc Verify Int8Array.from(src) Iterable 1.9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1.9];
      let arr: Int8Array = Int8Array.from(src);
      let r1: number = arr[0];
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_4000
     * @tc.name int8ArrayFromPart02Test040
     * @tc.desc Verify Int8Array.from(src) Iterable -1.9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [-1.9];
      let arr: Int8Array = Int8Array.from(src);
      let r1: number = arr[0];
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_4100
     * @tc.name int8ArrayFromPart02Test041
     * @tc.desc Verify Int8Array.from(src) Iterable 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [0.0];
      let arr: Int8Array = Int8Array.from(src);
      let r1: number = arr[0];
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_4200
     * @tc.name int8ArrayFromPart02Test042
     * @tc.desc Verify Int8Array.from chaining: TypedArray as Iterable source for second from call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src1: Iterable<number> = [1, 2, 3];
      let arr1: Int8Array = Int8Array.from(src1);
      let src2: Iterable<number> = arr1;
      let arr2: Int8Array = Int8Array.from(src2);
      expect(arr2.length).assertEqual(3);
      expect(arr2[0]).assertEqual(1);
      expect(arr2[1]).assertEqual(2);
      expect(arr2[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_4300
     * @tc.name int8ArrayFromPart02Test043
     * @tc.desc Verify Int8Array.from(Array of 100) returns length 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let srcArr: Array<number> = [];
      for (let i: number = 0; i < 100; i = i + 1) {
        srcArr.push(i);
      }
      let src: Iterable<number> = srcArr;
      let arr: Int8Array = Int8Array.from(src);
      expect(arr.length).assertEqual(100);
      expect(arr[0]).assertEqual(0);
      expect(arr[99]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_4400
     * @tc.name int8ArrayFromPart02Test044
     * @tc.desc Verify Int8Array.from with constant mapfn returning 5 yields length 3 all elements 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        return 5;
      });
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_4500
     * @tc.name int8ArrayFromPart02Test045
     * @tc.desc Verify Int8Array.from mapfn v*2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [10, 20, 30];
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        return v * 2;
      });
      expect(arr[0]).assertEqual(20);
      expect(arr[1]).assertEqual(40);
      expect(arr[2]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_4600
     * @tc.name int8ArrayFromPart02Test046
     * @tc.desc Verify Int8Array.from mapfn v-k
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [10, 20, 30];
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        return v - k;
      });
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(19);
      expect(arr[2]).assertEqual(28);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_4700
     * @tc.name int8ArrayFromPart02Test047
     * @tc.desc Verify Int8Array.from with mapFn returning INT8_MAX expects INT8_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        return INT8_MAX;
      });
      expect(arr[0]).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_4800
     * @tc.name int8ArrayFromPart02Test048
     * @tc.desc Verify Int8Array.from expects -128 when INT8_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        return INT8_MIN;
      });
      let r1: number = arr[0];
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_4900
     * @tc.name int8ArrayFromPart02Test049
     * @tc.desc Verify Int8Array.from expects -128 when 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        return 128;
      });
      let r1: number = arr[0];
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_5000
     * @tc.name int8ArrayFromPart02Test050
     * @tc.desc Verify Int8Array.from mapfn -129
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        return -129;
      });
      expect(arr[0]).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_5100
     * @tc.name int8ArrayFromPart02Test051
     * @tc.desc Verify Int8Array.from mapfn -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        return 255;
      });
      expect(arr[0]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_5200
     * @tc.name int8ArrayFromPart02Test052
     * @tc.desc Verify Int8Array.from mapfn Number.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        return Number.NaN;
      });
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_5300
     * @tc.name int8ArrayFromPart02Test053
     * @tc.desc Verify Int8Array.from mapfn 1.9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        return 1.9;
      });
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_5400
     * @tc.name int8ArrayFromPart02Test054
     * @tc.desc Verify Int8Array.from mapfn -1.9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        return -1.9;
      });
      expect(arr[0]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_5500
     * @tc.name int8ArrayFromPart02Test055
     * @tc.desc Verify Int8Array.from with mapFn returning 0 expects 0 for all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        return 0;
      });
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_5600
     * @tc.name int8ArrayFromPart02Test056
     * @tc.desc Verify Int8Array.from mapfn returns index k: expects [0,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [5, 5, 5];
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        return k;
      });
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_5700
     * @tc.name int8ArrayFromPart02Test057
     * @tc.desc Verify Int8Array.from mapfn v+k
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3, 4];
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        return v + k;
      });
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertEqual(5);
      expect(arr[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_5800
     * @tc.name int8ArrayFromPart02Test058
     * @tc.desc Verify Int8Array.from expects 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      let factor: number = 10;
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        return v * factor;
      });
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_5900
     * @tc.name int8ArrayFromPart02Test059
     * @tc.desc Verify Int8Array.from expects 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      let sum: number = 0;
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        sum = sum + v;
        return v;
      });
      expect(sum).assertEqual(6);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_6000
     * @tc.name int8ArrayFromPart02Test060
     * @tc.desc Verify Int8Array.from expects 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      let doubleFn: (x: number) => number = (x: number) => {
        return x * 2;
      };
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        return doubleFn(v);
      });
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_6100
     * @tc.name int8ArrayFromPart02Test061
     * @tc.desc Verify Int8Array.from expects 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3, 4];
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        if (k % 2 === 0) {
          return v;
        }
        return 0;
      });
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_6200
     * @tc.name int8ArrayFromPart02Test062
     * @tc.desc Verify Int8Array.from(src) length equals source array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      let arr: Int8Array = Int8Array.from(src);
      let r1: int = arr.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_6300
     * @tc.name int8ArrayFromPart02Test063
     * @tc.desc Verify Int8Array.from mapfn length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [10, 20, 30, 40];
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        return v;
      });
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_6400
     * @tc.name int8ArrayFromPart02Test064
     * @tc.desc Verify Int8Array.from result mutation arr[0] = 99 does not affect source typed array element 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let srcTyped: Int8Array = new Int8Array([1, 2, 3]);
      let src: Iterable<number> = srcTyped;
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        return v;
      });
      arr[0] = 99;
      expect(srcTyped[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_6500
     * @tc.name int8ArrayFromPart02Test065
     * @tc.desc Verify Int8Array.from mapfn byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        return v;
      });
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_6600
     * @tc.name int8ArrayFromPart02Test066
     * @tc.desc Verify Int8Array.from mapfn byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3, 4, 5];
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        return v;
      });
      expect(arr.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_6700
     * @tc.name int8ArrayFromPart02Test067
     * @tc.desc Verify Int8Array.from mapfn BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        return v;
      });
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_6800
     * @tc.name int8ArrayFromPart02Test068
     * @tc.desc Verify Int8Array.from propagates mapfn-thrown Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      try {
        Int8Array.from<number>(src, (v: number, k: number) => {
          throw new Error('generic error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('generic error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_6900
     * @tc.name int8ArrayFromPart02Test069
     * @tc.desc Verify Int8Array.from propagates mapfn-thrown RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      try {
        Int8Array.from<number>(src, (v: number, k: number) => {
          throw new RangeError('range error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(e.message).assertEqual('range error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_7000
     * @tc.name int8ArrayFromPart02Test070
     * @tc.desc Verify Int8Array.from propagates mapfn-thrown TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      try {
        Int8Array.from<number>(src, (_v: number, _k: number) => {
          throw new TypeError('type error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(e.message).assertEqual('type error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_7100
     * @tc.name int8ArrayFromPart02Test071
     * @tc.desc Verify Int8Array.from mapfn throwing RangeError at second element propagates exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      try {
        Int8Array.from<number>(src, (v: number, k: number) => {
          if (k === 1) {
            throw new RangeError('second error');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(e.message).assertEqual('second error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_7200
     * @tc.name int8ArrayFromPart02Test072
     * @tc.desc Verify Int8Array.from Iterable mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [];
      let called: boolean = false;
      let arr: Int8Array = Int8Array.from<number>(src, (v: number, k: number) => {
        called = true;
        return v;
      });
      expect(arr.length).assertEqual(0);
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_7300
     * @tc.name int8ArrayFromPart02Test073
     * @tc.desc Verify Int8Array.from(src) Iterable Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [Number.POSITIVE_INFINITY];
      let arr: Int8Array = Int8Array.from(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_7400
     * @tc.name int8ArrayFromPart02Test074
     * @tc.desc Verify Int8Array.from(src) Iterable Number.NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [Number.NEGATIVE_INFINITY];
      let arr: Int8Array = Int8Array.from(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_7500
     * @tc.name int8ArrayFromPart02Test075
     * @tc.desc Verify Int8Array.from(src) Iterable 1e300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1e300];
      let arr: Int8Array = Int8Array.from(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART02_TEST_7600
     * @tc.name int8ArrayFromPart02Test076
     * @tc.desc Verify Int8Array.from mapfn Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart02Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      let arr: Int8Array = Int8Array.from<number>(src, (_v: number, _k: number) => {
        return Number.POSITIVE_INFINITY;
      });
      expect(arr[0]).assertEqual(0);
    });
  });
}
