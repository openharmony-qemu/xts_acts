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
import Utils from '../Util.test';

export default function int8ArrayIndexGetPart03Test(): void {
  describe('Int8ArrayIndexGetPart03Test', (): void => {
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
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_0100
       * @tc.name int8ArrayIndexGetPart03Test001
       * @tc.desc Verify $_get(0) undefined index=length=0
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array(0);
                try {
          arr.$_get(0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_0200
       * @tc.name int8ArrayIndexGetPart03Test002
       * @tc.desc Verify $_get(1) undefined index=length+1
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array(0);
                try {
          arr.$_get(1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_0300
       * @tc.name int8ArrayIndexGetPart03Test003
       * @tc.desc Verify $_get(-1) undefined
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array(0);
                try {
          arr.$_get(-1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_0400
       * @tc.name int8ArrayIndexGetPart03Test004
       * @tc.desc Verify $_get(2147483647) undefined int
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array(0);
                try {
          arr.$_get(2147483647);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_0500
       * @tc.name int8ArrayIndexGetPart03Test005
       * @tc.desc Verify $_get(-2147483648) undefined int
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array(0);
                try {
          arr.$_get(-2147483648);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_0600
     * @tc.name int8ArrayIndexGetPart03Test006
     * @tc.desc Verify $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10]);
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_0700
       * @tc.name int8ArrayIndexGetPart03Test007
       * @tc.desc Verify $_get(1) undefined index=length
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10]);
                try {
          arr.$_get(1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_0800
       * @tc.name int8ArrayIndexGetPart03Test008
       * @tc.desc Verify $_get(-2) undefined -length-1
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10]);
                try {
          arr.$_get(-2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_0900
       * @tc.name int8ArrayIndexGetPart03Test009
       * @tc.desc Verify $_get(2) undefined index=length+1
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10]);
                try {
          arr.$_get(2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_1000
       * @tc.name int8ArrayIndexGetPart03Test010
       * @tc.desc Verify $_get(2147483647) undefined
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10]);
                try {
          arr.$_get(2147483647);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_1100
       * @tc.name int8ArrayIndexGetPart03Test011
       * @tc.desc Verify $_get(-2147483648) undefined
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10]);
                try {
          arr.$_get(-2147483648);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_1200
     * @tc.name int8ArrayIndexGetPart03Test012
     * @tc.desc Verify $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20]);
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_1300
     * @tc.name int8ArrayIndexGetPart03Test013
     * @tc.desc Verify $_get(1) length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20]);
      expect(arr.$_get(1)).assertEqual(20);
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_1400
       * @tc.name int8ArrayIndexGetPart03Test014
       * @tc.desc Verify $_get(2) undefined index=length
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20]);
                try {
          arr.$_get(2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_1500
       * @tc.name int8ArrayIndexGetPart03Test015
       * @tc.desc Verify $_get(3) undefined index=length+1
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20]);
                try {
          arr.$_get(3);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_1600
       * @tc.name int8ArrayIndexGetPart03Test016
       * @tc.desc Verify $_get(-3) undefined -length-1
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20]);
                try {
          arr.$_get(-3);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_1700
       * @tc.name int8ArrayIndexGetPart03Test017
       * @tc.desc Verify $_get(4) undefined index=length
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
                try {
          arr.$_get(4);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_1800
       * @tc.name int8ArrayIndexGetPart03Test018
       * @tc.desc Verify $_get(5) undefined index=length+1
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
                try {
          arr.$_get(5);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_1900
       * @tc.name int8ArrayIndexGetPart03Test019
       * @tc.desc Verify $_get(-5) undefined -length-1
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
                try {
          arr.$_get(-5);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_2000
     * @tc.name int8ArrayIndexGetPart03Test020
     * @tc.desc Verify $_get(3) length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      expect(arr.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_2100
     * @tc.name int8ArrayIndexGetPart03Test021
     * @tc.desc Verify $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 7, 7]);
      expect(arr.$_get(0)).assertEqual(7);
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_2200
       * @tc.name int8ArrayIndexGetPart03Test022
       * @tc.desc Verify $_get(3) undefined index=length
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([7, 7, 7]);
                try {
          arr.$_get(3);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_2300
       * @tc.name int8ArrayIndexGetPart03Test023
       * @tc.desc Verify $_get(-4) undefined -length-1
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([7, 7, 7]);
                try {
          arr.$_get(-4);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_2400
     * @tc.name int8ArrayIndexGetPart03Test024
     * @tc.desc Verify -128 $_get(0) -128 int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, 0, INT8_MAX]);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_2500
     * @tc.name int8ArrayIndexGetPart03Test025
     * @tc.desc Verify 0 $_get(1) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, 0, INT8_MAX]);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_2600
     * @tc.name int8ArrayIndexGetPart03Test026
     * @tc.desc Verify $_set(1, -200) 56 $_get(1) 56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.$_set(0, 10);
      arr.$_set(1, -200);
      expect(arr.$_get(1)).assertEqual(56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_2700
     * @tc.name int8ArrayIndexGetPart03Test027
     * @tc.desc Verify $_set(0, 255) -1 $_get(0) -1 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, 255);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_2800
       * @tc.name int8ArrayIndexGetPart03Test028
       * @tc.desc Verify Int8Array.of $_get(0x7FFFFFFF) undefined int
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = Int8Array.of(10, 20, 30);
                try {
          arr.$_get(0x7FFFFFFF);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_2900
       * @tc.name int8ArrayIndexGetPart03Test029
       * @tc.desc Verify Int8Array.from $_get(-2147483648) undefined int
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let src: Array<number> = [10, 20, 30];
        let arr: Int8Array = Int8Array.from(src);
                try {
          arr.$_get(-2147483648);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_3000
       * @tc.name int8ArrayIndexGetPart03Test030
       * @tc.desc Verify ArrayBuffer $_get(0) undefined
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf: ArrayBuffer = new ArrayBuffer(0);
        let arr: Int8Array = new Int8Array(buf, 0, 0);
                try {
          arr.$_get(0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_3100
       * @tc.name int8ArrayIndexGetPart03Test031
       * @tc.desc Verify ArrayBuffer $_get(-1) undefined
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf: ArrayBuffer = new ArrayBuffer(0);
        let arr: Int8Array = new Int8Array(buf, 0, 0);
                try {
          arr.$_get(-1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_3200
       * @tc.name int8ArrayIndexGetPart03Test032
       * @tc.desc Verify ArrayBuffer $_get(4) undefined length
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let arr: Int8Array = new Int8Array(buf, 4, 4);
                try {
          arr.$_get(4);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_3300
       * @tc.name int8ArrayIndexGetPart03Test033
       * @tc.desc Verify ArrayBuffer $_get(-5) undefined -length-1
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let arr: Int8Array = new Int8Array(buf, 4, 4);
                try {
          arr.$_get(-5);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_3400
       * @tc.name int8ArrayIndexGetPart03Test034
       * @tc.desc Verify subarray $_get(3) undefined length
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let base: Int8Array = new Int8Array([10, 20, 30, 40, INT8_MAX]);
        let view: Int8Array = base.subarray(1, 4);
                try {
          view.$_get(3);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_3500
       * @tc.name int8ArrayIndexGetPart03Test035
       * @tc.desc Verify Int8Array.of $_get(3) undefined of length
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = Int8Array.of(10, 20, 30);
                try {
          arr.$_get(3);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_3600
       * @tc.name int8ArrayIndexGetPart03Test036
       * @tc.desc Verify Int8Array.from $_get(-4) undefined from -length-1
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let src: Array<number> = [10, 20, 30];
        let arr: Int8Array = Int8Array.from(src);
                try {
          arr.$_get(-4);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_3700
       * @tc.name int8ArrayIndexGetPart03Test037
       * @tc.desc Verify $_get length
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30]);
        let before: int = arr.length;
                try {
          arr.$_get(100);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_3800
       * @tc.name int8ArrayIndexGetPart03Test038
       * @tc.desc Verify $_get
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30]);
                try {
          arr.$_get(100);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_3900
       * @tc.name int8ArrayIndexGetPart03Test039
       * @tc.desc Verify $_get undefined / /
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30]);
                try {
          arr.$_get(100);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_4000
       * @tc.name int8ArrayIndexGetPart03Test040
       * @tc.desc Verify $_get $_get
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30]);
                try {
          arr.$_get(100);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_4100
     * @tc.name int8ArrayIndexGetPart03Test041
     * @tc.desc Verify $_get out-of-bounds index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let threw: boolean = false;
      try {
        arr.$_get(1000);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_4200
       * @tc.name int8ArrayIndexGetPart03Test042
       * @tc.desc Verify $_get $_set
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30]);
                try {
          arr.$_get(100);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_4300
     * @tc.name int8ArrayIndexGetPart03Test043
     * @tc.desc Verify $_get number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r = arr.$_get(0);
      expect(r + 5).assertEqual(15);
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_4400
       * @tc.name int8ArrayIndexGetPart03Test044
       * @tc.desc Verify $_get undefined assertUndefined
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30]);
                try {
          arr.$_get(100);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_4500
       * @tc.name int8ArrayIndexGetPart03Test045
       * @tc.desc Verify 120 $_get(120) undefined index=length
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array(120);
                try {
          arr.$_get(120);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_4600
       * @tc.name int8ArrayIndexGetPart03Test046
       * @tc.desc Verify 120 $_get(-121) undefined -length-1
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array(120);
                try {
          arr.$_get(-121);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_4700
     * @tc.name int8ArrayIndexGetPart03Test047
     * @tc.desc Verify new Int8Array(3) 0 $_get(1) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_4800
       * @tc.name int8ArrayIndexGetPart03Test048
       * @tc.desc Verify new Int8Array(3) 0 $_get(3) undefined length
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array(3);
                try {
          arr.$_get(3);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_4900
     * @tc.name int8ArrayIndexGetPart03Test049
     * @tc.desc Verify $_get(0) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, -128, -INT8_MAX]);
      expect(arr.$_get(0)).assertEqual(-1);
    });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_5000
       * @tc.name int8ArrayIndexGetPart03Test050
       * @tc.desc Verify $_get(-1) -length, throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10]);
        let __val: number = 0;
        let threwGet: boolean = false;
        try {
          __val = arr.$_get(-1);
        } catch (e) {
          threwGet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwGet).assertTrue();
      });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_5100
       * @tc.name int8ArrayIndexGetPart03Test051
       * @tc.desc Verify $_get(-1), throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20]);
        let __val: number = 0;
        let threwGet: boolean = false;
        try {
          __val = arr.$_get(-1);
        } catch (e) {
          threwGet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwGet).assertTrue();
      });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_5200
       * @tc.name int8ArrayIndexGetPart03Test052
       * @tc.desc Verify $_get(-2) -length, throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20]);
        let __val: number = 0;
        let threwGet: boolean = false;
        try {
          __val = arr.$_get(-2);
        } catch (e) {
          threwGet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwGet).assertTrue();
      });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_5300
       * @tc.name int8ArrayIndexGetPart03Test053
       * @tc.desc Verify $_get(-4) -length, throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
        let __val: number = 0;
        let threwGet: boolean = false;
        try {
          __val = arr.$_get(-4);
        } catch (e) {
          threwGet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwGet).assertTrue();
      });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_5400
       * @tc.name int8ArrayIndexGetPart03Test054
       * @tc.desc Verify $_get(-1), throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([7, 7, 7]);
        let __val: number = 0;
        let threwGet: boolean = false;
        try {
          __val = arr.$_get(-1);
        } catch (e) {
          threwGet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwGet).assertTrue();
      });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_5500
       * @tc.name int8ArrayIndexGetPart03Test055
       * @tc.desc Verify 127 $_get(-1) 127 int8, throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([-128, 0, INT8_MAX]);
        let __val: number = 0;
        let threwGet: boolean = false;
        try {
          __val = arr.$_get(-1);
        } catch (e) {
          threwGet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwGet).assertTrue();
      });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_5600
       * @tc.name int8ArrayIndexGetPart03Test056
       * @tc.desc Verify 120 $_get(-1), throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let src: Array<int> = [];
        for (let i: int = 0; i < 120; i++) {
          src.push(i % INT8_MAX);
        }
        let arr: Int8Array = Int8Array.from(src);
        let __val: number = 0;
        let threwGet: boolean = false;
        try {
          __val = arr.$_get(-1);
        } catch (e) {
          threwGet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwGet).assertTrue();
      });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_5700
       * @tc.name int8ArrayIndexGetPart03Test057
       * @tc.desc Verify $_get(-1) $_get(length-1), throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
        let __val: number = 0;
        let threwGet: boolean = false;
        try {
          __val = arr.$_get(-1);
        } catch (e) {
          threwGet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwGet).assertTrue();
      });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_5800
       * @tc.name int8ArrayIndexGetPart03Test058
       * @tc.desc Verify $_get(-length) $_get(0), throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
        let __val: number = 0;
        let threwGet: boolean = false;
        try {
          __val = arr.$_get(-4);
        } catch (e) {
          threwGet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwGet).assertTrue();
      });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART03_TEST_5900
       * @tc.name int8ArrayIndexGetPart03Test059
       * @tc.desc Verify $_get(-1) -127, throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([-1, -128, -INT8_MAX]);
        let __val: number = 0;
        let threwGet: boolean = false;
        try {
          __val = arr.$_get(-1);
        } catch (e) {
          threwGet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwGet).assertTrue();
      });

});
}
