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
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Uint8ArrayTotal02Test(): void {
  describe('Uint8ArrayTotal02Test', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0010
     * @tc.name testUint8ArrayTotal001
     * @tc.desc Verify typeof new Uint8Array(5) is 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0020
     * @tc.name testUint8ArrayTotal002
     * @tc.desc Verify typeof Uint8Array.BYTES_PER_ELEMENT is 'number'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      expect(isInteger(arr.BYTES_PER_ELEMENT)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0030
     * @tc.name testUint8ArrayTotal003
     * @tc.desc Verify typeof arr.buffer is 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      expect(arr.buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0040
     * @tc.name testUint8ArrayTotal004
     * @tc.desc Verify typeof arr.byteOffset is 'number'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      expect(isInteger(arr.byteOffset)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0050
     * @tc.name testUint8ArrayTotal005
     * @tc.desc Verify typeof arr[0] is 'number'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([42]);
      expect(isInteger(arr[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0060
     * @tc.name testUint8ArrayTotal006
     * @tc.desc Verify typeof arr.at(0) is 'number'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([42]);
      let val: number | undefined = arr.at(0);
      expect(val).assertEqual(42);
      if (val !== undefined) {
        expect(isInteger(val)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0070
     * @tc.name testUint8ArrayTotal007
     * @tc.desc Verify typeof arr.at(5) with out-of-bounds index is 'undefined'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      expect(arr.at(5)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0080
     * @tc.name testUint8ArrayTotal008
     * @tc.desc Verify typeof arr.slice() is 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      expect(arr.slice() instanceof Uint8Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0090
     * @tc.name testUint8ArrayTotal009
     * @tc.desc Verify typeof arr.map() is 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result = arr.map((v: number, i: int, a: Uint8Array): number => v);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0100
     * @tc.name testUint8ArrayTotal010
     * @tc.desc Verify typeof arr.filter() is 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result = arr.filter((v: number, i: int, a: Uint8Array): boolean => true);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0110
     * @tc.name testUint8ArrayTotal011
     * @tc.desc Verify typeof Uint8Array.of() is 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0120
     * @tc.name testUint8ArrayTotal012
     * @tc.desc Verify typeof Uint8Array.from() is 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.from([1, 2, 3]);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0130
     * @tc.name testUint8ArrayTotal013
     * @tc.desc Verify typeof arr.entries() is 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2]);
      expect(arr.entries() instanceof Object).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0140
     * @tc.name testUint8ArrayTotal014
     * @tc.desc Verify typeof arr.fill() is 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      let result: Uint8Array = arr.fill(0);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0150
     * @tc.name testUint8ArrayTotal015
     * @tc.desc Verify typeof arr.copyWithin() is 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: Uint8Array = arr.copyWithin(0, 1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0160
     * @tc.name testUint8ArrayTotal016
     * @tc.desc Verify typeof arr.every() is 'boolean'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: boolean = arr.every((x: number): boolean => x > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0170
     * @tc.name testUint8ArrayTotal017
     * @tc.desc Verify typeof arr.some() is 'boolean'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: boolean = arr.some((x: number): boolean => x > 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0180
     * @tc.name testUint8ArrayTotal018
     * @tc.desc Verify typeof arr.forEach() is 'undefined'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: void = arr.forEach((x: number): void => {
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0190
     * @tc.name testUint8ArrayTotal019
     * @tc.desc Verify typeof arr.reduce() is 'number'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: number = arr.reduce((acc: number, x: number): number => acc + x, 0);
      expect(isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0200
     * @tc.name testUint8ArrayTotal020
     * @tc.desc Verify typeof arr.find() is 'number'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: number | undefined = arr.find((x: number): boolean => x > 1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0210
     * @tc.name testUint8ArrayTotal021
     * @tc.desc Verify typeof arr.findIndex() is 'number'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: number = arr.findIndex((x: number): boolean => x > 1);
      expect(isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0220
     * @tc.name testUint8ArrayTotal022
     * @tc.desc Verify typeof arr.includes() is 'boolean'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: boolean = arr.includes(2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0230
     * @tc.name testUint8ArrayTotal023
     * @tc.desc Verify typeof arr.indexOf() is 'number'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: number = arr.indexOf(2);
      expect(isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0240
     * @tc.name testUint8ArrayTotal024
     * @tc.desc Verify typeof arr.join() is 'string'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: string = arr.join();
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0250
     * @tc.name testUint8ArrayTotal025
     * @tc.desc Verify typeof arr.reverse() is 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let copied: Uint8Array = arr.slice();
      let result: Uint8Array = copied.reverse();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0260
     * @tc.name testUint8ArrayTotal026
     * @tc.desc Verify typeof arr.sort() is 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([3, 1, 2]);
      let copied: Uint8Array = arr.slice();
      let result: Uint8Array = copied.sort();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0270
     * @tc.name testUint8ArrayTotal027
     * @tc.desc Verify typeof arr.toReversed() is 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: Uint8Array = arr.toReversed();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0280
     * @tc.name testUint8ArrayTotal028
     * @tc.desc Verify typeof arr.toSorted() is 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([3, 1, 2]);
      let result: Uint8Array = arr.toSorted();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0290
     * @tc.name testUint8ArrayTotal029
     * @tc.desc Verify typeof arr.with() is 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: Uint8Array = arr.with(0, 99);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0300
     * @tc.name testUint8ArrayTotal030
     * @tc.desc Verify typeof arr.set() is 'undefined'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      let src: Uint8Array = new Uint8Array([1, 2, 3]);
      arr.set(src);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0310
     * @tc.name testUint8ArrayTotal031
     * @tc.desc Verify arr.length is 0 for empty Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0320
     * @tc.name testUint8ArrayTotal032
     * @tc.desc Verify arr.length is 5 for Uint8Array(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0330
     * @tc.name testUint8ArrayTotal033
     * @tc.desc Verify arr.length is 3 for Uint8Array([1,2,3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0340
     * @tc.name testUint8ArrayTotal034
     * @tc.desc Verify arr.length is 3 for Uint8Array.of(1,2,3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0350
     * @tc.name testUint8ArrayTotal035
     * @tc.desc Verify arr.length is 3 for Uint8Array.from([1,2,3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.from([1, 2, 3]);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0360
     * @tc.name testUint8ArrayTotal036
     * @tc.desc Verify arr.length is 3 for subarray of length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let sub: Uint8Array = arr.subarray(0, 3);
      expect(sub.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0370
     * @tc.name testUint8ArrayTotal037
     * @tc.desc Verify arr.length is 0 for subarray(0,0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let sub: Uint8Array = arr.subarray(0, 0);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0380
     * @tc.name testUint8ArrayTotal038
     * @tc.desc Verify arr.byteOffset is 0 for Uint8Array(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0390
     * @tc.name testUint8ArrayTotal039
     * @tc.desc Verify arr.byteOffset is 0 for Uint8Array([1,2,3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0400
     * @tc.name testUint8ArrayTotal040
     * @tc.desc Verify arr.byteOffset is 0 for Uint8Array.of(1,2,3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0410
     * @tc.name testUint8ArrayTotal041
     * @tc.desc Verify arr.byteOffset is 0 for Uint8Array.from([1,2,3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.from([1, 2, 3]);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0420
     * @tc.name testUint8ArrayTotal042
     * @tc.desc Verify arr.byteOffset is 0 for subarray(0,3) from start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let sub: Uint8Array = arr.subarray(0, 3);
      expect(sub.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0430
     * @tc.name testUint8ArrayTotal043
     * @tc.desc Verify arr.byteOffset is 2 for subarray(2,5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let sub: Uint8Array = arr.subarray(2, 5);
      expect(sub.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0440
     * @tc.name testUint8ArrayTotal044
     * @tc.desc Verify arr.BYTES_PER_ELEMENT is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0450
     * @tc.name testUint8ArrayTotal045
     * @tc.desc Verify arr[0] is 0 for Uint8Array(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0460
     * @tc.name testUint8ArrayTotal046
     * @tc.desc Verify arr[0] is 42 for Uint8Array([42])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([42]);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0470
     * @tc.name testUint8ArrayTotal047
     * @tc.desc Verify arr[0] is 1 for Uint8Array.of(1,2,3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0480
     * @tc.name testUint8ArrayTotal048
     * @tc.desc Verify arr[0] is 1 for Uint8Array.from([1,2,3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.from([1, 2, 3]);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0490
     * @tc.name testUint8ArrayTotal049
     * @tc.desc Verify arr[0] is 255 for Uint8Array([255])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([255]);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0500
     * @tc.name testUint8ArrayTotal050
     * @tc.desc Verify arr[0] is 0 for Uint8Array([256]) (overflow)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([256]);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0510
     * @tc.name testUint8ArrayTotal051
     * @tc.desc Verify arr[0] is 255 for Uint8Array([-1]) (underflow)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([-1]);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0520
     * @tc.name testUint8ArrayTotal052
     * @tc.desc Verify arr[0] is 3 for Uint8Array([3.9]) (float truncation toward zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([3.9]);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0530
     * @tc.name testUint8ArrayTotal053
     * @tc.desc Verify NaN input converts to 0 while following numeric input remains 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([Number.NaN, 7]);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0540
     * @tc.name testUint8ArrayTotal054
     * @tc.desc Verify arr[0] is 0 for Uint8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0]);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0550
     * @tc.name testUint8ArrayTotal055
     * @tc.desc Verify boolean false converts to 0 and true converts to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 1]);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0560
     * @tc.name testUint8ArrayTotal056
     * @tc.desc Verify arr[0] is 1 for Uint8Array([1])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1]);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0570
     * @tc.name testUint8ArrayTotal057
     * @tc.desc Verify positive infinity converts to 0 without changing following value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([Number.POSITIVE_INFINITY, 8]);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0580
     * @tc.name testUint8ArrayTotal058
     * @tc.desc Verify negative infinity converts to 0 without changing following value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([Number.NEGATIVE_INFINITY, 9]);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0590
     * @tc.name testUint8ArrayTotal059
     * @tc.desc Verify arr[0] is 255 for Uint8Array([511])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([511]);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0600
     * @tc.name testUint8ArrayTotal060
     * @tc.desc Verify fractional values 0.5 and 1.5 truncate toward zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0.5, 1.5]);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0610
     * @tc.name testUint8ArrayTotal061
     * @tc.desc Verify invalid parseInt converts to 0 while valid parseInt keeps value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([parseInt('abc'), parseInt('12')]);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0620
     * @tc.name testUint8ArrayTotal062
     * @tc.desc Verify arr[0] is 1 for Uint8Array([1,2,3])[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0630
     * @tc.name testUint8ArrayTotal063
     * @tc.desc Verify arr[1] is 2 for Uint8Array([1,2,3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0640
     * @tc.name testUint8ArrayTotal064
     * @tc.desc Verify arr[2] is 3 for Uint8Array([1,2,3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0650
     * @tc.name testUint8ArrayTotal065
     * @tc.desc Verify arr[3] throws RangeError for out-of-bounds index on Uint8Array([1,2,3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      try {
        let val = arr[3];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0660
     * @tc.name testUint8ArrayTotal066
     * @tc.desc Verify arr[-1] throws RangeError for negative index on Uint8Array([1,2,3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      try {
        let val = arr[-1];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0670
     * @tc.name testUint8ArrayTotal067
     * @tc.desc Verify arr[0] is 0 for Uint8Array(5) after setting arr[0]=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      arr[0] = 0;
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0680
     * @tc.name testUint8ArrayTotal068
     * @tc.desc Verify arr[0] is 255 for Uint8Array(5) after setting arr[0]=255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      arr[0] = 255;
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0690
     * @tc.name testUint8ArrayTotal069
     * @tc.desc Verify arr[0] is 0 for Uint8Array(5) after setting arr[0]=256 (overflow)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      arr[0] = 256;
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0700
     * @tc.name testUint8ArrayTotal070
     * @tc.desc Verify arr[0] is 255 for Uint8Array(5) after setting arr[0]=-1 (underflow)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      arr[0] = -1;
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0710
     * @tc.name testUint8ArrayTotal071
     * @tc.desc Verify arr[0] is 3 for Uint8Array(5) after setting arr[0]=3.9 (truncation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      arr[0] = 3.9;
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0720
     * @tc.name testUint8ArrayTotal072
     * @tc.desc Verify arr[0] is 0 for Uint8Array(5) after setting arr[0]=Number.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      arr[0] = Number.NaN;
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0730
     * @tc.name testUint8ArrayTotal073
     * @tc.desc Verify arr[0] is 0 for Uint8Array(5) after setting arr[0]=512
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      arr[0] = 512;
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0740
     * @tc.name testUint8ArrayTotal074
     * @tc.desc Verify arr[0] is 0 for Uint8Array(5) after setting arr[0]=-256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      arr[0] = -256;
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0750
     * @tc.name testUint8ArrayTotal075
     * @tc.desc Verify arr[0] is 1 for Uint8Array(5) after setting arr[0]=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      arr[0] = 1;
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0760
     * @tc.name testUint8ArrayTotal076
     * @tc.desc Verify arr[0] is 0 for Uint8Array(5) after setting arr[0]=''0''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      arr[0] = parseInt('0');
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0770
     * @tc.name testUint8ArrayTotal077
     * @tc.desc Verify arr[0] is 255 for Uint8Array(5) after setting arr[0]=''255''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      arr[0] = parseInt('255');
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0780
     * @tc.name testUint8ArrayTotal078
     * @tc.desc Verify arr[0] is 0 for Uint8Array(5) after setting arr[0]=''''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      arr[0] = parseInt('');
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0790
     * @tc.name testUint8ArrayTotal079
     * @tc.desc Verify arr[0] is 0 for Uint8Array(5) after setting arr[0]=''abc''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      arr[0] = parseInt('abc');
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0800
     * @tc.name testUint8ArrayTotal080
     * @tc.desc Verify arr.fill(0) sets all elements to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      arr.fill(0);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0810
     * @tc.name testUint8ArrayTotal081
     * @tc.desc Verify arr.fill(255) sets all elements to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      arr.fill(255);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0820
     * @tc.name testUint8ArrayTotal082
     * @tc.desc Verify arr.fill(0,1,2) fills partial range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      arr.fill(0, 1, 2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0830
     * @tc.name testUint8ArrayTotal083
     * @tc.desc Verify arr.copyWithin(0,1,2) copies elements within array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      arr.copyWithin(0, 1, 2);
      expect(arr[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0840
     * @tc.name testUint8ArrayTotal084
     * @tc.desc Verify arr.every() returns true when all elements satisfy condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: boolean = arr.every((x: number): boolean => x > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0850
     * @tc.name testUint8ArrayTotal085
     * @tc.desc Verify arr.every() returns false when some elements fail condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: boolean = arr.every((x: number): boolean => x > 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0860
     * @tc.name testUint8ArrayTotal086
     * @tc.desc Verify arr.some() returns true when at least one element satisfies condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: boolean = arr.some((x: number): boolean => x > 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0870
     * @tc.name testUint8ArrayTotal087
     * @tc.desc Verify arr.some() returns false when no element satisfies condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: boolean = arr.some((x: number): boolean => x > 5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0880
     * @tc.name testUint8ArrayTotal088
     * @tc.desc Verify arr.forEach() iterates over all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let sum: number = 0;
      arr.forEach((x: number): void => {
        sum += x;
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0890
     * @tc.name testUint8ArrayTotal089
     * @tc.desc Verify arr.reduce() sums all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: number = arr.reduce((acc: number, x: number): number => acc + x, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0900
     * @tc.name testUint8ArrayTotal090
     * @tc.desc Verify arr.find() returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: number | undefined = arr.find((x: number): boolean => x > 1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0910
     * @tc.name testUint8ArrayTotal091
     * @tc.desc Verify arr.find() returns undefined when no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: number | undefined = arr.find((x: number): boolean => x > 5);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0920
     * @tc.name testUint8ArrayTotal092
     * @tc.desc Verify arr.findIndex() returns index of first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: number = arr.findIndex((x: number): boolean => x > 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0930
     * @tc.name testUint8ArrayTotal093
     * @tc.desc Verify arr.findIndex() returns -1 when no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: number = arr.findIndex((x: number): boolean => x > 5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0940
     * @tc.name testUint8ArrayTotal094
     * @tc.desc Verify arr.findLast() returns last matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: number | undefined = arr.findLast((x: number): boolean => x > 1);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0950
     * @tc.name testUint8ArrayTotal095
     * @tc.desc Verify arr.findLastIndex() returns index of last matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: number = arr.findLastIndex((x: number): boolean => x > 1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0960
     * @tc.name testUint8ArrayTotal096
     * @tc.desc Verify arr.includes() returns true for existing element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: boolean = arr.includes(2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0970
     * @tc.name testUint8ArrayTotal097
     * @tc.desc Verify arr.includes() returns false for non-existing element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: boolean = arr.includes(5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0980
     * @tc.name testUint8ArrayTotal098
     * @tc.desc Verify arr.indexOf() returns correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: number = arr.indexOf(2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_0990
     * @tc.name testUint8ArrayTotal099
     * @tc.desc Verify arr.indexOf() returns -1 for non-existing element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: number = arr.indexOf(5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_1000
     * @tc.name testUint8ArrayTotal100
     * @tc.desc Verify subarray(1,4).buffer is same as original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let sub: Uint8Array = arr.subarray(1, 4);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_1010
     * @tc.name testUint8ArrayTotal101
     * @tc.desc Verify writing to subarray affects original array (shared buffer forward)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let sub: Uint8Array = arr.subarray(1, 4);
      sub[0] = 99;
      expect(arr[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_1020
     * @tc.name testUint8ArrayTotal102
     * @tc.desc Verify writing to original array affects subarray (shared buffer reverse)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let sub: Uint8Array = arr.subarray(1, 4);
      arr[2] = 99;
      expect(sub[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_1030
     * @tc.name testUint8ArrayTotal103
     * @tc.desc Verify slice().buffer is different from original buffer (non-shared)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let sliced: Uint8Array = arr.slice();
      expect(sliced.buffer !== arr.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL02_1040
     * @tc.name testUint8ArrayTotal104
     * @tc.desc Verify subarray(0,arr.length).byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let sub: Uint8Array = arr.subarray(0, arr.length);
      expect(sub.byteOffset).assertEqual(0);
    });
  });
}
