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

/**
 * Helper to create an Array<number> filled with zeros
 */
function createNumberArray(len: number): Array<number> {
  let result: Array<number> = [];
  for (let i = 0; i < len; i++) {
    result.push(0);
  }
  return result;
}

/**
 * Helper to create an Array<BigInt> filled with zeros
 */
function createBigIntArray(len: int): Array<BigInt> {
  let result: Array<BigInt> = [];
  for (let i = 0; i < len; i++) {
    result.push(0n);
  }
  return result;
}

export default function Uint8ArrayFrom01Test(): void {
  describe('Uint8ArrayFrom01Test', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_0100
     * @tc.name testUint8ArrayFrom001
     * @tc.desc Verify from(FixedArray<int>) with 1 parameter
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2];
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_0200
     * @tc.name testUint8ArrayFrom002
     * @tc.desc Verify from(Uint8Array) with 1 parameter
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Uint8Array.of(1, 2);
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_0300
     * @tc.name testUint8ArrayFrom003
     * @tc.desc Verify from(ArrayLike<number>) with 1 parameter
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = createNumberArray(2);
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_0400
     * @tc.name testUint8ArrayFrom004
     * @tc.desc Verify from(Iterable<number>) with 1 parameter without mapfn
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      let result = Uint8Array.from(set);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_0500
     * @tc.name testUint8ArrayFrom005
     * @tc.desc Verify from(Iterable<number>, mapfn) with 2 parameters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      let result = Uint8Array.from(set, (v: number): number => v);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_0600
     * @tc.name testUint8ArrayFrom006
     * @tc.desc Verify empty FixedArray<int> constructs empty Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [];
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_0700
     * @tc.name testUint8ArrayFrom007
     * @tc.desc Verify FixedArray<int> with single element 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0];
      let result = Uint8Array.from(src);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_0800
     * @tc.name testUint8ArrayFrom008
     * @tc.desc Verify FixedArray<int> with single element 255 maximum boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [255];
      let result = Uint8Array.from(src);
      expect(result[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_0900
     * @tc.name testUint8ArrayFrom009
     * @tc.desc Verify FixedArray<int> with single element 127 middle value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [127];
      let result = Uint8Array.from(src);
      expect(result[0]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_1000
     * @tc.name testUint8ArrayFrom010
     * @tc.desc Verify FixedArray<int> with single element 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [128];
      let result = Uint8Array.from(src);
      expect(result[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_1100
     * @tc.name testUint8ArrayFrom011
     * @tc.desc Verify FixedArray<int> with multiple elements basic sequence
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2, 3, 4, 5];
      let result = Uint8Array.from(src);
      expect(result.join(',')).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_1200
     * @tc.name testUint8ArrayFrom012
     * @tc.desc Verify FixedArray<int> with element 256 overflow truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [256];
      let result = Uint8Array.from(src);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_1300
     * @tc.name testUint8ArrayFrom013
     * @tc.desc Verify FixedArray<int> with element -1 wraps to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [-1];
      let result = Uint8Array.from(src);
      expect(result[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_1400
     * @tc.name testUint8ArrayFrom014
     * @tc.desc Verify FixedArray<int> with element -128 wraps to 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [-128];
      let result = Uint8Array.from(src);
      expect(result[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_1500
     * @tc.name testUint8ArrayFrom015
     * @tc.desc Verify FixedArray<int> with mixed boundary values truncation/wrap combination
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0, 255, 256, -1];
      let result = Uint8Array.from(src);
      expect(result.join(',')).assertEqual('0,255,0,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_1600
     * @tc.name testUint8ArrayFrom016
     * @tc.desc Verify FixedArray<int> with hexadecimal literal elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0x10, 0x20, 0x30];
      let result = Uint8Array.from(src);
      expect(result.join(',')).assertEqual('16,32,48');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_1700
     * @tc.name testUint8ArrayFrom017
     * @tc.desc Verify FixedArray<int> with binary literal elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0b1, 0b10, 0b11];
      let result = Uint8Array.from(src);
      expect(result.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_1800
     * @tc.name testUint8ArrayFrom018
     * @tc.desc Verify FixedArray<int> with octal literal elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0o77, 0o100, 0o177];
      let result = Uint8Array.from(src);
      expect(result.join(',')).assertEqual('63,64,127');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_1900
     * @tc.name testUint8ArrayFrom019
     * @tc.desc Verify FixedArray<int> with element 2147483647 takes low 8 bits 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [2147483647];
      let result = Uint8Array.from(src);
      expect(result[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_2000
     * @tc.name testUint8ArrayFrom020
     * @tc.desc Verify FixedArray<int> with element -2147483648 takes low 8 bits 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [-2147483648];
      let result = Uint8Array.from(src);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_2100
     * @tc.name testUint8ArrayFrom021
     * @tc.desc Verify FixedArray<int> with element -0 converts to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [-0];
      let result = Uint8Array.from(src);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_2200
     * @tc.name testUint8ArrayFrom022
     * @tc.desc Verify FixedArray<int> with 10 element sequence
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(10);
      expect(result[9]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_2300
     * @tc.name testUint8ArrayFrom023
     * @tc.desc Verify empty Uint8Array constructs empty Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Uint8Array.of();
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_2400
     * @tc.name testUint8ArrayFrom024
     * @tc.desc Verify single element Uint8Array copy
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Uint8Array.of(42);
      let result = Uint8Array.from(src);
      expect(result[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_2500
     * @tc.name testUint8ArrayFrom025
     * @tc.desc Verify multiple elements Uint8Array copy
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Uint8Array.of(1, 2, 3);
      let result = Uint8Array.from(src);
      expect(result.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_2600
     * @tc.name testUint8ArrayFrom026
     * @tc.desc Verify boundary values Uint8Array copy 0 and 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Uint8Array.of(0, 255, 127);
      let result = Uint8Array.from(src);
      expect(result.join(',')).assertEqual('0,255,127');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_2700
     * @tc.name testUint8ArrayFrom027
     * @tc.desc Verify deep copy validation modification of source does not affect copy
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Uint8Array.of(1, 2, 3);
      let result = Uint8Array.from(src);
      src[0] = 99;
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_2800
     * @tc.name testUint8ArrayFrom028
     * @tc.desc Verify large Uint8Array copy 100 elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Uint8Array(100);
      src[0] = 5;
      src[99] = 10;
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(100);
      expect(result[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_2900
     * @tc.name testUint8ArrayFrom029
     * @tc.desc Verify from returns new instance (different reference)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Uint8Array.of(1, 2);
      let result = Uint8Array.from(src);
      expect(result !== src).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_3000
     * @tc.name testUint8ArrayFrom030
     * @tc.desc Verify Uint8Array copy all zero elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Uint8Array.of(0, 0, 0);
      let result = Uint8Array.from(src);
      expect(result.join(',')).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_3100
     * @tc.name testUint8ArrayFrom031
     * @tc.desc Verify empty ArrayLike<number> construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = createNumberArray(0);
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_3200
     * @tc.name testUint8ArrayFrom032
     * @tc.desc Verify ArrayLike<number> copy length is correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = createNumberArray(3);
      let result = Uint8Array.from(src);
      expect(result.join(',')).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_3300
     * @tc.name testUint8ArrayFrom033
     * @tc.desc Verify ArrayLike<number> with multiple elements basic
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2, 3];
      let result = Uint8Array.from(src);
      expect(result.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_3400
     * @tc.name testUint8ArrayFrom034
     * @tc.desc Verify FixedArray<int> with single element 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [3];
      let result = Uint8Array.from(src);
      expect(result[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_3500
     * @tc.name testUint8ArrayFrom035
     * @tc.desc Verify FixedArray<int> with element 0xFF hexadecimal literal
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0xFF];
      let result = Uint8Array.from(src);
      expect(result[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_3600
     * @tc.name testUint8ArrayFrom036
     * @tc.desc Verify Iterable<number> with Set containing single element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(42);
      let result = Uint8Array.from(set);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_3700
     * @tc.name testUint8ArrayFrom037
     * @tc.desc Verify Iterable<number> with Set containing multiple elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      set.add(2);
      set.add(3);
      let result = Uint8Array.from(set);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_3800
     * @tc.name testUint8ArrayFrom038
     * @tc.desc Verify Iterable<number> with Set containing boundary values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(0);
      set.add(255);
      let result = Uint8Array.from(set);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_3900
     * @tc.name testUint8ArrayFrom039
     * @tc.desc Verify Iterable<number> with empty Set
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      let result = Uint8Array.from(set);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_4000
     * @tc.name testUint8ArrayFrom040
     * @tc.desc Verify Iterable<number> with Set containing overflow/wrap values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(256);
      set.add(-1);
      let result = Uint8Array.from(set);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_4100
     * @tc.name testUint8ArrayFrom041
     * @tc.desc Verify Iterable<number> with Set containing 127 and 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(127);
      set.add(128);
      let result = Uint8Array.from(set);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_4200
     * @tc.name testUint8ArrayFrom042
     * @tc.desc Verify Iterable<number> with Set containing 10 elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      for (let i = 1; i <= 10; i++) {
        set.add(i);
      }
      let result = Uint8Array.from(set);
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_4300
     * @tc.name testUint8ArrayFrom043
     * @tc.desc Verify Iterable<number> with Set containing hex literals
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(0x10);
      set.add(0x20);
      set.add(0x30);
      let result = Uint8Array.from(set);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_4400
     * @tc.name testUint8ArrayFrom044
     * @tc.desc Verify mapfn identity function
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      set.add(2);
      let result = Uint8Array.from(set, (v: number): number => v);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_4500
     * @tc.name testUint8ArrayFrom045
     * @tc.desc Verify mapfn with multiply
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      set.add(2);
      let result = Uint8Array.from(set, (v: number): number => v * 2);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_4600
     * @tc.name testUint8ArrayFrom046
     * @tc.desc Verify mapfn with square
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(2);
      set.add(3);
      let result = Uint8Array.from(set, (v: number): number => v * v);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_4700
     * @tc.name testUint8ArrayFrom047
     * @tc.desc Verify mapfn with modulo
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(10);
      set.add(20);
      let result = Uint8Array.from(set, (v: number): number => v % 3);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_4800
     * @tc.name testUint8ArrayFrom048
     * @tc.desc Verify mapfn with bitwise AND
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(0xFF);
      set.add(0x0F);
      let result = Uint8Array.from(set, (v: number): number => v & 0x0F);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_4900
     * @tc.name testUint8ArrayFrom049
     * @tc.desc Verify mapfn with bitwise OR
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(0xF0);
      set.add(0x0F);
      let result = Uint8Array.from(set, (v: number): number => v | 0x01);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_5000
     * @tc.name testUint8ArrayFrom050
     * @tc.desc Verify mapfn with bitwise XOR
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(0xFF);
      set.add(0x0F);
      let result = Uint8Array.from(set, (v: number): number => v ^ 0xFF);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_5100
     * @tc.name testUint8ArrayFrom051
     * @tc.desc Verify mapfn with left shift
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      set.add(2);
      let result = Uint8Array.from(set, (v: number): number => v << 1);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_5200
     * @tc.name testUint8ArrayFrom052
     * @tc.desc Verify mapfn with right shift
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(4);
      set.add(8);
      let result = Uint8Array.from(set, (v: number): number => v >> 1);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_5300
     * @tc.name testUint8ArrayFrom053
     * @tc.desc Verify mapfn with unsigned right shift
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(4);
      set.add(8);
      let result = Uint8Array.from(set, (v: number): number => v >>> 1);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_5400
     * @tc.name testUint8ArrayFrom054
     * @tc.desc Verify mapfn with bitwise NOT
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(0);
      set.add(1);
      let result = Uint8Array.from(set, (v: number): number => ~v);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_5500
     * @tc.name testUint8ArrayFrom055
     * @tc.desc Verify mapfn with unary plus
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      set.add(2);
      let result = Uint8Array.from(set, (v: number): number => +v);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_5600
     * @tc.name testUint8ArrayFrom056
     * @tc.desc Verify mapfn with unary minus
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      set.add(2);
      let result = Uint8Array.from(set, (v: number): number => -v);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_5700
     * @tc.name testUint8ArrayFrom057
     * @tc.desc Verify mapfn with ternary conditional
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      set.add(2);
      let result = Uint8Array.from(set, (v: number): number => v > 1 ? 100 : 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_5800
     * @tc.name testUint8ArrayFrom058
     * @tc.desc Verify mapfn with Math.floor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      set.add(2);
      let result = Uint8Array.from(set, (v: number): number => Math.floor(v * 1.5));
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_5900
     * @tc.name testUint8ArrayFrom059
     * @tc.desc Verify mapfn with Math.abs
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(-1);
      set.add(-2);
      let result = Uint8Array.from(set, (v: number): number => Math.abs(v));
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_6000
     * @tc.name testUint8ArrayFrom060
     * @tc.desc Verify result is Uint8Array for FixedArray<int> source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2];
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_6100
     * @tc.name testUint8ArrayFrom061
     * @tc.desc Verify length is correct for FixedArray<int> source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2, 3];
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_6200
     * @tc.name testUint8ArrayFrom062
     * @tc.desc Verify result is Uint8Array for Uint8Array source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Uint8Array.of(1, 2, 3);
      let result = Uint8Array.from(src);
      expect(result.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_6300
     * @tc.name testUint8ArrayFrom063
     * @tc.desc Verify length is correct for Uint8Array source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Uint8Array.of(1, 2, 3);
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_6400
     * @tc.name testUint8ArrayFrom064
     * @tc.desc Verify result is Uint8Array for ArrayLike<number> source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = createNumberArray(1);
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_6500
     * @tc.name testUint8ArrayFrom065
     * @tc.desc Verify length is correct for ArrayLike<number> source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = createNumberArray(3);
      let result = Uint8Array.from(src);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_6600
     * @tc.name testUint8ArrayFrom066
     * @tc.desc Verify result is Uint8Array for Iterable<number> source without mapfn
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      let result = Uint8Array.from(set);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_6700
     * @tc.name testUint8ArrayFrom067
     * @tc.desc Verify result is Uint8Array for Iterable<number> source with mapfn
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      let result = Uint8Array.from(set, (v: number): number => v);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_6800
     * @tc.name testUint8ArrayFrom068
     * @tc.desc Verify result is Uint8Array for ArrayLike<BigInt> source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = createBigIntArray(1);
      let result = Uint8Array.from(src, (v: BigInt): number => Number(v));
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_6900
     * @tc.name testUint8ArrayFrom069
     * @tc.desc Verify length is correct for ArrayLike<BigInt> source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = createBigIntArray(3);
      let result = Uint8Array.from(src, (v: BigInt): number => Number(v));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM01_7000
     * @tc.name testUint8ArrayFrom070
     * @tc.desc Verify mapfn throws exception propagation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(1);
      try {
        Uint8Array.from(set, (v: number): number => {
          throw new Error('mapfn error');
        });
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
      }
    });
  });
}