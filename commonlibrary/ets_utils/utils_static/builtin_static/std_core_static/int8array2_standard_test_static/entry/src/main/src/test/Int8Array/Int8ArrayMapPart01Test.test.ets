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
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

export default function int8ArrayMapPart01Test(): void {
  describe('Int8ArrayMapPart01Test', (): void => {
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
    const INT8_ZERO = 0;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_0100
     * @tc.name int8ArrayMapPart01Test001
     * @tc.desc Verify map(fn) 1 arity val + 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2, 3);
      const result = arr.map((v: number, i: int, a: Int8Array) => v + 1);
      let firstMappedValue: int = result.length;
      let firstExpectedValue: int = 3;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(0);
      let secondExpectedValue: int = 2;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
      let thirdMappedValue: number = result.$_get(1);
      let thirdExpectedValue: int = 3;
      expect(thirdMappedValue).assertEqual(thirdExpectedValue);
      let fourthMappedValue: number = result.$_get(2);
      let fourthExpectedValue: int = 4;
      expect(fourthMappedValue).assertEqual(fourthExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_0200
     * @tc.name int8ArrayMapPart01Test002
     * @tc.desc Verify map(declaredFn) doubles both elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleVal = (v: number, i: int, a: Int8Array) => {
        return v * 2;
      };
      const arr = Int8Array.of(10, 20);
      const result = arr.map(doubleVal);
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = 20;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(1);
      let secondExpectedValue: int = 40;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_0300
     * @tc.name int8ArrayMapPart01Test003
     * @tc.desc Verify map(fn) triples all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(5, 10, 15);
      const fn: (v: number, i: int, a: Int8Array) => number = (v: number, i: int, a: Int8Array) => v * 3;
      const result = arr.map(fn);
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = 15;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(1);
      let secondExpectedValue: int = 30;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
      let thirdMappedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 45;
      expect(thirdMappedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_0400
     * @tc.name int8ArrayMapPart01Test004
     * @tc.desc Verify map fn val * 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(3, 1, 2);
      const result = arr.map((v: number, i: int, a: Int8Array) => v * 2);
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = 6;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(1);
      let secondExpectedValue: int = 2;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
      let thirdMappedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 4;
      expect(thirdMappedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_0500
     * @tc.name int8ArrayMapPart01Test005
     * @tc.desc Verify map fn 3 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(3, 1, 2);
      const result = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        return 50;
      });
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = 50;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(1);
      let secondExpectedValue: int = 50;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
      let thirdMappedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 50;
      expect(thirdMappedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_0600
     * @tc.name int8ArrayMapPart01Test006
     * @tc.desc Verify map fn val index array val identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(7, 14, 21);
      const result = arr.map((v: number, i: int, a: Int8Array) => v);
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = 7;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(1);
      let secondExpectedValue: int = 14;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
      let thirdMappedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 21;
      expect(thirdMappedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_0700
     * @tc.name int8ArrayMapPart01Test007
     * @tc.desc Verify map fn index index index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(0, 0, 0);
      const result = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        return i;
      });
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = 0;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(1);
      let secondExpectedValue: int = 1;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
      let thirdMappedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 2;
      expect(thirdMappedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_0800
     * @tc.name int8ArrayMapPart01Test008
     * @tc.desc Verify map callback returning array length maps each element to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      const result = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        return a.length;
      });
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = 3;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(1);
      let secondExpectedValue: int = 3;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
      let thirdMappedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 3;
      expect(thirdMappedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_0900
     * @tc.name int8ArrayMapPart01Test009
     * @tc.desc Verify map callback combining value index and length maps to 13 24 35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      const result = arr.map((v: number, i: int, a: Int8Array) => v + i + a.length);
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = 13;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(1);
      let secondExpectedValue: int = 24;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
      let thirdMappedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 35;
      expect(thirdMappedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_1000
     * @tc.name int8ArrayMapPart01Test010
     * @tc.desc Verify map fn adds 10 to each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(5, 15, 25);
      const result = arr.map((v: number, i: int, a: Int8Array) => {
        return v + 10;
      });
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = 15;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(1);
      let secondExpectedValue: int = 25;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
      let thirdMappedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 35;
      expect(thirdMappedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_1100
     * @tc.name int8ArrayMapPart01Test011
     * @tc.desc Verify map fn applies helper square function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const helperSquare = (n: number) => {
        return n * n;
      };
      const arr = Int8Array.of(2, 5, 10);
      const result = arr.map((v: number, i: int, a: Int8Array) => helperSquare(v));
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = 4;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(1);
      let secondExpectedValue: int = 25;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
      let thirdMappedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 100;
      expect(thirdMappedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_1200
     * @tc.name int8ArrayMapPart01Test012
     * @tc.desc Verify map fn val === -128 int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(-128, 0, 127);
      let receivedVal: number = 0;
      let resultVal1: Int8Array = arr.map((v: number, i: int, a: Int8Array) => {
        if (i === 0) {
          receivedVal = v;
        }
        return 0;
      });
      let expectedVal1: Int8Array = new Int8Array([0, 0, 0]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      expect(receivedVal).assertEqual(INT8_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_1300
     * @tc.name int8ArrayMapPart01Test013
     * @tc.desc Verify map fn val === 127 int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(0, 127, 0);
      let receivedVal: number = 0;
      let resultVal1: Int8Array = arr.map((v: number, i: int, a: Int8Array) => {
        if (i === 1) {
          receivedVal = v;
        }
        return 0;
      });
      let expectedVal1: Int8Array = new Int8Array([0, 0, 0]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      expect(receivedVal).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_1400
     * @tc.name int8ArrayMapPart01Test014
     * @tc.desc Verify map fn val === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(0, 1, 2);
      let receivedVal: number = -1;
      let resultVal1: Int8Array = arr.map((v: number, i: int, a: Int8Array) => {
        if (i === 0) {
          receivedVal = v;
        }
        return 0;
      });
      let expectedVal1: Int8Array = new Int8Array([0, 0, 0]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      expect(receivedVal).assertEqual(INT8_ZERO);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_1500
     * @tc.name int8ArrayMapPart01Test015
     * @tc.desc Verify map fn val === -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, -1, 1);
      let receivedVal: number = 0;
      let resultVal1: Int8Array = arr.map((v: number, i: int, a: Int8Array) => {
        if (i === 1) {
          receivedVal = v;
        }
        return 0;
      });
      let expectedVal1: Int8Array = new Int8Array([0, 0, 0]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      expect(receivedVal).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_1600
     * @tc.name int8ArrayMapPart01Test016
     * @tc.desc Verify map fn index === 0 callCount index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      let firstIndex: int = -1;
      let callCount: int = 0;
      let resultVal1: Int8Array = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        if (callCount === 0) {
          firstIndex = i;
        }
        callCount++;
        return 0;
      });
      let expectedVal1: Int8Array = new Int8Array([0, 0, 0]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      expect(firstIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_1700
     * @tc.name int8ArrayMapPart01Test017
     * @tc.desc Verify map invokes callback with index 2 on last element visit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      let lastIndex: int = -1;
      let callCount: int = 0;
      let resultVal1: Int8Array = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        if (callCount === 2) {
          lastIndex = i;
        }
        callCount++;
        return 0;
      });
      let expectedVal1: Int8Array = new Int8Array([0, 0, 0]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      expect(lastIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_1800
     * @tc.name int8ArrayMapPart01Test018
     * @tc.desc Verify map fn index === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(42);
      let receivedIndex: int = -1;
      let resultVal1: Int8Array = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        receivedIndex = i;
        return 0;
      });
      let expectedVal1: Int8Array = new Int8Array([0]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      expect(receivedIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_1900
     * @tc.name int8ArrayMapPart01Test019
     * @tc.desc Verify map fn index [0, 1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      let indices: int[] = [];
      let resultVal1: Int8Array = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        indices.push(i);
        return 0;
      });
      let expectedVal1: Int8Array = new Int8Array([0, 0, 0]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      let firstMappedValue: int = indices.length;
      let firstExpectedValue: int = 3;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = indices[0];
      let secondExpectedValue: int = 0;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
      let thirdMappedValue: number = indices[1];
      let thirdExpectedValue: int = 1;
      expect(thirdMappedValue).assertEqual(thirdExpectedValue);
      let fourthMappedValue: number = indices[2];
      let fourthExpectedValue: int = 2;
      expect(fourthMappedValue).assertEqual(fourthExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_2000
     * @tc.name int8ArrayMapPart01Test020
     * @tc.desc Verify fn a[0] map arr[0] a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2, 3);
      let resultVal1: Int8Array = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        if (i === 0) {
          a.$_set(0, 99);
        }
        return 0;
      });
      let expectedVal1: Int8Array = new Int8Array([0, 0, 0]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      let firstMappedValue: number = arr.$_get(0);
      let firstExpectedValue: int = 99;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_2100
     * @tc.name int8ArrayMapPart01Test021
     * @tc.desc Verify map callback exposes array length 3 for first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2, 3);
      let capturedLength: int = 0;
      let resultVal1: Int8Array = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        if (i === 0) {
          capturedLength = a.length;
        }
        return 0;
      });
      let expectedVal1: Int8Array = new Int8Array([0, 0, 0]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      expect(capturedLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_2200
     * @tc.name int8ArrayMapPart01Test022
     * @tc.desc Verify map fn a.$_get(i) val array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      let matchCount: int = 0;
      let resultVal1: Int8Array = arr.map((v: number, i: int, a: Int8Array) => {
        let elem: number = a.$_get(i);
        if (elem === v) {
          matchCount++;
        }
        return 0;
      });
      let expectedVal1: Int8Array = new Int8Array([0, 0, 0]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      expect(matchCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_2300
     * @tc.name int8ArrayMapPart01Test023
     * @tc.desc Verify map callback exposes byteLength 3 for first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2, 3);
      let capturedByteLength: number = 0;
      let resultVal1: Int8Array = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        if (i === 0) {
          capturedByteLength = a.byteLength;
        }
        return 0;
      });
      let expectedVal1: Int8Array = new Int8Array([0, 0, 0]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      expect(capturedByteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_2400
     * @tc.name int8ArrayMapPart01Test024
     * @tc.desc Verify map callback exposes byteOffset 0 for first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2, 3);
      let capturedByteOffset: number = -1;
      let resultVal1: Int8Array = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        if (i === 0) {
          capturedByteOffset = a.byteOffset;
        }
        return 0;
      });
      let expectedVal1: Int8Array = new Int8Array([0, 0, 0]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      expect(capturedByteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_2500
     * @tc.name int8ArrayMapPart01Test025
     * @tc.desc Verify map callback calling indexOf maps to first occurrence indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30, 20);
      const result = arr.map((v: number, i: int, a: Int8Array) => a.indexOf(v));
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = 0;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(1);
      let secondExpectedValue: int = 1;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
      let thirdMappedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 2;
      expect(thirdMappedValue).assertEqual(thirdExpectedValue);
      let fourthMappedValue: number = result.$_get(3);
      let fourthExpectedValue: int = 1;
      expect(fourthMappedValue).assertEqual(fourthExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_2600
     * @tc.name int8ArrayMapPart01Test026
     * @tc.desc Verify map callback using subarray length maps each element to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      const result = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        let sub: Int8Array = a.subarray(0);
        return sub.length;
      });
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = 3;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(1);
      let secondExpectedValue: int = 3;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
      let thirdMappedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 3;
      expect(thirdMappedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_2700
     * @tc.name int8ArrayMapPart01Test027
     * @tc.desc Verify map callback sees bytes per element ratio equal 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2, 3, 4);
      let bytesPerElem: number = 0;
      let resultVal1: Int8Array = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        if (i === 0) {
          bytesPerElem = a.byteLength / a.length;
        }
        return 0;
      });
      let expectedVal1: Int8Array = new Int8Array([0, 0, 0, 0]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      expect(bytesPerElem).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_2800
     * @tc.name int8ArrayMapPart01Test028
     * @tc.desc Verify map fn a.$_get(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      let capturedLast: number = 0;
      let resultVal1: Int8Array = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        if (i === 0) {
          let elem: number = a.$_get(2);
          capturedLast = elem;
        }
        return 0;
      });
      let expectedVal1: Int8Array = new Int8Array([0, 0, 0]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      expect(capturedLast).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_2900
     * @tc.name int8ArrayMapPart01Test029
     * @tc.desc Verify map callback using includes confirms every element present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      let allFound: boolean = true;
      let resultVal1: Int8Array = arr.map((v: number, i: int, a: Int8Array) => {
        if (!a.includes(v)) {
          allFound = false;
        }
        return 0;
      });
      let expectedVal1: Int8Array = new Int8Array([0, 0, 0]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      expect(allFound).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_3000
     * @tc.name int8ArrayMapPart01Test030
     * @tc.desc Verify map fn 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1);
      const result = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        return 0;
      });
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = 0;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_3100
     * @tc.name int8ArrayMapPart01Test031
     * @tc.desc Verify map fn 127 127 int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1);
      const result = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        return 127;
      });
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: number = INT8_MAX;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_3200
     * @tc.name int8ArrayMapPart01Test032
     * @tc.desc Verify map fn -128 -128 int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1);
      const result = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        return -128;
      });
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: number = INT8_MIN;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_3300
     * @tc.name int8ArrayMapPart01Test033
     * @tc.desc Verify map fn 129 -127 129 - 256 = -127 128 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1);
      const result = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        return 129;
      });
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = -127;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_3400
     * @tc.name int8ArrayMapPart01Test034
     * @tc.desc Verify map fn -0.0 0 0 int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1);
      const result = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        return -0.0;
      });
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = 0;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_3500
     * @tc.name int8ArrayMapPart01Test035
     * @tc.desc Verify map fn 127.5 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1);
      const result = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        return 127.5;
      });
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: number = INT8_MAX;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_3600
     * @tc.name int8ArrayMapPart01Test036
     * @tc.desc Verify map fn -128.5 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1);
      const result = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        return -128.5;
      });
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: number = INT8_MIN;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_3700
     * @tc.name int8ArrayMapPart01Test037
     * @tc.desc Verify map fn -100 -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1);
      const result = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        return -100;
      });
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = -100;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_3800
     * @tc.name int8ArrayMapPart01Test038
     * @tc.desc Verify map fn val + 127 val=1 128 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1);
      const result = arr.map((v: number, i: int, a: Int8Array) => v + 127);
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: number = INT8_MIN;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_3900
     * @tc.name int8ArrayMapPart01Test039
     * @tc.desc Verify map fn val - 129 val=0 -129 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(0);
      const result = arr.map((v: number, i: int, a: Int8Array) => v - 129);
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: number = INT8_MAX;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_4000
     * @tc.name int8ArrayMapPart01Test040
     * @tc.desc Verify map fn index 0 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2, 3);
      const result = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        if (i % 2 === 0) {
          return 0;
        }
        return 127;
      });
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = 0;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(1);
      let secondExpectedValue: number = INT8_MAX;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
      let thirdMappedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 0;
      expect(thirdMappedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_4100
     * @tc.name int8ArrayMapPart01Test041
     * @tc.desc Verify map fn -val [-1, 1, -128] [1, -1, 128 -128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(-1, 1, -128);
      const result = arr.map((v: number, i: int, a: Int8Array) => -v);
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = 1;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(1);
      let secondExpectedValue: int = -1;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
      let thirdMappedValue: number = result.$_get(2);
      let thirdExpectedValue: number = INT8_MIN;
      expect(thirdMappedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_4200
     * @tc.name int8ArrayMapPart01Test042
     * @tc.desc Verify map fn val * index val index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 10, 10);
      const result = arr.map((v: number, i: int, a: Int8Array) => v * i);
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = 0;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(1);
      let secondExpectedValue: int = 10;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
      let thirdMappedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 20;
      expect(thirdMappedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_4300
     * @tc.name int8ArrayMapPart01Test043
     * @tc.desc Verify map fn array a.$_get(2 - i)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      const result = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        let reverseIdx: int = 2 - i;
        let elem: number = a.$_get(reverseIdx);
        return elem;
      });
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = 30;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(1);
      let secondExpectedValue: int = 20;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
      let thirdMappedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 10;
      expect(thirdMappedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_4400
     * @tc.name int8ArrayMapPart01Test044
     * @tc.desc Verify map fn Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2, 3);
      try {
        arr.map((v: number, i: int, a: Int8Array) => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return 0;
          }
          throw new Error('map error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_4500
     * @tc.name int8ArrayMapPart01Test045
     * @tc.desc Verify map propagates RangeError thrown by callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2, 3);
      try {
        arr.map((v: number, i: int, a: Int8Array) => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return 0;
          }
          throw new RangeError('range');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_4600
     * @tc.name int8ArrayMapPart01Test046
     * @tc.desc Verify map propagates TypeError thrown by callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2, 3);
      try {
        arr.map((v: number, i: int, a: Int8Array) => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return 0;
          }
          throw new TypeError('type');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_4700
     * @tc.name int8ArrayMapPart01Test047
     * @tc.desc Verify map callback not invoked on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(0);
      let callCount: int = 0;
      let resultVal1: Int8Array = arr.map((v: number, i: int, a: Int8Array) => {
        callCount++;
        return v;
      });
      let expectedVal1: Int8Array = new Int8Array([]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_4800
     * @tc.name int8ArrayMapPart01Test048
     * @tc.desc Verify map 0 Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(0);
      const result = arr.map((v: number, i: int, a: Int8Array) => v + 1);
      let firstMappedValue: int = result.length;
      let firstExpectedValue: int = 0;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_4900
     * @tc.name int8ArrayMapPart01Test049
     * @tc.desc Verify map 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(42);
      let callCount: int = 0;
      const result = arr.map((v: number, i: int, a: Int8Array) => {
        callCount++;
        return v + 1;
      });
      expect(callCount).assertEqual(1);
      let firstMappedValue: int = result.length;
      let firstExpectedValue: int = 1;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(0);
      let secondExpectedValue: int = 43;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_5000
     * @tc.name int8ArrayMapPart01Test050
     * @tc.desc Verify map callback adding offset maps values to 11 12 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2, 3);
      let offset: number = 10;
      const result = arr.map((v: number, i: int, a: Int8Array) => v + offset);
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = 11;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(1);
      let secondExpectedValue: int = 12;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
      let thirdMappedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 13;
      expect(thirdMappedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_5100
     * @tc.name int8ArrayMapPart01Test051
     * @tc.desc Verify fn map ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2, 3, 4, 5);
      let externalCounter: int = 0;
      let resultVal1: Int8Array = arr.map((v: number, i: int, a: Int8Array) => {
        externalCounter++;
        return v;
      });
      let expectedVal1: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      expect(externalCounter).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_5200
     * @tc.name int8ArrayMapPart01Test052
     * @tc.desc Verify map fn reads values from lookup Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(0, 1, 2);
      const lookup = Int8Array.of(100, 110, 120);
      const result = arr.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        let val: number = lookup.$_get(i);
        return val;
      });
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = 100;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(1);
      let secondExpectedValue: int = 110;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
      let thirdMappedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 120;
      expect(thirdMappedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_5300
     * @tc.name int8ArrayMapPart01Test053
     * @tc.desc Verify fn a[i] map fn val
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2, 3);
      const result = arr.map((v: number, i: int, a: Int8Array) => {
        a.$_set(i, 99);
        return v;
      });
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = 1;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(1);
      let secondExpectedValue: int = 2;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
      let thirdMappedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 3;
      expect(thirdMappedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_5400
     * @tc.name int8ArrayMapPart01Test054
     * @tc.desc Verify fn a[i+1] map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2, 3);
      const result = arr.map((v: number, i: int, a: Int8Array) => {
        if (i < 2) {
          a.$_set(i + 1, 99);
        }
        return v;
      });
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = 1;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(1);
      let secondExpectedValue: int = 99;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
      let thirdMappedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 99;
      expect(thirdMappedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_5500
     * @tc.name int8ArrayMapPart01Test055
     * @tc.desc Verify map fn val - 1 [-128, 127] [-129 127, 126]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(-128, 127);
      const result = arr.map((v: number, i: int, a: Int8Array) => v - 1);
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: number = INT8_MAX;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(1);
      let secondExpectedValue: int = 126;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_5600
     * @tc.name int8ArrayMapPart01Test056
     * @tc.desc Verify map fn 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, 1);
      }
      const result = arr.map((v: number, i: int, a: Int8Array) => v + 1);
      let firstMappedValue: int = result.length;
      let firstExpectedValue: int = 100;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(0);
      let secondExpectedValue: int = 2;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
      let thirdMappedValue: number = result.$_get(99);
      let thirdExpectedValue: int = 2;
      expect(thirdMappedValue).assertEqual(thirdExpectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART01_TEST_5700
     * @tc.name int8ArrayMapPart01Test057
     * @tc.desc Verify map fn Number.NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2, 3);
      const result = arr.map((v: number, i: int, a: Int8Array) => {
        if (i === 1) {
          return Number.NaN;
        }
        return v;
      });
      let firstMappedValue: number = result.$_get(0);
      let firstExpectedValue: int = 1;
      expect(firstMappedValue).assertEqual(firstExpectedValue);
      let secondMappedValue: number = result.$_get(1);
      let secondExpectedValue: int = 0;
      expect(secondMappedValue).assertEqual(secondExpectedValue);
      let thirdMappedValue: number = result.$_get(2);
      let thirdExpectedValue: int = 3;
      expect(thirdMappedValue).assertEqual(thirdExpectedValue);
    });
  });
}
