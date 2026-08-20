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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Int16ArrayFilterTest02(): void {
  describe('Int16ArrayFilterTest02', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_0100
     * @tc.name testInt16ArrayFilterTestTwo001
     * @tc.desc Verify filter() explicit false predicate excludes all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 15, 25]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return false;
      });
      let actualLength: int = result.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_0200
     * @tc.name testInt16ArrayFilterTestTwo002
     * @tc.desc Verify filter() excludes MIN -32768 when predicate rejects that value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32768, 50, 60]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => value !== -32768);
      let actualLength: int = result.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirstElement: number = result.$_get(0);
      let expectedFirstElement: int = 50;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
      let actualSecondElement: number = result.$_get(1);
      let expectedSecondElement: int = 60;
      expect(actualSecondElement).assertEqual(expectedSecondElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_0300
     * @tc.name testInt16ArrayFilterTestTwo003
     * @tc.desc Verify filter() on empty array never invokes callback via external counter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let invokeCount: int = 0;
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        invokeCount = invokeCount + 1;
        return true;
      });
      expect(invokeCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_0400
     * @tc.name testInt16ArrayFilterTestTwo004
     * @tc.desc Verify filter() on empty array $_get(0) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => true);
      let v: Number | undefined;
      try {
        v = result.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        v = undefined;
      }
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_0500
     * @tc.name testInt16ArrayFilterTestTwo005
     * @tc.desc Verify filter() single element excluded when predicate value > 100 fails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([99]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => value > 100);
      let actualLength: int = result.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_0600
     * @tc.name testInt16ArrayFilterTestTwo006
     * @tc.desc Verify filter() all-MIN array keeps all elements when value === -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32768, -32768, -32768]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => value === -32768);
      let actualLength: int = result.length;
      let expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirstElement: number = result.$_get(0);
      let expectedFirstElement: int = -32768;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
      let actualThirdElement: number = result.$_get(2);
      let expectedThirdElement: int = -32768;
      expect(actualThirdElement).assertEqual(expectedThirdElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_0700
     * @tc.name testInt16ArrayFilterTestTwo007
     * @tc.desc Verify filter() all-same exclude yields empty result and independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([6, 6, 6, 6]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => false);
      let actualLength: int = result.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
      expect(result.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_0800
     * @tc.name testInt16ArrayFilterTestTwo008
     * @tc.desc Verify filter() uses array.$_get(-1) undefined as falsy path excluding all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        let outVal: Number | undefined;
        try {
          outVal = array.$_get(-1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
          outVal = undefined;
        }
        if (outVal === undefined) {
          return false;
        }
        return true;
      });
      let actualLength: int = result.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_0900
     * @tc.name testInt16ArrayFilterTestTwo009
     * @tc.desc Verify filter() uses array.$_get(length) undefined to exclude all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 8, 9]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        let v: Number | undefined;
        try {
          v = array.$_get(array.length);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
          v = undefined;
        }
        if (v === undefined) {
          return false;
        }
        return true;
      });
      let actualLength: int = result.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_1000
     * @tc.name testInt16ArrayFilterTestTwo010
     * @tc.desc Verify filter() array.$_get(length+1) undefined does not break valid predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([15, 25, 35]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        let v: Number | undefined;
        try {
          v = array.$_get(array.length + 1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
          v = undefined;
        }
        return value > 20;
      });
      let actualLength: int = result.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirstElement: number = result.$_get(0);
      let expectedFirstElement: int = 25;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
      let actualSecondElement: number = result.$_get(1);
      let expectedSecondElement: int = 35;
      expect(actualSecondElement).assertEqual(expectedSecondElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_1100
     * @tc.name testInt16ArrayFilterTestTwo011
     * @tc.desc Verify filter() array.$_get(-length) undefined falsy excludes all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        let v: Number | undefined;
        try {
          v = array.$_get(-array.length);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
          v = undefined;
        }
        if (v === undefined) {
          return false;
        }
        return true;
      });
      let actualLength: int = result.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_1200
     * @tc.name testInt16ArrayFilterTestTwo012
     * @tc.desc Verify filter() array.$_get(-length-1) undefined still allows original predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300, 400]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        let v: Number | undefined;
        try {
          v = array.$_get(-array.length - 1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
          v = undefined;
        }
        return value < 250;
      });
      let actualLength: int = result.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirstElement: number = result.$_get(0);
      let expectedFirstElement: int = 100;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
      let actualSecondElement: number = result.$_get(1);
      let expectedSecondElement: int = 200;
      expect(actualSecondElement).assertEqual(expectedSecondElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_1300
     * @tc.name testInt16ArrayFilterTestTwo013
     * @tc.desc Verify filter() array.$_get(2147483647) undefined can drive keep-all decision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([2, 4, 6]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        let v: Number | undefined;
        try {
          v = array.$_get(2147483647);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
          v = undefined;
        }
        if (v === undefined) {
          return true;
        }
        return false;
      });
      let actualLength: int = result.length;
      let expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_1400
     * @tc.name testInt16ArrayFilterTestTwo014
     * @tc.desc Verify filter() uses array.$_get(-1) === undefined to keep all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([30, 60, 90]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        let outVal: Number | undefined;
        try {
          outVal = array.$_get(-1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
          outVal = undefined;
        }
        return outVal === undefined;
      });
      let actualLength: int = result.length;
      let expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_1500
     * @tc.name testInt16ArrayFilterTestTwo015
     * @tc.desc Verify filter() combines valid $_get(index) with invalid $_get(-1) in predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 15]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        let current: Number | undefined = array.$_get(index);
        let invalid: Number | undefined;
        try {
          invalid = array.$_get(-1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
          invalid = undefined;
        }
        return current > 5 && invalid === undefined;
      });
      let actualLength: int = result.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirstElement: number = result.$_get(0);
      let expectedFirstElement: int = 10;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
      let actualSecondElement: number = result.$_get(1);
      let expectedSecondElement: int = 15;
      expect(actualSecondElement).assertEqual(expectedSecondElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_1600
     * @tc.name testInt16ArrayFilterTestTwo016
     * @tc.desc Verify filter() callback $_set of later element is visible in later iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(2, 999);
        }
        return value > 10;
      });
      let actualLength: int = result.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirstElement: number = result.$_get(0);
      let expectedFirstElement: int = 999;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_1700
     * @tc.name testInt16ArrayFilterTestTwo017
     * @tc.desc Verify filter() out-of-range $_set(length) throws RangeError but iteration continues
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([11, 22, 33]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        try {
          array.$_set(array.length, 999);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        return value > 15;
      });
      let actualLength: int = result.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirstElement: number = result.$_get(0);
      let expectedFirstElement: int = 22;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
      let actualSecondElement: number = result.$_get(1);
      let expectedSecondElement: int = 33;
      expect(actualSecondElement).assertEqual(expectedSecondElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_1800
     * @tc.name testInt16ArrayFilterTestTwo018
     * @tc.desc Verify filter() closure threshold mutation is observed by later iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let threshold: int = 3;
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          threshold = 2;
        }
        return value > threshold;
      });
      let actualLength: int = result.length;
      let expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirstElement: number = result.$_get(0);
      let expectedFirstElement: int = 3;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
      let actualSecondElement: number = result.$_get(1);
      let expectedSecondElement: int = 4;
      expect(actualSecondElement).assertEqual(expectedSecondElement);
      let actualThirdElement: number = result.$_get(2);
      let expectedThirdElement: int = 5;
      expect(actualThirdElement).assertEqual(expectedThirdElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_1900
     * @tc.name testInt16ArrayFilterTestTwo019
     * @tc.desc Verify filter() chained twice keeps then selects even values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6]);
      let step1: Int16Array = arr.filter((value: number): boolean => value > 1);
      let step2: Int16Array = step1.filter((value: number): boolean => value % 2 === 0);
      let actualStep1: string = step1.toString();
      let expectedStep1: string = '2,3,4,5,6';
      expect(actualStep1).assertEqual(expectedStep1);
      let actualStep2: string = step2.toString();
      let expectedStep2: string = '2,4,6';
      expect(actualStep2).assertEqual(expectedStep2);
      let actualLength: int = step2.length;
      let expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirstElement: number = step2.$_get(0);
      let expectedFirstElement: int = 2;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
      let actualSecondElement: number = step2.$_get(1);
      let expectedSecondElement: int = 4;
      expect(actualSecondElement).assertEqual(expectedSecondElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_2000
     * @tc.name testInt16ArrayFilterTestTwo020
     * @tc.desc Verify filter() chained after full exclude operates on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3, 5, 7]);
      let step1: Int16Array = arr.filter((value: number): boolean => value > 10);
      let step2: Int16Array = step1.filter((value: number): boolean => true);
      let actualStep1: string = step1.toString();
      let expectedStep1: string = '';
      expect(actualStep1).assertEqual(expectedStep1);
      let actualStep2: string = step2.toString();
      let expectedStep2: string = '';
      expect(actualStep2).assertEqual(expectedStep2);
      let actualLength: int = step2.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_2100
     * @tc.name testInt16ArrayFilterTestTwo021
     * @tc.desc Verify filter() first stage throw aborts chain so second stage is not called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let secondCalled: boolean = false;
      try {
        let step1: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
          throw new TypeError('first filter abort');
        });
        let step2: Int16Array = step1.filter((value: number): boolean => {
          secondCalled = true;
          return true;
        });
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(secondCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_2200
     * @tc.name testInt16ArrayFilterTestTwo022
     * @tc.desc Verify filter() keeps values within int16 range without extra truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-1, 32767, -32768, 0, 1]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => value >= -100);
      let actualFirstElement: number = result.$_get(0);
      let expectedFirstElement: int = -1;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
      let actualSecondElement: number = result.$_get(1);
      let expectedSecondElement: int = 32767;
      expect(actualSecondElement).assertEqual(expectedSecondElement);
      let actualThirdElement: number = result.$_get(2);
      let expectedThirdElement: int = 0;
      expect(actualThirdElement).assertEqual(expectedThirdElement);
      let actualFourthElement: number = result.$_get(3);
      let expectedFourthElement: int = 1;
      expect(actualFourthElement).assertEqual(expectedFourthElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_2300
     * @tc.name testInt16ArrayFilterTestTwo023
     * @tc.desc Verify filter() on 50-element array with even predicate returns length 25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(50);
      for (let i = 0; i < 50; i++) {
        arr.$_set(i, i);
      }
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => value % 2 === 0);
      for (let i = 0; i < result.length; i++) {
        let actualValue: number = result.$_get(i);
        let expectedValue: int = i * 2;
        expect(actualValue).assertEqual(expectedValue);
      }
      let actualLength: int = result.length;
      let expectedLength: int = 25;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_2400
     * @tc.name testInt16ArrayFilterTestTwo024
     * @tc.desc Verify filter() throw at index 25 on large array leaves source intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(50);
      for (let i = 0; i < 50; i++) {
        arr.$_set(i, i + 1);
      }
      try {
        arr.filter((value: number, index: int, array: Int16Array): boolean => {
          if (index === 25) {
            throw new TypeError('mid large array abort');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      let actualFirstElement: number = arr.$_get(0);
      let expectedFirstElement: int = 1;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
      let actualElementAt25: number = arr.$_get(25);
      let expectedElementAt25: int = 26;
      expect(actualElementAt25).assertEqual(expectedElementAt25);
      let actualElementAt49: number = arr.$_get(49);
      let expectedElementAt49: int = 50;
      expect(actualElementAt49).assertEqual(expectedElementAt49);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_2500
     * @tc.name testInt16ArrayFilterTestTwo025
     * @tc.desc Verify filter() $_set then $_get same slot sees updated value for decision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3, 3, 3]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(1, 999);
        }
        if (index === 1) {
          return array.$_get(1) > 500;
        }
        return false;
      });
      let actualLength: int = result.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirstElement: number = result.$_get(0);
      let expectedFirstElement: int = 999;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_2600
     * @tc.name testInt16ArrayFilterTestTwo026
     * @tc.desc Verify filter does not change original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(100, 200, 300, 400, 500);
      let beforeLen = arr.length;
      arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 200;
      });
      let actualValue: int = arr.length;
      let expectedValue: number = beforeLen;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_2700
     * @tc.name testInt16ArrayFilterTestTwo027
     * @tc.desc Verify filter does not mutate original element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-100, 0, 100, 32767, -32768);
      arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val >= 0;
      });
      let actualValue: number = arr.$_get(0);
      let expectedValue: int = -100;
      expect(actualValue).assertEqual(expectedValue);
      let actualValue2: number = arr.$_get(1);
      let expectedValue2: int = 0;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3: number = arr.$_get(2);
      let expectedValue3: int = 100;
      expect(actualValue3).assertEqual(expectedValue3);
      let actualValue4: number = arr.$_get(3);
      let expectedValue4: int = 32767;
      expect(actualValue4).assertEqual(expectedValue4);
      let actualValue5: number = arr.$_get(4);
      let expectedValue5: int = -32768;
      expect(actualValue5).assertEqual(expectedValue5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_2800
     * @tc.name testInt16ArrayFilterTestTwo028
     * @tc.desc Verify filter keeps original buffer reference unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3);
      let bufBefore = arr.buffer;
      arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 1;
      });
      expect(bufBefore).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_2900
     * @tc.name testInt16ArrayFilterTestTwo029
     * @tc.desc Verify filter leaves original array independently usable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4, 5);
      arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 3;
      });
      let afterUse = arr.$_get(0) + arr.$_get(1);
      expect(afterUse).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_3000
     * @tc.name testInt16ArrayFilterTestTwo030
     * @tc.desc Verify filter().filter() keeps dual-condition matching elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40, 50);
      let result = arr
        .filter((val: number, index: int, array: Int16Array): boolean => {
          return val > 20;
        })
        .filter((val: number, index: int, array: Int16Array): boolean => {
          return val < 50;
        });
      let actualValue: int = result.length;
      let expectedValue: int = 2;
      expect(actualValue).assertEqual(expectedValue);
      let actualValue2: number = result.$_get(0);
      let expectedValue2: int = 30;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3: number = result.$_get(1);
      let expectedValue3: int = 40;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_3100
     * @tc.name testInt16ArrayFilterTestTwo031
     * @tc.desc Verify filter().filter() second stage after first all-pass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(5, 15, 25);
      let result = arr
        .filter((val: number, index: int, array: Int16Array): boolean => {
          return val > 0;
        })
        .filter((val: number, index: int, array: Int16Array): boolean => {
          return val > 10;
        });
      let actualValue: int = result.length;
      let expectedValue: int = 2;
      expect(actualValue).assertEqual(expectedValue);
      let actualValue2: number = result.$_get(0);
      let expectedValue2: int = 15;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3: number = result.$_get(1);
      let expectedValue3: int = 25;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_3200
     * @tc.name testInt16ArrayFilterTestTwo032
     * @tc.desc Verify filter().filter() empty first stage yields empty second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3);
      let result = arr
        .filter((val: number, index: int, array: Int16Array): boolean => {
          return val > 100;
        })
        .filter((val: number, index: int, array: Int16Array): boolean => {
          return val > 0;
        });
      let actualValue: int = result.length;
      let expectedValue: int = 0;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_3300
     * @tc.name testInt16ArrayFilterTestTwo033
     * @tc.desc Verify complementary nested filter predicates yield empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4, 5);
      let result = arr
        .filter((val: number, index: int, array: Int16Array): boolean => {
          return val > 2;
        })
        .filter((val: number, index: int, array: Int16Array): boolean => {
          return val <= 2;
        });
      let actualValue: int = result.length;
      let expectedValue: int = 0;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_3400
     * @tc.name testInt16ArrayFilterTestTwo034
     * @tc.desc Verify idempotent same-predicate nested filter keeps values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4);
      let first = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 2;
      });
      let second = first.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 2;
      });
      let actualValue: int = second.length;
      let expectedValue: number = first.length;
      expect(actualValue).assertEqual(expectedValue);
      let actualValue2: number = second.$_get(0);
      let expectedValue2: number = first.$_get(0);
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3: number = second.$_get(1);
      let expectedValue3: number = first.$_get(1);
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_3500
     * @tc.name testInt16ArrayFilterTestTwo035
     * @tc.desc Verify nested filter intermediate result has independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4);
      let mid = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 2;
      });
      let finalResult = mid.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 3;
      });
      expect(mid.buffer).not().assertEqual(finalResult.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_3600
     * @tc.name testInt16ArrayFilterTestTwo036
     * @tc.desc Verify filter callback writes external accumulator for pass count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(5, 8, 13, 21, 34);
      let passCount = 0;
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        if (val > 10) {
          passCount++;
          return true;
        }
        return false;
      });
      expect(passCount).assertEqual(3);
      let actualValue: int = result.length;
      let expectedValue: int = 3;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_3700
     * @tc.name testInt16ArrayFilterTestTwo037
     * @tc.desc Verify filter callback stores visited values to external Int16Array in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(100, 200, 300);
      let visited = Int16Array.of(0, 0, 0);
      arr.filter((val: number, index: int, array: Int16Array): boolean => {
        visited.$_set(index, val);
        return true;
      });
      let actualValue: number = visited.$_get(0);
      let expectedValue: int = 100;
      expect(actualValue).assertEqual(expectedValue);
      let actualValue2: number = visited.$_get(1);
      let expectedValue2: int = 200;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3: number = visited.$_get(2);
      let expectedValue3: int = 300;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_3800
     * @tc.name testInt16ArrayFilterTestTwo038
     * @tc.desc Verify filter callback reads external boolean flag to switch predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4, 5, 6);
      let useEven = true;
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        if (useEven) {
          return val % 2 === 0;
        }
        return val % 2 === 1;
      });
      let actualValue: int = result.length;
      let expectedValue: int = 3;
      expect(actualValue).assertEqual(expectedValue);
      let actualValue2: number = result.$_get(0);
      let expectedValue2: int = 2;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_3900
     * @tc.name testInt16ArrayFilterTestTwo039
     * @tc.desc Verify multiple filter calls share external accumulator state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedCount = 0;
      let arr1 = Int16Array.of(1, 2);
      let arr2 = Int16Array.of(3, 4);
      arr1.filter((val: number, index: int, array: Int16Array): boolean => {
        sharedCount++;
        return true;
      });
      arr2.filter((val: number, index: int, array: Int16Array): boolean => {
        sharedCount++;
        return true;
      });
      expect(sharedCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_4000
     * @tc.name testInt16ArrayFilterTestTwo040
     * @tc.desc Verify filter callback reads external collected set for uniqueness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 1, 2, 2, 3);
      let seen0 = 0;
      let seen1 = 0;
      let seen2 = 0;
      let collected = 0;
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        if (val === 1 && seen0 === 0) {
          seen0 = 1;
          collected++;
          return true;
        }
        if (val === 1 && seen0 !== 0) {
          return false;
        }
        if (val === 2 && seen1 === 0) {
          seen1 = 1;
          collected++;
          return true;
        }
        if (val === 2 && seen1 !== 0) {
          return false;
        }
        if (val === 3 && seen2 === 0) {
          seen2 = 1;
          collected++;
          return true;
        }
        return false;
      });
      let actualValue: int = result.length;
      let expectedValue: int = 3;
      expect(actualValue).assertEqual(expectedValue);
      expect(collected).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_4100
     * @tc.name testInt16ArrayFilterTestTwo041
     * @tc.desc Verify filter reads values after $_set writes on source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(0, 0, 0);
      arr.$_set(1, 99);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val === 99;
      });
      let actualValue: int = result.length;
      let expectedValue: int = 1;
      expect(actualValue).assertEqual(expectedValue);
      let actualValue2: number = result.$_get(0);
      let expectedValue2: int = 99;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_4200
     * @tc.name testInt16ArrayFilterTestTwo042
     * @tc.desc Verify filter reads reversed values after reverse on source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4, 5);
      arr.reverse();
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 3;
      });
      let actualString: string = result.toString();
      let expectedString: string = '5,4';
      expect(actualString).assertEqual(expectedString);
      let actualValue: number = result.$_get(0);
      let expectedValue: int = 5;
      expect(actualValue).assertEqual(expectedValue);
      let actualValue2: number = result.$_get(1);
      let expectedValue2: int = 4;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_4300
     * @tc.name testInt16ArrayFilterTestTwo043
     * @tc.desc Verify filter reads moved values after copyWithin on source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40, 50);
      arr.copyWithin(0, 3, 5);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val >= 40;
      });
      let actualString: string = result.toString();
      let expectedString: string = '40,50,40,50';
      expect(actualString).assertEqual(expectedString);
      let actualValue: int = result.length;
      let expectedValue: int = 4;
      expect(actualValue).assertEqual(expectedValue);
      let actualValue2: number = result.$_get(0);
      let expectedValue2: int = 40;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3: number = result.$_get(1);
      let expectedValue3: int = 50;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_4400
     * @tc.name testInt16ArrayFilterTestTwo044
     * @tc.desc Verify filter reads newly written values after set() on source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4, 5);
      let source = Int16Array.of(100, 200);
      arr.set(source, 2);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 100;
      });
      let actualString: string = result.toString();
      let expectedString: string = '200';
      expect(actualString).assertEqual(expectedString);
      let actualValue: int = result.length;
      let expectedValue: int = 1;
      expect(actualValue).assertEqual(expectedValue);
      let actualValue2: number = result.$_get(0);
      let expectedValue2: int = 200;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_4500
     * @tc.name testInt16ArrayFilterTestTwo045
     * @tc.desc Verify filter reads sorted values after sort on source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(50, 10, 40, 20, 30);
      arr.sort();
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 30;
      });
      let actualString: string = result.toString();
      let expectedString: string = '40,50';
      expect(actualString).assertEqual(expectedString);
      let actualValue: number = result.$_get(0);
      let expectedValue: int = 40;
      expect(actualValue).assertEqual(expectedValue);
      let actualValue2: number = result.$_get(1);
      let expectedValue2: int = 50;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_4600
     * @tc.name testInt16ArrayFilterTestTwo046
     * @tc.desc Verify fill then read on filter result values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4, 5);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 3;
      });
      result.fill(0);
      let actualString: string = result.toString();
      let expectedString: string = '0,0';
      expect(actualString).assertEqual(expectedString);
      let actualValue: number = result.$_get(0);
      let expectedValue: int = 0;
      expect(actualValue).assertEqual(expectedValue);
      let actualValue2: number = result.$_get(1);
      let expectedValue2: int = 0;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_4700
     * @tc.name testInt16ArrayFilterTestTwo047
     * @tc.desc Verify filter callback $_set modifies later indexes affecting later iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(2, 999);
        }
        return val > 50;
      });
      let actualString: string = result.toString();
      let expectedString: string = '999';
      expect(actualString).assertEqual(expectedString);
      let actualValue: int = result.length;
      let expectedValue: int = 1;
      expect(actualValue).assertEqual(expectedValue);
      let actualValue2: number = result.$_get(0);
      let expectedValue2: int = 999;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_4800
     * @tc.name testInt16ArrayFilterTestTwo048
     * @tc.desc Verify filter callback fill on later range affects later iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4, 5);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.fill(0, 3, 5);
        }
        return val > 0;
      });
      let actualString: string = result.toString();
      let expectedString: string = '1,2,3';
      expect(actualString).assertEqual(expectedString);
      let actualValue: int = result.length;
      let expectedValue: int = 3;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_4900
     * @tc.name testInt16ArrayFilterTestTwo049
     * @tc.desc Verify filter callback copyWithin moves elements and affects iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40, 50);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.copyWithin(2, 0, 2);
        }
        return val > 0;
      });
      let actualString: string = result.toString();
      let expectedString: string = '10,20,10,20,50';
      expect(actualString).assertEqual(expectedString);
      let actualValue: int = result.length;
      let expectedValue: int = 5;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_5000
     * @tc.name testInt16ArrayFilterTestTwo050
     * @tc.desc Verify filter callback set overwrites later part and affects iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4, 5);
      let src = Int16Array.of(99, 99);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.set(src, 3);
        }
        return val > 50;
      });
      let actualString: string = result.toString();
      let expectedString: string = '99,99';
      expect(actualString).assertEqual(expectedString);
      let actualValue: int = result.length;
      let expectedValue: int = 2;
      expect(actualValue).assertEqual(expectedValue);
      let actualValue2: number = result.$_get(0);
      let expectedValue2: int = 99;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3: number = result.$_get(1);
      let expectedValue3: int = 99;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_5100
     * @tc.name testInt16ArrayFilterTestTwo051
     * @tc.desc Verify filter callback reverse on original array affects iteration reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4, 5);
      let valAt0Before: number = arr.$_get(0);
      let valAt0After: number = 0;
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.reverse();
        }
        if (index === 0) {
          valAt0After = array.$_get(0);
        }
        return true;
      });
      expect(valAt0Before).assertEqual(1);
      expect(valAt0After).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_5200
     * @tc.name testInt16ArrayFilterTestTwo052
     * @tc.desc Verify original length stays constant during filter iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4);
      let lenAtIdx0 = 0;
      let lenAtIdx2 = 0;
      arr.filter((val: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          lenAtIdx0 = array.length;
        }
        if (index === 2) {
          lenAtIdx2 = array.length;
        }
        return true;
      });
      expect(lenAtIdx0).assertEqual(4);
      expect(lenAtIdx2).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_5300
     * @tc.name testInt16ArrayFilterTestTwo053
     * @tc.desc Verify filter keeps NaN-to-0 source element as 0 in result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([Number.NaN, 1, 2]);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val === 0;
      });
      let actualValue: number = result.$_get(0);
      let expectedValue: int = 0;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_5400
     * @tc.name testInt16ArrayFilterTestTwo054
     * @tc.desc Verify filter keeps wraparound 32768 to -32768 in result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.from([32768, 100]);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val < 0;
      });
      let actualValue: number = result.$_get(0);
      let expectedValue: int = -32768;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_5500
     * @tc.name testInt16ArrayFilterTestTwo055
     * @tc.desc Verify filter result holds both MAX and MIN exact values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(32767, 0, -32768, 50);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val !== 0;
      });
      let actualValue: int = result.length;
      let expectedValue: int = 3;
      expect(actualValue).assertEqual(expectedValue);
      let actualValue2: number = result.$_get(0);
      let expectedValue2: int = 32767;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3: number = result.$_get(1);
      let expectedValue3: int = -32768;
      expect(actualValue3).assertEqual(expectedValue3);
      let actualValue4: number = result.$_get(2);
      let expectedValue4: int = 50;
      expect(actualValue4).assertEqual(expectedValue4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_5600
     * @tc.name testInt16ArrayFilterTestTwo056
     * @tc.desc Verify filter result has independent buffer from ArrayBuffer view source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view = new Int16Array(buf);
      view.$_set(0, 100);
      view.$_set(1, 200);
      let result = view.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 150;
      });
      expect(result.buffer).not().assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_5700
     * @tc.name testInt16ArrayFilterTestTwo057
     * @tc.desc Verify filter result has independent buffer from subarray source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original = Int16Array.of(1, 2, 3, 4, 5);
      let sub = original.subarray(1, 4);
      let result = sub.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 2;
      });
      expect(result.buffer).not().assertEqual(sub.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_5800
     * @tc.name testInt16ArrayFilterTestTwo058
     * @tc.desc Verify filter result buffer.byteLength equals length times BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40, 50, 60);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 30;
      });
      let actualValue: int = result.buffer.byteLength;
      let expectedValue: number = result.length * result.BYTES_PER_ELEMENT;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_5900
     * @tc.name testInt16ArrayFilterTestTwo059
     * @tc.desc Verify two filter results from same source have distinct independent buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4, 5, 6);
      let evenFiltered = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val % 2 === 0;
      });
      let oddFiltered = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val % 2 === 1;
      });
      expect(evenFiltered.buffer).not().assertEqual(oddFiltered.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_6000
     * @tc.name testInt16ArrayFilterTestTwo060
     * @tc.desc Verify filter result can construct a new Int16Array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 20;
      });
      let copy = new Int16Array(result.buffer);
      let actualValue: number = copy.$_get(0);
      let expectedValue: int = 30;
      expect(actualValue).assertEqual(expectedValue);
      let actualValue2: number = copy.$_get(1);
      let expectedValue2: int = 40;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_6100
     * @tc.name testInt16ArrayFilterTestTwo061
     * @tc.desc Verify filter results from two offset views of same ArrayBuffer are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let view1 = new Int16Array(buf, 0, 4);
      let view2 = new Int16Array(buf, 8, 4);
      view1.$_set(0, 11);
      view1.$_set(1, 22);
      view2.$_set(0, 33);
      view2.$_set(1, 44);
      let r1 = view1.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 15;
      });
      let r2 = view2.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 40;
      });
      expect(r1.buffer).not().assertEqual(r2.buffer);
      let actualValue: number = r1.$_get(0);
      let expectedValue: int = 22;
      expect(actualValue).assertEqual(expectedValue);
      let actualValue2: number = r2.$_get(0);
      let expectedValue2: int = 44;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_6200
     * @tc.name testInt16ArrayFilterTestTwo062
     * @tc.desc Verify filter result is fully decoupled from original buffer mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(100, 200, 300);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 150;
      });
      let rawBytes = arr.buffer;
      let rawView = new Int16Array(rawBytes);
      rawView.$_set(1, 999);
      let actualValue: number = result.$_get(0);
      let expectedValue: int = 200;
      expect(actualValue).assertEqual(expectedValue);
      let actualValue2: number = result.$_get(1);
      let expectedValue2: int = 300;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_6300
     * @tc.name testInt16ArrayFilterTestTwo063
     * @tc.desc Verify empty array filter result buffer differs from original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 1000;
      });
      expect(result.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_6400
     * @tc.name testInt16ArrayFilterTestTwo064
     * @tc.desc Verify filter result passes isView check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 0;
      });
      let actualValue: boolean = ArrayBuffer.isView(result);
      expect(actualValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_6500
     * @tc.name testInt16ArrayFilterTestTwo065
     * @tc.desc Verify filter then forEach validates element values and indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(5, 10, 15, 20);
      let valAt0: number = 0;
      let valAt2: number = 0;
      let idxAt0: int = 0;
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val >= 10;
      });
      result.forEach((val: number, index: int): void => {
        if (index === 0) {
          valAt0 = val;
          idxAt0 = index;
        }
        if (index === 2) {
          valAt2 = val;
        }
      });
      expect(valAt0).assertEqual(10);
      expect(idxAt0).assertEqual(0);
      expect(valAt2).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_6600
     * @tc.name testInt16ArrayFilterTestTwo066
     * @tc.desc Verify filter then map keeps values in int16 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 2;
      });
      let mapped = result.map((val: number, index: int, array: Int16Array) => val * 100);
      let actualValue: number = mapped.$_get(0);
      let expectedValue: int = 300;
      expect(actualValue).assertEqual(expectedValue);
      let actualValue2: number = mapped.$_get(1);
      let expectedValue2: int = 400;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_6700
     * @tc.name testInt16ArrayFilterTestTwo067
     * @tc.desc Verify filter then sort reorders result values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(50, 10, 30, 20, 40);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 15;
      });
      result.sort();
      let actualValue: number = result.$_get(0);
      let expectedValue: int = 20;
      expect(actualValue).assertEqual(expectedValue);
      let actualValue2: number = result.$_get(1);
      let expectedValue2: int = 30;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3: number = result.$_get(2);
      let expectedValue3: int = 40;
      expect(actualValue3).assertEqual(expectedValue3);
      let actualValue4: number = result.$_get(3);
      let expectedValue4: int = 50;
      expect(actualValue4).assertEqual(expectedValue4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_6800
     * @tc.name testInt16ArrayFilterTestTwo068
     * @tc.desc Verify filter then join stringifies result values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 2;
      });
      let actualValue: string = result.join(',');
      let expectedValue: string = '3,4';
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_6900
     * @tc.name testInt16ArrayFilterTestTwo069
     * @tc.desc Verify filter then includes searches result values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(5, 10, 15, 20);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 5;
      });
      let actualValue: boolean = result.includes(10);
      expect(actualValue).assertTrue();
      let actualValue2: boolean = result.includes(5);
      expect(actualValue2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_7000
     * @tc.name testInt16ArrayFilterTestTwo070
     * @tc.desc Verify filter then fill then filter validates state transfer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4, 5);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 2;
      });
      result.fill(0, 0, 1);
      let zeroFiltered = result.filter((val: number, index: int, array: Int16Array): boolean => {
        return val === 0;
      });
      let actualValue: int = zeroFiltered.length;
      let expectedValue: int = 1;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_7100
     * @tc.name testInt16ArrayFilterTestTwo071
     * @tc.desc Verify filter then filter validates chained buffer independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40);
      let r1 = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 15;
      });
      let r2 = r1.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 25;
      });
      r1.$_set(0, 999);
      let actualValue: number = r2.$_get(0);
      let expectedValue: int = 30;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_TWO_7200
     * @tc.name testInt16ArrayFilterTestTwo072
     * @tc.desc Verify filter then $_get random-access validates result values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4, 5);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 2;
      });
      let actualValue: number = result.$_get(0);
      let expectedValue: int = 3;
      expect(actualValue).assertEqual(expectedValue);
      let actualValue2: number = result.$_get(result.length - 1);
      let expectedValue2: int = 5;
      expect(actualValue2).assertEqual(expectedValue2);
    });

  });
}
