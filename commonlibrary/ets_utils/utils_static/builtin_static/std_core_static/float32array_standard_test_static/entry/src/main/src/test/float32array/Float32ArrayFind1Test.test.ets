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

export default function Float32ArrayFind1Test(): void {
  describe('Float32ArrayFind1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_0100
     * @tc.name testFloat32ArrayFindONE001
     * @tc.desc Verify predicate declares and uses all 3 parameters (value/index/array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let capturedValue: number = 0;
      let capturedIndex: number = 0;
      let capturedLen: number = 0;
      arr.find((value, index, array) => {
        capturedValue = value;
        capturedIndex = index;
        capturedLen = array.length;
        return value === 0b1010;
      });
      expect(capturedValue).assertEqual(10);
      expect(capturedIndex).assertEqual(1);
      expect(capturedLen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_0200
     * @tc.name testFloat32ArrayFindONE002
     * @tc.desc Verify predicate declares only 1 parameter (value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 10.0, 15.0]);
      let captured: number = 0;
      arr.find((value) => {
        captured = value;
        return value > 8.0;
      });
      expect(captured).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_0300
     * @tc.name testFloat32ArrayFindONE003
     * @tc.desc Verify predicate declares only 2 parameters (value/index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let capturedIndex: number = 0;
      arr.find((value, index) => {
        capturedIndex = index;
        return index === 2;
      });
      expect(capturedIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_0400
     * @tc.name testFloat32ArrayFindONE004
     * @tc.desc Verify predicate declares 3 parameters but only uses value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 6.0, 9.0]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return value === 6.0;
      });
      expect(captured).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_0500
     * @tc.name testFloat32ArrayFindONE005
     * @tc.desc Verify predicate declares 3 parameters but only uses index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      let capturedIndex: number = 0;
      arr.find((value, index, array) => {
        capturedIndex = index;
        return index >= 2;
      });
      expect(capturedIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_0600
     * @tc.name testFloat32ArrayFindONE006
     * @tc.desc Verify predicate declares 3 parameters but only uses array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      let capturedLen: number = 0;
      arr.find((value, index, array) => {
        capturedLen = array.length;
        return index === array.length - 1;
      });
      expect(capturedLen).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_0700
     * @tc.name testFloat32ArrayFindONE007
     * @tc.desc Verify predicate declares 0 parameters relying on closure external state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let calls: number = 0;
      arr.find(() => {
        calls = calls + 1;
        return calls === 2;
      });
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_0800
     * @tc.name testFloat32ArrayFindONE008
     * @tc.desc Verify arrow function expression body as predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 5.0, 9.0]);
      const result = arr.find((value, index, array) => value > 4.0);
      expect(result).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_0900
     * @tc.name testFloat32ArrayFindONE009
     * @tc.desc Verify function expression block body as predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 5.0, 9.0]);
      const fn = (value: number, index: int, array: Float32Array): boolean => {
        return value > 4.0;
      };
      const result = arr.find(fn);
      expect(result).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_1000
     * @tc.name testFloat32ArrayFindONE010
     * @tc.desc Verify predicate closure captures external const threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 5.0, 9.0]);
      const threshold: number = 4.0;
      const result = arr.find((value, index, array) => value > threshold);
      expect(result).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_1100
     * @tc.name testFloat32ArrayFindONE011
     * @tc.desc Verify same predicate variable reused across multiple arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Float32Array([1.0, 5.0, 9.0]);
      const arr2 = new Float32Array([2.0, 4.0, 6.0]);
      const gt3 = (value: number, index: int, array: Float32Array): boolean => value > 3.0;
      const r1 = arr1.find(gt3);
      const r2 = arr2.find(gt3);
      expect(r1).assertEqual(5.0);
      expect(r2).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_1200
     * @tc.name testFloat32ArrayFindONE012
     * @tc.desc Verify higher-order factory function generates predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 5.0, 9.0]);
      const makePred = (target: number) => {
        return (value: number, index: int, array: Float32Array): boolean => value === target;
      };
      const result = arr.find(makePred(5.0));
      expect(result).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_1300
     * @tc.name testFloat32ArrayFindONE013
     * @tc.desc Verify predicate block body contains multiple statements and if branch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 5.0, 9.0]);
      let checked: number = 0;
      const result = arr.find((value, index, array) => {
        checked = checked + 1;
        if (value > 4.0) {
          return true;
        }
        return false;
      });
      expect(result).assertEqual(5.0);
      expect(checked).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_1400
     * @tc.name testFloat32ArrayFindONE014
     * @tc.desc Verify predicate internally calls helper function to compose condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2.0, 5.0, 8.0]);
      const isEven = (n: number): boolean => n % 2 === 0;
      const result = arr.find((value, index, array) => isEven(value) && value > 2.0);
      expect(result).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_1500
     * @tc.name testFloat32ArrayFindONE015
     * @tc.desc Verify value receives Float32.MAX(3.4028234663852886e+38)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_1600
     * @tc.name testFloat32ArrayFindONE016
     * @tc.desc Verify value receives Float32.MIN_NORMAL(1.1754943508222875e-38)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.1754943508222875e-38]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_1700
     * @tc.name testFloat32ArrayFindONE017
     * @tc.desc Verify value receives Float32.MIN_VALUE(1.401298464324817e-45)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.401298464324817e-45]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_1800
     * @tc.name testFloat32ArrayFindONE018
     * @tc.desc Verify value receives NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_1900
     * @tc.name testFloat32ArrayFindONE019
     * @tc.desc Verify value receives +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.POSITIVE_INFINITY]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_2000
     * @tc.name testFloat32ArrayFindONE020
     * @tc.desc Verify value receives -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.NEGATIVE_INFINITY]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_2100
     * @tc.name testFloat32ArrayFindONE021
     * @tc.desc Verify value receives +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      let captured: number = 1;
      let calls: number = 0;
      arr.find((value, index, array) => {
        calls = calls + 1;
        captured = value;
        return true;
      });
      expect(calls).assertEqual(1);
      expect(captured).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_2200
     * @tc.name testFloat32ArrayFindONE022
     * @tc.desc Verify value receives -0 (distinguish negative zero via reciprocal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.0]);
      let captured: number = 1;
      let calls: number = 0;
      arr.find((value, index, array) => {
        calls = calls + 1;
        captured = value;
        return true;
      });
      expect(calls).assertEqual(1);
      expect(1.0 / captured).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_2300
     * @tc.name testFloat32ArrayFindONE023
     * @tc.desc Verify value receives minimum finite negative value (-3.4028234663852886e+38)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-3.4028234663852886e+38]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_2400
     * @tc.name testFloat32ArrayFindONE024
     * @tc.desc Verify value receives 0.1 (float32 precision truncation value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.1]);
      const refArr = new Float32Array([0.1]);
      const expected: number = refArr.$_get(0);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_2500
     * @tc.name testFloat32ArrayFindONE025
     * @tc.desc Verify value receives 0.2 (float32 precision truncation value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.2]);
      const refArr = new Float32Array([0.2]);
      const expected: number = refArr.$_get(0);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_2600
     * @tc.name testFloat32ArrayFindONE026
     * @tc.desc Verify value receives 0.3 (float32 precision truncation value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.3]);
      const refArr = new Float32Array([0.3]);
      const expected: number = refArr.$_get(0);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_2700
     * @tc.name testFloat32ArrayFindONE027
     * @tc.desc Verify value receives 1.1 (float32 precision truncation value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.1]);
      const refArr = new Float32Array([1.1]);
      const expected: number = refArr.$_get(0);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_2800
     * @tc.name testFloat32ArrayFindONE028
     * @tc.desc Verify value receives 1.0000001 (float32 precision truncation value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0000001]);
      const refArr = new Float32Array([1.0000001]);
      const expected: number = refArr.$_get(0);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_2900
     * @tc.name testFloat32ArrayFindONE029
     * @tc.desc Verify value receives 16777216 (2^24 maximum exact integer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777216]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_3000
     * @tc.name testFloat32ArrayFindONE030
     * @tc.desc Verify value receives 16777217 truncated to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777217]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_3100
     * @tc.name testFloat32ArrayFindONE031
     * @tc.desc Verify value receives 1.0e40 overflowing to +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e40]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_3200
     * @tc.name testFloat32ArrayFindONE032
     * @tc.desc Verify value receives -1.0e40 underflowing to -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0e40]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_3300
     * @tc.name testFloat32ArrayFindONE033
     * @tc.desc Verify value receives 1.0e-46 underflowing to +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e-46]);
      let captured: number = 1;
      let calls: number = 0;
      arr.find((value, index, array) => {
        calls = calls + 1;
        captured = value;
        return true;
      });
      expect(calls).assertEqual(1);
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_3400
     * @tc.name testFloat32ArrayFindONE034
     * @tc.desc Verify value receives integer -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_3500
     * @tc.name testFloat32ArrayFindONE035
     * @tc.desc Verify value receives int upper bound 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2147483647]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_3600
     * @tc.name testFloat32ArrayFindONE036
     * @tc.desc Verify value receives int lower bound -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-2147483648]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_3700
     * @tc.name testFloat32ArrayFindONE037
     * @tc.desc Verify value receives scientific notation 1.0e3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e3]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_3800
     * @tc.name testFloat32ArrayFindONE038
     * @tc.desc Verify value receives scientific notation 1e-3 (float32 truncation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1e-3]);
      const refArr = new Float32Array([1e-3]);
      const expected: number = refArr.$_get(0);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_3900
     * @tc.name testFloat32ArrayFindONE039
     * @tc.desc Verify value receives hexadecimal literal 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0xFF]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_4000
     * @tc.name testFloat32ArrayFindONE040
     * @tc.desc Verify value receives octal literal 0o17
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0o17]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_4100
     * @tc.name testFloat32ArrayFindONE041
     * @tc.desc Verify value receives binary literal 0b1010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0b1010]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_4200
     * @tc.name testFloat32ArrayFindONE042
     * @tc.desc Verify value receives decimal 100.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([100.0]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_4300
     * @tc.name testFloat32ArrayFindONE043
     * @tc.desc Verify value receives 0.5 (exactly representable)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.5]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_4400
     * @tc.name testFloat32ArrayFindONE044
     * @tc.desc Verify value receives -0.5 (exactly representable)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.5]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(-0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_4500
     * @tc.name testFloat32ArrayFindONE045
     * @tc.desc Verify value receives 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2.0]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_4600
     * @tc.name testFloat32ArrayFindONE046
     * @tc.desc Verify value receives -2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-2.0]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(-2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_4700
     * @tc.name testFloat32ArrayFindONE047
     * @tc.desc Verify value receives hexadecimal 0x100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0x100]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_4800
     * @tc.name testFloat32ArrayFindONE048
     * @tc.desc Verify value receives binary 0b1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0b1000]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_4900
     * @tc.name testFloat32ArrayFindONE049
     * @tc.desc Verify value receives Number.MAX_SAFE_INTEGER (float32 truncation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([9007199254740991]);
      const refArr = new Float32Array([9007199254740991]);
      const expected: number = refArr.$_get(0);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_5000
     * @tc.name testFloat32ArrayFindONE050
     * @tc.desc Verify value receives 1e21 (float32 truncation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1e21]);
      const refArr = new Float32Array([1e21]);
      const expected: number = refArr.$_get(0);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_5100
     * @tc.name testFloat32ArrayFindONE051
     * @tc.desc Verify value receives 1e-10 (float32 truncation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1e-10]);
      const refArr = new Float32Array([1e-10]);
      const expected: number = refArr.$_get(0);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_5200
     * @tc.name testFloat32ArrayFindONE052
     * @tc.desc Verify predicate selects the 2nd value of a two-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return value === 0b1010;
      });
      expect(captured).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_5300
     * @tc.name testFloat32ArrayFindONE053
     * @tc.desc Verify predicate selects the last value of a three-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return value === -1.0;
      });
      expect(captured).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_5400
     * @tc.name testFloat32ArrayFindONE054
     * @tc.desc Verify predicate receives the first two values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      let first: number = 0;
      let second: number = 0;
      arr.find((value, index, array) => {
        if (index === 0) {
          first = value;
        }
        if (index === 1) {
          second = value;
          return true;
        }
        return false;
      });
      expect(first).assertEqual(10.0);
      expect(second).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_5500
     * @tc.name testFloat32ArrayFindONE055
     * @tc.desc Verify predicate exits early and no longer accesses subsequent elements after match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 5.0, 9.0]);
      let sawThird = false;
      arr.find((value, index, array) => {
        if (index === 2) {
          sawThird = true;
        }
        return value === 5.0;
      });
      expect(sawThird).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_5600
     * @tc.name testFloat32ArrayFindONE056
     * @tc.desc Verify single-element array index receives 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0]);
      let capturedIndex: number = 0;
      arr.find((value, index, array) => {
        capturedIndex = index;
        return true;
      });
      expect(capturedIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_5700
     * @tc.name testFloat32ArrayFindONE057
     * @tc.desc Verify two-element array index is 1 when matching the 2nd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      let capturedIndex: number = 0;
      arr.find((value, index, array) => {
        capturedIndex = index;
        return index === 1;
      });
      expect(capturedIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_5800
     * @tc.name testFloat32ArrayFindONE058
     * @tc.desc Verify three-element array index is 2 when matching the last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let capturedIndex: number = 0;
      arr.find((value, index, array) => {
        capturedIndex = index;
        return index === 2;
      });
      expect(capturedIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_5900
     * @tc.name testFloat32ArrayFindONE059
     * @tc.desc Verify index increments in order (first two captures are 0 and 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      let calls: number = 0;
      let firstIndex: number = -1;
      let secondIndex: number = -1;
      arr.find((value, index, array) => {
        calls = calls + 1;
        if (index === 0) {
          firstIndex = index;
        }
        if (index === 1) {
          secondIndex = index;
          return true;
        }
        return false;
      });
      expect(calls).assertEqual(2);
      expect(firstIndex).assertEqual(0);
      expect(secondIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_6000
     * @tc.name testFloat32ArrayFindONE060
     * @tc.desc Verify index stops incrementing after match (max index is 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let maxIndex: number = 0;
      arr.find((value, index, array) => {
        maxIndex = index;
        return index === 1;
      });
      expect(maxIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_6100
     * @tc.name testFloat32ArrayFindONE061
     * @tc.desc Verify four-element array index is 3 when matching the last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let capturedIndex: number = 0;
      arr.find((value, index, array) => {
        capturedIndex = index;
        return index === 3;
      });
      expect(capturedIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_6200
     * @tc.name testFloat32ArrayFindONE062
     * @tc.desc Verify 50-element array index is 49 when matching the last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(50);
      let capturedIndex: number = 0;
      arr.find((value, index, array) => {
        capturedIndex = index;
        return index === 49;
      });
      expect(capturedIndex).assertEqual(49);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_6300
     * @tc.name testFloat32ArrayFindONE063
     * @tc.desc Verify index parity condition selects first odd index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      let capturedIndex: number = 0;
      arr.find((value, index, array) => {
        capturedIndex = index;
        return index % 2 === 1;
      });
      expect(capturedIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_6400
     * @tc.name testFloat32ArrayFindONE064
     * @tc.desc Verify index matches array[index] and selects the last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 10.0, 15.0]);
      let capturedIndex: number = 0;
      let capturedValue: number = 0;
      arr.find((value, index, array) => {
        capturedIndex = index;
        capturedValue = value;
        return array[index] === value && index === 2;
      });
      expect(capturedIndex).assertEqual(2);
      expect(capturedValue).assertEqual(15.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_6500
     * @tc.name testFloat32ArrayFindONE065
     * @tc.desc Verify index sequence sum validates incrementing (0+1+2+3=6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let indexSum: number = 0;
      arr.find((value, index, array) => {
        indexSum = indexSum + index;
        return false;
      });
      expect(indexSum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_6600
     * @tc.name testFloat32ArrayFindONE066
     * @tc.desc Verify array parameter shares the same reference as the original array (side effect visible)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.find((value, index, array) => {
        if (index === 1) {
          array.$_set(1, 99.0);
        }
        return false;
      });
      expect(arr.$_get(1)).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_6700
     * @tc.name testFloat32ArrayFindONE067
     * @tc.desc Verify array.length is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let capturedLen: number = 0;
      arr.find((value, index, array) => {
        capturedLen = array.length;
        return true;
      });
      expect(capturedLen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_6800
     * @tc.name testFloat32ArrayFindONE068
     * @tc.desc Verify array.byteLength is 12 (3*4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let capturedByteLen: number = 0;
      arr.find((value, index, array) => {
        capturedByteLen = array.byteLength;
        return true;
      });
      expect(capturedByteLen).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_6900
     * @tc.name testFloat32ArrayFindONE069
     * @tc.desc Verify array parameter is a Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      let isF32 = false;
      arr.find((value, index, array) => {
        isF32 = array instanceof Float32Array;
        return true;
      });
      expect(isF32).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_7000
     * @tc.name testFloat32ArrayFindONE070
     * @tc.desc Verify directly constructed array array.byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      let capturedOffset: number = 0;
      arr.find((value, index, array) => {
        capturedOffset = array.byteOffset;
        return true;
      });
      expect(capturedOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_7100
     * @tc.name testFloat32ArrayFindONE071
     * @tc.desc Verify single-element array array.length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([42.0]);
      let capturedLen: number = 0;
      arr.find((value, index, array) => {
        capturedLen = array.length;
        return true;
      });
      expect(capturedLen).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_7200
     * @tc.name testFloat32ArrayFindONE072
     * @tc.desc Verify five-element array array.byteLength is 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      let capturedByteLen: number = 0;
      arr.find((value, index, array) => {
        capturedByteLen = array.byteLength;
        return true;
      });
      expect(capturedByteLen).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_7300
     * @tc.name testFloat32ArrayFindONE073
     * @tc.desc Verify buffer view array array.byteOffset is 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new Float32Array(buf, 8, 4);
      let capturedOffset: number = 0;
      arr.find((value, index, array) => {
        capturedOffset = array.byteOffset;
        return true;
      });
      expect(capturedOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_7400
     * @tc.name testFloat32ArrayFindONE074
     * @tc.desc Verify array.length and array.byteLength satisfy 4x relationship
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      let len: number = 0;
      let bl: number = 0;
      arr.find((value, index, array) => {
        len = array.length;
        bl = array.byteLength;
        return true;
      });
      expect(bl).assertEqual(len * 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_7500
     * @tc.name testFloat32ArrayFindONE075
     * @tc.desc Verify array parameter supports $_get to read elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 6.0, 9.0]);
      let capturedValue: number = 0;
      arr.find((value, index, array) => {
        capturedValue = array.$_get(2);
        return true;
      });
      expect(capturedValue).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_7600
     * @tc.name testFloat32ArrayFindONE076
     * @tc.desc Verify predicate returning constant true selects the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([42.0, 7.0, 8.0]);
      const result = arr.find((value, index, array) => true);
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_7700
     * @tc.name testFloat32ArrayFindONE077
     * @tc.desc Verify call count equals length when predicate always returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let calls: number = 0;
      arr.find((value, index, array) => {
        calls = calls + 1;
        return false;
      });
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_7800
     * @tc.name testFloat32ArrayFindONE078
     * @tc.desc Verify predicate returning true only at last position selects the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.find((value, index, array) => index === 2);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_7900
     * @tc.name testFloat32ArrayFindONE079
     * @tc.desc Verify predicate returning true only in the middle selects the middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.find((value, index, array) => index === 1);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_8000
     * @tc.name testFloat32ArrayFindONE080
     * @tc.desc Verify predicate compound AND condition (value>1 && value<5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.5, 3.0, 9.0]);
      const result = arr.find((value, index, array) => value > 1.0 && value < 5.0);
      expect(result).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_8100
     * @tc.name testFloat32ArrayFindONE081
     * @tc.desc Verify predicate compound OR condition (value<0 || value>8)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 5.0, 9.0]);
      const result = arr.find((value, index, array) => value < 0.0 || value > 8.0);
      expect(result).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_8200
     * @tc.name testFloat32ArrayFindONE082
     * @tc.desc Verify predicate equality condition (value===3.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const result = arr.find((value, index, array) => value === -1.0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_8300
     * @tc.name testFloat32ArrayFindONE083
     * @tc.desc Verify predicate index-based condition (index>1) selects index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      const result = arr.find((value, index, array) => index > 1);
      expect(result).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_8400
     * @tc.name testFloat32ArrayFindONE084
     * @tc.desc Verify Float32Array.of constructed source predicate receives correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return index === 1;
      });
      expect(captured).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_8500
     * @tc.name testFloat32ArrayFindONE085
     * @tc.desc Verify Float32Array.from constructed source predicate receives correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.from([10.0, 20.0, 30.0]);
      let captured: number = 0;
      arr.find((value, index, array) => {
        captured = value;
        return index === 2;
      });
      expect(captured).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_8600
     * @tc.name testFloat32ArrayFindONE086
     * @tc.desc Verify ArrayBuffer view constructed source array.length is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 0, 4);
      let capturedLen: number = 0;
      arr.find((value, index, array) => {
        capturedLen = array.length;
        return true;
      });
      expect(capturedLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_8700
     * @tc.name testFloat32ArrayFindONE087
     * @tc.desc Verify modifying a later element in the predicate affects the later value matched by find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.find((value: number, index: int, array: Float32Array) => {
        if (index === 0) {
          array.$_set(2, 9.0);
        }
        return value === 9.0;
      });
      expect(result).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FINDONE_8800
     * @tc.name testFloat32ArrayFindONE088
     * @tc.desc Verify find propagates predicate exceptions and stops iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindONE088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      let calls: int = 0;
      try {
        arr.find((value: number): boolean => {
          calls++;
          if (value === 2.0) {
            throw new Error('stop');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(calls).assertEqual(2);
    });

  });
}
