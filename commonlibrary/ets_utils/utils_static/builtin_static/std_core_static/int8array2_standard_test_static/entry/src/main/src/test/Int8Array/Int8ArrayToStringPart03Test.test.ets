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

export default function int8ArrayToStringPart03Test(): void {
  describe('Int8ArrayToStringPart03Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_STRING_PART03_TEST_0100
     * @tc.name int8ArrayToStringPart03Test001
     * @tc.desc Verify toString() returns '-128,127,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128, 127, 0);
      let result: string = arr.toString();
      let expected: string = '-128,127,0';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_STRING_PART03_TEST_0200
     * @tc.name int8ArrayToStringPart03Test002
     * @tc.desc Verify $_set(-1, 99) no-op, toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        arr.$_set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let result: string = arr.toString();
      let expected: string = '1,2,3';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_STRING_PART03_TEST_0300
     * @tc.name int8ArrayToStringPart03Test003
     * @tc.desc Verify at(-999) undefined, toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      expect(arr.at(-999)).assertUndefined();
      let result: string = arr.toString();
      let expected: string = '10,20,30';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_STRING_PART03_TEST_0400
     * @tc.name int8ArrayToStringPart03Test004
     * @tc.desc Verify at(-1) , toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let atResult: number | undefined = arr.at(-1);
      let atExpected: number | undefined = 30;
      expect(atResult).assertEqual(atExpected);
      let result: string = arr.toString();
      let expected: string = '10,20,30';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_STRING_PART03_TEST_0500
     * @tc.name int8ArrayToStringPart03Test005
     * @tc.desc Verify 1.9 1, toString '1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, 1.9);
      let result: string = arr.toString();
      let expected: string = '1';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_STRING_PART03_TEST_0600
     * @tc.name int8ArrayToStringPart03Test006
     * @tc.desc Verify subarray(0, 0) toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let view: Int8Array = arr.subarray(0, 0);
      let viewStr: string = view.toString();
      let expected1: string = '';
      expect(viewStr).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_STRING_PART03_TEST_0700
     * @tc.name int8ArrayToStringPart03Test007
     * @tc.desc Verify [-128] toString '-128'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128);
      let result: string = arr.toString();
      let expected: string = '-128';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_STRING_PART03_TEST_0800
     * @tc.name int8ArrayToStringPart03Test008
     * @tc.desc Verify toString set over capacity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      let src: Int8Array = Int8Array.of(10, 20, 30);
      try {
        arr.set(src, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let result: string = arr.toString();
      let expected: string = '0,0,0';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_STRING_PART03_TEST_0900
     * @tc.name int8ArrayToStringPart03Test009
     * @tc.desc Verify with(length, 99) RangeError, toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        arr.with(3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let result: string = arr.toString();
      let expected: string = '1,2,3';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_STRING_PART03_TEST_1000
     * @tc.name int8ArrayToStringPart03Test010
     * @tc.desc Verify set(src, 0) , toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      let src: Int8Array = Int8Array.of(10, 20, 30);
      arr.set(src, 0);
      let result: string = arr.toString();
      let expected: string = '10,20,30';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_STRING_PART03_TEST_1100
     * @tc.name int8ArrayToStringPart03Test011
     * @tc.desc Verify [1.9,-1.9,0.5] toString '1,-1,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1.9, -1.9, 0.5);
      let result: string = arr.toString();
      let expected: string = '1,-1,0';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_STRING_PART03_TEST_1200
     * @tc.name int8ArrayToStringPart03Test012
     * @tc.desc Verify subarray view toString reflects source write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let view: Int8Array = arr.subarray(0, 2);
      arr.$_set(0, 99);
      let viewStr: string = view.toString();
      let expected1: string = '99,2';
      expect(viewStr).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_STRING_PART03_TEST_1300
     * @tc.name int8ArrayToStringPart03Test013
     * @tc.desc Verify source toString reflects view write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let view: Int8Array = arr.subarray(0, 2);
      view.$_set(1, 99);
      let result: string = arr.toString();
      let expected: string = '1,99,3';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_STRING_PART03_TEST_1400
     * @tc.name int8ArrayToStringPart03Test014
     * @tc.desc Verify slice copy write leaves source toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let copy: Int8Array = arr.slice(0, 2);
      copy.$_set(0, 99);
      let result: string = arr.toString();
      let expected: string = '1,2,3';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_STRING_PART03_TEST_1500
     * @tc.name int8ArrayToStringPart03Test015
     * @tc.desc Verify toString() preserves array length on an of()-created array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let resultVal1: string = arr.toString();
      let expectedVal1: string = '1,2,3';
      expect(resultVal1).assertEqual(expectedVal1);
      let lengthResult: int = arr.length;
      let expected1: int = 3;
      expect(lengthResult).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_STRING_PART03_TEST_1600
     * @tc.name int8ArrayToStringPart03Test016
     * @tc.desc Verify toString() is deterministic across calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128, 127, 0);
      let s1: string = arr.toString();
      let result: string = arr.toString();
      let expected: string = s1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_STRING_PART03_TEST_1700
     * @tc.name int8ArrayToStringPart03Test017
     * @tc.desc Verify toString() equals join(',') result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128, 0, 127);
      let result: string = arr.toString();
      let expected: string = arr.join(',');
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_STRING_PART03_TEST_1800
     * @tc.name int8ArrayToStringPart03Test018
     * @tc.desc Verify indexOf(999) -1, toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let indexResult: int = arr.indexOf(999);
      let expected1: int = -1;
      expect(indexResult).assertEqual(expected1);
      let result: string = arr.toString();
      let expected: string = '1,2,3';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_STRING_PART03_TEST_1900
     * @tc.name int8ArrayToStringPart03Test019
     * @tc.desc Verify includes(-999) false, toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let includesResult: boolean = arr.includes(-999);
      expect(includesResult).assertFalse();
      let result: string = arr.toString();
      let expected: string = '1,2,3';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_STRING_PART03_TEST_2000
     * @tc.name int8ArrayToStringPart03Test020
     * @tc.desc Verify copyWithin(0, 10, 20) no-op, toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      arr.copyWithin(0, 10, 20);
      let result: string = arr.toString();
      let expected: string = '1,2,3';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_STRING_PART03_TEST_2100
     * @tc.name int8ArrayToStringPart03Test021
     * @tc.desc Verify entries() , toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let iterVal1 = arr.entries();
      let doneVal1: boolean = iterVal1.next().done;
      expect(doneVal1).assertFalse();
      let result: string = arr.toString();
      let expected: string = '1,2,3';
      expect(result).assertEqual(expected);
    });
  });
}
