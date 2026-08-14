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

export default function int8ArrayIndexGetPart01Test(): void {
  describe('Int8ArrayIndexGetPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_0100
     * @tc.name int8ArrayIndexGetPart01Test001
     * @tc.desc Verify $_get(0) with int literal returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let r: number = arr.$_get(0);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_0200
     * @tc.name int8ArrayIndexGetPart01Test002
     * @tc.desc Verify $_get(2) with int literal returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let r: number = arr.$_get(2);
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_0300
     * @tc.name int8ArrayIndexGetPart01Test003
     * @tc.desc Verify $_get(idx) with int variable returns element at that index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let idx: int = 1;
      let r: number = arr.$_get(idx);
      expect(r).assertEqual(20);
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_0400
       * @tc.name int8ArrayIndexGetPart01Test004
     * @tc.desc Verify $_get(0) on empty array throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array(0);
                try {
          arr.$_get(0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_0500
     * @tc.name int8ArrayIndexGetPart01Test005
     * @tc.desc Verify $_get(0) on single-element array returns the only element 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(INT8_MAX);
      let r: number = arr.$_get(0);
      expect(r).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_0600
     * @tc.name int8ArrayIndexGetPart01Test006
     * @tc.desc Verify $_get(0) on zero-filled array returns default value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      let r: number = arr.$_get(0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_0700
     * @tc.name int8ArrayIndexGetPart01Test007
     * @tc.desc Verify ArrayBuffer view $_get(0) returns first byte after $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0, 4);
      view.$_set(0, 11);
      let r: number = view.$_get(0);
      expect(r).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_0800
     * @tc.name int8ArrayIndexGetPart01Test008
     * @tc.desc Verify from(Array<number>) $_get(0) returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [5, 15, 25];
      let arr: Int8Array = Int8Array.from(src);
      let r: number = arr.$_get(0);
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_0900
     * @tc.name int8ArrayIndexGetPart01Test009
     * @tc.desc Verify $_get(2) on length-3 array returns last element 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 8, 9);
      let r: number = arr.$_get(2);
      expect(r).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_1000
     * @tc.name int8ArrayIndexGetPart01Test010
     * @tc.desc Verify $_get(1) on length-2 array returns last element 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 8);
      let r: number = arr.$_get(1);
      expect(r).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_1100
     * @tc.name int8ArrayIndexGetPart01Test011
     * @tc.desc Verify computed index arr.length-1 $_get returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(3, 6, 9, 12);
      let idx: int = arr.length - 1;
      let r: number = arr.$_get(idx);
      expect(r).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_1200
     * @tc.name int8ArrayIndexGetPart01Test012
     * @tc.desc Verify $_get(3) on length-4 array returns Int8 max value 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(100, 110, 120, INT8_MAX);
      let r: number = arr.$_get(3);
      expect(r).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_1300
     * @tc.name int8ArrayIndexGetPart01Test013
     * @tc.desc Verify $_get(1) on length-3 array returns negative middle element -10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-5, -10, -15);
      let r: number = arr.$_get(1);
      expect(r).assertEqual(-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_1400
     * @tc.name int8ArrayIndexGetPart01Test014
     * @tc.desc Verify $_get(2) on length-4 array returns third element 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 4, 8);
      let r: number = arr.$_get(2);
      expect(r).assertEqual(4);
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_1500
       * @tc.name int8ArrayIndexGetPart01Test015
     * @tc.desc Verify $_get(3) on length-3 array just-over-boundary throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = Int8Array.of(10, 20, 30);
                try {
          arr.$_get(3);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_1600
       * @tc.name int8ArrayIndexGetPart01Test016
     * @tc.desc Verify $_get(1) on single-element array throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = Int8Array.of(99);
                try {
          arr.$_get(1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_1700
       * @tc.name int8ArrayIndexGetPart01Test017
     * @tc.desc Verify computed index arr.length $_get throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = Int8Array.of(10, 20, 30);
        let idx: int = arr.length;
                try {
          arr.$_get(idx);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_1800
       * @tc.name int8ArrayIndexGetPart01Test018
     * @tc.desc Verify $_get(2) on length-2 array just-over-boundary throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = Int8Array.of(7, 8);
                try {
          arr.$_get(2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_1900
       * @tc.name int8ArrayIndexGetPart01Test019
     * @tc.desc Verify $_get(4) on length-3 array boundary+1 throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = Int8Array.of(10, 20, 30);
                try {
          arr.$_get(4);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_2000
       * @tc.name int8ArrayIndexGetPart01Test020
     * @tc.desc Verify $_get(2) on single-element array boundary+1 throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = Int8Array.of(0);
                try {
          arr.$_get(2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_2100
       * @tc.name int8ArrayIndexGetPart01Test021
     * @tc.desc Verify computed index arr.length+1 $_get throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = Int8Array.of(10, 20, 30);
        let idx: int = arr.length + 1;
                try {
          arr.$_get(idx);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_2200
       * @tc.name int8ArrayIndexGetPart01Test022
     * @tc.desc Verify $_get(-1) on length-3 array throws RangeError not last element
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = Int8Array.of(10, 20, 30);
                try {
          arr.$_get(-1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_2300
       * @tc.name int8ArrayIndexGetPart01Test023
     * @tc.desc Verify ArrayBuffer view $_get(-1) throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let view: Int8Array = new Int8Array(buf, 0, 4);
        view.$_set(0, 50);
                try {
          view.$_get(-1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_2400
       * @tc.name int8ArrayIndexGetPart01Test024
     * @tc.desc Verify $_get(-1) on empty array throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array(0);
                try {
          arr.$_get(-1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_2500
       * @tc.name int8ArrayIndexGetPart01Test025
     * @tc.desc Verify $_get(-1) on Set-constructed array throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let s: Set<int> = new Set<int>();
        s.add(1);
        s.add(2);
        let arr: Int8Array = Int8Array.from(s);
                try {
          arr.$_get(-1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_2600
       * @tc.name int8ArrayIndexGetPart01Test026
     * @tc.desc Verify $_get(-4) equal to -length on length-4 array throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
                try {
          arr.$_get(-4);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_2700
       * @tc.name int8ArrayIndexGetPart01Test027
     * @tc.desc Verify computed negative index -arr.length $_get throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = Int8Array.of(10, 20, 30);
        let idx: int = -arr.length;
                try {
          arr.$_get(idx);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_2800
       * @tc.name int8ArrayIndexGetPart01Test028
     * @tc.desc Verify $_get(-4) equal to -length-1 on length-3 array throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = Int8Array.of(10, 20, 30);
                try {
          arr.$_get(-4);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_2900
       * @tc.name int8ArrayIndexGetPart01Test029
     * @tc.desc Verify computed negative index -arr.length-1 $_get throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = Int8Array.of(10, 20, 30);
        let idx: int = -arr.length - 1;
                try {
          arr.$_get(idx);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_3000
       * @tc.name int8ArrayIndexGetPart01Test030
     * @tc.desc Verify $_get(2147483647) large positive overflow on length-3 array throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = Int8Array.of(10, 20, 30);
                try {
          arr.$_get(2147483647);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_3100
       * @tc.name int8ArrayIndexGetPart01Test031
     * @tc.desc Verify $_get(2147483647) large positive overflow on empty array throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array(0);
                try {
          arr.$_get(2147483647);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_3200
       * @tc.name int8ArrayIndexGetPart01Test032
     * @tc.desc Verify $_get(-2147483648) large negative overflow on length-3 array throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = Int8Array.of(10, 20, 30);
                try {
          arr.$_get(-2147483648);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_3300
       * @tc.name int8ArrayIndexGetPart01Test033
     * @tc.desc Verify $_get(-2147483648) large negative overflow on empty array throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array(0);
                try {
          arr.$_get(-2147483648);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_3400
     * @tc.name int8ArrayIndexGetPart01Test034
     * @tc.desc Verify int variable holding 0 $_get returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(15, 25, 35);
      let idx: int = 0;
      let r: number = arr.$_get(idx);
      expect(r).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_3500
     * @tc.name int8ArrayIndexGetPart01Test035
     * @tc.desc Verify arithmetic index 1+1 $_get returns third element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      let r: number = arr.$_get(1 + 1);
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_3600
     * @tc.name int8ArrayIndexGetPart01Test036
     * @tc.desc Verify computed index arr.length-2 $_get returns second-to-last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(100, 110, 120, INT8_MAX);
      let idx: int = arr.length - 2;
      let r: number = arr.$_get(idx);
      expect(r).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_3700
     * @tc.name int8ArrayIndexGetPart01Test037
     * @tc.desc Verify copy constructor new Int8Array(src) $_get(0) returns first element of copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(77, 88);
      let arr: Int8Array = new Int8Array(src);
      let r: number = arr.$_get(0);
      expect(r).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_3800
     * @tc.name int8ArrayIndexGetPart01Test038
     * @tc.desc Verify zero-filled new Int8Array(4) $_get(2) returns default 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      let r: number = arr.$_get(2);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_3900
     * @tc.name int8ArrayIndexGetPart01Test039
     * @tc.desc Verify from(Array<number>) with negative values $_get(1) returns -10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [10, -10, 10];
      let arr: Int8Array = Int8Array.from(src);
      let r: number = arr.$_get(1);
      expect(r).assertEqual(-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_4000
     * @tc.name int8ArrayIndexGetPart01Test040
     * @tc.desc Verify from(Set<int>) $_get(0) returns first inserted element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(33);
      s.add(44);
      let arr: Int8Array = Int8Array.from(s);
      let r: number = arr.$_get(0);
      expect(r).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_4100
     * @tc.name int8ArrayIndexGetPart01Test041
     * @tc.desc Verify from(Array<number>) single element $_get(0) returns the only element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [63];
      let arr: Int8Array = Int8Array.from(src);
      let r: number = arr.$_get(0);
      expect(r).assertEqual(63);
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_4200
       * @tc.name int8ArrayIndexGetPart01Test042
     * @tc.desc Verify from(Set<int>) empty set $_get(0) throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let s: Set<int> = new Set<int>();
        let arr: Int8Array = Int8Array.from(s);
                try {
          arr.$_get(0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_4300
     * @tc.name int8ArrayIndexGetPart01Test043
     * @tc.desc Verify copy constructor new Int8Array(src) $_get(1) returns second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(77, 88, 99);
      let arr: Int8Array = new Int8Array(src);
      let r: number = arr.$_get(1);
      expect(r).assertEqual(88);
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_4400
       * @tc.name int8ArrayIndexGetPart01Test044
     * @tc.desc Verify copy constructor then $_get(arr.length) overflow throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let src: Int8Array = Int8Array.of(77, 88);
        let arr: Int8Array = new Int8Array(src);
        let idx: int = arr.length;
                try {
          arr.$_get(idx);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_4500
     * @tc.name int8ArrayIndexGetPart01Test045
     * @tc.desc Verify offset-0 view $_get(0) returns buffer first byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let full: Int8Array = new Int8Array(buf, 0, 4);
      full.$_set(0, 11);
      full.$_set(1, 22);
      full.$_set(2, 33);
      full.$_set(3, 44);
      let view: Int8Array = new Int8Array(buf, 0, 2);
      let r: number = view.$_get(0);
      expect(r).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_4600
     * @tc.name int8ArrayIndexGetPart01Test046
     * @tc.desc Verify offset-2 view $_get(0) returns buffer third byte offset applied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let full: Int8Array = new Int8Array(buf, 0, 4);
      full.$_set(0, 11);
      full.$_set(1, 22);
      full.$_set(2, 33);
      full.$_set(3, 44);
      let view: Int8Array = new Int8Array(buf, 2, 2);
      let r: number = view.$_get(0);
      expect(r).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_4700
     * @tc.name int8ArrayIndexGetPart01Test047
     * @tc.desc Verify offset-2 view $_get(1) returns buffer fourth byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let full: Int8Array = new Int8Array(buf, 0, 4);
      full.$_set(0, 11);
      full.$_set(1, 22);
      full.$_set(2, 33);
      full.$_set(3, 44);
      let view: Int8Array = new Int8Array(buf, 2, 2);
      let r: number = view.$_get(1);
      expect(r).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_4800
     * @tc.name int8ArrayIndexGetPart01Test048
     * @tc.desc Verify offset-1 view $_get(view.length-1) returns view last byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let full: Int8Array = new Int8Array(buf, 0, 4);
      full.$_set(0, 11);
      full.$_set(1, 22);
      full.$_set(2, 33);
      full.$_set(3, 44);
      let view: Int8Array = new Int8Array(buf, 1, 2);
      let idx: int = view.length - 1;
      let r: number = view.$_get(idx);
      expect(r).assertEqual(33);
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_4900
       * @tc.name int8ArrayIndexGetPart01Test049
     * @tc.desc Verify view $_get(view.length) overflow throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let view: Int8Array = new Int8Array(buf, 0, 2);
        let idx: int = view.length;
                try {
          view.$_get(idx);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_5000
       * @tc.name int8ArrayIndexGetPart01Test050
     * @tc.desc Verify offset-0 length-2 view $_get(2) overflow throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let view: Int8Array = new Int8Array(buf, 0, 2);
                try {
          view.$_get(2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_5100
     * @tc.name int8ArrayIndexGetPart01Test051
     * @tc.desc Verify offset-1 length-1 view $_get(0) returns buffer second byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let full: Int8Array = new Int8Array(buf, 0, 4);
      full.$_set(0, 11);
      full.$_set(1, 22);
      full.$_set(2, 33);
      full.$_set(3, 44);
      let view: Int8Array = new Int8Array(buf, 1, 1);
      let r: number = view.$_get(0);
      expect(r).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_5200
     * @tc.name int8ArrayIndexGetPart01Test052
     * @tc.desc Verify subarray(1) $_get(0) returns original second element via relative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      let sub: Int8Array = arr.subarray(1);
      let r: number = sub.$_get(0);
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_5300
     * @tc.name int8ArrayIndexGetPart01Test053
     * @tc.desc Verify subarray(1) $_get(2) returns original last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      let sub: Int8Array = arr.subarray(1);
      let r: number = sub.$_get(2);
      expect(r).assertEqual(40);
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_5400
       * @tc.name int8ArrayIndexGetPart01Test054
     * @tc.desc Verify subarray(1) $_get(sub.length) overflow throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
        let sub: Int8Array = arr.subarray(1);
        let idx: int = sub.length;
                try {
          sub.$_get(idx);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_5500
       * @tc.name int8ArrayIndexGetPart01Test055
     * @tc.desc Verify subarray(1) $_get(-1) negative index throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
        let sub: Int8Array = arr.subarray(1);
                try {
          sub.$_get(-1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_5600
     * @tc.name int8ArrayIndexGetPart01Test056
     * @tc.desc Verify subarray(2) $_get(0) returns original third element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      let sub: Int8Array = arr.subarray(2);
      let r: number = sub.$_get(0);
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_5700
     * @tc.name int8ArrayIndexGetPart01Test057
     * @tc.desc Verify subarray(0, 2) $_get(1) returns original second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      let sub: Int8Array = arr.subarray(0, 2);
      let r: number = sub.$_get(1);
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_5800
     * @tc.name int8ArrayIndexGetPart01Test058
     * @tc.desc Verify slice(1, 3) $_get(0) returns copy first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      let cp: Int8Array = arr.slice(1, 3);
      let r: number = cp.$_get(0);
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_5900
     * @tc.name int8ArrayIndexGetPart01Test059
     * @tc.desc Verify slice(1, 3) $_get(1) returns copy second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      let cp: Int8Array = arr.slice(1, 3);
      let r: number = cp.$_get(1);
      expect(r).assertEqual(30);
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_6000
       * @tc.name int8ArrayIndexGetPart01Test060
     * @tc.desc Verify slice(1, 3) $_get(2) copy length is 2 overflow throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
        let cp: Int8Array = arr.slice(1, 3);
                try {
          cp.$_get(2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_6100
     * @tc.name int8ArrayIndexGetPart01Test061
     * @tc.desc Verify same valid index $_get twice returns equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let r1: number = arr.$_get(1);
      expect(r1).assertEqual(20);
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_6200
       * @tc.name int8ArrayIndexGetPart01Test062
     * @tc.desc Verify overflow index $_get(9) on length-3 array throws RangeError
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = Int8Array.of(10, 20, 30);
                try {
          arr.$_get(9);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_6300
     * @tc.name int8ArrayIndexGetPart01Test063
     * @tc.desc Verify after $_set(0, 50) then $_get(0) returns 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.$_set(0, 50);
      let r: number = arr.$_get(0);
      expect(r).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_6400
     * @tc.name int8ArrayIndexGetPart01Test064
     * @tc.desc Verify after $_set(1, -128) then $_get(1) returns Int8 min value -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.$_set(1, INT8_MIN);
      let r: number = arr.$_get(1);
      expect(r).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEXGETPART01_6500
     * @tc.name int8ArrayIndexGetPart01Test065
     * @tc.desc Verify after $_set(0, 100) then $_get(2) still returns original value 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      arr.$_set(0, 100);
      let r: number = arr.$_get(2);
      expect(r).assertEqual(3);
    });
  });
}
