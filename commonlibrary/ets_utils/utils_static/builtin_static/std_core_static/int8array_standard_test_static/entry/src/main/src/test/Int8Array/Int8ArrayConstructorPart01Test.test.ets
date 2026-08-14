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

export default function int8ArrayConstructorPart01Test(): void {
  describe('Int8ArrayConstructorPart01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_0100
     * @tc.name int8ArrayConstructorPart01Test001
     * @tc.desc Verify length expects 0 on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_0200
     * @tc.name int8ArrayConstructorPart01Test002
     * @tc.desc Verify two independent new Int8Array() instances are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = new Int8Array();
      let b: Int8Array = new Int8Array();
      expect(a).not().assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_0300
     * @tc.name int8ArrayConstructorPart01Test003
     * @tc.desc Verify ArrayBuffer.isView returns true on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let isView: boolean = ArrayBuffer.isView(arr);
      expect(isView).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_0400
     * @tc.name int8ArrayConstructorPart01Test004
     * @tc.desc  Verify byteOffset of new Int8Array() returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_0500
     * @tc.name int8ArrayConstructorPart01Test005
     * @tc.desc  Verify byteLength equals length * BYTES_PER_ELEMENT for new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let byteLenResult: int = arr.byteLength;
      let computedByteLen: int = arr.length * arr.BYTES_PER_ELEMENT;
      expect(byteLenResult).assertEqual(computedByteLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_0600
     * @tc.name int8ArrayConstructorPart01Test006
     * @tc.desc  Verify buffer.byteLength of new Int8Array() returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      expect(arr.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_0700
     * @tc.name int8ArrayConstructorPart01Test007
     * @tc.desc Verify new Int8Array(arr.buffer) shares the same underlying ArrayBuffer as arr on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let view: Int8Array = new Int8Array(arr.buffer);
      let r1: ArrayBuffer = view.buffer;
      let e1: ArrayBuffer = arr.buffer;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_0800
     * @tc.name int8ArrayConstructorPart01Test008
     * @tc.desc Verify two independent new Int8Array() have distinct underlying ArrayBuffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = new Int8Array();
      let b: Int8Array = new Int8Array();
      expect(a.buffer).not().assertEqual(b.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_0900
     * @tc.name int8ArrayConstructorPart01Test009
     * @tc.desc  Verify buffer.byteLength of new Int8Array() returns arr.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let bufByteLen: int = arr.buffer.byteLength;
      let arrByteLen: int = arr.byteLength;
      expect(bufByteLen).assertEqual(arrByteLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_1000
     * @tc.name int8ArrayConstructorPart01Test010
     * @tc.desc Verify $_get expects RangeError throws exception, with $_get(0), on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      try {
        arr.$_get(0);
        expect().assertFail();
      } catch (e) {
        let errName: string = e.name;
        expect(errName).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_1100
     * @tc.name int8ArrayConstructorPart01Test011
     * @tc.desc Verify $_get expects RangeError throws exception, with $_get(-1), on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      try {
        arr.$_get(-1);
        expect().assertFail();
      } catch (e) {
        let errName: string = e.name;
        expect(errName).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_1200
     * @tc.name int8ArrayConstructorPart01Test012
     * @tc.desc Verify $_get expects RangeError throws exception, with $_get(2147483647), on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      try {
        arr.$_get(2147483647);
        expect().assertFail();
      } catch (e) {
        let errName: string = e.name;
        expect(errName).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_1300
     * @tc.name int8ArrayConstructorPart01Test013
     * @tc.desc Verify at returns undefined on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      expect(arr.at(0)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_1400
     * @tc.name int8ArrayConstructorPart01Test014
     * @tc.desc Verify indexOf expects -1 on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      expect(arr.indexOf(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_1500
     * @tc.name int8ArrayConstructorPart01Test015
     * @tc.desc Verify lastIndexOf expects -1 on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      expect(arr.lastIndexOf(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_1600
     * @tc.name int8ArrayConstructorPart01Test016
     * @tc.desc Verify includes(0) on new Int8Array() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let includesResult: boolean = arr.includes(0);
      expect(includesResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_1700
     * @tc.name int8ArrayConstructorPart01Test017
     * @tc.desc Verify find returns undefined on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let r: number | undefined = arr.find((v: number): boolean => {
        return v === 0;
      });
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_1800
     * @tc.name int8ArrayConstructorPart01Test018
     * @tc.desc Verify findIndex expects -1 on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let r: number = arr.findIndex((v: number): boolean => {
        return v === 0;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_1900
     * @tc.name int8ArrayConstructorPart01Test019
     * @tc.desc Verify keys() iterator on new Int8Array() is done immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let iter = arr.keys();
      let r = iter.next();
      let isDone: boolean = r.done;
      expect(isDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_2000
     * @tc.name int8ArrayConstructorPart01Test020
     * @tc.desc Verify forEach expects 0 on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let count: number = 0;
      arr.forEach((v: number): void => {
        count++;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_2100
     * @tc.name int8ArrayConstructorPart01Test021
     * @tc.desc Verify map callback invocation count is 0, on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let count: number = 0;
      let r: Int8Array = arr.map((v: number) => {
        count++;
        return v;
      });
      expect(count).assertEqual(0);
      let r1: int = r.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_2200
     * @tc.name int8ArrayConstructorPart01Test022
     * @tc.desc Verify map result array length is 0, on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let r: Int8Array = arr.map((v: number) => {
        return v;
      });
      let mapLen: int = r.length;
      expect(mapLen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_2300
     * @tc.name int8ArrayConstructorPart01Test023
     * @tc.desc Verify map expects arr on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let r: Int8Array = arr.map((v: number) => {
        return v;
      });
      expect(r).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_2400
     * @tc.name int8ArrayConstructorPart01Test024
     * @tc.desc Verify filter callback invocation count is 0, on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let count: number = 0;
      let r: Int8Array = arr.filter((v: number): boolean => {
        count++;
        return true;
      });
      expect(count).assertEqual(0);
      let r1: int = r.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_2500
     * @tc.name int8ArrayConstructorPart01Test025
     * @tc.desc Verify filter result array length is 0, on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let r: Int8Array = arr.filter((v: number): boolean => {
        return true;
      });
      let filterLen: int = r.length;
      expect(filterLen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_2600
     * @tc.name int8ArrayConstructorPart01Test026
     * @tc.desc Verify filter expects arr on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let r: Int8Array = arr.filter((v: number): boolean => {
        return true;
      });
      expect(r).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_2700
     * @tc.name int8ArrayConstructorPart01Test027
     * @tc.desc Verify some() on empty new Int8Array() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let r: boolean = arr.some((v: number): boolean => {
        return true;
      });
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_2800
     * @tc.name int8ArrayConstructorPart01Test028
     * @tc.desc Verify every() on empty new Int8Array() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let r: boolean = arr.every((v: number): boolean => {
        return false;
      });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_2900
     * @tc.name int8ArrayConstructorPart01Test029
     * @tc.desc Verify reduce with initialValue 42 returns 42 on empty new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let r: number = arr.reduce((acc: number, cur: number) => {
        return acc + cur;
      }, 42);
      expect(r).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_3000
     * @tc.name int8ArrayConstructorPart01Test030
     * @tc.desc Verify toString() on new Int8Array() returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let toStringResult: string = arr.toString();
      expect(toStringResult).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_3100
     * @tc.name int8ArrayConstructorPart01Test031
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(0, 1), on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      try {
        arr.$_set(0, 1);
        expect().assertFail();
      } catch (e) {
        let errName: string = e.name;
        expect(errName).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_3200
     * @tc.name int8ArrayConstructorPart01Test032
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(0, 128), on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      try {
        arr.$_set(0, 128);
        expect().assertFail();
      } catch (e) {
        let errName: string = e.name;
        expect(errName).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_3300
     * @tc.name int8ArrayConstructorPart01Test033
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(-1, 5), on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      try {
        arr.$_set(-1, 5);
        expect().assertFail();
      } catch (e) {
        let errName: string = e.name;
        expect(errName).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_3400
     * @tc.name int8ArrayConstructorPart01Test034
     * @tc.desc Verify reverse expects arr on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let r: Int8Array = arr.reverse();
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_3500
     * @tc.name int8ArrayConstructorPart01Test035
     * @tc.desc Verify fill expects arr on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let r: Int8Array = arr.fill(1);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_3600
     * @tc.name int8ArrayConstructorPart01Test036
     * @tc.desc Verify copyWithin expects arr on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let r: Int8Array = arr.copyWithin(0, 0, 0);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_3700
     * @tc.name int8ArrayConstructorPart01Test037
     * @tc.desc Verify reverse expects 0 on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      arr.reverse();
      let revLen: int = arr.length;
      expect(revLen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_3800
     * @tc.name int8ArrayConstructorPart01Test038
     * @tc.desc Verify slice expects 0 slice() on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let r: Int8Array = arr.slice();
      let sliceLen: int = r.length;
      expect(sliceLen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_3900
     * @tc.name int8ArrayConstructorPart01Test039
     * @tc.desc Verify slice expects arr slice() on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let r: Int8Array = arr.slice();
      expect(r).not().assertEqual(arr);
      expect(r.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_4000
     * @tc.name int8ArrayConstructorPart01Test040
     * @tc.desc Verify subarray() expects 0 length, on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let r: Int8Array = arr.subarray();
      let subLen: int = r.length;
      expect(subLen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_4100
     * @tc.name int8ArrayConstructorPart01Test041
     * @tc.desc Verify toReversed() result buffer is NOT arr.buffer, on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let r: Int8Array = arr.toReversed();
      expect(r.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_4200
     * @tc.name int8ArrayConstructorPart01Test042
     * @tc.desc Verify reduce without initialValue throws TypeError on empty new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      try {
        arr.reduce((acc: number, cur: number) => {
          return acc + cur;
        });
        expect().assertFail();
      } catch (e) {
        let errName: string = e.name;
        expect(errName).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_4300
     * @tc.name int8ArrayConstructorPart01Test043
     * @tc.desc Verify with(0, 1) throws RangeError on empty new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      try {
        arr.with(0, 1);
        expect().assertFail();
      } catch (e) {
        let errName: string = e.name;
        expect(errName).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_4400
     * @tc.name int8ArrayConstructorPart01Test044
     * @tc.desc Verify subarray() shares arr.buffer, on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let v: Int8Array = arr.subarray();
      let subBuf: ArrayBuffer = v.buffer;
      expect(subBuf).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_4500
     * @tc.name int8ArrayConstructorPart01Test045
     * @tc.desc Verify subarray(0, 0) shares arr.buffer on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let v: Int8Array = arr.subarray(0, 0);
      let subBuf2: ArrayBuffer = v.buffer;
      expect(subBuf2).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_4600
     * @tc.name int8ArrayConstructorPart01Test046
     * @tc.desc Verify nested subarray().subarray() shares arr.buffer, on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let v: Int8Array = arr.subarray().subarray();
      let nestedBuf: ArrayBuffer = v.buffer;
      expect(nestedBuf).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_4700
     * @tc.name int8ArrayConstructorPart01Test047
     * @tc.desc Verify nested subarray().subarray() expects 0 length, on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let v: Int8Array = arr.subarray().subarray();
      let nestedLen: int = v.length;
      expect(nestedLen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_4800
     * @tc.name int8ArrayConstructorPart01Test048
     * @tc.desc Verify subarray expects 0 subarray() byteLength on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let v: Int8Array = arr.subarray();
      let subByteLen: int = v.byteLength;
      expect(subByteLen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART01_TEST_4900
     * @tc.name int8ArrayConstructorPart01Test049
     * @tc.desc Verify subarray expects sub2.buffer subarray() buffer on new Int8Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let sub1: Int8Array = arr.subarray();
      let sub2: Int8Array = arr.subarray();
      let sub1Buf: ArrayBuffer = sub1.buffer;
      let sub2Buf: ArrayBuffer = sub2.buffer;
      expect(sub1Buf).assertEqual(sub2Buf);
    });
  });
}
