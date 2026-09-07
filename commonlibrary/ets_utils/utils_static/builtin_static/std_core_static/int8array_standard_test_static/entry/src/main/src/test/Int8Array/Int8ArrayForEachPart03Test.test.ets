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

class CustomError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'CustomError';
  }
}

function getUndefinedCallback(): ((value: number, index: int, array: Int8Array) => void) | undefined {
  return undefined;
}

export default function int8ArrayForEachPart03Test(): void {
  describe('Int8ArrayForEachPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_0100
     * @tc.name int8ArrayForEachPart03Test001
     * @tc.desc Verify forEach throws RangeError on first element, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.forEach((v: number, _i: int, _a: Int8Array): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
          throw new RangeError('first-element-throw');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_0200
     * @tc.name int8ArrayForEachPart03Test002
     * @tc.desc Verify forEach expects TypeError throws exception, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      try {
        arr.forEach((v: number, _i: int, _a: Int8Array): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
          throw new TypeError('type-throw');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_0300
     * @tc.name int8ArrayForEachPart03Test003
     * @tc.desc Verify forEach expects Error throws exception, on new Int8Array([5, 10, 15])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 10, 15]);
      try {
        arr.forEach((v: number, _i: int, _a: Int8Array): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
          throw new Error('generic-throw');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_0400
     * @tc.name int8ArrayForEachPart03Test004
     * @tc.desc Verify forEach callback throws CustomError and exception type is correctly asserted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      try {
        arr.forEach((v: number, _i: int, _a: Int8Array): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
          throw new CustomError('custom-throw');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('CustomError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_0500
     * @tc.name int8ArrayForEachPart03Test005
     * @tc.desc Verify forEach callback increments counter then throws RangeError, counter equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let counter: int = 0;
      try {
        arr.forEach((v: number, _i: int, _a: Int8Array): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
          counter++;
          throw new RangeError('before-increment');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(counter).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_0600
     * @tc.name int8ArrayForEachPart03Test006
     * @tc.desc Verify forEach callback throws RangeError when i === 2 and counter equals 2 after processing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let counter: int = 0;
      try {
        arr.forEach((v: number, i: int, _a: Int8Array): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
          if (i === 2) {
            throw new RangeError('middle-throw');
          }
          counter++;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(counter).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_0700
     * @tc.name int8ArrayForEachPart03Test007
     * @tc.desc Verify forEach callback throws RangeError when i === 4 and counter equals 4 after processing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let counter: int = 0;
      try {
        arr.forEach((v: number, i: int, _a: Int8Array): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
          if (i === 4) {
            throw new RangeError('last-throw');
          }
          counter++;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(counter).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_0800
     * @tc.name int8ArrayForEachPart03Test008
     * @tc.desc Verify forEach throws Error with message preserved, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.forEach((v: number, _i: int, _a: Int8Array): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
          throw new Error('preserved-message');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('preserved-message');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_0900
     * @tc.name int8ArrayForEachPart03Test009
     * @tc.desc Verify forEach throws Error after pushing 1 element, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let external: number[] = [];
      try {
        arr.forEach((v: number, _i: int, _a: Int8Array): void => {
          external.push(v);
          throw new Error('after-push');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(external.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_1000
     * @tc.name int8ArrayForEachPart03Test010
     * @tc.desc Verify forEach callback throws Error after setting a[i] = 99 on first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.forEach((v: number, i: int, a: Int8Array): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
          a[i] = 99;
          throw new Error('after-set');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(arr[0]).assertEqual(99);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_1100
     * @tc.name int8ArrayForEachPart03Test011
     * @tc.desc Verify forEach callback throws RangeError when v === target and throwIdx equals 1 after processing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, INT8_MIN, INT8_MAX]);
      let throwIdx: int = -1;
      let target: number = INT8_MIN;
      try {
        arr.forEach((v: number, i: int, _a: Int8Array): void => {
          if (v === target) {
            throwIdx = i;
            throw new RangeError('min-value-throw');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(throwIdx).assertEqual(1);
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_1200
     * @tc.name int8ArrayForEachPart03Test012
     * @tc.desc Verify forEach callback throws TypeError when v === target and throwIdx equals 1 after processing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, INT8_MAX, INT8_MIN]);
      let throwIdx: int = -1;
      let target: number = INT8_MAX;
      try {
        arr.forEach((v: number, i: int, _a: Int8Array): void => {
          if (v === target) {
            throwIdx = i;
            throw new TypeError('max-value-throw');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(throwIdx).assertEqual(1);
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_1300
     * @tc.name int8ArrayForEachPart03Test013
     * @tc.desc Verify forEach callback throws Error when i === 3 and counter equals 3 after processing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let counter: int = 0;
      try {
        arr.forEach((v: number, i: int, _a: Int8Array): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
          if (i === 3) {
            throw new Error('index-3-throw');
          }
          counter++;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(counter).assertEqual(3);
        expect(e.message).assertEqual('index-3-throw');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_1400
     * @tc.name int8ArrayForEachPart03Test014
     * @tc.desc Verify forEach throws RangeError on first element, throwIdx equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MIN, INT8_MIN]);
      let throwIdx: int = -1;
      try {
        arr.forEach((v: number, i: int, _a: Int8Array): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
          throwIdx = i;
          throw new RangeError('all-same-first');
        });
        expect().assertFail();
      } catch (e) {
        expect(throwIdx).assertEqual(0);
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_1500
     * @tc.name int8ArrayForEachPart03Test015
     * @tc.desc Verify forEach expects TypeError throws exception, on new Int8Array([42])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      try {
        arr.forEach((v: number, _i: int, _a: Int8Array): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
          throw new TypeError('single-throw');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_1600
     * @tc.name int8ArrayForEachPart03Test016
     * @tc.desc Verify forEach expects 1 throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer: Int8Array = new Int8Array([1, 2]);
      let inner: Int8Array = new Int8Array([10, 20]);
      let outerCount: int = 0;
      try {
        outer.forEach((v: number, _i: int, _a: Int8Array): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
          outerCount++;
          inner.forEach((iv: number, _ii: int, _ia: Int8Array): void => {
            if (iv < INT8_MIN || iv > INT8_MAX) {
              return;
            }
            throw new Error('inner-throw');
          });
        });
        expect().assertFail();
      } catch (e) {
        expect(outerCount).assertEqual(1);
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_1700
     * @tc.name int8ArrayForEachPart03Test017
     * @tc.desc Verify forEach callback throws Error after reading a[0] = 7 on first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 8, 9]);
      let readValue: number = 0;
      try {
        arr.forEach((v: number, _i: int, a: Int8Array): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
          readValue = a[0];
          throw new Error('after-read');
        });
        expect().assertFail();
      } catch (e) {
        expect(readValue).assertEqual(7);
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_1800
     * @tc.name int8ArrayForEachPart03Test018
     * @tc.desc Verify forEach callback throws URIError and exception type is correctly asserted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      try {
        arr.forEach((v: number, _i: int, _a: Int8Array): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
          throw new URIError('uri-throw');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('URIError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_1900
     * @tc.name int8ArrayForEachPart03Test019
     * @tc.desc Verify forEach expects NullPointerError throws exception, on new Int8Array([1])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cb: ((value: number, index: int, array: Int8Array) => void) | undefined = getUndefinedCallback();
      let arr: Int8Array = new Int8Array([1]);
      try {
        arr.forEach(cb!);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_2000
     * @tc.name int8ArrayForEachPart03Test020
     * @tc.desc Verify forEach with undefined callback throws NullPointerError, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cb: ((value: number, index: int, array: Int8Array) => void) | undefined = undefined;
      let arr: Int8Array = new Int8Array(0);
      try {
        arr.forEach(cb!);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_2100
     * @tc.name int8ArrayForEachPart03Test021
     * @tc.desc Verify forEach expects NullPointerError throws exception, on new Int8Array([5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cb: ((value: number, index: int, array: Int8Array) => void) | null = null;
      let arr: Int8Array = new Int8Array([5]);
      try {
        arr.forEach(cb!);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_2200
     * @tc.name int8ArrayForEachPart03Test022
     * @tc.desc Verify forEach with null callback throws NullPointerError, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cb: ((value: number, index: int, array: Int8Array) => void) | null = null;
      let arr: Int8Array = new Int8Array(0);
      try {
        arr.forEach(cb!);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_2300
     * @tc.name int8ArrayForEachPart03Test023
     * @tc.desc Verify forEach callback not invoked on empty array, counter 0, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let counter: int = 0;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
        counter++;
      });
      expect(counter).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_2400
     * @tc.name int8ArrayForEachPart03Test024
     * @tc.desc Verify forEach on empty array never invokes callback, on new Int8Array([])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([]);
      let counter: int = 0;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
        counter++;
      });
      expect(counter).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_2500
     * @tc.name int8ArrayForEachPart03Test025
     * @tc.desc Verify forEach empty array, callback assertFail never triggers, counter stays 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let counter: int = 0;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
        counter++;
        expect().assertFail();
      });
      expect(counter).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_2600
     * @tc.name int8ArrayForEachPart03Test026
     * @tc.desc Verify forEach empty array, callback throw never triggers, counter stays 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let counter: int = 0;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
        counter++;
        throw new Error('never-called');
      });
      expect(counter).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_2700
     * @tc.name int8ArrayForEachPart03Test027
     * @tc.desc Verify forEach twice on empty array invokes no callback, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let counter: int = 0;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
        counter++;
      });
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
        counter++;
      });
      expect(counter).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_2800
     * @tc.name int8ArrayForEachPart03Test028
     * @tc.desc Verify forEach expects 1, on new Int8Array([5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let counter: int = 0;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
        counter++;
      });
      expect(counter).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_2900
     * @tc.name int8ArrayForEachPart03Test029
     * @tc.desc Verify forEach expects 0, on new Int8Array([5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let receivedIdx: int = -1;
      arr.forEach((v: number, i: int, _a: Int8Array): void => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
        receivedIdx = i;
      });
      expect(receivedIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_3000
     * @tc.name int8ArrayForEachPart03Test030
     * @tc.desc Verify forEach callback invokes once for single element [5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let receivedVal: number = 0;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        receivedVal = v;
      });
      expect(receivedVal).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_3100
     * @tc.name int8ArrayForEachPart03Test031
     * @tc.desc Verify forEach expects -128, on new Int8Array([-128])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN]);
      let receivedVal: number = 0;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        receivedVal = v;
      });
      expect(receivedVal).assertEqual(INT8_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_3200
     * @tc.name int8ArrayForEachPart03Test032
     * @tc.desc Verify forEach expects INT8_MAX, on new Int8Array([INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX]);
      let receivedVal: number = 0;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        receivedVal = v;
      });
      expect(receivedVal).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_3300
     * @tc.name int8ArrayForEachPart03Test033
     * @tc.desc Verify forEach expects 0, on new Int8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      let receivedVal: number = -1;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        receivedVal = v;
      });
      expect(receivedVal).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_3400
     * @tc.name int8ArrayForEachPart03Test034
     * @tc.desc Verify forEach expects -1, on new Int8Array([-1])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1]);
      let receivedVal: number = 0;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        receivedVal = v;
      });
      expect(receivedVal).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_3500
     * @tc.name int8ArrayForEachPart03Test035
     * @tc.desc Verify forEach returns undefined, on new Int8Array([5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      expect(
        arr.forEach((v: number, _i: int, _a: Int8Array): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
        }),
      ).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_3600
     * @tc.name int8ArrayForEachPart03Test036
     * @tc.desc Verify forEach callback invokes for each of 4 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 3, 3, 3]);
      let counter: int = 0;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
        counter++;
      });
      expect(counter).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_3700
     * @tc.name int8ArrayForEachPart03Test037
     * @tc.desc Verify all elements equal INT8_MIN during forEach, on new Int8Array([-128, -128, -128])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MIN, INT8_MIN]);
      let allMatch: boolean = true;
      let expected: number = INT8_MIN;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        if (v !== expected) {
          allMatch = false;
        }
      });
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_3800
     * @tc.name int8ArrayForEachPart03Test038
     * @tc.desc Verify forEach visits all 4 INT8_MAX elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MAX, INT8_MAX, INT8_MAX]);
      let allMatch: boolean = true;
      let expected: number = INT8_MAX;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        if (v !== expected) {
          allMatch = false;
        }
      });
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_3900
     * @tc.name int8ArrayForEachPart03Test039
     * @tc.desc Verify all elements equal 0 during forEach, on new Int8Array([0, 0, 0, 0, 0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0, 0, 0]);
      let allMatch: boolean = true;
      let expected: number = 0;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        if (v !== expected) {
          allMatch = false;
        }
      });
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_4000
     * @tc.name int8ArrayForEachPart03Test040
     * @tc.desc Verify all elements equal -1 during forEach, on new Int8Array([-1, -1, -1])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, -1, -1]);
      let allMatch: boolean = true;
      let expected: number = -1;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        if (v !== expected) {
          allMatch = false;
        }
      });
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_4100
     * @tc.name int8ArrayForEachPart03Test041
     * @tc.desc Verify forEach passes ascending indices 0-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 3, 3, 3]);
      let indices: int[] = [];
      arr.forEach((v: number, i: int, _a: Int8Array): void => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
        indices.push(i);
      });
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
      expect(indices[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_4200
     * @tc.name int8ArrayForEachPart03Test042
     * @tc.desc Verify forEach callback throws Error when i === 2 and counter equals 2 after processing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5, 5, 5]);
      let counter: int = 0;
      try {
        arr.forEach((v: number, i: int, _a: Int8Array): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
          if (i === 2) {
            throw new Error('all-same-idx-2');
          }
          counter++;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(counter).assertEqual(2);
        expect(e.message).assertEqual('all-same-idx-2');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_4300
     * @tc.name int8ArrayForEachPart03Test043
     * @tc.desc Verify forEach returns undefined, on new Int8Array([0, 0, 0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      expect(
        arr.forEach((v: number, _i: int, _a: Int8Array): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
        }),
      ).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_4400
     * @tc.name int8ArrayForEachPart03Test044
     * @tc.desc Verify forEach expects 0, on new Int8Array([10, 20, 30, 40, 50])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let firstIdx: int = -1;
      arr.forEach((v: number, i: int, _a: Int8Array): void => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
        if (firstIdx === -1) {
          firstIdx = i;
        }
      });
      expect(firstIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_4500
     * @tc.name int8ArrayForEachPart03Test045
     * @tc.desc Verify 5 forEach index 4 (length-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let lastIdx: int = -1;
      arr.forEach((v: number, i: int, _a: Int8Array): void => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
        lastIdx = i;
      });
      expect(lastIdx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_4600
     * @tc.name int8ArrayForEachPart03Test046
     * @tc.desc Verify 3 forEach index == length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sawLength: boolean = false;
      arr.forEach((v: number, i: int, _a: Int8Array): void => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
        if (i === arr.length) {
          sawLength = true;
        }
      });
      expect(sawLength).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_4700
     * @tc.name int8ArrayForEachPart03Test047
     * @tc.desc Verify 3 forEach index == -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sawMinusOne: boolean = false;
      arr.forEach((v: number, i: int, _a: Int8Array): void => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
        if (i === -1) {
          sawMinusOne = true;
        }
      });
      expect(sawMinusOne).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_4800
     * @tc.name int8ArrayForEachPart03Test048
     * @tc.desc Verify forEach callback index never negative, sawNegative stays false on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let sawNegative: boolean = false;
      arr.forEach((v: number, i: int, _a: Int8Array): void => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
        if (i < 0) {
          sawNegative = true;
        }
      });
      expect(sawNegative).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_4900
     * @tc.name int8ArrayForEachPart03Test049
     * @tc.desc Verify forEach passes contiguous indices 0-3, contiguous stays true on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let expected: int = 0;
      let contiguous: boolean = true;
      arr.forEach((v: number, i: int, _a: Int8Array): void => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
        if (i !== expected) {
          contiguous = false;
        }
        expected++;
      });
      expect(contiguous).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_5000
     * @tc.name int8ArrayForEachPart03Test050
     * @tc.desc Verify forEach passes strictly increasing indices, increasing stays true on new Int8Array([5, 10, 15, 20, 25])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 10, 15, 20, 25]);
      let prevIdx: int = -1;
      let increasing: boolean = true;
      arr.forEach((v: number, i: int, _a: Int8Array): void => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
        if (i <= prevIdx) {
          increasing = false;
        }
        prevIdx = i;
      });
      expect(increasing).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_5100
     * @tc.name int8ArrayForEachPart03Test051
     * @tc.desc Verify forEach expects -128, on new Int8Array([128, INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([128, INT8_MAX]);
      let vals: number[] = [];
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        vals.push(v);
      });
      let r1: number = vals[0];
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      expect(vals[1]).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_5200
     * @tc.name int8ArrayForEachPart03Test052
     * @tc.desc Verify forEach expects -1, on new Int8Array([255, 0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([255, 0]);
      let vals: number[] = [];
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        vals.push(v);
      });
      expect(vals[0]).assertEqual(-1);
      expect(vals[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_5300
     * @tc.name int8ArrayForEachPart03Test053
     * @tc.desc Verify forEach expects INT8_MAX, on new Int8Array([-129, -128])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-129, INT8_MIN]);
      let vals: number[] = [];
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        vals.push(v);
      });
      expect(vals[0]).assertEqual(INT8_MAX);
      let r1: number = vals[1];
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_5400
     * @tc.name int8ArrayForEachPart03Test054
     * @tc.desc Verify forEach expects 0, on new Int8Array([0x100, 0x81])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0x100, 0x81]);
      let vals: number[] = [];
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        vals.push(v);
      });
      expect(vals[0]).assertEqual(0);
      expect(vals[1]).assertEqual(-INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_5500
     * @tc.name int8ArrayForEachPart03Test055
     * @tc.desc Verify forEach expects 0, on new Int8Array([Number.NaN, 127.0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([Number.NaN, 127.0]);
      let vals: number[] = [];
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        vals.push(v);
      });
      expect(vals[0]).assertEqual(0);
      expect(vals[1]).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_5600
     * @tc.name int8ArrayForEachPart03Test056
     * @tc.desc Verify forEach expects 1, on new Int8Array([1.9, -1.9])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1.9, -1.9]);
      let vals: number[] = [];
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        vals.push(v);
      });
      expect(vals[0]).assertEqual(1);
      expect(vals[1]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_5700
     * @tc.name int8ArrayForEachPart03Test057
     * @tc.desc Verify forEach yields truncated values -128, 127, -1, -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([128, -129, 255, INT8_MIN]);
      let vals: number[] = [];
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        vals.push(v);
      });
      let r1: number = vals[0];
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      expect(vals[1]).assertEqual(INT8_MAX);
      expect(vals[2]).assertEqual(-1);
      let r2: number = vals[3];
      let e2: number = INT8_MIN;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_5800
     * @tc.name int8ArrayForEachPart03Test058
     * @tc.desc Verify forEach expects 0, on new Int8Array([-0.0, 0.0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-0.0, 0.0]);
      let vals: number[] = [];
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        vals.push(v);
      });
      expect(vals[0]).assertEqual(0);
      expect(vals[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_5900
     * @tc.name int8ArrayForEachPart03Test059
     * @tc.desc Verify forEach returns undefined, on new Int8Array([1, 2, 3, 4, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      expect(
        arr.forEach((v: number, _i: int, _a: Int8Array): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
        }),
      ).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_6000
     * @tc.name int8ArrayForEachPart03Test060
     * @tc.desc Verify forEach callback invokes for each of 3 elements, sum = 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sum: number = 0;
      let ret = arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        sum += v;
      });
      expect(ret).assertUndefined();
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_6100
     * @tc.name int8ArrayForEachPart03Test061
     * @tc.desc Verify forEach returns undefined, on new Int8Array([1, 2])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      let r1 = arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
      });
      let r2 = arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
      });
      expect(r1).assertUndefined();
      expect(r2).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_6200
     * @tc.name int8ArrayForEachPart03Test062
     * @tc.desc Verify forEach callback throws RangeError after processing 3 elements and counter equals 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let firstCount: int = 0;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
        firstCount++;
      });
      expect(firstCount).assertEqual(3);
      try {
        arr.forEach((v: number, _i: int, _a: Int8Array): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
          throw new RangeError('second-throws');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_6300
     * @tc.name int8ArrayForEachPart03Test063
     * @tc.desc Verify forEach throws Error after counter increments to 1, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let counter: int = 0;
      try {
        arr.forEach((v: number, _i: int, _a: Int8Array): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
          counter++;
          throw new Error('after-increment');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(counter).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_6400
     * @tc.name int8ArrayForEachPart03Test064
     * @tc.desc Verify forEach throws Error after type check, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let typeMatch: boolean = false;
      try {
        arr.forEach((v: number, _i: int, a: Int8Array): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
          typeMatch = a.length === 3;
          throw new Error('after-type-check');
        });
        expect().assertFail();
      } catch (e) {
        expect(typeMatch).assertTrue();
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_6500
     * @tc.name int8ArrayForEachPart03Test065
     * @tc.desc Verify forEach expects Error throws exception, on new Int8Array([1])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1]);
      try {
        arr.forEach((v: number, _i: int, _a: Int8Array): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
          throw new Error('');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_6600
     * @tc.name int8ArrayForEachPart03Test066
     * @tc.desc Verify forEach throws RangeError after length check, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let lengthOk: boolean = false;
      try {
        arr.forEach((v: number, _i: int, a: Int8Array): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
          if (a.length === 3) {
            lengthOk = true;
          }
          throw new RangeError('after-length-check');
        });
        expect().assertFail();
      } catch (e) {
        expect(lengthOk).assertTrue();
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_6700
     * @tc.name int8ArrayForEachPart03Test067
     * @tc.desc Verify forEach callback throws TypeError when v === target and throwIdx equals 0 after processing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      let throwIdx: int = -1;
      let target: number = 0;
      try {
        arr.forEach((v: number, i: int, _a: Int8Array): void => {
          if (v === target) {
            throwIdx = i;
            throw new TypeError('zero-throw');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(throwIdx).assertEqual(0);
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART03_TEST_6800
     * @tc.name int8ArrayForEachPart03Test068
     * @tc.desc Verify forEach expects 0 and INT8_MIN, on new Int8Array([Number.POSITIVE_INFINITY, INT8_MIN])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([Number.POSITIVE_INFINITY, INT8_MIN]);
      let vals: number[] = [];
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        vals.push(v);
      });
      expect(vals[0]).assertEqual(0);
      let r1: number = vals[1];
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });
  });
}
