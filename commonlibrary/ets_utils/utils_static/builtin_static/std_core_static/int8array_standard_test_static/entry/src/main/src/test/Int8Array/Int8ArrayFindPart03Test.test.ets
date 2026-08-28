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

export default function int8ArrayFindPart03Test(): void {
  describe('Int8ArrayFindPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_0100
     * @tc.name int8ArrayFindPart03Test001
     * @tc.desc Verify find on empty array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 0;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_0200
     * @tc.name int8ArrayFindPart03Test002
     * @tc.desc Verify empty array find with always-true predicate returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: number | undefined = arr.find((_value: number, _index: int, _array: Int8Array): boolean => {
        if (_value < INT8_MIN || _value > INT8_MAX) {
          return false;
        }
        return true;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_0300
     * @tc.name int8ArrayFindPart03Test003
     * @tc.desc Verify empty array find with always-false predicate returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: number | undefined = arr.find((_value: number, _index: int, _array: Int8Array): boolean => {
        if (_value < INT8_MIN || _value > INT8_MAX) {
          return false;
        }
        return false;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_0400
     * @tc.name int8ArrayFindPart03Test004
     * @tc.desc Verify empty array find callback not executed, counter stays 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let count: int = 0;
      let result: number | undefined = arr.find((_value: number, _index: int, _array: Int8Array): boolean => {
        if (_value < INT8_MIN || _value > INT8_MAX) {
          return false;
        }
        count = count + 1;
        return true;
      });
      expect(count).assertEqual(0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_0500
     * @tc.name int8ArrayFindPart03Test005
     * @tc.desc Verify empty array find callback with throw not executed, returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: number | undefined = arr.find((_value: number, _index: int, _array: Int8Array): boolean => {
        if (_value < INT8_MIN || _value > INT8_MAX) {
          return false;
        }
        throw new Error('should-not-execute');
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_0600
     * @tc.name int8ArrayFindPart03Test006
     * @tc.desc Verify empty array find, original array length remains 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 0;
      });
      expect(result).assertUndefined();
      let r1: int = arr.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_0700
     * @tc.name int8ArrayFindPart03Test007
     * @tc.desc Verify empty array find predicate references external variable, callback not executed, external unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let external: int = 100;
      let result: number | undefined = arr.find((_value: number, _index: int, _array: Int8Array): boolean => {
        if (_value < INT8_MIN || _value > INT8_MAX) {
          return false;
        }
        external = 200;
        return true;
      });
      expect(external).assertEqual(100);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_0800
     * @tc.name int8ArrayFindPart03Test008
     * @tc.desc Verify empty array find consecutive calls both return undefined, no state side effects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let first: number | undefined = arr.find((_value: number, _index: int, _array: Int8Array): boolean => {
        if (_value < INT8_MIN || _value > INT8_MAX) {
          return false;
        }
        return true;
      });
      let second: number | undefined = arr.find((_value: number, _index: int, _array: Int8Array): boolean => {
        if (_value < INT8_MIN || _value > INT8_MAX) {
          return false;
        }
        return false;
      });
      expect(first).assertUndefined();
      expect(second).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_0900
     * @tc.name int8ArrayFindPart03Test009
     * @tc.desc Verify empty array find, predicate reads array.length but callback not invoked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let observed: int = -1;
      let result: number | undefined = arr.find((_value: number, _index: int, array: Int8Array): boolean => {
        if (_value < INT8_MIN || _value > INT8_MAX) {
          return false;
        }
        observed = array.length;
        return true;
      });
      expect(observed).assertEqual(-1);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_1000
     * @tc.name int8ArrayFindPart03Test010
     * @tc.desc Verify find expects 5 when value === 5, on Int8Array.of(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 5;
      });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_1100
     * @tc.name int8ArrayFindPart03Test011
     * @tc.desc Verify find with predicate element == 6 on Int8Array.of(5) returns undefined (no match)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 6;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_1200
     * @tc.name int8ArrayFindPart03Test012
     * @tc.desc Verify find expects 5, callback invoked once, on Int8Array.of(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5);
      let count: int = 0;
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        count = count + 1;
        return value === 5;
      });
      expect(count).assertEqual(1);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_1300
     * @tc.name int8ArrayFindPart03Test013
     * @tc.desc Verify find expects 5 when index === 0, on Int8Array.of(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5);
      let result: number | undefined = arr.find((_value: number, index: int, _array: Int8Array): boolean => {
        if (_value < INT8_MIN || _value > INT8_MAX) {
          return false;
        }
        return index === 0;
      });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_1400
     * @tc.name int8ArrayFindPart03Test014
     * @tc.desc Verify find expects 5 when index === array.length - 1, on Int8Array.of(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5);
      let result: number | undefined = arr.find((_value: number, index: int, array: Int8Array): boolean => {
        if (_value < INT8_MIN || _value > INT8_MAX) {
          return false;
        }
        return index === array.length - 1;
      });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_1500
     * @tc.name int8ArrayFindPart03Test015
     * @tc.desc Verify find returns undefined when index === 1, on Int8Array.of(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5);
      let result: number | undefined = arr.find((_value: number, index: int, _array: Int8Array): boolean => {
        if (_value < INT8_MIN || _value > INT8_MAX) {
          return false;
        }
        return index === 1;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_1600
     * @tc.name int8ArrayFindPart03Test016
     * @tc.desc Verify find returns undefined when index === -1, on Int8Array.of(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5);
      let result: number | undefined = arr.find((_value: number, index: int, _array: Int8Array): boolean => {
        if (_value < INT8_MIN || _value > INT8_MAX) {
          return false;
        }
        return index === -1;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_1700
     * @tc.name int8ArrayFindPart03Test017
     * @tc.desc Verify find with predicate element == -128 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        return value === -128;
      });
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_1800
     * @tc.name int8ArrayFindPart03Test018
     * @tc.desc Verify all-[127] length 3 find value===127 returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(INT8_MAX, INT8_MAX, INT8_MAX);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        return value === INT8_MAX;
      });
      expect(result).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_1900
     * @tc.name int8ArrayFindPart03Test019
     * @tc.desc Verify all-[-128] length 3 find value===-128 returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(INT8_MIN, INT8_MIN, INT8_MIN);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        return value === INT8_MIN;
      });
      expect(result).assertEqual(INT8_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_2000
     * @tc.name int8ArrayFindPart03Test020
     * @tc.desc Verify all-[0] length 3 find value===1 no match, returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 0, 0);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 1;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_2100
     * @tc.name int8ArrayFindPart03Test021
     * @tc.desc Verify all-[0] length 3 find no match, callback executes 3 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 0, 0);
      let count: int = 0;
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        count = count + 1;
        return value === 1;
      });
      expect(count).assertEqual(3);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_2200
     * @tc.name int8ArrayFindPart03Test022
     * @tc.desc Verify all-[5] length 3 find always-true returns first element, callback executes only once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 5, 5);
      let count: int = 0;
      let result: number | undefined = arr.find((_value: number, _index: int, _array: Int8Array): boolean => {
        if (_value < INT8_MIN || _value > INT8_MAX) {
          return false;
        }
        count = count + 1;
        return true;
      });
      expect(count).assertEqual(1);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_2300
     * @tc.name int8ArrayFindPart03Test023
     * @tc.desc Verify all-[7] length 3 find, match occurs at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 7, 7);
      let matchedIndex: int = -1;
      let result: number | undefined = arr.find((value: number, index: int, _array: Int8Array): boolean => {
        if (value === 7) {
          matchedIndex = index;
          return true;
        }
        return false;
      });
      expect(matchedIndex).assertEqual(0);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_2400
     * @tc.name int8ArrayFindPart03Test024
     * @tc.desc Verify find returns first matching element 7, on Int8Array.of(7, 7, 7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 7, 7);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 7;
      });
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_2500
     * @tc.name int8ArrayFindPart03Test025
     * @tc.desc Verify find returns undefined when index === -1, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: number | undefined = arr.find((_value: number, index: int, _array: Int8Array): boolean => {
        if (_value < INT8_MIN || _value > INT8_MAX) {
          return false;
        }
        return index === -1;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_2600
     * @tc.name int8ArrayFindPart03Test026
     * @tc.desc Verify find returns undefined when index === -3, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: number | undefined = arr.find((_value: number, index: int, _array: Int8Array): boolean => {
        if (_value < INT8_MIN || _value > INT8_MAX) {
          return false;
        }
        return index === -3;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_2700
     * @tc.name int8ArrayFindPart03Test027
     * @tc.desc Verify find returns undefined when index === -4, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: number | undefined = arr.find((_value: number, index: int, _array: Int8Array): boolean => {
        if (_value < INT8_MIN || _value > INT8_MAX) {
          return false;
        }
        return index === -4;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_2800
     * @tc.name int8ArrayFindPart03Test028
     * @tc.desc Verify find returns undefined when index === array.length, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: number | undefined = arr.find((_value: number, index: int, array: Int8Array): boolean => {
        if (_value < INT8_MIN || _value > INT8_MAX) {
          return false;
        }
        return index === array.length;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_2900
     * @tc.name int8ArrayFindPart03Test029
     * @tc.desc Verify find returns undefined when index === array.length + 1, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: number | undefined = arr.find((_value: number, index: int, array: Int8Array): boolean => {
        if (_value < INT8_MIN || _value > INT8_MAX) {
          return false;
        }
        return index === array.length + 1;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_3000
     * @tc.name int8ArrayFindPart03Test030
     * @tc.desc Verify find returns undefined when index === 2147483647, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: number | undefined = arr.find((_value: number, index: int, _array: Int8Array): boolean => {
        if (_value < INT8_MIN || _value > INT8_MAX) {
          return false;
        }
        return index === 2147483647;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_3100
     * @tc.name int8ArrayFindPart03Test031
     * @tc.desc Verify find expects 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: number | undefined = arr.find((_value: number, index: int, array: Int8Array): boolean => {
        if (_value < INT8_MIN || _value > INT8_MAX) {
          return false;
        }
        return index === array.length - 1;
      });
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_3200
     * @tc.name int8ArrayFindPart03Test032
     * @tc.desc Verify find returns undefined when index < 0, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: number | undefined = arr.find((_value: number, index: int, _array: Int8Array): boolean => {
        if (_value < INT8_MIN || _value > INT8_MAX) {
          return false;
        }
        return index < 0;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_3300
     * @tc.name int8ArrayFindPart03Test033
     * @tc.desc Verify find returns undefined when index >= array.length, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: number | undefined = arr.find((_value: number, index: int, array: Int8Array): boolean => {
        if (_value < INT8_MIN || _value > INT8_MAX) {
          return false;
        }
        return index >= array.length;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_3400
     * @tc.name int8ArrayFindPart03Test034
     * @tc.desc Verify find returns undefined, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number | undefined = arr.find((_value: number, _index: int, _array: Int8Array): boolean => {
        if (_value < INT8_MIN || _value > INT8_MAX) {
          return false;
        }
        return false;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_3500
     * @tc.name int8ArrayFindPart03Test035
     * @tc.desc Verify find with predicate value !== value (always false) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        return value !== value;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_3600
     * @tc.name int8ArrayFindPart03Test036
     * @tc.desc Verify find with predicate typeof value === string (always false for Int8Array) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        return typeof value === 'string';
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_3700
     * @tc.name int8ArrayFindPart03Test037
     * @tc.desc Verify find with predicate element == 'number' returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        return typeof value === 'number';
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_3800
     * @tc.name int8ArrayFindPart03Test038
     * @tc.desc Verify find with predicate value === Number.POSITIVE_INFINITY (always false for Int8Array) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        return value === Number.POSITIVE_INFINITY;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_3900
     * @tc.name int8ArrayFindPart03Test039
     * @tc.desc Verify find with predicate value === -Number.POSITIVE_INFINITY (always false for Int8Array) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        return value === -Number.POSITIVE_INFINITY;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_4000
     * @tc.name int8ArrayFindPart03Test040
     * @tc.desc Verify find with predicate value === Number.NaN (always false, NaN !== NaN) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        return value === Number.NaN;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_4100
     * @tc.name int8ArrayFindPart03Test041
     * @tc.desc Verify find with predicate typeof value === boolean (always false for Int8Array) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        return typeof value === 'boolean';
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_4200
     * @tc.name int8ArrayFindPart03Test042
     * @tc.desc Verify find with predicate typeof value === object (always false for Int8Array) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        return typeof value === 'object';
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_4300
     * @tc.name int8ArrayFindPart03Test043
     * @tc.desc Verify find with predicate typeof value === undefined (always false for Int8Array) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        return typeof value === 'undefined';
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_4400
     * @tc.name int8ArrayFindPart03Test044
     * @tc.desc Verify no-match find result typeof is 'undefined'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 99;
      });
      expect(typeof result).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_4500
     * @tc.name int8ArrayFindPart03Test045
     * @tc.desc Verify find returns undefined when value === 99 not found, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 99;
      });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_4600
     * @tc.name int8ArrayFindPart03Test046
     * @tc.desc Verify find matching value not equal to undefined, equals matched value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 20;
      });
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_4700
     * @tc.name int8ArrayFindPart03Test047
     * @tc.desc Verify find returns undefined, original array $_get remains accessible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 99;
      });
      expect(result).assertUndefined();
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_4800
     * @tc.name int8ArrayFindPart03Test048
     * @tc.desc Verify find throws Error on first call, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        arr.find((_value: number, _index: int, _array: Int8Array): boolean => {
          if (_value < INT8_MIN || _value > INT8_MAX) {
            return false;
          }
          throw new Error('first-call');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_4900
     * @tc.name int8ArrayFindPart03Test049
     * @tc.desc Verify find throws Error at index 1 with message, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        arr.find((_value: number, index: int, _array: Int8Array): boolean => {
          if (_value < INT8_MIN || _value > INT8_MAX) {
            return false;
          }
          if (index === 1) {
            throw new Error('second-call');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('second-call');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_5000
     * @tc.name int8ArrayFindPart03Test050
     * @tc.desc Verify find expects TypeError throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        arr.find((_value: number, _index: int, _array: Int8Array): boolean => {
          if (_value < INT8_MIN || _value > INT8_MAX) {
            return false;
          }
          throw new TypeError('type-err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_5100
     * @tc.name int8ArrayFindPart03Test051
     * @tc.desc Verify find throws Error on first call, array unchanged, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        arr.find((_value: number, _index: int, _array: Int8Array): boolean => {
          if (_value < INT8_MIN || _value > INT8_MAX) {
            return false;
          }
          throw new Error('detailed-message');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('detailed-message');
        let r1: number = arr.$_get(0);
        let e1: int = 1;
        expect(r1).assertEqual(e1);
        let r2: number = arr.$_get(1);
        let e2: int = 2;
        expect(r2).assertEqual(e2);
        let r3: number = arr.$_get(2);
        let e3: int = 3;
        expect(r3).assertEqual(e3);
        let r4: int = arr.length;
        let e4: int = 3;
        expect(r4).assertEqual(e4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_5200
     * @tc.name int8ArrayFindPart03Test052
     * @tc.desc Verify find throws Error at index 1 after 2 calls, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let count: int = 0;
      try {
        arr.find((_value: number, index: int, _array: Int8Array): boolean => {
          if (_value < INT8_MIN || _value > INT8_MAX) {
            return false;
          }
          count = count + 1;
          if (index === 1) {
            throw new Error('at-index-1');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(count).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_5300
     * @tc.name int8ArrayFindPart03Test053
     * @tc.desc Verify find propagates Error with message 'custom-msg' on Int8Array.of(7, 8, 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 8, 9);
      try {
        arr.find((_value: number, _index: int, _array: Int8Array): boolean => {
          if (_value < INT8_MIN || _value > INT8_MAX) {
            return false;
          }
          throw new Error('custom-msg');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('custom-msg');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_5400
     * @tc.name int8ArrayFindPart03Test054
     * @tc.desc Verify find throws Error on first call, count 1, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let count: int = 0;
      try {
        arr.find((_value: number, _index: int, _array: Int8Array): boolean => {
          if (_value < INT8_MIN || _value > INT8_MAX) {
            return false;
          }
          count = count + 1;
          throw new Error('count-check');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(count).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_5500
     * @tc.name int8ArrayFindPart03Test055
     * @tc.desc Verify find with predicate element == 2 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let result: number | undefined = arr.find((value: number, index: int, _array: Int8Array): boolean => {
        if (index >= 2) {
          throw new Error('should-not-reach');
        }
        return value === 2;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_5600
     * @tc.name int8ArrayFindPart03Test056
     * @tc.desc Verify find throws Error after side effect 10, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let sideEffect: int = 0;
      try {
        arr.find((_value: number, _index: int, _array: Int8Array): boolean => {
          if (_value < INT8_MIN || _value > INT8_MAX) {
            return false;
          }
          sideEffect = sideEffect + 10;
          throw new Error('after-side-effect');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(sideEffect).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_5700
     * @tc.name int8ArrayFindPart03Test057
     * @tc.desc Verify callback throws before find assigns, result remains initial undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(11, 22, 33);
      let result: number | undefined = undefined;
      try {
        result = arr.find((_value: number, _index: int, _array: Int8Array): boolean => {
          if (_value < INT8_MIN || _value > INT8_MAX) {
            return false;
          }
          throw new Error('before-assign');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(result).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_5800
     * @tc.name int8ArrayFindPart03Test058
     * @tc.desc Verify after callback-throw recovery, find with value === 99 on [1,2,3] returns undefined (no match)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        arr.find((_value: number, _index: int, _array: Int8Array): boolean => {
          if (_value < INT8_MIN || _value > INT8_MAX) {
            return false;
          }
          throw new Error('throw-path');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('throw-path');
      }
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 99;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_5900
     * @tc.name int8ArrayFindPart03Test059
     * @tc.desc Verify find expects Error throws exception, with $_get(0), on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        arr.find((_value: number, _index: int, array: Int8Array): boolean => {
          if (_value < INT8_MIN || _value > INT8_MAX) {
            return false;
          }
          array.$_set(0, 200);
          throw new Error('after-set');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(arr.$_get(0)).assertEqual(-56);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_6000
     * @tc.name int8ArrayFindPart03Test060
     * @tc.desc Verify callback throws, after catch same array find returns normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        arr.find((_value: number, _index: int, _array: Int8Array): boolean => {
          if (_value < INT8_MIN || _value > INT8_MAX) {
            return false;
          }
          throw new Error('first-fail');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('first-fail');
      }
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 2;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_6100
     * @tc.name int8ArrayFindPart03Test061
     * @tc.desc Verify find early match on second element, callback stops, counter is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let count: int = 0;
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        count = count + 1;
        return value === 20;
      });
      expect(count).assertEqual(2);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_6200
     * @tc.name int8ArrayFindPart03Test062
     * @tc.desc Verify find no match 5 elements, full traversal, counter is 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let count: int = 0;
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        count = count + 1;
        return value === 99;
      });
      expect(count).assertEqual(5);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_6300
     * @tc.name int8ArrayFindPart03Test063
     * @tc.desc Verify find with predicate element == 10 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let count: int = 0;
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        count = count + 1;
        return value === 10;
      });
      expect(count).assertEqual(1);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_6400
     * @tc.name int8ArrayFindPart03Test064
     * @tc.desc Verify find with predicate element == 50 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let count: int = 0;
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        count = count + 1;
        return value === 50;
      });
      expect(count).assertEqual(5);
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_6500
     * @tc.name int8ArrayFindPart03Test065
     * @tc.desc Verify find with predicate element == 30 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let count: int = 0;
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int8Array): boolean => {
        count = count + 1;
        return value === 30;
      });
      expect(count).assertEqual(3);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART03_6600
     * @tc.name int8ArrayFindPart03Test066
     * @tc.desc Verify empty array find returns undefined, $_get(0) throws RangeError for out-of-bounds index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: number | undefined = arr.find((_value: number, _index: int, _array: Int8Array): boolean => {
        if (_value < INT8_MIN || _value > INT8_MAX) {
          return false;
        }
        return true;
      });
      expect(result).assertUndefined();
      try {
        arr.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });
  });
}
