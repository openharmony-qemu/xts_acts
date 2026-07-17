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
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int8ArrayEveryPart03TestTest(): void {
  describe('Int8ArrayEveryPart03TestTest', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_0100
     * @tc.name int8ArrayEveryPart03Test001
     * @tc.desc Verify new Int8Array(0) true vacuous truth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: boolean = arr.every((element: number): boolean => true);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_0200
     * @tc.name int8ArrayEveryPart03Test002
     * @tc.desc Verify true vacuous truth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: boolean = arr.every((element: number): boolean => false);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_0300
     * @tc.name int8ArrayEveryPart03Test003
     * @tc.desc Verify RangeError true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: boolean = arr.every((element: number): boolean => {
        throw new RangeError('should not be called');
      });
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_0400
     * @tc.name int8ArrayEveryPart03Test004
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array(0);
      arr.every((element: number): boolean => {
        count = count + 1;
        return true;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_0500
     * @tc.name int8ArrayEveryPart03Test005
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flag: boolean = false;
      let arr: Int8Array = new Int8Array(0);
      arr.every((element: number): boolean => {
        flag = true;
        return true;
      });
      expect(flag).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_0600
     * @tc.name int8ArrayEveryPart03Test006
     * @tc.desc Verify new ArrayBuffer(0) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Int8Array = new Int8Array(buf);
      let result: boolean = arr.every((element: number): boolean => true);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_0700
     * @tc.name int8ArrayEveryPart03Test007
     * @tc.desc Verify array.$_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: boolean = arr.every((element: number, index: int, array: Int8Array): boolean => {
        return array.$_get(0) === 0;
      });
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_0800
     * @tc.name int8ArrayEveryPart03Test008
     * @tc.desc Verify int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let state: int[] = [0];
      let arr: Int8Array = new Int8Array(0);
      arr.every((element: number): boolean => {
        state[0] = 99;
        return true;
      });
      expect(state[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_0900
     * @tc.name int8ArrayEveryPart03Test009
     * @tc.desc Verify TypeError true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: boolean = arr.every((element: number): boolean => {
        throw new TypeError('should not be called');
      });
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_1000
     * @tc.name int8ArrayEveryPart03Test010
     * @tc.desc Verify index lastIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lastIndex: int = -1;
      let arr: Int8Array = new Int8Array(0);
      arr.every((element: number, index: int): boolean => {
        lastIndex = index;
        return true;
      });
      expect(lastIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_1100
     * @tc.name int8ArrayEveryPart03Test011
     * @tc.desc Verify every() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      arr.every((element: number): boolean => true);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_1200
     * @tc.name int8ArrayEveryPart03Test012
     * @tc.desc Verify [5] true every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let result: boolean = arr.every((element: number): boolean => element > 0);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_1300
     * @tc.name int8ArrayEveryPart03Test013
     * @tc.desc Verify [5] false every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let result: boolean = arr.every((element: number): boolean => element > 10);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_1400
     * @tc.name int8ArrayEveryPart03Test014
     * @tc.desc Verify [5] RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      try {
        arr.every((element: number): boolean => {
          throw new RangeError('single element error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_1500
     * @tc.name int8ArrayEveryPart03Test015
     * @tc.desc Verify [5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([5]);
      arr.every((element: number): boolean => {
        count = count + 1;
        return true;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_1600
     * @tc.name int8ArrayEveryPart03Test016
     * @tc.desc Verify [-128] int8 -128 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128]);
      let result: boolean = arr.every((element: number): boolean => element === -128);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_1700
     * @tc.name int8ArrayEveryPart03Test017
     * @tc.desc Verify [127] int8 127 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX]);
      let result: boolean = arr.every((element: number): boolean => element === INT8_MAX);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_1800
     * @tc.name int8ArrayEveryPart03Test018
     * @tc.desc Verify [0] 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      let result: boolean = arr.every((element: number): boolean => element !== 0);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_1900
     * @tc.name int8ArrayEveryPart03Test019
     * @tc.desc Verify [5] TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      try {
        arr.every((element: number): boolean => {
          throw new TypeError('type error on single');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_2000
     * @tc.name int8ArrayEveryPart03Test020
     * @tc.desc Verify [5] index===0 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([5]);
      try {
        arr.every((element: number, index: int): boolean => {
          count = count + 1;
          if (index === 0) {
            throw new RangeError('at index 0');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(count).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_2100
     * @tc.name int8ArrayEveryPart03Test021
     * @tc.desc Verify [0,0,0] === 0 true 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      let result: boolean = arr.every((element: number): boolean => {
        count = count + 1;
        return element === 0;
      });
      expect(result).assertEqual(true);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_2200
     * @tc.name int8ArrayEveryPart03Test022
     * @tc.desc Verify [0,0,0] !== 0 false 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      let result: boolean = arr.every((element: number): boolean => {
        count = count + 1;
        return element !== 0;
      });
      expect(result).assertEqual(false);
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_2300
     * @tc.name int8ArrayEveryPart03Test023
     * @tc.desc Verify [127,127,127] > 100 true 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MAX, INT8_MAX]);
      let result: boolean = arr.every((element: number): boolean => {
        count = count + 1;
        return element > 100;
      });
      expect(result).assertEqual(true);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_2400
     * @tc.name int8ArrayEveryPart03Test024
     * @tc.desc Verify [-128,-128,-128] > 0 false 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([-128, -128, -128]);
      let result: boolean = arr.every((element: number): boolean => {
        count = count + 1;
        return element > 0;
      });
      expect(result).assertEqual(false);
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_2500
     * @tc.name int8ArrayEveryPart03Test025
     * @tc.desc Verify [1,1,1,1,1] === 1 true 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([1, 1, 1, 1, 1]);
      let result: boolean = arr.every((element: number): boolean => {
        count = count + 1;
        return element === 1;
      });
      expect(result).assertEqual(true);
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_2600
     * @tc.name int8ArrayEveryPart03Test026
     * @tc.desc Verify [5,5,5] element===5 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5]);
      try {
        arr.every((element: number): boolean => {
          if (element === 5) {
            throw new RangeError('element is 5');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_2700
     * @tc.name int8ArrayEveryPart03Test027
     * @tc.desc Verify 100 new Int8Array(100) true 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array(100);
      let result: boolean = arr.every((element: number): boolean => {
        count = count + 1;
        return true;
      });
      expect(result).assertEqual(true);
      expect(count).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_2800
     * @tc.name int8ArrayEveryPart03Test028
     * @tc.desc Verify [0,0,0,0,0] false 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([0, 0, 0, 0, 0]);
      let result: boolean = arr.every((element: number): boolean => {
        count = count + 1;
        return false;
      });
      expect(result).assertEqual(false);
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_2900
     * @tc.name int8ArrayEveryPart03Test029
     * @tc.desc Verify [42,42,42] === 42 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42, 42, 42]);
      let result: boolean = arr.every((element: number): boolean => element === 42);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_3000
     * @tc.name int8ArrayEveryPart03Test030
     * @tc.desc Verify [-1,-1,-1] < 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, -1, -1]);
      let result: boolean = arr.every((element: number): boolean => element < 0);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_3100
     * @tc.name int8ArrayEveryPart03Test031
     * @tc.desc Verify RangeError e.name === 'RangeError'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.every((element: number): boolean => {
          throw new RangeError('range error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_3200
     * @tc.name int8ArrayEveryPart03Test032
     * @tc.desc Verify TypeError e.name === 'TypeError'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.every((element: number): boolean => {
          throw new TypeError('type error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_3300
     * @tc.name int8ArrayEveryPart03Test033
     * @tc.desc Verify Error e.name === 'Error'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.every((element: number): boolean => {
          throw new Error('generic error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_3400
     * @tc.name int8ArrayEveryPart03Test034
     * @tc.desc Verify RangeError message e.message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.every((element: number): boolean => {
          throw new RangeError('custom range message');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.message).assertEqual('custom range message');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_3500
     * @tc.name int8ArrayEveryPart03Test035
     * @tc.desc Verify TypeError message e.message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.every((element: number): boolean => {
          throw new TypeError('custom type message');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.message).assertEqual('custom type message');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_3600
     * @tc.name int8ArrayEveryPart03Test036
     * @tc.desc Verify Error message e.message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.every((element: number): boolean => {
          throw new Error('custom error message');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.message).assertEqual('custom error message');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_3700
     * @tc.name int8ArrayEveryPart03Test037
     * @tc.desc Verify 5 index===0 RangeError 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      try {
        arr.every((element: number, index: int): boolean => {
          count = count + 1;
          if (index === 0) {
            throw new RangeError('at first');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(count).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_3800
     * @tc.name int8ArrayEveryPart03Test038
     * @tc.desc Verify 5 index===2 RangeError 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      try {
        arr.every((element: number, index: int): boolean => {
          count = count + 1;
          if (index === 2) {
            throw new RangeError('at middle');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(count).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_3900
     * @tc.name int8ArrayEveryPart03Test039
     * @tc.desc Verify 5 index===4 RangeError 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      try {
        arr.every((element: number, index: int): boolean => {
          count = count + 1;
          if (index === 4) {
            throw new RangeError('at last');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(count).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_4000
     * @tc.name int8ArrayEveryPart03Test040
     * @tc.desc Verify index===0 TypeError 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([7]);
      try {
        arr.every((element: number, index: int): boolean => {
          count = count + 1;
          if (index === 0) {
            throw new TypeError('single throw');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(count).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_4100
     * @tc.name int8ArrayEveryPart03Test041
     * @tc.desc Verify 100 index===99 RangeError 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array(100);
      try {
        arr.every((element: number, index: int): boolean => {
          count = count + 1;
          if (index === 99) {
            throw new RangeError('at last of 100');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(count).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_4200
     * @tc.name int8ArrayEveryPart03Test042
     * @tc.desc Verify 7 index===3 Error 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50, 60, 70]);
      try {
        arr.every((element: number, index: int): boolean => {
          count = count + 1;
          if (index === 3) {
            throw new Error('at middle of 7');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(count).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_4300
     * @tc.name int8ArrayEveryPart03Test043
     * @tc.desc Verify element<0 RangeError [10,-5,20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, -5, 20]);
      try {
        arr.every((element: number): boolean => {
          if (element < 0) {
            throw new RangeError('negative element');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_4400
     * @tc.name int8ArrayEveryPart03Test044
     * @tc.desc Verify element===-128 TypeError [0,1,-128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, -128]);
      try {
        arr.every((element: number): boolean => {
          if (element === -128) {
            throw new TypeError('min int8 value');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_4500
     * @tc.name int8ArrayEveryPart03Test045
     * @tc.desc Verify element===127 RangeError [0,1,127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, INT8_MAX]);
      try {
        arr.every((element: number): boolean => {
          if (element === INT8_MAX) {
            throw new RangeError('max int8 value');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_4600
     * @tc.name int8ArrayEveryPart03Test046
     * @tc.desc Verify element===0 Error [1,2,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 0]);
      try {
        arr.every((element: number): boolean => {
          if (element === 0) {
            throw new Error('zero element found');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_4700
     * @tc.name int8ArrayEveryPart03Test047
     * @tc.desc Verify index===2 RangeError [1,2,3,4] 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      try {
        arr.every((element: number, index: int): boolean => {
          count = count + 1;
          if (index === 2) {
            throw new RangeError('at index 2');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(count).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_4800
     * @tc.name int8ArrayEveryPart03Test048
     * @tc.desc Verify array.length>2 TypeError [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.every((element: number, index: int, array: Int8Array): boolean => {
          if (array.length > 2) {
            throw new TypeError('array too long');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_4900
     * @tc.name int8ArrayEveryPart03Test049
     * @tc.desc Verify index===1 flag flag true Error [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flag: boolean = false;
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.every((element: number, index: int): boolean => {
          if (index === 1) {
            flag = true;
          }
          if (flag) {
            throw new Error('flag set at index 1');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_5000
     * @tc.name int8ArrayEveryPart03Test050
     * @tc.desc Verify false every false 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((element: number): boolean => {
        count = count + 1;
        return false;
      });
      expect(result).assertEqual(false);
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_5100
     * @tc.name int8ArrayEveryPart03Test051
     * @tc.desc Verify false RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([0, 1, 2]);
      let result: boolean = arr.every((element: number, index: int): boolean => {
        count = count + 1;
        if (index > 0) {
          throw new RangeError('should not reach');
        }
        return false;
      });
      expect(result).assertEqual(false);
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_5200
     * @tc.name int8ArrayEveryPart03Test052
     * @tc.desc Verify false every false 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([1, 0, 2]);
      let result: boolean = arr.every((element: number): boolean => {
        count = count + 1;
        return element !== 0;
      });
      expect(result).assertEqual(false);
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_5300
     * @tc.name int8ArrayEveryPart03Test053
     * @tc.desc Verify false every false 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([1, 2, 0]);
      let result: boolean = arr.every((element: number): boolean => {
        count = count + 1;
        return element !== 0;
      });
      expect(result).assertEqual(false);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_5400
     * @tc.name int8ArrayEveryPart03Test054
     * @tc.desc Verify true every true 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((element: number): boolean => {
        count = count + 1;
        return element > 0;
      });
      expect(result).assertEqual(true);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_5500
     * @tc.name int8ArrayEveryPart03Test055
     * @tc.desc Verify 100 -1 >=0 false 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array(100);
      arr.$_set(0, -1);
      let result: boolean = arr.every((element: number): boolean => {
        count = count + 1;
        return element >= 0;
      });
      expect(result).assertEqual(false);
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_5600
     * @tc.name int8ArrayEveryPart03Test056
     * @tc.desc Verify false index 0 vs index 2 1 vs 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Int8Array = new Int8Array([0, 1, 2]);
      let count1: int = 0;
      arr1.every((element: number): boolean => {
        count1 = count1 + 1;
        return element !== 0;
      });
      let arr2: Int8Array = new Int8Array([1, 2, 0]);
      let count2: int = 0;
      arr2.every((element: number): boolean => {
        count2 = count2 + 1;
        return element !== 0;
      });
      expect(count1).assertEqual(1);
      expect(count2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_5700
     * @tc.name int8ArrayEveryPart03Test057
     * @tc.desc Verify true maxIndex maxIndex=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxIndex: int = -1;
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.every((element: number, index: int): boolean => {
        maxIndex = index;
        return true;
      });
      expect(maxIndex).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_5800
     * @tc.name int8ArrayEveryPart03Test058
     * @tc.desc Verify element false log=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let log: number = 0;
      let arr: Int8Array = new Int8Array([1, 2, 0, 4, 5]);
      arr.every((element: number, index: int, array: Int8Array): boolean => {
        log = log + element;
        return element !== 0;
      });
      expect(log).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_5900
     * @tc.name int8ArrayEveryPart03Test059
     * @tc.desc Verify 100 index 50 -1 >=0 false 51
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array(100);
      arr.$_set(50, -1);
      let result: boolean = arr.every((element: number): boolean => {
        count = count + 1;
        return element >= 0;
      });
      expect(result).assertEqual(false);
      expect(count).assertEqual(51);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_6000
     * @tc.name int8ArrayEveryPart03Test060
     * @tc.desc Verify array.$_set every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((element: number, index: int, array: Int8Array): boolean => {
        array.$_set(index, element * 2);
        return true;
      });
      expect(result).assertEqual(true);
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(4);
      expect(arr.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_6100
     * @tc.name int8ArrayEveryPart03Test061
     * @tc.desc Verify sum index===1 RangeError sum sum=30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: number = 0;
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      try {
        arr.every((element: number, index: int, array: Int8Array): boolean => {
          sum = sum + element;
          if (index === 1) {
            throw new RangeError('partial sum error');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(sum).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_6200
     * @tc.name int8ArrayEveryPart03Test062
     * @tc.desc Verify threshold +1 element<=threshold true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threshold: int = 0;
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((element: number): boolean => {
        threshold = threshold + 1;
        return element <= threshold;
      });
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_6300
     * @tc.name int8ArrayEveryPart03Test063
     * @tc.desc Verify Int8Array every() every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer: Int8Array = new Int8Array([1, 2, 3]);
      let inner: Int8Array = new Int8Array([4, 5]);
      let innerCalled: int = 0;
      let result: boolean = outer.every((element: number): boolean => {
        inner.every((e: number): boolean => {
          innerCalled = innerCalled + 1;
          return e > 0;
        });
        return element > 0;
      });
      expect(result).assertEqual(true);
      expect(innerCalled).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_6400
     * @tc.name int8ArrayEveryPart03Test064
     * @tc.desc Verify sum sum>50 RangeError [20,30,40] sum=90
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: number = 0;
      let arr: Int8Array = new Int8Array([20, 30, 40]);
      try {
        arr.every((element: number, index: int, array: Int8Array): boolean => {
          sum = sum + element;
          if (sum > 50) {
            throw new RangeError('sum overflow');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(sum).assertEqual(90);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_6500
     * @tc.name int8ArrayEveryPart03Test065
     * @tc.desc Verify array.length true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let len: int = 0;
      arr.every((element: number, index: int, array: Int8Array): boolean => {
        len = array.length;
        return true;
      });
      expect(len).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_6600
     * @tc.name int8ArrayEveryPart03Test066
     * @tc.desc Verify element positives 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positives: int = 0;
      let arr: Int8Array = new Int8Array([1, -2, 3, -4, 5]);
      arr.every((element: number): boolean => {
        if (element > 0) {
          positives = positives + 1;
        }
        return true;
      });
      expect(positives).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_6700
     * @tc.name int8ArrayEveryPart03Test067
     * @tc.desc Verify array.$_set Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let modified: boolean = false;
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      try {
        arr.every((element: number, index: int, array: Int8Array): boolean => {
          array.$_set(index, 0);
          if (index === 2) {
            modified = true;
            throw new Error('stop after modify');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(modified).assertTrue();
        expect(arr.$_get(2)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_6800
     * @tc.name int8ArrayEveryPart03Test068
     * @tc.desc Verify [-128,127,0] element===-128 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, INT8_MAX, 0]);
      try {
        arr.every((element: number): boolean => {
          if (element === -128) {
            throw new RangeError('min value at first');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_6900
     * @tc.name int8ArrayEveryPart03Test069
     * @tc.desc Verify [1,2,-128] element===-128 RangeError =3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([1, 2, -128]);
      try {
        arr.every((element: number): boolean => {
          count = count + 1;
          if (element === -128) {
            throw new RangeError('min at third');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(count).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_7000
     * @tc.name int8ArrayEveryPart03Test070
     * @tc.desc Verify [127,-128] >0 -128 false =2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([INT8_MAX, -128]);
      let result: boolean = arr.every((element: number): boolean => {
        count = count + 1;
        return element > 0;
      });
      expect(result).assertEqual(false);
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_7100
     * @tc.name int8ArrayEveryPart03Test071
     * @tc.desc Verify [0,0,-1] element<0 TypeError =3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([0, 0, -1]);
      try {
        arr.every((element: number): boolean => {
          count = count + 1;
          if (element < 0) {
            throw new TypeError('negative found');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(count).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_7200
     * @tc.name int8ArrayEveryPart03Test072
     * @tc.desc Verify [-128] element===-128 Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128]);
      try {
        arr.every((element: number): boolean => {
          if (element === -128) {
            throw new Error('min single element');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

  });
}
