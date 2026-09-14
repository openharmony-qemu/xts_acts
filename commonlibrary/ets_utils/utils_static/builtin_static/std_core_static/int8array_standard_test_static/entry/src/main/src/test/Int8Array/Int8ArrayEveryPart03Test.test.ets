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

export default function int8ArrayEveryPart03Test(): void {
  describe('Int8ArrayEveryPart03Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_0100
     * @tc.name int8ArrayEveryPart03Test001
     * @tc.desc Verify every on empty array returns true, callback () => true, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: boolean = arr.every((element: number): boolean => {
        if (element < INT8_MIN || element > INT8_MAX) {
          return false;
        }
        return true;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_0200
     * @tc.name int8ArrayEveryPart03Test002
     * @tc.desc Verify every on empty array returns true, callback () => false, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: boolean = arr.every((element: number): boolean => {
        if (element < INT8_MIN || element > INT8_MAX) {
          return false;
        }
        return false;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_0300
     * @tc.name int8ArrayEveryPart03Test003
     * @tc.desc Verify every on empty array returns true, callback throws RangeError, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: boolean = arr.every((element: number): boolean => {
        if (element < INT8_MIN || element > INT8_MAX) {
          return false;
        }
        throw new RangeError('should not be called');
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_0400
     * @tc.name int8ArrayEveryPart03Test004
     * @tc.desc Verify every callback not invoked on empty array, counter 0, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array(0);
      const result: boolean = arr.every((element: number): boolean => {
        if (element < INT8_MIN || element > INT8_MAX) {
          return false;
        }
        count = count + 1;
        return true;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_0500
     * @tc.name int8ArrayEveryPart03Test005
     * @tc.desc Verify every on empty array never invokes callback, side-effect flag stays false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flag: boolean = false;
      let arr: Int8Array = new Int8Array(0);
      const result: boolean = arr.every((element: number): boolean => {
        if (element < INT8_MIN || element > INT8_MAX) {
          return false;
        }
        flag = true;
        return true;
      });
      expect(result).assertTrue();
      expect(flag).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_0600
     * @tc.name int8ArrayEveryPart03Test006
     * @tc.desc Verify every on ArrayBuffer view returns true on new Int8Array(buf)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Int8Array = new Int8Array(buf);
      let result: boolean = arr.every((element: number): boolean => {
        if (element < INT8_MIN || element > INT8_MAX) {
          return false;
        }
        return true;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_0700
     * @tc.name int8ArrayEveryPart03Test007
     * @tc.desc Verify every on empty new Int8Array(0) returns true without invoking $_get(0) callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: boolean = arr.every((element: number, _index: int, array: Int8Array): boolean => {
        if (element < INT8_MIN || element > INT8_MAX) {
          return false;
        }
        return array.$_get(0) === 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_0800
     * @tc.name int8ArrayEveryPart03Test008
     * @tc.desc Verify every callback side effect absent on empty array, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let state: int[] = [0];
      let arr: Int8Array = new Int8Array(0);
      const result: boolean = arr.every((element: number): boolean => {
        if (element < INT8_MIN || element > INT8_MAX) {
          return false;
        }
        state[0] = 99;
        return true;
      });
      expect(result).assertTrue();
      expect(state[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_0900
     * @tc.name int8ArrayEveryPart03Test009
     * @tc.desc Verify every on empty array returns true, callback throws TypeError, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: boolean = arr.every((element: number): boolean => {
        if (element < INT8_MIN || element > INT8_MAX) {
          return false;
        }
        throw new TypeError('should not be called');
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_1000
     * @tc.name int8ArrayEveryPart03Test010
     * @tc.desc Verify every on empty array does not invoke callback, lastIndex stays -1, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lastIndex: int = -1;
      let arr: Int8Array = new Int8Array(0);
      const result: boolean = arr.every((element: number, index: int): boolean => {
        if (element < INT8_MIN || element > INT8_MAX) {
          return false;
        }
        lastIndex = index;
        return true;
      });
      expect(result).assertTrue();
      expect(lastIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_1100
     * @tc.name int8ArrayEveryPart03Test011
     * @tc.desc Verify every returns true with length 0 on empty array, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: boolean = arr.every((element: number): boolean => {
        if (element < INT8_MIN || element > INT8_MAX) {
          return false;
        }
        return true;
      });
      expect(result).assertTrue();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_1200
     * @tc.name int8ArrayEveryPart03Test012
     * @tc.desc Verify every predicate element > 0 returns true on new Int8Array([5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let result: boolean = arr.every((element: number): boolean => element > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_1300
     * @tc.name int8ArrayEveryPart03Test013
     * @tc.desc Verify every returns false when no element satisfies predicate: with every((element: number): boolean => element > 10) on new Int8Array([5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let result: boolean = arr.every((element: number): boolean => element > 10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_1400
     * @tc.name int8ArrayEveryPart03Test014
     * @tc.desc Verify every propagates RangeError thrown in callback on new Int8Array([5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      try {
        const result: boolean = arr.every((element: number): boolean => {
          throw new RangeError('single element error');
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_1500
     * @tc.name int8ArrayEveryPart03Test015
     * @tc.desc Verify every invokes callback once for single element, on new Int8Array([5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([5]);
      const result: boolean = arr.every((element: number): boolean => {
        if (element < INT8_MIN || element > INT8_MAX) {
          return false;
        }
        count = count + 1;
        return true;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_1600
     * @tc.name int8ArrayEveryPart03Test016
     * @tc.desc Verify every predicate element === INT8_MIN returns true on new Int8Array([INT8_MIN])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN]);
      let result: boolean = arr.every((element: number): boolean => element === INT8_MIN);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_1700
     * @tc.name int8ArrayEveryPart03Test017
     * @tc.desc Verify every predicate element === INT8_MAX returns true on new Int8Array([INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX]);
      let result: boolean = arr.every((element: number): boolean => element === INT8_MAX);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_1800
     * @tc.name int8ArrayEveryPart03Test018
     * @tc.desc Verify every predicate element !== 0 returns false on new Int8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      let result: boolean = arr.every((element: number): boolean => element !== 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_1900
     * @tc.name int8ArrayEveryPart03Test019
     * @tc.desc Verify every propagates TypeError thrown in callback on new Int8Array([5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      try {
        const result: boolean = arr.every((element: number): boolean => {
          if (element < INT8_MIN || element > INT8_MAX) {
            return false;
          }
          throw new TypeError('type error on single');
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_2000
     * @tc.name int8ArrayEveryPart03Test020
     * @tc.desc Verify every propagates RangeError thrown in callback on first element on new Int8Array([5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([5]);
      try {
        const result: boolean = arr.every((element: number, index: int): boolean => {
          if (element < INT8_MIN || element > INT8_MAX) {
            return false;
          }
          count = count + 1;
          if (index === 0) {
            throw new RangeError('at index 0');
          }
          return true;
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(count).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_2100
     * @tc.name int8ArrayEveryPart03Test021
     * @tc.desc Verify every predicate element === 0 returns true with 3 calls on new Int8Array([0, 0, 0])
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
      expect(result).assertTrue();
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_2200
     * @tc.name int8ArrayEveryPart03Test022
     * @tc.desc Verify every predicate element !== 0 returns false with 1 call on new Int8Array([0, 0, 0])
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
      expect(result).assertFalse();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_2300
     * @tc.name int8ArrayEveryPart03Test023
     * @tc.desc Verify every returns true when all elements satisfy predicate: with every((element: number): boolean => element > 100) on new Int8Array([INT8_MAX, INT8_MAX, INT8_MAX]), returns 3
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
      expect(result).assertTrue();
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_2400
     * @tc.name int8ArrayEveryPart03Test024
     * @tc.desc Verify every predicate element > 0 returns false with 1 call on new Int8Array([INT8_MIN, INT8_MIN, INT8_MIN])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MIN, INT8_MIN]);
      let result: boolean = arr.every((element: number): boolean => {
        count = count + 1;
        return element > 0;
      });
      expect(result).assertFalse();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_2500
     * @tc.name int8ArrayEveryPart03Test025
     * @tc.desc Verify every returns true when all elements satisfy predicate: with every((element: number): boolean => element === 1) on new Int8Array([1, 1, 1, 1, 1]), returns 5
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
      expect(result).assertTrue();
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_2600
     * @tc.name int8ArrayEveryPart03Test026
     * @tc.desc Verify every throws RangeError when predicate callback throws on matching element: with element === 5 on new Int8Array([5, 5, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5]);
      try {
        const result: boolean = arr.every((element: number): boolean => {
          if (element === 5) {
            throw new RangeError('element is 5');
          }
          return true;
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_2700
     * @tc.name int8ArrayEveryPart03Test027
     * @tc.desc Verify every with always-true predicate returns true with 100 calls on new Int8Array(100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array(100);
      let result: boolean = arr.every((element: number): boolean => {
        if (element < INT8_MIN || element > INT8_MAX) {
          return false;
        }
        count = count + 1;
        return true;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_2800
     * @tc.name int8ArrayEveryPart03Test028
     * @tc.desc Verify every with always-false predicate returns false with 1 call on new Int8Array([0, 0, 0, 0, 0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([0, 0, 0, 0, 0]);
      let result: boolean = arr.every((element: number): boolean => {
        if (element < INT8_MIN || element > INT8_MAX) {
          return false;
        }
        count = count + 1;
        return false;
      });
      expect(result).assertFalse();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_2900
     * @tc.name int8ArrayEveryPart03Test029
     * @tc.desc Verify every returns true when all elements satisfy predicate: with every((element: number): boolean => element === 42) on new Int8Array([42, 42, 42])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42, 42, 42]);
      let result: boolean = arr.every((element: number): boolean => element === 42);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_3000
     * @tc.name int8ArrayEveryPart03Test030
     * @tc.desc Verify every predicate element < 0 returns true on new Int8Array([-1, -1, -1])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, -1, -1]);
      let result: boolean = arr.every((element: number): boolean => element < 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_3100
     * @tc.name int8ArrayEveryPart03Test031
     * @tc.desc Verify every throws RangeError with e.name assertion only, callback throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        const result: boolean = arr.every((element: number): boolean => {
          if (element < INT8_MIN || element > INT8_MAX) {
            return false;
          }
          throw new RangeError('range error');
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_3200
     * @tc.name int8ArrayEveryPart03Test032
     * @tc.desc Verify every throws TypeError with e.name assertion only, callback throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        const result: boolean = arr.every((element: number): boolean => {
          if (element < INT8_MIN || element > INT8_MAX) {
            return false;
          }
          throw new TypeError('type error');
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_3300
     * @tc.name int8ArrayEveryPart03Test033
     * @tc.desc Verify every throws Error with e.name assertion only, callback throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        const result: boolean = arr.every((element: number): boolean => {
          if (element < INT8_MIN || element > INT8_MAX) {
            return false;
          }
          throw new Error('generic error');
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_3400
     * @tc.name int8ArrayEveryPart03Test034
     * @tc.desc Verify every throws RangeError with e.name and e.message assertions, callback throws custom message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        const result: boolean = arr.every((element: number): boolean => {
          if (element < INT8_MIN || element > INT8_MAX) {
            return false;
          }
          throw new RangeError('custom range message');
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(e.message).assertEqual('custom range message');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_3500
     * @tc.name int8ArrayEveryPart03Test035
     * @tc.desc Verify every throws TypeError with e.name and e.message assertions, callback throws custom message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        const result: boolean = arr.every((element: number): boolean => {
          if (element < INT8_MIN || element > INT8_MAX) {
            return false;
          }
          throw new TypeError('custom type message');
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(e.message).assertEqual('custom type message');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_3600
     * @tc.name int8ArrayEveryPart03Test036
     * @tc.desc Verify every throws Error with e.name and e.message assertions, callback throws custom message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        const result: boolean = arr.every((element: number): boolean => {
          if (element < INT8_MIN || element > INT8_MAX) {
            return false;
          }
          throw new Error('custom error message');
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('custom error message');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_3700
     * @tc.name int8ArrayEveryPart03Test037
     * @tc.desc Verify every throws RangeError at index 0, on new Int8Array([1, 2, 3, 4, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      try {
        const result: boolean = arr.every((element: number, index: int): boolean => {
          if (element < INT8_MIN || element > INT8_MAX) {
            return false;
          }
          count = count + 1;
          if (index === 0) {
            throw new RangeError('at first');
          }
          return true;
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(count).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_3800
     * @tc.name int8ArrayEveryPart03Test038
     * @tc.desc Verify every throws RangeError at index 2, on new Int8Array([1, 2, 3, 4, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      try {
        const result: boolean = arr.every((element: number, index: int): boolean => {
          if (element < INT8_MIN || element > INT8_MAX) {
            return false;
          }
          count = count + 1;
          if (index === 2) {
            throw new RangeError('at middle');
          }
          return true;
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(count).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_3900
     * @tc.name int8ArrayEveryPart03Test039
     * @tc.desc Verify every throws RangeError at index 4, on new Int8Array([1, 2, 3, 4, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      try {
        const result: boolean = arr.every((element: number, index: int): boolean => {
          if (element < INT8_MIN || element > INT8_MAX) {
            return false;
          }
          count = count + 1;
          if (index === 4) {
            throw new RangeError('at last');
          }
          return true;
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(count).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_4000
     * @tc.name int8ArrayEveryPart03Test040
     * @tc.desc Verify every propagates TypeError thrown in callback on first element on new Int8Array([7])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([7]);
      try {
        const result: boolean = arr.every((element: number, index: int): boolean => {
          if (element < INT8_MIN || element > INT8_MAX) {
            return false;
          }
          count = count + 1;
          if (index === 0) {
            throw new TypeError('single throw');
          }
          return true;
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(count).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_4100
     * @tc.name int8ArrayEveryPart03Test041
     * @tc.desc Verify every propagates RangeError thrown at 100th element on new Int8Array(100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array(100);
      try {
        const result: boolean = arr.every((element: number, index: int): boolean => {
          if (element < INT8_MIN || element > INT8_MAX) {
            return false;
          }
          count = count + 1;
          if (index === 99) {
            throw new RangeError('at last of 100');
          }
          return true;
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(count).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_4200
     * @tc.name int8ArrayEveryPart03Test042
     * @tc.desc Verify every propagates Error thrown at 4th element on new Int8Array([10, 20, 30, 40, 50, 60, 70])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50, 60, 70]);
      try {
        const result: boolean = arr.every((element: number, index: int): boolean => {
          if (element < INT8_MIN || element > INT8_MAX) {
            return false;
          }
          count = count + 1;
          if (index === 3) {
            throw new Error('at middle of 7');
          }
          return true;
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(count).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_4300
     * @tc.name int8ArrayEveryPart03Test043
     * @tc.desc Verify every propagates RangeError thrown in callback on new Int8Array([10, -5, 20])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, -5, 20]);
      try {
        const result: boolean = arr.every((element: number): boolean => {
          if (element < 0) {
            throw new RangeError('negative element');
          }
          return true;
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_4400
     * @tc.name int8ArrayEveryPart03Test044
     * @tc.desc Verify every propagates TypeError thrown in callback on new Int8Array([0, 1, INT8_MIN])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, INT8_MIN]);
      try {
        const result: boolean = arr.every((element: number): boolean => {
          if (element === INT8_MIN) {
            throw new TypeError('min int8 value');
          }
          return true;
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_4500
     * @tc.name int8ArrayEveryPart03Test045
     * @tc.desc Verify every propagates RangeError thrown in callback on new Int8Array([0, 1, INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, INT8_MAX]);
      try {
        const result: boolean = arr.every((element: number): boolean => {
          if (element === INT8_MAX) {
            throw new RangeError('max int8 value');
          }
          return true;
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_4600
     * @tc.name int8ArrayEveryPart03Test046
     * @tc.desc Verify every propagates Error thrown in callback on new Int8Array([1, 2, 0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 0]);
      try {
        const result: boolean = arr.every((element: number): boolean => {
          if (element === 0) {
            throw new Error('zero element found');
          }
          return true;
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_4700
     * @tc.name int8ArrayEveryPart03Test047
     * @tc.desc Verify every propagates RangeError thrown at 3rd element on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      try {
        const result: boolean = arr.every((element: number, index: int): boolean => {
          if (element < INT8_MIN || element > INT8_MAX) {
            return false;
          }
          count = count + 1;
          if (index === 2) {
            throw new RangeError('at index 2');
          }
          return true;
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(count).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_4800
     * @tc.name int8ArrayEveryPart03Test048
     * @tc.desc Verify every propagates TypeError thrown in callback on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        const result: boolean = arr.every((element: number, _index: int, array: Int8Array): boolean => {
          if (element < INT8_MIN || element > INT8_MAX) {
            return false;
          }
          if (array.length > 2) {
            throw new TypeError('array too long');
          }
          return true;
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_4900
     * @tc.name int8ArrayEveryPart03Test049
     * @tc.desc Verify every propagates Error thrown in callback on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flag: boolean = false;
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        const result: boolean = arr.every((element: number, index: int): boolean => {
          if (element < INT8_MIN || element > INT8_MAX) {
            return false;
          }
          if (index === 1) {
            flag = true;
          }
          if (flag) {
            throw new Error('flag set at index 1');
          }
          return true;
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_5000
     * @tc.name int8ArrayEveryPart03Test050
     * @tc.desc Verify every predicate element > 0 returns false with 1 call on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((element: number): boolean => {
        if (element < INT8_MIN || element > INT8_MAX) {
          return false;
        }
        count = count + 1;
        return false;
      });
      expect(result).assertFalse();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_5100
     * @tc.name int8ArrayEveryPart03Test051
     * @tc.desc Verify every returns false with 1 call when element 0 fails predicate on new Int8Array([0, 1, 2])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([0, 1, 2]);
      let result: boolean = arr.every((element: number, index: int): boolean => {
        if (element < INT8_MIN || element > INT8_MAX) {
          return false;
        }
        count = count + 1;
        if (index > 0) {
          throw new RangeError('should not reach');
        }
        return false;
      });
      expect(result).assertFalse();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_5200
     * @tc.name int8ArrayEveryPart03Test052
     * @tc.desc Verify every returns false with 2 calls when element 0 fails predicate on new Int8Array([1, 0, 2])
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
      expect(result).assertFalse();
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_5300
     * @tc.name int8ArrayEveryPart03Test053
     * @tc.desc Verify every returns false with 3 calls when element 0 fails predicate on new Int8Array([1, 2, 0])
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
      expect(result).assertFalse();
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_5400
     * @tc.name int8ArrayEveryPart03Test054
     * @tc.desc Verify every predicate element > 0 returns true with 3 calls on new Int8Array([1, 2, 3])
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
      expect(result).assertTrue();
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_5500
     * @tc.name int8ArrayEveryPart03Test055
     * @tc.desc Verify every returns false with 1 call when $_set(0, -1) element fails predicate on new Int8Array(100)
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
      expect(result).assertFalse();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_5600
     * @tc.name int8ArrayEveryPart03Test056
     * @tc.desc Verify every early-termination: count1=1 on [0,1,2], count2=3 on [1,2,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Int8Array = new Int8Array([0, 1, 2]);
      let count1: int = 0;
      const result: boolean = arr1.every((element: number): boolean => {
        count1 = count1 + 1;
        return element !== 0;
      });
      expect(result).assertFalse();
      let arr2: Int8Array = new Int8Array([1, 2, 0]);
      let count2: int = 0;
      const result2: boolean = arr2.every((element: number): boolean => {
        count2 = count2 + 1;
        return element !== 0;
      });
      expect(result2).assertFalse();
      expect(count1).assertEqual(1);
      expect(count2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_5700
     * @tc.name int8ArrayEveryPart03Test057
     * @tc.desc Verify every callback last index is 4, on new Int8Array([1, 2, 3, 4, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxIndex: int = -1;
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      const result: boolean = arr.every((element: number, index: int): boolean => {
        if (element < INT8_MIN || element > INT8_MAX) {
          return false;
        }
        maxIndex = index;
        return true;
      });
      expect(result).assertTrue();
      expect(maxIndex).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_5800
     * @tc.name int8ArrayEveryPart03Test058
     * @tc.desc Verify every callback sums elements to 3 before element 0 stops it on new Int8Array([1, 2, 0, 4, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let log: number = 0;
      let arr: Int8Array = new Int8Array([1, 2, 0, 4, 5]);
      const result: boolean = arr.every((element: number, _index: int, _array: Int8Array): boolean => {
        log = log + element;
        return element !== 0;
      });
      expect(result).assertFalse();
      expect(log).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_5900
     * @tc.name int8ArrayEveryPart03Test059
     * @tc.desc Verify every returns false with 51 calls when $_set(50, -1) element fails predicate on new Int8Array(100)
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
      expect(result).assertFalse();
      expect(count).assertEqual(51);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_6000
     * @tc.name int8ArrayEveryPart03Test060
     * @tc.desc Verify every callback doubling via $_set(index, element * 2) writes 2, 4, 6, on new Int8Array([1, 2, 3])
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
      expect(result).assertTrue();
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(4);
      expect(arr.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_6100
     * @tc.name int8ArrayEveryPart03Test061
     * @tc.desc Verify every propagates RangeError after callback sum reaches 30 on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: number = 0;
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      try {
        const result: boolean = arr.every((element: number, index: int, _array: Int8Array): boolean => {
          sum = sum + element;
          if (index === 1) {
            throw new RangeError('partial sum error');
          }
          return true;
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(sum).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_6200
     * @tc.name int8ArrayEveryPart03Test062
     * @tc.desc Verify every returns true when all elements satisfy dynamic threshold predicate: with every((element: number): boolean => element <= threshold) on new Int8Array([1, 2, 3])
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
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_6300
     * @tc.name int8ArrayEveryPart03Test063
     * @tc.desc Verify every outer callback runs inner every 6 times and returns true on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer: Int8Array = new Int8Array([1, 2, 3]);
      let inner: Int8Array = new Int8Array([4, 5]);
      let innerCalled: int = 0;
      let result: boolean = outer.every((element: number): boolean => {
        const result: boolean = inner.every((e: number): boolean => {
          innerCalled = innerCalled + 1;
          return e > 0;
        });
        expect(result).assertTrue();
        return element > 0;
      });
      expect(result).assertTrue();
      expect(innerCalled).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_6400
     * @tc.name int8ArrayEveryPart03Test064
     * @tc.desc Verify every propagates RangeError after callback sum reaches 90 on new Int8Array([20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: number = 0;
      let arr: Int8Array = new Int8Array([20, 30, 40]);
      try {
        const result: boolean = arr.every((element: number, _index: int, _array: Int8Array): boolean => {
          sum = sum + element;
          if (sum > 50) {
            throw new RangeError('sum overflow');
          }
          return true;
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(sum).assertEqual(90);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_6500
     * @tc.name int8ArrayEveryPart03Test065
     * @tc.desc Verify every callback array param length equals 3 on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let len: int = 0;
      const result: boolean = arr.every((element: number, _index: int, array: Int8Array): boolean => {
        if (element < INT8_MIN || element > INT8_MAX) {
          return false;
        }
        len = array.length;
        return true;
      });
      expect(result).assertTrue();
      expect(len).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_6600
     * @tc.name int8ArrayEveryPart03Test066
     * @tc.desc Verify every callback counts 3 positive elements on new Int8Array([1, -2, 3, -4, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positives: int = 0;
      let arr: Int8Array = new Int8Array([1, -2, 3, -4, 5]);
      const result: boolean = arr.every((element: number): boolean => {
        if (element > 0) {
          positives = positives + 1;
        }
        return true;
      });
      expect(result).assertTrue();
      expect(positives).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_6700
     * @tc.name int8ArrayEveryPart03Test067
     * @tc.desc Verify every propagates Error from callback after setting $_get(2) to 0 on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let modified: boolean = false;
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      try {
        const result: boolean = arr.every((element: number, index: int, array: Int8Array): boolean => {
          if (element < INT8_MIN || element > INT8_MAX) {
            return false;
          }
          array.$_set(index, 0);
          if (index === 2) {
            modified = true;
            throw new Error('stop after modify');
          }
          return true;
        });
        expect(result).assertTrue();
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
     * @tc.desc Verify every propagates RangeError thrown in callback on new Int8Array([INT8_MIN, INT8_MAX, 0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MAX, 0]);
      try {
        const result: boolean = arr.every((element: number): boolean => {
          if (element === INT8_MIN) {
            throw new RangeError('min value at first');
          }
          return true;
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_6900
     * @tc.name int8ArrayEveryPart03Test069
     * @tc.desc Verify every propagates RangeError thrown at 3rd element on new Int8Array([1, 2, INT8_MIN])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([1, 2, INT8_MIN]);
      try {
        const result: boolean = arr.every((element: number): boolean => {
          count = count + 1;
          if (element === INT8_MIN) {
            throw new RangeError('min at third');
          }
          return true;
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(count).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_7000
     * @tc.name int8ArrayEveryPart03Test070
     * @tc.desc Verify every predicate element > 0 returns false with 2 calls on new Int8Array([INT8_MAX, INT8_MIN])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MIN]);
      let result: boolean = arr.every((element: number): boolean => {
        count = count + 1;
        return element > 0;
      });
      expect(result).assertFalse();
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_7100
     * @tc.name int8ArrayEveryPart03Test071
     * @tc.desc Verify every propagates TypeError thrown at 3rd element on new Int8Array([0, 0, -1])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([0, 0, -1]);
      try {
        const result: boolean = arr.every((element: number): boolean => {
          count = count + 1;
          if (element < 0) {
            throw new TypeError('negative found');
          }
          return true;
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(count).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_7200
     * @tc.name int8ArrayEveryPart03Test072
     * @tc.desc Verify every propagates Error thrown in callback on new Int8Array([INT8_MIN])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN]);
      try {
        const result: boolean = arr.every((element: number): boolean => {
          if (element === INT8_MIN) {
            throw new Error('min single element');
          }
          return true;
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART03_TEST_7300
     * @tc.name int8ArrayEveryPart03Test073
     * @tc.desc Verify every propagates RangeError after callback sum reaches 60 on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: number = 0;
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      try {
        const result: boolean = arr.every((element: number, _index: int, _array: Int8Array): boolean => {
          sum = sum + element;
          if (sum > 50) {
            throw new RangeError('sum exceeded 50');
          }
          return true;
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(sum).assertEqual(60);
      }
    });
  });
}
