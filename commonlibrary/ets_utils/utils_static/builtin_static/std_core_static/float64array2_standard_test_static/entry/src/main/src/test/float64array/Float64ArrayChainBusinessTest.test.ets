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

export default function Float64ArrayChainBusinessTest(): void {
  describe('Float64ArrayChainBusinessTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_0100
     * @tc.name testFloat64ArrayChainBusiness001
     * @tc.desc Verify reversing before sorting produces ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 2.0]);
      arr.reverse().sort();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_0200
     * @tc.name testFloat64ArrayChainBusiness002
     * @tc.desc Verify filling before copying the first value to the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      arr.fill(5.0).copyWithin(2, 0, 1);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 5.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 5.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_0300
     * @tc.name testFloat64ArrayChainBusiness003
     * @tc.desc Verify two reversals restore the original element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      arr.reverse().reverse();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_0400
     * @tc.name testFloat64ArrayChainBusiness004
     * @tc.desc Verify nested sort(sort(x)) keeps ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 2.0]);
      arr.sort().sort();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_0500
     * @tc.name testFloat64ArrayChainBusiness005
     * @tc.desc Verify with().with() immutable chain, original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([Number.MAX_SAFE_INTEGER, -Number.MAX_SAFE_INTEGER, Number.MIN_VALUE]);
      const r: Float64Array = arr.with(0, 10.0).with(1, 20.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = Number.MAX_SAFE_INTEGER;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = r.$_get(0);
      const expectedElement0Second: number = 10.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement1 = r.$_get(1);
      const expectedElement1: number = 20.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_0600
     * @tc.name testFloat64ArrayChainBusiness006
     * @tc.desc Verify toReversed().toSorted() immutable chain, original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 3.0, 2.0]);
      const r: Float64Array = arr.toReversed().toSorted();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = r.$_get(0);
      const expectedElement0Second: number = 1.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement2 = r.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_0700
     * @tc.name testFloat64ArrayChainBusiness007
     * @tc.desc Verify nested map(map(x)) double transformation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const r: Float64Array = arr.map((v: number): number => v + 1).map((v: number): number => v + 1);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_0800
     * @tc.name testFloat64ArrayChainBusiness008
     * @tc.desc Verify filter(v>1).map(v*10) filter then transform
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const r: Float64Array = arr.filter((v: number): boolean => v > 1).map((v: number): number => v * 10);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 20.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualLength = r.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_0900
     * @tc.name testFloat64ArrayChainBusiness009
     * @tc.desc Verify fill partial then slice copies only modified range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      arr.fill(0.0, 1, 3);
      const r: Float64Array = arr.slice(0, 4);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = r.$_get(1);
      const expectedElement1: number = 0.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = r.$_get(2);
      const expectedElement2: number = 0.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement3 = r.$_get(3);
      const expectedElement3: number = 4.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_1000
     * @tc.name testFloat64ArrayChainBusiness010
     * @tc.desc Verify slice then subarray on copy does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([NaN, Number.MIN_VALUE, -0.0, Infinity]);
      const copy: Float64Array = arr.slice(1, 4);
      const view: Float64Array = copy.subarray(0, 2);
      view.$_set(0, 99.0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = Number.MIN_VALUE;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement0 = copy.$_get(0);
      const expectedElement0: number = 99.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_1100
     * @tc.name testFloat64ArrayChainBusiness011
     * @tc.desc Verify $_set then find reads new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([NaN, Infinity, -Infinity]);
      arr.$_set(1, 44.0);
      const found: number | undefined = arr.find((x: number): boolean => x === 44.0);
      const actualResult = found;
      const expectedResult: number = 44.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_1200
     * @tc.name testFloat64ArrayChainBusiness012
     * @tc.desc Verify $_set then includes reads new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, Infinity);
      expect(arr.includes(Infinity)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_1300
     * @tc.name testFloat64ArrayChainBusiness013
     * @tc.desc Verify $_set then join reflects new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([NaN, Infinity, -Infinity]);
      arr.$_set(1, 8.0);
      const actualString = arr.join(',');
      const expectedString: string = 'NaN,8,-Infinity';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_1400
     * @tc.name testFloat64ArrayChainBusiness014
     * @tc.desc Verify fill then values() iteration reflects filled values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([NaN, Infinity, -Infinity]);
      arr.fill(7.0);
      const it: IterableIterator<number> = arr.values();
      const actualIteratorValue = it.next().value;
      const expectedIteratorValue: number = 7.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      const actualIteratorValueSecond = it.next().value;
      const expectedIteratorValueSecond: number = 7.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualIteratorValueThird = it.next().value;
      const expectedIteratorValueThird: number = 7.0;
      expect(actualIteratorValueThird).assertEqual(expectedIteratorValueThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_1500
     * @tc.name testFloat64ArrayChainBusiness015
     * @tc.desc Verify reverse then values() iteration reflects reversed order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([Number.MAX_SAFE_INTEGER, Number.MIN_VALUE, -0.0]);
      arr.reverse();
      const it: IterableIterator<number> = arr.values();
      const actualIteratorValue = it.next().value;
      const expectedIteratorValue: number = -0.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      const actualIteratorValueSecond = it.next().value;
      const expectedIteratorValueSecond: number = Number.MIN_VALUE;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualIteratorValueThird = it.next().value;
      const expectedIteratorValueThird: number = Number.MAX_SAFE_INTEGER;
      expect(actualIteratorValueThird).assertEqual(expectedIteratorValueThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_1600
     * @tc.name testFloat64ArrayChainBusiness016
     * @tc.desc Verify sort then values() iteration reflects sorted order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 2.0]);
      arr.sort();
      const it: IterableIterator<number> = arr.values();
      const actualIteratorValue = it.next().value;
      const expectedIteratorValue: number = 1.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      const actualIteratorValueSecond = it.next().value;
      const expectedIteratorValueSecond: number = 2.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualIteratorValueThird = it.next().value;
      const expectedIteratorValueThird: number = 3.0;
      expect(actualIteratorValueThird).assertEqual(expectedIteratorValueThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_1700
     * @tc.name testFloat64ArrayChainBusiness017
     * @tc.desc Verify every returns true when all elements satisfy the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([Number.MIN_VALUE, Number.MAX_SAFE_INTEGER, 0.5]);
      const r = arr.every((v: number): boolean => v > 0.0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_1800
     * @tc.name testFloat64ArrayChainBusiness018
     * @tc.desc Verify some returns true when a later element satisfies the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([Number.MIN_VALUE, -0.0, Number.MAX_SAFE_INTEGER]);
      const r = arr.some((v: number): boolean => v > 2.0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_1900
     * @tc.name testFloat64ArrayChainBusiness019
     * @tc.desc Verify filter().reduce() chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const r = arr.filter((v: number): boolean => v > 2.0).reduce((a: number, v: number): number => a + v, 0.0);
      const actualResult = r;
      const expectedResult: number = 12.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_2000
     * @tc.name testFloat64ArrayChainBusiness020
     * @tc.desc Verify map().every() chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MIN_VALUE, Number.MAX_SAFE_INTEGER, Infinity);
      const r = arr.map((v: number): number => v * 2.0).every((v: number): boolean => v > 0.0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_2100
     * @tc.name testFloat64ArrayChainBusiness021
     * @tc.desc Verify slice().every() chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MIN_VALUE, Number.MAX_SAFE_INTEGER, Infinity, 0.5, 1.5);
      const r = arr.slice(1, 4).every((v: number): boolean => v > 0.0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_2200
     * @tc.name testFloat64ArrayChainBusiness022
     * @tc.desc Verify map().filter() chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const r = arr.map((v: number): number => v * 3.0).filter((v: number): boolean => v > 6.0);
      const actualLength = r.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 9.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = r.$_get(1);
      const expectedElement1: number = 12.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_2300
     * @tc.name testFloat64ArrayChainBusiness023
     * @tc.desc Verify filter().map() chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const r = arr.filter((v: number): boolean => v > 2.0).map((v: number): number => v * 10.0);
      const actualLength = r.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 30.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = r.$_get(1);
      const expectedElement1: number = 40.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_2400
     * @tc.name testFloat64ArrayChainBusiness024
     * @tc.desc Verify fill().includes() chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      arr.fill(5.0);
      expect(arr.includes(5.0)).assertTrue();
      expect(arr.includes(0.0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_2500
     * @tc.name testFloat64ArrayChainBusiness025
     * @tc.desc Verify sort().join() chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      arr.sort();
      const r = arr.join(",");
      const actualResult = r;
      const expectedResult: string = "1,2,3";
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_2600
     * @tc.name testFloat64ArrayChainBusiness026
     * @tc.desc Verify subarray().$_get() chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(10.0, 20.0, 30.0, 40.0);
      const sub = arr.subarray(1, 3);
      const actualElement0 = sub.$_get(0);
      const expectedElement0: number = 20.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = sub.$_get(1);
      const expectedElement1: number = 30.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_2700
     * @tc.name testFloat64ArrayChainBusiness027
     * @tc.desc Verify fill().indexOf() chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(4);
      arr.fill(7.0, 0, 2);
      const actualIndex = arr.indexOf(7.0);
      const expectedIndex: int = 0;
      expect(actualIndex).assertEqual(expectedIndex);
      const actualIndexSecond = arr.indexOf(0.0, 2);
      const expectedIndexSecond: int = 2;
      expect(actualIndexSecond).assertEqual(expectedIndexSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_2800
     * @tc.name testFloat64ArrayChainBusiness028
     * @tc.desc Verify reverse().toString() chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.reverse();
      const actualString = arr.toString();
      const expectedString: string = "3,2,1";
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_2900
     * @tc.name testFloat64ArrayChainBusiness029
     * @tc.desc Verify filter().map().reduce() 3-chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const r = arr.filter((v: number): boolean => v > 2.0)
        .map((v: number): number => v * 10.0)
        .reduce((a: number, v: number): number => a + v, 0.0);
      const actualResult = r;
      const expectedResult: number = 120.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_3000
     * @tc.name testFloat64ArrayChainBusiness030
     * @tc.desc Verify map().filter().every() 3-chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const r = arr.map((v: number): number => v * 2.0)
        .filter((v: number): boolean => v > 3.0)
        .every((v: number): boolean => v > 0.0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_3100
     * @tc.name testFloat64ArrayChainBusiness031
     * @tc.desc Verify slice().reverse().toString() 3-chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const s = src.slice(1, 4);
      s.reverse();
      const actualString = s.toString();
      const expectedString: string = "4,3,2";
      expect(actualString).assertEqual(expectedString);
      const actualElement0 = src.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_3200
     * @tc.name testFloat64ArrayChainBusiness032
     * @tc.desc Verify subarray().fill().$_get() chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const sub = arr.subarray(1, 3);
      sub.fill(99.0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 99.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 99.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_3300
     * @tc.name testFloat64ArrayChainBusiness033
     * @tc.desc Verify filter().some() chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const r = arr.filter((v: number): boolean => v > 3.0).some((v: number): boolean => v === 4.0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_3400
     * @tc.name testFloat64ArrayChainBusiness034
     * @tc.desc Verify copyWithin().fill() chain on same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      arr.copyWithin(1, 0, 2).fill(0.0, 3, 4);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 1.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 0.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_3500
     * @tc.name testFloat64ArrayChainBusiness035
     * @tc.desc Verify sort then reverse vs reverse then sort produce different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const b: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      a.sort().reverse();
      b.reverse().sort();
      const actualElement0 = a.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = b.$_get(0);
      const expectedElement0Second: number = 1.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_3600
     * @tc.name testFloat64ArrayChainBusiness036
     * @tc.desc Verify filter then map vs map then filter produce different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const fm = arr.filter((v: number): boolean => v > 2.0).map((v: number): number => v * 2.0);
      const mf = arr.map((v: number): number => v * 2.0).filter((v: number): boolean => v > 2.0);
      const actualLength = fm.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualLengthSecond = mf.length;
      const expectedLengthSecond: int = 3;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_3700
     * @tc.name testFloat64ArrayChainBusiness037
     * @tc.desc Verify fill then set vs set then fill different order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float64Array = new Float64Array(4);
      const b: Float64Array = new Float64Array(4);
      a.fill(5.0);
      a.$_set(0, 1.0);
      a.$_set(1, 2.0);
      b.$_set(0, 1.0);
      b.$_set(1, 2.0);
      b.fill(5.0);
      const actualElement0 = a.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = a.$_get(2);
      const expectedElement2: number = 5.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement0Second = b.$_get(0);
      const expectedElement0Second: number = 5.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement1 = b.$_get(1);
      const expectedElement1: number = 5.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_3800
     * @tc.name testFloat64ArrayChainBusiness038
     * @tc.desc Verify sort then toSorted vs toSorted then sort different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      arr.sort();
      const r1 = arr.toSorted();
      const r2 = Float64Array.of(3.0, 1.0, 2.0).toSorted().sort();
      const actualElement0 = r1.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = r2.$_get(0);
      const expectedElement0Second: number = 1.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const isOriginalResult: boolean = arr === r1;
      expect(isOriginalResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_3900
     * @tc.name testFloat64ArrayChainBusiness039
     * @tc.desc Verify reduce subtraction vs reduceRight subtraction difference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const left = arr.reduce((a: number, v: number): number => a - v);
      const right = arr.reduceRight((a: number, v: number): number => a - v);
      const actualResult = left;
      const expectedResult: number = -4.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = right;
      const expectedResultSecond: number = 0.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_4000
     * @tc.name testFloat64ArrayChainBusiness040
     * @tc.desc Verify subarray then reverse vs reverse then subarray differences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const b: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const sa = a.subarray(0, 2);
      sa.reverse();
      b.reverse();
      const sb = b.subarray(0, 2);
      const actualElement0 = sa.$_get(0);
      const expectedElement0: number = 2.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = sa.$_get(1);
      const expectedElement1: number = 1.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement0Second = sb.$_get(0);
      const expectedElement0Second: number = 4.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement1Second = sb.$_get(1);
      const expectedElement1Second: number = 3.0;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_4100
     * @tc.name testFloat64ArrayChainBusiness041
     * @tc.desc Verify slice then $_set vs $_set then slice differences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const s1 = arr.slice(0, 2);
      s1.$_set(0, 99.0);
      arr.$_set(0, 99.0);
      const s2 = arr.slice(0, 2);
      const actualElement0 = s1.$_get(0);
      const expectedElement0: number = 99.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = s2.$_get(0);
      const expectedElement0Second: number = 99.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement0Third = arr.$_get(0);
      const expectedElement0Third: number = 99.0;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_4200
     * @tc.name testFloat64ArrayChainBusiness042
     * @tc.desc Verify indexOf vs lastIndexOf for duplicate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 1.0, 3.0, 1.0);
      const actualIndex = arr.indexOf(1.0);
      const expectedIndex: int = 0;
      expect(actualIndex).assertEqual(expectedIndex);
      const actualIndexSecond = arr.lastIndexOf(1.0);
      const expectedIndexSecond: int = 4;
      expect(actualIndexSecond).assertEqual(expectedIndexSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_4300
     * @tc.name testFloat64ArrayChainBusiness043
     * @tc.desc Verify entries, keys, values yield same count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(10.0, 20.0, 30.0, 40.0, 50.0);
      let ek: int = 0, vk: int = 0;
      for (const _ of arr.entries()) {
        ek++;
      }
      for (const _ of arr.keys()) {
        vk++;
      }
      expect(ek).assertEqual(vk);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_4400
     * @tc.name testFloat64ArrayChainBusiness044
     * @tc.desc Verify find vs findLast for multiple matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 2.0, 5.0);
      const f1 = arr.find((v: number): boolean => v === 2.0);
      const f2 = arr.findLast((v: number): boolean => {
        if (v === 2.0) {
          return true;
        }
        return false;
      });
      const actualResult = f1;
      const expectedResult: number = 2.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = f2;
      const expectedResultSecond: number = 2.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_4500
     * @tc.name testFloat64ArrayChainBusiness045
     * @tc.desc Verify findIndex vs findLastIndex for multiple matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 2.0, 5.0);
      const fi = arr.findIndex((v: number): boolean => v === 2.0);
      const li = arr.findLastIndex((v: number): boolean => v === 2.0);
      const actualResult = fi;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = li;
      const expectedResultSecond: number = 3;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_4600
     * @tc.name testFloat64ArrayChainBusiness046
     * @tc.desc Verify reverse() in-place vs toReversed() copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const r1 = arr.reverse();
      const r2 = Float64Array.of(1.0, 2.0, 3.0).toReversed();
      expect(r1).assertEqual(arr);
      expect(r2).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_4700
     * @tc.name testFloat64ArrayChainBusiness047
     * @tc.desc Verify values() and $_iterator() produce same sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const vIter = arr.values();
      const dIter = arr.$_iterator();
      for (let i: int = 0; i < 3; i++) {
        expect(vIter.next().value).assertEqual(dIter.next().value);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_4800
     * @tc.name testFloat64ArrayChainBusiness048
     * @tc.desc Verify toSorted().toReversed().join() immutable chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const r = arr.toSorted().toReversed().join(",");
      const actualResult = r;
      const expectedResult: string = "3,2,1";
      expect(actualResult).assertEqual(expectedResult);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_4900
     * @tc.name testFloat64ArrayChainBusiness049
     * @tc.desc Verify transformed values can be filtered, summed, and rendered as text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const r: string = arr.map((v: number): number => v + 1.0)
        .filter((v: number): boolean => v > 3.0)
        .reduce((a: number, v: number): number => a + v, 0.0)
        .toString();
      const actualResult = r;
      const expectedResult: string = "15";
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_5000
     * @tc.name testFloat64ArrayChainBusiness050
     * @tc.desc Verify subarray of subarray chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const s1 = arr.subarray(1, 4);
      const s2 = s1.subarray(1, 3);
      const actualLength = s2.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = s2.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = s2.$_get(1);
      const expectedElement1: number = 4.0;
      expect(actualElement1).assertEqual(expectedElement1);
      expect(s2.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_5100
     * @tc.name testFloat64ArrayChainBusiness051
     * @tc.desc Verify fill then with chain (mutable then immutable)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.fill(0.0);
      const r = arr.with(0, 99.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 0.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = r.$_get(0);
      const expectedElement0Second: number = 99.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_5200
     * @tc.name testFloat64ArrayChainBusiness052
     * @tc.desc Verify forEach count with external accumulator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 10.0, 15.0);
      let sum: number = 0.0;
      arr.forEach((v: number): void => {
        sum = sum + v;
      });
      const actualResult = sum;
      const expectedResult: number = 30.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_5300
     * @tc.name testFloat64ArrayChainBusiness053
     * @tc.desc Verify at(-1) equals $_get(last) consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(10.0, 20.0, 30.0, 40.0);
      const idx: int = arr.length - 1;
      expect(arr.at(-1)).assertEqual(arr.$_get(idx));
      expect(arr.at(-2)).assertEqual(arr.$_get(idx - 1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_5400
     * @tc.name testFloat64ArrayChainBusiness054
     * @tc.desc Verify sort stability with NaN moved to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, NaN, 1.0, NaN, 2.0);
      arr.sort();
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_5500
     * @tc.name testFloat64ArrayChainBusiness055
     * @tc.desc Verify toSorted keeps original unchanged, sort modifies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const r = arr.toSorted();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = r.$_get(0);
      const expectedElement0Second: number = 1.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_5600
     * @tc.name testFloat64ArrayChainBusiness056
     * @tc.desc Verify with().with() chain, original unchanged, copies independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const r1 = arr.with(0, 99.0);
      const r2 = r1.with(1, 88.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = r1.$_get(0);
      const expectedElement0Second: number = 99.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement0Third = r2.$_get(0);
      const expectedElement0Third: number = 99.0;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
      const actualElement1 = r2.$_get(1);
      const expectedElement1: number = 88.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_5700
     * @tc.name testFloat64ArrayChainBusiness057
     * @tc.desc Verify $_get reads after bracket assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(10.0, 20.0, 30.0);
      arr[1] = 99.0;
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 99.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_5800
     * @tc.name testFloat64ArrayChainBusiness058
     * @tc.desc Verify sensor normalization: map to [0,1] range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const raw: Float64Array = Float64Array.of(10.0, 20.0, 30.0, 40.0, 50.0);
      const minVal: number = 10.0;
      const range: number = 40.0;
      const norm = raw.map((v: number): number => (v - minVal) / range);
      const actualElement0 = norm.$_get(0);
      const expectedElement0: number = 0.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElementAt4 = norm.$_get(4);
      const expectedElementAt4: number = 1.0;
      expect(actualElementAt4).assertEqual(expectedElementAt4);
      const actualElement2 = norm.$_get(2);
      const expectedElement2: number = 0.5;
      expect(actualElement2).assertEqual(expectedElement2);
      expect(norm.buffer).not().assertEqual(raw.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_5900
     * @tc.name testFloat64ArrayChainBusiness059
     * @tc.desc Verify normalization then filter out-of-range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const raw: Float64Array = Float64Array.of(-5.0, 15.0, 25.0, 35.0, 55.0);
      const minVal: number = 10.0;
      const range: number = 40.0;
      const norm = raw.map((v: number): number => (v - minVal) / range);
      const filtered = norm.filter((v: number): boolean => v >= 0.0 && v <= 1.0);
      const actualLength = filtered.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_6000
     * @tc.name testFloat64ArrayChainBusiness060
     * @tc.desc Verify normalization then every check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const raw: Float64Array = Float64Array.of(10.0, 20.0, 30.0, 40.0, 50.0);
      const minVal: number = 10.0;
      const range: number = 40.0;
      const norm = raw.map((v: number): number => (v - minVal) / range);
      expect(norm.every((v: number): boolean => v >= 0.0 && v <= 1.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_6100
     * @tc.name testFloat64ArrayChainBusiness061
     * @tc.desc Verify sliding window average using subarray and reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const windowSize: int = 3;
      const win = data.subarray(0, windowSize);
      const sum = win.reduce((a: number, v: number): number => a + v, 0.0);
      const avg = sum / 3.0;
      const actualResult = avg;
      const expectedResult: number = 2.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_6200
     * @tc.name testFloat64ArrayChainBusiness062
     * @tc.desc Verify sliding window at end of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const win = data.subarray(2, 5);
      const sum = win.reduce((a: number, v: number): number => a + v, 0.0);
      const actualResult = sum;
      const expectedResult: number = 12.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_6300
     * @tc.name testFloat64ArrayChainBusiness063
     * @tc.desc Verify ETL: filter NaN then reduce sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const raw: Float64Array = Float64Array.of(10.0, NaN, 20.0, NaN, 30.0);
      const cleaned = raw.filter((v: number): boolean => !isNaN(v));
      const actualLength = cleaned.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      const sum = cleaned.reduce((a: number, v: number): number => a + v, 0.0);
      const actualResult = sum;
      const expectedResult: number = 60.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_6400
     * @tc.name testFloat64ArrayChainBusiness064
     * @tc.desc Verify ETL: filter out Infinity entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const raw: Float64Array = Float64Array.of(1.0, Infinity, 2.0, -Infinity, 3.0);
      const cleaned = raw.filter((v: number): boolean => isFinite(v));
      const actualLength = cleaned.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      const sum = cleaned.reduce((a: number, v: number): number => a + v, 0.0);
      const actualResult = sum;
      const expectedResult: number = 6.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_6500
     * @tc.name testFloat64ArrayChainBusiness065
     * @tc.desc Verify ETL: chain filter->map->reduce pipeline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const raw: Float64Array = Float64Array.of(-5.0, 10.0, -2.0, 20.0, 0.0, 30.0);
      const r = raw.filter((v: number): boolean => v > 0.0)
        .map((v: number): number => v * 1.5)
        .reduce((a: number, v: number): number => a + v, 0.0);
      const actualResult = r;
      const expectedResult: number = 90.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_6600
     * @tc.name testFloat64ArrayChainBusiness066
     * @tc.desc Verify ranking returns the three largest values in descending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Float64Array = Float64Array.of(5.0, 3.0, 9.0, 1.0, 7.0);
      data.sort((a: number, b: number): int => {
        if (a > b) {
          return -1;
        }
        if (a < b) {
          return 1;
        }
        return 0;
      });
      const topK = data.subarray(0, 3);
      const actualElement0 = topK.$_get(0);
      const expectedElement0: number = 9.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = topK.$_get(1);
      const expectedElement1: number = 7.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = topK.$_get(2);
      const expectedElement2: number = 5.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_6700
     * @tc.name testFloat64ArrayChainBusiness067
     * @tc.desc Verify ranking returns the two smallest values in ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Float64Array = Float64Array.of(5.0, 3.0, 9.0, 1.0, 7.0);
      data.sort();
      const bottomK = data.subarray(0, 2);
      const actualElement0 = bottomK.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = bottomK.$_get(1);
      const expectedElement1: number = 3.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_6800
     * @tc.name testFloat64ArrayChainBusiness068
     * @tc.desc Verify median: sort then middle element(s)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Float64Array = Float64Array.of(3.0, 1.0, 2.0, 4.0, 5.0);
      data.sort();
      const actualElement2 = data.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_6900
     * @tc.name testFloat64ArrayChainBusiness069
     * @tc.desc Verify data mask: copy then fill sensitive range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Float64Array = Float64Array.of(10.0, 20.0, 30.0, 40.0, 50.0);
      const mask = data.slice();
      mask.fill(NaN, 1, 3);
      const actualElement1 = data.$_get(1);
      const expectedElement1: number = 20.0;
      expect(actualElement1).assertEqual(expectedElement1);
      expect(mask.$_get(1)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_7000
     * @tc.name testFloat64ArrayChainBusiness070
     * @tc.desc Verify data detach: slice then verify independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const detach = data.slice();
      data.$_set(0, 99.0);
      const actualElement0 = detach.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_7100
     * @tc.name testFloat64ArrayChainBusiness071
     * @tc.desc Verify missing value fill then verify via includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Float64Array = new Float64Array(5);
      data.fill(-1.0, 2, 4);
      expect(data.includes(-1.0)).assertTrue();
      const actualIndex = data.indexOf(-1.0);
      const expectedIndex: int = 2;
      expect(actualIndex).assertEqual(expectedIndex);
      const actualIndexSecond = data.lastIndexOf(-1.0);
      const expectedIndexSecond: int = 3;
      expect(actualIndexSecond).assertEqual(expectedIndexSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_7200
     * @tc.name testFloat64ArrayChainBusiness072
     * @tc.desc Verify missing value fill then map to replace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Float64Array = Float64Array.of(1.0, -1.0, 3.0, -1.0, 5.0);
      const filled = data.map((v: number): number => v === -1.0 ? 0.0 : v);
      const actualElement0 = filled.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = filled.$_get(1);
      const expectedElement1: number = 0.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement3 = filled.$_get(3);
      const expectedElement3: number = 0.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_7300
     * @tc.name testFloat64ArrayChainBusiness073
     * @tc.desc Verify anomaly detection: find elements above threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Float64Array = Float64Array.of(1.0, 50.0, 2.0, 100.0, 3.0);
      const anomalies = data.filter((v: number): boolean => v > 10.0);
      const actualLength = anomalies.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_7400
     * @tc.name testFloat64ArrayChainBusiness074
     * @tc.desc Verify anomaly detection: findIndex for first anomaly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Float64Array = Float64Array.of(1.0, 2.0, 100.0, 4.0, 5.0);
      const idx = data.findIndex((v: number): boolean => v > 10.0);
      const actualResult = idx;
      const expectedResult: number = 2;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_7500
     * @tc.name testFloat64ArrayChainBusiness075
     * @tc.desc Verify cache write then subarray then read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: Float64Array = new Float64Array(10);
      const src: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      cache.set(src);
      const view = cache.subarray(0, 3);
      const actualElement0 = view.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = view.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = view.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_7600
     * @tc.name testFloat64ArrayChainBusiness076
     * @tc.desc Verify cache write at offset then read back via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(5);
      arr.$_set(2, 99.0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 99.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_7700
     * @tc.name testFloat64ArrayChainBusiness077
     * @tc.desc Verify resampling: take every Nth element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Float64Array = Float64Array.of(1.0, 10.0, 2.0, 20.0, 3.0, 30.0, 4.0, 40.0);
      const sampled = data.filter((_: number, i: int): boolean => i % 2 === 0);
      const actualLength = sampled.length;
      const expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = sampled.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = sampled.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_7800
     * @tc.name testFloat64ArrayChainBusiness078
     * @tc.desc Verify resampling then every check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Float64Array = Float64Array.of(1.0, 10.0, 2.0, 20.0, 3.0);
      const sampled = data.filter((_: number, i: int): boolean => i % 2 === 0);
      expect(sampled.every((v: number): boolean => v > 0.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_7900
     * @tc.name testFloat64ArrayChainBusiness079
     * @tc.desc Verify mean via reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Float64Array = Float64Array.of(2.0, 4.0, 6.0, 8.0);
      const sum = data.reduce((a: number, v: number): number => a + v, 0.0);
      const mean = sum / 4.0;
      const actualResult = mean;
      const expectedResult: number = 5.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_8000
     * @tc.name testFloat64ArrayChainBusiness080
     * @tc.desc Verify variance via map and reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Float64Array = Float64Array.of(2.0, 4.0, 6.0, 8.0);
      const mean: number = 5.0;
      const sqDiff = data.map((v: number): number => (v - mean) * (v - mean));
      const sumSq = sqDiff.reduce((a: number, v: number): number => a + v, 0.0);
      const actualResult = sumSq;
      const expectedResult: number = 20.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_8100
     * @tc.name testFloat64ArrayChainBusiness081
     * @tc.desc Verify max via reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Float64Array = Float64Array.of(3.0, 7.0, 2.0, 9.0, 1.0);
      const max = data.reduce((a: number, v: number): number => v > a ? v : a, data.$_get(0));
      const actualResult = max;
      const expectedResult: number = 9.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_8200
     * @tc.name testFloat64ArrayChainBusiness082
     * @tc.desc Verify min via reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Float64Array = Float64Array.of(3.0, 7.0, 2.0, 9.0, 1.0);
      const min = data.reduce((a: number, v: number): number => v < a ? v : a, data.$_get(0));
      const actualResult = min;
      const expectedResult: number = 1.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_8300
     * @tc.name testFloat64ArrayChainBusiness083
     * @tc.desc Verify order statistics: sort then subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Float64Array = Float64Array.of(9.0, 3.0, 7.0, 1.0, 5.0);
      data.sort();
      const top = data.subarray(3, 5);
      const actualElement0 = top.$_get(0);
      const expectedElement0: number = 7.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = top.$_get(1);
      const expectedElement1: number = 9.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_8400
     * @tc.name testFloat64ArrayChainBusiness084
     * @tc.desc Verify threshold filter then sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Float64Array = Float64Array.of(5.0, 15.0, 3.0, 12.0, 8.0);
      const filtered = data.filter((v: number): boolean => v > 10.0);
      filtered.sort();
      const actualLength = filtered.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = filtered.$_get(0);
      const expectedElement0: number = 12.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = filtered.$_get(1);
      const expectedElement1: number = 15.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_8500
     * @tc.name testFloat64ArrayChainBusiness085
     * @tc.desc Verify reverse then toString export
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      data.reverse();
      const actualString = data.toString();
      const expectedString: string = "5,4,3,2,1";
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_8600
     * @tc.name testFloat64ArrayChainBusiness086
     * @tc.desc Verify data subset extraction: slice then every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Float64Array = Float64Array.of(10.0, 20.0, 30.0, 40.0, 50.0);
      const subset = data.slice(1, 4);
      expect(subset.every((v: number): boolean => v >= 20.0 && v <= 40.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_8700
     * @tc.name testFloat64ArrayChainBusiness087
     * @tc.desc Verify pipe break: error in map stops chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      let calledAfterError: boolean = false;
      try {
        data.map((v: number): number => {
          if (v === 2.0) {
            throw new Error('pipe break');
          }
          return v;
        }).filter((v: number): boolean => {
          calledAfterError = true;
          return v > 0.0;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_8800
     * @tc.name testFloat64ArrayChainBusiness088
     * @tc.desc Verify data validation: isFinite filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Float64Array = Float64Array.of(1.0, Infinity, 2.0, NaN, 3.0);
      const valid = data.filter((v: number): boolean => isFinite(v));
      const actualLength = valid.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_BUSINESS_8900
     * @tc.name testFloat64ArrayChainBusiness089
     * @tc.desc Verify business sensor threshold handles critical scientific static params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainBusiness089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples: Float64Array = new Float64Array(0x4);
      samples.$_set(0, 1e-308);
      samples.$_set(0b1, 2.0);
      samples.$_set(0o2, Number.MAX_VALUE);
      samples.$_set(3, 4.0);
      const valid = samples.filter((v: number): boolean => v >= 2.0);
      const actualLength = valid.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement1 = valid.$_get(1);
      const expectedElement1: number = Number.MAX_VALUE;
      expect(actualElement1).assertEqual(expectedElement1);
    });
  })
}
