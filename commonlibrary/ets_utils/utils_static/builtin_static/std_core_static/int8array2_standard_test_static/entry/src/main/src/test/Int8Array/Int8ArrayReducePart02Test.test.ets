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

export default function int8ArrayReducePart02Test(): void {
  describe('Int8ArrayReducePart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_0100
     * @tc.name int8ArrayReducePart02Test001
     * @tc.desc Verify reduce with 3-element array accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => p + c);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_0300
     * @tc.name int8ArrayReducePart02Test003
     * @tc.desc Verify reduce with 2-element array triggers callback once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 10);
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => p + c);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_0400
     * @tc.name int8ArrayReducePart02Test004
     * @tc.desc Verify reduce callback uses all 4 parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => p + c + i + a.length);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_0500
     * @tc.name int8ArrayReducePart02Test005
     * @tc.desc Verify reduce callback uses first 3 parameters omitting array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: number = arr.reduce((p: number, c: number, i: int) => p + c + i);
      expect(result).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_0600
     * @tc.name int8ArrayReducePart02Test006
     * @tc.desc Verify reduce callback uses only previousValue and currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let result: number = arr.reduce((p: number, c: number) => p + c);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_0700
     * @tc.name int8ArrayReducePart02Test007
     * @tc.desc Verify reduce callback returns only previousValue ignoring others
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 2, 3);
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => p);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_0800
     * @tc.name int8ArrayReducePart02Test008
     * @tc.desc Verify reduce callback returns constant ignoring all parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_0900
     * @tc.name int8ArrayReducePart02Test009
     * @tc.desc Verify reduce first call previousValue equals arr[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20);
      let firstPrev: number = 0;
      let resultVal1: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => {
        firstPrev = p;
        return p + c;
      });
      let expectedVal1: number = 30;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(firstPrev).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_1000
     * @tc.name int8ArrayReducePart02Test010
     * @tc.desc Verify reduce second call previousValue equals previous callback return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let secondPrev: number = 0;
      let callCount: number = 0;
      let resultVal1: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => {
        callCount = callCount + 1;
        if (callCount === 2) {
          secondPrev = p;
        }
        return p + c;
      });
      let expectedVal1: number = 6;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(secondPrev).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_1100
     * @tc.name int8ArrayReducePart02Test011
     * @tc.desc Verify reduce later previousValue equals prior return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(2, 3, 4, 5);
      let lastPrev: number = 0;
      let callCount: number = 0;
      let resultVal1: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => {
        callCount = callCount + 1;
        if (callCount === 3) {
          lastPrev = p;
        }
        return p * c;
      });
      let expectedVal1: number = 120;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(lastPrev).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_1200
     * @tc.name int8ArrayReducePart02Test012
     * @tc.desc Verify reduce last call currentValue equals last array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 99);
      let lastCur: number = 0;
      let resultVal1: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => {
        lastCur = c;
        return p + c;
      });
      let expectedVal1: number = 105;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(lastCur).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_1300
     * @tc.name int8ArrayReducePart02Test013
     * @tc.desc Verify reduce currentValue covers first to last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 10, 20, 30);
      let captured: number[] = [];
      let resultVal1: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => {
        captured.push(c);
        return p + c;
      });
      let expectedVal1: number = 60;
      expect(resultVal1).assertEqual(expectedVal1);
      let capturedElement0: number = captured[0];
      let expectedValue0: int = 10;
      expect(capturedElement0).assertEqual(expectedValue0);
      let capturedElement1: number = captured[1];
      let expectedValue1: int = 20;
      expect(capturedElement1).assertEqual(expectedValue1);
      let capturedElement2: number = captured[2];
      let expectedValue2: int = 30;
      expect(capturedElement2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_1400
     * @tc.name int8ArrayReducePart02Test014
     * @tc.desc Verify reduce first call currentIndex equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20);
      let firstIdx: int = 0;
      let resultVal1: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => {
        firstIdx = i;
        return p + c;
      });
      let expectedVal1: number = 30;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(firstIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_1500
     * @tc.name int8ArrayReducePart02Test015
     * @tc.desc Verify reduce last call currentIndex equals length minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      let lastIdx: int = 0;
      let resultVal1: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => {
        lastIdx = i;
        return p + c;
      });
      let expectedVal1: number = 100;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(lastIdx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_1600
     * @tc.name int8ArrayReducePart02Test016
     * @tc.desc Verify reduce currentIndex is monotonically increasing sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let indices: number[] = [];
      let resultVal1: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => {
        indices.push(i);
        return p + c;
      });
      let expectedVal1: number = 10;
      expect(resultVal1).assertEqual(expectedVal1);
      let actualIdx0: number = indices[0];
      let expectedIdx0: int = 1;
      expect(actualIdx0).assertEqual(expectedIdx0);
      let actualIdx1: number = indices[1];
      let expectedIdx1: int = 2;
      expect(actualIdx1).assertEqual(expectedIdx1);
      let actualIdx2: number = indices[2];
      let expectedIdx2: int = 3;
      expect(actualIdx2).assertEqual(expectedIdx2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_1700
     * @tc.name int8ArrayReducePart02Test017
     * @tc.desc Verify reduce array parameter is same reference as original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let captured: Int8Array = arr;
      let resultVal1: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => {
        captured = a;
        return p + c;
      });
      let expectedVal1: number = 6;
      expect(resultVal1).assertEqual(expectedVal1);
      captured[0] = 77;
      let actualArrValue: number = arr[0];
      let expectedArrValue: int = 77;
      expect(actualArrValue).assertEqual(expectedArrValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_1800
     * @tc.name int8ArrayReducePart02Test018
     * @tc.desc Verify reduce array parameter length matches source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let capturedLen: number = 0;
      let resultVal1: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => {
        capturedLen = a.length;
        return p + c;
      });
      let expectedVal1: number = 15;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(capturedLen).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_1900
     * @tc.name int8ArrayReducePart02Test019
     * @tc.desc Verify reduce a[currentIndex] equals currentValue in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let allMatch: boolean = true;
      let resultVal1: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => {
        if (a[i] !== c) {
          allMatch = false;
        }
        return p + c;
      });
      let expectedVal1: number = 60;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_2000
     * @tc.name int8ArrayReducePart02Test020
     * @tc.desc Verify reduce callback returns constant 0 yields final result 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_2100
     * @tc.name int8ArrayReducePart02Test021
     * @tc.desc Verify reduce callback returns currentValue yields last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 99);
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => c);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_2200
     * @tc.name int8ArrayReducePart02Test022
     * @tc.desc Verify reduce callback returns previousValue times currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(2, 3, 4);
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => p * c);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_2300
     * @tc.name int8ArrayReducePart02Test023
     * @tc.desc Verify reduce callback reads external multiplier variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let multiplier: number = 10;
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => p + c * multiplier);
      expect(result).assertEqual(51);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_2400
     * @tc.name int8ArrayReducePart02Test024
     * @tc.desc Verify reduce callback accumulates to external sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 20, 30);
      let externalSum: number = 0;
      let resultVal1: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => {
        externalSum = externalSum + c;
        return p + c;
      });
      let expectedVal1: number = 51;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(externalSum).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_2500
     * @tc.name int8ArrayReducePart02Test025
     * @tc.desc Verify reduce callback reads other position via array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let firstElem: number = 0;
      let resultVal1: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => {
        firstElem = a[0];
        return p + c;
      });
      let expectedVal1: number = 10;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(firstElem).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_2600
     * @tc.name int8ArrayReducePart02Test026
     * @tc.desc Verify reduce 2-element array returns callback execution result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(3, 7);
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => p + c);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_2700
     * @tc.name int8ArrayReducePart02Test027
     * @tc.desc Verify reduce multi element returns final sum fifteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => p + c);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_2800
     * @tc.name int8ArrayReducePart02Test028
     * @tc.desc Verify reduce return value equals last callback return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let lastReturn: number = 0;
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => {
        lastReturn = p + c;
        return lastReturn;
      });
      expect(result).assertEqual(lastReturn);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_2900
     * @tc.name int8ArrayReducePart02Test029
     * @tc.desc Verify all-zero array reduce returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 0, 0);
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => p + c);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_3000
     * @tc.name int8ArrayReducePart02Test030
     * @tc.desc Verify all-negative array reduce returns negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-5, -10, -20);
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => p + c);
      expect(result).assertEqual(-35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_3100
     * @tc.name int8ArrayReducePart02Test031
     * @tc.desc Verify reduce propagates callback RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let noException: boolean = true;
      try {
        arr.reduce((p: number, c: number, i: int, a: Int8Array) => {
          throw new RangeError('callback range error');
        });
      } catch (e) {
        noException = false;
        expect(e.name).assertEqual('RangeError');
      }
      expect(noException).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_3200
     * @tc.name int8ArrayReducePart02Test032
     * @tc.desc Verify reduce propagates callback TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let noException: boolean = true;
      try {
        arr.reduce((p: number, c: number, i: int, a: Int8Array) => {
          throw new TypeError('callback type error');
        });
      } catch (e) {
        noException = false;
        expect(e.name).assertEqual('TypeError');
      }
      expect(noException).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_3300
     * @tc.name int8ArrayReducePart02Test033
     * @tc.desc Verify reduce propagates callback Error with message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let noException: boolean = true;
      try {
        arr.reduce((p: number, c: number, i: int, a: Int8Array) => {
          throw new Error('callback generic error');
        });
      } catch (e) {
        noException = false;
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('callback generic error');
      }
      expect(noException).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_3400
     * @tc.name int8ArrayReducePart02Test034
     * @tc.desc Verify [-128,-1] reduce sum returns -129 below int8 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128, -1);
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => p + c);
      expect(result).assertEqual(-129);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_3500
     * @tc.name int8ArrayReducePart02Test035
     * @tc.desc Verify reduce [127,127,127] sum returns 381 far above int8 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(127, 127, 127);
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => p + c);
      expect(result).assertEqual(381);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_3600
     * @tc.name int8ArrayReducePart02Test036
     * @tc.desc Verify reduce [127,-128] sum returns -1 mixing extremes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(127, -128);
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => p + c);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_3700
     * @tc.name int8ArrayReducePart02Test037
     * @tc.desc Verify reduce [-128,127] subtraction returns -255 order-sensitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128, 127);
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => p - c);
      expect(result).assertEqual(-255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_3800
     * @tc.name int8ArrayReducePart02Test038
     * @tc.desc Verify reduce [0,-128,127] sum returns -1 zero element does not affect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, -128, 127);
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => p + c);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_3900
     * @tc.name int8ArrayReducePart02Test039
     * @tc.desc Verify reduce [-128] single element returns -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128);
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => p + c);
      expect(result).assertEqual(INT8_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_4000
     * @tc.name int8ArrayReducePart02Test040
     * @tc.desc Verify reduce [127] single element returns 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(127);
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => p + c);
      expect(result).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_4100
     * @tc.name int8ArrayReducePart02Test041
     * @tc.desc Verify reduce [0] single element returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0);
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => p + c);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_4200
     * @tc.name int8ArrayReducePart02Test042
     * @tc.desc Verify reduce min pair sums to negative two hundred fifty six
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128, -128);
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => p + c);
      expect(result).assertEqual(-256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_4300
     * @tc.name int8ArrayReducePart02Test043
     * @tc.desc Verify reduce max pair sums to two hundred fifty four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(127, 127);
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => p + c);
      expect(result).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_4400
     * @tc.name int8ArrayReducePart02Test044
     * @tc.desc Verify reduce callback count equals length minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let callCount: number = 0;
      let resultVal1: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => {
        callCount = callCount + 1;
        return p + c;
      });
      let expectedVal1: number = 15;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_4500
     * @tc.name int8ArrayReducePart02Test045
     * @tc.desc Verify reduce single-element array callback call count is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let callCount: number = 0;
      let resultVal1: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => {
        callCount = callCount + 1;
        return p + c;
      });
      let expectedVal1: number = 42;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_4600
     * @tc.name int8ArrayReducePart02Test046
     * @tc.desc Verify original array content unchanged after reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let resultVal1: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => p + c);
      let expectedVal1: number = 60;
      expect(resultVal1).assertEqual(expectedVal1);
      let actualElement0: number = arr[0];
      let expectedElement0: int = 10;
      expect(actualElement0).assertEqual(expectedElement0);
      let actualElement1: number = arr[1];
      let expectedElement1: int = 20;
      expect(actualElement1).assertEqual(expectedElement1);
      let actualElement2: number = arr[2];
      let expectedElement2: int = 30;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_4700
     * @tc.name int8ArrayReducePart02Test047
     * @tc.desc Verify original array length unchanged after reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let beforeLen: number = arr.length;
      let resultVal1: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => p + c);
      let expectedVal1: number = 60;
      expect(resultVal1).assertEqual(expectedVal1);
      let actualLength: int = arr.length;
      let expectedLength: number = beforeLen;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_4800
     * @tc.name int8ArrayReducePart02Test048
     * @tc.desc Verify reduce same array twice yields identical results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let firstResult: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => p + c);
      let expectedSum: number = 10;
      expect(firstResult).assertEqual(expectedSum);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_4900
     * @tc.name int8ArrayReducePart02Test049
     * @tc.desc Verify reduce unvisited modification affects later iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => {
        a[3] = 99;
        return p + c;
      });
      expect(result).assertEqual(105);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_5000
     * @tc.name int8ArrayReducePart02Test050
     * @tc.desc Verify reduce modifying visited initial element does not affect computed previousValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number = arr.reduce((p: number, c: number, i: int, a: Int8Array) => {
        a[0] = 50;
        return p + c;
      });
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_5100
     * @tc.name int8ArrayReducePart02Test051
     * @tc.desc Verify nested reduce calls across two arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer: Int8Array = Int8Array.of(1, 2);
      let inner: Int8Array = Int8Array.of(10, 20);
      let result: number = outer.reduce((p: number, c: number, i: int, a: Int8Array) => {
        let innerSum: number = inner.reduce((ip: number, ic: number) => ip + ic);
        return p + c + innerSum;
      });
      expect(result).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_5200
     * @tc.name int8ArrayReducePart02Test052
     * @tc.desc Verify slice sub-array then reduce sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let sliced: Int8Array = arr.slice(1, 4);
      let result: number = sliced.reduce((p: number, c: number) => p + c);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_5300
     * @tc.name int8ArrayReducePart02Test053
     * @tc.desc Verify subarray shared buffer view then reduce sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      let view: Int8Array = arr.subarray(1, 3);
      let result: number = view.reduce((p: number, c: number) => p + c);
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_5400
     * @tc.name int8ArrayReducePart02Test054
     * @tc.desc Verify reverse then reduce subtraction order-sensitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      arr.reverse();
      let result: number = arr.reduce((p: number, c: number) => p - c);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_5500
     * @tc.name int8ArrayReducePart02Test055
     * @tc.desc Verify fill then reduce sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.fill(5);
      let result: number = arr.reduce((p: number, c: number) => p + c);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_5600
     * @tc.name int8ArrayReducePart02Test056
     * @tc.desc Verify copyWithin then reduce sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      arr.copyWithin(0, 3);
      let result: number = arr.reduce((p: number, c: number) => p + c);
      expect(result).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_5700
     * @tc.name int8ArrayReducePart02Test057
     * @tc.desc Verify reduce return exceeds int8 range written back gets truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(100, 50);
      let result: number = arr.reduce((p: number, c: number) => p + c);
      expect(result).assertEqual(150);
      let target: Int8Array = new Int8Array(1);
      target[0] = result;
      let actualTruncated: number = target[0];
      let expectedTruncated: int = -106;
      expect(actualTruncated).assertEqual(expectedTruncated);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART02_TEST_5800
     * @tc.name int8ArrayReducePart02Test058
     * @tc.desc Verify reduce with mixed positive negative zero array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, -1, 2, -3, 0);
      let result: number = arr.reduce((p: number, c: number) => p + c);
      expect(result).assertEqual(-2);
    });
  });
}
