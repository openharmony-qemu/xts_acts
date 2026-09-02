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

export default function int8ArrayFindPart02Test(): void {
  describe('Int8ArrayFindPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_0100
     * @tc.name int8ArrayFindPart02Test001
     * @tc.desc Verify find expects undefined, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v > 100;
      });
      expect(typeof result).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_0200
     * @tc.name int8ArrayFindPart02Test002
     * @tc.desc Verify find expects undefined, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 0;
      });
      expect(typeof result).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_0300
     * @tc.name int8ArrayFindPart02Test003
     * @tc.desc Verify find expects number, on Int8Array.of(-128)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === -128;
      });
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_0400
     * @tc.name int8ArrayFindPart02Test004
     * @tc.desc Verify find expects number, on Int8Array.of(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 0;
      });
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_0500
     * @tc.name int8ArrayFindPart02Test005
     * @tc.desc Verify find expects number, on Int8Array.of(INT8_MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(INT8_MAX);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === INT8_MAX;
      });
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_0600
     * @tc.name int8ArrayFindPart02Test006
     * @tc.desc Verify find expects 6, on Int8Array.of(3, 6, 9, 12)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(3, 6, 9, 12);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v > 5;
      });
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_0700
     * @tc.name int8ArrayFindPart02Test007
     * @tc.desc Verify find expects INT8_MAX, on Int8Array.of(INT8_MAX, 0, -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(INT8_MAX, 0, -1);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === INT8_MAX;
      });
      expect(result).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_0800
     * @tc.name int8ArrayFindPart02Test008
     * @tc.desc Verify find expects -128, on Int8Array.of(-128, 0, 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128, 0, 1);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === -128;
      });
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_0900
     * @tc.name int8ArrayFindPart02Test009
     * @tc.desc Verify find expects 0, on Int8Array.of(0, 1, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 1, 2);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_1000
     * @tc.name int8ArrayFindPart02Test010
     * @tc.desc Verify find expects -1, on Int8Array.of(-1, 0, 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-1, 0, 1);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === -1;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_1100
     * @tc.name int8ArrayFindPart02Test011
     * @tc.desc Verify find expects 9, on Int8Array.of(1, 2, 3, 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 9);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v > 5;
      });
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_1200
     * @tc.name int8ArrayFindPart02Test012
     * @tc.desc Verify find expects 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 5, 1);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 5;
      });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_1300
     * @tc.name int8ArrayFindPart02Test013
     * @tc.desc Verify find returns undefined, on Int8Array.of(7, 8, 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 8, 9);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v < 0;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_1400
     * @tc.name int8ArrayFindPart02Test014
     * @tc.desc Verify find returns undefined when no element > 10, on Int8Array.of(7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v > 10;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_1500
     * @tc.name int8ArrayFindPart02Test015
     * @tc.desc Verify find expects 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(100, 50, 25);
      let result: number | undefined = arr.find((_v: number, i: int, _a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        return i === 1;
      });
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_1600
     * @tc.name int8ArrayFindPart02Test016
     * @tc.desc Verify find expects 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 20;
      });
      expect(result).assertEqual(20);
      let r1: number = arr.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 30;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_1700
     * @tc.name int8ArrayFindPart02Test017
     * @tc.desc Verify find with predicate element == 4 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(4, 4, 4);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 4;
      });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_1800
     * @tc.name int8ArrayFindPart02Test018
     * @tc.desc Verify find with Int8Array.of(200) overflow to -56, returns first matching element -56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(200);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === -56;
      });
      expect(result).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_1900
     * @tc.name int8ArrayFindPart02Test019
     * @tc.desc Verify find expects -1, on Int8Array.of(255)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(255);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === -1;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_2000
     * @tc.name int8ArrayFindPart02Test020
     * @tc.desc Verify find expects INT8_MAX, on Int8Array.of(-129)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-129);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === INT8_MAX;
      });
      expect(result).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_2100
     * @tc.name int8ArrayFindPart02Test021
     * @tc.desc Verify find expects -128, on Int8Array.of(128)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(128);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === -128;
      });
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_2200
     * @tc.name int8ArrayFindPart02Test022
     * @tc.desc Verify find expects 9, on Int8Array.of(3, 6, 9, 12)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(3, 6, 9, 12);
      let result: number | undefined = arr.find((_v: number, i: int, _a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        return i === 2;
      });
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_2300
     * @tc.name int8ArrayFindPart02Test023
     * @tc.desc Verify find expects 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 7, 7, 7);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 7;
      });
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_2400
     * @tc.name int8ArrayFindPart02Test024
     * @tc.desc Verify find returns undefined when no element == 1 in new Int8Array(100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(100);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 1;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_2500
     * @tc.name int8ArrayFindPart02Test025
     * @tc.desc Verify find with predicate element == 11 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(11, 22, 33);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 11;
      });
      expect(result).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_2600
     * @tc.name int8ArrayFindPart02Test026
     * @tc.desc Verify find returns undefined on empty Int8Array with predicate v > 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v > 0;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_2700
     * @tc.name int8ArrayFindPart02Test027
     * @tc.desc Verify find on empty Int8Array keeps count 0 and returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let count: int = 0;
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        count = count + 1;
        return v === 0;
      });
      expect(count).assertEqual(0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_2800
     * @tc.name int8ArrayFindPart02Test028
     * @tc.desc Verify find returns undefined when callback always returns true, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: number | undefined = arr.find((_v: number, _i: int, _a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        return true;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_2900
     * @tc.name int8ArrayFindPart02Test029
     * @tc.desc Verify find on empty Int8Array does not modify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 0;
      });
      expect(result).assertUndefined();
      let r1: int = arr.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_3000
     * @tc.name int8ArrayFindPart02Test030
     * @tc.desc Verify find returns undefined with Error thrown, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: number | undefined = arr.find((_v: number, _i: int, _a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        throw new Error('never');
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_3100
     * @tc.name int8ArrayFindPart02Test031
     * @tc.desc Verify find returns undefined when i === 0, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: number | undefined = arr.find((_v: number, i: int, _a: Int8Array): boolean => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return false;
        }
        return i === 0;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_3200
     * @tc.name int8ArrayFindPart02Test032
     * @tc.desc Verify find returns undefined when no element > 1000 in Int8Array.of(10,20,30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v > 1000;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_3300
     * @tc.name int8ArrayFindPart02Test033
     * @tc.desc Verify find returns undefined, on Int8Array.of(99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(99);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v < 0;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_3400
     * @tc.name int8ArrayFindPart02Test034
     * @tc.desc Verify find returns undefined when predicate always false, callback invoked 3 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let count: int = 0;
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        count = count + 1;
        return v > 100;
      });
      expect(count).assertEqual(3);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_3500
     * @tc.name int8ArrayFindPart02Test035
     * @tc.desc Verify find returns undefined when element == 50 not found, on Int8Array.of(-128, 0, INT8_MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128, 0, INT8_MAX);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 50;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_3600
     * @tc.name int8ArrayFindPart02Test036
     * @tc.desc Verify find returns undefined, on Int8Array.of(2, 4, 6, 8)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(2, 4, 6, 8);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 5;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_3700
     * @tc.name int8ArrayFindPart02Test037
     * @tc.desc Verify find returns undefined when no element > 30, on Int8Array.of(5, 10, 15, 20, 25, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 10, 15, 20, 25, 30);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v > 30;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_3800
     * @tc.name int8ArrayFindPart02Test038
     * @tc.desc Verify find returns undefined when no element != 0, on Int8Array.of(0, 0, 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 0, 0);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v !== 0;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_3900
     * @tc.name int8ArrayFindPart02Test039
     * @tc.desc Verify find expects 2 and length stays 3, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 2;
      });
      expect(result).assertEqual(2);
      let r1: int = arr.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_4000
     * @tc.name int8ArrayFindPart02Test040
     * @tc.desc Verify find returns undefined when v > 100 and length stays 3, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v > 100;
      });
      expect(result).assertUndefined();
      let r1: int = arr.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_4100
     * @tc.name int8ArrayFindPart02Test041
     * @tc.desc Verify find expects 3 and byteLength stays 4, on Int8Array.of(1, 2, 3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 3;
      });
      expect(result).assertEqual(3);
      let r1: int = arr.byteLength;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_4200
     * @tc.name int8ArrayFindPart02Test042
     * @tc.desc Verify find expects 3 and byteLength equals length 5, on Int8Array.of(1, 2, 3, 4, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 3;
      });
      expect(result).assertEqual(3);
      expect(arr.byteLength).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_4300
     * @tc.name int8ArrayFindPart02Test043
     * @tc.desc Verify find expects 6 and length stays 3, on Int8Array.of(5, 6, 7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 6, 7);
      let result: number | undefined = arr.find((v: number, _i: int, a: Int8Array): boolean => {
        return a.length === 3 && v === 6;
      });
      expect(result).assertEqual(6);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_4400
     * @tc.name int8ArrayFindPart02Test044
     * @tc.desc Verify find leaves view.length 6 from ArrayBuffer, on new Int8Array(buf, 0, 6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int8Array = new Int8Array(buf, 0, 6);
      let result: number | undefined = view.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 0;
      });
      expect(result).assertEqual(0);
      expect(view.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_4500
     * @tc.name int8ArrayFindPart02Test045
     * @tc.desc Verify find expects 3 on subarray(1, 4), on Int8Array.of(1, 2, 3, 4, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let sub: Int8Array = base.subarray(1, 4);
      let result: number | undefined = sub.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 3;
      });
      expect(result).assertEqual(3);
      expect(sub.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_4600
     * @tc.name int8ArrayFindPart02Test046
     * @tc.desc Verify find returns undefined when v > 100, elements 1, 2, 3 intact, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v > 100;
      });
      expect(result).assertUndefined();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_4700
     * @tc.name int8ArrayFindPart02Test047
     * @tc.desc Verify find expects 6, with $_get(1), on Int8Array.of(5, 6, 7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 6, 7);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 6;
      });
      expect(result).assertEqual(6);
      expect(arr.$_get(1)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_4800
     * @tc.name int8ArrayFindPart02Test048
     * @tc.desc Verify find expects 2 and $_get(0) stays 9, on Int8Array.of(9, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(9, 2, 3);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 2;
      });
      expect(result).assertEqual(2);
      expect(arr.$_get(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_4900
     * @tc.name int8ArrayFindPart02Test049
     * @tc.desc Verify find expects 2 and $_get(2) stays 8, on Int8Array.of(1, 2, 8)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 8);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 2;
      });
      expect(result).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_5000
     * @tc.name int8ArrayFindPart02Test050
     * @tc.desc Verify find expects 2 and buffer.byteLength stays 3, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 2;
      });
      expect(result).assertEqual(2);
      expect(arr.buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_5100
     * @tc.name int8ArrayFindPart02Test051
     * @tc.desc Verify find expects INT8_MAX and elements -1, -2 intact, on Int8Array.of(-1, -2, INT8_MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-1, -2, INT8_MAX);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === INT8_MAX;
      });
      expect(result).assertEqual(INT8_MAX);
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(-2);
      expect(arr.$_get(2)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_5200
     * @tc.name int8ArrayFindPart02Test052
     * @tc.desc Verify find expects Error throws exception, with $_get(0), on Int8Array.of(5, 6, 7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 6, 7);
      try {
        let found: number | undefined = arr.find((_v: number, _i: int, _a: Int8Array): boolean => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return false;
          }
          throw new Error('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('boom');
      }
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_5300
     * @tc.name int8ArrayFindPart02Test053
     * @tc.desc Verify find with predicate element > 8 returns first matching element 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 10, 15);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v > 8;
      });
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_5400
     * @tc.name int8ArrayFindPart02Test054
     * @tc.desc Verify find expects undefined, on Int8Array.of(1, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v > 100;
      });
      expect(typeof result).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_5500
     * @tc.name int8ArrayFindPart02Test055
     * @tc.desc Verify find expects number, on Int8Array.of(42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let result: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 42;
      });
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_5600
     * @tc.name int8ArrayFindPart02Test056
     * @tc.desc Verify find expects 0 and buffer.byteLength stays 6, on new Int8Array(buf, 0, 6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let view: Int8Array = new Int8Array(buf, 0, 6);
      let result: number | undefined = view.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 0;
      });
      expect(result).assertEqual(0);
      expect(view.buffer.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_5700
     * @tc.name int8ArrayFindPart02Test057
     * @tc.desc Verify find expects 0 and byteOffset stays 2, on new Int8Array(buf, 2, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int8Array = new Int8Array(buf, 2, 4);
      let result: number | undefined = view.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 0;
      });
      expect(result).assertEqual(0);
      expect(view.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_5800
     * @tc.name int8ArrayFindPart02Test058
     * @tc.desc Verify find on subarray(1, 4) preserves byteOffset, on Int8Array.of(1, 2, 3, 4, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let sub: Int8Array = base.subarray(1, 4);
      let result: number | undefined = sub.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 3;
      });
      expect(result).assertEqual(3);
      expect(sub.byteOffset).assertEqual(1);
      let r1: number = base.$_get(1);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = base.$_get(2);
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_5900
     * @tc.name int8ArrayFindPart02Test059
     * @tc.desc Verify find expects 7 and $_get(0) stays 7, on new Int8Array(buf)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf);
      view.$_set(0, 7);
      let result: number | undefined = view.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 7;
      });
      expect(result).assertEqual(7);
      expect(view.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_6000
     * @tc.name int8ArrayFindPart02Test060
     * @tc.desc Verify find expects 42 and second view stays 0, on new Int8Array(buf, 0, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let firstView: Int8Array = new Int8Array(buf, 0, 3);
      let secondView: Int8Array = new Int8Array(buf, 3, 3);
      firstView.$_set(0, 42);
      let result: number | undefined = firstView.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 42;
      });
      expect(result).assertEqual(42);
      expect(secondView.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_6100
     * @tc.name int8ArrayFindPart02Test061
     * @tc.desc Verify find expects 0 and leaves view.byteLength 6 from ArrayBuffer, on new Int8Array(buf, 0, 6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int8Array = new Int8Array(buf, 0, 6);
      let result: number | undefined = view.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 0;
      });
      expect(result).assertEqual(0);
      expect(view.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_6200
     * @tc.name int8ArrayFindPart02Test062
     * @tc.desc Verify find with predicate element == 9 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0, 4);
      view.$_set(2, 9);
      let result: number | undefined = view.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 9;
      });
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_6300
     * @tc.name int8ArrayFindPart02Test063
     * @tc.desc Verify find expects 5 from ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let view: Int8Array = new Int8Array(buf, 2, 3);
      view.$_set(0, 5);
      let result: number | undefined = view.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 5;
      });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_6400
     * @tc.name int8ArrayFindPart02Test064
     * @tc.desc Verify find on subarray(1, 3) expects 20, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(10, 20, 30);
      let sub: Int8Array = base.subarray(1, 3);
      let result: number | undefined = sub.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 20;
      });
      expect(result).assertEqual(20);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_6500
     * @tc.name int8ArrayFindPart02Test065
     * @tc.desc Verify find expects TypeError throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 8, 9);
      try {
        let found: number | undefined = arr.find((_v: number, _i: int, _a: Int8Array): boolean => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return false;
          }
          throw new TypeError('type');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_6600
     * @tc.name int8ArrayFindPart02Test066
     * @tc.desc Verify find expects Error throws exception, on Int8Array.of(4, 5, 6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(4, 5, 6);
      try {
        let found: number | undefined = arr.find((_v: number, _i: int, _a: Int8Array): boolean => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_6700
     * @tc.name int8ArrayFindPart02Test067
     * @tc.desc Verify find expects Error throws exception, on Int8Array.of(1, 2, 3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let count: int = 0;
      try {
        let found: number | undefined = arr.find((_v: number, i: int, _a: Int8Array): boolean => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return false;
          }
          count = count + 1;
          if (i === 2) {
            throw new Error('mid');
          }
          return false;
        });
        expect(found).assertUndefined();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(count).assertEqual(3);
        expect(e.message).assertEqual('mid');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_6800
     * @tc.name int8ArrayFindPart02Test068
     * @tc.desc Verify find expects Error throws exception, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let count: int = 0;
      try {
        let found: number | undefined = arr.find((_v: number, _i: int, _a: Int8Array): boolean => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return false;
          }
          count = count + 1;
          throw new Error('immediate');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(count).assertEqual(1);
        expect(e.message).assertEqual('immediate');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_6900
     * @tc.name int8ArrayFindPart02Test069
     * @tc.desc Verify find expects Error throws exception, on Int8Array.of(8, 9, 10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(8, 9, 10);
      try {
        let found: number | undefined = arr.find((_v: number, _i: int, _a: Int8Array): boolean => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return false;
          }
          throw new Error('generic');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_PART02_TEST_7000
     * @tc.name int8ArrayFindPart02Test070
     * @tc.desc Verify $_get(0) on empty Int8Array throws RangeError, find does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let found: number | undefined = arr.find((v: number, _i: int, _a: Int8Array): boolean => {
        return v === 0;
      });
      expect(found).assertUndefined();
      try {
        arr.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });
  });
}
