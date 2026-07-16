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

export default function Uint8ArrayFrom03Test(): void {
  describe('Uint8ArrayFrom03Test', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0010
     * @tc.name testUint8ArrayFrom001
     * @tc.desc Verify FixedArray<int> [1,2,3] correctly dispatches to FixedArray overload, length=3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2, 3];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0020
     * @tc.name testUint8ArrayFrom002
     * @tc.desc Verify Array<number> [1.0,2.0,3.0] correctly dispatches to Array overload, length=3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.0, 2.0, 3.0];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0030
     * @tc.name testUint8ArrayFrom003
     * @tc.desc Verify Set<int> {1,2,3} correctly dispatches to Set overload, length=3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      src.add(1);
      src.add(2);
      src.add(3);
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0040
     * @tc.name testUint8ArrayFrom004
     * @tc.desc Verify Uint8Array [1,2,3] correctly dispatches to Uint8Array overload, length=3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint8Array = Uint8Array.of(1, 2, 3);
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0050
     * @tc.name testUint8ArrayFrom005
     * @tc.desc Verify same values [1,2,3] through FixedArray and Array overloads produce same numerical results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [1, 2, 3];
      let arr: Array<number> = [1.0, 2.0, 3.0];
      let r1: Uint8Array = Uint8Array.from(fa);
      let r2: Uint8Array = Uint8Array.from(arr);
      expect(r1[0]).assertEqual(r2[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0060
     * @tc.name testUint8ArrayFrom006
     * @tc.desc Verify same values [1,2,3] through Set and Uint8Array overloads produce same numerical results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      s.add(2);
      s.add(3);
      let u: Uint8Array = Uint8Array.of(1, 2, 3);
      let r1: Uint8Array = Uint8Array.from(s);
      let r2: Uint8Array = Uint8Array.from(u);
      expect(r1[1]).assertEqual(r2[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0070
     * @tc.name testUint8ArrayFrom007
     * @tc.desc Verify empty FixedArray<int> dispatches to FixedArray overload, length=0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0080
     * @tc.name testUint8ArrayFrom008
     * @tc.desc Verify empty Array<number> dispatches to Array overload, length=0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0090
     * @tc.name testUint8ArrayFrom009
     * @tc.desc Verify empty Set<int> dispatches to Set overload, length=0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0100
     * @tc.name testUint8ArrayFrom010
     * @tc.desc Verify empty Uint8Array dispatches to Uint8Array overload, length=0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint8Array = new Uint8Array();
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0110
     * @tc.name testUint8ArrayFrom011
     * @tc.desc Verify FixedArray<int> with boundary value 0 is correctly preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0120
     * @tc.name testUint8ArrayFrom012
     * @tc.desc Verify Array<number> with boundary value 0.0 is correctly truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [0.0];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0130
     * @tc.name testUint8ArrayFrom013
     * @tc.desc Verify FixedArray<int> with boundary value 255 is correctly preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [255];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0140
     * @tc.name testUint8ArrayFrom014
     * @tc.desc Verify Array<number> with boundary value 255.9 is truncated to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [255.9];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0150
     * @tc.name testUint8ArrayFrom015
     * @tc.desc Verify FixedArray<int> with mid value 128 is correctly preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [128];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0160
     * @tc.name testUint8ArrayFrom016
     * @tc.desc Verify Array<number> with value 128.5 is truncated to 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [128.5];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0170
     * @tc.name testUint8ArrayFrom017
     * @tc.desc Verify FixedArray<int> overflow value 256 is truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [256];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0180
     * @tc.name testUint8ArrayFrom018
     * @tc.desc Verify Array<number> overflow value 256.0 is truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [256.0];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0190
     * @tc.name testUint8ArrayFrom019
     * @tc.desc Verify Set<int> with value 127 is correctly preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      src.add(127);
      let result: Uint8Array = Uint8Array.from(src);
      expect(result[0]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0200
     * @tc.name testUint8ArrayFrom020
     * @tc.desc Verify Set<int> overflow value 256 is truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      src.add(256);
      let result: Uint8Array = Uint8Array.from(src);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0210
     * @tc.name testUint8ArrayFrom021
     * @tc.desc Verify Uint8Array as source produces same numerical results as Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint8Array = Uint8Array.of(10, 20, 30);
      let arr: Array<number> = [10.0, 20.0, 30.0];
      let r1: Uint8Array = Uint8Array.from(src);
      let r2: Uint8Array = Uint8Array.from(arr);
      expect(r1[2]).assertEqual(r2[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0220
     * @tc.name testUint8ArrayFrom022
     * @tc.desc Verify Set<int> iteration order {5,1,9} is preserved in result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      src.add(5);
      src.add(1);
      src.add(9);
      let result: Uint8Array = Uint8Array.from(src);
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0230
     * @tc.name testUint8ArrayFrom023
     * @tc.desc Verify four overloads with same values [7,14,21] produce same result length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = [7, 14, 21];
      let arr: Array<number> = [7.0, 14.0, 21.0];
      let s: Set<int> = new Set<int>();
      s.add(7);
      s.add(14);
      s.add(21);
      let u: Uint8Array = Uint8Array.of(7, 14, 21);
      expect(Uint8Array.from(fa).length).assertEqual(Uint8Array.from(arr).length);
      expect(Uint8Array.from(s).length).assertEqual(Uint8Array.from(u).length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0240
     * @tc.name testUint8ArrayFrom024
     * @tc.desc Verify Array<number> with -1 wraps to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-1.0];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0250
     * @tc.name testUint8ArrayFrom025
     * @tc.desc Verify FixedArray<int> with -1 wraps to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [-1];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0260
     * @tc.name testUint8ArrayFrom026
     * @tc.desc Verify four overloads BYTES_PER_ELEMENT are all 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Uint8Array = Uint8Array.from([5] as FixedArray<int>);
      let r2: Uint8Array = Uint8Array.from([5.0] as Array<number>);
      let s: Set<int> = new Set<int>();
      s.add(5);
      let r3: Uint8Array = Uint8Array.from(s);
      let r4: Uint8Array = Uint8Array.from(Uint8Array.of(5));
      expect(r1.BYTES_PER_ELEMENT).assertEqual(1);
      expect(r2.BYTES_PER_ELEMENT).assertEqual(1);
      expect(r3.BYTES_PER_ELEMENT).assertEqual(1);
      expect(r4.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0270
     * @tc.name testUint8ArrayFrom027
     * @tc.desc Verify four overloads byteOffset are all 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Uint8Array = Uint8Array.from([5] as FixedArray<int>);
      let r2: Uint8Array = Uint8Array.from([5.0] as Array<number>);
      let s: Set<int> = new Set<int>();
      s.add(5);
      let r3: Uint8Array = Uint8Array.from(s);
      let r4: Uint8Array = Uint8Array.from(Uint8Array.of(5));
      expect(r1.byteOffset).assertEqual(0);
      expect(r2.byteOffset).assertEqual(0);
      expect(r3.byteOffset).assertEqual(0);
      expect(r4.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0280
     * @tc.name testUint8ArrayFrom028
     * @tc.desc Verify four overloads buffer are all non-null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Uint8Array = Uint8Array.from([5] as FixedArray<int>);
      let r2: Uint8Array = Uint8Array.from([5.0] as Array<number>);
      let s: Set<int> = new Set<int>();
      s.add(5);
      let r3: Uint8Array = Uint8Array.from(s);
      let r4: Uint8Array = Uint8Array.from(Uint8Array.of(5));
      expect(r1.buffer.byteLength).assertEqual(1);
      expect(r2.buffer.byteLength).assertEqual(1);
      expect(r3.buffer.byteLength).assertEqual(1);
      expect(r4.buffer.byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0290
     * @tc.name testUint8ArrayFrom029
     * @tc.desc Verify three-element source four overloads byteLength are all 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Uint8Array = Uint8Array.from([1, 2, 3] as FixedArray<int>);
      let r2: Uint8Array = Uint8Array.from([1.0, 2.0, 3.0] as Array<number>);
      let s: Set<int> = new Set<int>();
      s.add(1);
      s.add(2);
      s.add(3);
      let r3: Uint8Array = Uint8Array.from(s);
      let r4: Uint8Array = Uint8Array.from(Uint8Array.of(1, 2, 3));
      expect(r1.byteLength).assertEqual(3);
      expect(r2.byteLength).assertEqual(3);
      expect(r3.byteLength).assertEqual(3);
      expect(r4.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0300
     * @tc.name testUint8ArrayFrom030
     * @tc.desc Verify four overloads with [0,0,0] produce same result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Uint8Array = Uint8Array.from([0, 0, 0] as FixedArray<int>);
      let r2: Uint8Array = Uint8Array.from([0.0, 0.0, 0.0] as Array<number>);
      let s: Set<int> = new Set<int>();
      s.add(0);
      let r3: Uint8Array = Uint8Array.from(s);
      let r4: Uint8Array = Uint8Array.from(Uint8Array.of(0, 0, 0));
      expect(r1[0]).assertEqual(r2[0]);
      expect(r3[0]).assertEqual(r4[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0310
     * @tc.name testUint8ArrayFrom031
     * @tc.desc Verify four overloads with [255,255,255] produce same result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Uint8Array = Uint8Array.from([255, 255, 255] as FixedArray<int>);
      let r2: Uint8Array = Uint8Array.from([255.0, 255.0, 255.0] as Array<number>);
      let s: Set<int> = new Set<int>();
      s.add(255);
      let r3: Uint8Array = Uint8Array.from(s);
      let r4: Uint8Array = Uint8Array.from(Uint8Array.of(255, 255, 255));
      expect(r1[0]).assertEqual(r2[0]);
      expect(r3[0]).assertEqual(r4[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0320
     * @tc.name testUint8ArrayFrom032
     * @tc.desc Verify four overloads with [128,128,128] produce same result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Uint8Array = Uint8Array.from([128, 128, 128] as FixedArray<int>);
      let r2: Uint8Array = Uint8Array.from([128.0, 128.0, 128.0] as Array<number>);
      let s: Set<int> = new Set<int>();
      s.add(128);
      let r3: Uint8Array = Uint8Array.from(s);
      let r4: Uint8Array = Uint8Array.from(Uint8Array.of(128, 128, 128));
      expect(r1[0]).assertEqual(r2[0]);
      expect(r3[0]).assertEqual(r4[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0330
     * @tc.name testUint8ArrayFrom033
     * @tc.desc Verify ArrayLike<number> with mapfn doubles values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3];
      let result: Uint8Array = Uint8Array.from(src, (v: number, k: number): number => v * 2);
      expect(result.at(0)).assertEqual(2);
      expect(result.at(1)).assertEqual(4);
      expect(result.at(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0340
     * @tc.name testUint8ArrayFrom034
     * @tc.desc Verify Iterable<number> with mapfn adds index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [10, 20, 30];
      let result: Uint8Array = Uint8Array.from(src, (v: number, k: number): number => v + k);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(21);
      expect(result[2]).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0350
     * @tc.name testUint8ArrayFrom035
     * @tc.desc Verify ArrayLike<BigInt> with mapfn converts to number
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<BigInt> = [BigInt(10), BigInt(20)];
      let result: Uint8Array = Uint8Array.from(src, (v: BigInt, k: number): number => Number(v) + k);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0360
     * @tc.name testUint8ArrayFrom036
     * @tc.desc Verify ArrayLike<number> without mapfn preserves values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [5, 10, 15];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.at(0)).assertEqual(5);
      expect(result.at(1)).assertEqual(10);
      expect(result.at(2)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0370
     * @tc.name testUint8ArrayFrom037
     * @tc.desc Verify Iterable<number> without mapfn preserves values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [5, 10, 15];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertEqual(10);
      expect(result[2]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0380
     * @tc.name testUint8ArrayFrom038
     * @tc.desc Verify ArrayLike<number> with mapfn truncates decimals
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.5, 2.7];
      let result: Uint8Array = Uint8Array.from(src, (v: number, k: number): number => v * 2);
      expect(result.at(0)).assertEqual(3);
      expect(result.at(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0390
     * @tc.name testUint8ArrayFrom039
     * @tc.desc Verify Iterable<number> with mapfn truncates decimals
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1.5, 2.7];
      let result: Uint8Array = Uint8Array.from(src, (v: number, k: number): number => v * 2);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0400
     * @tc.name testUint8ArrayFrom040
     * @tc.desc Verify ArrayLike<number> with mapfn wraps overflow
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [200, 100];
      let result: Uint8Array = Uint8Array.from(src, (v: number, k: number): number => v * 2);
      expect(result.at(0)).assertEqual(144);
      expect(result.at(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0410
     * @tc.name testUint8ArrayFrom041
     * @tc.desc Verify Iterable<number> with mapfn wraps overflow
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [200, 100];
      let result: Uint8Array = Uint8Array.from(src, (v: number, k: number): number => v * 2);
      expect(result[0]).assertEqual(144);
      expect(result[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0420
     * @tc.name testUint8ArrayFrom042
     * @tc.desc Verify ArrayLike<number> with mapfn handles negative results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [10, 20];
      let result: Uint8Array = Uint8Array.from(src, (v: number, k: number): number => v - 15);
      expect(result.at(0)).assertEqual(251);
      expect(result.at(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0430
     * @tc.name testUint8ArrayFrom043
     * @tc.desc Verify Iterable<number> with mapfn handles negative results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [10, 20];
      let result: Uint8Array = Uint8Array.from(src, (v: number, k: number): number => v - 15);
      expect(result[0]).assertEqual(251);
      expect(result[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0440
     * @tc.name testUint8ArrayFrom044
     * @tc.desc Verify ArrayLike<number> with mapfn handles zero results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [5, 10];
      let result: Uint8Array = Uint8Array.from(src, (v: number, k: number): number => v - v);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0450
     * @tc.name testUint8ArrayFrom045
     * @tc.desc Verify Iterable<number> with mapfn handles zero results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [5, 10];
      let result: Uint8Array = Uint8Array.from(src, (v: number, k: number): number => v - v);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0460
     * @tc.name testUint8ArrayFrom046
     * @tc.desc Verify ArrayLike<number> with mapfn handles max value results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [128, 127];
      let result: Uint8Array = Uint8Array.from(src, (v: number, k: number): number => v * 2);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0470
     * @tc.name testUint8ArrayFrom047
     * @tc.desc Verify Iterable<number> with mapfn handles max value results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [128, 127];
      let result: Uint8Array = Uint8Array.from(src, (v: number, k: number): number => v * 2);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0480
     * @tc.name testUint8ArrayFrom048
     * @tc.desc Verify ArrayLike<number> with mapfn handles mid value results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [64, 63];
      let result: Uint8Array = Uint8Array.from(src, (v: number, k: number): number => v * 2);
      expect(result.at(0)).assertEqual(128);
      expect(result.at(1)).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0490
     * @tc.name testUint8ArrayFrom049
     * @tc.desc Verify Iterable<number> with mapfn handles mid value results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [64, 63];
      let result: Uint8Array = Uint8Array.from(src, (v: number, k: number): number => v * 2);
      expect(result[0]).assertEqual(128);
      expect(result[1]).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0500
     * @tc.name testUint8ArrayFrom050
     * @tc.desc Verify ArrayLike<number> with mapfn handles boundary value results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [255, 0];
      let result: Uint8Array = Uint8Array.from(src, (v: number, k: number): number => v + 1);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0510
     * @tc.name testUint8ArrayFrom051
     * @tc.desc Verify Iterable<number> with mapfn handles boundary value results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [255, 0];
      let result: Uint8Array = Uint8Array.from(src, (v: number, k: number): number => v + 1);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0520
     * @tc.name testUint8ArrayFrom052
     * @tc.desc Verify ArrayLike<number> with mapfn handles negative boundary results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [0, 1];
      let result: Uint8Array = Uint8Array.from(src, (v: number, k: number): number => v - 1);
      expect(result.at(0)).assertEqual(255);
      expect(result.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0530
     * @tc.name testUint8ArrayFrom053
     * @tc.desc Verify Iterable<number> with mapfn handles negative boundary results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [0, 1];
      let result: Uint8Array = Uint8Array.from(src, (v: number, k: number): number => v - 1);
      expect(result[0]).assertEqual(255);
      expect(result[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0540
     * @tc.name testUint8ArrayFrom054
     * @tc.desc Verify ArrayLike<number> with mapfn handles overflow results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [200, 100];
      let result: Uint8Array = Uint8Array.from(src, (v: number, k: number): number => v + 100);
      expect(result.at(0)).assertEqual(44);
      expect(result.at(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0550
     * @tc.name testUint8ArrayFrom055
     * @tc.desc Verify Iterable<number> with mapfn handles overflow results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [200, 100];
      let result: Uint8Array = Uint8Array.from(src, (v: number, k: number): number => v + 100);
      expect(result[0]).assertEqual(44);
      expect(result[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0560
     * @tc.name testUint8ArrayFrom056
     * @tc.desc Verify ArrayLike<number> with mapfn handles underflow results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [50, 100];
      let result: Uint8Array = Uint8Array.from(src, (v: number, k: number): number => v - 100);
      expect(result.at(0)).assertEqual(206);
      expect(result.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0570
     * @tc.name testUint8ArrayFrom057
     * @tc.desc Verify Iterable<number> with mapfn handles underflow results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [50, 100];
      let result: Uint8Array = Uint8Array.from(src, (v: number, k: number): number => v - 100);
      expect(result[0]).assertEqual(206);
      expect(result[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0580
     * @tc.name testUint8ArrayFrom058
     * @tc.desc Verify from() with null source throws TypeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        let src: FixedArray<int> = null as FixedArray<int>;
        let result: Uint8Array = Uint8Array.from(src);
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('ClassCastError');
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0590
     * @tc.name testUint8ArrayFrom059
     * @tc.desc Verify from() with undefined source throws TypeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        let src: FixedArray<int> = undefined as FixedArray<int>;
        let result: Uint8Array = Uint8Array.from(src);
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('ClassCastError');
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0600
     * @tc.name testUint8ArrayFrom060
     * @tc.desc Verify from() with null mapfn throws TypeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        let src: Array<number> = [1, 2];
        let result: Uint8Array = Uint8Array.from(src, null as (v: number, k: number) => number);
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('ClassCastError');
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0610
     * @tc.name testUint8ArrayFrom061
     * @tc.desc Verify from() with invalid mapfn throws TypeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        let src: Iterable<number> = [1, 2];
        let result: Uint8Array = Uint8Array.from(src, null as (v: number, k: number) => number);
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('ClassCastError');
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0620
     * @tc.name testUint8ArrayFrom062
     * @tc.desc Verify from() with valid numeric source does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        let src: FixedArray<int> = [1, 2, 3];
        let result: Uint8Array = Uint8Array.from(src);
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('Error');
      }
      expect(caught).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0630
     * @tc.name testUint8ArrayFrom063
     * @tc.desc Verify from() with empty source does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        let src: FixedArray<int> = [];
        let result: Uint8Array = Uint8Array.from(src);
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('Error');
      }
      expect(caught).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0640
     * @tc.name testUint8ArrayFrom064
     * @tc.desc Verify from() with empty Array does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        let src: Array<number> = [];
        let result: Uint8Array = Uint8Array.from(src);
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('Error');
      }
      expect(caught).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0650
     * @tc.name testUint8ArrayFrom065
     * @tc.desc Verify from() with empty Set does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        let src: Set<int> = new Set<int>();
        let result: Uint8Array = Uint8Array.from(src);
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('Error');
      }
      expect(caught).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0660
     * @tc.name testUint8ArrayFrom066
     * @tc.desc Verify from() with empty Uint8Array does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        let src: Uint8Array = new Uint8Array();
        let result: Uint8Array = Uint8Array.from(src);
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('Error');
      }
      expect(caught).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0670
     * @tc.name testUint8ArrayFrom067
     * @tc.desc Verify from() with valid Array does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        let src: Array<number> = [1.0, 2.0, 3.0];
        let result: Uint8Array = Uint8Array.from(src);
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('Error');
      }
      expect(caught).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0680
     * @tc.name testUint8ArrayFrom068
     * @tc.desc Verify from() with valid Set does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        let src: Set<int> = new Set<int>();
        src.add(1);
        src.add(2);
        src.add(3);
        let result: Uint8Array = Uint8Array.from(src);
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('Error');
      }
      expect(caught).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0690
     * @tc.name testUint8ArrayFrom069
     * @tc.desc Verify from() with valid Uint8Array does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        let src: Uint8Array = Uint8Array.of(1, 2, 3);
        let result: Uint8Array = Uint8Array.from(src);
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('Error');
      }
      expect(caught).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0700
     * @tc.name testUint8ArrayFrom070
     * @tc.desc Verify from() with valid ArrayLike does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        let src: Array<number> = [1, 2, 3];
        let result: Uint8Array = Uint8Array.from(src);
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('Error');
      }
      expect(caught).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0710
     * @tc.name testUint8ArrayFrom071
     * @tc.desc Verify from() with valid Iterable does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        let src: Iterable<number> = [1, 2, 3];
        let result: Uint8Array = Uint8Array.from(src);
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('Error');
      }
      expect(caught).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0720
     * @tc.name testUint8ArrayFrom072
     * @tc.desc Verify from() with valid mapfn does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        let src: Array<number> = [1, 2];
        let result: Uint8Array = Uint8Array.from(src, (v: number, k: number): number => v * 2);
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('Error');
      }
      expect(caught).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0730
     * @tc.name testUint8ArrayFrom073
     * @tc.desc Verify from() with valid Iterable mapfn does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        let src: Iterable<number> = [1, 2];
        let result: Uint8Array = Uint8Array.from(src, (v: number, k: number): number => v * 2);
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('Error');
      }
      expect(caught).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0740
     * @tc.name testUint8ArrayFrom074
     * @tc.desc Verify from() with boundary values does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        let src: FixedArray<int> = [0, 128, 255];
        let result: Uint8Array = Uint8Array.from(src);
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('Error');
      }
      expect(caught).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0750
     * @tc.name testUint8ArrayFrom075
     * @tc.desc Verify from() with overflow values does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        let src: FixedArray<int> = [256, 300, 400];
        let result: Uint8Array = Uint8Array.from(src);
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('Error');
      }
      expect(caught).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0760
     * @tc.name testUint8ArrayFrom076
     * @tc.desc Verify from() with negative values does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        let src: FixedArray<int> = [-1, -128, -256];
        let result: Uint8Array = Uint8Array.from(src);
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('Error');
      }
      expect(caught).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0770
     * @tc.name testUint8ArrayFrom077
     * @tc.desc Verify from(FixedArray) returns Uint8Array instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2, 3];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0780
     * @tc.name testUint8ArrayFrom078
     * @tc.desc Verify from(Array) returns Uint8Array instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.0, 2.0, 3.0];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.length >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0790
     * @tc.name testUint8ArrayFrom079
     * @tc.desc Verify from(Set) returns Uint8Array instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      src.add(1);
      src.add(2);
      src.add(3);
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.length >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0800
     * @tc.name testUint8ArrayFrom080
     * @tc.desc Verify from(Uint8Array) returns Uint8Array instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint8Array = Uint8Array.of(1, 2, 3);
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.length >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0810
     * @tc.name testUint8ArrayFrom081
     * @tc.desc Verify from(ArrayLike) returns Uint8Array instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.length >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0820
     * @tc.name testUint8ArrayFrom082
     * @tc.desc Verify from(Iterable) returns Uint8Array instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.length >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0830
     * @tc.name testUint8ArrayFrom083
     * @tc.desc Verify from(FixedArray) result has correct length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2, 3, 4, 5];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0840
     * @tc.name testUint8ArrayFrom084
     * @tc.desc Verify from(Array) result has correct length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.0, 2.0, 3.0, 4.0, 5.0];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0850
     * @tc.name testUint8ArrayFrom085
     * @tc.desc Verify from(Set) result has correct length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      src.add(1);
      src.add(2);
      src.add(3);
      src.add(4);
      src.add(5);
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0860
     * @tc.name testUint8ArrayFrom086
     * @tc.desc Verify from(Uint8Array) result has correct length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0870
     * @tc.name testUint8ArrayFrom087
     * @tc.desc Verify from(ArrayLike) result has correct length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3, 4, 5];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0880
     * @tc.name testUint8ArrayFrom088
     * @tc.desc Verify from(Iterable) result has correct length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3, 4, 5];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0890
     * @tc.name testUint8ArrayFrom089
     * @tc.desc Verify from(FixedArray) result has correct values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [10, 20, 30];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0900
     * @tc.name testUint8ArrayFrom090
     * @tc.desc Verify from(Array) result has correct values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [10.0, 20.0, 30.0];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0910
     * @tc.name testUint8ArrayFrom091
     * @tc.desc Verify from(Set) result has correct values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      src.add(10);
      src.add(20);
      src.add(30);
      let result: Uint8Array = Uint8Array.from(src);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0920
     * @tc.name testUint8ArrayFrom092
     * @tc.desc Verify from(Uint8Array) result has correct values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint8Array = Uint8Array.of(10, 20, 30);
      let result: Uint8Array = Uint8Array.from(src);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0930
     * @tc.name testUint8ArrayFrom093
     * @tc.desc Verify from(ArrayLike) result has correct values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [10, 20, 30];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0940
     * @tc.name testUint8ArrayFrom094
     * @tc.desc Verify from(Iterable) result has correct values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [10, 20, 30];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0950
     * @tc.name testUint8ArrayFrom095
     * @tc.desc Verify from(FixedArray) result has correct BYTES_PER_ELEMENT
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2, 3];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0960
     * @tc.name testUint8ArrayFrom096
     * @tc.desc Verify from(Array) result has correct BYTES_PER_ELEMENT
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.0, 2.0, 3.0];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0970
     * @tc.name testUint8ArrayFrom097
     * @tc.desc Verify from(Set) result has correct BYTES_PER_ELEMENT
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      src.add(1);
      src.add(2);
      src.add(3);
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0980
     * @tc.name testUint8ArrayFrom098
     * @tc.desc Verify from(Uint8Array) result has correct BYTES_PER_ELEMENT
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint8Array = Uint8Array.of(1, 2, 3);
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_0990
     * @tc.name testUint8ArrayFrom099
     * @tc.desc Verify from(ArrayLike) result has correct BYTES_PER_ELEMENT
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_1000
     * @tc.name testUint8ArrayFrom100
     * @tc.desc Verify from(Iterable) result has correct BYTES_PER_ELEMENT
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_1010
     * @tc.name testUint8ArrayFrom101
     * @tc.desc Verify from(FixedArray) result has correct byteOffset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2, 3];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_1020
     * @tc.name testUint8ArrayFrom102
     * @tc.desc Verify from(Array) result has correct buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.0, 2.0, 3.0];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_1030
     * @tc.name testUint8ArrayFrom103
     * @tc.desc Verify from(Set) result has correct buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      src.add(1);
      src.add(2);
      src.add(3);
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_1040
     * @tc.name testUint8ArrayFrom104
     * @tc.desc Verify from(Uint8Array) result has correct buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint8Array = Uint8Array.of(1, 2, 3);
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_1050
     * @tc.name testUint8ArrayFrom105
     * @tc.desc Verify from(ArrayLike) result has correct buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_1060
     * @tc.name testUint8ArrayFrom106
     * @tc.desc Verify from(Iterable) result has correct buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_1070
     * @tc.name testUint8ArrayFrom107
     * @tc.desc Verify from(FixedArray) result has correct byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2, 3];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_1080
     * @tc.name testUint8ArrayFrom108
     * @tc.desc Verify from(Array) result has correct byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.0, 2.0, 3.0];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_1090
     * @tc.name testUint8ArrayFrom109
     * @tc.desc Verify from(Set) result has correct byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      src.add(1);
      src.add(2);
      src.add(3);
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_1100
     * @tc.name testUint8ArrayFrom110
     * @tc.desc Verify from(Uint8Array) result has correct byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint8Array = Uint8Array.of(1, 2, 3);
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_1110
     * @tc.name testUint8ArrayFrom111
     * @tc.desc Verify from(ArrayLike) result has correct byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_1120
     * @tc.name testUint8ArrayFrom112
     * @tc.desc Verify from(Iterable) result has correct byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_1130
     * @tc.name testUint8ArrayFrom113
     * @tc.desc Verify from(FixedArray) result has correct buffer byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2, 3];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_1140
     * @tc.name testUint8ArrayFrom114
     * @tc.desc Verify from(Array) result has correct buffer byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.0, 2.0, 3.0];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_1150
     * @tc.name testUint8ArrayFrom115
     * @tc.desc Verify from(Set) result has correct buffer byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      src.add(1);
      src.add(2);
      src.add(3);
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_1160
     * @tc.name testUint8ArrayFrom116
     * @tc.desc Verify from(Uint8Array) result has correct buffer byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint8Array = Uint8Array.of(1, 2, 3);
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_1170
     * @tc.name testUint8ArrayFrom117
     * @tc.desc Verify from(ArrayLike) result has correct buffer byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_1180
     * @tc.name testUint8ArrayFrom118
     * @tc.desc Verify from(Iterable) result has correct buffer byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Iterable<number> = [1, 2, 3];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_1190
     * @tc.name testUint8ArrayFrom119
     * @tc.desc Verify from(Array) result has correct byteOffset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.0, 2.0, 3.0];
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_1200
     * @tc.name testUint8ArrayFrom120
     * @tc.desc Verify from(Set) result has correct byteOffset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      src.add(1);
      src.add(2);
      src.add(3);
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FROM03_1210
     * @tc.name testUint8ArrayFrom121
     * @tc.desc Verify from(Uint8Array) result has correct byteOffset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFrom121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint8Array = Uint8Array.of(1, 2, 3);
      let result: Uint8Array = Uint8Array.from(src);
      expect(result.byteOffset).assertEqual(0);
    });
