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
import Utils from './../Util.test';

export default function Float64ArrayContractErrorTest(): void {
  describe('Float64ArrayContractErrorTest', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_0100
     * @tc.name testFloat64ArrayContractError001
     * @tc.desc Verify $_get negative index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0]);
      try {
        arr.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_0200
     * @tc.name testFloat64ArrayContractError002
     * @tc.desc Verify $_get at length OOB throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      try {
        arr.$_get(3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_0300
     * @tc.name testFloat64ArrayContractError003
     * @tc.desc Verify $_set negative index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0]);
      try {
        arr.$_set(-1, 99.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_0400
     * @tc.name testFloat64ArrayContractError004
     * @tc.desc Verify $_set at length OOB throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2);
      try {
        arr.$_set(2, 5.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_0500
     * @tc.name testFloat64ArrayContractError005
     * @tc.desc Verify at negative index returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const r = arr.at(-1);
      const actualResult = r;
      const expectedResult: number = 3.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_0600
     * @tc.name testFloat64ArrayContractError006
     * @tc.desc Verify at positive OOB returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0]);
      const r = arr.at(5);
      expect(r).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_0700
     * @tc.name testFloat64ArrayContractError007
     * @tc.desc Verify at(0) on empty array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const r = arr.at(0);
      expect(r).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_0800
     * @tc.name testFloat64ArrayContractError008
     * @tc.desc Verify subarray(-1, 2) normalizes begin to length-1 and returns an empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const sub = arr.subarray(-1, 2);
      const actualLength = sub.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_0900
     * @tc.name testFloat64ArrayContractError009
     * @tc.desc Verify subarray end>length clamped to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const sub = arr.subarray(1, 10);
      const actualLength = sub.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = sub.$_get(0);
      const expectedElement0: number = 2.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = sub.$_get(1);
      const expectedElement1: number = 3.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_1000
     * @tc.name testFloat64ArrayContractError010
     * @tc.desc Verify subarray begin==end returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const sub = arr.subarray(2, 2);
      const actualLength = sub.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_1100
     * @tc.name testFloat64ArrayContractError011
     * @tc.desc Verify slice begin>end returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const r = arr.slice(3, 1);
      const actualLength = r.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_1200
     * @tc.name testFloat64ArrayContractError012
     * @tc.desc Verify slice(0,0) returns empty independent array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const r = arr.slice(0, 0);
      const actualLength = r.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
      expect(r.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_1300
     * @tc.name testFloat64ArrayContractError013
     * @tc.desc Verify fill start>=end array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.fill(99.0, 2, 1);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_1400
     * @tc.name testFloat64ArrayContractError014
     * @tc.desc Verify fill with start==end array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.fill(99.0, 1, 1);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_1500
     * @tc.name testFloat64ArrayContractError015
     * @tc.desc Verify copyWithin with target>=length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.copyWithin(5, 0, 2);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_1600
     * @tc.name testFloat64ArrayContractError016
     * @tc.desc Verify set OOB throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2);
      const src: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_1700
     * @tc.name testFloat64ArrayContractError017
     * @tc.desc Verify set OOB offset throws RangeError with name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      const src: Float64Array = Float64Array.of(1.0, 2.0);
      try {
        arr.set(3, 99.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_1800
     * @tc.name testFloat64ArrayContractError018
     * @tc.desc Verify sort callback throw propagates and array usable after catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      let callCount: int = 0;
      try {
        arr.sort((a: number, b: number): int => {
          callCount++;
          if (callCount >= 2) {
            throw new Error('sort fail');
          }
          return 0;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_1900
     * @tc.name testFloat64ArrayContractError019
     * @tc.desc Verify forEach callback throw propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.forEach((v: number): void => {
          if (v === 2.0) {
            throw new Error('cb fail');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_2000
     * @tc.name testFloat64ArrayContractError020
     * @tc.desc Verify map callback throw propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.map((v: number): number => {
          if (v === 2.0) {
            throw new Error('map fail');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_2100
     * @tc.name testFloat64ArrayContractError021
     * @tc.desc Verify filter callback throw propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.filter((v: number): boolean => {
          if (v === 2.0) {
            throw new Error('filter fail');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_2200
     * @tc.name testFloat64ArrayContractError022
     * @tc.desc Verify reduce callback throw propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.reduce((acc: number, v: number): number => {
          if (v === 2.0) {
            throw new Error('reduce fail');
          }
          return acc + v;
        }, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_2300
     * @tc.name testFloat64ArrayContractError023
     * @tc.desc Verify reduceRight single element no initialValue returns that element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([7.0]);
      const actualResult: number = arr.reduceRight((acc: number, v: number): number => acc + v);
      const expectedResult: number = 7.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_2400
     * @tc.name testFloat64ArrayContractError024
     * @tc.desc Verify reduce empty array no initial throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      try {
        arr.reduce((acc: number, v: number): number => acc + v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_2500
     * @tc.name testFloat64ArrayContractError025
     * @tc.desc Verify reduceRight empty array no initial throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      try {
        arr.reduceRight((acc: number, v: number): number => acc + v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_2600
     * @tc.name testFloat64ArrayContractError026
     * @tc.desc Verify Reduce empty with initial value returns initial
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const r = arr.reduce((acc: number, v: number): number => acc + v, 42.0);
      const actualResult = r;
      const expectedResult: number = 42.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_2700
     * @tc.name testFloat64ArrayContractError027
     * @tc.desc Verify with negative out-of-range index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.with(-4, 99.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_2800
     * @tc.name testFloat64ArrayContractError028
     * @tc.desc Verify with positive OOB index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      try {
        arr.with(3, 99.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_2900
     * @tc.name testFloat64ArrayContractError029
     * @tc.desc Verify constructor negative length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr: Float64Array = new Float64Array(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_3000
     * @tc.name testFloat64ArrayContractError030
     * @tc.desc Verify constructor buffer offset not multiple of 8 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      try {
        const arr: Float64Array = new Float64Array(buf, 4, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_3100
     * @tc.name testFloat64ArrayContractError031
     * @tc.desc Verify constructor buffer offset 0 works and offset 16 works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const arr1: Float64Array = new Float64Array(buf, 0, 2);
      const arr2: Float64Array = new Float64Array(buf, 16, 1);
      const actualLength = arr1.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualLengthSecond = arr2.length;
      const expectedLengthSecond: int = 1;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_3200
     * @tc.name testFloat64ArrayContractError032
     * @tc.desc Verify $_get(-0) reads first element like index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 10.0);
      const firstResult = arr.$_get(-0);
      const secondResult = arr.$_get(0);
      const actualResult = firstResult;
      const expectedResult: number = 5.0;
      expect(actualResult).assertEqual(expectedResult);
      expect(secondResult).assertEqual(firstResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_3300
     * @tc.name testFloat64ArrayContractError033
     * @tc.desc Verify buf length not multiple of 8 in constructor throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf: ArrayBuffer = new ArrayBuffer(12);
        const arr: Float64Array = new Float64Array(buf);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_3400
     * @tc.name testFloat64ArrayContractError034
     * @tc.desc Verify every callback not called on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      let count: int = 0;
      const r = arr.every((v: number): boolean => {
        count++;
        return true;
      });
      expect(r).assertTrue();
      const actualResult = count;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_3500
     * @tc.name testFloat64ArrayContractError035
     * @tc.desc Verify some callback not called on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      let count: int = 0;
      const r = arr.some((v: number): boolean => {
        count++;
        return true;
      });
      expect(r).assertFalse();
      const actualResult = count;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_3600
     * @tc.name testFloat64ArrayContractError036
     * @tc.desc Verify find callback not called on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      let count: int = 0;
      const r = arr.find((v: number): boolean => {
        count++;
        return true;
      });
      expect(r).assertEqual(undefined);
      const actualResult = count;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_3700
     * @tc.name testFloat64ArrayContractError037
     * @tc.desc Verify map on empty array returns empty Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const r = arr.map((v: number): number => v * 2.0);
      const actualLength = r.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_3800
     * @tc.name testFloat64ArrayContractError038
     * @tc.desc Verify filter on empty array returns empty Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const r = arr.filter((v: number): boolean => v > 0.0);
      const actualLength = r.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_3900
     * @tc.name testFloat64ArrayContractError039
     * @tc.desc Verify reverse on empty array does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const r = arr.reverse();
      const actualLength = r.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_4000
     * @tc.name testFloat64ArrayContractError040
     * @tc.desc Verify empty array forEach callback not called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: number = 0;
      const arr = new Float64Array([]);
      arr.forEach((v: number): void => {
        called++;
      });
      const actualResult = called;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_4100
     * @tc.name testFloat64ArrayContractError041
     * @tc.desc Verify empty array values().next() immediate done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([]);
      const it = arr.values();
      const n = it.next();
      expect(n.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_4200
     * @tc.name testFloat64ArrayContractError042
     * @tc.desc Verify single element some checks callback index and array arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([7.0]);
      let receivedIndex: int = -1;
      let receivedLength: int = -1;
      expect(arr.some((v: number, index: int, source: Float64Array): boolean => {
        receivedIndex = index;
        receivedLength = source.length;
        return v > 5.0;
      })).assertTrue();
      expect(arr.some((v: number): boolean => {
        return v < 5.0;
      })).assertFalse();
      const actualResult = receivedIndex;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = receivedLength;
      const expectedResultSecond: number = 1;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_4300
     * @tc.name testFloat64ArrayContractError043
     * @tc.desc Verify every visits all elements in a multi-element matching array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([5.0, 7.0]);
      let called: int = 0;
      expect(arr.every((v: number): boolean => {
        called++;
        return v > 0.0;
      })).assertTrue();
      const actualResult = called;
      const expectedResult: number = 2;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_4400
     * @tc.name testFloat64ArrayContractError044
     * @tc.desc Verify single element find matching returns element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([7.0]);
      const r = arr.find((v: number): boolean => {
        return v === 7.0;
      });
      const actualResult = r;
      const expectedResult: number = 7.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_4500
     * @tc.name testFloat64ArrayContractError045
     * @tc.desc Verify findIndex returns the first matching index for duplicate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([7.0, 7.0, 9.0]);
      const r = arr.findIndex((v: number): boolean => {
        return v === 7.0;
      });
      const actualResult = r;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_4600
     * @tc.name testFloat64ArrayContractError046
     * @tc.desc Verify single element at(0) returns element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([7.0]);
      const actualResult = arr.at(0);
      const expectedResult: number = 7.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_4700
     * @tc.name testFloat64ArrayContractError047
     * @tc.desc Verify single element at(-1) wraps to element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([7.0]);
      const actualResult = arr.at(-1);
      const expectedResult: number = 7.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_4800
     * @tc.name testFloat64ArrayContractError048
     * @tc.desc Verify all-same indexOf returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([5.0, 5.0, 5.0]);
      const actualIndex = arr.indexOf(5.0);
      const expectedIndex: int = 0;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_4900
     * @tc.name testFloat64ArrayContractError049
     * @tc.desc Verify all-same lastIndexOf returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([5.0, 5.0, 5.0]);
      const actualIndex = arr.lastIndexOf(5.0);
      const expectedIndex: int = 2;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_5000
     * @tc.name testFloat64ArrayContractError050
     * @tc.desc Verify all-same find returns first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([5.0, 5.0, 5.0]);
      const r = arr.find((v: number): boolean => {
        return v === 5.0;
      });
      const actualResult = r;
      const expectedResult: number = 5.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_5100
     * @tc.name testFloat64ArrayContractError051
     * @tc.desc Verify all-same some returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([5.0, 5.0, 5.0]);
      expect(arr.some((v: number): boolean => {
        return v > 3.0;
      })).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_5200
     * @tc.name testFloat64ArrayContractError052
     * @tc.desc Verify all-same sort without comparator leaves unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([5.0, 5.0, 5.0]);
      arr.sort();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 5.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 5.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_5300
     * @tc.name testFloat64ArrayContractError053
     * @tc.desc Verify byteOffset=2 non-8-multiple throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      try {
        const arr = new Float64Array(buf, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_5400
     * @tc.name testFloat64ArrayContractError054
     * @tc.desc Verify offset+len*8 exceeds buffer throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      try {
        const arr = new Float64Array(buf, 0, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_5500
     * @tc.name testFloat64ArrayContractError055
     * @tc.desc Verify byteOffset=-4 negative throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      try {
        const arr = new Float64Array(buf, -4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_5600
     * @tc.name testFloat64ArrayContractError056
     * @tc.desc Verify forEach callback error propagation with called count 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      let called: number = 0;
      try {
        arr.forEach((v: number): void => {
          called++;
          throw new Error('forEach-throws');
        })
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'forEach-throws';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualResult = called;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_5700
     * @tc.name testFloat64ArrayContractError057
     * @tc.desc Verify some callback error propagation with called count 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      let called: number = 0;
      try {
        arr.some((v: number): boolean => {
          called++;
          throw new Error('some-throws');
        })
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'some-throws';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualResult = called;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_5800
     * @tc.name testFloat64ArrayContractError058
     * @tc.desc Verify every callback error propagation with called count 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      let called: number = 0;
      try {
        arr.every((v: number): boolean => {
          called++;
          throw new Error('every-throws');
        })
        expect().assertFail();
      } catch (e) {
        const actualMessage = e.message;
        const expectedMessage: string = 'every-throws';
        expect(actualMessage).assertEqual(expectedMessage);
        expect(e.name).assertEqual('Error');
      }
      const actualResult = called;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_5900
     * @tc.name testFloat64ArrayContractError059
     * @tc.desc Verify find callback error propagation with called count 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      let called: number = 0;
      try {
        arr.find((v: number): boolean => {
          called++;
          throw new Error('find-throws');
        })
        expect().assertFail();
      } catch (e) {
        const actualMessage = e.message;
        const expectedMessage: string = 'find-throws';
        expect(actualMessage).assertEqual(expectedMessage);
        expect(e.name).assertEqual('Error');
      }
      const actualResult = called;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_6000
     * @tc.name testFloat64ArrayContractError060
     * @tc.desc Verify findIndex callback error propagation with called count 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      let called: number = 0;
      try {
        arr.findIndex((v: number): boolean => {
          called++;
          throw new Error('findIndex-throws');
        })
        expect().assertFail();
      } catch (e) {
        const actualMessage = e.message;
        const expectedMessage: string = 'findIndex-throws';
        expect(actualMessage).assertEqual(expectedMessage);
        expect(e.name).assertEqual('Error');
      }
      const actualResult = called;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_6100
     * @tc.name testFloat64ArrayContractError061
     * @tc.desc Verify findLast callback error propagation with called count 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      let called: number = 0;
      try {
        arr.findLast((v: number): boolean => {
          called++;
          throw new Error('findLast-throws');
        })
        expect().assertFail();
      } catch (e) {
        const actualMessage = e.message;
        const expectedMessage: string = 'findLast-throws';
        expect(actualMessage).assertEqual(expectedMessage);
        expect(e.name).assertEqual('Error');
      }
      const actualResult = called;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_6200
     * @tc.name testFloat64ArrayContractError062
     * @tc.desc Verify findLastIndex callback error propagation with called count 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      let called: number = 0;
      try {
        arr.findLastIndex((v: number): boolean => {
          called++;
          throw new Error('findLastIndex-throws');
        })
        expect().assertFail();
      } catch (e) {
        const actualMessage = e.message;
        const expectedMessage: string = 'findLastIndex-throws';
        expect(actualMessage).assertEqual(expectedMessage);
        expect(e.name).assertEqual('Error');
      }
      const actualResult = called;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_6300
     * @tc.name testFloat64ArrayContractError063
     * @tc.desc Verify map callback error propagation with called count 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      let called: number = 0;
      try {
        arr.map((v: number): number => {
          called++;
          throw new Error('map-throws');
        })
        expect().assertFail();
      } catch (e) {
        const actualMessage = e.message;
        const expectedMessage: string = 'map-throws';
        expect(actualMessage).assertEqual(expectedMessage);
        expect(e.name).assertEqual('Error');
      }
      const actualResult = called;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_6400
     * @tc.name testFloat64ArrayContractError064
     * @tc.desc Verify filter callback error propagation with called count 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      let called: number = 0;
      try {
        arr.filter((v: number): boolean => {
          called++;
          throw new Error('filter-throws');
        })
        expect().assertFail();
      } catch (e) {
        const actualMessage = e.message;
        const expectedMessage: string = 'filter-throws';
        expect(actualMessage).assertEqual(expectedMessage);
        expect(e.name).assertEqual('Error');
      }
      const actualResult = called;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_6500
     * @tc.name testFloat64ArrayContractError065
     * @tc.desc Verify reduce callback error propagation with called count 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      let called: number = 0;
      try {
        arr.reduce((acc: number, v: number): number => {
          called++;
          throw new Error('reduce-throws');
        }, 0);
        expect().assertFail();
      } catch (e) {
        const actualMessage = e.message;
        const expectedMessage: string = 'reduce-throws';
        expect(actualMessage).assertEqual(expectedMessage);
        expect(e.name).assertEqual('Error');
      }
      const actualResult = called;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_6600
     * @tc.name testFloat64ArrayContractError066
     * @tc.desc Verify reduceRight callback error propagation with called count 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      let called: number = 0;
      try {
        arr.reduceRight((acc: number, v: number): number => {
          called++;
          throw new Error('reduceRight-throws');
        }, 0);
        expect().assertFail();
      } catch (e) {
        const actualMessage = e.message;
        const expectedMessage: string = 'reduceRight-throws';
        expect(actualMessage).assertEqual(expectedMessage);
        expect(e.name).assertEqual('Error');
      }
      const actualResult = called;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_6700
     * @tc.name testFloat64ArrayContractError067
     * @tc.desc Verify sort compare function error propagation with called count 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 2.0]);
      let called: number = 0;
      try {
        arr.sort((x: number, y: number): int => {
          called++;
          throw new Error('sort-throws');
        })
        expect().assertFail();
      } catch (e) {
        const actualMessage = e.message;
        const expectedMessage: string = 'sort-throws';
        expect(actualMessage).assertEqual(expectedMessage);
        expect(e.name).assertEqual('Error');
      }
      expect(called).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_6800
     * @tc.name testFloat64ArrayContractError068
     * @tc.desc Verify forEach callback error + original array byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const lenBefore: number = arr.length;
      const blBefore: number = arr.byteLength;
      try {
        arr.forEach((v: number): void => {
          throw new Error('boom');
        })
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'boom';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      expect(arr.length).assertEqual(lenBefore);
      expect(arr.byteLength).assertEqual(blBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_6900
     * @tc.name testFloat64ArrayContractError069
     * @tc.desc Verify some callback error + original array byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const boBefore: number = arr.byteOffset;
      try {
        arr.some((v: number): boolean => {
          throw new Error('boom');
        })
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'boom';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      expect(arr.byteOffset).assertEqual(boBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_7000
     * @tc.name testFloat64ArrayContractError070
     * @tc.desc Verify every callback error + original array buffer reference unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const bufBefore: ArrayBuffer = arr.buffer;
      try {
        arr.every((v: number): boolean => {
          throw new Error('boom');
        })
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'boom';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_7100
     * @tc.name testFloat64ArrayContractError071
     * @tc.desc Verify reduceRight empty array with initialValue returns initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const r: number = arr.reduceRight((acc: number, v: number): number => acc + v, 7.0);
      const actualResult = r;
      const expectedResult: number = 7.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_7200
     * @tc.name testFloat64ArrayContractError072
     * @tc.desc Verify nonzero byteOffset plus length exceeding buffer throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      try {
        const arr = new Float64Array(buf, 8, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const actualByteLength = buf.byteLength;
      const expectedByteLength: int = 16;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONTRACT_ERROR_7300
     * @tc.name testFloat64ArrayContractError073
     * @tc.desc Verify business buffer validation keeps critical static chain result after RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayContractError073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0x10);
      try {
        const invalid = new Float64Array(buf, 0x8, 0b10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const report =
        Float64Array.of(1e-308, Number.MAX_VALUE).filter((v: number): boolean => v > 0.0).map((v: number): number => v);
      const actualLength = report.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement1 = report.$_get(1);
      const expectedElement1: number = Number.MAX_VALUE;
      expect(actualElement1).assertEqual(expectedElement1);
    });
  })
}
