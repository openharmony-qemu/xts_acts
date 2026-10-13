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

export default function int8ArrayReducePart04Test(): void {
  describe('Int8ArrayReducePart04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_0200
     * @tc.name int8ArrayReducePart04Test002
     * @tc.desc Verify reduce dual arg first previous equals initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let firstPrev: number = -1;
      let captured: boolean = false;
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        if (!captured) {
          firstPrev = prev;
          captured = true;
        }
        return prev + cur;
      }, 0);
      expect(firstPrev).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_0300
     * @tc.name int8ArrayReducePart04Test003
     * @tc.desc Verify reduce single arg skips first element index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let firstIdx: int = -1;
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_0400
     * @tc.name int8ArrayReducePart04Test004
     * @tc.desc Verify reduce dual arg starts at index zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let firstIdx: int = -1;
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_0500
     * @tc.name int8ArrayReducePart04Test005
     * @tc.desc Verify reduce single-element array dual-arg: callback executed once (callCount=1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let callCount: int = 0;
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        callCount = callCount + 1;
        return prev + cur;
      }, 0);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_0600
     * @tc.name int8ArrayReducePart04Test006
     * @tc.desc Verify reduce single-element array dual-arg: returns callback result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let r: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      expect(r).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_0700
     * @tc.name int8ArrayReducePart04Test007
     * @tc.desc Verify reduce dual arg initial five adds offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 10, 15]);
      let r1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      });
      let r2: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 5);
      let resultDiff: number = r2 - r1;
      let expectedDiff: int = 5;
      expect(resultDiff).assertEqual(expectedDiff);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_0800
     * @tc.name int8ArrayReducePart04Test008
     * @tc.desc Verify reduce multiplicative identity equal results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([2, 3, 4]);
      let r1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev * cur;
      });
      let r2: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev * cur;
      }, 1);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_0900
     * @tc.name int8ArrayReducePart04Test009
     * @tc.desc Verify reduce callback returns cur ignoring prev: both overloads return last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let r1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        return cur;
      });
      let r2: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return cur;
      }, 0);
      expect(r1).assertEqual(4);
      expect(r2).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_1000
     * @tc.name int8ArrayReducePart04Test010
     * @tc.desc Verify reduce callback returns prev ignoring cur: single-arg returns arr[0], dual-arg returns initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let r1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev;
      });
      let r2: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev;
      }, 99);
      expect(r1).assertEqual(1);
      expect(r2).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_1200
     * @tc.name int8ArrayReducePart04Test012
     * @tc.desc Verify reduce cross-overload last currentIndex: single-arg covers 1..n-1, dual-arg covers 0..n-1, both reach last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let idx1: int = 0;
      let idx2: int = 0;
      let resultVal1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        idx1 = idx;
        return prev + cur;
      });
      let expectedVal1: number = 100;
      expect(resultVal1).assertEqual(expectedVal1);
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        idx2 = idx;
        return prev + cur;
      }, 0);
      expect(idx1).assertEqual(3);
      expect(idx2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_1300
     * @tc.name int8ArrayReducePart04Test013
     * @tc.desc Verify reduce single arg starts at max element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, 1]);
      let firstPrev: number = 0;
      let captured: boolean = false;
      let resultVal1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        if (!captured) {
          firstPrev = prev;
          captured = true;
        }
        return prev + cur;
      });
      let expectedVal1: number = 128;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(firstPrev).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_1400
     * @tc.name int8ArrayReducePart04Test014
     * @tc.desc Verify reduce single arg starts at min element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, 1]);
      let firstPrev: number = 0;
      let captured: boolean = false;
      let resultVal1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        if (!captured) {
          firstPrev = prev;
          captured = true;
        }
        return prev + cur;
      });
      let expectedVal1: number = -127;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(firstPrev).assertEqual(INT8_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_1500
     * @tc.name int8ArrayReducePart04Test015
     * @tc.desc Verify reduce dual-arg initialValue=127 and single-arg arr[0]=127 have same first prev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, 1]);
      let p1: number = 0;
      let c1: boolean = false;
      let resultVal1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        if (!c1) {
          p1 = prev;
          c1 = true;
        }
        return prev + cur;
      });
      let expectedVal1: number = 128;
      expect(resultVal1).assertEqual(expectedVal1);
      let p2: number = 0;
      let c2: boolean = false;
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        if (!c2) {
          p2 = prev;
          c2 = true;
        }
        return prev + cur;
      }, 127);
      expect(p1).assertEqual(p2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_1600
     * @tc.name int8ArrayReducePart04Test016
     * @tc.desc Verify reduce single-arg first currentValue=arr[1] (second element)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let firstCur: number = 0;
      let captured: boolean = false;
      let resultVal1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        if (!captured) {
          firstCur = cur;
          captured = true;
        }
        return prev + cur;
      });
      let expectedVal1: number = 60;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(firstCur).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_1700
     * @tc.name int8ArrayReducePart04Test017
     * @tc.desc Verify reduce dual-arg first currentValue=arr[0] (first element)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let firstCur: number = 0;
      let captured: boolean = false;
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        if (!captured) {
          firstCur = cur;
          captured = true;
        }
        return prev + cur;
      }, 0);
      expect(firstCur).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_1800
     * @tc.name int8ArrayReducePart04Test018
     * @tc.desc Verify reduce single arg callback set visible in source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let resultVal1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        if (idx === 1) {
          a[0] = 99;
        }
        return prev + cur;
      });
      let expectedVal1: number = 6;
      expect(resultVal1).assertEqual(expectedVal1);
      let resultVal: number = arr[0];
      let expectedVal: int = 99;
      expect(resultVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_1900
     * @tc.name int8ArrayReducePart04Test019
     * @tc.desc Verify reduce dual arg callback set visible in source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        if (idx === 0) {
          a[2] = 88;
        }
        return prev + cur;
      }, 0);
      let resultVal: number = arr[2];
      let expectedVal: int = 88;
      expect(resultVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_2000
     * @tc.name int8ArrayReducePart04Test020
     * @tc.desc Verify reduce overloads report same byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 4);
      let off1: int = 0;
      let off2: int = 0;
      let resultVal1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        off1 = a.byteOffset;
        return prev + cur;
      });
      let expectedVal1: number = 0;
      expect(resultVal1).assertEqual(expectedVal1);
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        off2 = a.byteOffset;
        return prev + cur;
      }, 0);
      expect(off1).assertEqual(off2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_2100
     * @tc.name int8ArrayReducePart04Test021
     * @tc.desc Verify reduce single arg callback length matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let cbLen: int = 0;
      let resultVal1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        cbLen = a.length;
        return prev + cur;
      });
      let expectedVal1: number = 10;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(cbLen).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_2200
     * @tc.name int8ArrayReducePart04Test022
     * @tc.desc Verify reduce dual arg callback byteLength matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let cbByteLen: int = 0;
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        cbByteLen = a.byteLength;
        return prev + cur;
      }, 0);
      expect(cbByteLen).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_2300
     * @tc.name int8ArrayReducePart04Test023
     * @tc.desc Verify reduce dual arg propagates RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
          throw new RangeError('range');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_2400
     * @tc.name int8ArrayReducePart04Test024
     * @tc.desc Verify reduce single-arg callback throws TypeError, e.name and e.message forwarded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
          throw new TypeError('bad type');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(e.message).assertEqual('bad type');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_2500
     * @tc.name int8ArrayReducePart04Test025
     * @tc.desc Verify dual-arg reduce<string> returns concatenated 123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r: string = arr.reduce<string>((prev: string, cur: number, idx: int, a: Int8Array): string => {
        return prev + cur.toString();
      }, '');
      expect(r).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_2600
     * @tc.name int8ArrayReducePart04Test026
     * @tc.desc Verify reduce single-arg and dual-arg<number> addition results equal on same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let r1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      });
      let r2: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_2700
     * @tc.name int8ArrayReducePart04Test027
     * @tc.desc Verify reduce overload results stringify identically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 10, 15]);
      let r1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      });
      let r2: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      let resultStr: string = r1.toString();
      let expectedStr: string = r2.toString();
      expect(resultStr).assertEqual(expectedStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_2800
     * @tc.name int8ArrayReducePart04Test028
     * @tc.desc Verify reduce string overload concatenates elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r: string = arr.reduce<string>((prev: string, cur: number, idx: int, a: Int8Array): string => {
        return prev + cur.toString();
      }, 'x');
      let resultStr: string = r.toString();
      let expectedStr: string = 'x123';
      expect(resultStr).assertEqual(expectedStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_2900
     * @tc.name int8ArrayReducePart04Test029
     * @tc.desc Verify reduce float initial value yields fractional sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0.5);
      expect(r).assertEqual(6.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_3000
     * @tc.name int8ArrayReducePart04Test030
     * @tc.desc Verify reduce accumulator keeps number space two hundred
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([100, 100]);
      let r1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      });
      let r2: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      expect(r1).assertEqual(200);
      expect(r2).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_3100
     * @tc.name int8ArrayReducePart04Test031
     * @tc.desc Verify reduce dual-arg generic overloads diverge by initialValue (sum 3 vs concat 12)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      let sumResult: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      let rs: string = arr.reduce<string>((prev: string, cur: number, idx: int, a: Int8Array): string => {
        return prev + cur.toString();
      }, '');
      expect(sumResult).assertEqual(3);
      expect(rs).assertEqual('12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_3200
     * @tc.name int8ArrayReducePart04Test032
     * @tc.desc Verify reduce max callback: single-arg and dual-arg(initialValue=127) results equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, INT8_MAX, 50]);
      let r1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev > cur ? prev : cur;
      });
      let r2: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev > cur ? prev : cur;
      }, 127);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_3300
     * @tc.name int8ArrayReducePart04Test033
     * @tc.desc Verify reduce dual-arg initialValue > all elements, max callback returns initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev > cur ? prev : cur;
      }, 99);
      expect(r).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_3400
     * @tc.name int8ArrayReducePart04Test034
     * @tc.desc Verify reduce cross-overload constant callback results consistent (callback returns constant 7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        return 7;
      });
      let r2: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return 7;
      }, 0);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_3500
     * @tc.name int8ArrayReducePart04Test035
     * @tc.desc Verify single-arg reduce does not modify original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let resultVal1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      });
      let expectedVal1: number = 6;
      expect(resultVal1).assertEqual(expectedVal1);
      let resultLen: int = arr.length;
      let expectedLen: int = 3;
      expect(resultLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_3600
     * @tc.name int8ArrayReducePart04Test036
     * @tc.desc Verify dual-arg reduce does not modify original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      let resultLen: int = arr.length;
      let expectedLen: int = 3;
      expect(resultLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_3700
     * @tc.name int8ArrayReducePart04Test037
     * @tc.desc Verify single-arg reduce does not modify original array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let resultVal1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      });
      let expectedVal1: number = 6;
      expect(resultVal1).assertEqual(expectedVal1);
      let resultVal: number = arr[1];
      let expectedVal: int = 2;
      expect(resultVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_3800
     * @tc.name int8ArrayReducePart04Test038
     * @tc.desc Verify dual-arg reduce does not modify original array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      let resultVal: number = arr[1];
      let expectedVal: int = 2;
      expect(resultVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_3900
     * @tc.name int8ArrayReducePart04Test039
     * @tc.desc Verify single-arg reduce, original array buffer ref unchanged after
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let buf: ArrayBuffer = arr.buffer;
      let resultVal1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      });
      let expectedVal1: number = 6;
      expect(resultVal1).assertEqual(expectedVal1);
      let resultBuf: ArrayBuffer = arr.buffer;
      let expectedBuf: ArrayBuffer = buf;
      expect(resultBuf).assertEqual(expectedBuf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_4000
     * @tc.name int8ArrayReducePart04Test040
     * @tc.desc Verify dual-arg reduce, original array buffer ref unchanged after
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let buf: ArrayBuffer = arr.buffer;
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      let resultBuf: ArrayBuffer = arr.buffer;
      let expectedBuf: ArrayBuffer = buf;
      expect(resultBuf).assertEqual(expectedBuf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_4100
     * @tc.name int8ArrayReducePart04Test041
     * @tc.desc Verify single-arg reduce, original array byteOffset unchanged after
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let off: int = arr.byteOffset;
      let resultVal1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      });
      let expectedVal1: number = 6;
      expect(resultVal1).assertEqual(expectedVal1);
      let resultOffset: int = arr.byteOffset;
      let expectedOffset: number = off;
      expect(resultOffset).assertEqual(expectedOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_4200
     * @tc.name int8ArrayReducePart04Test042
     * @tc.desc Verify dual-arg reduce, original array byteLength unchanged after
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let bl: int = arr.byteLength;
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      let resultByteLen: int = arr.byteLength;
      let expectedByteLen: number = bl;
      expect(resultByteLen).assertEqual(expectedByteLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_4300
     * @tc.name int8ArrayReducePart04Test043
     * @tc.desc Verify two consecutive single-arg reduces: second still sees original elements (no state residue)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      });
      let r2: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      });
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_4400
     * @tc.name int8ArrayReducePart04Test044
     * @tc.desc Verify single-arg then dual-arg reduce: results independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      });
      let r2: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 10);
      expect(r1).assertEqual(6);
      expect(r2).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_4500
     * @tc.name int8ArrayReducePart04Test045
     * @tc.desc Verify nested reduce: outer callback calls inner reduce on same array, both see original elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let outer: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        let inner: number = a.reduce((p: number, c: number, i: int, aa: Int8Array) => {
          return p + c;
        });
        return prev + inner;
      }, 0);
      expect(outer).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_4600
     * @tc.name int8ArrayReducePart04Test046
     * @tc.desc Verify reduce dual arg last iteration length four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let lastLen: int = 0;
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        lastLen = a.length;
        return prev + cur;
      }, 0);
      expect(lastLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_4700
     * @tc.name int8ArrayReducePart04Test047
     * @tc.desc Verify single-arg reduce on subarray view does not modify underlying buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = base.subarray(1, 4);
      let resultVal1: number = view.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      });
      let expectedVal1: number = 9;
      expect(resultVal1).assertEqual(expectedVal1);
      let resultVal: number = base[1];
      let expectedVal: int = 2;
      expect(resultVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_4800
     * @tc.name int8ArrayReducePart04Test048
     * @tc.desc Verify dual-arg reduce on subarray view does not modify underlying buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = base.subarray(1, 4);
      view.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      let resultVal: number = base[2];
      let expectedVal: int = 3;
      expect(resultVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_4900
     * @tc.name int8ArrayReducePart04Test049
     * @tc.desc Verify after single-arg reduce, array still accessible via normal read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 8, 9]);
      let resultVal1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      });
      let expectedVal1: number = 24;
      expect(resultVal1).assertEqual(expectedVal1);
      let resultVal: number = arr[2];
      let expectedVal: int = 9;
      expect(resultVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_5000
     * @tc.name int8ArrayReducePart04Test050
     * @tc.desc Verify after dual-arg reduce, array still accessible via normal read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 8, 9]);
      arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      let resultVal: number = arr[0];
      let expectedVal: int = 7;
      expect(resultVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_5100
     * @tc.name int8ArrayReducePart04Test051
     * @tc.desc Verify reduce negative elements consistent across overloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, -2, -3]);
      let r1: number = arr.reduce((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      });
      let r2: number = arr.reduce<number>((prev: number, cur: number, idx: int, a: Int8Array) => {
        return prev + cur;
      }, 0);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART04_5200
     * @tc.name int8ArrayReducePart04Test052
     * @tc.desc Verify reduce string overload joins with commas
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r: string = arr.reduce<string>((prev: string, cur: number, idx: int, a: Int8Array): string => {
        return prev + ',' + cur.toString();
      }, '');
      expect(r).assertEqual(',1,2,3');
    });
  });
}
