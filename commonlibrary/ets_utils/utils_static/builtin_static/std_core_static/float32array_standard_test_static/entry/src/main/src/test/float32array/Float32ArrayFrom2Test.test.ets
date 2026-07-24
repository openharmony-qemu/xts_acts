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
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Float32ArrayFrom2Test(): void {
  describe('Float32ArrayFrom2Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0010
     * @tc.name testFloat32ArrayFromTWO001
     * @tc.desc Verify accepts 1 Set argument, returns Float32Array with length matching set size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(10.0);
      source.add(20.0);
      const result = Float32Array.from(source);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0020
     * @tc.name testFloat32ArrayFromTWO002
     * @tc.desc Verify empty Set creates empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      const result = Float32Array.from(source);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0030
     * @tc.name testFloat32ArrayFromTWO003
     * @tc.desc Verify single-element Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(1.0);
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0040
     * @tc.name testFloat32ArrayFromTWO004
     * @tc.desc Verify Set iteration order preserves insertion order {3,1,2}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(3.0);
      source.add(1.0);
      source.add(2.0);
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0050
     * @tc.name testFloat32ArrayFromTWO005
     * @tc.desc Verify Set deduplicates identical values {1,1,1} length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(1.0);
      source.add(1.0);
      source.add(1.0);
      const result = Float32Array.from(source);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0060
     * @tc.name testFloat32ArrayFromTWO006
     * @tc.desc Verify Set deduplicates mixed values {1,2,1} length 2 order [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(1.0);
      source.add(2.0);
      source.add(1.0);
      const result = Float32Array.from(source);
      expect(result.length).assertEqual(2);
      expect(result.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0070
     * @tc.name testFloat32ArrayFromTWO007
     * @tc.desc Verify Set contains positive zero +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(0.0);
      const result = Float32Array.from(source);
      expect(1.0 / result.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0080
     * @tc.name testFloat32ArrayFromTWO008
     * @tc.desc Verify Set treats +0 and -0 as same value, deduplicates, length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(0.0);
      source.add(-0.0);
      const result = Float32Array.from(source);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0090
     * @tc.name testFloat32ArrayFromTWO009
     * @tc.desc Verify Set contains Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(Infinity);
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0100
     * @tc.name testFloat32ArrayFromTWO010
     * @tc.desc Verify Set contains -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(-Infinity);
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0110
     * @tc.name testFloat32ArrayFromTWO011
     * @tc.desc Verify Set contains NaN and NaN is deduplicated, length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(NaN);
      source.add(NaN);
      const result = Float32Array.from(source);
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0120
     * @tc.name testFloat32ArrayFromTWO012
     * @tc.desc Verify Set contains Float32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(3.4028234663852886e+38);
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0130
     * @tc.name testFloat32ArrayFromTWO013
     * @tc.desc Verify Set contains Float32.MIN_NORMAL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(1.1754943508222875e-38);
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0140
     * @tc.name testFloat32ArrayFromTWO014
     * @tc.desc Verify Set contains Float32.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(1.401298464324817e-45);
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0150
     * @tc.name testFloat32ArrayFromTWO015
     * @tc.desc Verify Set contains smallest finite negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(-3.4028234663852886e+38);
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0160
     * @tc.name testFloat32ArrayFromTWO016
     * @tc.desc Verify Set contains 0.1 truncated by float32 precision (compare against direct construction)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(0.1);
      const result = Float32Array.from(source);
      const ref = new Float32Array(1);
      ref.$_set(0, 0.1);
      expect(result.$_get(0)).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0170
     * @tc.name testFloat32ArrayFromTWO017
     * @tc.desc Verify Set contains 0.2 truncated by float32 precision (compare against direct construction)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(0.2);
      const result = Float32Array.from(source);
      const ref = new Float32Array(1);
      ref.$_set(0, 0.2);
      expect(result.$_get(0)).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0180
     * @tc.name testFloat32ArrayFromTWO018
     * @tc.desc Verify Set contains 0.3 truncated by float32 precision (compare against direct construction)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(0.3);
      const result = Float32Array.from(source);
      const ref = new Float32Array(1);
      ref.$_set(0, 0.3);
      expect(result.$_get(0)).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0190
     * @tc.name testFloat32ArrayFromTWO019
     * @tc.desc Verify Set contains 16777216 i.e. 2^24 exact integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(16777216);
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0200
     * @tc.name testFloat32ArrayFromTWO020
     * @tc.desc Verify Set contains 16777217 truncated to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(16777217);
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0210
     * @tc.name testFloat32ArrayFromTWO021
     * @tc.desc Verify Set contains 1.0e40 overflows to Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(1.0e40);
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0220
     * @tc.name testFloat32ArrayFromTWO022
     * @tc.desc Verify Set contains -1.0e40 overflows to -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(-1.0e40);
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0230
     * @tc.name testFloat32ArrayFromTWO023
     * @tc.desc Verify Set contains 1.0e-46 underflows to positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(1.0e-46);
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0240
     * @tc.name testFloat32ArrayFromTWO024
     * @tc.desc Verify Set contains int max 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(2147483647);
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0250
     * @tc.name testFloat32ArrayFromTWO025
     * @tc.desc Verify Set contains int min -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(-2147483648);
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0260
     * @tc.name testFloat32ArrayFromTWO026
     * @tc.desc Verify Set contains scientific notation 1.0e3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(1.0e3);
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0270
     * @tc.name testFloat32ArrayFromTWO027
     * @tc.desc Verify Set contains hexadecimal float 9.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(9.0);
      const result = Float32Array.from(source);
      const ref = new Float32Array(1);
      ref.$_set(0, 9.0);
      expect(result.$_get(0)).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0280
     * @tc.name testFloat32ArrayFromTWO028
     * @tc.desc Verify Set contains negative values {-5,-10}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(-5.0);
      source.add(-10.0);
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(-5);
      expect(result.$_get(1)).assertEqual(-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0290
     * @tc.name testFloat32ArrayFromTWO029
     * @tc.desc Verify Set with mixed special values {NaN,Infinity,-Infinity,0} does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(NaN);
      source.add(Infinity);
      source.add(-Infinity);
      source.add(0.0);
      const result = Float32Array.from(source);
      expect(result.length).assertEqual(4);
      expect(result.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0300
     * @tc.name testFloat32ArrayFromTWO030
     * @tc.desc Verify Set with 100 elements bulk write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      for (let i = 0; i < 100; i++) {
        source.add(i * 1.0);
      }
      const result = Float32Array.from(source);
      expect(result.length).assertEqual(100);
      expect(result.$_get(99)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0310
     * @tc.name testFloat32ArrayFromTWO031
     * @tc.desc Verify after deleting element, from reflects remaining elements {1,2,3} delete 2 yields [1,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(1.0);
      source.add(2.0);
      source.add(3.0);
      source.delete(2.0);
      const result = Float32Array.from(source);
      expect(result.length).assertEqual(2);
      expect(result.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0320
     * @tc.name testFloat32ArrayFromTWO032
     * @tc.desc Verify return value type is Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(1.0);
      const result = Float32Array.from(source);
      expect(result instanceof Float32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0330
     * @tc.name testFloat32ArrayFromTWO033
     * @tc.desc Verify returned array length equals Set size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(1.0);
      source.add(2.0);
      source.add(3.0);
      const result = Float32Array.from(source);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0340
     * @tc.name testFloat32ArrayFromTWO034
     * @tc.desc Verify returned array byteLength equals length times 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(1.0);
      source.add(2.0);
      const result = Float32Array.from(source);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0350
     * @tc.name testFloat32ArrayFromTWO035
     * @tc.desc Verify returned array byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(1.0);
      const result = Float32Array.from(source);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0360
     * @tc.name testFloat32ArrayFromTWO036
     * @tc.desc Verify modifying returned array does not affect original Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(1.0);
      source.add(2.0);
      const result = Float32Array.from(source);
      result.$_set(0, 999.0);
      const again = Float32Array.from(source);
      expect(again.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0370
     * @tc.name testFloat32ArrayFromTWO037
     * @tc.desc Verify accepts 1 Array argument returns Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [10.0, 20.0];
      const result = Float32Array.from(source);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0380
     * @tc.name testFloat32ArrayFromTWO038
     * @tc.desc Verify empty Array creates empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [];
      const result = Float32Array.from(source);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0390
     * @tc.name testFloat32ArrayFromTWO039
     * @tc.desc Verify single-element Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [1.0];
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0400
     * @tc.name testFloat32ArrayFromTWO040
     * @tc.desc Verify multi-element Array length and last element correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [0x10, 0b1010, -1.0, 0.0, 1000000.0];
      const result = Float32Array.from(source);
      expect(result.length).assertEqual(5);
      expect(result.$_get(4)).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0410
     * @tc.name testFloat32ArrayFromTWO041
     * @tc.desc Verify Array order preserved for static values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [0x10, -1.0, 0b1010];
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(16);
      expect(result.$_get(2)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0420
     * @tc.name testFloat32ArrayFromTWO042
     * @tc.desc Verify Array duplicate binary values are not deduplicated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [0b1010, 0b1010, 0b1010];
      const result = Float32Array.from(source);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0430
     * @tc.name testFloat32ArrayFromTWO043
     * @tc.desc Verify Array contains positive zero +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [0.0];
      const result = Float32Array.from(source);
      expect(1.0 / result.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0440
     * @tc.name testFloat32ArrayFromTWO044
     * @tc.desc Verify Array contains negative zero -0 and preserves sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [-0.0];
      const result = Float32Array.from(source);
      expect(1.0 / result.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0450
     * @tc.name testFloat32ArrayFromTWO045
     * @tc.desc Verify Array contains Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [Infinity];
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0460
     * @tc.name testFloat32ArrayFromTWO046
     * @tc.desc Verify Array contains -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [-Infinity];
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0470
     * @tc.name testFloat32ArrayFromTWO047
     * @tc.desc Verify Array contains NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [NaN];
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0480
     * @tc.name testFloat32ArrayFromTWO048
     * @tc.desc Verify Array contains Float32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [3.4028234663852886e+38];
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0490
     * @tc.name testFloat32ArrayFromTWO049
     * @tc.desc Verify Array contains Float32.MIN_NORMAL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [1.1754943508222875e-38];
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0500
     * @tc.name testFloat32ArrayFromTWO050
     * @tc.desc Verify Array contains Float32.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [1.401298464324817e-45];
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0510
     * @tc.name testFloat32ArrayFromTWO051
     * @tc.desc Verify Array contains smallest finite negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [-3.4028234663852886e+38];
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0520
     * @tc.name testFloat32ArrayFromTWO052
     * @tc.desc Verify Array contains 0.1 truncated by float32 precision (compare against direct construction)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [0.1];
      const result = Float32Array.from(source);
      const ref = new Float32Array(1);
      ref.$_set(0, 0.1);
      expect(result.$_get(0)).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0530
     * @tc.name testFloat32ArrayFromTWO053
     * @tc.desc Verify Array contains 0.2 truncated by float32 precision (compare against direct construction)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [0.2];
      const result = Float32Array.from(source);
      const ref = new Float32Array(1);
      ref.$_set(0, 0.2);
      expect(result.$_get(0)).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0540
     * @tc.name testFloat32ArrayFromTWO054
     * @tc.desc Verify Array contains 0.3 truncated by float32 precision (compare against direct construction)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [0.3];
      const result = Float32Array.from(source);
      const ref = new Float32Array(1);
      ref.$_set(0, 0.3);
      expect(result.$_get(0)).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0550
     * @tc.name testFloat32ArrayFromTWO055
     * @tc.desc Verify Array contains 16777216 i.e. 2^24 exact integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [16777216];
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0560
     * @tc.name testFloat32ArrayFromTWO056
     * @tc.desc Verify Array contains 16777217 truncated to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [16777217];
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0570
     * @tc.name testFloat32ArrayFromTWO057
     * @tc.desc Verify Array contains 1.0e40 overflows to Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [1.0e40];
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0580
     * @tc.name testFloat32ArrayFromTWO058
     * @tc.desc Verify Array contains 1.0e-46 underflows to positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [1.0e-46];
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0590
     * @tc.name testFloat32ArrayFromTWO059
     * @tc.desc Verify Array contains int max 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [2147483647];
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0600
     * @tc.name testFloat32ArrayFromTWO060
     * @tc.desc Verify Array contains int min -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [-2147483648];
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0610
     * @tc.name testFloat32ArrayFromTWO061
     * @tc.desc Verify Array contains scientific notation 1.0e3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [1.0e3];
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0620
     * @tc.name testFloat32ArrayFromTWO062
     * @tc.desc Verify Array contains hexadecimal float 9.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [9.0];
      const result = Float32Array.from(source);
      const ref = new Float32Array(1);
      ref.$_set(0, 9.0);
      expect(result.$_get(0)).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0630
     * @tc.name testFloat32ArrayFromTWO063
     * @tc.desc Verify Array contains negative values [-5,-10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [-5.0, -10.0];
      const result = Float32Array.from(source);
      expect(result.$_get(0)).assertEqual(-5);
      expect(result.$_get(1)).assertEqual(-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0640
     * @tc.name testFloat32ArrayFromTWO064
     * @tc.desc Verify Array all identical values [7,7,7,7] not deduplicated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [7.0, 7.0, 7.0, 7.0];
      const result = Float32Array.from(source);
      expect(result.length).assertEqual(4);
      expect(result.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0650
     * @tc.name testFloat32ArrayFromTWO065
     * @tc.desc Verify Array with mixed special values [NaN,Infinity,-Infinity,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [NaN, Infinity, -Infinity, 0.0];
      const result = Float32Array.from(source);
      expect(result.length).assertEqual(4);
      expect(result.$_get(0)).assertNaN();
      expect(result.$_get(2)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0660
     * @tc.name testFloat32ArrayFromTWO066
     * @tc.desc Verify Array with 100 elements bulk write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [];
      for (let i = 0; i < 100; i++) {
        source.push(i * 1.0);
      }
      const result = Float32Array.from(source);
      expect(result.length).assertEqual(100);
      expect(result.$_get(50)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0670
     * @tc.name testFloat32ArrayFromTWO067
     * @tc.desc Verify Array contains 0.1 and 0.2 coexisting, precision array element-by-element reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [0.1, 0.2];
      const result = Float32Array.from(source);
      const ref = new Float32Array(2);
      ref.$_set(0, 0.1);
      ref.$_set(1, 0.2);
      expect(result.$_get(0)).assertEqual(ref.$_get(0));
      expect(result.$_get(1)).assertEqual(ref.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0680
     * @tc.name testFloat32ArrayFromTWO068
     * @tc.desc Verify return value type is Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [1.0];
      const result = Float32Array.from(source);
      expect(result instanceof Float32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0690
     * @tc.name testFloat32ArrayFromTWO069
     * @tc.desc Verify returned array length equals source Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [0x10, 0b1010, -1.0];
      const result = Float32Array.from(source);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0700
     * @tc.name testFloat32ArrayFromTWO070
     * @tc.desc Verify returned array byteLength equals length times 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [1.0, 2.0];
      const result = Float32Array.from(source);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0710
     * @tc.name testFloat32ArrayFromTWO071
     * @tc.desc Verify returned array byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [1.0];
      const result = Float32Array.from(source);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0720
     * @tc.name testFloat32ArrayFromTWO072
     * @tc.desc Verify modifying returned array does not affect original Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [1.0, 2.0];
      const result = Float32Array.from(source);
      result.$_set(0, 999.0);
      expect(source[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0730
     * @tc.name testFloat32ArrayFromTWO073
     * @tc.desc Verify accepts 2 arguments arrayLike and mapfn, returns transformed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0];
      const result = Float32Array.from<number>(src, (v, k) => v * 2.0);
      expect(result.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0740
     * @tc.name testFloat32ArrayFromTWO074
     * @tc.desc Verify when ArrayLike is empty, mapfn is not called, returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called = false;
      const src: Array<number> = [];
      const result = Float32Array.from<number>(src, (v, k) => {
        called = true;
        return v;
      });
      expect(result.length).assertEqual(0);
      expect(called).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0750
     * @tc.name testFloat32ArrayFromTWO075
     * @tc.desc Verify single-element ArrayLike transformed via mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [5.0];
      const result = Float32Array.from<number>(src, (v, k) => v + 1.0);
      expect(result.$_get(0)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0760
     * @tc.name testFloat32ArrayFromTWO076
     * @tc.desc Verify multi-element ArrayLike transformed via mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0x10, 0b1010, -1.0];
      const result = Float32Array.from<number>(src, (v, k) => v + 1.0);
      expect(result.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0770
     * @tc.name testFloat32ArrayFromTWO077
     * @tc.desc Verify ArrayLike<string> to number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ["1", "2", "3"];
      const result = Float32Array.from<string>(src, (v, k) => Number(v));
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0780
     * @tc.name testFloat32ArrayFromTWO078
     * @tc.desc Verify ArrayLike<string> uses index to construct numeric sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ["a", "b", "c"];
      const result = Float32Array.from<string>(src, (v, k) => k + 10);
      expect(result.$_get(0)).assertEqual(10);
      expect(result.$_get(2)).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0790
     * @tc.name testFloat32ArrayFromTWO079
     * @tc.desc Verify ArrayLike<number> identity mapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0x10, 0b1010, -1.0];
      const result = Float32Array.from<number>(src, (v, k) => v);
      expect(result.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0800
     * @tc.name testFloat32ArrayFromTWO080
     * @tc.desc Verify ArrayLike returns index sequence, verifies k increments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0.0, 0.0, 0.0, 0.0];
      const result = Float32Array.from<number>(src, (v, k) => k);
      expect(result.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0810
     * @tc.name testFloat32ArrayFromTWO081
     * @tc.desc Verify mapfn returns constant 5.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0x10, 0b1010, -1.0];
      const result = Float32Array.from<number>(src, (v, k) => 5.0);
      expect(result.$_get(0)).assertEqual(5);
      expect(result.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0820
     * @tc.name testFloat32ArrayFromTWO082
     * @tc.desc Verify mapfn returns value times 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0x10, 0b1010, -1.0];
      const result = Float32Array.from<number>(src, (v, k) => v * 2.0);
      expect(result.$_get(2)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0830
     * @tc.name testFloat32ArrayFromTWO083
     * @tc.desc Verify mapfn returns value plus k
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0x10, 0b1010, -1.0];
      const result = Float32Array.from<number>(src, (v, k) => v + k);
      expect(result.$_get(0)).assertEqual(16);
      expect(result.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0840
     * @tc.name testFloat32ArrayFromTWO084
     * @tc.desc Verify mapfn returns 0.1+0.2 truncated by float32 precision (compare against direct construction)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0];
      const result = Float32Array.from<number>(src, (v, k) => 0.1 + 0.2);
      const ref = new Float32Array(1);
      ref.$_set(0, 0.1 + 0.2);
      expect(result.$_get(0)).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0850
     * @tc.name testFloat32ArrayFromTWO085
     * @tc.desc Verify mapfn returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0];
      const result = Float32Array.from<number>(src, (v, k) => Infinity);
      expect(result.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0860
     * @tc.name testFloat32ArrayFromTWO086
     * @tc.desc Verify mapfn returns -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0];
      const result = Float32Array.from<number>(src, (v, k) => -Infinity);
      expect(result.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0870
     * @tc.name testFloat32ArrayFromTWO087
     * @tc.desc Verify mapfn returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0];
      const result = Float32Array.from<number>(src, (v, k) => NaN);
      expect(result.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0880
     * @tc.name testFloat32ArrayFromTWO088
     * @tc.desc Verify mapfn returns Float32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0];
      const result = Float32Array.from<number>(src, (v, k) => 3.4028234663852886e+38);
      expect(result.$_get(0)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0890
     * @tc.name testFloat32ArrayFromTWO089
     * @tc.desc Verify mapfn returns Float32.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0];
      const result = Float32Array.from<number>(src, (v, k) => 1.401298464324817e-45);
      expect(result.$_get(0)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0900
     * @tc.name testFloat32ArrayFromTWO090
     * @tc.desc Verify mapfn returns Float32.MIN_NORMAL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0];
      const result = Float32Array.from<number>(src, (v, k) => 1.1754943508222875e-38);
      expect(result.$_get(0)).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0910
     * @tc.name testFloat32ArrayFromTWO091
     * @tc.desc Verify mapfn returns 16777217 truncated to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0];
      const result = Float32Array.from<number>(src, (v, k) => 16777217);
      expect(result.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0920
     * @tc.name testFloat32ArrayFromTWO092
     * @tc.desc Verify mapfn returns 1.0e40 overflows to Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0];
      const result = Float32Array.from<number>(src, (v, k) => 1.0e40);
      expect(result.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0930
     * @tc.name testFloat32ArrayFromTWO093
     * @tc.desc Verify mapfn returns 1.0e-46 underflows to positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0];
      const result = Float32Array.from<number>(src, (v, k) => 1.0e-46);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0940
     * @tc.name testFloat32ArrayFromTWO094
     * @tc.desc Verify mapfn returns 1.0000001 truncated by float32 precision (compare against direct construction)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0];
      const result = Float32Array.from<number>(src, (v, k) => 1.0000001);
      const ref = new Float32Array(1);
      ref.$_set(0, 1.0000001);
      expect(result.$_get(0)).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0950
     * @tc.name testFloat32ArrayFromTWO095
     * @tc.desc Verify mapfn returns int max 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0];
      const result = Float32Array.from<number>(src, (v, k) => 2147483647);
      expect(result.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0960
     * @tc.name testFloat32ArrayFromTWO096
     * @tc.desc Verify mapfn returns int min -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0];
      const result = Float32Array.from<number>(src, (v, k) => -2147483648);
      expect(result.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0970
     * @tc.name testFloat32ArrayFromTWO097
     * @tc.desc Verify mapfn returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0];
      const result = Float32Array.from<number>(src, (v, k) => 0);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0980
     * @tc.name testFloat32ArrayFromTWO098
     * @tc.desc Verify mapfn returns negative value -3.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0];
      const result = Float32Array.from<number>(src, (v, k) => -3.5);
      expect(result.$_get(0)).assertEqual(-3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_0990
     * @tc.name testFloat32ArrayFromTWO099
     * @tc.desc Verify mapfn arrow function returns v minus k
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0x10, 0b1010, -1.0];
      const result = Float32Array.from<number>(src, (v, k) => v - k);
      expect(result.$_get(2)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_1000
     * @tc.name testFloat32ArrayFromTWO100
     * @tc.desc Verify mapfn named const function returns v times 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0x10, 0b1010, -1.0];
      const tripler = (v: number, k: number): number => v * 3.0;
      const result = Float32Array.from(src, tripler);
      expect(result.$_get(2)).assertEqual(-3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_1010
     * @tc.name testFloat32ArrayFromTWO101
     * @tc.desc Verify mapfn reads external const offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const offset = 100;
      const src: Array<number> = [1.0, 2.0];
      const result = Float32Array.from<number>(src, (v, k) => v + offset);
      expect(result.$_get(1)).assertEqual(102);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_1020
     * @tc.name testFloat32ArrayFromTWO102
     * @tc.desc Verify mapfn modifies external counter, accumulates call count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      const src: Array<number> = [0x10, 0b1010, -1.0];
      const result = Float32Array.from<number>(src, (v, k) => {
        count = count + 1;
        return v;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_1030
     * @tc.name testFloat32ArrayFromTWO103
     * @tc.desc Verify mapfn call count equals source length (5 elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calls = 0;
      const src: Array<number> = [0x10, 0b1010, -1.0, 0.0, 1000000.0];
      const result = Float32Array.from<number>(src, (v, k) => {
        calls = calls + 1;
        return v;
      });
      expect(calls).assertEqual(5);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_1040
     * @tc.name testFloat32ArrayFromTWO104
     * @tc.desc Verify mapfn first element index is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstK = -1;
      const src: Array<number> = [5.0, 6.0];
      const result = Float32Array.from(src, (v, k) => {
        if (firstK === -1) {
          firstK = k.toInt();
        }
        return v;
      });
      expect(firstK).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_1050
     * @tc.name testFloat32ArrayFromTWO105
     * @tc.desc Verify mapfn nested call to another function scale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const scale = (x: number): number => x * 10;
      const src: Array<number> = [1.0, 2.0];
      const result = Float32Array.from<number>(src, (v, k) => scale(v) + k);
      expect(result.$_get(0)).assertEqual(10);
      expect(result.$_get(1)).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_1060
     * @tc.name testFloat32ArrayFromTWO106
     * @tc.desc Verify return value type is Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0];
      const result = Float32Array.from<number>(src, (v, k) => v);
      expect(result instanceof Float32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_1070
     * @tc.name testFloat32ArrayFromTWO107
     * @tc.desc Verify returned array length equals source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0, 4.0];
      const result = Float32Array.from<number>(src, (v, k) => v);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_1080
     * @tc.name testFloat32ArrayFromTWO108
     * @tc.desc Verify returned array byteLength equals length times 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0];
      const result = Float32Array.from<number>(src, (v, k) => v);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_1090
     * @tc.name testFloat32ArrayFromTWO109
     * @tc.desc Verify immutability - original ArrayLike not modified by mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0x10, 0b1010, -1.0];
      const result = Float32Array.from<number>(src, (v, k) => v * 10);
      expect(src[0]).assertEqual(16);
      expect(src[2]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_1100
     * @tc.name testFloat32ArrayFromTWO110
     * @tc.desc Verify independence - modifying returned array does not affect source ArrayLike
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0];
      const result = Float32Array.from<number>(src, (v, k) => v);
      result.$_set(0, 999.0);
      expect(src[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_1110
     * @tc.name testFloat32ArrayFromTWO111
     * @tc.desc Verify mapfn throws Error on first element, propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0x10, 0b1010, -1.0];
      try {
        Float32Array.from<number>(src, (v, k) => {
          if (k === 0) {
            throw new Error('first');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_1120
     * @tc.name testFloat32ArrayFromTWO112
     * @tc.desc Verify mapfn throws Error on middle element, propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0x10, 0b1010, -1.0];
      try {
        Float32Array.from<number>(src, (v, k) => {
          if (k === 1) {
            throw new Error('middle');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_1130
     * @tc.name testFloat32ArrayFromTWO113
     * @tc.desc Verify mapfn throws Error on last element, propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0x10, 0b1010, -1.0];
      try {
        Float32Array.from<number>(src, (v, k) => {
          if (k === 2) {
            throw new Error('last');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_1140
     * @tc.name testFloat32ArrayFromTWO114
     * @tc.desc Verify mapfn throws RangeError, propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0];
      try {
        Float32Array.from<number>(src, (v, k) => {
          throw new RangeError('range');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_1150
     * @tc.name testFloat32ArrayFromTWO115
     * @tc.desc Verify mapfn throws TypeError, propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0];
      try {
        Float32Array.from<number>(src, (v, k) => {
          throw new TypeError('type');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_1160
     * @tc.name testFloat32ArrayFromTWO116
     * @tc.desc Verify mapfn throws Error on NaN input, propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, NaN, 3.0];
      try {
        Float32Array.from<number>(src, (v, k) => {
          if (v !== v) {
            throw new Error('nan found');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTWO_1170
     * @tc.name testFloat32ArrayFromTWO117
     * @tc.desc Verify Set treats negative zero and positive zero as one source element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTWO117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>();
      set.add(-0.0);
      set.add(0.0);
      const arr = Float32Array.from(set);
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(0.0);
    });

  });
}
