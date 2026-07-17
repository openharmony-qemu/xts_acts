'use static'

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
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int8ArrayConstructorPart08TestTest(): void {
  describe('Int8ArrayConstructorPart08TestTest', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_0100
     * @tc.name int8ArrayConstructorPart08Test001
     * @tc.desc Verify arity 1 Set\<number\> Int8Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.add(3);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_0200
     * @tc.name int8ArrayConstructorPart08Test002
     * @tc.desc Verify Set\<number\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(10);
      s.add(20);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_0300
     * @tc.name int8ArrayConstructorPart08Test003
     * @tc.desc Verify Map\<string, number\>.values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, number> = new Map<string, number>();
      m.set('a', 10);
      m.set('b', 20);
      let arr: Int8Array = new Int8Array(m.values());
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_0400
     * @tc.name int8ArrayConstructorPart08Test004
     * @tc.desc Verify Map\<number, number\>.keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(10, 100);
      m.set(20, 200);
      let arr: Int8Array = new Int8Array(m.keys());
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_0500
     * @tc.name int8ArrayConstructorPart08Test005
     * @tc.desc Verify Set\<number\> length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      let arr: Int8Array = new Int8Array(s);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_0600
     * @tc.name int8ArrayConstructorPart08Test006
     * @tc.desc Verify Set\<number\> length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(42);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_0700
     * @tc.name int8ArrayConstructorPart08Test007
     * @tc.desc Verify Set\<number\> length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(7);
      s.add(8);
      s.add(9);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_0800
     * @tc.name int8ArrayConstructorPart08Test008
     * @tc.desc Verify Set\<number\> 1000 length 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      for (let i: number = 0; i < 1000; i++) {
        s.add(i);
      }
      let arr: Int8Array = new Int8Array(s);
      expect(arr.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_0900
     * @tc.name int8ArrayConstructorPart08Test009
     * @tc.desc Verify Set 128 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(128);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_1000
     * @tc.name int8ArrayConstructorPart08Test010
     * @tc.desc Verify Set -129 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(-129);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_1100
     * @tc.name int8ArrayConstructorPart08Test011
     * @tc.desc Verify Set 255 -1 uint8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(255);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_1200
     * @tc.name int8ArrayConstructorPart08Test012
     * @tc.desc Verify Set 256 0 2^8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(256);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_1300
     * @tc.name int8ArrayConstructorPart08Test013
     * @tc.desc Verify Set -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(-1);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_1400
     * @tc.name int8ArrayConstructorPart08Test014
     * @tc.desc Verify Set 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_1500
     * @tc.name int8ArrayConstructorPart08Test015
     * @tc.desc Verify Set 0.5 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(0.5);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_1600
     * @tc.name int8ArrayConstructorPart08Test016
     * @tc.desc Verify Set 1000 -24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1000);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(-24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_1700
     * @tc.name int8ArrayConstructorPart08Test017
     * @tc.desc Verify Set Number.NaN 0 Number.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(Number.NaN);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_1800
     * @tc.name int8ArrayConstructorPart08Test018
     * @tc.desc Verify Set 1.9 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1.9);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_1900
     * @tc.name int8ArrayConstructorPart08Test019
     * @tc.desc Verify Set -1.9 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(-1.9);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_2000
     * @tc.name int8ArrayConstructorPart08Test020
     * @tc.desc Verify Set -0.0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(-0.0);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_2100
     * @tc.name int8ArrayConstructorPart08Test021
     * @tc.desc Verify Set 127 127 int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(INT8_MAX);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_2200
     * @tc.name int8ArrayConstructorPart08Test022
     * @tc.desc Verify Set -128 -128 int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(-128);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_2300
     * @tc.name int8ArrayConstructorPart08Test023
     * @tc.desc Verify Set 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(0);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_2400
     * @tc.name int8ArrayConstructorPart08Test024
     * @tc.desc Verify Set -0.5 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(-0.5);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_2500
     * @tc.name int8ArrayConstructorPart08Test025
     * @tc.desc Verify Set\<number\> 5 length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(5);
      s.add(5);
      s.add(5);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_2600
     * @tc.name int8ArrayConstructorPart08Test026
     * @tc.desc Verify Set\<number\> 3,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(3);
      s.add(1);
      s.add(2);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_2700
     * @tc.name int8ArrayConstructorPart08Test027
     * @tc.desc Verify Set\<number\> Number.NaN SameValueZero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(Number.NaN);
      s.add(Number.NaN);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_2800
     * @tc.name int8ArrayConstructorPart08Test028
     * @tc.desc Verify $\_set $\_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      let arr: Int8Array = new Int8Array(s);
      arr.$_set(0, 99);
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_2900
     * @tc.name int8ArrayConstructorPart08Test029
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(10);
      s.add(20);
      s.add(30);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.length).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_3000
     * @tc.name int8ArrayConstructorPart08Test030
     * @tc.desc Verify byteOffset 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(10);
      s.add(20);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_3100
     * @tc.name int8ArrayConstructorPart08Test031
     * @tc.desc Verify BYTES_PER_ELEMENT 1 int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(10);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_3200
     * @tc.name int8ArrayConstructorPart08Test032
     * @tc.desc Verify $\_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(42);
      s.add(50);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_3300
     * @tc.name int8ArrayConstructorPart08Test033
     * @tc.desc Verify at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(42);
      s.add(50);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.at(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_3400
     * @tc.name int8ArrayConstructorPart08Test034
     * @tc.desc Verify at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(42);
      s.add(50);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.at(-1)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_3500
     * @tc.name int8ArrayConstructorPart08Test035
     * @tc.desc Verify toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.add(3);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_3600
     * @tc.name int8ArrayConstructorPart08Test036
     * @tc.desc Verify toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      let arr: Int8Array = new Int8Array(s);
      expect(arr.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_3700
     * @tc.name int8ArrayConstructorPart08Test037
     * @tc.desc Verify values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.add(3);
      let arr: Int8Array = new Int8Array(s);
      let sum: number = 0;
      for (let v of arr.values()) {
        sum = sum + v;
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_3800
     * @tc.name int8ArrayConstructorPart08Test038
     * @tc.desc Verify entries() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.add(3);
      let arr: Int8Array = new Int8Array(s);
      let count: number = 0;
      for (const entry of arr.entries()) {
        count = count + 1;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_3900
     * @tc.name int8ArrayConstructorPart08Test039
     * @tc.desc Verify keys() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(10);
      s.add(20);
      let arr: Int8Array = new Int8Array(s);
      let firstKey: number = -1;
      for (const key of arr.keys()) {
        firstKey = key;
        break;
      }
      expect(firstKey).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_4000
     * @tc.name int8ArrayConstructorPart08Test040
     * @tc.desc Verify indexOf 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(7);
      s.add(8);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.indexOf(7)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_4100
     * @tc.name int8ArrayConstructorPart08Test041
     * @tc.desc Verify Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      let arr: Int8Array = new Int8Array(s);
      arr.$_set(0, 99);
      expect(s.has(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_4200
     * @tc.name int8ArrayConstructorPart08Test042
     * @tc.desc Verify arr1 arr2 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      let arr1: Int8Array = new Int8Array(s);
      let arr2: Int8Array = new Int8Array(s);
      arr1.$_set(0, 99);
      expect(arr2.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_4300
     * @tc.name int8ArrayConstructorPart08Test043
     * @tc.desc Verify arr2 arr1 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      let arr1: Int8Array = new Int8Array(s);
      let arr2: Int8Array = new Int8Array(s);
      arr2.$_set(1, 88);
      expect(arr1.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_4400
     * @tc.name int8ArrayConstructorPart08Test044
     * @tc.desc Verify Set add length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      let arr: Int8Array = new Int8Array(s);
      s.add(3);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_4500
     * @tc.name int8ArrayConstructorPart08Test045
     * @tc.desc Verify Map\<string, number\>.values() length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, number> = new Map<string, number>();
      let arr: Int8Array = new Int8Array(m.values());
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_4600
     * @tc.name int8ArrayConstructorPart08Test046
     * @tc.desc Verify Map\<string, number\>.values() length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, number> = new Map<string, number>();
      m.set('x', 42);
      let arr: Int8Array = new Int8Array(m.values());
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_4700
     * @tc.name int8ArrayConstructorPart08Test047
     * @tc.desc Verify Map\<string, number\>.values() 200 -56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, number> = new Map<string, number>();
      m.set('x', 200);
      let arr: Int8Array = new Int8Array(m.values());
      expect(arr.$_get(0)).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_4800
     * @tc.name int8ArrayConstructorPart08Test048
     * @tc.desc Verify Map\<string, number\>.values() Number.NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, number> = new Map<string, number>();
      m.set('x', Number.NaN);
      let arr: Int8Array = new Int8Array(m.values());
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_4900
     * @tc.name int8ArrayConstructorPart08Test049
     * @tc.desc Verify Map\<string, number\>.values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, number> = new Map<string, number>();
      m.set('a', 10);
      m.set('b', 20);
      m.set('c', 30);
      let arr: Int8Array = new Int8Array(m.values());
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_5000
     * @tc.name int8ArrayConstructorPart08Test050
     * @tc.desc Verify Map\<number, number\>.keys() length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      let arr: Int8Array = new Int8Array(m.keys());
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_5100
     * @tc.name int8ArrayConstructorPart08Test051
     * @tc.desc Verify Map\<number, number\>.keys() 300 44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(300, 1);
      let arr: Int8Array = new Int8Array(m.keys());
      expect(arr.$_get(0)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_5200
     * @tc.name int8ArrayConstructorPart08Test052
     * @tc.desc Verify Map\<number, number\>.keys() 127 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(INT8_MAX, 1);
      let arr: Int8Array = new Int8Array(m.keys());
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_5300
     * @tc.name int8ArrayConstructorPart08Test053
     * @tc.desc Verify Map\<number, number\>.keys() -128 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(-128, 1);
      let arr: Int8Array = new Int8Array(m.keys());
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_5400
     * @tc.name int8ArrayConstructorPart08Test054
     * @tc.desc Verify Set [127, -128, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(INT8_MAX);
      s.add(-128);
      s.add(0);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
      expect(arr.$_get(1)).assertEqual(-128);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_5500
     * @tc.name int8ArrayConstructorPart08Test055
     * @tc.desc Verify Set [128, 255, 256] [-128, -1, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(128);
      s.add(255);
      s.add(256);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_5600
     * @tc.name int8ArrayConstructorPart08Test056
     * @tc.desc Verify Set [1.9, -1.9, 0.5] [1, -1, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1.9);
      s.add(-1.9);
      s.add(0.5);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_5700
     * @tc.name int8ArrayConstructorPart08Test057
     * @tc.desc Verify Set\<int\> 100 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(100);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(100);
    });




    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_5800
     * @tc.name int8ArrayConstructorPart08Test058
     * @tc.desc Verify toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.add(3);
      let arr: Int8Array = new Int8Array(s);
      let reversed: Int8Array = arr.toReversed();
      expect(arr.$_get(0)).assertEqual(1);
      expect(reversed.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_5900
     * @tc.name int8ArrayConstructorPart08Test059
     * @tc.desc Verify with(0, val)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.add(3);
      let arr: Int8Array = new Int8Array(s);
      let modified: Int8Array = arr.with(0, 99);
      expect(arr.$_get(0)).assertEqual(1);
      expect(modified.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_6000
     * @tc.name int8ArrayConstructorPart08Test060
     * @tc.desc Verify Set [129, 130, 127] [-127, -126, 127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(129);
      s.add(130);
      s.add(INT8_MAX);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(-INT8_MAX);
      expect(arr.$_get(1)).assertEqual(-126);
      expect(arr.$_get(2)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_6100
     * @tc.name int8ArrayConstructorPart08Test061
     * @tc.desc Verify Set [200, -200] [-56, 56]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(200);
      s.add(-200);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(-56);
      expect(arr.$_get(1)).assertEqual(56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_6200
     * @tc.name int8ArrayConstructorPart08Test062
     * @tc.desc Verify Set [128, -128] [-128, -128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(128);
      s.add(-128);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(1)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_6300
     * @tc.name int8ArrayConstructorPart08Test063
     * @tc.desc Verify Map.values() Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, number> = new Map<string, number>();
      m.set('a', 1);
      m.set('b', 2);
      let arr: Int8Array = new Int8Array(m.values());
      arr.$_set(0, 99);
      expect(m.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_6400
     * @tc.name int8ArrayConstructorPart08Test064
     * @tc.desc Verify Map.values() Map key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, number> = new Map<string, number>();
      m.set('a', 1);
      m.set('b', 2);
      let arr: Int8Array = new Int8Array(m.values());
      m.set('a', 99);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_6500
     * @tc.name int8ArrayConstructorPart08Test065
     * @tc.desc Verify toLocaleString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      let arr: Int8Array = new Int8Array(s);
      expect(arr.toLocaleString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_6600
     * @tc.name int8ArrayConstructorPart08Test066
     * @tc.desc Verify every true vacuous truth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      let arr: Int8Array = new Int8Array(s);
      expect(arr.every((v: number) => v > 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_6700
     * @tc.name int8ArrayConstructorPart08Test067
     * @tc.desc Verify some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      let arr: Int8Array = new Int8Array(s);
      expect(arr.some((v: number) => v > 0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_6800
     * @tc.name int8ArrayConstructorPart08Test068
     * @tc.desc Verify every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.add(3);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.every((v: number) => v > 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_6900
     * @tc.name int8ArrayConstructorPart08Test069
     * @tc.desc Verify some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.add(3);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.some((v: number) => v > 100)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_7000
     * @tc.name int8ArrayConstructorPart08Test070
     * @tc.desc Verify indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.indexOf(99)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_7100
     * @tc.name int8ArrayConstructorPart08Test071
     * @tc.desc Verify Set -300 -44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(-300);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(-44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART08_TEST_7200
     * @tc.name int8ArrayConstructorPart08Test072
     * @tc.desc Verify Set 64 64 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart08Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(64);
      let arr: Int8Array = new Int8Array(s);
      expect(arr.$_get(0)).assertEqual(64);
    });

  });
}
