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
