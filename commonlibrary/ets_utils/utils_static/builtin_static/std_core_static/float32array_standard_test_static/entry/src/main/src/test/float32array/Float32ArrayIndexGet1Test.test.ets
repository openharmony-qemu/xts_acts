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

export default function Float32ArrayIndexGet1Test(): void {
  describe('Float32ArrayIndexGet1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_0100
     * @tc.name testFloat32ArrayIndexGetONE001
     * @tc.desc Verify Single-parameter arity call $_get(0) reads the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([101.0, 202.0]);
      expect(arr.$_get(0)).assertEqual(101.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_0200
     * @tc.name testFloat32ArrayIndexGetONE002
     * @tc.desc Verify Single-parameter arity call $_get(1) reads the second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([101.0, 202.0]);
      expect(arr.$_get(1)).assertEqual(202.0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_0300
     * @tc.name testFloat32ArrayIndexGetONE003
     * @tc.desc Verify index=1 reads the middle element of a three-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_0400
     * @tc.name testFloat32ArrayIndexGetONE004
     * @tc.desc Verify index=length-1 reads the last element of a three-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.$_get(2)).assertEqual(-1);
    });







    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_0500
     * @tc.name testFloat32ArrayIndexGetONE005
     * @tc.desc Verify index=length out of bounds reads a three-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(3);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_0600
     * @tc.name testFloat32ArrayIndexGetONE006
     * @tc.desc Verify index=length+1 out of bounds reads a three-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(4);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_0700
     * @tc.name testFloat32ArrayIndexGetONE007
     * @tc.desc Verify index=length+2 out of bounds reads a three-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(5);
      });
    });







    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_0800
     * @tc.name testFloat32ArrayIndexGetONE008
     * @tc.desc Verify index=100 far out of bounds reads a three-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(100);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_0900
     * @tc.name testFloat32ArrayIndexGetONE009
     * @tc.desc Verify index=1000 far out of bounds reads a three-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(1000);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_1000
     * @tc.name testFloat32ArrayIndexGetONE010
     * @tc.desc Verify index=1000000 far out of bounds reads a three-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(1000000);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_1100
     * @tc.name testFloat32ArrayIndexGetONE011
     * @tc.desc Verify index=2147483647 (int max value) out of bounds reads a three-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(2147483647);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_1200
     * @tc.name testFloat32ArrayIndexGetONE012
     * @tc.desc Verify index=2147483646 (int second-largest value) out of bounds reads a three-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(2147483646);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_1300
     * @tc.name testFloat32ArrayIndexGetONE013
     * @tc.desc Verify index=65536 out of bounds reads a three-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(65536);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_1400
     * @tc.name testFloat32ArrayIndexGetONE014
     * @tc.desc Verify index=10000 out of bounds reads a three-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(10000);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_1500
     * @tc.name testFloat32ArrayIndexGetONE015
     * @tc.desc Verify index=2147483647 (int max value) out of bounds reads a five-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      expectRangeError((): void => {
        arr.$_get(2147483647);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_1600
     * @tc.name testFloat32ArrayIndexGetONE016
     * @tc.desc Verify index=255 out of bounds reads a three-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(255);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_1700
     * @tc.name testFloat32ArrayIndexGetONE017
     * @tc.desc Verify index=256 out of bounds reads a three-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(256);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_1800
     * @tc.name testFloat32ArrayIndexGetONE018
     * @tc.desc Verify index=1024 out of bounds reads a three-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(1024);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_1900
     * @tc.name testFloat32ArrayIndexGetONE019
     * @tc.desc Verify index=32768 out of bounds reads a three-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(32768);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_2000
     * @tc.name testFloat32ArrayIndexGetONE020
     * @tc.desc Verify index=-1 negative index reads a three-element array and throws RangeError, does not wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(-1);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_2100
     * @tc.name testFloat32ArrayIndexGetONE021
     * @tc.desc Verify index=-2 negative index reads a three-element array and throws RangeError, does not wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(-2);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_2200
     * @tc.name testFloat32ArrayIndexGetONE022
     * @tc.desc Verify index=-3, a negative index equal to -length, reads a three-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(-3);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_2300
     * @tc.name testFloat32ArrayIndexGetONE023
     * @tc.desc Verify index=-4, a negative index equal to -length-1, reads a three-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(-4);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_2400
     * @tc.name testFloat32ArrayIndexGetONE024
     * @tc.desc Verify index=-1 negative index reads a five-element array and throws RangeError, does not wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      expectRangeError((): void => {
        arr.$_get(-1);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_2500
     * @tc.name testFloat32ArrayIndexGetONE025
     * @tc.desc Verify index=-3 negative index reads a five-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      expectRangeError((): void => {
        arr.$_get(-3);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_2600
     * @tc.name testFloat32ArrayIndexGetONE026
     * @tc.desc Verify index=-5, a negative index equal to -length, reads a five-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      expectRangeError((): void => {
        arr.$_get(-5);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_2700
     * @tc.name testFloat32ArrayIndexGetONE027
     * @tc.desc Verify index=-6, a negative index equal to -length-1, reads a five-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      expectRangeError((): void => {
        arr.$_get(-6);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_2800
     * @tc.name testFloat32ArrayIndexGetONE028
     * @tc.desc Verify index=-1, a negative index equal to -length, reads a single-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([7.0]);
      expectRangeError((): void => {
        arr.$_get(-1);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_2900
     * @tc.name testFloat32ArrayIndexGetONE029
     * @tc.desc Verify index=-2, a negative index equal to -length-1, reads a single-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([7.0]);
      expectRangeError((): void => {
        arr.$_get(-2);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_3000
     * @tc.name testFloat32ArrayIndexGetONE030
     * @tc.desc Verify index=-1 negative index reads a two-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      expectRangeError((): void => {
        arr.$_get(-1);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_3100
     * @tc.name testFloat32ArrayIndexGetONE031
     * @tc.desc Verify index=-2, a negative index equal to -length, reads a two-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      expectRangeError((): void => {
        arr.$_get(-2);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_3200
     * @tc.name testFloat32ArrayIndexGetONE032
     * @tc.desc Verify index=-100 far negative index reads a three-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(-100);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_3300
     * @tc.name testFloat32ArrayIndexGetONE033
     * @tc.desc Verify index=-1000 far negative index reads a three-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(-1000);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_3400
     * @tc.name testFloat32ArrayIndexGetONE034
     * @tc.desc Verify index=-1000000 far negative index reads a three-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(-1000000);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_3500
     * @tc.name testFloat32ArrayIndexGetONE035
     * @tc.desc Verify index=-2147483648 (int min value) negative index reads a three-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(-2147483648);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_3600
     * @tc.name testFloat32ArrayIndexGetONE036
     * @tc.desc Verify index=-2147483647 (int second-smallest value) negative index reads a three-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(-2147483647);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_3700
     * @tc.name testFloat32ArrayIndexGetONE037
     * @tc.desc Verify index=-65536 far negative index reads a three-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(-65536);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_3800
     * @tc.name testFloat32ArrayIndexGetONE038
     * @tc.desc Verify index=-100 far negative index reads a five-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      expectRangeError((): void => {
        arr.$_get(-100);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_3900
     * @tc.name testFloat32ArrayIndexGetONE039
     * @tc.desc Verify index=-2147483648 (int min value) negative index reads a five-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      expectRangeError((): void => {
        arr.$_get(-2147483648);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_4000
     * @tc.name testFloat32ArrayIndexGetONE040
     * @tc.desc Verify index=-32768 far negative index reads a three-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(-32768);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_4100
     * @tc.name testFloat32ArrayIndexGetONE041
     * @tc.desc Verify index=-256 far negative index reads a three-element array and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(-256);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_4200
     * @tc.name testFloat32ArrayIndexGetONE042
     * @tc.desc Verify index=0x0 hexadecimal zero index reads the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([11.0, 22.0, 33.0]);
      expect(arr.$_get(0x0)).assertEqual(11.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_4300
     * @tc.name testFloat32ArrayIndexGetONE043
     * @tc.desc Verify index=0x1 hexadecimal one index reads the second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([11.0, 22.0, 33.0]);
      expect(arr.$_get(0x1)).assertEqual(22.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_4400
     * @tc.name testFloat32ArrayIndexGetONE044
     * @tc.desc Verify index=0x2 hexadecimal two index reads the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([11.0, 22.0, 33.0]);
      expect(arr.$_get(0x2)).assertEqual(33.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_4500
     * @tc.name testFloat32ArrayIndexGetONE045
     * @tc.desc Verify index=0xA hexadecimal ten index reads the last element of an eleven-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]);
      expect(arr.$_get(0xA)).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_4600
     * @tc.name testFloat32ArrayIndexGetONE046
     * @tc.desc Verify index=1+1 addition expression reads the third element of a five-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      expect(arr.$_get(1 + 1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_4700
     * @tc.name testFloat32ArrayIndexGetONE047
     * @tc.desc Verify index=2*2 multiplication expression reads the last element of a five-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      expect(arr.$_get(2 * 2)).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_4800
     * @tc.name testFloat32ArrayIndexGetONE048
     * @tc.desc Verify index=0+0 addition expression reads the first element of a three-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.$_get(0 + 0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_4900
     * @tc.name testFloat32ArrayIndexGetONE049
     * @tc.desc Verify Empty array $_get(0) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      expectRangeError((): void => {
        arr.$_get(0);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_5000
     * @tc.name testFloat32ArrayIndexGetONE050
     * @tc.desc Verify Empty array $_get(1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      expectRangeError((): void => {
        arr.$_get(1);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_5100
     * @tc.name testFloat32ArrayIndexGetONE051
     * @tc.desc Verify Empty array $_get(-1) negative index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      expectRangeError((): void => {
        arr.$_get(-1);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_5200
     * @tc.name testFloat32ArrayIndexGetONE052
     * @tc.desc Verify Empty array $_get(100) far out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      expectRangeError((): void => {
        arr.$_get(100);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_5300
     * @tc.name testFloat32ArrayIndexGetONE053
     * @tc.desc Verify Empty array $_get(2147483647) int max value throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      expectRangeError((): void => {
        arr.$_get(2147483647);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_5400
     * @tc.name testFloat32ArrayIndexGetONE054
     * @tc.desc Verify Empty array $_get(-2147483648) int min value throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      expectRangeError((): void => {
        arr.$_get(-2147483648);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_5500
     * @tc.name testFloat32ArrayIndexGetONE055
     * @tc.desc Verify Empty array $_get(50) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      expectRangeError((): void => {
        arr.$_get(50);
      });
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_5600
     * @tc.name testFloat32ArrayIndexGetONE056
     * @tc.desc Verify Single-element array $_get(1) out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([888.0]);
      expectRangeError((): void => {
        arr.$_get(1);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_5700
     * @tc.name testFloat32ArrayIndexGetONE057
     * @tc.desc Verify Single-element array $_get(-1) negative index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([888.0]);
      expectRangeError((): void => {
        arr.$_get(-1);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_5800
     * @tc.name testFloat32ArrayIndexGetONE058
     * @tc.desc Verify Single-element array $_get(2) out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([888.0]);
      expectRangeError((): void => {
        arr.$_get(2);
      });
    });






    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_5900
     * @tc.name testFloat32ArrayIndexGetONE059
     * @tc.desc Verify After constructing with Float32Array.of, $_get(0) reads the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(7.0, 8.0);
      expect(arr.$_get(0)).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_6000
     * @tc.name testFloat32ArrayIndexGetONE060
     * @tc.desc Verify After constructing with Float32Array.of, $_get(1) reads the second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(7.0, 8.0);
      expect(arr.$_get(1)).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_6100
     * @tc.name testFloat32ArrayIndexGetONE061
     * @tc.desc Verify After constructing with Float32Array.from, $_get(0) reads the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.from([9.0, 10.0]);
      expect(arr.$_get(0)).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_6200
     * @tc.name testFloat32ArrayIndexGetONE062
     * @tc.desc Verify After constructing with Float32Array.from, $_get(1) reads the second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.from([9.0, 10.0]);
      expect(arr.$_get(1)).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_6300
     * @tc.name testFloat32ArrayIndexGetONE063
     * @tc.desc Verify After constructing by length, $_set writes then $_get(0) reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(2);
      arr.$_set(0, 100.0);
      expect(arr.$_get(0)).assertEqual(100.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_6400
     * @tc.name testFloat32ArrayIndexGetONE064
     * @tc.desc Verify ArrayBuffer view $_get(0) reads the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(12);
      const view: Float32Array = new Float32Array(buf, 0, 3);
      view.$_set(0, 11.0);
      view.$_set(1, 22.0);
      view.$_set(2, 33.0);
      expect(view.$_get(0)).assertEqual(11.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_6500
     * @tc.name testFloat32ArrayIndexGetONE065
     * @tc.desc Verify ArrayBuffer view $_get(2) reads the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(12);
      const view: Float32Array = new Float32Array(buf, 0, 3);
      view.$_set(0, 11.0);
      view.$_set(1, 22.0);
      view.$_set(2, 33.0);
      expect(view.$_get(2)).assertEqual(33.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_6600
     * @tc.name testFloat32ArrayIndexGetONE066
     * @tc.desc Verify ArrayBuffer view $_get(3) out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(12);
      const view: Float32Array = new Float32Array(buf, 0, 3);
      view.$_set(0, 11.0);
      view.$_set(1, 22.0);
      view.$_set(2, 33.0);
      expectRangeError((): void => {
        view.$_get(3);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETONE_6700
     * @tc.name testFloat32ArrayIndexGetONE067
     * @tc.desc Verify $_get negative index throws RangeError unlike at negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetONE067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      try {
        arr.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

  });
}
