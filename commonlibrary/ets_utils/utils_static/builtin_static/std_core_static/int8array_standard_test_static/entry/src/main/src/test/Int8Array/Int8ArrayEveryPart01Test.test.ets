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
import Utils from './../Util.test';

export default function int8ArrayEveryPart01Test(): void {
  describe('Int8ArrayEveryPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_0100
     * @tc.name int8ArrayEveryPart01Test001
     * @tc.desc Verify every 1 arity true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return e > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_0200
     * @tc.name int8ArrayEveryPart01Test002
     * @tc.desc Verify every 1 arity false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, -2, 3]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return e > 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_0300
     * @tc.name int8ArrayEveryPart01Test003
     * @tc.desc Verify predicate true every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, -10, 0, INT8_MAX, -128]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return true;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_0400
     * @tc.name int8ArrayEveryPart01Test004
     * @tc.desc Verify predicate false every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, -10, 0]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
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
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return e < 3;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_0600
     * @tc.name int8ArrayEveryPart01Test006
     * @tc.desc Verify predicate false every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([100, 1, 2]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return e < 10;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_0700
     * @tc.name int8ArrayEveryPart01Test007
     * @tc.desc Verify predicate element > 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 50, INT8_MAX]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return e > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_0800
     * @tc.name int8ArrayEveryPart01Test008
     * @tc.desc Verify predicate element === 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 0, 1]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return e === 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_0900
     * @tc.name int8ArrayEveryPart01Test009
     * @tc.desc Verify predicate element === 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 0, 0]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return e === 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_1000
     * @tc.name int8ArrayEveryPart01Test010
     * @tc.desc Verify predicate -128 e 127 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-128, 0, INT8_MAX]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return e >= -128 && e <= INT8_MAX;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_1100
     * @tc.name int8ArrayEveryPart01Test011
     * @tc.desc Verify element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0]);
      let received: number = 999;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        received = e;
        return true;
      });
      expect(received).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_1200
     * @tc.name int8ArrayEveryPart01Test012
     * @tc.desc Verify element 127 int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX]);
      let received: number = 0;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        received = e;
        return true;
      });
      expect(received).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_1300
     * @tc.name int8ArrayEveryPart01Test013
     * @tc.desc Verify element -128 int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-128]);
      let received: number = 0;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        received = e;
        return true;
      });
      expect(received).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_1400
     * @tc.name int8ArrayEveryPart01Test014
     * @tc.desc Verify 200 -56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([200]);
      let received: number = 0;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        received = e;
        return true;
      });
      expect(received).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_1500
     * @tc.name int8ArrayEveryPart01Test015
     * @tc.desc Verify 255 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([255]);
      let received: number = 0;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        received = e;
        return true;
      });
      expect(received).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_1600
     * @tc.name int8ArrayEveryPart01Test016
     * @tc.desc Verify 128 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([128]);
      let received: number = 0;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        received = e;
        return true;
      });
      expect(received).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_1700
     * @tc.name int8ArrayEveryPart01Test017
     * @tc.desc Verify -129 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-129]);
      let received: number = 0;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        received = e;
        return true;
      });
      expect(received).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_1800
     * @tc.name int8ArrayEveryPart01Test018
     * @tc.desc Verify Number.NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(Number.NaN);
      let received: number = 999;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        received = e;
        return true;
      });
      expect(received).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_1900
     * @tc.name int8ArrayEveryPart01Test019
     * @tc.desc Verify 1.9 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1.9);
      let received: number = 0;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        received = e;
        return true;
      });
      expect(received).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_2000
     * @tc.name int8ArrayEveryPart01Test020
     * @tc.desc Verify -1.9 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(-1.9);
      let received: number = 0;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        received = e;
        return true;
      });
      expect(received).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_2100
     * @tc.name int8ArrayEveryPart01Test021
     * @tc.desc Verify 3 5 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 5, 7]);
      let encoded: number = 0;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        encoded = encoded * 10 + e;
        return true;
      });
      expect(encoded).assertEqual(357);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_2200
     * @tc.name int8ArrayEveryPart01Test022
     * @tc.desc Verify index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 10, 15]);
      let firstIndex: int = -1;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        firstIndex = i;
        return false;
      });
      expect(firstIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_2300
     * @tc.name int8ArrayEveryPart01Test023
     * @tc.desc Verify index 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([4, 5, 6]);
      let indexSum: int = 0;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        indexSum = indexSum * 10 + i;
        return true;
      });
      expect(indexSum).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_2400
     * @tc.name int8ArrayEveryPart01Test024
     * @tc.desc Verify index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42]);
      let idx: int = -1;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        idx = i;
        return true;
      });
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_2500
     * @tc.name int8ArrayEveryPart01Test025
     * @tc.desc Verify index length - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let lastIndex: int = -1;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        lastIndex = i;
        return true;
      });
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
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
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
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return i === 2;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_2800
     * @tc.name int8ArrayEveryPart01Test028
     * @tc.desc Verify predicate index index false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return i % 2 === 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_2900
     * @tc.name int8ArrayEveryPart01Test029
     * @tc.desc Verify array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let sameRef: boolean = false;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        sameRef = (a === arr);
        return true;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_3000
     * @tc.name int8ArrayEveryPart01Test030
     * @tc.desc Verify array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let arrLen: int = -1;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        arrLen = a.length;
        return true;
      });
      expect(arrLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_3100
     * @tc.name int8ArrayEveryPart01Test031
     * @tc.desc Verify predicate array.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return a.length === 3;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_3200
     * @tc.name int8ArrayEveryPart01Test032
     * @tc.desc Verify predicate array.$_get(index) element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let consistent: boolean = true;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        if (a.$_get(i) !== e) {
          consistent = false;
        }
        return true;
      });
      expect(consistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_3300
     * @tc.name int8ArrayEveryPart01Test033
     * @tc.desc Verify predicate array byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let bl: int = -1;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        bl = a.byteLength;
        return true;
      });
      expect(bl).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_3400
     * @tc.name int8ArrayEveryPart01Test034
     * @tc.desc Verify predicate ArrayBuffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new Int8Array(buf, 2, 4);
      let offset: int = -1;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        offset = a.byteOffset;
        return true;
      });
      expect(offset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_3500
     * @tc.name int8ArrayEveryPart01Test035
     * @tc.desc Verify predicate RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let caught: boolean = false;
      try {
        arr.every((e: number, i: int, a: Int8Array): boolean => {
          throw new RangeError('range error');
        });
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('RangeError');
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_3600
     * @tc.name int8ArrayEveryPart01Test036
     * @tc.desc Verify predicate TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let caught: boolean = false;
      try {
        arr.every((e: number, i: int, a: Int8Array): boolean => {
          throw new TypeError('type error');
        });
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('TypeError');
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_3700
     * @tc.name int8ArrayEveryPart01Test037
     * @tc.desc Verify predicate Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      let caught: boolean = false;
      try {
        arr.every((e: number, i: int, a: Int8Array): boolean => {
          throw new Error('generic error');
        });
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('Error');
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_3800
     * @tc.name int8ArrayEveryPart01Test038
     * @tc.desc Verify predicate index=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let caught: boolean = false;
      try {
        arr.every((e: number, i: int, a: Int8Array): boolean => {
          if (i === 1) {
            throw new RangeError('mid error');
          }
          return true;
        });
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('RangeError');
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_3900
     * @tc.name int8ArrayEveryPart01Test039
     * @tc.desc Verify predicate index=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let caught: boolean = false;
      try {
        arr.every((e: number, i: int, a: Int8Array): boolean => {
          if (i === 2) {
            throw new RangeError('last error');
          }
          return true;
        });
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('RangeError');
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_4000
     * @tc.name int8ArrayEveryPart01Test040
     * @tc.desc Verify predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42]);
      let caught: boolean = false;
      try {
        arr.every((e: number, i: int, a: Int8Array): boolean => {
          throw new TypeError('single error');
        });
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('TypeError');
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_4100
     * @tc.name int8ArrayEveryPart01Test041
     * @tc.desc Verify predicate 2 1 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let threw: boolean = false;
      try {
        arr.every((e: number, i: int, a: Int8Array): boolean => {
          if (i === 1) {
            throw new RangeError('should not reach');
          }
          return false;
        });
      } catch (e) {
        threw = true;
        expect(e.name).assertEqual('RangeError');
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_4200
     * @tc.name int8ArrayEveryPart01Test042
     * @tc.desc Verify predicate true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let threw: boolean = false;
      let result: boolean = false;
      try {
        result = arr.every((e: number, i: int, a: Int8Array): boolean => {
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
     * @tc.desc Verify predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1]);
      let msg: string = '';
      try {
        arr.every((e: number, i: int, a: Int8Array): boolean => {
          throw new Error('custom message 12345');
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
        msg = e.message;
      }
      expect(msg).assertEqual('custom message 12345');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_4400
     * @tc.name int8ArrayEveryPart01Test044
     * @tc.desc Verify false 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let callCount: int = 0;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        callCount = callCount + 1;
        return false;
      });
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_4500
     * @tc.name int8ArrayEveryPart01Test045
     * @tc.desc Verify index=2 false 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let callCount: int = 0;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        callCount = callCount + 1;
        return i < 2;
      });
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_4600
     * @tc.name int8ArrayEveryPart01Test046
     * @tc.desc Verify false length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let callCount: int = 0;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        callCount = callCount + 1;
        return i < 3;
      });
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_4700
     * @tc.name int8ArrayEveryPart01Test047
     * @tc.desc Verify true length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let callCount: int = 0;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        callCount = callCount + 1;
        return true;
      });
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_4800
     * @tc.name int8ArrayEveryPart01Test048
     * @tc.desc Verify 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let callCount: int = 0;
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        callCount = callCount + 1;
        return true;
      });
      expect(callCount).assertEqual(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_4900
     * @tc.name int8ArrayEveryPart01Test049
     * @tc.desc Verify false 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42]);
      let callCount: int = 0;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        callCount = callCount + 1;
        return false;
      });
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_5000
     * @tc.name int8ArrayEveryPart01Test050
     * @tc.desc Verify true 1 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42]);
      let callCount: int = 0;
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        callCount = callCount + 1;
        return true;
      });
      expect(callCount).assertEqual(1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_5100
     * @tc.name int8ArrayEveryPart01Test051
     * @tc.desc Verify lastSeen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let lastSeen: number = -1;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        lastSeen = e;
        return e < 2;
      });
      expect(lastSeen).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_5200
     * @tc.name int8ArrayEveryPart01Test052
     * @tc.desc Verify new Int8Array(0).every(...) true false true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return false;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_5300
     * @tc.name int8ArrayEveryPart01Test053
     * @tc.desc Verify subarray 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([1, 2, 3]);
      let empty = base.subarray(1, 1);
      let result: boolean = empty.every((e: number, i: int, a: Int8Array): boolean => {
        return false;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_5400
     * @tc.name int8ArrayEveryPart01Test054
     * @tc.desc Verify slice 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([1, 2, 3]);
      let empty = base.slice(5, 1);
      let result: boolean = empty.every((e: number, i: int, a: Int8Array): boolean => {
        return false;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_5500
     * @tc.name int8ArrayEveryPart01Test055
     * @tc.desc Verify ArrayBuffer every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let arr = new Int8Array(buf);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return false;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_5600
     * @tc.name int8ArrayEveryPart01Test056
     * @tc.desc Verify predicate const
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 10, 15]);
      let threshold: number = 8;
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return e > threshold;
      });
      expect(result).assertFalse();
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_5700
       * @tc.name int8ArrayEveryPart01Test057
       * @tc.desc Verify predicate
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayEveryPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new Int8Array([1, 2, 3]);
        let counter: int = 0;
        arr.every((e: number, i: int, a: Int8Array): boolean => {
          counter = counter + 1;
          return e < 3;
        });
        expect(counter).assertEqual(3);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_5800
     * @tc.name int8ArrayEveryPart01Test058
     * @tc.desc Verify predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let ref: int[] = [10, 20, 30];
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return e === ref[i];
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_5900
     * @tc.name int8ArrayEveryPart01Test059
     * @tc.desc Verify predicate sum true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let sum: number = 0;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        sum = sum + e;
        return true;
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_6000
     * @tc.name int8ArrayEveryPart01Test060
     * @tc.desc Verify predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let passed: Array<number> = [];
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        if (e < 3) {
          passed.push(e);
          return true;
        }
        return false;
      });
      expect(passed.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_6100
     * @tc.name int8ArrayEveryPart01Test061
     * @tc.desc Verify predicate element index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return e === (i + 1) * 10;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_6200
     * @tc.name int8ArrayEveryPart01Test062
     * @tc.desc Verify predicate element array array.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return e <= a.length;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_6300
     * @tc.name int8ArrayEveryPart01Test063
     * @tc.desc Verify predicate index array array.$_get index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 10, 15]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return a.$_get(i) === (i + 1) * 5;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_6400
     * @tc.name int8ArrayEveryPart01Test064
     * @tc.desc Verify predicate element index array
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
     * @tc.desc Verify predicate element index array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([100, 110, 120]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return e >= 100;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_6600
     * @tc.name int8ArrayEveryPart01Test066
     * @tc.desc Verify predicate index element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return i < 4;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_6700
     * @tc.name int8ArrayEveryPart01Test067
     * @tc.desc Verify predicate array element index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return a.length > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_6800
     * @tc.name int8ArrayEveryPart01Test068
     * @tc.desc Verify predicate
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
     * @tc.desc Verify predicate
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
     * @tc.desc Verify predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return e > 0 && e < 100 && i >= 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_7100
     * @tc.name int8ArrayEveryPart01Test071
     * @tc.desc Verify predicate 0 e === 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 0, 0, 0]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return e === 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_7200
     * @tc.name int8ArrayEveryPart01Test072
     * @tc.desc Verify predicate e < 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-1, -50, -128]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        return e < 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_7300
     * @tc.name int8ArrayEveryPart01Test073
     * @tc.desc Verify 100 predicate 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(100);
      let callCount: int = 0;
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        callCount = callCount + 1;
        return e === 0;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART01_7400
     * @tc.name int8ArrayEveryPart01Test074
     * @tc.desc Verify ArrayBuffer every predicate
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
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        callCount = callCount + 1;
        return e > 0;
      });
      expect(callCount).assertEqual(4);
      expect(result).assertTrue();
    });

  });
}
