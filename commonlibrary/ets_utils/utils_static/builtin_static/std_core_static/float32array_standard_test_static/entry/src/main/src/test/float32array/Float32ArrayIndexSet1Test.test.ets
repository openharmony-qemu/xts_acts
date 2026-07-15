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

function expectRangeError(action: () => void): void {
  try {
    action();
    expect().assertFail();
  } catch (e) {
    expect(e.name).assertEqual('RangeError');
  }
}

export default function Float32ArrayIndexSet1Test(): void {
  describe('Float32ArrayIndexSet1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0010
     * @tc.name testFloat32ArrayIndexSetONE001
     * @tc.desc Verify legal arity=2 call $_set(index, value) writes the first element then read verifies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0, 0.0]);
      arr.$_set(0, 7.5);
      expect(arr.$_get(0)).assertEqual(7.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0020
     * @tc.name testFloat32ArrayIndexSetONE002
     * @tc.desc Verify legal arity=2 call $_set writes the last element then read verifies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0, 0.0]);
      arr.$_set(1, 9.5);
      expect(arr.$_get(1)).assertEqual(9.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0030
     * @tc.name testFloat32ArrayIndexSetONE003
     * @tc.desc Verify legal arity=2 write to the middle element of a three-element array does not affect adjacent elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 0.0, 3.0]);
      arr.$_set(1, 2.0);
      expect(arr.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(1)).assertEqual(2.0);
      expect(arr.$_get(2)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0040
     * @tc.name testFloat32ArrayIndexSetONE004
     * @tc.desc Verify legal arity=2 after write the array length property remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      arr.$_set(0, 100.0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0050
     * @tc.name testFloat32ArrayIndexSetONE005
     * @tc.desc Verify legal arity=2 after write the byteLength property remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      arr.$_set(2, 50.0);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0060
     * @tc.name testFloat32ArrayIndexSetONE006
     * @tc.desc Verify index=1 writes the middle element of a three-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      arr.$_set(1, 22.0);
      expect(arr.$_get(1)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0070
     * @tc.name testFloat32ArrayIndexSetONE007
     * @tc.desc Verify index=length out of bounds write throws RangeError, array contents unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_set(3, 999.0);
      });
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(1)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(-1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0080
     * @tc.name testFloat32ArrayIndexSetONE008
     * @tc.desc Verify index=length+1 out of bounds write throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([5.0, 6.0]);
      expectRangeError((): void => {
        arr.$_set(3, 888.0);
      });
      expect(arr.$_get(0)).assertEqual(5.0);
      expect(arr.$_get(1)).assertEqual(6.0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0090
     * @tc.name testFloat32ArrayIndexSetONE009
     * @tc.desc Verify index=100 very large positive index out of bounds write throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      expectRangeError((): void => {
        arr.$_set(100, 777.0);
      });
      expect(arr.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(1)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0100
     * @tc.name testFloat32ArrayIndexSetONE010
     * @tc.desc Verify index=2147483647 int maximum value out of bounds write throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_set(2147483647, 1.0);
      });
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0110
     * @tc.name testFloat32ArrayIndexSetONE011
     * @tc.desc Verify index=1000000 large positive index out of bounds write throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([7.0, 8.0]);
      expectRangeError((): void => {
        arr.$_set(1000000, 3.0);
      });
      expect(arr.$_get(0)).assertEqual(7.0);
      expect(arr.$_get(1)).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0120
     * @tc.name testFloat32ArrayIndexSetONE012
     * @tc.desc Verify index=-1 negative index write throws RangeError (does not wrap)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_set(-1, 500.0);
      });
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(1)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0130
     * @tc.name testFloat32ArrayIndexSetONE013
     * @tc.desc Verify index=-length negative index write throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([4.0, 5.0]);
      expectRangeError((): void => {
        arr.$_set(-2, 600.0);
      });
      expect(arr.$_get(0)).assertEqual(4.0);
      expect(arr.$_get(1)).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0140
     * @tc.name testFloat32ArrayIndexSetONE014
     * @tc.desc Verify index=-length-1 negative index out of bounds write throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([4.0, 5.0]);
      expectRangeError((): void => {
        arr.$_set(-3, 700.0);
      });
      expect(arr.$_get(0)).assertEqual(4.0);
      expect(arr.$_get(1)).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0150
     * @tc.name testFloat32ArrayIndexSetONE015
     * @tc.desc Verify index=-2147483648 int minimum value negative index write throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      expectRangeError((): void => {
        arr.$_set(-2147483648, 2.0);
      });
      expect(arr.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(1)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0160
     * @tc.name testFloat32ArrayIndexSetONE016
     * @tc.desc Verify index=-100 large negative index write throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([9.0, 10.0]);
      expectRangeError((): void => {
        arr.$_set(-100, 3.0);
      });
      expect(arr.$_get(0)).assertEqual(9.0);
      expect(arr.$_get(1)).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0170
     * @tc.name testFloat32ArrayIndexSetONE017
     * @tc.desc Verify index=2.9 truncates to 2 writes the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      arr.$_set(2, 88.0);
      expect(arr.$_get(2)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0180
     * @tc.name testFloat32ArrayIndexSetONE018
     * @tc.desc Verify index=0.9 truncates to 0 writes the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      arr.$_set(0, 77.0);
      expect(arr.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0190
     * @tc.name testFloat32ArrayIndexSetONE019
     * @tc.desc Verify index=1.5 truncates to 1 writes the middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      arr.$_set(1, 66.0);
      expect(arr.$_get(1)).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0200
     * @tc.name testFloat32ArrayIndexSetONE020
     * @tc.desc Verify empty array index=0 write throws RangeError, length stays 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      expectRangeError((): void => {
        arr.$_set(0, 1.0);
      });
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0210
     * @tc.name testFloat32ArrayIndexSetONE021
     * @tc.desc Verify empty array index=-1 write throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      expectRangeError((): void => {
        arr.$_set(-1, 1.0);
      });
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0220
     * @tc.name testFloat32ArrayIndexSetONE022
     * @tc.desc Verify empty array index=100 write throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      expectRangeError((): void => {
        arr.$_set(100, 1.0);
      });
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0230
     * @tc.name testFloat32ArrayIndexSetONE023
     * @tc.desc Verify empty array index=2147483647 write throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      expectRangeError((): void => {
        arr.$_set(2147483647, 1.0);
      });
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0240
     * @tc.name testFloat32ArrayIndexSetONE024
     * @tc.desc Verify value=Float32.MAX(3.4028234663852886e+38) write and read exactly equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 3.4028234663852886e+38);
      expect(arr.$_get(0)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0250
     * @tc.name testFloat32ArrayIndexSetONE025
     * @tc.desc Verify value=-Float32.MAX(-3.4028234663852886e+38) write and read exactly equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, -3.4028234663852886e+38);
      expect(arr.$_get(0)).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0260
     * @tc.name testFloat32ArrayIndexSetONE026
     * @tc.desc Verify value=Float32.MIN_NORMAL(1.1754943508222875e-38) write and read exactly equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 1.1754943508222875e-38);
      expect(arr.$_get(0)).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0270
     * @tc.name testFloat32ArrayIndexSetONE027
     * @tc.desc Verify value=Float32.MIN_VALUE(1.401298464324817e-45) write and read exactly equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 1.401298464324817e-45);
      expect(arr.$_get(0)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0280
     * @tc.name testFloat32ArrayIndexSetONE028
     * @tc.desc Verify value=NaN after write read assertNaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, NaN);
      expect(arr.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0290
     * @tc.name testFloat32ArrayIndexSetONE029
     * @tc.desc Verify value=+Infinity after write read equals POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, Number.POSITIVE_INFINITY);
      expect(arr.$_get(0)).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0300
     * @tc.name testFloat32ArrayIndexSetONE030
     * @tc.desc Verify value=-Infinity after write read equals NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, Number.NEGATIVE_INFINITY);
      expect(arr.$_get(0)).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0310
     * @tc.name testFloat32ArrayIndexSetONE031
     * @tc.desc Verify value=+0 after write reciprocal verifies as positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0]);
      arr.$_set(0, 0);
      expect(1 / arr.$_get(0)).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0320
     * @tc.name testFloat32ArrayIndexSetONE032
     * @tc.desc Verify value=-0 after write reciprocal verifies as negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0]);
      arr.$_set(0, -0);
      expect(1 / arr.$_get(0)).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0330
     * @tc.name testFloat32ArrayIndexSetONE033
     * @tc.desc Verify value=int 0 write and read as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0]);
      arr.$_set(0, 0);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0340
     * @tc.name testFloat32ArrayIndexSetONE034
     * @tc.desc Verify value=int -1 write and read as -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0]);
      arr.$_set(0, -1);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0350
     * @tc.name testFloat32ArrayIndexSetONE035
     * @tc.desc Verify value=int 2147483647 writes as float32-rounded 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 2147483647);
      expect(arr.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0360
     * @tc.name testFloat32ArrayIndexSetONE036
     * @tc.desc Verify value=int -2147483648 write and read exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, -2147483648);
      expect(arr.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0370
     * @tc.name testFloat32ArrayIndexSetONE037
     * @tc.desc Verify value=16777216(2^24) write and read exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 16777216);
      expect(arr.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0380
     * @tc.name testFloat32ArrayIndexSetONE038
     * @tc.desc Verify value=16777215(2^24-1) write and read exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 16777215);
      expect(arr.$_get(0)).assertEqual(16777215);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0390
     * @tc.name testFloat32ArrayIndexSetONE039
     * @tc.desc Verify value=33554432(2^25) write and read exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 33554432);
      expect(arr.$_get(0)).assertEqual(33554432);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0400
     * @tc.name testFloat32ArrayIndexSetONE040
     * @tc.desc Verify value=0xFF hexadecimal write and read as 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 0xFF);
      expect(arr.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0410
     * @tc.name testFloat32ArrayIndexSetONE041
     * @tc.desc Verify value=0o17 octal write and read as 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 0o17);
      expect(arr.$_get(0)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0420
     * @tc.name testFloat32ArrayIndexSetONE042
     * @tc.desc Verify value=0b1010 binary write and read as 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 0b1010);
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0430
     * @tc.name testFloat32ArrayIndexSetONE043
     * @tc.desc Verify value=0x10 hexadecimal write and read as 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 0x10);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0440
     * @tc.name testFloat32ArrayIndexSetONE044
     * @tc.desc Verify value=1.0e3 scientific notation write and read as 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 1.0e3);
      expect(arr.$_get(0)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0450
     * @tc.name testFloat32ArrayIndexSetONE045
     * @tc.desc Verify value=9.0 hexadecimal float write and read as 9.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 9.0);
      expect(arr.$_get(0)).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0460
     * @tc.name testFloat32ArrayIndexSetONE046
     * @tc.desc Verify value=3.14159 write and read float32 precision value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 3.14159);
      expect(Math.abs(arr.$_get(0) - 3.14159) < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0470
     * @tc.name testFloat32ArrayIndexSetONE047
     * @tc.desc Verify value=-3.14159 negative float write and read float32 precision value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, -3.14159);
      expect(Math.abs(arr.$_get(0) - (-3.14159)) < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0480
     * @tc.name testFloat32ArrayIndexSetONE048
     * @tc.desc Verify value=1.5 write and read exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 1.5);
      expect(arr.$_get(0)).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0490
     * @tc.name testFloat32ArrayIndexSetONE049
     * @tc.desc Verify value=-1.5 negative float write and read exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, -1.5);
      expect(arr.$_get(0)).assertEqual(-1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0500
     * @tc.name testFloat32ArrayIndexSetONE050
     * @tc.desc Verify value=0.5 write and read exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 0.5);
      expect(arr.$_get(0)).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0510
     * @tc.name testFloat32ArrayIndexSetONE051
     * @tc.desc Verify value=0.25 write and read exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 0.25);
      expect(arr.$_get(0)).assertEqual(0.25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0520
     * @tc.name testFloat32ArrayIndexSetONE052
     * @tc.desc Verify value=0.125 write and read exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 0.125);
      expect(arr.$_get(0)).assertEqual(0.125);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0530
     * @tc.name testFloat32ArrayIndexSetONE053
     * @tc.desc Verify value=2.0 write and read exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 2.0);
      expect(arr.$_get(0)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0540
     * @tc.name testFloat32ArrayIndexSetONE054
     * @tc.desc Verify value=-2.0 negative value write and read exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, -2.0);
      expect(arr.$_get(0)).assertEqual(-2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0550
     * @tc.name testFloat32ArrayIndexSetONE055
     * @tc.desc Verify value=100.5 write and read exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 100.5);
      expect(arr.$_get(0)).assertEqual(100.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0560
     * @tc.name testFloat32ArrayIndexSetONE056
     * @tc.desc Verify value=-100.5 negative value write and read exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, -100.5);
      expect(arr.$_get(0)).assertEqual(-100.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0570
     * @tc.name testFloat32ArrayIndexSetONE057
     * @tc.desc Verify value=123456.789 write and read float32 precision value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 123456.789);
      expect(arr.$_get(0)).assertEqual(123456.7890625);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0580
     * @tc.name testFloat32ArrayIndexSetONE058
     * @tc.desc Verify value=9999999 write and read exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 9999999);
      expect(arr.$_get(0)).assertEqual(9999999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0590
     * @tc.name testFloat32ArrayIndexSetONE059
     * @tc.desc Verify value=10000000 write and read exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 10000000);
      expect(arr.$_get(0)).assertEqual(10000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0600
     * @tc.name testFloat32ArrayIndexSetONE060
     * @tc.desc Verify value=Math.PI write and read float32 precision value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, Math.PI);
      expect(arr.$_get(0)).assertEqual(3.1415927410125732);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0610
     * @tc.name testFloat32ArrayIndexSetONE061
     * @tc.desc Verify value=Math.E write and read float32 precision value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, Math.E);
      expect(arr.$_get(0)).assertEqual(2.7182817459106445);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0620
     * @tc.name testFloat32ArrayIndexSetONE062
     * @tc.desc Verify value=1/3 division expression write and read float32 precision value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 1.0 / 3);
      expect(Math.abs(arr.$_get(0) - 1.0 / 3) < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0630
     * @tc.name testFloat32ArrayIndexSetONE063
     * @tc.desc Verify value=2/3 division expression write and read float32 precision value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 2.0 / 3);
      expect(Math.abs(arr.$_get(0) - 2.0 / 3) < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0640
     * @tc.name testFloat32ArrayIndexSetONE064
     * @tc.desc Verify index=0 writing NaN does not affect the existing value at index=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0, 5.0]);
      arr.$_set(0, NaN);
      expect(arr.$_get(0)).assertNaN();
      expect(arr.$_get(1)).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0650
     * @tc.name testFloat32ArrayIndexSetONE065
     * @tc.desc Verify index=last position writing Infinity does not affect the existing value at index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([3.0, 4.0]);
      arr.$_set(1, Number.POSITIVE_INFINITY);
      expect(arr.$_get(0)).assertEqual(3.0);
      expect(arr.$_get(1)).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0660
     * @tc.name testFloat32ArrayIndexSetONE066
     * @tc.desc Verify index=length out of bounds write Float32.MAX throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      expectRangeError((): void => {
        arr.$_set(2, 3.4028234663852886e+38);
      });
      expect(arr.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(1)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0670
     * @tc.name testFloat32ArrayIndexSetONE067
     * @tc.desc Verify index=-1 negative index writing NaN throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_set(-1, NaN);
      });
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(1)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0680
     * @tc.name testFloat32ArrayIndexSetONE068
     * @tc.desc Verify index=0 after writing Float32.MIN_VALUE reciprocal verifies not infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0]);
      arr.$_set(0, 1.401298464324817e-45);
      expect(arr.$_get(0)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0690
     * @tc.name testFloat32ArrayIndexSetONE069
     * @tc.desc Verify index=length-1 writing -Float32.MAX read exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0, 0.0, 0.0]);
      arr.$_set(2, -3.4028234663852886e+38);
      expect(arr.$_get(2)).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0700
     * @tc.name testFloat32ArrayIndexSetONE070
     * @tc.desc Verify float overload $_set writes and reads with a const float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      const v = 12.5;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(12.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0710
     * @tc.name testFloat32ArrayIndexSetONE071
     * @tc.desc Verify float overload $_set writes and reads with a const float negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      const v = -7.25;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(-7.25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0720
     * @tc.name testFloat32ArrayIndexSetONE072
     * @tc.desc Verify float overload $_set writes and reads with a const float zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([9.0]);
      const v = 0.0;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0730
     * @tc.name testFloat32ArrayIndexSetONE073
     * @tc.desc Verify float overload $_set writes the last element with a float variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      const v = 64.0;
      arr.$_set(1, v);
      expect(arr.$_get(1)).assertEqual(64.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0740
     * @tc.name testFloat32ArrayIndexSetONE074
     * @tc.desc Verify number overload $_set writes and reads with a number literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      const v: number = 33.0;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(33.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0750
     * @tc.name testFloat32ArrayIndexSetONE075
     * @tc.desc Verify number overload $_set writes and reads with a number negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      const v: number = -19.0;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(-19.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0760
     * @tc.name testFloat32ArrayIndexSetONE076
     * @tc.desc Verify number overload $_set writes and reads with a number large integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      const v: number = 1000000;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0770
     * @tc.name testFloat32ArrayIndexSetONE077
     * @tc.desc Verify number overload $_set writes and reads with a number decimal to float32 precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      const v: number = 0.1;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0780
     * @tc.name testFloat32ArrayIndexSetONE078
     * @tc.desc Verify number overload $_set writes with a number NaN then assertNaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      const v: number = NaN;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0790
     * @tc.name testFloat32ArrayIndexSetONE079
     * @tc.desc Verify number overload $_set writes and reads with a number Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      const v: number = Number.POSITIVE_INFINITY;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0800
     * @tc.name testFloat32ArrayIndexSetONE080
     * @tc.desc Verify value=0.2 after write float32 precision truncates to 0.20000000298023224
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 0.2);
      expect(arr.$_get(0)).assertEqual(0.20000000298023224);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0810
     * @tc.name testFloat32ArrayIndexSetONE081
     * @tc.desc Verify value=0.3 after write float32 precision truncates to 0.30000001192092896
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 0.3);
      expect(arr.$_get(0)).assertEqual(0.30000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0820
     * @tc.name testFloat32ArrayIndexSetONE082
     * @tc.desc Verify value=1.1 after write float32 precision truncates to 1.100000023841858
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 1.1);
      expect(arr.$_get(0)).assertEqual(1.100000023841858);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0830
     * @tc.name testFloat32ArrayIndexSetONE083
     * @tc.desc Verify value=1.0000001 after write float32 precision truncates to 1.0000001192092896
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 1.0000001);
      expect(arr.$_get(0)).assertEqual(1.0000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0840
     * @tc.name testFloat32ArrayIndexSetONE084
     * @tc.desc Verify value=0.1+0.2 double-precision sum after write float32 truncates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 0.1 + 0.2);
      expect(arr.$_get(0)).assertEqual(0.30000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0850
     * @tc.name testFloat32ArrayIndexSetONE085
     * @tc.desc Verify value=0.7 after write float32 precision truncation read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 0.7);
      expect(arr.$_get(0)).assertEqual(0.699999988079071);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0860
     * @tc.name testFloat32ArrayIndexSetONE086
     * @tc.desc Verify value=2.71828 after write float32 precision truncation read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 2.71828);
      expect(arr.$_get(0)).assertEqual(2.718280076980591);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0870
     * @tc.name testFloat32ArrayIndexSetONE087
     * @tc.desc Verify value=1.41421356(sqrt2) after write float32 precision truncation read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 1.41421356);
      expect(arr.$_get(0)).assertEqual(1.4142135381698608);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0880
     * @tc.name testFloat32ArrayIndexSetONE088
     * @tc.desc Verify value=16777217(2^24+1) truncates to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 16777217);
      expect(arr.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0890
     * @tc.name testFloat32ArrayIndexSetONE089
     * @tc.desc Verify value=16777219(2^24+3) truncates to 16777220
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 16777219);
      expect(arr.$_get(0)).assertEqual(16777220);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0900
     * @tc.name testFloat32ArrayIndexSetONE090
     * @tc.desc Verify value=16777218(2^24+2) exactly representable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 16777218);
      expect(arr.$_get(0)).assertEqual(16777218);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0910
     * @tc.name testFloat32ArrayIndexSetONE091
     * @tc.desc Verify value=33554435(2^25+3) rounds to 33554436
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 33554435);
      expect(arr.$_get(0)).assertEqual(33554436);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0920
     * @tc.name testFloat32ArrayIndexSetONE092
     * @tc.desc Verify value=67108863(2^26-1) truncates to 67108864
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 67108863);
      expect(arr.$_get(0)).assertEqual(67108864);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0930
     * @tc.name testFloat32ArrayIndexSetONE093
     * @tc.desc Verify value=2^24+0.5 mixed value truncates to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 16777216.5);
      expect(arr.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0940
     * @tc.name testFloat32ArrayIndexSetONE094
     * @tc.desc Verify value=1.0e40 exceeds float32 range overflows to +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 1.0e40);
      expect(arr.$_get(0)).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0950
     * @tc.name testFloat32ArrayIndexSetONE095
     * @tc.desc Verify value=-1.0e40 exceeds float32 range overflows to -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, -1.0e40);
      expect(arr.$_get(0)).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0960
     * @tc.name testFloat32ArrayIndexSetONE096
     * @tc.desc Verify value=3.4028236e+38 slightly exceeds MAX overflows to +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 3.4028236e+38);
      expect(arr.$_get(0)).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0970
     * @tc.name testFloat32ArrayIndexSetONE097
     * @tc.desc Verify value=-3.4028236e+38 slightly exceeds -MAX overflows to -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, -3.4028236e+38);
      expect(arr.$_get(0)).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0980
     * @tc.name testFloat32ArrayIndexSetONE098
     * @tc.desc Verify value=1e308 double-precision large number overflows to +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 1e308);
      expect(arr.$_get(0)).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_0990
     * @tc.name testFloat32ArrayIndexSetONE099
     * @tc.desc Verify value=-1e308 double-precision large negative number overflows to -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, -1e308);
      expect(arr.$_get(0)).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_1000
     * @tc.name testFloat32ArrayIndexSetONE100
     * @tc.desc Verify value=Number.MAX_VALUE overflows to +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, Number.MAX_VALUE);
      expect(arr.$_get(0)).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_1010
     * @tc.name testFloat32ArrayIndexSetONE101
     * @tc.desc Verify value=-Number.MAX_VALUE overflows to -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, -Number.MAX_VALUE);
      expect(arr.$_get(0)).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_1020
     * @tc.name testFloat32ArrayIndexSetONE102
     * @tc.desc Verify value=1.0e-46 underflows to +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0]);
      arr.$_set(0, 1.0e-46);
      expect(1 / arr.$_get(0)).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_1030
     * @tc.name testFloat32ArrayIndexSetONE103
     * @tc.desc Verify value=1.0e-45 equals float32 smallest subnormal number MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 1.0e-45);
      expect(arr.$_get(0)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_1040
     * @tc.name testFloat32ArrayIndexSetONE104
     * @tc.desc Verify value=5e-324 double-precision smallest positive value underflows to +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0]);
      arr.$_set(0, 5e-324);
      expect(1 / arr.$_get(0)).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_1050
     * @tc.name testFloat32ArrayIndexSetONE105
     * @tc.desc Verify value=1e-40 less than MIN_NORMAL is a subnormal number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      arr.$_set(0, 1e-40);
      expect(Math.abs(arr.$_get(0) - 1e-40) < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_1060
     * @tc.name testFloat32ArrayIndexSetONE106
     * @tc.desc Verify value=-1.0e-46 negative underflows to -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0]);
      arr.$_set(0, -1.0e-46);
      expect(1 / arr.$_get(0)).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_1070
     * @tc.name testFloat32ArrayIndexSetONE107
     * @tc.desc Verify value=Number.MIN_VALUE double-precision smallest positive value underflows to +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0]);
      arr.$_set(0, Number.MIN_VALUE);
      expect(1 / arr.$_get(0)).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_1080
     * @tc.name testFloat32ArrayIndexSetONE108
     * @tc.desc Verify after writing a truncated value the array length and byteLength remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      arr.$_set(1, 16777217);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_1090
     * @tc.name testFloat32ArrayIndexSetONE109
     * @tc.desc Verify after writing Infinity adjacent elements are not affected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      arr.$_set(1, 1.0e40);
      expect(arr.$_get(0)).assertEqual(10.0);
      expect(arr.$_get(1)).assertEqual(Number.POSITIVE_INFINITY);
      expect(arr.$_get(2)).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_1100
     * @tc.name testFloat32ArrayIndexSetONE110
     * @tc.desc Verify after writing NaN adjacent elements are not affected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      arr.$_set(0, NaN);
      expect(arr.$_get(0)).assertNaN();
      expect(arr.$_get(1)).assertEqual(20.0);
      expect(arr.$_get(2)).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_1110
     * @tc.name testFloat32ArrayIndexSetONE111
     * @tc.desc Verify after sequentially writing index0/1/2 the iterator reads the updated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0, 0.0, 0.0]);
      arr.$_set(0, 11.0);
      arr.$_set(1, 22.0);
      arr.$_set(2, 33.0);
      const it = arr.values();
      expect(it.next().value).assertEqual(11.0);
      expect(it.next().value).assertEqual(22.0);
      expect(it.next().value).assertEqual(33.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_SETONE_1120
     * @tc.name testFloat32ArrayIndexSetONE112
     * @tc.desc Verify after overwriting an existing non-zero value read as the new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexSetONE112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([55.0, 66.0]);
      arr.$_set(0, 77.0);
      expect(arr.$_get(0)).assertEqual(77.0);
      expect(arr.$_get(1)).assertEqual(66.0);
    });

  });
}
