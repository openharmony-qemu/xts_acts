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

export default function Float32ArrayToSorted1Test(): void {
  describe('Float32ArrayToSorted1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_0100
     * @tc.name testFloat32ArrayToSortedONE001
     * @tc.desc Verify arity 0 call performs default ascending sort on a three-element unordered array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(3.0, 1.0, 2.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(1)).assertEqual(2);
      expect(s.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_0200
     * @tc.name testFloat32ArrayToSortedONE002
     * @tc.desc Verify arity 0 return value is a Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(3.0, 1.0, 2.0);
      const s = a.toSorted();
      expect(s.length).assertEqual(3);
      expect(s instanceof Float32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_0300
     * @tc.name testFloat32ArrayToSortedONE003
     * @tc.desc Verify arity 0 sorting a five-element unordered array preserves length and the first element is the minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(5.0, 3.0, 1.0, 4.0, 2.0);
      const s = a.toSorted();
      expect(s.length).assertEqual(5);
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_0400
     * @tc.name testFloat32ArrayToSortedONE004
     * @tc.desc Verify single-element NaN stays NaN after sorting with length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(NaN);
      const s = a.toSorted();
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_0500
     * @tc.name testFloat32ArrayToSortedONE005
     * @tc.desc Verify single-element +Infinity stays Infinity after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(Infinity);
      const s = a.toSorted();
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_0600
     * @tc.name testFloat32ArrayToSortedONE006
     * @tc.desc Verify single-element -Infinity stays -Infinity after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(-Infinity);
      const s = a.toSorted();
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_0700
     * @tc.name testFloat32ArrayToSortedONE007
     * @tc.desc Verify single-element +0 is 0 after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0.0);
      const s = a.toSorted();
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_0800
     * @tc.name testFloat32ArrayToSortedONE008
     * @tc.desc Verify single-element -0 compares equal to 0 after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(-0.0);
      const s = a.toSorted();
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_0900
     * @tc.name testFloat32ArrayToSortedONE009
     * @tc.desc Verify single-element Float32 maximum finite value 3.4028234663852886e+38 is preserved after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(3.4028234663852886e+38);
      const s = a.toSorted();
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_1000
     * @tc.name testFloat32ArrayToSortedONE010
     * @tc.desc Verify single-element Float32 minimum finite negative value -3.4028234663852886e+38 is preserved after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(-3.4028234663852886e+38);
      const s = a.toSorted();
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_1100
     * @tc.name testFloat32ArrayToSortedONE011
     * @tc.desc Verify single-element Float32 minimum positive normal number 1.1754943508222875e-38 is preserved after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.1754943508222875e-38);
      const s = a.toSorted();
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_1200
     * @tc.name testFloat32ArrayToSortedONE012
     * @tc.desc Verify single-element Float32 minimum positive subnormal number 1.401298464324817e-45 is preserved after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.401298464324817e-45);
      const s = a.toSorted();
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_1300
     * @tc.name testFloat32ArrayToSortedONE013
     * @tc.desc Verify single-element 1e40 exceeds float32 range and overflows to +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1e40);
      const s = a.toSorted();
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_1400
     * @tc.name testFloat32ArrayToSortedONE014
     * @tc.desc Verify single-element -1e40 exceeds float32 range and overflows to -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(-1e40);
      const s = a.toSorted();
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_1500
     * @tc.name testFloat32ArrayToSortedONE015
     * @tc.desc Verify single-element 1e-46 underflows to +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1e-46);
      const s = a.toSorted();
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_1600
     * @tc.name testFloat32ArrayToSortedONE016
     * @tc.desc Verify single-element 16777216 i.e. 2^24 maximum exact integer is preserved after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(16777216.0);
      const s = a.toSorted();
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_1700
     * @tc.name testFloat32ArrayToSortedONE017
     * @tc.desc Verify single-element 16777217 i.e. 2^24+1 truncates to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(16777217.0);
      const s = a.toSorted();
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_1800
     * @tc.name testFloat32ArrayToSortedONE018
     * @tc.desc Verify integer boundary 0 and 1 combination sorts to [0, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0.0, 1.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(0);
      expect(s.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_1900
     * @tc.name testFloat32ArrayToSortedONE019
     * @tc.desc Verify integer boundary -1 and 0 combination sorts to [-1, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(-1.0, 0.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(-1);
      expect(s.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_2000
     * @tc.name testFloat32ArrayToSortedONE020
     * @tc.desc Verify int upper bound 2147483647 and 0 combination sorts to [0, 2147483647]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(2147483647.0, 0.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(0);
      expect(s.$_get(1)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_2100
     * @tc.name testFloat32ArrayToSortedONE021
     * @tc.desc Verify int lower bound -2147483648 and 0 combination sorts to [-2147483648, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(-2147483648.0, 0.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(-2147483648);
      expect(s.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_2200
     * @tc.name testFloat32ArrayToSortedONE022
     * @tc.desc Verify single-element 0.1 preserves float32 precision value after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0.1);
      const s = a.toSorted();
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(Float32Array.of(0.1).$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_2300
     * @tc.name testFloat32ArrayToSortedONE023
     * @tc.desc Verify single-element 0.2 preserves float32 precision value after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0.2);
      const s = a.toSorted();
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(Float32Array.of(0.2).$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_2400
     * @tc.name testFloat32ArrayToSortedONE024
     * @tc.desc Verify single-element 0.3 preserves float32 precision value after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0.3);
      const s = a.toSorted();
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(Float32Array.of(0.3).$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_2500
     * @tc.name testFloat32ArrayToSortedONE025
     * @tc.desc Verify single-element 1.1 preserves float32 precision value after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.1);
      const s = a.toSorted();
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(Float32Array.of(1.1).$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_2600
     * @tc.name testFloat32ArrayToSortedONE026
     * @tc.desc Verify single-element 1.0000001 precision truncation value is preserved after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0000001);
      const s = a.toSorted();
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(Float32Array.of(1.0000001).$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_2700
     * @tc.name testFloat32ArrayToSortedONE027
     * @tc.desc Verify NaN at first position moves to the end after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(NaN, 1.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(1)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_2800
     * @tc.name testFloat32ArrayToSortedONE028
     * @tc.desc Verify NaN at last position still stays at the end after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, NaN);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(1)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_2900
     * @tc.name testFloat32ArrayToSortedONE029
     * @tc.desc Verify multiple NaN mixed with numbers sorts all NaN to the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(NaN, NaN, 1.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(1)).assertNaN();
      expect(s.$_get(2)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_3000
     * @tc.name testFloat32ArrayToSortedONE030
     * @tc.desc Verify Infinity and 1 combination sorts with Infinity at the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(Infinity, 1.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(1)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_3100
     * @tc.name testFloat32ArrayToSortedONE031
     * @tc.desc Verify -Infinity and 1 combination sorts with -Infinity at the first position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(-Infinity, 1.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(-Infinity);
      expect(s.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_3200
     * @tc.name testFloat32ArrayToSortedONE032
     * @tc.desc Verify Infinity and -Infinity combination sorts to [-Infinity, Infinity]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(Infinity, -Infinity);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(-Infinity);
      expect(s.$_get(1)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_3300
     * @tc.name testFloat32ArrayToSortedONE033
     * @tc.desc Verify Infinity and Float32 maximum finite value combination sorts with the maximum finite value first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(Infinity, 3.4028234663852886e+38);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(3.4028234663852886e+38);
      expect(s.$_get(1)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_3400
     * @tc.name testFloat32ArrayToSortedONE034
     * @tc.desc Verify -Infinity and minimum finite negative value combination sorts with -Infinity first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(-Infinity, -3.4028234663852886e+38);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(-Infinity);
      expect(s.$_get(1)).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_3500
     * @tc.name testFloat32ArrayToSortedONE035
     * @tc.desc Verify +0 and -0 combination sorts with both normalizing to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0.0, -0.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(0);
      expect(s.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_3600
     * @tc.name testFloat32ArrayToSortedONE036
     * @tc.desc Verify -0 and +0 reverse-order combination sorts with both normalizing to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(-0.0, 0.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(0);
      expect(s.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_3700
     * @tc.name testFloat32ArrayToSortedONE037
     * @tc.desc Verify Float32 maximum finite value and minimum positive subnormal number combination sorts with the subnormal number first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(3.4028234663852886e+38, 1.401298464324817e-45);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(1.401298464324817e-45);
      expect(s.$_get(1)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_3800
     * @tc.name testFloat32ArrayToSortedONE038
     * @tc.desc Verify minimum positive normal number and minimum positive subnormal number combination sorts with the subnormal number first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.1754943508222875e-38, 1.401298464324817e-45);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(1.401298464324817e-45);
      expect(s.$_get(1)).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_3900
     * @tc.name testFloat32ArrayToSortedONE039
     * @tc.desc Verify 2^24 and 2^24+1 combination sorts with both elements truncating to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(16777216.0, 16777217.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(16777216);
      expect(s.$_get(1)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_4000
     * @tc.name testFloat32ArrayToSortedONE040
     * @tc.desc Verify 2^24+1 and 2^24 reverse-order combination sorts with both elements truncating to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(16777217.0, 16777216.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(16777216);
      expect(s.$_get(1)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_4100
     * @tc.name testFloat32ArrayToSortedONE041
     * @tc.desc Verify 0.1 0.2 0.3 ascending input stays ascending after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0.1, 0.2, 0.3);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(Float32Array.of(0.1).$_get(0));
      expect(s.$_get(2)).assertEqual(Float32Array.of(0.3).$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_4200
     * @tc.name testFloat32ArrayToSortedONE042
     * @tc.desc Verify 0.3 0.1 0.2 unordered input sorts to ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0.3, 0.1, 0.2);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(Float32Array.of(0.1).$_get(0));
      expect(s.$_get(2)).assertEqual(Float32Array.of(0.3).$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_4300
     * @tc.name testFloat32ArrayToSortedONE043
     * @tc.desc Verify 1.1 and 1.0000001 combination sorts with the smaller precision value first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.1, 1.0000001);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(Float32Array.of(1.0000001).$_get(0));
      expect(s.$_get(1)).assertEqual(Float32Array.of(1.1).$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_4400
     * @tc.name testFloat32ArrayToSortedONE044
     * @tc.desc Verify int upper and lower bounds combination sorts with the lower bound first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(2147483647.0, -2147483648.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(-2147483648);
      expect(s.$_get(1)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_4500
     * @tc.name testFloat32ArrayToSortedONE045
     * @tc.desc Verify hexadecimal literal 0x10 i.e. 16 and 1 combination sorts to [1, 16]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0x10, 1.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(1)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_4600
     * @tc.name testFloat32ArrayToSortedONE046
     * @tc.desc Verify octal literal 0o17 i.e. 15 and 1 combination sorts to [1, 15]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0o17, 1.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(1)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_4700
     * @tc.name testFloat32ArrayToSortedONE047
     * @tc.desc Verify binary literal 0b1010 i.e. 10 and 1 combination sorts to [1, 10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0b1010, 1.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_4800
     * @tc.name testFloat32ArrayToSortedONE048
     * @tc.desc Verify scientific notation 1e3 i.e. 1000 and 1 combination sorts to [1, 1000]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1e3, 1.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(1)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_4900
     * @tc.name testFloat32ArrayToSortedONE049
     * @tc.desc Verify hexadecimal float literal 9.0 i.e. 9.0 and 1 combination sorts to [1, 9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(9.0, 1.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_5000
     * @tc.name testFloat32ArrayToSortedONE050
     * @tc.desc Verify hexadecimal literal 0xff i.e. 255 single-element stays 255 after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0xff);
      const s = a.toSorted();
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_5100
     * @tc.name testFloat32ArrayToSortedONE051
     * @tc.desc Verify octal literal 0o777 i.e. 511 single-element stays 511 after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0o777);
      const s = a.toSorted();
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(511);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_5200
     * @tc.name testFloat32ArrayToSortedONE052
     * @tc.desc Verify scientific notation 2e0 i.e. 2 single-element stays 2 after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(2e0);
      const s = a.toSorted();
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_5300
     * @tc.name testFloat32ArrayToSortedONE053
     * @tc.desc Verify empty array returns a new array of length 0 after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(0);
      const s = a.toSorted();
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_5400
     * @tc.name testFloat32ArrayToSortedONE054
     * @tc.desc Verify single-element array [42] stays unchanged after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(42.0);
      const s = a.toSorted();
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_5500
     * @tc.name testFloat32ArrayToSortedONE055
     * @tc.desc Verify two-element reverse-order [2, 1] sorts to [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(2.0, 1.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_5600
     * @tc.name testFloat32ArrayToSortedONE056
     * @tc.desc Verify two-element equal [5, 5] stays equal after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(5.0, 5.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(5);
      expect(s.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_5700
     * @tc.name testFloat32ArrayToSortedONE057
     * @tc.desc Verify all-equal values [7, 7, 7] stay unchanged after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(7.0, 7.0, 7.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(7);
      expect(s.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_5800
     * @tc.name testFloat32ArrayToSortedONE058
     * @tc.desc Verify all-zero [0, 0, 0] stays all-zero after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0.0, 0.0, 0.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(0);
      expect(s.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_5900
     * @tc.name testFloat32ArrayToSortedONE059
     * @tc.desc Verify already-ascending [1, 2, 3, 4] stays ascending after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_6000
     * @tc.name testFloat32ArrayToSortedONE060
     * @tc.desc Verify already-descending [4, 3, 2, 1] flips to ascending after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(4.0, 3.0, 2.0, 1.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_6100
     * @tc.name testFloat32ArrayToSortedONE061
     * @tc.desc Verify all-negative values [-5, -1, -3] sort to [-5, -3, -1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(-5.0, -1.0, -3.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(-5);
      expect(s.$_get(1)).assertEqual(-3);
      expect(s.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_6200
     * @tc.name testFloat32ArrayToSortedONE062
     * @tc.desc Verify positive-negative-zero mixed [-2, 0, 2] sorts to [-2, 0, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(-2.0, 0.0, 2.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(-2);
      expect(s.$_get(1)).assertEqual(0);
      expect(s.$_get(2)).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_6300
     * @tc.name testFloat32ArrayToSortedONE063
     * @tc.desc Verify duplicate values interleaved with one distinct value [5, 5, 5, 1] sorts to [1, 5, 5, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(5.0, 5.0, 5.0, 1.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(1)).assertEqual(5);
      expect(s.$_get(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_6400
     * @tc.name testFloat32ArrayToSortedONE064
     * @tc.desc Verify alternating duplicates [3, 1, 3, 1, 3] sort to [1, 1, 3, 3, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(3.0, 1.0, 3.0, 1.0, 3.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(1)).assertEqual(1);
      expect(s.$_get(2)).assertEqual(3);
      expect(s.$_get(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_6500
     * @tc.name testFloat32ArrayToSortedONE065
     * @tc.desc Verify NaN Infinity -Infinity 0 mixed sorts to [-Infinity, 0, Infinity, NaN]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(NaN, Infinity, -Infinity, 0.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(-Infinity);
      expect(s.$_get(1)).assertEqual(0);
      expect(s.$_get(2)).assertEqual(Infinity);
      expect(s.$_get(3)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_6600
     * @tc.name testFloat32ArrayToSortedONE066
     * @tc.desc Verify maximum finite value 0 minimum finite negative value mixed sorts to [-MAX, 0, MAX]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(3.4028234663852886e+38, 0.0, -3.4028234663852886e+38);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(-3.4028234663852886e+38);
      expect(s.$_get(1)).assertEqual(0);
      expect(s.$_get(2)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_6700
     * @tc.name testFloat32ArrayToSortedONE067
     * @tc.desc Verify +0 -0 1 -1 mixed sorts with negative values first, zero in the middle, positive values last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0.0, -0.0, 1.0, -1.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(-1);
      expect(s.$_get(1)).assertEqual(0);
      expect(s.$_get(2)).assertEqual(0);
      expect(s.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_6800
     * @tc.name testFloat32ArrayToSortedONE068
     * @tc.desc Verify 2^24 2^24+1 2^24-1 mixed sorts truncating to [16777215, 16777216, 16777216]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(16777216.0, 16777217.0, 16777215.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(16777215);
      expect(s.$_get(1)).assertEqual(16777216);
      expect(s.$_get(2)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_6900
     * @tc.name testFloat32ArrayToSortedONE069
     * @tc.desc Verify 0.1 0.2 0.3 NaN mixed sorts with numbers ascending and NaN at the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(0.1, 0.2, 0.3, NaN);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(Float32Array.of(0.1).$_get(0));
      expect(s.$_get(2)).assertEqual(Float32Array.of(0.3).$_get(0));
      expect(s.$_get(3)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_7000
     * @tc.name testFloat32ArrayToSortedONE070
     * @tc.desc Verify 1e40 -1e40 0 mixed sorts to [-Infinity, 0, Infinity]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1e40, -1e40, 0.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(-Infinity);
      expect(s.$_get(1)).assertEqual(0);
      expect(s.$_get(2)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_7100
     * @tc.name testFloat32ArrayToSortedONE071
     * @tc.desc Verify 1e-46 1e-45 0 underflow mixed sorts with zero first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1e-46, 1e-45, 0.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(0);
      expect(s.$_get(2)).assertEqual(Float32Array.of(1e-45).$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_7200
     * @tc.name testFloat32ArrayToSortedONE072
     * @tc.desc Verify minimum positive subnormal number 0 and its negative value mixed sorts with negative first, zero in the middle, positive last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.401298464324817e-45, 0.0, -1.401298464324817e-45);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(-1.401298464324817e-45);
      expect(s.$_get(1)).assertEqual(0);
      expect(s.$_get(2)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_7300
     * @tc.name testFloat32ArrayToSortedONE073
     * @tc.desc Verify int upper and lower bounds and 0 mixed sorts with lower bound first and upper bound last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(2147483647.0, 0.0, -2147483648.0);
      const s = a.toSorted();
      expect(s.$_get(0)).assertEqual(-2147483648);
      expect(s.$_get(1)).assertEqual(0);
      expect(s.$_get(2)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_7400
     * @tc.name testFloat32ArrayToSortedONE074
     * @tc.desc Verify two NaN elements sort with length 2 and both NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(NaN, NaN);
      const s = a.toSorted();
      expect(s.length).assertEqual(2);
      expect(s.$_get(0)).assertNaN();
      expect(s.$_get(1)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_7500
     * @tc.name testFloat32ArrayToSortedONE075
     * @tc.desc Verify two Infinity elements sort with both Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(Infinity, Infinity);
      const s = a.toSorted();
      expect(s.length).assertEqual(2);
      expect(s.$_get(0)).assertEqual(Infinity);
      expect(s.$_get(1)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDONE_7600
     * @tc.name testFloat32ArrayToSortedONE076
     * @tc.desc Verify toSorted orders infinities and finite values while leaving the source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedONE076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Float32Array.of(Infinity, -Infinity, 1.0);
      const sorted = source.toSorted();
      expect(sorted.$_get(0)).assertEqual(-Infinity);
      expect(sorted.$_get(2)).assertEqual(Infinity);
      expect(source.$_get(0)).assertEqual(Infinity);
    });

  });
}
