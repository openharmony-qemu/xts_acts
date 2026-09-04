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

export default function Float32ArraySome1Test(): void {
  describe('Float32ArraySome1Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(45);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_0100
     * @tc.name testFloat32ArraySomeOne001
     * @tc.desc Verify some(element>2.5) on [1,2,3] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element > 2.5;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_0200
     * @tc.name testFloat32ArraySomeOne002
     * @tc.desc Verify predicate element/index/array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 10.0 && index === 0 && array.length === 2;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_0300
     * @tc.name testFloat32ArraySomeOne003
     * @tc.desc Verify some(return false) on [1,2,3,4] iterates all and returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let callCount: number = 0;
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        callCount = callCount + 1;
        return false;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_0400
     * @tc.name testFloat32ArraySomeOne004
     * @tc.desc Verify some(return true) on [5,6,7] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([5.0, 6.0, 7.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return true;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_0500
     * @tc.name testFloat32ArraySomeOne005
     * @tc.desc Verify some(element>15) on [10,20,30] returns true after 2 calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      let callCount: number = 0;
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        callCount = callCount + 1;
        return element > 15.0;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_0600
     * @tc.name testFloat32ArraySomeOne006
     * @tc.desc Verify some(element===5) on [1,5,3] returns true with strict equality check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 5.0, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 5.0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_0700
     * @tc.name testFloat32ArraySomeOne007
     * @tc.desc Verify some(element>0) on [-1,-2,-3] returns false as all elements are negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-1.0, -2.0, -3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element > 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_0800
     * @tc.name testFloat32ArraySomeOne008
     * @tc.desc Verify some(isNaN) on [1,NaN,3] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, Number.NaN, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return isNaN(element);
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_0900
     * @tc.name testFloat32ArraySomeOne009
     * @tc.desc Verify some(isNaN) on [1,2,3] returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return isNaN(element);
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_1000
     * @tc.name testFloat32ArraySomeOne010
     * @tc.desc Verify callback captures first element 11.0 from [11,22,33] via element param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([11.0, 22.0, 33.0]);
      let firstElem: number = -1.0;
      arr.some((element: number, index: int, array: Float32Array): boolean => {
        if (index === 0) {
          firstElem = element;
        }
        return false;
      });
      expect(firstElem).assertEqual(11.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_1100
     * @tc.name testFloat32ArraySomeOne011
     * @tc.desc Verify callback captures index 0 for element 7.0 in [7,8]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([7.0, 8.0]);
      let capturedIndex: number = -1;
      arr.some((element: number, index: int, array: Float32Array): boolean => {
        if (element === 7.0) {
          capturedIndex = index;
        }
        return false;
      });
      expect(capturedIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_1200
     * @tc.name testFloat32ArraySomeOne012
     * @tc.desc Verify some captures index 2 for element 9.0 in [7,8,9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([7.0, 8.0, 9.0]);
      let lastIndex: number = -1;
      arr.some((element: number, index: int, array: Float32Array): boolean => {
        if (element === 9.0) {
          lastIndex = index;
        }
        return false;
      });
      expect(lastIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_1300
     * @tc.name testFloat32ArraySomeOne013
     * @tc.desc Verify some callback array param equals arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      let refMatches: number = 0;
      arr.some((element: number, index: int, array: Float32Array): boolean => {
        if (array === arr) {
          refMatches = refMatches + 1;
        }
        return false;
      });
      expect(refMatches).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_1400
     * @tc.name testFloat32ArraySomeOne014
     * @tc.desc Verify some callback captures array.length=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let capturedLen: number = 0;
      arr.some((element: number, index: int, array: Float32Array): boolean => {
        capturedLen = array.length;
        return true;
      });
      expect(capturedLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_1500
     * @tc.name testFloat32ArraySomeOne015
     * @tc.desc Verify some visits consecutive indices 0,1,2,3 on [10,20,30,40] with no gaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      let prev: number = -1;
      let badStep: number = 0;
      arr.some((element: number, index: int, array: Float32Array): boolean => {
        if (prev !== -1 && index !== prev + 1) {
          badStep = badStep + 1;
        }
        prev = index;
        return false;
      });
      expect(badStep).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_1600
     * @tc.name testFloat32ArraySomeOne016
     * @tc.desc Verify some(element>2.0) on [1,2,3] with threshold variable returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threshold: number = 2.0;
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element > threshold;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_1700
     * @tc.name testFloat32ArraySomeOne017
     * @tc.desc Verify some(element===3) on [1,2,3] iterates all 3 elements before returning true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      let callCount: number = 0;
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        callCount = callCount + 1;
        return element === 3.0;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_1800
     * @tc.name testFloat32ArraySomeOne018
     * @tc.desc Verify some callback array[0]=99 mutates arr.$_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      arr.some((element: number, index: int, array: Float32Array): boolean => {
        array[0] = 99.0;
        return false;
      });
      const element018 = arr.$_get(0);
      expect(element018).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_1900
     * @tc.name testFloat32ArraySomeOne019
     * @tc.desc Verify some callback array[index]=0 sets all to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      arr.some((element: number, index: int, array: Float32Array): boolean => {
        array[index] = 0.0;
        return false;
      });
      const element019 = arr.$_get(0);
      expect(element019).assertEqual(0.0);
      const element019Part2 = arr.$_get(2);
      expect(element019Part2).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_2000
     * @tc.name testFloat32ArraySomeOne020
     * @tc.desc Verify some(element===MAX) on [MAX] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([3.4028234663852886e+38]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 3.4028234663852886e+38;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_2100
     * @tc.name testFloat32ArraySomeOne021
     * @tc.desc Verify some(element===MIN_NORMAL) on [MIN_NORMAL] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.1754943508222875e-38]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 1.1754943508222875e-38;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_2200
     * @tc.name testFloat32ArraySomeOne022
     * @tc.desc Verify some(element===MIN_VALUE) on [MIN_VALUE] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.401298464324817e-45]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 1.401298464324817e-45;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_2300
     * @tc.name testFloat32ArraySomeOne023
     * @tc.desc Verify some(isNaN) on [NaN] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([Number.NaN]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return isNaN(element);
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_2400
     * @tc.name testFloat32ArraySomeOne024
     * @tc.desc Verify some(element===+Infinity) on [+Infinity] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([Number.POSITIVE_INFINITY]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === Number.POSITIVE_INFINITY;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_2500
     * @tc.name testFloat32ArraySomeOne025
     * @tc.desc Verify some(element===-Infinity) on [-Infinity] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([Number.NEGATIVE_INFINITY]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === Number.NEGATIVE_INFINITY;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_2600
     * @tc.name testFloat32ArraySomeOne026
     * @tc.desc Verify some(element===0) on [+0] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 0.0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_2700
     * @tc.name testFloat32ArraySomeOne027
     * @tc.desc Verify some(1/element===-Infinity) on [-0.0] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-0.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return 1.0 / element === Number.NEGATIVE_INFINITY;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_2800
     * @tc.name testFloat32ArraySomeOne028
     * @tc.desc Verify some(element===-MAX) on [-MAX] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-3.4028234663852886e+38]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === -3.4028234663852886e+38;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_2900
     * @tc.name testFloat32ArraySomeOne029
     * @tc.desc Verify some(Math.abs(element-0.1)<1e-6) on [0.1] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.1]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return Math.abs(element - 0.1) < 1e-6;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_3000
     * @tc.name testFloat32ArraySomeOne030
     * @tc.desc Verify some(Math.abs(element-0.2)<1e-6) on [0.2] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.2]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return Math.abs(element - 0.2) < 1e-6;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_3100
     * @tc.name testFloat32ArraySomeOne031
     * @tc.desc Verify some(Math.abs(element-0.3)<1e-6) on [0.3] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.3]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return Math.abs(element - 0.3) < 1e-6;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_3200
     * @tc.name testFloat32ArraySomeOne032
     * @tc.desc Verify 0.1+0.2 0.3 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.1 + 0.2]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 0.3;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_3300
     * @tc.name testFloat32ArraySomeOne033
     * @tc.desc Verify 1.0000001 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0000001]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 1.0000001;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_3400
     * @tc.name testFloat32ArraySomeOne034
     * @tc.desc Verify some(Math.abs(element-1.1)<1e-6) on [1.1] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.1]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return Math.abs(element - 1.1) < 1e-6;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_3500
     * @tc.name testFloat32ArraySomeOne035
     * @tc.desc Verify 16777216 2^24 some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([16777216]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 16777216;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_3600
     * @tc.name testFloat32ArraySomeOne036
     * @tc.desc Verify 16777217 2^24+1 16777216 some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([16777217]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 16777216;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_3700
     * @tc.name testFloat32ArraySomeOne037
     * @tc.desc Verify 1.0e40 +Infinity some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0e40]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === Number.POSITIVE_INFINITY;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_3800
     * @tc.name testFloat32ArraySomeOne038
     * @tc.desc Verify -1.0e40 -Infinity some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-1.0e40]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === Number.NEGATIVE_INFINITY;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_3900
     * @tc.name testFloat32ArraySomeOne039
     * @tc.desc Verify 1.0e-46 0 some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0e-46]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 0.0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_4000
     * @tc.name testFloat32ArraySomeOne040
     * @tc.desc Verify some(element===0.5) on [0.5] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.5]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 0.5;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_4100
     * @tc.name testFloat32ArraySomeOne041
     * @tc.desc Verify -1 some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-1]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === -1;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_4200
     * @tc.name testFloat32ArraySomeOne042
     * @tc.desc Verify 2147483647 float32 2147483648 some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([2147483647]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 2147483648;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_4300
     * @tc.name testFloat32ArraySomeOne043
     * @tc.desc Verify -2147483648 -2^31 some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-2147483648]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === -2147483648;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_4400
     * @tc.name testFloat32ArraySomeOne044
     * @tc.desc Verify 0x10 =16 some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0x10]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 16;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_4500
     * @tc.name testFloat32ArraySomeOne045
     * @tc.desc Verify 0o17 =15 some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0o17]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 15;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_4600
     * @tc.name testFloat32ArraySomeOne046
     * @tc.desc Verify 0b1010 =10 some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0b1010]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 10;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_4700
     * @tc.name testFloat32ArraySomeOne047
     * @tc.desc Verify 1e3 =1000 some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1e3]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 1000;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_4800
     * @tc.name testFloat32ArraySomeOne048
     * @tc.desc Verify 1.5e1 =15 some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.5e1]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 15;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_4900
     * @tc.name testFloat32ArraySomeOne049
     * @tc.desc Verify -0x10 =-16 some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-0x10]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === -16;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_5000
     * @tc.name testFloat32ArraySomeOne050
     * @tc.desc Verify 0xFF =255 some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0xFF]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 255;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_5100
     * @tc.name testFloat32ArraySomeOne051
     * @tc.desc Verify some(element===42) on [42] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([42.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 42.0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_5200
     * @tc.name testFloat32ArraySomeOne052
     * @tc.desc Verify some(element===99) on [42] returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([42.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 99.0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_5300
     * @tc.name testFloat32ArraySomeOne053
     * @tc.desc Verify some(element===7) on fill(3,5) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(5);
      arr.fill(3.0);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 7.0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_5400
     * @tc.name testFloat32ArraySomeOne054
     * @tc.desc Verify some(element===7) on fill(3,5) with $_set(2,7) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(5);
      arr.fill(3.0);
      arr.$_set(2, 7.0);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 7.0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_5500
     * @tc.name testFloat32ArraySomeOne055
     * @tc.desc Verify 100 some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(100);
      arr.fill(1.0);
      arr.$_set(99, 88.0);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 88.0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_5600
     * @tc.name testFloat32ArraySomeOne056
     * @tc.desc Verify 100 some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(100);
      arr.fill(1.0);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 88.0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_5700
     * @tc.name testFloat32ArraySomeOne057
     * @tc.desc Verify 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(6);
      arr.fill(0.0);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 0.0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_5800
     * @tc.name testFloat32ArraySomeOne058
     * @tc.desc Verify some(element>0) on [-5,-3,4,-1] returns true as element 4 satisfies condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-5.0, -3.0, 4.0, -1.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_5900
     * @tc.name testFloat32ArraySomeOne059
     * @tc.desc Verify some(element<0) on [5,3,-4,1] returns true as element -4 satisfies condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([5.0, 3.0, -4.0, 1.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element < 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_6000
     * @tc.name testFloat32ArraySomeOne060
     * @tc.desc Verify some(index===0) on [1,2,3,4] stops at index 0 with callCount=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let callCount: number = 0;
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        callCount = callCount + 1;
        return index === 0;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_6100
     * @tc.name testFloat32ArraySomeOne061
     * @tc.desc Verify some(index===1) on [1,2,3,4] stops at index 1 with callCount=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let callCount: number = 0;
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        callCount = callCount + 1;
        return index === 1;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_6200
     * @tc.name testFloat32ArraySomeOne062
     * @tc.desc Verify some(index===2) on [1,2,3,4] stops at index 2 with callCount=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let callCount: number = 0;
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        callCount = callCount + 1;
        return index === 2;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_6300
     * @tc.name testFloat32ArraySomeOne063
     * @tc.desc Verify some(index===3) on [1,2,3,4] stops at index 3 with callCount=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let callCount: number = 0;
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        callCount = callCount + 1;
        return index === 3;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_6400
     * @tc.name testFloat32ArraySomeOne064
     * @tc.desc Verify some stops at index 0 so mutation at index 3 is not executed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      arr.some((element: number, index: int, array: Float32Array): boolean => {
        if (index === 3) {
          array[index] = 99.0;
        }
        return index === 0;
      });
      const element065 = arr.$_get(3);
      expect(element065).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_6500
     * @tc.name testFloat32ArraySomeOne065
     * @tc.desc Verify some callback captures index 0 for single element [5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([5.0]);
      let capturedIndex: number = -1;
      arr.some((element: number, index: int, array: Float32Array): boolean => {
        capturedIndex = index;
        return false;
      });
      expect(capturedIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_6600
     * @tc.name testFloat32ArraySomeOne066
     * @tc.desc Verify some callback captures indices 0 and 1 for [5,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([5.0, 6.0]);
      let firstIdx: number = -1;
      let secondIdx: number = -1;
      arr.some((element: number, index: int, array: Float32Array): boolean => {
        if (element === 5.0) { firstIdx = index; }
        if (element === 6.0) { secondIdx = index; }
        return false;
      });
      expect(firstIdx).assertEqual(0);
      expect(secondIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_6700
     * @tc.name testFloat32ArraySomeOne067
     * @tc.desc Verify some(index+1===2) matches once on [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      let matchCount: number = 0;
      arr.some((element: number, index: int, array: Float32Array): boolean => {
        if (index + 1 === 2) {
          matchCount = matchCount + 1;
        }
        return false;
      });
      expect(matchCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_6800
     * @tc.name testFloat32ArraySomeOne068
     * @tc.desc Verify some callback captures byteLength=12 for arr with 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      let capturedByteLen: number = 0;
      arr.some((element: number, index: int, array: Float32Array): boolean => {
        capturedByteLen = array.byteLength;
        return true;
      });
      expect(capturedByteLen).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_6900
     * @tc.name testFloat32ArraySomeOne069
     * @tc.desc Verify callback reads array[2]=33.0 from [11,22,33] via array param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([11.0, 22.0, 33.0]);
      let readVal: number = 0;
      arr.some((element: number, index: int, array: Float32Array): boolean => {
        if (index === 2) {
          readVal = array[2];
        }
        return false;
      });
      expect(readVal).assertEqual(33.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_7000
     * @tc.name testFloat32ArraySomeOne070
     * @tc.desc Verify callback sets array[1]=77 on [1,2] via array param, mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      arr.some((element: number, index: int, array: Float32Array): boolean => {
        array[1] = 77.0;
        return true;
      });
      const element071 = arr.$_get(1);
      expect(element071).assertEqual(77.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_7100
     * @tc.name testFloat32ArraySomeOne071
     * @tc.desc Verify some(element>4) on [1,5,3] returns true as element 5 satisfies condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 5.0, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element > 4.0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_7200
     * @tc.name testFloat32ArraySomeOne072
     * @tc.desc Verify some(element<2) on [1,5,3] returns true as element 1 satisfies condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 5.0, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element < 2.0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_7300
     * @tc.name testFloat32ArraySomeOne073
     * @tc.desc Verify some(element===20) on [20,10,30] returns true at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([20.0, 10.0, 30.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 20.0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_7400
     * @tc.name testFloat32ArraySomeOne074
     * @tc.desc Verify some(Number.isInteger) on [1.5,2.0,3.7] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.5, 2.0, 3.7]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return Number.isInteger(element);
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_7500
     * @tc.name testFloat32ArraySomeOne075
     * @tc.desc Verify some searches MAX in [MIN_VALUE,MAX] with callCount=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.401298464324817e-45, 3.4028234663852886e+38]);
      let callCount: number = 0;
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        callCount = callCount + 1;
        return element === 3.4028234663852886e+38;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_7600
     * @tc.name testFloat32ArraySomeOne076
     * @tc.desc Verify some searches +Infinity in [1,+Infinity] with callCount=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, Number.POSITIVE_INFINITY]);
      let callCount: number = 0;
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        callCount = callCount + 1;
        return element === Number.POSITIVE_INFINITY;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_7700
     * @tc.name testFloat32ArraySomeOne077
     * @tc.desc Verify some finds element===5 in [NaN,5,NaN] skipping NaN with callCount=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([Number.NaN, 5.0, Number.NaN]);
      let callCount: number = 0;
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        callCount = callCount + 1;
        return element === 5.0;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_7800
     * @tc.name testFloat32ArraySomeOne078
     * @tc.desc Verify some(element===88) on 100-element array with 88 at index 0 returns true with callCount=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(100);
      arr.fill(1.0);
      arr.$_set(0, 88.0);
      let callCount: number = 0;
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        callCount = callCount + 1;
        return element === 88.0;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_7900
     * @tc.name testFloat32ArraySomeOne079
     * @tc.desc Verify Infinity Number.isFinite false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return isFinite(element);
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_8000
     * @tc.name testFloat32ArraySomeOne080
     * @tc.desc Verify +0 -0 e===0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0, -0.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_8100
     * @tc.name testFloat32ArraySomeOne081
     * @tc.desc Verify some(element===16) on [0x10,0o20,16] returns true as all three forms equal 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0x10, 0o20, 16]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 16;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_8200
     * @tc.name testFloat32ArraySomeOne082
     * @tc.desc Verify some(!isFinite) on [Infinity,NaN,-Infinity] stops at index 0 with callCount=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([Number.POSITIVE_INFINITY, Number.NaN, Number.NEGATIVE_INFINITY]);
      let callCount: number = 0;
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => {
        callCount = callCount + 1;
        return !isFinite(element);
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_8300
     * @tc.name testFloat32ArraySomeOne083
     * @tc.desc Verify some does not mutate array when predicate returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 2.0;
      });
      const element084 = arr.$_get(0);
      expect(element084).assertEqual(1.0);
      const element084Part2 = arr.$_get(1);
      expect(element084Part2).assertEqual(2.0);
      const element084Part3 = arr.$_get(2);
      expect(element084Part3).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_8400
     * @tc.name testFloat32ArraySomeOne084
     * @tc.desc Verify some does not mutate array when predicate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element === 99.0;
      });
      const element085 = arr.$_get(0);
      expect(element085).assertEqual(1.0);
      const element085Part2 = arr.$_get(1);
      expect(element085Part2).assertEqual(2.0);
      const element085Part3 = arr.$_get(2);
      expect(element085Part3).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_8500
     * @tc.name testFloat32ArraySomeOne085
     * @tc.desc Verify some does not modify byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      const before: number = arr.byteLength;
      arr.some((element: number, index: int, array: Float32Array): boolean => {
        return element > 0;
      });
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_8600
     * @tc.name testFloat32ArraySomeOne086
     * @tc.desc Verify some throws RangeError from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      try {
        arr.some((element: number, index: int, array: Float32Array): boolean => {
          throw new RangeError('range-boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_8700
     * @tc.name testFloat32ArraySomeOne087
     * @tc.desc Verify some throws TypeError from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      try {
        arr.some((element: number, index: int, array: Float32Array): boolean => {
          throw new TypeError('type-boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_8800
     * @tc.name testFloat32ArraySomeOne088
     * @tc.desc Verify some throws Error from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      try {
        arr.some((element: number, index: int, array: Float32Array): boolean => {
          throw new Error('plain-boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_8900
     * @tc.name testFloat32ArraySomeOne089
     * @tc.desc Verify some throws Error at first element on [1,2,3], callCount=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      let callCount: number = 0;
      try {
        arr.some((element: number, index: int, array: Float32Array): boolean => {
          callCount = callCount + 1;
          throw new Error('first-boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_ONE_9000
     * @tc.name testFloat32ArraySomeOne090
     * @tc.desc Verify some throws Error at index 1 on [1,2,3], callCount=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      let callCount: number = 0;
      try {
        arr.some((element: number, index: int, array: Float32Array): boolean => {
          callCount = callCount + 1;
          if (index === 1) {
            throw new Error('mid-boom');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(2);
    });

  });
}
