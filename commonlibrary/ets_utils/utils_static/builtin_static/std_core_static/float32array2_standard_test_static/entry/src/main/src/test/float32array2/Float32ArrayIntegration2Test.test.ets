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
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Float32ArrayIntegration2Test(): void {
  describe('Float32ArrayIntegration2Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(45);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_0100
     * @tc.name testFloat32ArrayIntegrationTwo001
     * @tc.desc Verify constructor(3) creates array with length 3 and first element 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_0200
     * @tc.name testFloat32ArrayIntegrationTwo002
     * @tc.desc Verify constructor([1.0,2.0,3.0]) creates array with length 3 and last element 3.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_0300
     * @tc.name testFloat32ArrayIntegrationTwo003
     * @tc.desc Verify Float32Array.of creates array with length 3 and middle element 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_0400
     * @tc.name testFloat32ArrayIntegrationTwo004
     * @tc.desc Verify created array has length 2 and byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_0500
     * @tc.name testFloat32ArrayIntegrationTwo005
     * @tc.desc Verify buffer byteLength is 16 and length is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      expect(arr.buffer.byteLength).assertEqual(16);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_0600
     * @tc.name testFloat32ArrayIntegrationTwo006
     * @tc.desc Verify $_get(0) returns first element 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5, 2.5]);
      const v = arr.$_get(0);
      expect(v).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_0700
     * @tc.name testFloat32ArrayIntegrationTwo007
     * @tc.desc Verify at(2) on length-2 array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const v = arr.at(5);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_0800
     * @tc.name testFloat32ArrayIntegrationTwo008
     * @tc.desc Verify at(0) returns first element 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const v = arr.at(0);
      expect(v).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_0900
     * @tc.name testFloat32ArrayIntegrationTwo009
     * @tc.desc Verify with creates new array with length 2, updates element at index 0, original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const r = arr.with(0, 9.0);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(9.0);
      expect(arr.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_1000
     * @tc.name testFloat32ArrayIntegrationTwo010
     * @tc.desc Verify $_set(0, 5.0) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const r = arr.$_set(0, 5.0);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_1100
     * @tc.name testFloat32ArrayIntegrationTwo011
     * @tc.desc Verify entries() yields [0, 1.0] pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const iter = arr.entries();
      const n = iter.next();
      const entry = n.value!;
      expect(entry[0]).assertEqual(0);
      expect(entry[1]).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_1200
     * @tc.name testFloat32ArrayIntegrationTwo012
     * @tc.desc Verify keys() yields index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const iter = arr.keys();
      const n = iter.next();
      expect(n.value!).assertEqual(0);
      expect(n.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_1300
     * @tc.name testFloat32ArrayIntegrationTwo013
     * @tc.desc Verify values() yields first element 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const iter = arr.values();
      const n = iter.next();
      expect(n.value!).assertEqual(1.0);
      expect(n.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_1400
     * @tc.name testFloat32ArrayIntegrationTwo014
     * @tc.desc Verify includes(1.0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const r = arr.includes(1.0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_1500
     * @tc.name testFloat32ArrayIntegrationTwo015
     * @tc.desc Verify indexOf(2.0) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const r = arr.indexOf(2.0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_1600
     * @tc.name testFloat32ArrayIntegrationTwo016
     * @tc.desc Verify find(v>1) returns 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const r = arr.find((v: number, index: int, array: Float32Array): boolean => v > 1);
      expect(r).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_1700
     * @tc.name testFloat32ArrayIntegrationTwo017
     * @tc.desc Verify findIndex(v>1) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const r = arr.findIndex((v: number, index: int, array: Float32Array): boolean => v > 1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_1800
     * @tc.name testFloat32ArrayIntegrationTwo018
     * @tc.desc Verify some(v>1) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const r = arr.some((v: number, index: int, array: Float32Array): boolean => v > 1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_1900
     * @tc.name testFloat32ArrayIntegrationTwo019
     * @tc.desc Verify every(v>0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const r = arr.every((v: number, index: int, array: Float32Array): boolean => v > 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_2000
     * @tc.name testFloat32ArrayIntegrationTwo020
     * @tc.desc Verify forEach() returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      let callbackCount = 0;
      let valueSum = 0.0;
      let lastIndex: int = -1;
      let receivedSource = true;
      const r = arr.forEach((v: number, index: int, array: Float32Array): void => {
        callbackCount = callbackCount + 1;
        valueSum = valueSum + v;
        lastIndex = index;
        receivedSource = receivedSource && array === arr;
      });
      expect(r).assertUndefined();
      expect(callbackCount).assertEqual(2);
      expect(valueSum).assertEqual(3.0);
      expect(lastIndex).assertEqual(1);
      expect(receivedSource).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_2100
     * @tc.name testFloat32ArrayIntegrationTwo021
     * @tc.desc Verify slice(0,2) creates array with length 2 and elements 1.0,2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.slice(0, 2);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(1.0);
      expect(r.$_get(1)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_2200
     * @tc.name testFloat32ArrayIntegrationTwo022
     * @tc.desc Verify subarray(0,2) creates array with length 2, first element 1.0, shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.subarray(0, 2);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(1.0);
      expect(r.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_2300
     * @tc.name testFloat32ArrayIntegrationTwo023
     * @tc.desc Verify map(v=>v*2) creates array with length 2 and elements 2.0,4.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const r = arr.map((v: number, index: int, array: Float32Array): number => v * 2);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(2.0);
      expect(r.$_get(1)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_2400
     * @tc.name testFloat32ArrayIntegrationTwo024
     * @tc.desc Verify filter(v=>v>1) creates array with length 2 and elements 2.0,3.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.filter((v: number, index: int, array: Float32Array): boolean => v > 1);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(2.0);
      expect(r.$_get(1)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_2500
     * @tc.name testFloat32ArrayIntegrationTwo025
     * @tc.desc Verify reverse modifies array in place, first element becomes 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const r = arr.reverse();
      expect(r.$_get(0)).assertEqual(2.0);
      expect(arr.$_get(0)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_2600
     * @tc.name testFloat32ArrayIntegrationTwo026
     * @tc.desc Verify toReversed creates array with length 2 and reversed elements, original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const r = arr.toReversed();
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(2.0);
      expect(arr.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_2700
     * @tc.name testFloat32ArrayIntegrationTwo027
     * @tc.desc Verify sort sorts array in place, first element becomes 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 2.0]);
      const r = arr.sort();
      expect(r.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_2800
     * @tc.name testFloat32ArrayIntegrationTwo028
     * @tc.desc Verify toSorted creates sorted array with first element 1.0, last element 3.0, original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 2.0]);
      const r = arr.toSorted();
      expect(r.$_get(0)).assertEqual(1.0);
      expect(r.$_get(2)).assertEqual(3.0);
      expect(arr.$_get(0)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_2900
     * @tc.name testFloat32ArrayIntegrationTwo029
     * @tc.desc Verify join(",") returns "1,2"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const r = arr.join(',');
      expect(r).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_3000
     * @tc.name testFloat32ArrayIntegrationTwo030
     * @tc.desc Verify toLocaleString() returns "1,2"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const r = arr.toLocaleString();
      expect(r).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_3100
     * @tc.name testFloat32ArrayIntegrationTwo031
     * @tc.desc Verify valueOf returns the same array reference (mutating r affects arr)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const r = arr.valueOf();
      r.$_set(0, 9.0);
      expect(arr.$_get(0)).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_3200
     * @tc.name testFloat32ArrayIntegrationTwo032
     * @tc.desc Verify BYTES_PER_ELEMENT is 4 on FixedArray-constructed Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_3300
     * @tc.name testFloat32ArrayIntegrationTwo033
     * @tc.desc Verify $_get(0) returns first element 10.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0]);
      const element038 = arr.$_get(0);
      expect(element038).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_3400
     * @tc.name testFloat32ArrayIntegrationTwo034
     * @tc.desc Verify $_get(1) returns second element 20.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0]);
      const element039 = arr.$_get(1);
      expect(element039).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_3500
     * @tc.name testFloat32ArrayIntegrationTwo035
     * @tc.desc Verify $_set(0, 99.0) then $_get(0) returns 99.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      arr.$_set(0, 99.0);
      const element040 = arr.$_get(0);
      expect(element040).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_3600
     * @tc.name testFloat32ArrayIntegrationTwo036
     * @tc.desc Verify at(1) returns middle element 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const atValue041 = arr.at(1);
      expect(atValue041).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_3700
     * @tc.name testFloat32ArrayIntegrationTwo037
     * @tc.desc Verify at(5) on length-1 array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const atValue043 = arr.at(2);
      expect(atValue043).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_3800
     * @tc.name testFloat32ArrayIntegrationTwo038
     * @tc.desc Verify with(1, 9.0) updates element at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.with(1, 9.0);
      const element044 = r.$_get(1);
      expect(element044).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_3900
     * @tc.name testFloat32ArrayIntegrationTwo039
     * @tc.desc Verify includes(2.0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const predicateResult045 = arr.includes(2.0);
      expect(predicateResult045).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_4000
     * @tc.name testFloat32ArrayIntegrationTwo040
     * @tc.desc Verify includes(5.0) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const predicateResult046 = arr.includes(5.0);
      expect(predicateResult046).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_4100
     * @tc.name testFloat32ArrayIntegrationTwo041
     * @tc.desc Verify indexOf(9.0) on array without 9 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const indexValue048 = arr.indexOf(9.0);
      expect(indexValue048).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_4200
     * @tc.name testFloat32ArrayIntegrationTwo042
     * @tc.desc Verify lastIndexOf(2.0) on [1,2,2] returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 2.0]);
      const lastIndexValue049 = arr.lastIndexOf(2.0);
      expect(lastIndexValue049).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_4300
     * @tc.name testFloat32ArrayIntegrationTwo043
     * @tc.desc Verify lastIndexOf(9.0) on array without 9 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const lastIndexValue050 = arr.lastIndexOf(9.0);
      expect(lastIndexValue050).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_4400
     * @tc.name testFloat32ArrayIntegrationTwo044
     * @tc.desc Verify find(v>1) on [1,2,3] returns 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const foundValue051 = arr.find((v: number, index: int, array: Float32Array): boolean => v > 1);
      expect(foundValue051).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_4500
     * @tc.name testFloat32ArrayIntegrationTwo045
     * @tc.desc Verify find(v>9) on [1,2] returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const foundValue052 = arr.find((v: number, index: int, array: Float32Array): boolean => v > 9);
      expect(foundValue052).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_4600
     * @tc.name testFloat32ArrayIntegrationTwo046
     * @tc.desc Verify findIndex(v>1) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const foundIndex053 = arr.findIndex((v: number, index: int, array: Float32Array): boolean => v > 1);
      expect(foundIndex053).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_4700
     * @tc.name testFloat32ArrayIntegrationTwo047
     * @tc.desc Verify findIndex(v>9) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const foundIndex054 = arr.findIndex((v: number, index: int, array: Float32Array): boolean => v > 9);
      expect(foundIndex054).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_4800
     * @tc.name testFloat32ArrayIntegrationTwo048
     * @tc.desc Verify findLast(v<3) on [1,2,3] returns 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const lastFoundValue055 = arr.findLast((v: number, index: int, array: Float32Array): boolean => v < 3);
      expect(lastFoundValue055).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_4900
     * @tc.name testFloat32ArrayIntegrationTwo049
     * @tc.desc Verify findLastIndex(v===2) on [1,2,2] returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 2.0]);
      const lastFoundIndex056 = arr.findLastIndex((v: number, index: int, array: Float32Array): boolean => v === 2);
      expect(lastFoundIndex056).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_5000
     * @tc.name testFloat32ArrayIntegrationTwo050
     * @tc.desc Verify findLastIndex(v>9) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const lastFoundIndex057 = arr.findLastIndex((v: number, index: int, array: Float32Array): boolean => v > 9);
      expect(lastFoundIndex057).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_5100
     * @tc.name testFloat32ArrayIntegrationTwo051
     * @tc.desc Verify some(v>9) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const predicateResult059 = arr.some((v: number, index: int, array: Float32Array): boolean => v > 9);
      expect(predicateResult059).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_5200
     * @tc.name testFloat32ArrayIntegrationTwo052
     * @tc.desc Verify every(v>1) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const predicateResult061 = arr.every((v: number, index: int, array: Float32Array): boolean => v > 1);
      expect(predicateResult061).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_5300
     * @tc.name testFloat32ArrayIntegrationTwo053
     * @tc.desc Verify reduce(a+b,0) on [1,2,3] returns 6.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const reducedValue062 = arr.reduce((a: number, b: number, index: int, array: Float32Array): number => a + b, 0);
      expect(reducedValue062).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_5400
     * @tc.name testFloat32ArrayIntegrationTwo054
     * @tc.desc Verify reduceRight(a+b,0) on [1,2,3] returns 6.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const reducedValue063 = arr.reduceRight((a: number, b: number, index: int, array: Float32Array): number => a + b, 0);
      expect(reducedValue063).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_5500
     * @tc.name testFloat32ArrayIntegrationTwo055
     * @tc.desc Verify join() returns "1,2,3"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const joinedValue064 = arr.join();
      expect(joinedValue064).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_5600
     * @tc.name testFloat32ArrayIntegrationTwo056
     * @tc.desc Verify join('-') returns '1-2-3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const joinedValue065 = arr.join('-');
      expect(joinedValue065).assertEqual('1-2-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_5700
     * @tc.name testFloat32ArrayIntegrationTwo057
     * @tc.desc Verify toReversed() first element becomes 3.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.toReversed();
      const element067 = r.$_get(0);
      expect(element067).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_5800
     * @tc.name testFloat32ArrayIntegrationTwo058
     * @tc.desc Verify toSorted() first element becomes 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 2.0]);
      const r = arr.toSorted();
      const element068 = r.$_get(0);
      expect(element068).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_5900
     * @tc.name testFloat32ArrayIntegrationTwo059
     * @tc.desc Verify map(v*2) returns element 4.0 at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const r = arr.map((v: number, index: int, array: Float32Array): number => v * 2);
      const element069 = r.$_get(1);
      expect(element069).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_6000
     * @tc.name testFloat32ArrayIntegrationTwo060
     * @tc.desc Verify copyWithin(0,2) copies [3,4] to front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      arr.copyWithin(0, 2);
      const element070 = arr.$_get(0);
      expect(element070).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_6100
     * @tc.name testFloat32ArrayIntegrationTwo061
     * @tc.desc Verify fill(7.0) sets element at index 1 to 7.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      arr.fill(7.0);
      const element071 = arr.$_get(1);
      expect(element071).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_6200
     * @tc.name testFloat32ArrayIntegrationTwo062
     * @tc.desc Verify byteLength equals length*4 for Float32Array(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(5);
      expect(arr.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_6300
     * @tc.name testFloat32ArrayIntegrationTwo063
     * @tc.desc Verify byteOffset is 8 for Float32Array(buf,8,2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const arr = new Float32Array(buf, 8, 2);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_6400
     * @tc.name testFloat32ArrayIntegrationTwo064
     * @tc.desc Verify length is 2 for Float32Array(buf,8,2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const arr = new Float32Array(buf, 8, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_6500
     * @tc.name testFloat32ArrayIntegrationTwo065
     * @tc.desc Verify byteLength is 8 for Float32Array(buf,8,2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const arr = new Float32Array(buf, 8, 2);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_6600
     * @tc.name testFloat32ArrayIntegrationTwo066
     * @tc.desc Verify byteLength is 16 for Float32Array with 4 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_6700
     * @tc.name testFloat32ArrayIntegrationTwo067
     * @tc.desc Verify slice(1,4).length returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const sliced = arr.slice(1, 4);
      expect(sliced.length).assertEqual(3);
      expect(sliced.$_get(0)).assertEqual(2.0);
      expect(sliced.$_get(1)).assertEqual(3.0);
      expect(sliced.$_get(2)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_6800
     * @tc.name testFloat32ArrayIntegrationTwo068
     * @tc.desc Verify subarray(1,4).length returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const sub = arr.subarray(1, 4);
      expect(sub.length).assertEqual(3);
      expect(sub.$_get(0)).assertEqual(2.0);
      expect(sub.$_get(1)).assertEqual(3.0);
      expect(sub.$_get(2)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_6900
     * @tc.name testFloat32ArrayIntegrationTwo069
     * @tc.desc Verify filter(v>2).length returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const filtered = arr.filter((v: number, index: int, array: Float32Array): boolean => v > 2);
      expect(filtered.length).assertEqual(2);
      expect(filtered.$_get(0)).assertEqual(3.0);
      expect(filtered.$_get(1)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_7000
     * @tc.name testFloat32ArrayIntegrationTwo070
     * @tc.desc Verify map(v*2).length equals original length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const mapped = arr.map((v: number, index: int, array: Float32Array): number => v * 2);
      expect(mapped.length).assertEqual(3);
      expect(mapped.$_get(0)).assertEqual(2.0);
      expect(mapped.$_get(1)).assertEqual(4.0);
      expect(mapped.$_get(2)).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_7100
     * @tc.name testFloat32ArrayIntegrationTwo071
     * @tc.desc Verify with(0,9.0).length equals original length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const withResult = arr.with(0, 9.0);
      expect(withResult.length).assertEqual(3);
      expect(withResult.$_get(0)).assertEqual(9.0);
      expect(withResult.$_get(1)).assertEqual(2.0);
      expect(withResult.$_get(2)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_7200
     * @tc.name testFloat32ArrayIntegrationTwo072
     * @tc.desc Verify with(0, 9.0) does not mutate original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      arr.with(0, 9.0);
      const element090 = arr.$_get(0);
      expect(element090).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_7300
     * @tc.name testFloat32ArrayIntegrationTwo073
     * @tc.desc Verify toReversed() does not mutate original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      arr.toReversed();
      const element091 = arr.$_get(0);
      expect(element091).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_7400
     * @tc.name testFloat32ArrayIntegrationTwo074
     * @tc.desc Verify toSorted() does not mutate original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 2.0]);
      arr.toSorted();
      const element092 = arr.$_get(0);
      expect(element092).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_7500
     * @tc.name testFloat32ArrayIntegrationTwo075
     * @tc.desc Verify map(v*2) does not mutate original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      arr.map((v: number, index: int, array: Float32Array): number => v * 2);
      const element093 = arr.$_get(1);
      expect(element093).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_7600
     * @tc.name testFloat32ArrayIntegrationTwo076
     * @tc.desc Verify filter(v>1) does not mutate original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const result = arr.filter((v: number, index: int, array: Float32Array): boolean => v > 1);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(1)).assertEqual(2.0);
      expect(arr.$_get(2)).assertEqual(3.0);
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(2.0);
      expect(result.$_get(1)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_7700
     * @tc.name testFloat32ArrayIntegrationTwo077
     * @tc.desc Verify valueOf() returns reference to original array (mutation propagates)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.valueOf();
      expect(r).assertEqual(arr);
      r.$_set(0, 99.0);
      const element095 = arr.$_get(0);
      expect(element095).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_7800
     * @tc.name testFloat32ArrayIntegrationTwo078
     * @tc.desc Verify reverse() returns original array (mutation propagates)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.reverse();
      expect(r).assertEqual(arr);
      r.$_set(0, 99.0);
      const element096 = arr.$_get(0);
      expect(element096).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_7900
     * @tc.name testFloat32ArrayIntegrationTwo079
     * @tc.desc Verify sort() returns original array (mutation propagates)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 2.0]);
      const r = arr.sort();
      expect(r).assertEqual(arr);
      r.$_set(0, 99.0);
      const element097 = arr.$_get(0);
      expect(element097).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_8000
     * @tc.name testFloat32ArrayIntegrationTwo080
     * @tc.desc Verify fill() returns original array (mutation propagates)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.fill(7.0);
      expect(r).assertEqual(arr);
      r.$_set(0, 99.0);
      const element098 = arr.$_get(0);
      expect(element098).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_8100
     * @tc.name testFloat32ArrayIntegrationTwo081
     * @tc.desc Verify copyWithin() returns original array (mutation propagates)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = arr.copyWithin(0, 2);
      expect(r).assertEqual(arr);
      r.$_set(0, 99.0);
      const element099 = arr.$_get(0);
      expect(element099).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_8200
     * @tc.name testFloat32ArrayIntegrationTwo082
     * @tc.desc Verify chain reverse().sort() sorts array correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 2.0]);
      arr.reverse().sort();
      const element100 = arr.$_get(0);
      expect(element100).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_8300
     * @tc.name testFloat32ArrayIntegrationTwo083
     * @tc.desc Verify subarray view shares buffer (mutating view affects original)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view = arr.subarray(1, 3);
      view.$_set(0, 99.0);
      const element101 = arr.$_get(1);
      expect(element101).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_8400
     * @tc.name testFloat32ArrayIntegrationTwo084
     * @tc.desc Verify subarray byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view = arr.subarray(2, 4);
      expect(view.byteOffset).assertEqual(arr.byteOffset + 2 * 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_8500
     * @tc.name testFloat32ArrayIntegrationTwo085
     * @tc.desc Verify subarray view shares same buffer as original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view = arr.subarray(1, 3);
      expect(view.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_8600
     * @tc.name testFloat32ArrayIntegrationTwo086
     * @tc.desc Verify two Float32Array views on same ArrayBuffer share data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf);
      arr.$_set(0, 42.0);
      const view2 = new Float32Array(buf);
      const element104 = view2.$_get(0);
      expect(element104).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_8700
     * @tc.name testFloat32ArrayIntegrationTwo087
     * @tc.desc Verify Float32Array.buffer equals the ArrayBuffer passed to constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const arr = new Float32Array(buf);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_8800
     * @tc.name testFloat32ArrayIntegrationTwo088
     * @tc.desc Verify slice creates new buffer (slice mutation does not affect original)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.slice(0, 2);
      r.$_set(0, 99.0);
      const element106 = arr.$_get(0);
      expect(element106).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_8900
     * @tc.name testFloat32ArrayIntegrationTwo089
     * @tc.desc Verify chained subarray shares original buffer (mutation propagates to original)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const observedValue107 = arr.subarray(1, 4);
      const observedValue107Part2 = observedValue107.subarray(1, 3);
      observedValue107Part2.$_set(0, 77.0);
      const element107 = arr.$_get(2);
      expect(element107).assertEqual(77.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_9000
     * @tc.name testFloat32ArrayIntegrationTwo090
     * @tc.desc Verify byteOffset is 16 for Float32Array(buf,16,2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const a2 = new Float32Array(buf, 16, 2);
      expect(a2.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_9100
     * @tc.name testFloat32ArrayIntegrationTwo091
     * @tc.desc Verify ArrayBuffer.isView Float32Array true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const observedValue109 = ArrayBuffer.isView(arr);
      expect(observedValue109).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_9200
     * @tc.name testFloat32ArrayIntegrationTwo092
     * @tc.desc Verify ArrayBuffer.isView ArrayBuffer false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const observedValue110 = ArrayBuffer.isView(buf);
      expect(observedValue110).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_9300
     * @tc.name testFloat32ArrayIntegrationTwo093
     * @tc.desc Verify two Float32Array views on same buffer at different offsets share data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const full = new Float32Array(buf);
      full.$_set(2, 88.0);
      const half = new Float32Array(buf, 8, 2);
      const element111 = half.$_get(0);
      expect(element111).assertEqual(88.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_9400
     * @tc.name testFloat32ArrayIntegrationTwo094
     * @tc.desc Verify entries() iterator.next().done is false for non-empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const iter = arr.entries();
      const n = iter.next();
      expect(n.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_9500
     * @tc.name testFloat32ArrayIntegrationTwo095
     * @tc.desc Verify values() iterator.next() returns first element 7.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0, 8.0]);
      const iter = arr.values();
      const n = iter.next();
      expect(n.value!).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_9600
     * @tc.name testFloat32ArrayIntegrationTwo096
     * @tc.desc Verify keys() iterator.next() returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0, 8.0]);
      const iter = arr.keys();
      const n = iter.next();
      expect(n.value!).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_9700
     * @tc.name testFloat32ArrayIntegrationTwo097
     * @tc.desc Verify values() iterator.next().done is true after exhausting array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const iter = arr.values();
      iter.next();
      const n = iter.next();
      expect(n.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_9800
     * @tc.name testFloat32ArrayIntegrationTwo098
     * @tc.desc Verify two independent values() iterators each start at first element 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const it1 = arr.values();
      const it2 = arr.values();
      const n1 = it1.next();
      const n2 = it2.next();
      expect(n1.value).assertEqual(1.0);
      expect(n2.value).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_TWO_9900
     * @tc.name testFloat32ArrayIntegrationTwo099
     * @tc.desc Verify values iterator on [1,2,3] sums all values to 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationTwo099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      let sum: number = 0;
      const iterator = arr.values();
      for (let result = iterator.next(); !result.done; result = iterator.next()) {
        const value = result.value!;
        sum = sum + value;
      }
      expect(sum).assertEqual(6.0);
    });

  });
}
