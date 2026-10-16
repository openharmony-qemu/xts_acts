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

class CustomError001 extends Error {
  constructor(msg: string) {
    super(msg);
    this.name = 'CustomError001';
  }
}

export default function int8ArrayReducePart03Test(): void {
  describe('Int8ArrayReducePart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_0100
     * @tc.name int8ArrayReducePart03Test001
     * @tc.desc Verify reduce callbackfn + initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_0200
     * @tc.name int8ArrayReducePart03Test002
     * @tc.desc Verify reduce callbackfn + initialValue initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 99);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_0300
     * @tc.name int8ArrayReducePart03Test003
     * @tc.desc Verify reduce callbackfn currentIndex=0 initialValue prev initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let firstIdx: int = 0;
      let captured: boolean = false;
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        if (!captured) {
          firstIdx = idx;
          captured = true;
        }
        return prev + cur;
      }, 0);
      expect(firstIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_0400
     * @tc.name int8ArrayReducePart03Test004
     * @tc.desc Verify reduce callbackfn currentIndex=1 initialValue prev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let firstIdx: int = 0;
      let captured: boolean = false;
      let resultVal1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        if (!captured) {
          firstIdx = idx;
          captured = true;
        }
        return prev + cur;
      });
      let expectedVal1: number = 60;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(firstIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_0500
     * @tc.name int8ArrayReducePart03Test005
     * @tc.desc Verify reduce last call index length minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let lastIdx: int = 0;
      let resultVal1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        lastIdx = idx;
        return prev + cur;
      });
      let expectedVal1: number = 100;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(lastIdx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_0600
     * @tc.name int8ArrayReducePart03Test006
     * @tc.desc Verify reduce callbackfn currentIndex initialValue 4 4 idx=0,1,2,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let indices: number[] = [];
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        indices.push(idx);
        return prev + cur;
      }, 0);
      let actualLength: int = indices.length;
      let expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
      let firstIndex: number = indices[0];
      let expectedFirstIdx: int = 0;
      expect(firstIndex).assertEqual(expectedFirstIdx);
      let lastIndex: number = indices[3];
      let expectedLastIdx: int = 3;
      expect(lastIndex).assertEqual(expectedLastIdx);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_0700
     * @tc.name int8ArrayReducePart03Test007
     * @tc.desc Verify reduce callbackfn currentIndex initialValue 4 3 idx=1,2,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let indices: number[] = [];
      let resultVal1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        indices.push(idx);
        return prev + cur;
      });
      let expectedVal1: number = 100;
      expect(resultVal1).assertEqual(expectedVal1);
      let actualLength: int = indices.length;
      let expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      let firstIndex: number = indices[0];
      let expectedFirstIdx: int = 1;
      expect(firstIndex).assertEqual(expectedFirstIdx);
      let lastIndex: number = indices[2];
      let expectedLastIdx: int = 3;
      expect(lastIndex).assertEqual(expectedLastIdx);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_0800
     * @tc.name int8ArrayReducePart03Test008
     * @tc.desc Verify reduce callbackfn currentValue int8 127 int8 number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, 1]);
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      expect(result).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_0900
     * @tc.name int8ArrayReducePart03Test009
     * @tc.desc Verify reduce callbackfn currentValue int8 -128 int8 number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, -1]);
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      expect(result).assertEqual(-129);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_1000
     * @tc.name int8ArrayReducePart03Test010
     * @tc.desc Verify reduce callbackfn currentValue 200 -56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([200, 0]);
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      expect(result).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_1100
     * @tc.name int8ArrayReducePart03Test011
     * @tc.desc Verify reduce callbackfn currentValue 255 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([255, 1]);
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_1200
     * @tc.name int8ArrayReducePart03Test012
     * @tc.desc Verify reduce callbackfn currentValue 0 /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_1300
     * @tc.name int8ArrayReducePart03Test013
     * @tc.desc Verify reduce callbackfn receives array argument equal to arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let captured: Int8Array = new Int8Array(0);
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        if (idx === 0) {
          captured = a;
        }
        return prev + cur;
      }, 0);
      expect(captured).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_1400
     * @tc.name int8ArrayReducePart03Test014
     * @tc.desc Verify reduce callback array parameter length five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let arrLen: number = 0;
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        arrLen = a.length;
        return prev + cur;
      }, 0);
      expect(arrLen).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_1500
     * @tc.name int8ArrayReducePart03Test015
     * @tc.desc Verify reduce callbackfn array $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let elemAt1: number = 0;
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        if (idx === 1) {
          elemAt1 = a.$_get(1);
        }
        return prev + cur;
      }, 0);
      expect(elemAt1).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_1600
     * @tc.name int8ArrayReducePart03Test016
     * @tc.desc Verify reduce callbackfn previousValue starts at initialValue 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20]);
      let firstPrev: number = 0;
      let captured: boolean = false;
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        if (!captured) {
          firstPrev = prev;
          captured = true;
        }
        return prev + cur;
      }, 100);
      expect(firstPrev).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_1700
     * @tc.name int8ArrayReducePart03Test017
     * @tc.desc Verify reduce callbackfn previousValue starts at first element without initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let firstPrev: number = 0;
      let captured: boolean = false;
      let resultVal1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        if (!captured) {
          firstPrev = prev;
          captured = true;
        }
        return prev + cur;
      });
      let expectedVal1: number = 60;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(firstPrev).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_1800
     * @tc.name int8ArrayReducePart03Test018
     * @tc.desc Verify reduce callbackfn previousValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let secondPrev: number = 0;
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        if (idx === 1) {
          secondPrev = prev;
        }
        return prev + cur;
      }, 0);
      expect(secondPrev).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_1900
     * @tc.name int8ArrayReducePart03Test019
     * @tc.desc Verify reduce callbackfn applies multiplier 10 to each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let multiplier: number = 10;
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur * multiplier;
      }, 0);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_2000
     * @tc.name int8ArrayReducePart03Test020
     * @tc.desc Verify reduce callbackfn accumulates element sum as side effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sum: number = 0;
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        sum = sum + cur;
        return prev + cur;
      }, 0);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_2100
     * @tc.name int8ArrayReducePart03Test021
     * @tc.desc Verify callbackfn reduce array reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        let innerSum: number = a.reduce<number>((p: number, c: number, i: int, aa: Int8Array) => {
          return p + c;
        }, 0);
        return prev + innerSum;
      }, 0);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_2200
     * @tc.name int8ArrayReducePart03Test022
     * @tc.desc Verify reduce callbackfn always returns constant 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return 7;
      }, 0);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_2300
     * @tc.name int8ArrayReducePart03Test023
     * @tc.desc Verify reduce callbackfn initialValue n n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let callCount: number = 0;
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        callCount = callCount + 1;
        return prev + cur;
      }, 0);
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_2400
     * @tc.name int8ArrayReducePart03Test024
     * @tc.desc Verify reduce callbackfn initialValue n n-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let callCount: number = 0;
      let resultVal1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        callCount = callCount + 1;
        return prev + cur;
      });
      let expectedVal1: number = 15;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_2500
     * @tc.name int8ArrayReducePart03Test025
     * @tc.desc Verify reduce callbackfn throws Error on first call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
          throw new Error('first call error');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_2600
     * @tc.name int8ArrayReducePart03Test026
     * @tc.desc Verify reduce callbackfn throws Error at middle index 2 of 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      try {
        arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
          if (idx === 2) {
            throw new Error('mid call error');
          }
          return prev + cur;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_2700
     * @tc.name int8ArrayReducePart03Test027
     * @tc.desc Verify reduce callbackfn throws Error at last call for 3-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
          if (idx === 2) {
            throw new Error('last call error');
          }
          return prev + cur;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_2800
     * @tc.name int8ArrayReducePart03Test028
     * @tc.desc Verify reduce callbackfn RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
          throw new RangeError('range error');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_2900
     * @tc.name int8ArrayReducePart03Test029
     * @tc.desc Verify reduce callbackfn TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
          throw new TypeError('type error');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_3000
     * @tc.name int8ArrayReducePart03Test030
     * @tc.desc Verify reduce callbackfn throws CustomError001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
          throw new CustomError001('custom');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('CustomError001');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_3100
     * @tc.name int8ArrayReducePart03Test031
     * @tc.desc Verify reduce callbackfn initialValue 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let callCount: number = 0;
      let result: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        callCount = callCount + 1;
        return prev + cur;
      });
      expect(callCount).assertEqual(0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_3200
     * @tc.name int8ArrayReducePart03Test032
     * @tc.desc Verify reduce callbackfn initialValue 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let callCount: number = 0;
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        callCount = callCount + 1;
        return prev + cur;
      }, 100);
      expect(callCount).assertEqual(1);
      expect(result).assertEqual(142);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_3300
     * @tc.name int8ArrayReducePart03Test033
     * @tc.desc Verify callbackfn $_set array reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        a.$_set(0, 99);
        return prev + cur;
      }, 0);
      let mutatedValue: number = arr.$_get(0);
      let expectedValue: int = 99;
      expect(mutatedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_3400
     * @tc.name int8ArrayReducePart03Test034
     * @tc.desc Verify reduce callbackfn array argument exposes first and last elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let firstElem: number = 0;
      let lastElem: number = 0;
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        if (idx === 0) {
          firstElem = a.$_get(0);
          lastElem = a.$_get(a.length - 1);
        }
        return prev + cur;
      }, 0);
      expect(firstElem).assertEqual(10);
      expect(lastElem).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_3500
     * @tc.name int8ArrayReducePart03Test035
     * @tc.desc Verify reduce(prev*cur, 1) product is 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([2, 3, 4]);
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev * cur;
      }, 1);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_3600
     * @tc.name int8ArrayReducePart03Test036
     * @tc.desc Verify reduce initialValue=-128 int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, -128);
      expect(result).assertEqual(-125);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_3700
     * @tc.name int8ArrayReducePart03Test037
     * @tc.desc Verify reduce with initialValue 100 computes 100 minus sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20]);
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev - cur;
      }, 100);
      expect(result).assertEqual(70);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_3800
     * @tc.name int8ArrayReducePart03Test038
     * @tc.desc Verify reduce initialValue int8 number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 1000);
      expect(result).assertEqual(1003);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_3900
     * @tc.name int8ArrayReducePart03Test039
     * @tc.desc Verify reduce<string> on empty array with '' returns ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: string = arr.reduce<string>((prev: string, cur: number, idx: int, a: Int8Array): string => {
        return prev + cur.toString();
      }, '');
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_4000
     * @tc.name int8ArrayReducePart03Test040
     * @tc.desc Verify reduce<number[]> collects 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let init: number[] = [];
      let result: number[] = arr.reduce<number[]>((prev: number[], cur: number, idx: int, a: Int8Array): number[] => {
        prev.push(cur);
        return prev;
      }, init);
      let actualLength: int = result.length;
      let expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      let firstElement: number = result[0];
      let expectedFirst: int = 10;
      expect(firstElement).assertEqual(expectedFirst);
      let thirdElement: number = result[2];
      let expectedThird: int = 30;
      expect(thirdElement).assertEqual(expectedThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_4100
     * @tc.name int8ArrayReducePart03Test041
     * @tc.desc Verify reduce<boolean> with true initial is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.reduce<boolean>((prev: boolean, cur: number, idx: int, a: Int8Array): boolean => {
        return prev && cur > 0;
      }, true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_4200
     * @tc.name int8ArrayReducePart03Test042
     * @tc.desc Verify initialValue=false reduce<boolean> false false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.reduce<boolean>((prev: boolean, cur: number, idx: int, a: Int8Array): boolean => {
        return prev && cur > 0;
      }, false);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_4300
     * @tc.name int8ArrayReducePart03Test043
     * @tc.desc Verify reduce with initialValue 5 invokes callback 3 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 10, 15]);
      let callCount: number = 0;
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        callCount = callCount + 1;
        return prev + cur;
      }, 5);
      expect(callCount).assertEqual(3);
      expect(result).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_4400
     * @tc.name int8ArrayReducePart03Test044
     * @tc.desc Verify reduce<string> string initialValue number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: string = arr.reduce<string>((prev: string, cur: number, idx: int, a: Int8Array): string => {
        return prev + cur.toString();
      }, 'S:');
      expect(result).assertEqual('S:123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_4500
     * @tc.name int8ArrayReducePart03Test045
     * @tc.desc Verify reduce initialValue prev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 7, 2, 9, 1]);
      let result: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        if (cur > prev) {
          return cur;
        }
        return prev;
      });
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_4600
     * @tc.name int8ArrayReducePart03Test046
     * @tc.desc Verify reduce initialValue initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 7, 2]);
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        if (cur > prev) {
          return cur;
        }
        return prev;
      }, 10);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_4700
     * @tc.name int8ArrayReducePart03Test047
     * @tc.desc Verify reduce without initialValue finds minimum element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 7, 2, 9, 1]);
      let result: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        if (cur < prev) {
          return cur;
        }
        return prev;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_4800
     * @tc.name int8ArrayReducePart03Test048
     * @tc.desc Verify reduce 0 initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, -5, 3, -3]);
      let result: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_4900
     * @tc.name int8ArrayReducePart03Test049
     * @tc.desc Verify reduce returns same result on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let reducedResult: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      let reducedResult2: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      expect(reducedResult).assertEqual(60);
      expect(reducedResult2).assertEqual(60);
      expect(reducedResult).assertEqual(reducedResult2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_5000
     * @tc.name int8ArrayReducePart03Test050
     * @tc.desc Verify reduce result usable in arithmetic expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: number =
        arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
          return prev + cur;
        }, 0) + 10;
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_5100
     * @tc.name int8ArrayReducePart03Test051
     * @tc.desc Verify reduce reduce initialValue reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Int8Array = new Int8Array([1, 2, 3]);
      let arr2: Int8Array = new Int8Array([10, 20]);
      let result: number = arr2.reduce<number>(
        (prev: number, cur: number, idx: int, a: Int8Array) => {
          return prev + cur;
        },
        arr1.reduce<number>((p: number, c: number, i: int, aa: Int8Array) => {
          return p + c;
        }, 0),
      );
      expect(result).assertEqual(36);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_5200
     * @tc.name int8ArrayReducePart03Test052
     * @tc.desc Verify reduce leaves elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      let actualValue0: number = arr.$_get(0);
      let expectedValue0: int = 1;
      expect(actualValue0).assertEqual(expectedValue0);
      let actualValue1: number = arr.$_get(1);
      let expectedValue1: int = 2;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2: number = arr.$_get(2);
      let expectedValue2: int = 3;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_5300
     * @tc.name int8ArrayReducePart03Test053
     * @tc.desc Verify - reduce length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let beforeLen: number = arr.length;
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      let actualLength: int = arr.length;
      let expectedLength: number = beforeLen;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_5400
     * @tc.name int8ArrayReducePart03Test054
     * @tc.desc Verify reduce 127 int8 number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MAX]);
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      expect(result).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_5500
     * @tc.name int8ArrayReducePart03Test055
     * @tc.desc Verify reduce -128 int8 number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MIN]);
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      expect(result).assertEqual(-256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_5600
     * @tc.name int8ArrayReducePart03Test056
     * @tc.desc Verify reduce 200 -56, 300 44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([200, 300]);
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      expect(result).assertEqual(-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_5700
     * @tc.name int8ArrayReducePart03Test057
     * @tc.desc Verify reduce() accumulates array values using reducer callback with initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MIN, INT8_MAX, INT8_MIN]);
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_5800
     * @tc.name int8ArrayReducePart03Test058
     * @tc.desc Verify reduce initialValue TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      try {
        arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
          return prev + cur;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_5900
     * @tc.name int8ArrayReducePart03Test059
     * @tc.desc Verify reduce callbackfn Error aborts with gotResult false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let gotResult: boolean = false;
      try {
        let r: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
          if (idx === 0) {
            throw new Error('abort');
          }
          return prev + cur;
        }, 0);
        gotResult = true;
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(gotResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_6000
     * @tc.name int8ArrayReducePart03Test060
     * @tc.desc Verify reduce callbackfn throws Error at index 2 after accumulating 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let accumulated: number = 0;
      try {
        arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
          accumulated = accumulated + cur;
          if (idx === 2) {
            throw new Error('mid abort');
          }
          return prev + cur;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(accumulated).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_6100
     * @tc.name int8ArrayReducePart03Test061
     * @tc.desc Verify reduce<string> concatenates mixed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, -2, 3]);
      let result: string = arr.reduce<string>((prev: string, cur: number, idx: int, a: Int8Array): string => {
        return prev + cur.toString();
      }, '');
      expect(result).assertEqual('1-23');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_6200
     * @tc.name int8ArrayReducePart03Test062
     * @tc.desc Verify reduce<string> on single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7]);
      let result: string = arr.reduce<string>((prev: string, cur: number, idx: int, a: Int8Array): string => {
        return prev + cur.toString();
      }, '');
      expect(result).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_6300
     * @tc.name int8ArrayReducePart03Test063
     * @tc.desc Verify reduce<string> int8 127 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MIN]);
      let result: string = arr.reduce<string>((prev: string, cur: number, idx: int, a: Int8Array): string => {
        return prev + cur.toString();
      }, '');
      expect(result).assertEqual('127-128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_6400
     * @tc.name int8ArrayReducePart03Test064
     * @tc.desc Verify reduce<string> with initialValue joins to 'values:123'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: string = arr.reduce<string>((prev: string, cur: number, idx: int, a: Int8Array): string => {
        return prev + cur.toString();
      }, 'values:');
      expect(result).assertEqual('values:123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_6500
     * @tc.name int8ArrayReducePart03Test065
     * @tc.desc Verify reduce<string> builds comma joined string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: string = arr.reduce<string>((prev: string, cur: number, idx: int, a: Int8Array): string => {
        if (idx === 0) {
          return cur.toString();
        }
        return prev + ',' + cur.toString();
      }, '');
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_6600
     * @tc.name int8ArrayReducePart03Test066
     * @tc.desc Verify reduce<number> average equals 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let sum: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      let avg: number = sum / arr.length;
      expect(avg).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_6700
     * @tc.name int8ArrayReducePart03Test067
     * @tc.desc Verify reduce<boolean> returns false on negative element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, -2, 3]);
      let result: boolean = arr.reduce<boolean>((prev: boolean, cur: number, idx: int, a: Int8Array): boolean => {
        return prev && cur > 0;
      }, true);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_6800
     * @tc.name int8ArrayReducePart03Test068
     * @tc.desc Verify reduce<number[]> collects currentIndex sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let init: number[] = [];
      let result: number[] = arr.reduce<number[]>((prev: number[], cur: number, idx: int, a: Int8Array): number[] => {
        prev.push(idx);
        return prev;
      }, init);
      let actualLength: int = result.length;
      let expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      let firstIdx: number = result[0];
      let expectedFirstIdx: int = 0;
      expect(firstIdx).assertEqual(expectedFirstIdx);
      let lastIdx: number = result[2];
      let expectedLastIdx: int = 2;
      expect(lastIdx).assertEqual(expectedLastIdx);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_6900
     * @tc.name int8ArrayReducePart03Test069
     * @tc.desc Verify reduce<string> and reduce<number> results differ
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let strResult: string = arr.reduce<string>((prev: string, cur: number, idx: int, a: Int8Array): string => {
        return prev + cur.toString();
      }, '');
      let numResult: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      expect(strResult).assertEqual('123');
      expect(numResult).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_7000
     * @tc.name int8ArrayReducePart03Test070
     * @tc.desc Verify reduce<number[]> returns same initial array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let init: number[] = [];
      let result: number[] = arr.reduce<number[]>((prev: number[], cur: number, idx: int, a: Int8Array): number[] => {
        prev.push(cur);
        return prev;
      }, init);
      expect(result).assertEqual(init);
      let resultLen: int = result.length;
      let expectedLen: int = 3;
      expect(resultLen).assertEqual(expectedLen);
      let firstCollected: number = result[0];
      let expectedFirst: int = 1;
      expect(firstCollected).assertEqual(expectedFirst);
      let secondCollected: number = result[1];
      let expectedSecond: int = 2;
      expect(secondCollected).assertEqual(expectedSecond);
      let thirdCollected: number = result[2];
      let expectedThird: int = 3;
      expect(thirdCollected).assertEqual(expectedThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_7100
     * @tc.name int8ArrayReducePart03Test071
     * @tc.desc Verify reduce 0 + initialValue=0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0, 0]);
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_7200
     * @tc.name int8ArrayReducePart03Test072
     * @tc.desc Verify reduce + initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5, 5]);
      let result: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      });
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_7300
     * @tc.name int8ArrayReducePart03Test073
     * @tc.desc Verify reduce Number.NaN Number.NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([Number.NaN, 1]);
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_7400
     * @tc.name int8ArrayReducePart03Test074
     * @tc.desc Verify reduce Number.POSITIVE_INFINITY initialValue=0, ToInt8(+Number.POSITIVE_INFINITY)=0, result=0+0=0 but initial=1 so result=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([Number.POSITIVE_INFINITY, 1]);
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_7500
     * @tc.name int8ArrayReducePart03Test075
     * @tc.desc Verify reduce negative infinity element converts to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-Number.POSITIVE_INFINITY, -1]);
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_7600
     * @tc.name int8ArrayReducePart03Test076
     * @tc.desc Verify reduce 1.9 1, -1.9 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1.9, -1.9]);
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_7700
     * @tc.name int8ArrayReducePart03Test077
     * @tc.desc Verify reduce 100 1 + initialValue=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, 1);
      }
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_7800
     * @tc.name int8ArrayReducePart03Test078
     * @tc.desc Verify reduce<number> 2 initialValue=1 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([2, 2, 2, 2]);
      let result: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev * cur;
      }, 1);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_7900
     * @tc.name int8ArrayReducePart03Test079
     * @tc.desc Verify reduce initialValue -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 7, 2, 9, 1]);
      let target: number = 9;
      let foundIdx: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        if (prev !== -1) {
          return prev;
        }
        if (cur === target) {
          return idx;
        }
        return -1;
      }, -1);
      expect(foundIdx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART03_TEST_8000
     * @tc.name int8ArrayReducePart03Test080
     * @tc.desc Verify reduce counts occurrences of value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart03Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 1, 3, 1]);
      let target: number = 1;
      let count: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        if (cur === target) {
          return prev + 1;
        }
        return prev;
      }, 0);
      expect(count).assertEqual(3);
    });
  });
}
