'use static'


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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
import Utils from './../Util.test';

export default function biguint64arrayConstructorTest(): void {

  describe('BigUint64ArrayConstructorTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0010
     * @tc.name testBigUint64ArrayConstructor001
     * @tc.desc Verify no-arg constructor creates empty array with length 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0020
     * @tc.name testBigUint64ArrayConstructor002
     * @tc.desc Verify no-arg constructor byteLength and byteOffset are 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array();
      expect(arr.byteLength).assertEqual(0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0030
     * @tc.name testBigUint64ArrayConstructor003
     * @tc.desc Verify no-arg constructor BYTES_PER_ELEMENT is 8 and name is BigUint64Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array();
      expect(arr.BYTES_PER_ELEMENT).assertEqual(8);
      expect(arr.name).assertEqual('BigUint64Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0040
     * @tc.name testBigUint64ArrayConstructor004
     * @tc.desc Verify no-arg constructor toString returns empty string and buffer exists
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array();
      expect(arr.toString()).assertEqual('');
      expect(arr.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0050
     * @tc.name testBigUint64ArrayConstructor005
     * @tc.desc Verify two no-arg constructions produce different instances with different buffers
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr1 = new BigUint64Array();
      let arr2 = new BigUint64Array();
      expect(arr1 !== arr2).assertTrue();
      expect(arr1.buffer !== arr2.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0060
     * @tc.name testBigUint64ArrayConstructor006
     * @tc.desc Verify int length 0 creates empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array(0 as int);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0070
     * @tc.name testBigUint64ArrayConstructor007
     * @tc.desc Verify int length 1 creates single-element array with default 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array(1 as int);
      expect(arr.length).assertEqual(1);
      expect(arr.byteLength).assertEqual(8);
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0080
     * @tc.name testBigUint64ArrayConstructor008
     * @tc.desc Verify int length 5 creates array with all elements default 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array(5 as int);
      expect(arr.length).assertEqual(5);
      expect(arr.byteLength).assertEqual(40);
      expect(arr[0]).assertEqual(0n);
      expect(arr[2]).assertEqual(0n);
      expect(arr[4]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0090
     * @tc.name testBigUint64ArrayConstructor009
     * @tc.desc Verify int length 100 creates large array correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array(100 as int);
      expect(arr.length).assertEqual(100);
      expect(arr.byteLength).assertEqual(800);
      expect(arr[0]).assertEqual(0n);
      expect(arr[99]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0100
     * @tc.name testBigUint64ArrayConstructor010
     * @tc.desc Verify int length array supports read-write via subscript
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array(3 as int);
      arr[0] = 42n;
      arr[1] = 999n;
      expect(arr[0]).assertEqual(42n);
      expect(arr[1]).assertEqual(999n);
      expect(arr[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0110
     * @tc.name testBigUint64ArrayConstructor011
     * @tc.desc Verify number length 0 creates empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array(0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0120
     * @tc.name testBigUint64ArrayConstructor012
     * @tc.desc Verify number length 3 creates array with default 0n elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(0n);
      expect(arr[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0130
     * @tc.name testBigUint64ArrayConstructor013
     * @tc.desc Verify number length 100 with correct length and byteLength
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array(100);
      expect(arr.length).assertEqual(100);
      expect(arr.byteLength).assertEqual(800);
      expect(arr[0]).assertEqual(0n);
      expect(arr[99]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0140
     * @tc.name testBigUint64ArrayConstructor014
     * @tc.desc Verify number length float 2.5 truncates to 2 and creates 2-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array(2.5);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0150
     * @tc.name testBigUint64ArrayConstructor015
     * @tc.desc Verify number length float 1.999 truncates to 1 (no rounding)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array(1.999);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0160
     * @tc.name testBigUint64ArrayConstructor016
     * @tc.desc Verify number length float 0.5 truncates to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array(0.5);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0170
     * @tc.name testBigUint64ArrayConstructor017
     * @tc.desc Verify empty FixedArray<BigInt> creates empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let numbers: FixedArray<BigInt> = [];
      let arr = new BigUint64Array(numbers);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0180
     * @tc.name testBigUint64ArrayConstructor018
     * @tc.desc Verify FixedArray<BigInt> [1n] creates single-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let numbers: FixedArray<BigInt> = [1n];
      let arr = new BigUint64Array(numbers);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0190
     * @tc.name testBigUint64ArrayConstructor019
     * @tc.desc Verify FixedArray<BigInt> [1n, 2n, 3n] preserves all elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let numbers: FixedArray<BigInt> = [1n, 2n, 3n];
      let arr = new BigUint64Array(numbers);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0200
     * @tc.name testBigUint64ArrayConstructor020
     * @tc.desc Verify FixedArray<BigInt> with MAX uint64 value preserves it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let numbers: FixedArray<BigInt> = [18446744073709551615n];
      let arr = new BigUint64Array(numbers);
      expect(arr[0]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0210
     * @tc.name testBigUint64ArrayConstructor021
     * @tc.desc Verify FixedArray<BigInt> with 2^64 overflows wraps to 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let numbers: FixedArray<BigInt> = [18446744073709551616n];
      let arr = new BigUint64Array(numbers);
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0220
     * @tc.name testBigUint64ArrayConstructor022
     * @tc.desc Verify FixedArray<BigInt> [-1n] wraps to MAX uint64
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let numbers: FixedArray<BigInt> = [-1n];
      let arr = new BigUint64Array(numbers);
      expect(arr[0]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0230
     * @tc.name testBigUint64ArrayConstructor023
     * @tc.desc Verify FixedArray<BigInt> mix [0n, MAX] preserves order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let numbers: FixedArray<BigInt> = [0n, 18446744073709551615n];
      let arr = new BigUint64Array(numbers);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0240
     * @tc.name testBigUint64ArrayConstructor024
     * @tc.desc Verify empty Array<BigInt> creates empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<BigInt> = [];
      let arr = new BigUint64Array(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0250
     * @tc.name testBigUint64ArrayConstructor025
     * @tc.desc Verify Array<BigInt> [1n] creates single-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([1n]);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0260
     * @tc.name testBigUint64ArrayConstructor026
     * @tc.desc Verify Array<BigInt> [1n, 2n, 3n] preserves all elements and byteLength
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([1n, 2n, 3n]);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(24);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0270
     * @tc.name testBigUint64ArrayConstructor027
     * @tc.desc Verify Array<BigInt> [MAX] preserves uint64 max
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([18446744073709551615n]);
      expect(arr[0]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0280
     * @tc.name testBigUint64ArrayConstructor028
     * @tc.desc Verify Array<BigInt> [-1n] wraps to MAX
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([-1n]);
      expect(arr[0]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0290
     * @tc.name testBigUint64ArrayConstructor029
     * @tc.desc Verify Array<BigInt> [MAX+1] wraps to 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([18446744073709551616n]);
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0300
     * @tc.name testBigUint64ArrayConstructor030
     * @tc.desc Verify modifying source Array<BigInt> after construction does not affect BigUint64Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<BigInt> = [1n, 2n];
      let arr = new BigUint64Array(src);
      src[0] = 99n;
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0310
     * @tc.name testBigUint64ArrayConstructor031
     * @tc.desc Verify Set<BigInt> constructs array preserving insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s: Set<BigInt> = new Set<BigInt>();
      s.add(10n);
      s.add(20n);
      s.add(30n);
      let arr = new BigUint64Array(s);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0320
     * @tc.name testBigUint64ArrayConstructor032
     * @tc.desc Verify empty Set<BigInt> creates empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s: Set<BigInt> = new Set<BigInt>();
      let arr = new BigUint64Array(s);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0330
     * @tc.name testBigUint64ArrayConstructor033
     * @tc.desc Verify BigUint64Array.values() as Iterable source preserves values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = BigUint64Array.of(42n, 99n, 7n);
      let arr = new BigUint64Array(src.values());
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(42n);
      expect(arr[1]).assertEqual(99n);
      expect(arr[2]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0340
     * @tc.name testBigUint64ArrayConstructor034
     * @tc.desc Verify Set<BigInt> with single MAX element preserves it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s: Set<BigInt> = new Set<BigInt>();
      s.add(18446744073709551615n);
      let arr = new BigUint64Array(s);
      expect(arr[0]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0350
     * @tc.name testBigUint64ArrayConstructor035
     * @tc.desc Verify copy constructor from empty source creates empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = new BigUint64Array(0);
      let copy = new BigUint64Array(src);
      expect(copy.length).assertEqual(0);
      expect(copy.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0360
     * @tc.name testBigUint64ArrayConstructor036
     * @tc.desc Verify copy constructor preserves length and all element values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = BigUint64Array.of(10n, 20n, 30n);
      let copy = new BigUint64Array(src);
      expect(copy.length).assertEqual(3);
      expect(copy[0]).assertEqual(10n);
      expect(copy[1]).assertEqual(20n);
      expect(copy[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0370
     * @tc.name testBigUint64ArrayConstructor037
     * @tc.desc Verify copy constructor produces independent buffer (modifying copy does not affect source)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = BigUint64Array.of(10n);
      let copy = new BigUint64Array(src);
      copy[0] = 99n;
      expect(src[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0380
     * @tc.name testBigUint64ArrayConstructor038
     * @tc.desc Verify copy constructor produces independent buffer (modifying source does not affect copy)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = BigUint64Array.of(10n);
      let copy = new BigUint64Array(src);
      src[0] = 99n;
      expect(copy[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0390
     * @tc.name testBigUint64ArrayConstructor039
     * @tc.desc Verify copy constructor buffer differs from source buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = BigUint64Array.of(0n);
      let copy = new BigUint64Array(src);
      expect(copy.buffer !== src.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0400
     * @tc.name testBigUint64ArrayConstructor040
     * @tc.desc Verify copy constructor from assigned source preserves assigned values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = new BigUint64Array(2);
      src[0] = 999n;
      let copy = new BigUint64Array(src);
      expect(copy[0]).assertEqual(999n);
      expect(copy[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0410
     * @tc.name testBigUint64ArrayConstructor041
     * @tc.desc Verify copy constructor from subarray view preserves view element values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let base = BigUint64Array.of(10n, 20n, 30n);
      let sub = base.subarray(1);
      let copy = new BigUint64Array(sub);
      expect(copy.length).assertEqual(2);
      expect(copy[0]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0420
     * @tc.name testBigUint64ArrayConstructor042
     * @tc.desc Verify two copies from same source are independent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = BigUint64Array.of(10n);
      let copy1 = new BigUint64Array(src);
      let copy2 = new BigUint64Array(src);
      copy1[0] = 99n;
      expect(copy2[0]).assertEqual(10n);
      expect(copy1.buffer !== copy2.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0430
     * @tc.name testBigUint64ArrayConstructor043
     * @tc.desc Verify ArrayBuffer(8) with byteOffset=0 creates 1-element view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(8);
      let arr = new BigUint64Array(buf, 0);
      expect(arr.length).assertEqual(1);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0440
     * @tc.name testBigUint64ArrayConstructor044
     * @tc.desc Verify ArrayBuffer(16) with byteOffset=8 creates 1-element view at offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(16);
      let arr = new BigUint64Array(buf, 8);
      expect(arr.length).assertEqual(1);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0450
     * @tc.name testBigUint64ArrayConstructor045
     * @tc.desc Verify ArrayBuffer(24) with byteOffset=16 creates 1-element view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(24);
      let arr = new BigUint64Array(buf, 16);
      expect(arr.length).assertEqual(1);
      expect(arr.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0460
     * @tc.name testBigUint64ArrayConstructor046
     * @tc.desc Verify ArrayBuffer(0)+offset=0 creates empty view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(0);
      let arr = new BigUint64Array(buf, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0470
     * @tc.name testBigUint64ArrayConstructor047
     * @tc.desc Verify buffer view elements default to 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(24);
      let arr = new BigUint64Array(buf, 0);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(0n);
      expect(arr[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0480
     * @tc.name testBigUint64ArrayConstructor048
     * @tc.desc Verify buffer reference is same as passed ArrayBuffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(16);
      let arr = new BigUint64Array(buf, 0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0490
     * @tc.name testBigUint64ArrayConstructor049
     * @tc.desc Verify ArrayBuffer(16) with number byteOffset 0.0 creates 2-element view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(16);
      let arr = new BigUint64Array(buf, 0.0);
      expect(arr.length).assertEqual(2);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0500
     * @tc.name testBigUint64ArrayConstructor050
     * @tc.desc Verify ArrayBuffer(24) with number byteOffset 8.0 creates view at offset 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(24);
      let arr = new BigUint64Array(buf, 8.0);
      expect(arr.length).assertEqual(2);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0510
     * @tc.name testBigUint64ArrayConstructor051
     * @tc.desc Verify number byteOffset 8.7 truncates to 8 and creates view at offset 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(24);
      let arr = new BigUint64Array(buf, 8.7);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0520
     * @tc.name testBigUint64ArrayConstructor052
     * @tc.desc Verify number byteOffset 0.999 truncates to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(16);
      let arr = new BigUint64Array(buf, 0.999);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0530
     * @tc.name testBigUint64ArrayConstructor053
     * @tc.desc Verify buffer+int byteOffset+int length creates view with specified length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(16);
      let arr = new BigUint64Array(buf, 0, 2);
      expect(arr.length).assertEqual(2);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0540
     * @tc.name testBigUint64ArrayConstructor054
     * @tc.desc Verify buffer+int byteOffset 8+length 1 creates offset view with single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(24);
      let arr = new BigUint64Array(buf, 8, 1);
      expect(arr.length).assertEqual(1);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0550
     * @tc.name testBigUint64ArrayConstructor055
     * @tc.desc Verify buffer+offset 8+length 0 creates zero-length view with non-zero offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(16);
      let arr = new BigUint64Array(buf, 8, 0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteOffset).assertEqual(8);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0560
     * @tc.name testBigUint64ArrayConstructor056
     * @tc.desc Verify buffer+offset 8+length 1 on 16-byte buf fills remaining space exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(16);
      let arr = new BigUint64Array(buf, 8, 1);
      expect(arr.length).assertEqual(1);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0570
     * @tc.name testBigUint64ArrayConstructor057
     * @tc.desc Verify ArrayBuffer(32) with int byteOffset 0 and length 4 creates full view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(32);
      let arr = new BigUint64Array(buf, 0, 4);
      expect(arr.length).assertEqual(4);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0580
     * @tc.name testBigUint64ArrayConstructor058
     * @tc.desc Verify ArrayBuffer(40) with byteOffset 8 and length 4 creates mid-buffer view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(40);
      let arr = new BigUint64Array(buf, 8, 4);
      expect(arr.length).assertEqual(4);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0590
     * @tc.name testBigUint64ArrayConstructor059
     * @tc.desc Verify buffer view byteLength equals length times 8 for non-zero offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(24);
      let arr = new BigUint64Array(buf, 8, 2);
      expect(arr.byteLength).assertEqual(16);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0600
     * @tc.name testBigUint64ArrayConstructor060
     * @tc.desc Verify buffer offset 16 with length 1 on 24-byte buf creates tail view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(24);
      let arr = new BigUint64Array(buf, 16, 1);
      expect(arr.length).assertEqual(1);
      expect(arr.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0610
     * @tc.name testBigUint64ArrayConstructor061
     * @tc.desc Verify buffer view offset 0 length 3 covers entire 24-byte buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(24);
      let arr = new BigUint64Array(buf, 0, 3);
      expect(arr.length).assertEqual(3);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0620
     * @tc.name testBigUint64ArrayConstructor062
     * @tc.desc Verify buffer offset 8 with length 0 creates zero-length view with non-zero offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(16);
      let arr = new BigUint64Array(buf, 8, 0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0630
     * @tc.name testBigUint64ArrayConstructor063
     * @tc.desc Verify single ArrayBuffer(16) param creates 2-element view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(16);
      let arr = new BigUint64Array(buf);
      expect(arr.length).assertEqual(2);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0640
     * @tc.name testBigUint64ArrayConstructor064
     * @tc.desc Verify single ArrayBuffer(8) creates 1-element view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array(new ArrayBuffer(8));
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0650
     * @tc.name testBigUint64ArrayConstructor065
     * @tc.desc Verify single ArrayBuffer(0) creates empty view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array(new ArrayBuffer(0));
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0660
     * @tc.name testBigUint64ArrayConstructor066
     * @tc.desc Verify Array<number> as ArrayLike<Number> converts to BigInt elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<number> = [1, 2, 3];
      let arr = new BigUint64Array(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0670
     * @tc.name testBigUint64ArrayConstructor067
     * @tc.desc Verify Array<number> with large positive integer 2147483647 converts to BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<number> = [2147483647];
      let arr = new BigUint64Array(src);
      expect(arr[0]).assertEqual(2147483647n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0680
     * @tc.name testBigUint64ArrayConstructor068
     * @tc.desc Verify Array<number> with -1 wraps to MAX uint64
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<number> = [-1];
      let arr = new BigUint64Array(src);
      expect(arr[0]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0690
     * @tc.name testBigUint64ArrayConstructor069
     * @tc.desc Verify FixedArray<number> [0, 1, 42] converts elements to BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [0, 1, 42];
      let arr = new BigUint64Array(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(1n);
      expect(arr[2]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0700
     * @tc.name testBigUint64ArrayConstructor070
     * @tc.desc Verify FixedArray<number> with mixed integers converts all to BigInt correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [0, 42, 255];
      let arr = new BigUint64Array(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(42n);
      expect(arr[2]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0710
     * @tc.name testBigUint64ArrayConstructor071
     * @tc.desc Verify FixedArray<number> [-1] wraps to MAX uint64
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [-1];
      let arr = new BigUint64Array(src);
      expect(arr[0]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0720
     * @tc.name testBigUint64ArrayConstructor072
     * @tc.desc Verify FixedArray<number> [-42] wraps to 2^64-42
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [-42];
      let arr = new BigUint64Array(src);
      expect(arr[0]).assertEqual(18446744073709551574n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0730
     * @tc.name testBigUint64ArrayConstructor073
     * @tc.desc Verify FixedArray<number> with MAX_SAFE_INTEGER preserves value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [9007199254740991];
      let arr = new BigUint64Array(src);
      expect(arr[0]).assertEqual(9007199254740991n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0740
     * @tc.name testBigUint64ArrayConstructor074
     * @tc.desc Verify BYTES_PER_ELEMENT is 8 across all overload types
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr1 = new BigUint64Array();
      let arr2 = new BigUint64Array(3 as int);
      let buf = new ArrayBuffer(16);
      let arr3 = new BigUint64Array(buf, 0, 2);
      expect(arr1.BYTES_PER_ELEMENT).assertEqual(8);
      expect(arr2.BYTES_PER_ELEMENT).assertEqual(8);
      expect(arr3.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0750
     * @tc.name testBigUint64ArrayConstructor075
     * @tc.desc Verify name is BigUint64Array across all overload types
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr1 = new BigUint64Array();
      let arr2 = new BigUint64Array(1 as int);
      let src: FixedArray<BigInt> = [1n];
      let arr3 = new BigUint64Array(src);
      let buf = new ArrayBuffer(8);
      let arr4 = new BigUint64Array(buf);
      expect(arr1.name).assertEqual('BigUint64Array');
      expect(arr2.name).assertEqual('BigUint64Array');
      expect(arr3.name).assertEqual('BigUint64Array');
      expect(arr4.name).assertEqual('BigUint64Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0760
     * @tc.name testBigUint64ArrayConstructor076
     * @tc.desc Verify non-buffer overloads all have byteOffset 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr1 = new BigUint64Array();
      let arr2 = new BigUint64Array(5 as int);
      let lenNum: number = 4.0;
      let arr3 = new BigUint64Array(lenNum);
      let src = new BigUint64Array(3);
      let arr4 = new BigUint64Array(src);
      let fa: FixedArray<BigInt> = [1n, 2n];
      let arr5 = new BigUint64Array(fa);
      let aa: Array<BigInt> = [1n, 2n, 3n];
      let arr6 = new BigUint64Array(aa);
      expect(arr1.byteOffset).assertEqual(0);
      expect(arr2.byteOffset).assertEqual(0);
      expect(arr3.byteOffset).assertEqual(0);
      expect(arr4.byteOffset).assertEqual(0);
      expect(arr5.byteOffset).assertEqual(0);
      expect(arr6.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0770
     * @tc.name testBigUint64ArrayConstructor077
     * @tc.desc Verify int length 3 and number length 3.0 produce equivalent arrays
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arrInt = new BigUint64Array(3 as int);
      let lenNum: number = 3.0;
      let arrNum = new BigUint64Array(lenNum);
      expect(arrInt.length).assertEqual(arrNum.length);
      expect(arrInt.byteLength).assertEqual(arrNum.byteLength);
      expect(arrInt[0]).assertEqual(arrNum[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0780
     * @tc.name testBigUint64ArrayConstructor078
     * @tc.desc Verify FixedArray<BigInt> and Array<BigInt> produce same content from same values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: FixedArray<BigInt> = [1n, 2n];
      let aa: Array<BigInt> = [1n, 2n];
      let arrFA = new BigUint64Array(fa);
      let arrAA = new BigUint64Array(aa);
      expect(arrFA.length).assertEqual(arrAA.length);
      expect(arrFA[0]).assertEqual(arrAA[0]);
      expect(arrFA[1]).assertEqual(arrAA[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0790
     * @tc.name testBigUint64ArrayConstructor079
     * @tc.desc Verify single-param ArrayBuffer and two-param buf+int 0 produce equivalent views
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf1 = new ArrayBuffer(16);
      let buf2 = new ArrayBuffer(16);
      let arr1 = new BigUint64Array(buf1);
      let arr2 = new BigUint64Array(buf2, 0);
      expect(arr1.length).assertEqual(arr2.length);
      expect(arr1.byteOffset).assertEqual(arr2.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0800
     * @tc.name testBigUint64ArrayConstructor080
     * @tc.desc Verify buffer+int 0+2 and single-param buffer produce equivalent length and byteOffset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf1 = new ArrayBuffer(16);
      let buf2 = new ArrayBuffer(16);
      let arrInt = new BigUint64Array(buf1, 0, 2);
      let arrSingle = new BigUint64Array(buf2);
      expect(arrInt.length).assertEqual(arrSingle.length);
      expect(arrInt.byteOffset).assertEqual(arrSingle.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0810
     * @tc.name testBigUint64ArrayConstructor081
     * @tc.desc Verify constructor overload results expose expected length and byteLength
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr1 = new BigUint64Array();
      let arr2 = new BigUint64Array(3 as int);
      let arr3 = new BigUint64Array([1n]);
      let buf = new ArrayBuffer(16);
      let arr4 = new BigUint64Array(buf, 0, 2);
      expect(arr1.length).assertEqual(0);
      expect(arr2.byteLength).assertEqual(24);
      expect(arr3[0]).assertEqual(1n);
      expect(arr4.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0820
     * @tc.name testBigUint64ArrayConstructor082
     * @tc.desc Verify byteLength always equals length times 8 across overloads
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arrI = new BigUint64Array(4 as int);
      let arrA = new BigUint64Array([1n, 2n, 3n, 4n]);
      let buf = new ArrayBuffer(32);
      let arrB = new BigUint64Array(buf, 0, 4);
      expect(arrI.byteLength).assertEqual(32);
      expect(arrA.byteLength).assertEqual(32);
      expect(arrB.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0830
     * @tc.name testBigUint64ArrayConstructor083
     * @tc.desc Verify overflow values wrap consistently: 2^64 to 0n across Array and FixedArray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let overflow: bigint = 18446744073709551616n;
      let aa: Array<BigInt> = [overflow];
      let fa: FixedArray<BigInt> = [overflow];
      let arrAA = new BigUint64Array(aa);
      let arrFA = new BigUint64Array(fa);
      expect(arrAA[0]).assertEqual(0n);
      expect(arrFA[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0840
     * @tc.name testBigUint64ArrayConstructor084
     * @tc.desc Verify -1n wraps to MAX consistently across Array, FixedArray, and copy constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let aa: Array<BigInt> = [-1n];
      let fa: FixedArray<BigInt> = [-1n];
      let src = new BigUint64Array(1);
      src[0] = -1n;
      let arrAA = new BigUint64Array(aa);
      let arrFA = new BigUint64Array(fa);
      let arrCP = new BigUint64Array(src);
      let expected: bigint = 18446744073709551615n;
      expect(arrAA[0]).assertEqual(expected);
      expect(arrFA[0]).assertEqual(expected);
      expect(arrCP[0]).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0850
     * @tc.name testBigUint64ArrayConstructor085
     * @tc.desc Verify 2^64+1 wraps to 1n via modulo arithmetic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let numbers: FixedArray<BigInt> = [18446744073709551617n];
      let arr = new BigUint64Array(numbers);
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0860
     * @tc.name testBigUint64ArrayConstructor086
     * @tc.desc Verify -42n wraps to 2^64-42
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let numbers: FixedArray<BigInt> = [-42n];
      let arr = new BigUint64Array(numbers);
      expect(arr[0]).assertEqual(18446744073709551574n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0870
     * @tc.name testBigUint64ArrayConstructor087
     * @tc.desc Verify multiple overflow values each wrap independently
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new BigUint64Array([18446744073709551616n, -1n, 0n]);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(18446744073709551615n);
      expect(arr[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0880
     * @tc.name testBigUint64ArrayConstructor088
     * @tc.desc Verify MAX value preserved across Array, FixedArray, and copy constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxVal: bigint = 18446744073709551615n;
      let aa: Array<BigInt> = [maxVal];
      let fa: FixedArray<BigInt> = [maxVal];
      let src = new BigUint64Array(1);
      src[0] = maxVal;
      let arrAA = new BigUint64Array(aa);
      let arrFA = new BigUint64Array(fa);
      let arrCP = new BigUint64Array(src);
      expect(arrAA[0]).assertEqual(maxVal);
      expect(arrFA[0]).assertEqual(maxVal);
      expect(arrCP[0]).assertEqual(maxVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0890
     * @tc.name testBigUint64ArrayConstructor089
     * @tc.desc Verify two buffer views on same buffer share data (write via one visible to other)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(16);
      let arr1 = new BigUint64Array(buf, 0, 2);
      let arr2 = new BigUint64Array(buf, 0, 2);
      arr1[0] = 777n;
      expect(arr2[0]).assertEqual(777n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0900
     * @tc.name testBigUint64ArrayConstructor090
     * @tc.desc Verify non-overlapping offset views on same buffer are independent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(16);
      let arrLow = new BigUint64Array(buf, 0, 1);
      let arrHigh = new BigUint64Array(buf, 8, 1);
      arrLow[0] = 111n;
      arrHigh[0] = 222n;
      expect(arrLow[0]).assertEqual(111n);
      expect(arrHigh[0]).assertEqual(222n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0910
     * @tc.name testBigUint64ArrayConstructor091
     * @tc.desc Verify overlapping views share data (offset 0 length 2 shares second element with offset 8)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(24);
      let arrFull = new BigUint64Array(buf, 0, 3);
      let arrMid = new BigUint64Array(buf, 8, 1);
      arrFull[1] = 555n;
      expect(arrMid[0]).assertEqual(555n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0920
     * @tc.name testBigUint64ArrayConstructor092
     * @tc.desc Verify int-length constructed arrays produce independent buffers
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr1 = new BigUint64Array(2 as int);
      let arr2 = new BigUint64Array(2 as int);
      arr1[0] = 33n;
      arr2[0] = 66n;
      expect(arr1[0]).assertEqual(33n);
      expect(arr1.buffer !== arr2.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0930
     * @tc.name testBigUint64ArrayConstructor093
     * @tc.desc Verify Array<BigInt>-constructed arrays produce independent buffers
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr1 = new BigUint64Array([0n, 0n]);
      let arr2 = new BigUint64Array([0n, 0n]);
      arr1[0] = 55n;
      arr2[0] = 88n;
      expect(arr1[0]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0940
     * @tc.name testBigUint64ArrayConstructor094
     * @tc.desc Verify copy constructor nested copies maintain independence from original
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = new BigUint64Array(2);
      src[0] = 10n;
      let copy1 = new BigUint64Array(src);
      let copy2 = new BigUint64Array(copy1);
      expect(copy2.buffer !== src.buffer).assertTrue();
      copy2[0] = 20n;
      expect(src[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0950
     * @tc.name testBigUint64ArrayConstructor095
     * @tc.desc Verify int length -1 throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let arr = new BigUint64Array(-1 as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0960
     * @tc.name testBigUint64ArrayConstructor096
     * @tc.desc Verify number length -1.5 truncates to -1 then throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        new BigUint64Array(-1.5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0970
     * @tc.name testBigUint64ArrayConstructor097
     * @tc.desc Verify number length Infinity throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let infiniteLength: number = Float.POSITIVE_INFINITY;
        new BigUint64Array(infiniteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0980
     * @tc.name testBigUint64ArrayConstructor098
     * @tc.desc Verify byteOffset 1 (not 8-aligned) throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(16);
      try {
        new BigUint64Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_0990
     * @tc.name testBigUint64ArrayConstructor099
     * @tc.desc Verify byteOffset -1 throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(16);
      try {
        new BigUint64Array(buf, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1000
     * @tc.name testBigUint64ArrayConstructor100
     * @tc.desc Verify byteOffset exceeds buffer length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(8);
      try {
        new BigUint64Array(buf, 16);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1010
     * @tc.name testBigUint64ArrayConstructor101
     * @tc.desc Verify byteOffset plus length times 8 exceeds buffer throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(16);
      try {
        new BigUint64Array(buf, 8, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1020
     * @tc.name testBigUint64ArrayConstructor102
     * @tc.desc Verify negative length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(16);
      try {
        new BigUint64Array(buf, 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1030
     * @tc.name testBigUint64ArrayConstructor103
     * @tc.desc Verify single-param ArrayBuffer(9) non-8-aligned throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        new BigUint64Array(new ArrayBuffer(9));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1040
     * @tc.name testBigUint64ArrayConstructor104
     * @tc.desc Verify number byteOffset 7.5 truncates to 7 not 8-aligned throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(16);
      try {
        new BigUint64Array(buf, 7.5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1050
     * @tc.name testBigUint64ArrayConstructor105
     * @tc.desc Verify number byteOffset -8.0 truncates to -8 negative throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(8);
      try {
        new BigUint64Array(buf, -8.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1060
     * @tc.name testBigUint64ArrayConstructor106
     * @tc.desc Verify valid buffer+byteOffset+length does not throw
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(8);
      let arr = new BigUint64Array(buf, 0, 1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1070
     * @tc.name testBigUint64ArrayConstructor107
     * @tc.desc Verify buffer(0)+offset=0+length=0 does not throw
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(0);
      let arr = new BigUint64Array(buf, 0, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1080
     * @tc.name testBigUint64ArrayConstructor108
     * @tc.desc Verify negative length across int and number overloads throw same error type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let negativeIntLength: int = -1;
      let negativeNumberLength: number = -1.0;
      let intErrorName: string = '';
      let numberErrorName: string = '';
      try {
        new BigUint64Array(negativeIntLength);
        expect().assertFail();
      } catch (e) {
        intErrorName = e.name;
        expect(e.name).assertEqual('RangeError');
      }
      try {
        new BigUint64Array(negativeNumberLength);
        expect().assertFail();
      } catch (e) {
        numberErrorName = e.name;
        expect(e.name).assertEqual('RangeError');
      }
      expect(intErrorName).assertEqual(numberErrorName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1090
     * @tc.name testBigUint64ArrayConstructor109
     * @tc.desc Verify non-buffer constructors allocate new independent ArrayBuffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let extBuf = new ArrayBuffer(16);
      let arr = new BigUint64Array(2 as int);
      expect(arr.buffer !== extBuf).assertTrue();
      expect(arr.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1100
     * @tc.name testBigUint64ArrayConstructor110
     * @tc.desc Verify buffer constructed views have buffer reference equal to input ArrayBuffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(16);
      let arr1 = new BigUint64Array(buf, 0, 2);
      let arr2 = new BigUint64Array(buf, 0);
      let arr3 = new BigUint64Array(buf);
      expect(arr1.buffer).assertEqual(buf);
      expect(arr2.buffer).assertEqual(buf);
      expect(arr3.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1110
     * @tc.name testBigUint64ArrayConstructor111
     * @tc.desc Verify ArrayLike<Number> construction produces independent buffer from source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<number> = [5, 10];
      let arr = new BigUint64Array(src);
      arr[0] = 99n;
      expect(arr[0]).assertEqual(99n);
      expect(src[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1120
     * @tc.name testBigUint64ArrayConstructor112
     * @tc.desc Verify FixedArray<E> construction produces independent instances from same source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [1];
      let arr1 = new BigUint64Array(src);
      let arr2 = new BigUint64Array(src);
      arr1[0] = 99n;
      expect(arr2[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1130
     * @tc.name testBigUint64ArrayConstructor113
     * @tc.desc Verify subarray-sourced copy preserves view values correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let base = BigUint64Array.of(5n, 15n, 25n);
      let sub = base.subarray(0, 2);
      let copy = new BigUint64Array(sub);
      expect(copy.length).assertEqual(2);
      expect(copy[0]).assertEqual(5n);
      expect(copy[1]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1140
     * @tc.name testBigUint64ArrayConstructor114
     * @tc.desc Verify pre-filled buffer content visible through subsequently constructed view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf = new ArrayBuffer(16);
      let filler = new BigUint64Array(buf, 0, 2);
      filler[0] = 888n;
      let reader = new BigUint64Array(buf, 0, 2);
      expect(reader[0]).assertEqual(888n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1150
     * @tc.name testBigUint64ArrayConstructor115
     * @tc.desc Verify number length negative infinity throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let negativeInfinityLength: number = Float.NEGATIVE_INFINITY;
        new BigUint64Array(negativeInfinityLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1160
     * @tc.name testBigUint64ArrayConstructor116
     * @tc.desc Verify constructor(length: int) accepts decimal literal 4 and initializes index 3 to 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let decimalLength: int = 4;
      let constructedArray = new BigUint64Array(decimalLength);
      let lastIndex: int = decimalLength - 1;
      expect(constructedArray.length).assertEqual(4);
      expect(constructedArray.byteLength).assertEqual(32);
      expect(constructedArray[lastIndex]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1170
     * @tc.name testBigUint64ArrayConstructor117
     * @tc.desc Verify constructor(length: int) accepts binary literal 0b100 and initializes index 3 to 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let binaryLength: int = 0b100;
      let constructedArray = new BigUint64Array(binaryLength);
      let lastIndex: int = binaryLength - 1;
      expect(constructedArray.length).assertEqual(4);
      expect(constructedArray.byteLength).assertEqual(32);
      expect(constructedArray[lastIndex]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1180
     * @tc.name testBigUint64ArrayConstructor118
     * @tc.desc Verify constructor(length: int) accepts octal literal 0o4 and initializes index 3 to 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let octalLength: int = 0o4;
      let constructedArray = new BigUint64Array(octalLength);
      let lastIndex: int = octalLength - 1;
      expect(constructedArray.length).assertEqual(4);
      expect(constructedArray.byteLength).assertEqual(32);
      expect(constructedArray[lastIndex]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1190
     * @tc.name testBigUint64ArrayConstructor119
     * @tc.desc Verify constructor(length: int) accepts hexadecimal literal 0x04 and initializes index 3 to 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let hexadecimalLength: int = 0x04;
      let constructedArray = new BigUint64Array(hexadecimalLength);
      let lastIndex: int = hexadecimalLength - 1;
      expect(constructedArray.length).assertEqual(4);
      expect(constructedArray.byteLength).assertEqual(32);
      expect(constructedArray[lastIndex]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1200
     * @tc.name testBigUint64ArrayConstructor120
     * @tc.desc Verify constructor(length: number) accepts decimal literal 4 and initializes index 3 to 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let decimalLength: number = 4;
      let constructedArray = new BigUint64Array(decimalLength);
      let lastIndex: int = constructedArray.length - 1;
      expect(constructedArray.length).assertEqual(4);
      expect(constructedArray.byteLength).assertEqual(32);
      expect(constructedArray[lastIndex]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1210
     * @tc.name testBigUint64ArrayConstructor121
     * @tc.desc Verify constructor(length: number) accepts binary literal 0b100 and initializes index 3 to 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let binaryLength: number = 0b100;
      let constructedArray = new BigUint64Array(binaryLength);
      let lastIndex: int = constructedArray.length - 1;
      expect(constructedArray.length).assertEqual(4);
      expect(constructedArray.byteLength).assertEqual(32);
      expect(constructedArray[lastIndex]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1220
     * @tc.name testBigUint64ArrayConstructor122
     * @tc.desc Verify constructor(length: number) accepts octal literal 0o4 and initializes index 3 to 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let octalLength: number = 0o4;
      let constructedArray = new BigUint64Array(octalLength);
      let lastIndex: int = constructedArray.length - 1;
      expect(constructedArray.length).assertEqual(4);
      expect(constructedArray.byteLength).assertEqual(32);
      expect(constructedArray[lastIndex]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1230
     * @tc.name testBigUint64ArrayConstructor123
     * @tc.desc Verify constructor(length: number) accepts hexadecimal literal 0x04 and initializes index 3 to 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let hexadecimalLength: number = 0x04;
      let constructedArray = new BigUint64Array(hexadecimalLength);
      let lastIndex: int = constructedArray.length - 1;
      expect(constructedArray.length).assertEqual(4);
      expect(constructedArray.byteLength).assertEqual(32);
      expect(constructedArray[lastIndex]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1240
     * @tc.name testBigUint64ArrayConstructor124
     * @tc.desc Verify constructor(ArrayBuffer, byteOffset: int) accepts binary literal 0b1000 as byteOffset 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(24);
      let binaryByteOffset: int = 0b1000;
      let constructedArray = new BigUint64Array(sourceBuffer, binaryByteOffset);
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1250
     * @tc.name testBigUint64ArrayConstructor125
     * @tc.desc Verify constructor(ArrayBuffer, byteOffset: int) accepts octal literal 0o10 as byteOffset 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(24);
      let octalByteOffset: int = 0o10;
      let constructedArray = new BigUint64Array(sourceBuffer, octalByteOffset);
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1260
     * @tc.name testBigUint64ArrayConstructor126
     * @tc.desc Verify constructor(ArrayBuffer, byteOffset: int) accepts hexadecimal literal 0x08 as byteOffset 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(24);
      let hexadecimalByteOffset: int = 0x08;
      let constructedArray = new BigUint64Array(sourceBuffer, hexadecimalByteOffset);
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1270
     * @tc.name testBigUint64ArrayConstructor127
     * @tc.desc Verify constructor(ArrayBuffer, int, length: int) accepts binary literal 0b100 as view length 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(32);
      let byteOffset: int = 0;
      let binaryViewLength: int = 0b100;
      let constructedArray = new BigUint64Array(sourceBuffer, byteOffset, binaryViewLength);
      expect(constructedArray.length).assertEqual(4);
      expect(constructedArray.byteOffset).assertEqual(0);
      expect(constructedArray.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1280
     * @tc.name testBigUint64ArrayConstructor128
     * @tc.desc Verify constructor(ArrayBuffer, int, length: int) accepts octal literal 0o4 as view length 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(32);
      let byteOffset: int = 0;
      let octalViewLength: int = 0o4;
      let constructedArray = new BigUint64Array(sourceBuffer, byteOffset, octalViewLength);
      expect(constructedArray.length).assertEqual(4);
      expect(constructedArray.byteOffset).assertEqual(0);
      expect(constructedArray.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1290
     * @tc.name testBigUint64ArrayConstructor129
     * @tc.desc Verify constructor(ArrayBuffer, int, length: int) accepts hexadecimal literal 0x04 as view length 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(32);
      let byteOffset: int = 0;
      let hexadecimalViewLength: int = 0x04;
      let constructedArray = new BigUint64Array(sourceBuffer, byteOffset, hexadecimalViewLength);
      expect(constructedArray.length).assertEqual(4);
      expect(constructedArray.byteOffset).assertEqual(0);
      expect(constructedArray.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1300
     * @tc.name testBigUint64ArrayConstructor130
     * @tc.desc Verify constructor(ArrayBuffer, byteOffset: number) accepts binary literal 0b1000 as byteOffset 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(24);
      let binaryByteOffset: number = 0b1000;
      let constructedArray = new BigUint64Array(sourceBuffer, binaryByteOffset);
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1310
     * @tc.name testBigUint64ArrayConstructor131
     * @tc.desc Verify constructor(ArrayBuffer, byteOffset: number) accepts octal literal 0o10 as byteOffset 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(24);
      let octalByteOffset: number = 0o10;
      let constructedArray = new BigUint64Array(sourceBuffer, octalByteOffset);
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1320
     * @tc.name testBigUint64ArrayConstructor132
     * @tc.desc Verify constructor(ArrayBuffer, byteOffset: number) accepts hexadecimal literal 0x08 as byteOffset 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(24);
      let hexadecimalByteOffset: number = 0x08;
      let constructedArray = new BigUint64Array(sourceBuffer, hexadecimalByteOffset);
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1330
     * @tc.name testBigUint64ArrayConstructor133
     * @tc.desc Verify constructor(ArrayBuffer, int, int) mixed radix byteOffset 0x08 and length 0b10 shares buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let hexadecimalByteOffset: int = 0x08;
      let binaryViewLength: int = 0b10;
      let constructedArray = new BigUint64Array(sourceBuffer, hexadecimalByteOffset, binaryViewLength);
      constructedArray[1] = 333n;
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.byteLength).assertEqual(16);
      expect(constructedArray[0]).assertEqual(20n);
      expect(constructedArray[1]).assertEqual(333n);
      expect(fullView[2]).assertEqual(333n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1340
     * @tc.name testBigUint64ArrayConstructor134
     * @tc.desc Verify constructor(ArrayBuffer, int, int) binary byteOffset and octal zero length creates empty shared view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(24);
      let binaryByteOffset: int = 0b1000;
      let octalViewLength: int = 0o0;
      let constructedArray = new BigUint64Array(sourceBuffer, binaryByteOffset, octalViewLength);
      expect(constructedArray.length).assertEqual(0);
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.byteLength).assertEqual(0);
      expect(constructedArray.buffer).assertEqual(sourceBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1350
     * @tc.name testBigUint64ArrayConstructor135
     * @tc.desc Verify constructor(ArrayBuffer, int, int) octal byteOffset 0o20 and hex length 0x02 maps middle view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(48);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 5n;
      fullView[1] = 10n;
      fullView[2] = 15n;
      fullView[3] = 20n;
      fullView[4] = 25n;
      fullView[5] = 30n;
      let octalByteOffset: int = 0o20;
      let hexadecimalViewLength: int = 0x02;
      let constructedArray = new BigUint64Array(sourceBuffer, octalByteOffset, hexadecimalViewLength);
      constructedArray[0] = 1515n;
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.byteOffset).assertEqual(16);
      expect(constructedArray.byteLength).assertEqual(16);
      expect(constructedArray[0]).assertEqual(1515n);
      expect(constructedArray[1]).assertEqual(20n);
      expect(fullView[2]).assertEqual(1515n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1360
     * @tc.name testBigUint64ArrayConstructor136
     * @tc.desc Verify constructor(length: number) accepts declared float length 2.9f and truncates to 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let floatLength: float = 2.9f;
      let constructedArray = new BigUint64Array(floatLength);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.byteLength).assertEqual(16);
      expect(constructedArray[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1370
     * @tc.name testBigUint64ArrayConstructor137
     * @tc.desc Verify constructor(ArrayBuffer, byteOffset: number) accepts declared double byteOffset 8.7 and truncates to 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(24);
      let doubleByteOffset: double = 8.7;
      let constructedArray = new BigUint64Array(sourceBuffer, doubleByteOffset);
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1380
     * @tc.name testBigUint64ArrayConstructor138
     * @tc.desc Verify constructor(length: int) accepts declared byte length 4 and creates zero-filled elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let declaredLength: byte = 4;
      let constructedArray = new BigUint64Array(declaredLength);
      expect(constructedArray.length).assertEqual(4);
      expect(constructedArray.byteLength).assertEqual(32);
      expect(constructedArray[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1390
     * @tc.name testBigUint64ArrayConstructor139
     * @tc.desc Verify constructor(length: int) accepts declared short length 4 and creates zero-filled elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let declaredLength: short = 4;
      let constructedArray = new BigUint64Array(declaredLength);
      expect(constructedArray.length).assertEqual(4);
      expect(constructedArray.byteLength).assertEqual(32);
      expect(constructedArray[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1400
     * @tc.name testBigUint64ArrayConstructor140
     * @tc.desc Verify constructor(ArrayBuffer, byteOffset: int) accepts declared byte offset 8 and maps trailing view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(24);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[1] = 44n;
      let declaredByteOffset: byte = 8;
      let constructedArray = new BigUint64Array(sourceBuffer, declaredByteOffset);
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray[0]).assertEqual(44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1410
     * @tc.name testBigUint64ArrayConstructor141
     * @tc.desc Verify constructor(ArrayBuffer, byteOffset: int) accepts declared short offset 16 and maps tail view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[2] = 88n;
      let declaredByteOffset: short = 16;
      let constructedArray = new BigUint64Array(sourceBuffer, declaredByteOffset);
      expect(constructedArray.byteOffset).assertEqual(16);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray[0]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1420
     * @tc.name testBigUint64ArrayConstructor142
     * @tc.desc Verify constructor(ArrayBuffer, int, length: int) accepts declared byte length 2 for offset view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[1] = 21n;
      fullView[2] = 34n;
      let byteOffset: int = 8;
      let declaredLength: byte = 2;
      let constructedArray = new BigUint64Array(sourceBuffer, byteOffset, declaredLength);
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray[0]).assertEqual(21n);
      expect(constructedArray[1]).assertEqual(34n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1430
     * @tc.name testBigUint64ArrayConstructor143
     * @tc.desc Verify constructor(ArrayBuffer, int, length: int) accepts declared short length 2 for leading view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 55n;
      fullView[1] = 89n;
      let byteOffset: int = 0;
      let declaredLength: short = 2;
      let constructedArray = new BigUint64Array(sourceBuffer, byteOffset, declaredLength);
      expect(constructedArray.byteOffset).assertEqual(0);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray[0]).assertEqual(55n);
      expect(constructedArray[1]).assertEqual(89n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1440
     * @tc.name testBigUint64ArrayConstructor144
     * @tc.desc Verify constructor(length: number) accepts declared double length 3.8 and truncates to 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let doubleLength: double = 3.8;
      let constructedArray = new BigUint64Array(doubleLength);
      expect(constructedArray.length).assertEqual(3);
      expect(constructedArray.byteLength).assertEqual(24);
      expect(constructedArray[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1450
     * @tc.name testBigUint64ArrayConstructor145
     * @tc.desc Verify constructor(ArrayBuffer, byteOffset: number) accepts declared float byteOffset 8.7f and truncates to 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(24);
      let floatByteOffset: float = 8.7f;
      let constructedArray = new BigUint64Array(sourceBuffer, floatByteOffset);
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1460
     * @tc.name testBigUint64ArrayConstructor146
     * @tc.desc Verify constructor(ArrayBuffer, byteOffset: byte, length: int) accepts declared byte offset 8 for an offset view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[1] = 144n;
      fullView[2] = 233n;
      let declaredByteOffset: byte = 8;
      let viewLength: int = 2;
      let constructedArray = new BigUint64Array(sourceBuffer, declaredByteOffset, viewLength);
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray[0]).assertEqual(144n);
      expect(constructedArray[1]).assertEqual(233n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1470
     * @tc.name testBigUint64ArrayConstructor147
     * @tc.desc Verify constructor(ArrayBuffer, byteOffset: short, length: int) accepts declared short offset 16 for a tail view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[2] = 377n;
      fullView[3] = 610n;
      let declaredByteOffset: short = 16;
      let viewLength: int = 2;
      let constructedArray = new BigUint64Array(sourceBuffer, declaredByteOffset, viewLength);
      expect(constructedArray.byteOffset).assertEqual(16);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray[0]).assertEqual(377n);
      expect(constructedArray[1]).assertEqual(610n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1480
     * @tc.name testBigUint64ArrayConstructor148
     * @tc.desc Verify Array<number> source mutation after construction does not affect constructed values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<number> = [8, 16];
      let constructedArray = new BigUint64Array(sourceValues);
      sourceValues[0] = 32;
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray[0]).assertEqual(8n);
      expect(constructedArray[1]).assertEqual(16n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1490
     * @tc.name testBigUint64ArrayConstructor149
     * @tc.desc Verify FixedArray<BigInt> source mutation after construction does not affect constructed values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: FixedArray<BigInt> = [2n, 4n];
      let constructedArray = new BigUint64Array(sourceValues);
      sourceValues[1] = 8n;
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray[0]).assertEqual(2n);
      expect(constructedArray[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1500
     * @tc.name testBigUint64ArrayConstructor150
     * @tc.desc Verify Set<BigInt> duplicate source values construct unique insertion-order elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Set<BigInt> = new Set<BigInt>();
      sourceValues.add(9n);
      sourceValues.add(9n);
      sourceValues.add(10n);
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray[0]).assertEqual(9n);
      expect(constructedArray[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1510
     * @tc.name testBigUint64ArrayConstructor151
     * @tc.desc Verify Set<BigInt> source mutation after construction does not affect constructed values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Set<BigInt> = new Set<BigInt>();
      sourceValues.add(3n);
      sourceValues.add(5n);
      let constructedArray = new BigUint64Array(sourceValues);
      sourceValues.add(7n);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray[0]).assertEqual(3n);
      expect(constructedArray[1]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1520
     * @tc.name testBigUint64ArrayConstructor152
     * @tc.desc Verify subarray values iterator source copies window values independently from source mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(12n, 24n, 36n);
      let sourceIterator = sourceArray.subarray(1).values();
      let constructedArray = new BigUint64Array(sourceIterator);
      sourceArray[1] = 99n;
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray[0]).assertEqual(24n);
      expect(constructedArray[1]).assertEqual(36n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1530
     * @tc.name testBigUint64ArrayConstructor153
     * @tc.desc Verify copy constructor from offset buffer view detaches values from later buffer mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[1] = 20n;
      fullView[2] = 30n;
      let byteOffset: int = 8;
      let viewLength: int = 2;
      let sourceView = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      let copiedArray = new BigUint64Array(sourceView);
      fullView[1] = 99n;
      expect(copiedArray.buffer !== sourceBuffer).assertTrue();
      expect(copiedArray.byteOffset).assertEqual(0);
      expect(copiedArray.length).assertEqual(2);
      expect(copiedArray[0]).assertEqual(20n);
      expect(copiedArray[1]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1540
     * @tc.name testBigUint64ArrayConstructor154
     * @tc.desc Verify Array<number> source with base literal elements converts to BigInt values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<number> = [0x10, 0b100, 0o7];
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray.length).assertEqual(3);
      expect(constructedArray[0]).assertEqual(16n);
      expect(constructedArray[1]).assertEqual(4n);
      expect(constructedArray[2]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1550
     * @tc.name testBigUint64ArrayConstructor155
     * @tc.desc Verify FixedArray<number> source with base literal elements converts to BigInt values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: FixedArray<number> = [0x20, 0b101, 0o11];
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray.length).assertEqual(3);
      expect(constructedArray[0]).assertEqual(32n);
      expect(constructedArray[1]).assertEqual(5n);
      expect(constructedArray[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1560
     * @tc.name testBigUint64ArrayConstructor156
     * @tc.desc Verify Set<BigInt> source with BigInt base literal conversions preserves insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Set<BigInt> = new Set<BigInt>();
      sourceValues.add(BigInt(0x10));
      sourceValues.add(BigInt(0b101));
      sourceValues.add(BigInt(0o11));
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray.length).assertEqual(3);
      expect(constructedArray[0]).assertEqual(16n);
      expect(constructedArray[1]).assertEqual(5n);
      expect(constructedArray[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1570
     * @tc.name testBigUint64ArrayConstructor157
     * @tc.desc Verify constructor(Array<number>) accepts decimal element 255 and stores 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<number> = [255];
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray.length).assertEqual(1);
      expect(constructedArray[0]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1580
     * @tc.name testBigUint64ArrayConstructor158
     * @tc.desc Verify constructor(Array<number>) accepts binary element 0b11111111 and stores 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<number> = [0b11111111];
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray.length).assertEqual(1);
      expect(constructedArray[0]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1590
     * @tc.name testBigUint64ArrayConstructor159
     * @tc.desc Verify constructor(Array<number>) accepts octal element 0o377 and stores 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<number> = [0o377];
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray.length).assertEqual(1);
      expect(constructedArray[0]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1600
     * @tc.name testBigUint64ArrayConstructor160
     * @tc.desc Verify constructor(Array<number>) accepts hexadecimal element 0xFF and stores 255n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<number> = [0xFF];
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray.length).assertEqual(1);
      expect(constructedArray[0]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1610
     * @tc.name testBigUint64ArrayConstructor161
     * @tc.desc Verify constructor(length: number) accepts declared long length 4 and creates zero-filled elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let declaredLength: long = 4;
      let constructedArray = new BigUint64Array(declaredLength);
      expect(constructedArray.length).assertEqual(4);
      expect(constructedArray.byteLength).assertEqual(32);
      expect(constructedArray[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1620
     * @tc.name testBigUint64ArrayConstructor162
     * @tc.desc Verify constructor(ArrayBuffer, byteOffset: number) accepts declared long byteOffset 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(24);
      let declaredByteOffset: long = 8;
      let constructedArray = new BigUint64Array(sourceBuffer, declaredByteOffset);
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1630
     * @tc.name testBigUint64ArrayConstructor163
     * @tc.desc Verify fractional number byteOffset truncates to tail window within ArrayBuffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(24);
      let fullView = new BigUint64Array(sourceBuffer);
      let tailValue: bigint = 303n;
      fullView[2] = tailValue;
      let fractionalByteOffset: number = 16.9;
      let constructedArray = new BigUint64Array(sourceBuffer, fractionalByteOffset);
      expect(constructedArray.byteOffset).assertEqual(16);
      expect(constructedArray.length).assertEqual(1);
      expect(constructedArray.byteLength).assertEqual(8);
      expect(constructedArray[0]).assertEqual(tailValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1640
     * @tc.name testBigUint64ArrayConstructor164
     * @tc.desc Verify byteOffset at buffer end with zero length creates valid empty view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(24);
      let byteOffset: int = 24;
      let viewLength: int = 0;
      let constructedArray = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      expect(constructedArray.byteOffset).assertEqual(24);
      expect(constructedArray.length).assertEqual(0);
      expect(constructedArray.byteLength).assertEqual(0);
      expect(constructedArray.buffer).assertEqual(sourceBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1650
     * @tc.name testBigUint64ArrayConstructor165
     * @tc.desc Verify copy constructor from nested subarray window copies only current window values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 11n;
      fullView[1] = 22n;
      fullView[2] = 33n;
      fullView[3] = 44n;
      fullView[4] = 55n;
      let byteOffset: int = 8;
      let viewLength: int = 3;
      let offsetView = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      let nestedWindow = offsetView.subarray(1, 3);
      let copiedArray = new BigUint64Array(nestedWindow);
      fullView[2] = 333n;
      expect(copiedArray.buffer !== sourceBuffer).assertTrue();
      expect(copiedArray.byteOffset).assertEqual(0);
      expect(copiedArray.length).assertEqual(2);
      expect(copiedArray[0]).assertEqual(33n);
      expect(copiedArray[1]).assertEqual(44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1660
     * @tc.name testBigUint64ArrayConstructor166
     * @tc.desc Verify copy constructor from slice window preserves snapshot after source mutations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 70n;
      fullView[1] = 80n;
      fullView[2] = 90n;
      fullView[3] = 100n;
      let byteOffset: int = 8;
      let viewLength: int = 3;
      let offsetView = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      let sliceWindow = offsetView.slice(1, 3);
      let copiedArray = new BigUint64Array(sliceWindow);
      fullView[2] = 900n;
      sliceWindow[0] = 909n;
      expect(copiedArray.buffer !== sliceWindow.buffer).assertTrue();
      expect(copiedArray.length).assertEqual(2);
      expect(copiedArray[0]).assertEqual(90n);
      expect(copiedArray[1]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1670
     * @tc.name testBigUint64ArrayConstructor167
     * @tc.desc Verify copy constructor from zero-length offset view creates detached empty buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(16);
      let byteOffset: int = 8;
      let viewLength: int = 0;
      let zeroWindow = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      let copiedArray = new BigUint64Array(zeroWindow);
      expect(copiedArray.buffer !== sourceBuffer).assertTrue();
      expect(copiedArray.byteOffset).assertEqual(0);
      expect(copiedArray.length).assertEqual(0);
      expect(copiedArray.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1680
     * @tc.name testBigUint64ArrayConstructor168
     * @tc.desc Verify constructor(Iterable<BigInt>) consumes partially advanced values iterator from current position
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(4n, 8n, 16n);
      let sourceIterator = sourceArray.values();
      sourceIterator.next();
      let constructedArray = new BigUint64Array(sourceIterator);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray[0]).assertEqual(8n);
      expect(constructedArray[1]).assertEqual(16n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1690
     * @tc.name testBigUint64ArrayConstructor169
     * @tc.desc Verify constructor(Iterable<BigInt>) reads source mutation made before iterator consumption
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(6n, 12n, 18n);
      let sourceIterator = sourceArray.values();
      sourceArray[1] = 120n;
      let constructedArray = new BigUint64Array(sourceIterator);
      expect(constructedArray.length).assertEqual(3);
      expect(constructedArray[0]).assertEqual(6n);
      expect(constructedArray[1]).assertEqual(120n);
      expect(constructedArray[2]).assertEqual(18n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1700
     * @tc.name testBigUint64ArrayConstructor170
     * @tc.desc Verify declared double length 0.9 truncates to zero length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fractionalLength: double = 0.9;
      let constructedArray = new BigUint64Array(fractionalLength);
      expect(constructedArray.length).assertEqual(0);
      expect(constructedArray.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1710
     * @tc.name testBigUint64ArrayConstructor171
     * @tc.desc Verify declared long zero length creates an empty independent array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let zeroLength: long = 0;
      let constructedArray = new BigUint64Array(zeroLength);
      expect(constructedArray.length).assertEqual(0);
      expect(constructedArray.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1720
     * @tc.name testBigUint64ArrayConstructor172
     * @tc.desc Verify negative zero number length creates an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let negativeZeroLength: number = -0.0;
      let constructedArray = new BigUint64Array(negativeZeroLength);
      expect(constructedArray.length).assertEqual(0);
      expect(constructedArray.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1730
     * @tc.name testBigUint64ArrayConstructor173
     * @tc.desc Verify three-parameter constructor accepts declared long byteOffset 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(32);
      let declaredByteOffset: long = 8;
      let viewLength: int = 2;
      let constructedArray = new BigUint64Array(sourceBuffer, declaredByteOffset, viewLength);
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1740
     * @tc.name testBigUint64ArrayConstructor174
     * @tc.desc Verify three-parameter constructor accepts declared long view length 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(32);
      let byteOffset: int = 8;
      let declaredViewLength: long = 2;
      let constructedArray = new BigUint64Array(sourceBuffer, byteOffset, declaredViewLength);
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1750
     * @tc.name testBigUint64ArrayConstructor175
     * @tc.desc Verify declared byte offset at buffer end supports a zero-length view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(24);
      let endByteOffset: byte = 24;
      let zeroViewLength: int = 0;
      let constructedArray = new BigUint64Array(sourceBuffer, endByteOffset, zeroViewLength);
      expect(constructedArray.byteOffset).assertEqual(24);
      expect(constructedArray.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1760
     * @tc.name testBigUint64ArrayConstructor176
     * @tc.desc Verify declared short offset and byte length form an exact tail view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(32);
      let tailByteOffset: short = 8;
      let tailViewLength: byte = 3;
      let constructedArray = new BigUint64Array(sourceBuffer, tailByteOffset, tailViewLength);
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1770
     * @tc.name testBigUint64ArrayConstructor177
     * @tc.desc Verify FixedArray int binary element converts to unsigned BigInt value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: FixedArray<int> = [0b11111111];
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray[0]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1780
     * @tc.name testBigUint64ArrayConstructor178
     * @tc.desc Verify FixedArray int negative element wraps to uint64 maximum minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: FixedArray<int> = [-2];
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray[0]).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1790
     * @tc.name testBigUint64ArrayConstructor179
     * @tc.desc Verify FixedArray int elements convert to unsigned BigInt values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: FixedArray<int> = [0, 2147483647];
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray[0]).assertEqual(0n);
      expect(constructedArray[1]).assertEqual(2147483647n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1800
     * @tc.name testBigUint64ArrayConstructor180
     * @tc.desc Verify FixedArray number 2^53 element converts exactly to BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: FixedArray<number> = [9007199254740992];
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray[0]).assertEqual(9007199254740992n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1810
     * @tc.name testBigUint64ArrayConstructor181
     * @tc.desc Verify FixedArray number negative element wraps to uint64 maximum minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: FixedArray<number> = [-2];
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray[0]).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1820
     * @tc.name testBigUint64ArrayConstructor182
     * @tc.desc Verify FixedArray double integral elements convert to BigInt values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: FixedArray<double> = [0.0, 42.0];
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray[0]).assertEqual(0n);
      expect(constructedArray[1]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1830
     * @tc.name testBigUint64ArrayConstructor183
     * @tc.desc Verify Array number element 2147483648 converts beyond signed int range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<number> = [2147483648];
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray[0]).assertEqual(2147483648n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1840
     * @tc.name testBigUint64ArrayConstructor184
     * @tc.desc Verify Array number element -2 wraps to uint64 maximum minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<number> = [-2];
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray[0]).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1850
     * @tc.name testBigUint64ArrayConstructor185
     * @tc.desc Verify Array number element 2^53 converts exactly to BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<number> = [9007199254740992];
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray[0]).assertEqual(9007199254740992n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1860
     * @tc.name testBigUint64ArrayConstructor186
     * @tc.desc Verify Array number negative zero converts to unsigned zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<number> = [-0.0];
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1870
     * @tc.name testBigUint64ArrayConstructor187
     * @tc.desc Verify Array BigInt maximum minus one value is preserved
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [18446744073709551614n];
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray[0]).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1880
     * @tc.name testBigUint64ArrayConstructor188
     * @tc.desc Verify Array BigInt 2^63 value is preserved above signed long range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [9223372036854775808n];
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray[0]).assertEqual(9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1890
     * @tc.name testBigUint64ArrayConstructor189
     * @tc.desc Verify Array BigInt -2n wraps to uint64 maximum minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [-2n];
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray[0]).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1900
     * @tc.name testBigUint64ArrayConstructor190
     * @tc.desc Verify Array BigInt negative 2^64 wraps to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [-18446744073709551616n];
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1910
     * @tc.name testBigUint64ArrayConstructor191
     * @tc.desc Verify Array BigInt below negative 2^64 wraps to uint64 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [-18446744073709551617n];
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray[0]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1920
     * @tc.name testBigUint64ArrayConstructor192
     * @tc.desc Verify FixedArray BigInt below negative 2^64 wraps to uint64 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: FixedArray<BigInt> = [-18446744073709551617n];
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray[0]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1930
     * @tc.name testBigUint64ArrayConstructor193
     * @tc.desc Verify Set BigInt -2n wraps while preserving insertion position
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues = new Set<BigInt>();
      sourceValues.add(-2n);
      sourceValues.add(5n);
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray[0]).assertEqual(18446744073709551614n);
      expect(constructedArray[1]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1940
     * @tc.name testBigUint64ArrayConstructor194
     * @tc.desc Verify Set BigInt 2^64 plus one wraps while preserving insertion position
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues = new Set<BigInt>();
      sourceValues.add(18446744073709551617n);
      sourceValues.add(7n);
      let constructedArray = new BigUint64Array(sourceValues);
      expect(constructedArray[0]).assertEqual(1n);
      expect(constructedArray[1]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1950
     * @tc.name testBigUint64ArrayConstructor195
     * @tc.desc Verify constructor from an exhausted values iterator creates an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(3n);
      let sourceIterator = sourceArray.values();
      sourceIterator.next();
      let constructedArray = new BigUint64Array(sourceIterator);
      expect(constructedArray.length).assertEqual(0);
      expect(constructedArray.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1960
     * @tc.name testBigUint64ArrayConstructor196
     * @tc.desc Verify iterator construction observes mutation of an unread future element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(2n, 4n, 8n);
      let sourceIterator = sourceArray.values();
      sourceIterator.next();
      sourceArray[2] = 80n;
      let constructedArray = new BigUint64Array(sourceIterator);
      expect(constructedArray[0]).assertEqual(4n);
      expect(constructedArray[1]).assertEqual(80n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1970
     * @tc.name testBigUint64ArrayConstructor197
     * @tc.desc Verify negative zero byteOffset maps the full buffer from offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(16);
      let negativeZeroByteOffset: number = -0.0;
      let constructedArray = new BigUint64Array(sourceBuffer, negativeZeroByteOffset);
      expect(constructedArray.byteOffset).assertEqual(0);
      expect(constructedArray.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1980
     * @tc.name testBigUint64ArrayConstructor198
     * @tc.desc Verify ArrayBuffer constructor accepts undefined offset and undefined length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let constructedArray = new BigUint64Array(sourceBuffer, undefined, undefined);
      expect(constructedArray.byteOffset).assertEqual(0);
      expect(constructedArray.length).assertEqual(3);
      expect(constructedArray.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_1990
     * @tc.name testBigUint64ArrayConstructor199
     * @tc.desc Verify ArrayBuffer constructor defaults undefined offset while applying explicit length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let explicitLength: number = 2.0;
      let constructedArray = new BigUint64Array(sourceBuffer, undefined, explicitLength);
      expect(constructedArray.buffer).assertEqual(sourceBuffer);
      expect(constructedArray.byteOffset).assertEqual(0);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2000
     * @tc.name testBigUint64ArrayConstructor200
     * @tc.desc Verify number length Double.NaN converts to an empty BigUint64Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanLength: number = Double.NaN;
      let constructedArray = new BigUint64Array(nanLength);
      expect(constructedArray.length).assertEqual(0);
      expect(constructedArray.byteLength).assertEqual(0);
      expect(constructedArray.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2010
     * @tc.name testBigUint64ArrayConstructor201
     * @tc.desc Verify float length Float.NaN converts to an empty BigUint64Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanLength: float = Float.NaN;
      let constructedArray = new BigUint64Array(nanLength);
      expect(constructedArray.length).assertEqual(0);
      expect(constructedArray.byteLength).assertEqual(0);
      expect(constructedArray.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2020
     * @tc.name testBigUint64ArrayConstructor202
     * @tc.desc Verify ArrayBuffer constructor converts Double.NaN byteOffset to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(16);
      let nanByteOffset: number = Double.NaN;
      let constructedArray = new BigUint64Array(sourceBuffer, nanByteOffset);
      expect(constructedArray.buffer).assertEqual(sourceBuffer);
      expect(constructedArray.byteOffset).assertEqual(0);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2030
     * @tc.name testBigUint64ArrayConstructor203
     * @tc.desc Verify ArrayBuffer constructor converts Double.NaN length to an empty view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(16);
      let nanViewLength: number = Double.NaN;
      let constructedArray = new BigUint64Array(sourceBuffer, undefined, nanViewLength);
      expect(constructedArray.buffer).assertEqual(sourceBuffer);
      expect(constructedArray.byteOffset).assertEqual(0);
      expect(constructedArray.length).assertEqual(0);
      expect(constructedArray.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2040
     * @tc.name testBigUint64ArrayConstructor204
     * @tc.desc Verify constructor length uses binary zero and creates an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let binaryLength: int = 0b0;
      let constructedArray = new BigUint64Array(binaryLength);
      expect(constructedArray.length).assertEqual(0);
      expect(constructedArray.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2050
     * @tc.name testBigUint64ArrayConstructor205
     * @tc.desc Verify constructor length uses octal zero and creates an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let octalLength: int = 0o0;
      let constructedArray = new BigUint64Array(octalLength);
      expect(constructedArray.length).assertEqual(0);
      expect(constructedArray.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2060
     * @tc.name testBigUint64ArrayConstructor206
     * @tc.desc Verify constructor length uses hexadecimal zero and creates an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hexadecimalLength: int = 0x0;
      let constructedArray = new BigUint64Array(hexadecimalLength);
      expect(constructedArray.length).assertEqual(0);
      expect(constructedArray.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2070
     * @tc.name testBigUint64ArrayConstructor207
     * @tc.desc Verify byte source converted by toInt supplies constructor length four
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteLengthSource: byte = 4;
      let constructedArray = new BigUint64Array(byteLengthSource.toInt());
      expect(constructedArray.length).assertEqual(4);
      expect(constructedArray[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2080
     * @tc.name testBigUint64ArrayConstructor208
     * @tc.desc Verify short source converted by toInt supplies constructor length four
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shortLengthSource: short = 4;
      let constructedArray = new BigUint64Array(shortLengthSource.toInt());
      expect(constructedArray.length).assertEqual(4);
      expect(constructedArray.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2090
     * @tc.name testBigUint64ArrayConstructor209
     * @tc.desc Verify long source converted by toInt supplies constructor length four
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longLengthSource: long = 4294967300;
      let constructedArray = new BigUint64Array(longLengthSource.toInt());
      expect(constructedArray.length).assertEqual(4);
      expect(constructedArray.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2100
     * @tc.name testBigUint64ArrayConstructor210
     * @tc.desc Verify number source converted by toInt supplies truncated constructor length four
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numberLengthSource: number = 4.9;
      let constructedArray = new BigUint64Array(numberLengthSource.toInt());
      expect(constructedArray.length).assertEqual(4);
      expect(constructedArray.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2110
     * @tc.name testBigUint64ArrayConstructor211
     * @tc.desc Verify float source converted by toInt supplies truncated constructor length four
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatLengthSource: float = 4.9f;
      let constructedArray = new BigUint64Array(floatLengthSource.toInt());
      expect(constructedArray.length).assertEqual(4);
      expect(constructedArray[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2120
     * @tc.name testBigUint64ArrayConstructor212
     * @tc.desc Verify double source converted by toInt supplies truncated constructor length four
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let doubleLengthSource: double = 4.9;
      let constructedArray = new BigUint64Array(doubleLengthSource.toInt());
      expect(constructedArray.length).assertEqual(4);
      expect(constructedArray[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2130
     * @tc.name testBigUint64ArrayConstructor213
     * @tc.desc Verify byte source converted by toInt supplies byteOffset eight to the two-parameter buffer constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let byteOffsetSource: byte = 8;
      let constructedArray = new BigUint64Array(sourceBuffer, byteOffsetSource.toInt());
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.buffer).assertEqual(sourceBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2140
     * @tc.name testBigUint64ArrayConstructor214
     * @tc.desc Verify short source converted by toInt supplies byteOffset eight to the two-parameter buffer constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let shortOffsetSource: short = 8;
      let constructedArray = new BigUint64Array(sourceBuffer, shortOffsetSource.toInt());
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.buffer).assertEqual(sourceBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2150
     * @tc.name testBigUint64ArrayConstructor215
     * @tc.desc Verify long source converted by toInt supplies byteOffset eight to the two-parameter buffer constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let longOffsetSource: long = 8;
      let constructedArray = new BigUint64Array(sourceBuffer, longOffsetSource.toInt());
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.buffer).assertEqual(sourceBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2160
     * @tc.name testBigUint64ArrayConstructor216
     * @tc.desc Verify float source converted by toInt supplies byteOffset eight to the two-parameter buffer constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let floatOffsetSource: float = 8.0f;
      let constructedArray = new BigUint64Array(sourceBuffer, floatOffsetSource.toInt());
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.buffer).assertEqual(sourceBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2170
     * @tc.name testBigUint64ArrayConstructor217
     * @tc.desc Verify double source converted by toInt supplies byteOffset eight to the two-parameter buffer constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let doubleOffsetSource: double = 8.0;
      let constructedArray = new BigUint64Array(sourceBuffer, doubleOffsetSource.toInt());
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.buffer).assertEqual(sourceBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2180
     * @tc.name testBigUint64ArrayConstructor218
     * @tc.desc Verify byte source converted by toInt supplies byteOffset eight to the three-parameter buffer constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let byteOffsetSource: byte = 8;
      let viewLength: int = 2;
      let constructedArray = new BigUint64Array(sourceBuffer, byteOffsetSource.toInt(), viewLength);
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2190
     * @tc.name testBigUint64ArrayConstructor219
     * @tc.desc Verify short source converted by toInt supplies byteOffset eight to the three-parameter buffer constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let shortOffsetSource: short = 8;
      let viewLength: int = 2;
      let constructedArray = new BigUint64Array(sourceBuffer, shortOffsetSource.toInt(), viewLength);
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2200
     * @tc.name testBigUint64ArrayConstructor220
     * @tc.desc Verify long source converted by toInt supplies byteOffset eight to the three-parameter buffer constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let longOffsetSource: long = 8;
      let viewLength: int = 2;
      let constructedArray = new BigUint64Array(sourceBuffer, longOffsetSource.toInt(), viewLength);
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2210
     * @tc.name testBigUint64ArrayConstructor221
     * @tc.desc Verify float source converted by toInt supplies byteOffset eight to the three-parameter buffer constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let floatOffsetSource: float = 8.0f;
      let viewLength: int = 2;
      let constructedArray = new BigUint64Array(sourceBuffer, floatOffsetSource.toInt(), viewLength);
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2220
     * @tc.name testBigUint64ArrayConstructor222
     * @tc.desc Verify double source converted by toInt supplies byteOffset eight to the three-parameter buffer constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let doubleOffsetSource: double = 8.0;
      let viewLength: int = 2;
      let constructedArray = new BigUint64Array(sourceBuffer, doubleOffsetSource.toInt(), viewLength);
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2230
     * @tc.name testBigUint64ArrayConstructor223
     * @tc.desc Verify byte source converted by toInt supplies length two to the three-parameter buffer constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let byteOffset: int = 8;
      let byteViewLengthSource: byte = 2;
      let constructedArray = new BigUint64Array(sourceBuffer, byteOffset, byteViewLengthSource.toInt());
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2240
     * @tc.name testBigUint64ArrayConstructor224
     * @tc.desc Verify short source converted by toInt supplies length two to the three-parameter buffer constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let byteOffset: int = 8;
      let shortLengthSource: short = 2;
      let constructedArray = new BigUint64Array(sourceBuffer, byteOffset, shortLengthSource.toInt());
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2250
     * @tc.name testBigUint64ArrayConstructor225
     * @tc.desc Verify long source converted by toInt supplies length two to the three-parameter buffer constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let byteOffset: int = 8;
      let longLengthSource: long = 2;
      let constructedArray = new BigUint64Array(sourceBuffer, byteOffset, longLengthSource.toInt());
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2260
     * @tc.name testBigUint64ArrayConstructor226
     * @tc.desc Verify float source converted by toInt supplies length two to the three-parameter buffer constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let byteOffset: int = 8;
      let floatLengthSource: float = 2.0f;
      let constructedArray = new BigUint64Array(sourceBuffer, byteOffset, floatLengthSource.toInt());
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_CONSTRUCTOR_2270
     * @tc.name testBigUint64ArrayConstructor227
     * @tc.desc Verify double source converted by toInt supplies length two to the three-parameter buffer constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayConstructor227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let byteOffset: int = 8;
      let doubleLengthSource: double = 2.0;
      let constructedArray = new BigUint64Array(sourceBuffer, byteOffset, doubleLengthSource.toInt());
      expect(constructedArray.byteOffset).assertEqual(8);
      expect(constructedArray.length).assertEqual(2);
      expect(constructedArray.byteLength).assertEqual(16);
    });
  });
}
