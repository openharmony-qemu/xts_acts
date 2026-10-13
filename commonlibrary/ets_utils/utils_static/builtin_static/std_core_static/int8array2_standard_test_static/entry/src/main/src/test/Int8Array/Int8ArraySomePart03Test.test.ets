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

function checkPositive(e: number): boolean {
  if (e > 0) {
    throw new RangeError('positive');
  }
  return false;
}

export default function int8ArraySomePart03Test(): void {
  describe('Int8ArraySomePart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_0600
     * @tc.name int8ArraySomePart03Test006
     * @tc.desc Verify some single zero always true returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        return true;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_0700
     * @tc.name int8ArraySomePart03Test007
     * @tc.desc Verify some single zero always false returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        return false;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_0800
     * @tc.name int8ArraySomePart03Test008
     * @tc.desc Verify some single max greater than one hundred returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        return e > 100;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_0900
     * @tc.name int8ArraySomePart03Test009
     * @tc.desc Verify some single min less than negative one hundred returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MIN]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        return e < -100;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_1000
     * @tc.name int8ArraySomePart03Test010
     * @tc.desc Verify some single element throwing predicate propagates RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5]);
      try {
        arr.some((e: number, i: int, a: Int8Array): boolean => {
          if (e < INT8_MIN || e > INT8_MAX) {
            return false;
          }
          throw new RangeError('single');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_1100
     * @tc.name int8ArraySomePart03Test011
     * @tc.desc Verify some predicate at zero equals passed element returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([99]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        let val: number | undefined = a.at(0);
        if (val === undefined) {
          return false;
        }
        return val === e;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_1200
     * @tc.name int8ArraySomePart03Test012
     * @tc.desc Verify some all zeros match zero short circuits first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 0, 0]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        return e === 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_1300
     * @tc.name int8ArraySomePart03Test013
     * @tc.desc Verify some all zeros no match traverses all three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 0, 0]);
      let counter: int[] = [0];
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        counter[0] = counter[0] + 1;
        return e === 1;
      });
      expect(result).assertFalse();
      let actual1: number = counter[0];
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_1400
     * @tc.name int8ArraySomePart03Test014
     * @tc.desc Verify some all max match 127 short circuits first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, INT8_MAX, INT8_MAX]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        return e === 127;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_1500
     * @tc.name int8ArraySomePart03Test015
     * @tc.desc Verify some all min negative predicate short circuits first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MIN, INT8_MIN, INT8_MIN]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        return e < 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_1600
     * @tc.name int8ArraySomePart03Test016
     * @tc.desc Verify some all fives not five traverses all three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 5, 5]);
      let counter: int[] = [0];
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        counter[0] = counter[0] + 1;
        return e !== 5;
      });
      expect(result).assertFalse();
      let actual1: number = counter[0];
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_1700
     * @tc.name int8ArraySomePart03Test017
     * @tc.desc Verify some all sevens match seven counter one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([7, 7, 7, 7]);
      let counter: int[] = [0];
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        counter[0] = counter[0] + 1;
        return e === 7;
      });
      expect(result).assertTrue();
      let actual1: number = counter[0];
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_1800
     * @tc.name int8ArraySomePart03Test018
     * @tc.desc Verify some throwing RangeError first element catch name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      try {
        arr.some((e: number, i: int, a: Int8Array): boolean => {
          if (e < INT8_MIN || e > INT8_MAX) {
            return false;
          }
          throw new RangeError('r');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_3600
     * @tc.name int8ArraySomePart03Test036
     * @tc.desc Verify some predicate at negative one returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        let val: number | undefined = a.at(-1);
        if (val === undefined) {
          return false;
        }
        return val === 40;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_3700
     * @tc.name int8ArraySomePart03Test037
     * @tc.desc Verify some predicate at negative length returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        let val: number | undefined = a.at(-4);
        if (val === undefined) {
          return false;
        }
        return val === 10;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_3800
     * @tc.name int8ArraySomePart03Test038
     * @tc.desc Verify some predicate at negative length minus one undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        let val: number | undefined = a.at(-5);
        return val === undefined;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_3900
     * @tc.name int8ArraySomePart03Test039
     * @tc.desc Verify some predicate at length out of bounds undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        let val: number | undefined = a.at(4);
        return val === undefined;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_4000
     * @tc.name int8ArraySomePart03Test040
     * @tc.desc Verify some predicate at length plus one undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        let val: number | undefined = a.at(5);
        return val === undefined;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_4100
     * @tc.name int8ArraySomePart03Test041
     * @tc.desc Verify some predicate at int max index undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        let val: number | undefined = a.at(2147483647);
        return val === undefined;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_4200
     * @tc.name int8ArraySomePart03Test042
     * @tc.desc Verify some predicate at negative nine ninety nine undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        let val: number | undefined = a.at(-999);
        return val === undefined;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_4300
     * @tc.name int8ArraySomePart03Test043
     * @tc.desc Verify some predicate at int minimum index undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        let val: number | undefined = a.at(-2147483648);
        return val === undefined;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_4400
     * @tc.name int8ArraySomePart03Test044
     * @tc.desc Verify some single element at zero returns forty two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        let val: number | undefined = a.at(0);
        if (val === undefined) {
          return false;
        }
        return val === 42;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_4500
     * @tc.name int8ArraySomePart03Test045
     * @tc.desc Verify some single element at negative two undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        let val: number | undefined = a.at(-2);
        return val === undefined;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_4600
     * @tc.name int8ArraySomePart03Test046
     * @tc.desc Verify empty array callback a.$_get(0) would be out of bounds but predicate never executes, some returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        let val: number | undefined = a.$_get(0);
        return val === undefined;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_4700
     * @tc.name int8ArraySomePart03Test047
     * @tc.desc Verify some predicate NaN never matches returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 1, -1, INT8_MAX, INT8_MIN]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        return e === Number.NaN;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_4800
     * @tc.name int8ArraySomePart03Test048
     * @tc.desc Verify some isNaN predicate never matches returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 1, -1, INT8_MAX, INT8_MIN]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        return isNaN(e);
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_4900
     * @tc.name int8ArraySomePart03Test049
     * @tc.desc Verify some positive infinity never matches returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 1, INT8_MAX, INT8_MIN]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        return e === Number.POSITIVE_INFINITY;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_5000
     * @tc.name int8ArraySomePart03Test050
     * @tc.desc Verify some negative infinity never matches returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 1, INT8_MAX, INT8_MIN]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        return e === -Number.POSITIVE_INFINITY;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_5100
     * @tc.name int8ArraySomePart03Test051
     * @tc.desc Verify some out of bounds undefined never matches returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        let oob: number | undefined = a.at(100);
        if (oob === undefined) {
          return false;
        }
        return e === oob;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_5200
     * @tc.name int8ArraySomePart03Test052
     * @tc.desc Verify some external null guard never matches returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 1, 2]);
      let extVal: int = 0;
      let extIsNull: boolean = true;
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        if (extIsNull) {
          return false;
        }
        return e === extVal;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_5300
     * @tc.name int8ArraySomePart03Test053
     * @tc.desc Verify some Number max value never matches returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 1, INT8_MAX, INT8_MIN]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        return e === Number.MAX_VALUE;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_5400
     * @tc.name int8ArraySomePart03Test054
     * @tc.desc Verify some Number min value never matches returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 1, INT8_MAX, INT8_MIN]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        return e === Number.MIN_VALUE;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_5500
     * @tc.name int8ArraySomePart03Test055
     * @tc.desc Verify some Number epsilon never matches returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 1, INT8_MAX, INT8_MIN]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        return e === Number.EPSILON;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_5600
     * @tc.name int8ArraySomePart03Test056
     * @tc.desc Verify some Math PI never matches returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 1, 2, 3]);
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        return e === Math.PI;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_5700
     * @tc.name int8ArraySomePart03Test057
     * @tc.desc Verify some set modifies subsequent element reads fifty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let seen: number[] = [];
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        seen.push(e);
        if (i === 0) {
          a.$_set(1, 50);
        }
        return false;
      });
      expect(result).assertFalse();
      let actual1: number = seen[1];
      let expected1: int = 50;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_5800
     * @tc.name int8ArraySomePart03Test058
     * @tc.desc Verify some length stable throughout iteration four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let len: int[] = [0];
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        len[0] = a.length;
        return e > 100;
      });
      expect(result).assertFalse();
      let actual1: number = len[0];
      let expected1: int = 4;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_5900
     * @tc.name int8ArraySomePart03Test059
     * @tc.desc Verify some counter three partial traversal short circuit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let counter: int[] = [0];
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        counter[0] = counter[0] + 1;
        return e === 3;
      });
      expect(result).assertTrue();
      let actual1: number = counter[0];
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_6000
     * @tc.name int8ArraySomePart03Test060
     * @tc.desc Verify some records hit index two short circuits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40]);
      let foundIdx: int[] = [-1];
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        if (e === 30) {
          foundIdx[0] = i;
          return true;
        }
        return false;
      });
      expect(result).assertTrue();
      let actual1: number = foundIdx[0];
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_6100
     * @tc.name int8ArraySomePart03Test061
     * @tc.desc Verify some fill zeros subsequent reads zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let seen: number[] = [];
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        seen.push(e);
        if (i === 0) {
          a.fill(0);
        }
        return false;
      });
      expect(result).assertFalse();
      let actual1: number = seen[1];
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: number = seen[2];
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_6200
     * @tc.name int8ArraySomePart03Test062
     * @tc.desc Verify some reverse in place subsequent reads reversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let seen: number[] = [];
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        seen.push(e);
        if (i === 0) {
          a.reverse();
        }
        return false;
      });
      expect(result).assertFalse();
      let actual1: number = seen[0];
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = seen[1];
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_6300
     * @tc.name int8ArraySomePart03Test063
     * @tc.desc Verify some throws then every on same array works correctly, array not corrupted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      try {
        arr.some((e: number, i: int, a: Int8Array): boolean => {
          if (e < INT8_MIN || e > INT8_MAX) {
            return false;
          }
          throw new RangeError('err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let allPositive = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return e > 0;
      });
      expect(allPositive).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_6400
     * @tc.name int8ArraySomePart03Test064
     * @tc.desc Verify some throws then array first element at(0) still equals original value 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      try {
        arr.some((e: number, i: int, a: Int8Array): boolean => {
          if (e < INT8_MIN || e > INT8_MAX) {
            return false;
          }
          throw new Error('x');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      let first: number | undefined = arr.at(0);
      expect(first).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_6500
     * @tc.name int8ArraySomePart03Test065
     * @tc.desc Verify some throws TypeError then includes on same array returns true normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 10, 15]);
      try {
        arr.some((e: number, i: int, a: Int8Array): boolean => {
          if (e < INT8_MIN || e > INT8_MAX) {
            return false;
          }
          throw new TypeError('t');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      let actual2: boolean = arr.includes(10);
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_6600
     * @tc.name int8ArraySomePart03Test066
     * @tc.desc Verify nested some inner returns boolean, outer throws RangeError based on inner result, inner does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      try {
        arr.some((e: number, i: int, a: Int8Array): boolean => {
          if (e < INT8_MIN || e > INT8_MAX) {
            return false;
          }
          let inner: boolean = a.some((e2: number, i2: int, a2: Int8Array): boolean => {
            return e2 > 3;
          });
          if (inner) {
            throw new RangeError('found big');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_6700
     * @tc.name int8ArraySomePart03Test067
     * @tc.desc Verify some throws then array byteLength unchanged, exception does not affect underlying buffer geometry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let beforeByteLen: int = arr.byteLength;
      try {
        arr.some((e: number, i: int, a: Int8Array): boolean => {
          if (e === 1) {
            throw new Error('check');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      let actual2: int = arr.byteLength;
      let expected2: number = beforeByteLen;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_6800
     * @tc.name int8ArraySomePart03Test068
     * @tc.desc Verify some internal catch returns false counter three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let counter: int[] = [0];
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        counter[0] = counter[0] + 1;
        try {
          if (e === 2) {
            throw new Error('internal');
          }
          return e === 99;
        } catch (err) {
          expect(err.name).assertEqual('Error');
          return false;
        }
      });
      expect(result).assertFalse();
      let actual1: number = counter[0];
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART03_TEST_6900
     * @tc.name int8ArraySomePart03Test069
     * @tc.desc Verify some graceful NaN check then five counter three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 1, 2]);
      let counter: int[] = [0];
      let result = arr.some((e: number, i: int, a: Int8Array): boolean => {
        counter[0] = counter[0] + 1;
        if (isNaN(e)) {
          return false;
        }
        return e === 5;
      });
      expect(result).assertFalse();
      let actual1: number = counter[0];
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });
  });
}
