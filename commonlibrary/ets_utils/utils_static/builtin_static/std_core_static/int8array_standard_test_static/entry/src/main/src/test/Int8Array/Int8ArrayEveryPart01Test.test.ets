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
import Utils from './../Util.test';

export default function int8ArrayEveryPart01Test(): void {
  describe('Int8ArrayEveryPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_0100
     * @tc.name int8ArrayEveryPart01Test001
     * @tc.desc Verify every returns true when all elements are > 0, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        return e > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_0200
     * @tc.name int8ArrayEveryPart01Test002
     * @tc.desc Verify every returns false when element -2 is not > 0, on new Int8Array([1, -2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, -2, 3]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        return e > 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_0300
     * @tc.name int8ArrayEveryPart01Test003
     * @tc.desc Verify every returns true when callback always returns true, on new Int8Array([10, -10, 0, INT8_MAX, INT8_MIN])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, -10, 0, INT8_MAX, INT8_MIN]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        return true;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_0400
     * @tc.name int8ArrayEveryPart01Test004
     * @tc.desc Verify every returns false when callback always returns false, on new Int8Array([10, -10, 0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, -10, 0]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        return false;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_0500
     * @tc.name int8ArrayEveryPart01Test005
     * @tc.desc Verify predicate true false every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        return e < 3;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_0600
     * @tc.name int8ArrayEveryPart01Test006
     * @tc.desc Verify every with predicate element < 10 returns false because 100 >= 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([100, 1, 2]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        return e < 10;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_0700
     * @tc.name int8ArrayEveryPart01Test007
     * @tc.desc Verify every returns true for positive elements including INT8_MAX, on new Int8Array([1, 50, INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 50, INT8_MAX]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        return e > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_0800
     * @tc.name int8ArrayEveryPart01Test008
     * @tc.desc Verify every returns false when element 1 is not 0, on new Int8Array([0, 0, 1])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 0, 1]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        return e === 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_0900
     * @tc.name int8ArrayEveryPart01Test009
     * @tc.desc Verify every returns true when all elements are 0, on new Int8Array([0, 0, 0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 0, 0]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        return e === 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_1000
     * @tc.name int8ArrayEveryPart01Test010
     * @tc.desc Verify every with predicate element >= INT8_MIN && element <= INT8_MAX returns true for all elements in valid Int8 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MIN, 0, INT8_MAX]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        return e >= INT8_MIN && e <= INT8_MAX;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_1100
     * @tc.name int8ArrayEveryPart01Test011
     * @tc.desc Verify every callback receives element 0 on new Int8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0]);
      let received: number = 999;
      const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        received = e;
        return true;
      });
      expect(result).assertTrue();
      expect(received).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_1200
     * @tc.name int8ArrayEveryPart01Test012
     * @tc.desc Verify every callback receives element INT8_MAX on new Int8Array([INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX]);
      let received: number = 0;
      const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        received = e;
        return true;
      });
      expect(result).assertTrue();
      expect(received).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_1300
     * @tc.name int8ArrayEveryPart01Test013
     * @tc.desc Verify every callback receives element -128 on new Int8Array([-128])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MIN]);
      let received: number = 0;
      const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        received = e;
        return true;
      });
      expect(result).assertTrue();
      expect(received).assertEqual(INT8_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_1400
     * @tc.name int8ArrayEveryPart01Test014
     * @tc.desc Verify every callback receives truncated -56 for element 200 on new Int8Array([200])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([200]);
      let received: number = 0;
      const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        received = e;
        return true;
      });
      expect(result).assertTrue();
      expect(received).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_1500
     * @tc.name int8ArrayEveryPart01Test015
     * @tc.desc Verify every callback receives truncated -1 for element 255 on new Int8Array([255])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([255]);
      let received: number = 0;
      const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        received = e;
        return true;
      });
      expect(result).assertTrue();
      expect(received).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_1600
     * @tc.name int8ArrayEveryPart01Test016
     * @tc.desc Verify every callback receives truncated -128 for element 128 on new Int8Array([128])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([128]);
      let received: number = 0;
      const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        received = e;
        return true;
      });
      expect(result).assertTrue();
      expect(received).assertEqual(INT8_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_1700
     * @tc.name int8ArrayEveryPart01Test017
     * @tc.desc Verify every callback receives truncated INT8_MAX for element -129 on new Int8Array([-129])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-129]);
      let received: number = 0;
      const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        received = e;
        return true;
      });
      expect(result).assertTrue();
      expect(received).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_1800
     * @tc.name int8ArrayEveryPart01Test018
     * @tc.desc Verify every callback receives 0 for Number.NaN on Int8Array.of(Number.NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(Number.NaN);
      let received: number = 999;
      const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        received = e;
        return true;
      });
      expect(result).assertTrue();
      expect(received).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_1900
     * @tc.name int8ArrayEveryPart01Test019
     * @tc.desc Verify every callback receives truncated 1 for 1.9 on Int8Array.of(1.9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1.9);
      let received: number = 0;
      const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        received = e;
        return true;
      });
      expect(result).assertTrue();
      expect(received).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_2000
     * @tc.name int8ArrayEveryPart01Test020
     * @tc.desc Verify every callback receives truncated -1 for -1.9 on Int8Array.of(-1.9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(-1.9);
      let received: number = 0;
      const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        received = e;
        return true;
      });
      expect(result).assertTrue();
      expect(received).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_2100
     * @tc.name int8ArrayEveryPart01Test021
     * @tc.desc Verify every callback encodes visited elements as 357 on new Int8Array([3, 5, 7])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 5, 7]);
      let encoded: number = 0;
      const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        encoded = encoded * 10 + e;
        return true;
      });
      expect(result).assertTrue();
      expect(encoded).assertEqual(357);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_2200
     * @tc.name int8ArrayEveryPart01Test022
     * @tc.desc Verify every stops at first element with callback index 0 on new Int8Array([5, 10, 15])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 10, 15]);
      let firstIndex: int = -1;
      const result: boolean = arr.every((e: number, i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        firstIndex = i;
        return false;
      });
      expect(result).assertFalse();
      expect(firstIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_2300
     * @tc.name int8ArrayEveryPart01Test023
     * @tc.desc Verify every callback encodes visited indexes as 12 on new Int8Array([4, 5, 6])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([4, 5, 6]);
      let indexSum: int = 0;
      const result: boolean = arr.every((e: number, i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        indexSum = indexSum * 10 + i;
        return true;
      });
      expect(result).assertTrue();
      expect(indexSum).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_2400
     * @tc.name int8ArrayEveryPart01Test024
     * @tc.desc Verify every callback receives index 0 on new Int8Array([42])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42]);
      let idx: int = -1;
      const result: boolean = arr.every((e: number, i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        idx = i;
        return true;
      });
      expect(result).assertTrue();
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_2500
     * @tc.name int8ArrayEveryPart01Test025
     * @tc.desc Verify every callback receives last index 4 on new Int8Array([1, 2, 3, 4, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let lastIndex: int = -1;
      const result: boolean = arr.every((e: number, i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        lastIndex = i;
        return true;
      });
      expect(result).assertTrue();
      expect(lastIndex).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_2600
     * @tc.name int8ArrayEveryPart01Test026
     * @tc.desc Verify predicate index === 0 true every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let result: boolean = arr.every((e: number, i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        return i === 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_2700
     * @tc.name int8ArrayEveryPart01Test027
     * @tc.desc Verify predicate index === length - 1 true every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let result: boolean = arr.every((e: number, i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        return i === 2;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_2800
     * @tc.name int8ArrayEveryPart01Test028
     * @tc.desc Verify every returns false when element at index 1 fails i % 2 === 0, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        return i % 2 === 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_2900
     * @tc.name int8ArrayEveryPart01Test029
     * @tc.desc Verify every callback receives the same array reference, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let sameRef: boolean = false;
      const result: boolean = arr.every((e: number, _i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        sameRef = a === arr;
        return true;
      });
      expect(result).assertTrue();
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_3000
     * @tc.name int8ArrayEveryPart01Test030
     * @tc.desc Verify every callback captures a.length 4, on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let arrLen: int = -1;
      const result: boolean = arr.every((e: number, _i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        arrLen = a.length;
        return true;
      });
      expect(result).assertTrue();
      expect(arrLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_3100
     * @tc.name int8ArrayEveryPart01Test031
     * @tc.desc Verify every returns true when a.length equals 3, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, _i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        return a.length === 3;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_3200
     * @tc.name int8ArrayEveryPart01Test032
     * @tc.desc Verify every callback sees $_get(i) matching element e, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let consistent: boolean = true;
      const result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        if (a.$_get(i) !== e) {
          consistent = false;
        }
        return true;
      });
      expect(result).assertTrue();
      expect(consistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_3300
     * @tc.name int8ArrayEveryPart01Test033
     * @tc.desc Verify every expects 4 byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let bl: int = -1;
      const result: boolean = arr.every((e: number, _i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        bl = a.byteLength;
        return true;
      });
      expect(result).assertTrue();
      expect(bl).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_3400
     * @tc.name int8ArrayEveryPart01Test034
     * @tc.desc Verify every callback array param has byteOffset 2 on new Int8Array(buf, 2, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new Int8Array(buf, 2, 4);
      let offset: int = -1;
      const result: boolean = arr.every((e: number, _i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        offset = a.byteOffset;
        return true;
      });
      expect(result).assertTrue();
      expect(offset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_3500
     * @tc.name int8ArrayEveryPart01Test035
     * @tc.desc Verify every throws RangeError from first callback invocation, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      try {
        const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
          if (e < INT8_MIN || e > INT8_MAX) {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_3600
     * @tc.name int8ArrayEveryPart01Test036
     * @tc.desc Verify every propagates TypeError thrown in callback on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      try {
        const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
          if (e < INT8_MIN || e > INT8_MAX) {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_3700
     * @tc.name int8ArrayEveryPart01Test037
     * @tc.desc Verify every propagates Error thrown in callback on new Int8Array([1, 2])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      try {
        const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
          if (e < INT8_MIN || e > INT8_MAX) {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_3800
     * @tc.name int8ArrayEveryPart01Test038
     * @tc.desc Verify every throws RangeError when callback i 1, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      try {
        const result: boolean = arr.every((e: number, i: int, _a: Int8Array): boolean => {
          if (e < INT8_MIN || e > INT8_MAX) {
            return false;
          }
          if (i === 1) {
            throw new RangeError('mid error');
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_3900
     * @tc.name int8ArrayEveryPart01Test039
     * @tc.desc Verify every throws RangeError when callback i 2, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      try {
        const result: boolean = arr.every((e: number, i: int, _a: Int8Array): boolean => {
          if (e < INT8_MIN || e > INT8_MAX) {
            return false;
          }
          if (i === 2) {
            throw new RangeError('last error');
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_4000
     * @tc.name int8ArrayEveryPart01Test040
     * @tc.desc Verify every propagates TypeError thrown in callback on single-element new Int8Array([42])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42]);
      try {
        const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
          if (e < INT8_MIN || e > INT8_MAX) {
            return false;
          }
          throw new TypeError('single error');
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_4100
     * @tc.name int8ArrayEveryPart01Test041
     * @tc.desc Verify every stops early when predicate returns false before an element that would throw, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let threw: boolean = false;
      try {
        const result: boolean = arr.every((e: number, i: int, _a: Int8Array): boolean => {
          if (e < INT8_MIN || e > INT8_MAX) {
            return false;
          }
          if (i === 1) {
            throw new RangeError('should not reach');
          }
          return false;
        });
        expect(result).assertFalse();
      } catch (e) {
        threw = true;
        expect(e.name).assertEqual('RangeError');
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_4200
     * @tc.name int8ArrayEveryPart01Test042
     * @tc.desc Verify every on empty Int8Array(0) returns true without invoking callback, no exception thrown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let threw: boolean = false;
      let result: boolean = false;
      try {
        result = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
          if (e < INT8_MIN || e > INT8_MAX) {
            return false;
          }
          throw new RangeError('should not reach');
        });
      } catch (e) {
        threw = true;
        expect(e.name).assertEqual('RangeError');
      }
      expect(threw).assertFalse();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_4300
     * @tc.name int8ArrayEveryPart01Test043
     * @tc.desc Verify every propagates Error with custom message from callback on new Int8Array([1])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1]);
      let msg: string = '';
      try {
        const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
          if (e < INT8_MIN || e > INT8_MAX) {
            return false;
          }
          throw new Error('custom message 12345');
        });
        expect(result).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        msg = e.message;
      }
      expect(msg).assertEqual('custom message 12345');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_4400
     * @tc.name int8ArrayEveryPart01Test044
     * @tc.desc Verify every stops after first false callback on new Int8Array([1, 2, 3, 4, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let callCount: int = 0;
      const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        callCount = callCount + 1;
        return false;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_4500
     * @tc.name int8ArrayEveryPart01Test045
     * @tc.desc Verify every invokes callback 3 times until i < 2 is false on new Int8Array([1, 2, 3, 4, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let callCount: int = 0;
      const result: boolean = arr.every((e: number, i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        callCount = callCount + 1;
        return i < 2;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_4600
     * @tc.name int8ArrayEveryPart01Test046
     * @tc.desc Verify every callback returns false at i 3, invoked 4 times, on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let callCount: int = 0;
      const result: boolean = arr.every((e: number, i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        callCount = callCount + 1;
        return i < 3;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_4700
     * @tc.name int8ArrayEveryPart01Test047
     * @tc.desc Verify every callback invoked for all 4 elements, on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let callCount: int = 0;
      const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        callCount = callCount + 1;
        return true;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_4800
     * @tc.name int8ArrayEveryPart01Test048
     * @tc.desc Verify every on empty array returns true without invoking callback on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let callCount: int = 0;
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        callCount = callCount + 1;
        return true;
      });
      expect(callCount).assertEqual(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_4900
     * @tc.name int8ArrayEveryPart01Test049
     * @tc.desc Verify every expects 1 when callback always returns false, on new Int8Array([42])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42]);
      let callCount: int = 0;
      const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        callCount = callCount + 1;
        return false;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_5000
     * @tc.name int8ArrayEveryPart01Test050
     * @tc.desc Verify every expects 1 when callback always returns true, on new Int8Array([42])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42]);
      let callCount: int = 0;
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        callCount = callCount + 1;
        return true;
      });
      expect(callCount).assertEqual(1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_5100
     * @tc.name int8ArrayEveryPart01Test051
     * @tc.desc Verify every with predicate element < 2 stops at element 2 and returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let lastSeen: number = -1;
      const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        lastSeen = e;
        return e < 2;
      });
      expect(result).assertFalse();
      expect(lastSeen).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_5200
     * @tc.name int8ArrayEveryPart01Test052
     * @tc.desc Verify every on empty new Int8Array(0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        return false;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_5300
     * @tc.name int8ArrayEveryPart01Test053
     * @tc.desc Verify every on empty subarray(1, 1) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([1, 2, 3]);
      let empty = base.subarray(1, 1);
      let result: boolean = empty.every((e: number, _i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        return false;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_5400
     * @tc.name int8ArrayEveryPart01Test054
     * @tc.desc Verify every on empty slice(5, 1) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([1, 2, 3]);
      let empty = base.slice(5, 1);
      let result: boolean = empty.every((e: number, _i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        return false;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_5500
     * @tc.name int8ArrayEveryPart01Test055
     * @tc.desc Verify every on empty ArrayBuffer view returns true on new Int8Array(buf)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let arr = new Int8Array(buf);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        return false;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_5600
     * @tc.name int8ArrayEveryPart01Test056
     * @tc.desc Verify every with predicate element > threshold returns false because 5 is not > 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 10, 15]);
      let threshold: number = 8;
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        return e > threshold;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_5700
     * @tc.name int8ArrayEveryPart01Test057
     * @tc.desc Verify every invokes callback 3 times for all elements on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let counter: int = 0;
      const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        counter = counter + 1;
        return e < 3;
      });
      expect(result).assertFalse();
      expect(counter).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_5800
     * @tc.name int8ArrayEveryPart01Test058
     * @tc.desc Verify every with predicate element == ref[i] returns true for all matching ref elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let ref: int[] = [10, 20, 30];
      let result: boolean = arr.every((e: number, i: int, _a: Int8Array): boolean => {
        return e === ref[i];
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_5900
     * @tc.name int8ArrayEveryPart01Test059
     * @tc.desc Verify every callback sums visited elements to 6 on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let sum: number = 0;
      const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        sum = sum + e;
        return true;
      });
      expect(result).assertTrue();
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_6000
     * @tc.name int8ArrayEveryPart01Test060
     * @tc.desc Verify every stops at element 3 collecting 2 elements below 3 on new Int8Array([1, 2, 3, 4, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let passed: Array<number> = [];
      const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        if (e < 3) {
          passed.push(e);
          return true;
        }
        return false;
      });
      expect(result).assertFalse();
      expect(passed.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_6100
     * @tc.name int8ArrayEveryPart01Test061
     * @tc.desc Verify every returns true when element e equals (i + 1) * 10, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let result: boolean = arr.every((e: number, i: int, _a: Int8Array): boolean => {
        return e === (i + 1) * 10;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_6200
     * @tc.name int8ArrayEveryPart01Test062
     * @tc.desc Verify every with predicate element <= a.length returns true for all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, _i: int, a: Int8Array): boolean => {
        return e <= a.length;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_6300
     * @tc.name int8ArrayEveryPart01Test063
     * @tc.desc Verify every callback reads a.$_get(i) equals (i+1)*5 on new Int8Array([5, 10, 15])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 10, 15]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        return a.$_get(i) === (i + 1) * 5;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_6400
     * @tc.name int8ArrayEveryPart01Test064
     * @tc.desc Verify every returns true when e === i + 1 and a.length === 3, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return e === i + 1 && a.length === 3;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_6500
     * @tc.name int8ArrayEveryPart01Test065
     * @tc.desc Verify every with predicate element >= 100 returns true for all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([100, 110, 120]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        return e >= 100;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_6600
     * @tc.name int8ArrayEveryPart01Test066
     * @tc.desc Verify every returns true when all indices satisfy i < 4, on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let result: boolean = arr.every((e: number, i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        return i < 4;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_6700
     * @tc.name int8ArrayEveryPart01Test067
     * @tc.desc Verify every returns true when a.length > 0, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, _i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        return a.length > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_6800
     * @tc.name int8ArrayEveryPart01Test068
     * @tc.desc Verify every(fn) with named callback fn returning e > 0 is true, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let fn: (e: number, i: int, a: Int8Array) => boolean = (e: number, i: int, a: Int8Array): boolean => {
        return e > 0;
      };
      let result: boolean = arr.every(fn);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_6900
     * @tc.name int8ArrayEveryPart01Test069
     * @tc.desc Verify every with predicate element > 0 via isPositive returns true for all positive elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isPositive = (e: number, i: int, a: Int8Array): boolean => {
        return e > 0;
      };
      let arr = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every(isPositive);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_7000
     * @tc.name int8ArrayEveryPart01Test070
     * @tc.desc Verify every returns true when e > 0 and e < 100 and i >= 0, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let result: boolean = arr.every((e: number, i: int, _a: Int8Array): boolean => {
        return e > 0 && e < 100 && i >= 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_7100
     * @tc.name int8ArrayEveryPart01Test071
     * @tc.desc Verify every returns true when all four elements are 0, on new Int8Array([0, 0, 0, 0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 0, 0, 0]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        return e === 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_7200
     * @tc.name int8ArrayEveryPart01Test072
     * @tc.desc Verify every with predicate element < 0 returns true for all negative elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-1, -50, INT8_MIN]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        return e < 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_7300
     * @tc.name int8ArrayEveryPart01Test073
     * @tc.desc Verify every invokes callback 100 times and returns true on new Int8Array(100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(100);
      let callCount: int = 0;
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        callCount = callCount + 1;
        return e === 0;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_7400
     * @tc.name int8ArrayEveryPart01Test074
     * @tc.desc Verify every on ArrayBuffer view invokes callback 4 times and returns true on new Int8Array(buf)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let arr = new Int8Array(buf);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      arr.$_set(3, 40);
      let callCount: int = 0;
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        callCount = callCount + 1;
        return e > 0;
      });
      expect(callCount).assertEqual(4);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_7500
     * @tc.name int8ArrayEveryPart01Test075
     * @tc.desc Verify every expects 0, on Int8Array.of(Number.POSITIVE_INFINITY), callback receives e = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(Number.POSITIVE_INFINITY);
      let received: number = 0;
      const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        received = e;
        return true;
      });
      expect(result).assertTrue();
      expect(received).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_7600
     * @tc.name int8ArrayEveryPart01Test076
     * @tc.desc Verify every expects 0, on Int8Array.of(-Number.POSITIVE_INFINITY), callback receives e = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(-Number.POSITIVE_INFINITY);
      let received: number = 0;
      const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        received = e;
        return true;
      });
      expect(result).assertTrue();
      expect(received).assertEqual(0);
    });
  });
}
