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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint16Arrayreverse01Test(): void {
  describe('Uint16Arrayreverse01', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_0100
     * @tc.name testUint16Arrayreverse01001
     * @tc.desc Verify reverse returns elements in descending index order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40]);
      let result: Uint16Array = arr.reverse();
      expect(result[0]).assertEqual(40);
      expect(result[1]).assertEqual(39);
      expect(result[2]).assertEqual(38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_0200
     * @tc.name testUint16Arrayreverse01002
     * @tc.desc Verify reversal retains the original byte size
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40, 41, 42]);
      let result: Uint16Array = arr.reverse();
      expect(result.byteLength).assertEqual(arr.byteLength);
      expect(result.byteLength).assertEqual(10);
      expect(result.join(',')).assertEqual('5,4,3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_0300
     * @tc.name testUint16Arrayreverse01003
     * @tc.desc Verify reversal preserves element count for a multi-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([47, 57, 67, 77]);
      let result: Uint16Array = arr.reverse();
      expect(result.length).assertEqual(arr.length);
      expect(result.length).assertEqual(4);
      expect(result.join(',')).assertEqual('40,30,20,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_0400
     * @tc.name testUint16Arrayreverse01004
     * @tc.desc Verify reversal retains a zero byte offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40, 41]);
      let result: Uint16Array = arr.reverse();
      expect(result.byteOffset).assertEqual(arr.byteOffset);
      expect(result.byteOffset).assertEqual(0);
      expect(result.join(',')).assertEqual('4,3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_0500
     * @tc.name testUint16Arrayreverse01005
     * @tc.desc Verify reversal returns a view backed by the original buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40]);
      let result: Uint16Array = arr.reverse();
      expect(result.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_0600
     * @tc.name testUint16Arrayreverse01006
     * @tc.desc Verify reverse returns the same empty typed array instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(0);
      let result: Uint16Array = arr.reverse();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_0700
     * @tc.name testUint16Arrayreverse01007
     * @tc.desc Verify an in-place reversal leaves an empty array empty
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(0);
      arr.reverse();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_0800
     * @tc.name testUint16Arrayreverse01008
     * @tc.desc Verify two chained reversals preserve an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(0);
      arr.reverse().reverse();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_0900
     * @tc.name testUint16Arrayreverse01009
     * @tc.desc Verify reverse leaves a single element unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([79]);
      arr.reverse();
      expect(arr[0]).assertEqual(79);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_1000
     * @tc.name testUint16Arrayreverse01010
     * @tc.desc Verify reversal preserves the length of a single-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([136]);
      arr.reverse();
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_1100
     * @tc.name testUint16Arrayreverse01011
     * @tc.desc Verify reversal returns the sole element in a one-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([44]);
      let result: Uint16Array = arr.reverse();
      expect(result[0]).assertEqual(44);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_1200
     * @tc.name testUint16Arrayreverse01012
     * @tc.desc Verify reversal preserves a single zero value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([0]);
      arr.reverse();
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_1300
     * @tc.name testUint16Arrayreverse01013
     * @tc.desc Verify reversal preserves a single maximum Uint16 value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([65535]);
      arr.reverse();
      expect(arr[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_1400
     * @tc.name testUint16Arrayreverse01014
     * @tc.desc Verify reversal swaps the elements of a two-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39]);
      arr.reverse();
      expect(arr[0]).assertEqual(39);
      expect(arr[1]).assertEqual(38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_1500
     * @tc.name testUint16Arrayreverse01015
     * @tc.desc Verify reversal preserves equal midpoint values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([32768, 32768]);
      arr.reverse();
      expect(arr[0]).assertEqual(32768);
      expect(arr[1]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_1600
     * @tc.name testUint16Arrayreverse01016
     * @tc.desc Verify reversal mirrors a four-element ascending sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40, 41]);
      arr.reverse();
      expect(arr[0]).assertEqual(41);
      expect(arr[1]).assertEqual(40);
      expect(arr[2]).assertEqual(39);
      expect(arr[3]).assertEqual(38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_1700
     * @tc.name testUint16Arrayreverse01017
     * @tc.desc Verify reversal moves Uint16 boundary values to opposite ends
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([0, 137, 237, 65535]);
      arr.reverse();
      expect(arr[0]).assertEqual(65535);
      expect(arr[1]).assertEqual(237);
      expect(arr[2]).assertEqual(137);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_1800
     * @tc.name testUint16Arrayreverse01018
     * @tc.desc Verify reversal preserves grouped maximum and zero values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([65535, 65535, 0, 0]);
      arr.reverse();
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(65535);
      expect(arr[3]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_1900
     * @tc.name testUint16Arrayreverse01019
     * @tc.desc Verify reversal preserves a uniform four-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([42, 42, 42, 42]);
      arr.reverse();
      expect(arr[0]).assertEqual(42);
      expect(arr[1]).assertEqual(42);
      expect(arr[2]).assertEqual(42);
      expect(arr[3]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_2000
     * @tc.name testUint16Arrayreverse01020
     * @tc.desc Verify reversal preserves an array of zero values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([0, 0, 0, 0]);
      arr.reverse();
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_2100
     * @tc.name testUint16Arrayreverse01021
     * @tc.desc Verify reversal preserves an array of maximum Uint16 values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([65535, 65535, 65535, 65535]);
      arr.reverse();
      expect(arr[0]).assertEqual(65535);
      expect(arr[1]).assertEqual(65535);
      expect(arr[2]).assertEqual(65535);
      expect(arr[3]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_2200
     * @tc.name testUint16Arrayreverse01022
     * @tc.desc Verify reversal leaves an even-length palindrome unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 39, 38]);
      arr.reverse();
      expect(arr[0]).assertEqual(38);
      expect(arr[1]).assertEqual(39);
      expect(arr[2]).assertEqual(39);
      expect(arr[3]).assertEqual(38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_2300
     * @tc.name testUint16Arrayreverse01023
     * @tc.desc Verify reversal preserves the center of an odd-length boundary sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([0, 32768, 65535]);
      arr.reverse();
      expect(arr[0]).assertEqual(65535);
      expect(arr[1]).assertEqual(32768);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_2400
     * @tc.name testUint16Arrayreverse01024
     * @tc.desc Verify reversal preserves a uniform three-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([137, 137, 137]);
      arr.reverse();
      expect(arr[0]).assertEqual(137);
      expect(arr[1]).assertEqual(137);
      expect(arr[2]).assertEqual(137);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_2500
     * @tc.name testUint16Arrayreverse01025
     * @tc.desc Verify reversal leaves an odd-length palindrome unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 38]);
      arr.reverse();
      expect(arr[0]).assertEqual(38);
      expect(arr[1]).assertEqual(39);
      expect(arr[2]).assertEqual(38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_2600
     * @tc.name testUint16Arrayreverse01026
     * @tc.desc Verify reversal mirrors a five-element ascending sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40, 41, 42]);
      arr.reverse();
      expect(arr[0]).assertEqual(42);
      expect(arr[1]).assertEqual(41);
      expect(arr[2]).assertEqual(40);
      expect(arr[3]).assertEqual(39);
      expect(arr[4]).assertEqual(38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_2700
     * @tc.name testUint16Arrayreverse01027
     * @tc.desc Verify reversal repositions endpoints in a five-element boundary sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([0, 38, 39, 40, 65535]);
      arr.reverse();
      expect(arr[0]).assertEqual(65535);
      expect(arr[1]).assertEqual(40);
      expect(arr[2]).assertEqual(39);
      expect(arr[3]).assertEqual(38);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_2800
     * @tc.name testUint16Arrayreverse01028
     * @tc.desc Verify reversal preserves a uniform five-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([79, 79, 79, 79, 79]);
      arr.reverse();
      expect(arr[0]).assertEqual(79);
      expect(arr[1]).assertEqual(79);
      expect(arr[2]).assertEqual(79);
      expect(arr[3]).assertEqual(79);
      expect(arr[4]).assertEqual(79);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_2900
     * @tc.name testUint16Arrayreverse01029
     * @tc.desc Verify reversal leaves a five-element palindrome unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40, 39, 38]);
      arr.reverse();
      expect(arr[0]).assertEqual(38);
      expect(arr[1]).assertEqual(39);
      expect(arr[2]).assertEqual(40);
      expect(arr[3]).assertEqual(39);
      expect(arr[4]).assertEqual(38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_3000
     * @tc.name testUint16Arrayreverse01030
     * @tc.desc Verify reversal mirrors a six-element ascending sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40, 41, 42, 43]);
      arr.reverse();
      expect(arr[0]).assertEqual(43);
      expect(arr[1]).assertEqual(42);
      expect(arr[2]).assertEqual(41);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(39);
      expect(arr[5]).assertEqual(38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_3100
     * @tc.name testUint16Arrayreverse01031
     * @tc.desc Verify reversal mirrors every position in a sixteen-element sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([0, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52]);
      arr.reverse();
      expect(arr[0]).assertEqual(52);
      expect(arr[1]).assertEqual(51);
      expect(arr[2]).assertEqual(50);
      expect(arr[3]).assertEqual(49);
      expect(arr[4]).assertEqual(48);
      expect(arr[5]).assertEqual(47);
      expect(arr[6]).assertEqual(46);
      expect(arr[7]).assertEqual(45);
      expect(arr[8]).assertEqual(44);
      expect(arr[9]).assertEqual(43);
      expect(arr[10]).assertEqual(42);
      expect(arr[11]).assertEqual(41);
      expect(arr[12]).assertEqual(40);
      expect(arr[13]).assertEqual(39);
      expect(arr[14]).assertEqual(38);
      expect(arr[15]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_3200
     * @tc.name testUint16Arrayreverse01032
     * @tc.desc Verify reversal moves sampled positions in a hundred-element sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [];
      let i: int = 0;
      while (i < 100) {
        src.push(i);
        i++;
      }
      let arr: Uint16Array = new Uint16Array(src);
      arr.reverse();
      expect(arr[0]).assertEqual(99);
      expect(arr[50]).assertEqual(49);
      expect(arr[99]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_3300
     * @tc.name testUint16Arrayreverse01033
     * @tc.desc Verify two reversals restore an even-length array to its original order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40, 41]);
      arr.reverse();
      arr.reverse();
      expect(arr[0]).assertEqual(41);
      expect(arr[1]).assertEqual(40);
      expect(arr[2]).assertEqual(39);
      expect(arr[3]).assertEqual(38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_3400
     * @tc.name testUint16Arrayreverse01034
     * @tc.desc Verify two reversals restore an odd-length array to its original order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40, 41, 42]);
      arr.reverse();
      arr.reverse();
      expect(arr[0]).assertEqual(42);
      expect(arr[1]).assertEqual(41);
      expect(arr[2]).assertEqual(40);
      expect(arr[3]).assertEqual(39);
      expect(arr[4]).assertEqual(38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_3500
     * @tc.name testUint16Arrayreverse01035
     * @tc.desc Verify two reversals preserve a single-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([136]);
      arr.reverse();
      arr.reverse();
      expect(arr[0]).assertEqual(136);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_3600
     * @tc.name testUint16Arrayreverse01036
     * @tc.desc Verify chained reverse calls restore a three-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([47, 57, 67]);
      arr.reverse().reverse();
      expect(arr[0]).assertEqual(67);
      expect(arr[1]).assertEqual(57);
      expect(arr[2]).assertEqual(47);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_3700
     * @tc.name testUint16Arrayreverse01037
     * @tc.desc Verify chained reverse calls preserve Uint16 boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([0, 65535, 32768, 38]);
      arr.reverse().reverse();
      expect(arr[0]).assertEqual(38);
      expect(arr[1]).assertEqual(32768);
      expect(arr[2]).assertEqual(65535);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_3800
     * @tc.name testUint16Arrayreverse01038
     * @tc.desc Verify reversal preserves Uint16 conversions of overflow and nonfinite inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([65536, -1, 3.14, Number.NaN, Number.POSITIVE_INFINITY]);
      arr.reverse();
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(65535);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_3900
     * @tc.name testUint16Arrayreverse01039
     * @tc.desc Verify reversal preserves truncation of oversized radix literals
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([0x10000, 0xFFFF, 0o200000, 0b10000000000000000]);
      arr.reverse();
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(65535);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_4000
     * @tc.name testUint16Arrayreverse01040
     * @tc.desc Verify reversal retains wrapped negative and fractional Uint16 conversions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([-65535, -65536, -32768, 65535.9, -0.5]);
      arr.reverse();
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(65535);
      expect(arr[2]).assertEqual(32768);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_4100
     * @tc.name testUint16Arrayreverse01041
     * @tc.desc Verify reversal is visible through a sibling full-buffer view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40, 41]);
      let buf: ArrayBuffer = arr.buffer;
      let view: Uint16Array = new Uint16Array(buf);
      arr.reverse();
      expect(view[0]).assertEqual(4);
      expect(view[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_4200
     * @tc.name testUint16Arrayreverse01042
     * @tc.desc Verify writes through the returned array update the original array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40]);
      let result: Uint16Array = arr.reverse();
      result[0] = 99;
      expect(arr[0]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_4300
     * @tc.name testUint16Arrayreverse01043
     * @tc.desc Verify writes through the original array update the returned array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40]);
      let result: Uint16Array = arr.reverse();
      arr[1] = 88;
      expect(result[1]).assertEqual(39);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_4400
     * @tc.name testUint16Arrayreverse01044
     * @tc.desc Verify reversal reorders values assigned to a length-constructed array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr.reverse();
      expect(arr[0]).assertEqual(30);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_4500
     * @tc.name testUint16Arrayreverse01045
     * @tc.desc Verify reversal reorders an array created with Uint16Array.of
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(42, 47, 52, 57);
      arr.reverse();
      expect(arr[0]).assertEqual(57);
      expect(arr[1]).assertEqual(52);
      expect(arr[2]).assertEqual(47);
      expect(arr[3]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_4600
     * @tc.name testUint16Arrayreverse01046
     * @tc.desc Verify reversal reorders an array created with Uint16Array.from
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.from([100, 200, 300]);
      arr.reverse();
      expect(arr[0]).assertEqual(300);
      expect(arr[1]).assertEqual(200);
      expect(arr[2]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_4700
     * @tc.name testUint16Arrayreverse01047
     * @tc.desc Verify reversal affects a copy constructed from another Uint16Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = new Uint16Array([44, 45, 46]);
      let arr: Uint16Array = new Uint16Array(src);
      arr.reverse();
      expect(arr[0]).assertEqual(46);
      expect(arr[1]).assertEqual(45);
      expect(arr[2]).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_4800
     * @tc.name testUint16Arrayreverse01048
     * @tc.desc Verify reverse reorders hexadecimal Uint16 boundary literals
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([0, 32768, 65535]);
      arr.reverse();
      expect(arr[0]).assertEqual(65535);
      expect(arr[1]).assertEqual(32768);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_4900
     * @tc.name testUint16Arrayreverse01049
     * @tc.desc Verify reverse reorders binary Uint16 boundary literals
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([0b0, 0b1, 0b1111111111111111]);
      arr.reverse();
      expect(arr[0]).assertEqual(65535);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_5000
     * @tc.name testUint16Arrayreverse01050
     * @tc.desc Verify reverse reorders octal Uint16 boundary literals
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([0o0, 0o100000, 0o177777]);
      arr.reverse();
      expect(arr[0]).assertEqual(65535);
      expect(arr[1]).assertEqual(32768);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_5100
     * @tc.name testUint16Arrayreverse01051
     * @tc.desc Verify reverse preserves scientific-notation Uint16 conversions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([0e0, 1e0, 6.5535e4]);
      arr.reverse();
      expect(arr[0]).assertEqual(65535);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_5200
     * @tc.name testUint16Arrayreverse01052
     * @tc.desc Verify reverse preserves mixed numeric literal conversions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([0xFF, 0b1010, 0o77, 100]);
      arr.reverse();
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(63);
      expect(arr[2]).assertEqual(10);
      expect(arr[3]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_5300
     * @tc.name testUint16Arrayreverse01053
     * @tc.desc Verify reversing a subarray mutates only its source range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40, 41, 42]);
      let sub: Uint16Array = arr.subarray(1, 4);
      sub.reverse();
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_5400
     * @tc.name testUint16Arrayreverse01054
     * @tc.desc Verify reversing the source updates an overlapping subarray view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40, 41, 42]);
      let sub: Uint16Array = arr.subarray(1, 4);
      arr.reverse();
      expect(sub[0]).assertEqual(4);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_5500
     * @tc.name testUint16Arrayreverse01055
     * @tc.desc Verify reversal is visible through an independently created buffer view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40, 41]);
      let view1: Uint16Array = new Uint16Array(arr.buffer);
      arr.reverse();
      expect(view1[0]).assertEqual(4);
      expect(view1[1]).assertEqual(3);
      expect(view1[2]).assertEqual(2);
      expect(view1[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_5600
     * @tc.name testUint16Arrayreverse01056
     * @tc.desc Verify reversing an offset subarray retains its byte offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([47, 57, 67, 77, 87]);
      let sub: Uint16Array = arr.subarray(2);
      expect(sub.byteOffset).assertEqual(4);
      sub.reverse();
      expect(sub.byteOffset).assertEqual(4);
      expect(sub[0]).assertEqual(50);
      expect(sub[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_5700
     * @tc.name testUint16Arrayreverse01057
     * @tc.desc Verify indexed access reports both ends after reversal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40, 41]);
      arr.reverse();
      expect(arr.at(0)).assertEqual(4);
      expect(arr.at(-1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_5800
     * @tc.name testUint16Arrayreverse01058
     * @tc.desc Verify iteration yields values in the reversed order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40]);
      arr.reverse();
      let values: number[] = [];
      for (let v of arr) {
        values.push(v);
      }
      expect(values[0]).assertEqual(3);
      expect(values[1]).assertEqual(2);
      expect(values[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_5900
     * @tc.name testUint16Arrayreverse01059
     * @tc.desc Verify forEach visits every value in the reversed order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([47, 57, 67, 77]);
      arr.reverse();
      let idx: int = 0;
      let expected: number[] = [40, 30, 20, 10];
      arr.forEach((val: number) => {
        expect(val).assertEqual(expected[idx]);
        idx++;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_6000
     * @tc.name testUint16Arrayreverse01060
     * @tc.desc Verify fill overwrites every position after reversal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40, 41]);
      arr.reverse();
      arr.fill(99);
      expect(arr[0]).assertEqual(41);
      expect(arr[1]).assertEqual(40);
      expect(arr[2]).assertEqual(39);
      expect(arr[3]).assertEqual(38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_6100
     * @tc.name testUint16Arrayreverse01061
     * @tc.desc Verify reversal swaps separately filled array regions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(4);
      arr.fill(10, 0, 2);
      arr.fill(20, 2, 4);
      arr.reverse();
      expect(arr[0]).assertEqual(20);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(10);
      expect(arr[3]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_6200
     * @tc.name testUint16Arrayreverse01062
     * @tc.desc Verify copyWithin operates on the reordered elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40, 41, 42]);
      arr.reverse();
      arr.copyWithin(0, 2, 4);
      expect(arr[0]).assertEqual(42);
      expect(arr[1]).assertEqual(41);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_6300
     * @tc.name testUint16Arrayreverse01063
     * @tc.desc Verify reversal reorders values inserted with set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40]);
      let src: Uint16Array = new Uint16Array([47, 57]);
      arr.set(src, 1);
      arr.reverse();
      expect(arr[0]).assertEqual(40);
      expect(arr[1]).assertEqual(39);
      expect(arr[2]).assertEqual(38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_6400
     * @tc.name testUint16Arrayreverse01064
     * @tc.desc Verify slice copies the leading segment after reversal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40, 41]);
      arr.reverse();
      let sliced: Uint16Array = arr.slice(0, 2);
      expect(sliced[0]).assertEqual(4);
      expect(sliced[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_6500
     * @tc.name testUint16Arrayreverse01065
     * @tc.desc Verify reversing a middle subarray updates its complete source window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40, 41, 42, 43]);
      let sub: Uint16Array = arr.subarray(1, 5);
      sub.reverse();
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(4);
      expect(arr[3]).assertEqual(3);
      expect(arr[4]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_6600
     * @tc.name testUint16Arrayreverse01066
     * @tc.desc Verify source reversal updates disjoint subarray views
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40, 41]);
      let v1: Uint16Array = arr.subarray(0, 2);
      let v2: Uint16Array = arr.subarray(2, 4);
      arr.reverse();
      expect(v1[0]).assertEqual(4);
      expect(v1[1]).assertEqual(3);
      expect(v2[0]).assertEqual(2);
      expect(v2[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_6700
     * @tc.name testUint16Arrayreverse01067
     * @tc.desc Verify indexOf reports positions in the reversed ordering
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([47, 57, 67, 77]);
      arr.reverse();
      expect(arr.indexOf(10)).assertEqual(3);
      expect(arr.indexOf(40)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_6800
     * @tc.name testUint16Arrayreverse01068
     * @tc.desc Verify reverse() changes ascending values to descending order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40, 41]);
      arr.reverse();
      expect(arr.join(',')).assertEqual('4,3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_6900
     * @tc.name testUint16Arrayreverse01069
     * @tc.desc Verify reverse() changes descending values to ascending order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([41, 40, 39, 38]);
      arr.reverse();
      expect(arr.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_7000
     * @tc.name testUint16Arrayreverse01070
     * @tc.desc Verify reduceRight traverses the reversed array from its new end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40]);
      arr.reverse();
      let parts: number[] = [];
      arr.reduceRight((acc: number, cur: number): number => {
        parts.push(cur);
        return acc + cur;
      }, 0);
      expect(parts[0]).assertEqual(1);
      expect(parts[1]).assertEqual(2);
      expect(parts[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_7100
     * @tc.name testUint16Arrayreverse01071
     * @tc.desc Verify filter retains qualifying values in reversed encounter order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([42, 47, 52, 57]);
      arr.reverse();
      let filtered: Uint16Array = arr.filter((v: number): boolean => v > 10);
      expect(filtered[0]).assertEqual(20);
      expect(filtered[1]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_7200
     * @tc.name testUint16Arrayreverse01072
     * @tc.desc Verify map transforms values while retaining reversed encounter order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40]);
      arr.reverse();
      let mapped: Uint16Array = arr.map((v: number): number => v * 2);
      expect(mapped[0]).assertEqual(6);
      expect(mapped[1]).assertEqual(4);
      expect(mapped[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_7300
     * @tc.name testUint16Arrayreverse01073
     * @tc.desc Verify find returns the first qualifying value after reversal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40, 41]);
      arr.reverse();
      let found: number | undefined = arr.find((v: number): boolean => v > 2);
      expect(found).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_7400
     * @tc.name testUint16Arrayreverse01074
     * @tc.desc Verify findIndex reports the reordered position of a matching value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40, 41]);
      arr.reverse();
      let idx: number = arr.findIndex((v: number): boolean => v === 2);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_7500
     * @tc.name testUint16Arrayreverse01075
     * @tc.desc Verify entries pairs index zero with the new leading value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([47, 57, 67]);
      arr.reverse();
      let entries: IterableIterator<[int, number]> = arr.entries();
      let first: [int, number] = entries.next().value as [int, number];
      expect(first[0]).assertEqual(0);
      expect(first[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_7600
     * @tc.name testUint16Arrayreverse01076
     * @tc.desc Verify keys remain sequential after element reordering
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([47, 57, 67]);
      arr.reverse();
      let keys: IterableIterator<int> = arr.keys();
      let k0: int = keys.next().value as int;
      let k1: int = keys.next().value as int;
      let k2: int = keys.next().value as int;
      expect(k0).assertEqual(0);
      expect(k1).assertEqual(1);
      expect(k2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_7700
     * @tc.name testUint16Arrayreverse01077
     * @tc.desc Verify values iteration follows the reversed element order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40]);
      arr.reverse();
      let vals: IterableIterator<Number> = arr.values();
      expect(vals.next().value).assertEqual(3);
      expect(vals.next().value).assertEqual(2);
      expect(vals.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_7800
     * @tc.name testUint16Arrayreverse01078
     * @tc.desc Verify three reversals produce the reversed odd-length order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40, 41, 42]);
      arr.reverse();
      arr.reverse();
      arr.reverse();
      expect(arr[0]).assertEqual(42);
      expect(arr[1]).assertEqual(41);
      expect(arr[2]).assertEqual(40);
      expect(arr[3]).assertEqual(39);
      expect(arr[4]).assertEqual(38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_7900
     * @tc.name testUint16Arrayreverse01079
     * @tc.desc Verify join serializes elements in their reversed order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([38, 39, 40]);
      arr.reverse();
      let str: string = arr.join(",");
      expect(str).assertEqual("3,2,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_REVERSE01_8000
     * @tc.name testUint16Arrayreverse01080
     * @tc.desc Verify toLocaleString serializes reversed elements in order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayreverse01080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array([137, 237, 337]);
      arr.reverse();
      let str: string = arr.toLocaleString();
      expect(str).assertEqual("300,200,100");
    });

  });
}
