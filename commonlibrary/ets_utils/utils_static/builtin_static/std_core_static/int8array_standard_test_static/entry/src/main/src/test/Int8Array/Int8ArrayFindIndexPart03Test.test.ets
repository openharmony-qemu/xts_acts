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

function helper001(v: number): boolean {
  if (v === 2) {
    throw new Error('helper-boom');
  }
  return false;
}

export default function int8ArrayFindIndexPart03Test(): void {
  describe('Int8ArrayFindIndexPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_0100
     * @tc.name int8ArrayFindIndexPart03Test001
     * @tc.desc Verify findIndex returns first matching element index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === 3;
      });
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_0200
     * @tc.name int8ArrayFindIndexPart03Test002
     * @tc.desc Verify findIndex returns -1 when no element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === 9;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_0300
     * @tc.name int8ArrayFindIndexPart03Test003
     * @tc.desc Verify findIndex expects -1 when callback always returns false, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return false;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_0400
     * @tc.name int8ArrayFindIndexPart03Test004
     * @tc.desc Verify findIndex expects -1 and callback not invoked on empty array, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        throw new Error('boom');
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_0500
     * @tc.name int8ArrayFindIndexPart03Test005
     * @tc.desc Verify findIndex expects -1 when callback always returns true, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let counter: int = 0;
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        counter = counter + 1;
        return true;
      });
      expect(r).assertEqual(-1);
      expect(counter).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_0600
     * @tc.name int8ArrayFindIndexPart03Test006
     * @tc.desc Verify findIndex expects -1 when predicate returns true on empty array, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let flag: boolean = true;
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return flag;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_0700
     * @tc.name int8ArrayFindIndexPart03Test007
     * @tc.desc Verify findIndex expects 0 when value === 5, on new Int8Array([5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === 5;
      });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_0800
     * @tc.name int8ArrayFindIndexPart03Test008
     * @tc.desc Verify findIndex expects -1 when value === 6, on new Int8Array([5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === 6;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_0900
     * @tc.name int8ArrayFindIndexPart03Test009
     * @tc.desc Verify findIndex expects 0 when index === 0, on new Int8Array([5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let r: int = arr.findIndex((value: number, index: int, _a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return index === 0;
      });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_1000
     * @tc.name int8ArrayFindIndexPart03Test010
     * @tc.desc Verify findIndex expects -1 when index === 1, on new Int8Array([5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let r: int = arr.findIndex((value: number, index: int, _a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return index === 1;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_1100
     * @tc.name int8ArrayFindIndexPart03Test011
     * @tc.desc Verify findIndex expects 0, on new Int8Array([-128])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === -128;
      });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_1200
     * @tc.name int8ArrayFindIndexPart03Test012
     * @tc.desc Verify findIndex expects 0, on new Int8Array([INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === INT8_MAX;
      });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_1300
     * @tc.name int8ArrayFindIndexPart03Test013
     * @tc.desc Verify findIndex expects 0, on new Int8Array([3, 3, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 3, 3]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === 3;
      });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_1400
     * @tc.name int8ArrayFindIndexPart03Test014
     * @tc.desc Verify findIndex expects 0, callback stops after first match, on new Int8Array([3, 3, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 3, 3]);
      let counter: int = 0;
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        counter = counter + 1;
        return value === 3;
      });
      expect(r).assertEqual(0);
      expect(counter).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_1500
     * @tc.name int8ArrayFindIndexPart03Test015
     * @tc.desc Verify findIndex with predicate element == -1 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, -1, -1]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === -1;
      });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_1600
     * @tc.name int8ArrayFindIndexPart03Test016
     * @tc.desc Verify findIndex expects 0, on new Int8Array([0, 0, 0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === 0;
      });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_1700
     * @tc.name int8ArrayFindIndexPart03Test017
     * @tc.desc Verify findIndex expects 0, on new Int8Array([INT8_MAX, INT8_MAX, INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MAX, INT8_MAX]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === INT8_MAX;
      });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_1800
     * @tc.name int8ArrayFindIndexPart03Test018
     * @tc.desc Verify findIndex expects 0, on new Int8Array([-128, -128, -128])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, -128, -128]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === -128;
      });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_1900
     * @tc.name int8ArrayFindIndexPart03Test019
     * @tc.desc Verify findIndex with predicate element != 3 returns -1 when no element matches on Int8Array [3,3,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 3, 3]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value !== 3;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_2000
     * @tc.name int8ArrayFindIndexPart03Test020
     * @tc.desc Verify findIndex expects -1 when callback always returns false, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let counter: int = 0;
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        counter = counter + 1;
        return false;
      });
      expect(r).assertEqual(-1);
      expect(counter).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_2100
     * @tc.name int8ArrayFindIndexPart03Test021
     * @tc.desc Verify findIndex expects 0 when index === 0, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let counter: int = 0;
      let r: int = arr.findIndex((value: number, index: int, _a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        counter = counter + 1;
        return index === 0;
      });
      expect(r).assertEqual(0);
      expect(counter).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_2200
     * @tc.name int8ArrayFindIndexPart03Test022
     * @tc.desc Verify findIndex expects 1, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let counter: int = 0;
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        counter = counter + 1;
        return value === 2;
      });
      expect(r).assertEqual(1);
      expect(counter).assertEqual(2);
      let arr2: Int8Array = new Int8Array([1, 2, 3]);
      let counter2: int = 0;
      let r2: int = arr2.findIndex((value: number, index: int, _a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        counter2 = counter2 + 1;
        return index === 2;
      });
      expect(r2).assertEqual(2);
      expect(counter2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_2300
     * @tc.name int8ArrayFindIndexPart03Test023
     * @tc.desc Verify findIndex expects 2, with $_get(2), on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let log: Int8Array = new Int8Array(3);
      let r: int = arr.findIndex((value: number, index: int, _a: Int8Array): boolean => {
        log.$_set(index, value);
        return value === 3;
      });
      expect(r).assertEqual(2);
      let r1: number = log.$_get(2);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_2400
     * @tc.name int8ArrayFindIndexPart03Test024
     * @tc.desc Verify findIndex expects 1, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let counter: int = 0;
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        counter = counter + 1;
        return counter === 2;
      });
      expect(r).assertEqual(1);
      expect(counter).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_2500
     * @tc.name int8ArrayFindIndexPart03Test025
     * @tc.desc Verify two findIndex calls share external state, second uses threshold from first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let threshold: int = 0;
      let first: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === 1;
      });
      threshold = first + 2;
      let second: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === threshold;
      });
      expect(second).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_2600
     * @tc.name int8ArrayFindIndexPart03Test026
     * @tc.desc Verify findIndex expects 0, on new Int8Array([7, 8, 9])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 8, 9]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return true;
      });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_2700
     * @tc.name int8ArrayFindIndexPart03Test027
     * @tc.desc Verify findIndex expects 0 when a.length === 3, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r: int = arr.findIndex((value: number, _index: int, a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return a.length === 3;
      });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_2800
     * @tc.name int8ArrayFindIndexPart03Test028
     * @tc.desc Verify findIndex expects 0 when value > 0, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value > 0;
      });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_2900
     * @tc.name int8ArrayFindIndexPart03Test029
     * @tc.desc Verify findIndex expects -1 when a.length === 100, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r: int = arr.findIndex((value: number, _index: int, a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return a.length === 100;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_3000
     * @tc.name int8ArrayFindIndexPart03Test030
     * @tc.desc Verify findIndex expects 2, with $_get(a.length - 1), on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r: int = arr.findIndex((value: number, _index: int, a: Int8Array): boolean => {
        return a.$_get(a.length - 1) === value;
      });
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_3100
     * @tc.name int8ArrayFindIndexPart03Test031
     * @tc.desc Verify findIndex expects 0 when predicate uses a.byteLength === 3, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r: int = arr.findIndex((value: number, _index: int, a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return a.byteLength === 3;
      });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_3200
     * @tc.name int8ArrayFindIndexPart03Test032
     * @tc.desc Verify findIndex expects 0 when predicate uses a.byteOffset === 0, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r: int = arr.findIndex((value: number, _index: int, a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return a.byteOffset === 0;
      });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_3300
     * @tc.name int8ArrayFindIndexPart03Test033
     * @tc.desc Verify nested findIndex call inside predicate, outer matches when inner equals index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r: int = arr.findIndex((value: number, index: int, a: Int8Array): boolean => {
        let inner: int = a.findIndex((innerVal: number, _i2: int, _a2: Int8Array): boolean => {
          return innerVal === value;
        });
        return inner === index;
      });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_3400
     * @tc.name int8ArrayFindIndexPart03Test034
     * @tc.desc Verify findIndex expects 0, on new Int8Array([5, 6, 7])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 6, 7]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === 5;
      });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_3500
     * @tc.name int8ArrayFindIndexPart03Test035
     * @tc.desc Verify findIndex with predicate element == 100 returns -1 when value not in Int8Array [5,6,7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 6, 7]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === 100;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_3600
     * @tc.name int8ArrayFindIndexPart03Test036
     * @tc.desc Verify findIndex expects 1, on new Int8Array([5, 6, 7])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 6, 7]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === 6;
      });
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_3700
     * @tc.name int8ArrayFindIndexPart03Test037
     * @tc.desc Verify findIndex with predicate element == 7 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 6, 7]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === 7;
      });
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_3800
     * @tc.name int8ArrayFindIndexPart03Test038
     * @tc.desc Verify findIndex returns index of value 6 on [5,6,7], then $_get at found index equals 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 6, 7]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === 6;
      });
      let r1: number = arr.$_get(r);
      let e1: int = 6;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_3900
     * @tc.name int8ArrayFindIndexPart03Test039
     * @tc.desc Verify findIndex returns 1 for value===6 on [5,6,7], then r+1 equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 6, 7]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === 6;
      });
      let next: int = r + 1;
      expect(next).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_4000
     * @tc.name int8ArrayFindIndexPart03Test040
     * @tc.desc Verify findIndex expects 0 when index === 0, on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: int = arr.findIndex((value: number, index: int, _a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return index === 0;
      });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_4100
     * @tc.name int8ArrayFindIndexPart03Test041
     * @tc.desc Verify findIndex expects 3 when index === 3, on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: int = arr.findIndex((value: number, index: int, _a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return index === 3;
      });
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_4200
     * @tc.name int8ArrayFindIndexPart03Test042
     * @tc.desc Verify findIndex expects -1 when index === 4, on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: int = arr.findIndex((value: number, index: int, _a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return index === 4;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_4300
     * @tc.name int8ArrayFindIndexPart03Test043
     * @tc.desc Verify findIndex expects -1 when index === 5, on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: int = arr.findIndex((value: number, index: int, _a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return index === 5;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_4400
     * @tc.name int8ArrayFindIndexPart03Test044
     * @tc.desc Verify findIndex expects -1 when index === -1, on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: int = arr.findIndex((value: number, index: int, _a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return index === -1;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_4500
     * @tc.name int8ArrayFindIndexPart03Test045
     * @tc.desc Verify findIndex expects -1 when index === -4, on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: int = arr.findIndex((value: number, index: int, _a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return index === -4;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_4600
     * @tc.name int8ArrayFindIndexPart03Test046
     * @tc.desc Verify findIndex expects -1 when index === -5, on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: int = arr.findIndex((value: number, index: int, _a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return index === -5;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_4700
     * @tc.name int8ArrayFindIndexPart03Test047
     * @tc.desc Verify findIndex expects -1 when index === 0x7fffffff, on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: int = arr.findIndex((value: number, index: int, _a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return index === 0x7fffffff;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_4800
     * @tc.name int8ArrayFindIndexPart03Test048
     * @tc.desc Verify findIndex expects -1 when index === -2147483648, on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: int = arr.findIndex((value: number, index: int, _a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return index === -2147483648;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_4900
     * @tc.name int8ArrayFindIndexPart03Test049
     * @tc.desc Verify findIndex expects 0 when index >= 0, on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: int = arr.findIndex((value: number, index: int, _a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return index >= 0;
      });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_5000
     * @tc.name int8ArrayFindIndexPart03Test050
     * @tc.desc Verify findIndex expects 0 when index < a.length, on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: int = arr.findIndex((value: number, index: int, a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return index < a.length;
      });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_5100
     * @tc.name int8ArrayFindIndexPart03Test051
     * @tc.desc Verify findIndex returns -1 when predicate is always false (value !== value on Int8Array values)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value !== value;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_5200
     * @tc.name int8ArrayFindIndexPart03Test052
     * @tc.desc Verify findIndex returns -1 when predicate compares element against Number.POSITIVE_INFINITY on Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, 1, 2]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === Number.POSITIVE_INFINITY;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_5300
     * @tc.name int8ArrayFindIndexPart03Test053
     * @tc.desc Verify findIndex returns -1 when predicate compares element against -Infinity on Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, 1, 2]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === -Number.POSITIVE_INFINITY;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_5400
     * @tc.name int8ArrayFindIndexPart03Test054
     * @tc.desc Verify findIndex with predicate element == 1.5 returns -1 because Int8Array values are integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === 1.5;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_5500
     * @tc.name int8ArrayFindIndexPart03Test055
     * @tc.desc Verify findIndex with predicate element != Number.POSITIVE_INFINITY returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value !== Number.POSITIVE_INFINITY && value !== -Number.POSITIVE_INFINITY;
      });
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_5600
     * @tc.name int8ArrayFindIndexPart03Test056
     * @tc.desc Verify findIndex expects 1, on new Int8Array([1, 0, 2])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 0, 2]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === 0;
      });
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_5700
     * @tc.name int8ArrayFindIndexPart03Test057
     * @tc.desc Verify findIndex returns -1 when predicate compares against out-of-range value 255 on Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([255, 1, 2]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === 255;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_5800
     * @tc.name int8ArrayFindIndexPart03Test058
     * @tc.desc Verify findIndex returns -1 when predicate compares against out-of-range value 128 on Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([128, 1, 2]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === 128;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_5900
     * @tc.name int8ArrayFindIndexPart03Test059
     * @tc.desc Verify findIndex returns -1 when predicate compares against out-of-range value -129 on Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-129, 1, 2]);
      let r: int = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
        return value === -129;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_6000
     * @tc.name int8ArrayFindIndexPart03Test060
     * @tc.desc Verify findIndex throws Error when value === 2, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
          if (value === 2) {
            throw new Error('boom');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_6100
     * @tc.name int8ArrayFindIndexPart03Test061
     * @tc.desc Verify findIndex propagates RangeError thrown in predicate on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          throw new RangeError('range');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_6200
     * @tc.name int8ArrayFindIndexPart03Test062
     * @tc.desc Verify findIndex propagates SyntaxError thrown in predicate on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          throw new SyntaxError('syntax');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('SyntaxError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_6300
     * @tc.name int8ArrayFindIndexPart03Test063
     * @tc.desc Verify findIndex throws Error on first call with message, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          throw new Error('findindex-boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('findindex-boom');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_6400
     * @tc.name int8ArrayFindIndexPart03Test064
     * @tc.desc Verify findIndex throws Error on first call, counter 1, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let counter: int = 0;
      try {
        arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          counter = counter + 1;
          throw new Error('first');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(counter).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_6500
     * @tc.name int8ArrayFindIndexPart03Test065
     * @tc.desc Verify findIndex throws Error on second call, counter 2, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let counter: int = 0;
      try {
        arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          counter = counter + 1;
          if (counter === 2) {
            throw new Error('second');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(counter).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_6600
     * @tc.name int8ArrayFindIndexPart03Test066
     * @tc.desc Verify findIndex throws Error on third call, counter 3, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let counter: int = 0;
      try {
        arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          counter = counter + 1;
          if (counter === 3) {
            throw new Error('last');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(counter).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_6700
     * @tc.name int8ArrayFindIndexPart03Test067
     * @tc.desc Verify findIndex expects 0 when index === 0, Error at index 1 never reached, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let counter: int = 0;
      let r: int = arr.findIndex((value: number, index: int, _a: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        counter = counter + 1;
        if (index === 1) {
          throw new Error('never');
        }
        return index === 0;
      });
      expect(r).assertEqual(0);
      expect(counter).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_6800
     * @tc.name int8ArrayFindIndexPart03Test068
     * @tc.desc Verify findIndex predicate throws at second call, exception propagates, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let counter: int = 0;
      try {
        arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
          counter = counter + 1;
          if (value === 20) {
            throw new Error('twenty');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(counter).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_6900
     * @tc.name int8ArrayFindIndexPart03Test069
     * @tc.desc Verify predicate throws, findIndex does not return -1, result keeps initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: int = 999;
      try {
        result = arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
          if (value === 2) {
            throw new Error('x');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_7000
     * @tc.name int8ArrayFindIndexPart03Test070
     * @tc.desc Verify findIndex throws Error at value 2, log keeps visited 1, 2 on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let log: Int8Array = new Int8Array(3);
      try {
        arr.findIndex((value: number, index: int, _a: Int8Array): boolean => {
          log.$_set(index, value);
          if (value === 2) {
            throw new Error('mid');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(log.$_get(0)).assertEqual(1);
        expect(log.$_get(1)).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART03_7100
     * @tc.name int8ArrayFindIndexPart03Test071
     * @tc.desc Verify predicate calls external helper function, helper throws, exception propagates through findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.findIndex((value: number, _index: int, _a: Int8Array): boolean => {
          return helper001(value);
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('helper-boom');
      }
    });
  });
}
