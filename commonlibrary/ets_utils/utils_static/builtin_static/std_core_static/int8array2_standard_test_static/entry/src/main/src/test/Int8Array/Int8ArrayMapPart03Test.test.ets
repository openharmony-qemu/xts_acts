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

class MapTestErrorForMapPart03 extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'MapTestErrorForMapPart03';
  }
}

export default function int8ArrayMapPart03Test(): void {
  describe('Int8ArrayMapPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_0600
     * @tc.name int8ArrayMapPart03Test006
     * @tc.desc Verify map truncates callback result 128 to INT8_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1);
      let result: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        if (val < INT8_MIN || val > INT8_MAX) {
          return 0;
        }
        return 128;
      });
      let r1: number = result.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_0700
     * @tc.name int8ArrayMapPart03Test007
     * @tc.desc Verify map wraps callback result -129 to INT8_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1);
      let result: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        if (val < INT8_MIN || val > INT8_MAX) {
          return 0;
        }
        return -129;
      });
      let r1: number = result.$_get(0);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_0800
     * @tc.name int8ArrayMapPart03Test008
     * @tc.desc Verify map truncates callback result 255 to negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1);
      let result: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        if (val < INT8_MIN || val > INT8_MAX) {
          return 0;
        }
        return 255;
      });
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_0900
     * @tc.name int8ArrayMapPart03Test009
     * @tc.desc Verify map wraps callback result 256 back to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1);
      let result: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        if (val < INT8_MIN || val > INT8_MAX) {
          return 0;
        }
        return 256;
      });
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_1000
     * @tc.name int8ArrayMapPart03Test010
     * @tc.desc Verify map truncates NaN callback result to zero silently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1);
      let result: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        if (val < INT8_MIN || val > INT8_MAX) {
          return 0;
        }
        return Number.NaN;
      });
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_1100
     * @tc.name int8ArrayMapPart03Test011
     * @tc.desc Verify map truncates callback result 1.9 to one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1);
      let result: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        if (val < INT8_MIN || val > INT8_MAX) {
          return 0;
        }
        return 1.9;
      });
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_1200
     * @tc.name int8ArrayMapPart03Test012
     * @tc.desc Verify map truncates callback result -1.9 to negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1);
      let result: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        if (val < INT8_MIN || val > INT8_MAX) {
          return 0;
        }
        return -1.9;
      });
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_1300
     * @tc.name int8ArrayMapPart03Test013
     * @tc.desc Verify map truncates callback result -128.9 to INT8_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1);
      let result: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        if (val < INT8_MIN || val > INT8_MAX) {
          return 0;
        }
        return -128.9;
      });
      let r1: number = result.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_1600
     * @tc.name int8ArrayMapPart03Test016
     * @tc.desc Verify single-element array map callback executes 1 time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let count: number = 0;
      let resultVal1: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        count = count + 1;
        return val;
      });
      let expectedVal1: Int8Array = new Int8Array([42]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_1700
     * @tc.name int8ArrayMapPart03Test017
     * @tc.desc Verify single-element map callback val parameter equals element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let captured: number = 0;
      let resultVal1: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        captured = val;
        return val;
      });
      let expectedVal1: Int8Array = new Int8Array([42]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      expect(captured).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_1800
     * @tc.name int8ArrayMapPart03Test018
     * @tc.desc Verify single-element map callback index parameter is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let capturedIdx: number = -1;
      let resultVal1: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        capturedIdx = index;
        return val;
      });
      let expectedVal1: Int8Array = new Int8Array([42]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      expect(capturedIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_1900
     * @tc.name int8ArrayMapPart03Test019
     * @tc.desc Verify single-element map callback array parameter length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let arrLen: number = 0;
      let resultVal1: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        arrLen = a.length;
        return val;
      });
      let expectedVal1: Int8Array = new Int8Array([42]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      expect(arrLen).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_2000
     * @tc.name int8ArrayMapPart03Test020
     * @tc.desc Verify single-element map result length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let result: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        return val;
      });
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_2100
     * @tc.name int8ArrayMapPart03Test021
     * @tc.desc Verify single-element map val+1 returns correct mapped result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let result: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        return val + 1;
      });
      let r1: number = result.$_get(0);
      let e1: int = 43;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_2200
     * @tc.name int8ArrayMapPart03Test022
     * @tc.desc Verify modifying map result does not affect original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let result: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        return val;
      });
      result.$_set(0, 99);
      let r1: number = arr.$_get(0);
      let e1: int = 42;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_2300
     * @tc.name int8ArrayMapPart03Test023
     * @tc.desc Verify all-zero array map callback executes length times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      let count: number = 0;
      let resultVal1: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        count = count + 1;
        return val;
      });
      let expectedVal1: Int8Array = new Int8Array([0, 0, 0, 0]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_2400
     * @tc.name int8ArrayMapPart03Test024
     * @tc.desc Verify all-minus128 array map plus 1 maps to -127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128, -128, -128);
      let result: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        return val + 1;
      });
      let r1: number = result.$_get(0);
      let e1: int = -127;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_2500
     * @tc.name int8ArrayMapPart03Test025
     * @tc.desc Verify all-127 array map minus 1 maps to 126
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(127, 127, 127);
      let result: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        return val - 1;
      });
      let r1: number = result.$_get(0);
      let e1: int = 126;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_2600
     * @tc.name int8ArrayMapPart03Test026
     * @tc.desc Verify all-same array map constant return first and last equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 5, 5, 5);
      let result: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        if (val < INT8_MIN || val > INT8_MAX) {
          return 0;
        }
        return 42;
      });
      let r1: number = result.$_get(0);
      let e1: number = result.$_get(3);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_2700
     * @tc.name int8ArrayMapPart03Test027
     * @tc.desc Verify all-same array map result length equals original length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 7, 7);
      let result: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        return val;
      });
      let r1: int = result.length;
      let e1: int = arr.length;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_2800
     * @tc.name int8ArrayMapPart03Test028
     * @tc.desc Verify map callback accessing at negative index gets last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        let r1 = a.at(-1);
        let e1: int = 30;
        expect(r1).assertEqual(e1);
        return val;
      });
      let r2: int = result.length;
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_2900
     * @tc.name int8ArrayMapPart03Test029
     * @tc.desc Verify map callback at out of range index returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        expect(a.at(3)).assertUndefined();
        return val;
      });
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_3000
     * @tc.name int8ArrayMapPart03Test030
     * @tc.desc Verify map callback at negative out of range index returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        expect(a.at(-4)).assertUndefined();
        return val;
      });
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_3100
     * @tc.name int8ArrayMapPart03Test031
     * @tc.desc Verify fn calling array.with(length, 0) throws RangeError propagated by map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      try {
        arr.map((val: number, index: int, a: Int8Array) => {
          a.with(3, 0);
          return val;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_3200
     * @tc.name int8ArrayMapPart03Test032
     * @tc.desc Verify fn calling array.with(-length-1, 0) throws RangeError propagated by map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      try {
        arr.map((val: number, index: int, a: Int8Array) => {
          a.with(-4, 0);
          return val;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_3300
     * @tc.name int8ArrayMapPart03Test033
     * @tc.desc Verify map callback with huge index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      try {
        arr.map((val: number, index: int, a: Int8Array) => {
          a.with(2147483647, 0);
          return val;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_3400
     * @tc.name int8ArrayMapPart03Test034
     * @tc.desc Verify map callback at large positive index returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        expect(a.at(2147483647)).assertUndefined();
        return val;
      });
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART03_3500
     * @tc.name int8ArrayMapPart03Test035
     * @tc.desc Verify map callback at large negative index returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: Int8Array = arr.map((val: number, index: int, a: Int8Array) => {
        expect(a.at(-2147483648)).assertUndefined();
        return val;
      });
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });
  });
}
