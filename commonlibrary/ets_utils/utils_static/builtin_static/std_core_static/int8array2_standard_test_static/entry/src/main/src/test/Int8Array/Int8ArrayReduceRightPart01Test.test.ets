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
import Utils from './../Util.test';

class AccR001 {
  sum: number = 0;
}
class AccR002 {
  sum: number = 0;
}
class SumR001 {
  value: number = 0;
}
class MyCustomErrR001 extends Error {
  constructor(msg: string) {
    super(msg);
    this.name = 'MyCustomError';
  }
}

export default function int8ArrayReduceRightPart01Test(): void {
  describe('Int8ArrayReduceRightPart01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    const INT8_MAX = 127;
    const INT8_MIN = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_0100
     * @tc.name int8ArrayReduceRightPart01Test001
     * @tc.desc Verify reduceRight with callbackfn + initialValue, arity 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 10);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_0200
     * @tc.name int8ArrayReduceRightPart01Test002
     * @tc.desc Verify reduceRight with initialValue 0, result equals element sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_0300
     * @tc.name int8ArrayReduceRightPart01Test003
     * @tc.desc Verify reduceRight with negative initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, -10);
      expect(result).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_0400
     * @tc.name int8ArrayReduceRightPart01Test004
     * @tc.desc Verify reduceRight callback with 3 parameters (omit array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 10, 15]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int) => p + c, 100);
      expect(result).assertEqual(130);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_0500
     * @tc.name int8ArrayReduceRightPart01Test005
     * @tc.desc Verify reduceRight callback with 2 parameters (omit currentIndex and array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([2, 4, 6]);
      let result = arr.reduceRight<number>((p: number, c: number) => p + c, 0);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_0600
     * @tc.name int8ArrayReduceRightPart01Test006
     * @tc.desc Verify reduceRight callback with 1 parameter (identity return)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduceRight<number>((p: number) => p, 42);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_0700
     * @tc.name int8ArrayReduceRightPart01Test007
     * @tc.desc Verify reduceRight first call currentValue equals last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let firstCurrent: number = 0;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        if (i === 2) {
          firstCurrent = c;
        }
        return p + c;
      }, 0);
      expect(firstCurrent).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_0800
     * @tc.name int8ArrayReduceRightPart01Test008
     * @tc.desc Verify reduceRight last call currentValue equals first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let lastCurrent: number = 0;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        if (i === 0) {
          lastCurrent = c;
        }
        return p + c;
      }, 0);
      expect(lastCurrent).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_0900
     * @tc.name int8ArrayReduceRightPart01Test009
     * @tc.desc Verify reduceRight first call index equals length minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let firstIndex: int = -1;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        if (firstIndex === -1) {
          firstIndex = i;
        }
        return p + c;
      }, 0);
      expect(firstIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_1000
     * @tc.name int8ArrayReduceRightPart01Test010
     * @tc.desc Verify reduceRight last call currentIndex equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let lastIndex: int = -1;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        lastIndex = i;
        return p + c;
      }, 0);
      expect(lastIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_1100
     * @tc.name int8ArrayReduceRightPart01Test011
     * @tc.desc Verify reduceRight currentIndex decreasing sequence [2, 1, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let indices: int[] = [];
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        indices.push(i);
        return p + c;
      }, 0);
      let actualIdx0: number = indices[0];
      let expectedIdx0: int = 2;
      expect(actualIdx0).assertEqual(expectedIdx0);
      let actualIdx1: number = indices[1];
      let expectedIdx1: int = 1;
      expect(actualIdx1).assertEqual(expectedIdx1);
      let actualIdx2: number = indices[2];
      let expectedIdx2: int = 0;
      expect(actualIdx2).assertEqual(expectedIdx2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_1200
     * @tc.name int8ArrayReduceRightPart01Test012
     * @tc.desc Verify reduceRight array parameter length equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([7, 8, 9, 10]);
      let capturedLen: int = 0;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        capturedLen = a.length;
        return p + c;
      }, 0);
      expect(capturedLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_1300
     * @tc.name int8ArrayReduceRightPart01Test013
     * @tc.desc Verify reduceRight callback set visible in source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        a.$_set(0, 99);
        return p + c;
      }, 0);
      let actualValue: number = arr.$_get(0);
      let expectedValue: int = 99;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_1400
     * @tc.name int8ArrayReduceRightPart01Test014
     * @tc.desc Verify reduceRight with initial zero sums to fifteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight<number>((p: number, c: number) => p + c, 0);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_1500
     * @tc.name int8ArrayReduceRightPart01Test015
     * @tc.desc Verify reduceRight with initial one hundred sums to one hundred six
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduceRight<number>((p: number, c: number) => p + c, 100);
      expect(result).assertEqual(106);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_1600
     * @tc.name int8ArrayReduceRightPart01Test016
     * @tc.desc Verify p - c subtraction chain from right to left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduceRight<number>((p: number, c: number) => p - c, 50);
      expect(result).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_1700
     * @tc.name int8ArrayReduceRightPart01Test017
     * @tc.desc Verify reduceRight p * c multiply equals element product times initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let result = arr.reduceRight<number>((p: number, c: number) => p * c, 1);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_1800
     * @tc.name int8ArrayReduceRightPart01Test018
     * @tc.desc Verify reduceRight callback always returns constant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduceRight<number>((p: number, c: number) => 7, 10);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_1900
     * @tc.name int8ArrayReduceRightPart01Test019
     * @tc.desc Verify reduceRight callback identity returns previousValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduceRight<number>((p: number, c: number) => p, 42);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_2000
     * @tc.name int8ArrayReduceRightPart01Test020
     * @tc.desc Verify U=string concatenation from right to left, result S321
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduceRight<string>((p: string, c: number, i: int, a: Int8Array) => p + c.toString(), 'S');
      expect(result).assertEqual('S321');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_2100
     * @tc.name int8ArrayReduceRightPart01Test021
     * @tc.desc Verify reduceRight string overload prepends initial to element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([7]);
      let result = arr.reduceRight<string>((p: string, c: number, i: int, a: Int8Array) => p + c.toString(), 'X');
      expect(result).assertEqual('X7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_2200
     * @tc.name int8ArrayReduceRightPart01Test022
     * @tc.desc Verify reduceRight U=string empty array returns initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let result = arr.reduceRight<string>((p: string, c: number, i: int, a: Int8Array) => p + c.toString(), 'EMPTY');
      expect(result).assertEqual('EMPTY');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_2300
     * @tc.name int8ArrayReduceRightPart01Test023
     * @tc.desc Verify reduceRight custom class accumulates sum sixteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let init: AccR001 = new AccR001();
      init.sum = 10;
      let result = arr.reduceRight<AccR001>((p: AccR001, c: number, i: int, a: Int8Array) => {
        let r: AccR001 = new AccR001();
        r.sum = p.sum + c;
        return r;
      }, init);
      let actualSum: number = result.sum;
      let expectedSum: int = 16;
      expect(actualSum).assertEqual(expectedSum);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_2400
     * @tc.name int8ArrayReduceRightPart01Test024
     * @tc.desc Verify reduceRight U=custom class empty array returns initialValue reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let init: AccR002 = new AccR002();
      init.sum = 5;
      let result = arr.reduceRight<AccR002>((p: AccR002, c: number, i: int, a: Int8Array) => {
        let r: AccR002 = new AccR002();
        r.sum = p.sum + c;
        return r;
      }, init);
      let actualSum: number = result.sum;
      let expectedSum: int = 5;
      expect(actualSum).assertEqual(expectedSum);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_2500
     * @tc.name int8ArrayReduceRightPart01Test025
     * @tc.desc Verify reduceRight modification keeps iteration count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let callCount: int = 0;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        callCount++;
        a.$_set(0, 99);
        return p + c;
      }, 0);
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_2600
     * @tc.name int8ArrayReduceRightPart01Test026
     * @tc.desc Verify reduceRight callback reads external multiplier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let multiplier: number = 2;
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c * multiplier, 0);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_2700
     * @tc.name int8ArrayReduceRightPart01Test027
     * @tc.desc Verify reduceRight callback writes external accumulator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let externalAcc: number = 0;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        externalAcc = p + c;
        return externalAcc;
      }, 0);
      expect(externalAcc).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_2800
     * @tc.name int8ArrayReduceRightPart01Test028
     * @tc.desc Verify reduceRight visits indices in decreasing order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40]);
      let visited: int[] = [];
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        visited.push(i);
        return p + c;
      }, 0);
      let actualLen: int = visited.length;
      let expectedLen: int = 4;
      expect(actualLen).assertEqual(expectedLen);
      let actualFirst: number = visited[0];
      let expectedFirst: int = 3;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualLast: number = visited[3];
      let expectedLast: int = 0;
      expect(actualLast).assertEqual(expectedLast);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_2900
     * @tc.name int8ArrayReduceRightPart01Test029
     * @tc.desc Verify reduceRight empty array callback executes 0 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let callCount: int = 0;
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        callCount++;
        return p + c;
      }, 42);
      expect(callCount).assertEqual(0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_3000
     * @tc.name int8ArrayReduceRightPart01Test030
     * @tc.desc Verify reduceRight single element array callback executes 1 time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5]);
      let callCount: int = 0;
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        callCount++;
        return p + c;
      }, 10);
      expect(callCount).assertEqual(1);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_3100
     * @tc.name int8ArrayReduceRightPart01Test031
     * @tc.desc Verify reduceRight N element array callback executes N times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5, 6]);
      let callCount: int = 0;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        callCount++;
        return p + c;
      }, 0);
      expect(callCount).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_3200
     * @tc.name int8ArrayReduceRightPart01Test032
     * @tc.desc Verify reduceRight single element with initial zero returns element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_3300
     * @tc.name int8ArrayReduceRightPart01Test033
     * @tc.desc Verify reduceRight negative initial reduces sum by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, -1);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_3400
     * @tc.name int8ArrayReduceRightPart01Test034
     * @tc.desc Verify reduceRight min initial adds element once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, -128);
      expect(result).assertEqual(-127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_3500
     * @tc.name int8ArrayReduceRightPart01Test035
     * @tc.desc Verify reduceRight max initial adds element once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 127);
      expect(result).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_3600
     * @tc.name int8ArrayReduceRightPart01Test036
     * @tc.desc Verify reduceRight positive infinity initial stays infinite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduceRight<number>(
        (p: number, c: number, i: int, a: Int8Array) => p + c,
        Number.POSITIVE_INFINITY,
      );
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_3700
     * @tc.name int8ArrayReduceRightPart01Test037
     * @tc.desc Verify reduceRight negative infinity initial stays infinite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduceRight<number>(
        (p: number, c: number, i: int, a: Int8Array) => p + c,
        Number.NEGATIVE_INFINITY,
      );
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_3800
     * @tc.name int8ArrayReduceRightPart01Test038
     * @tc.desc Verify reduceRight NaN initial yields NaN result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, Number.NaN);
      let isResultNaN: boolean = isNaN(result);
      expect(isResultNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_3900
     * @tc.name int8ArrayReduceRightPart01Test039
     * @tc.desc Verify reduceRight large initial not truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 1000);
      expect(result).assertEqual(1003);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_4000
     * @tc.name int8ArrayReduceRightPart01Test040
     * @tc.desc Verify reduceRight initialValue large number plus finite value does not overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1]);
      let bigInit: number = 9007199254740991;
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, bigInit);
      expect(result).assertEqual(9007199254740992);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_4100
     * @tc.name int8ArrayReduceRightPart01Test041
     * @tc.desc Verify reduceRight empty array returns initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 77);
      expect(result).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_4200
     * @tc.name int8ArrayReduceRightPart01Test042
     * @tc.desc Verify reduceRight single element plus initialValue result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([8]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 20);
      expect(result).assertEqual(28);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_4300
     * @tc.name int8ArrayReduceRightPart01Test043
     * @tc.desc Verify reduceRight number generic sums to eighteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 6, 9]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      expect(result).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_4400
     * @tc.name int8ArrayReduceRightPart01Test044
     * @tc.desc Verify reduceRight custom class accumulates fifteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 10]);
      let init: SumR001 = new SumR001();
      init.value = 0;
      let result = arr.reduceRight<SumR001>((p: SumR001, c: number, i: int, a: Int8Array) => {
        let r: SumR001 = new SumR001();
        r.value = p.value + c;
        return r;
      }, init);
      let actualValue: number = result.value;
      let expectedValue: int = 15;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_4500
     * @tc.name int8ArrayReduceRightPart01Test045
     * @tc.desc Verify multi-element array right-to-left accumulation correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 100);
      expect(result).assertEqual(115);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_4600
     * @tc.name int8ArrayReduceRightPart01Test046
     * @tc.desc Verify reduceRight single element array returns initialValue plus single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 8);
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_4700
     * @tc.name int8ArrayReduceRightPart01Test047
     * @tc.desc Verify reduceRight empty array returns initialValue and callback not executed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let executed: boolean = false;
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        executed = true;
        return p + c;
      }, 99);
      expect(result).assertEqual(99);
      expect(executed).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_4800
     * @tc.name int8ArrayReduceRightPart01Test048
     * @tc.desc Verify reduceRight does not modify original array (immutability)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      let actualLen: int = arr.length;
      let expectedLen: int = 3;
      expect(actualLen).assertEqual(expectedLen);
      let actualElem0: number = arr.$_get(0);
      let expectedElem0: int = 1;
      expect(actualElem0).assertEqual(expectedElem0);
      let actualElem2: number = arr.$_get(2);
      let expectedElem2: int = 3;
      expect(actualElem2).assertEqual(expectedElem2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_4900
     * @tc.name int8ArrayReduceRightPart01Test049
     * @tc.desc Verify reduceRight propagates callback RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      try {
        arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
          throw new RangeError('range');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_5000
     * @tc.name int8ArrayReduceRightPart01Test050
     * @tc.desc Verify reduceRight propagates callback TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      try {
        arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
          throw new TypeError('type');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_5100
     * @tc.name int8ArrayReduceRightPart01Test051
     * @tc.desc Verify reduceRight propagates callback Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      try {
        arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
          throw new Error('generic');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_5200
     * @tc.name int8ArrayReduceRightPart01Test052
     * @tc.desc Verify reduceRight propagates custom error subclass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      try {
        arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
          throw new MyCustomErrR001('custom');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('MyCustomError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_5300
     * @tc.name int8ArrayReduceRightPart01Test053
     * @tc.desc Verify reduceRight callback NaN return propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => Number.NaN, 10);
      let isResultNaN: boolean = isNaN(result);
      expect(isResultNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_5400
     * @tc.name int8ArrayReduceRightPart01Test054
     * @tc.desc Verify reduceRight callback positive infinity propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduceRight<number>(
        (p: number, c: number, i: int, a: Int8Array) => Number.POSITIVE_INFINITY,
        10,
      );
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_5500
     * @tc.name int8ArrayReduceRightPart01Test055
     * @tc.desc Verify reduceRight callback negative infinity propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduceRight<number>(
        (p: number, c: number, i: int, a: Int8Array) => Number.NEGATIVE_INFINITY,
        10,
      );
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_5600
     * @tc.name int8ArrayReduceRightPart01Test056
     * @tc.desc Verify reduceRight max pair sums two hundred fifty four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, INT8_MAX]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      expect(result).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_5700
     * @tc.name int8ArrayReduceRightPart01Test057
     * @tc.desc Verify reduceRight callback float addition keeps precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c + 0.5, 0);
      expect(result).assertEqual(7.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_5800
     * @tc.name int8ArrayReduceRightPart01Test058
     * @tc.desc Verify reduceRight huge callback return not overflowed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => 1e200, 0);
      expect(result).assertEqual(1e200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_5900
     * @tc.name int8ArrayReduceRightPart01Test059
     * @tc.desc Verify reduceRight all-zero element array plus initialValue equals initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 0, 0]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 50);
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_6000
     * @tc.name int8ArrayReduceRightPart01Test060
     * @tc.desc Verify reduceRight same elements sum to twenty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 5, 5, 5]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_6100
     * @tc.name int8ArrayReduceRightPart01Test061
     * @tc.desc Verify reduceRight min boundary element sums negative one hundred twenty five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MIN, 1, 2]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      expect(result).assertEqual(-125);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_6200
     * @tc.name int8ArrayReduceRightPart01Test062
     * @tc.desc Verify reduceRight max boundary element sums one hundred thirty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, 1, 2]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      expect(result).assertEqual(130);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_6300
     * @tc.name int8ArrayReduceRightPart01Test063
     * @tc.desc Verify reduceRight truncated element participates in sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([200, 1, 2]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      expect(result).assertEqual(-53);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_6400
     * @tc.name int8ArrayReduceRightPart01Test064
     * @tc.desc Verify reduceRight single element boundary -128 plus initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MIN]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      expect(result).assertEqual(INT8_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_6500
     * @tc.name int8ArrayReduceRightPart01Test065
     * @tc.desc Verify reduceRight single element boundary 127 plus initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      expect(result).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_6600
     * @tc.name int8ArrayReduceRightPart01Test066
     * @tc.desc Verify large array (100 elements) right-to-left accumulation correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(100);
      for (let j = 0; j < 100; j++) {
        arr.$_set(j, 1);
      }
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_6700
     * @tc.name int8ArrayReduceRightPart01Test067
     * @tc.desc Verify reduceRight large array callback count one hundred fifty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(150);
      for (let j = 0; j < 150; j++) {
        arr.$_set(j, 1);
      }
      let callCount: int = 0;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        callCount++;
        return p + c;
      }, 0);
      expect(callCount).assertEqual(150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_6800
     * @tc.name int8ArrayReduceRightPart01Test068
     * @tc.desc Verify reduceRight multiply initialValue=1 all-1 elements result is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 1, 1, 1, 1]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p * c, 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_6900
     * @tc.name int8ArrayReduceRightPart01Test069
     * @tc.desc Verify reduceRight multiply with zero element yields zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 0, 3]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p * c, 1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_7000
     * @tc.name int8ArrayReduceRightPart01Test070
     * @tc.desc Verify reduceRight multiply even negatives yields positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-1, 2, -3]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p * c, 1);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_7100
     * @tc.name int8ArrayReduceRightPart01Test071
     * @tc.desc Verify reduceRight multiply odd negatives yields negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-1, 2, 3]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p * c, 1);
      expect(result).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_7200
     * @tc.name int8ArrayReduceRightPart01Test072
     * @tc.desc Verify reduceRight previousValue first equals initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let firstPrev: number = 0;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        if (i === 2) {
          firstPrev = p;
        }
        return p + c;
      }, 999);
      expect(firstPrev).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_7300
     * @tc.name int8ArrayReduceRightPart01Test073
     * @tc.desc Verify reduceRight previousValue subsequently equals last return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let secondPrev: number = 0;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        if (i === 1) {
          secondPrev = p;
        }
        return p + c;
      }, 0);
      expect(secondPrev).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_7400
     * @tc.name int8ArrayReduceRightPart01Test074
     * @tc.desc Verify reduceRight callback returns previousValue - currentValue right-to-left subtraction chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let result = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => p - c, 0);
      expect(result).assertEqual(-60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_7500
     * @tc.name int8ArrayReduceRightPart01Test075
     * @tc.desc Verify reduceRight callback array byteOffset zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let capturedByteOffset: int = -1;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        if (i === 0) {
          capturedByteOffset = a.byteOffset;
        }
        return p + c;
      }, 0);
      expect(capturedByteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART01_7600
     * @tc.name int8ArrayReduceRightPart01Test076
     * @tc.desc Verify reduceRight callback array byteLength five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart01Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let capturedByteLength: int = 0;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        capturedByteLength = a.byteLength;
        return p + c;
      }, 0);
      expect(capturedByteLength).assertEqual(5);
    });
  });
}
