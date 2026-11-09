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
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

function isNegativePart01(e: number, i: int, a: Int8Array): boolean {
  return e < 0;
}

class PositiveCheckerPart01 {
  static check(e: number, i: int, a: Int8Array): boolean {
    return e > 0;
  }
}

export default function int8ArraySomePart01Test(): void {
  describe('Int8ArraySomePart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_0100
     * @tc.name int8ArraySomePart01Test001
     * @tc.desc Verify predicate 0 true some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.some((): boolean => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_0200
     * @tc.name int8ArraySomePart01Test002
     * @tc.desc Verify predicate 0 false some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.some((): boolean => false);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_0300
     * @tc.name int8ArraySomePart01Test003
     * @tc.desc Verify some predicate matches element five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, 0, 5]);
      let result: boolean = arr.some((e: number): boolean => e === 5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_0400
     * @tc.name int8ArraySomePart01Test004
     * @tc.desc Verify some predicate index zero returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: boolean = arr.some((e: number, i: int): boolean => e === 10 && i === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_0500
     * @tc.name int8ArraySomePart01Test005
     * @tc.desc Verify some predicate array argument equals arr reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e === 1 && a === arr);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_0600
     * @tc.name int8ArraySomePart01Test006
     * @tc.desc Verify some predicate array argument length three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 8, 9]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => a.length === 3 && e === 7);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_0700
     * @tc.name int8ArraySomePart01Test007
     * @tc.desc Verify some predicate get index equals element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([4, 5, 6]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => a.$_get(i) === e);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_0800
     * @tc.name int8ArraySomePart01Test008
     * @tc.desc Verify predicate true some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, 0, INT8_MAX]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        return true;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_0900
     * @tc.name int8ArraySomePart01Test009
     * @tc.desc Verify predicate false some false on non-empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, 0, 1]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e > 100);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_1000
     * @tc.name int8ArraySomePart01Test010
     * @tc.desc Verify some predicate matches INT8_MIN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, 0, 1]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e === -128);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_1100
     * @tc.name int8ArraySomePart01Test011
     * @tc.desc Verify some predicate matches INT8_MAX element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, INT8_MAX]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e === 127);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_1200
     * @tc.name int8ArraySomePart01Test012
     * @tc.desc Verify some predicate matches zero element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, 0, 1]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_1300
     * @tc.name int8ArraySomePart01Test013
     * @tc.desc Verify some predicate matches negative one element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, 0, 1]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e === -1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_1400
     * @tc.name int8ArraySomePart01Test014
     * @tc.desc Verify predicate element === 100 some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, 0, 1]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e === 100);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_1500
     * @tc.name int8ArraySomePart01Test015
     * @tc.desc Verify predicate element > 0 some returns true with inline callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-5, 0, 3]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_1600
     * @tc.name int8ArraySomePart01Test016
     * @tc.desc Verify predicate element < 0 some returns true with inline callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-5, 0, 3]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e < 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_1700
     * @tc.name int8ArraySomePart01Test017
     * @tc.desc Verify some predicate non negative passes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-5, 0, 3]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e >= 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_1800
     * @tc.name int8ArraySomePart01Test018
     * @tc.desc Verify some predicate non positive passes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-5, 0, 3]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e <= 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_1900
     * @tc.name int8ArraySomePart01Test019
     * @tc.desc Verify some predicate stored 128 wraps negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([128]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e === -128);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_2000
     * @tc.name int8ArraySomePart01Test020
     * @tc.desc Verify some predicate stored 255 wraps negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([255]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e === -1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_2100
     * @tc.name int8ArraySomePart01Test021
     * @tc.desc Verify some predicate stored -129 wraps positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-129]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e === 127);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_2200
     * @tc.name int8ArraySomePart01Test022
     * @tc.desc Verify some predicate original 128 not equal stored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: number = 128;
      let arr: Int8Array = new Int8Array([128]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e !== original);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_2300
     * @tc.name int8ArraySomePart01Test023
     * @tc.desc Verify some predicate original 255 not equal stored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: number = 255;
      let arr: Int8Array = new Int8Array([255]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e !== original);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_2400
     * @tc.name int8ArraySomePart01Test024
     * @tc.desc Verify some predicate stored 256 wraps zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([256]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_2500
     * @tc.name int8ArraySomePart01Test025
     * @tc.desc Verify some predicate stored 129 wraps negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([129]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e === -127);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_2600
     * @tc.name int8ArraySomePart01Test026
     * @tc.desc Verify predicate index === 0 some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e === 10 && i === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_2700
     * @tc.name int8ArraySomePart01Test027
     * @tc.desc Verify predicate index === length - 1 some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => i === a.length - 1 && e === 30);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_2800
     * @tc.name int8ArraySomePart01Test028
     * @tc.desc Verify predicate index === 1 some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => i === 1 && e === 20);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_2900
     * @tc.name int8ArraySomePart01Test029
     * @tc.desc Verify predicate index === length index length some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => i === a.length && e > 100);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_3000
     * @tc.name int8ArraySomePart01Test030
     * @tc.desc Verify predicate index < 0 index some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => i < 0 && e > 100);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_3100
     * @tc.name int8ArraySomePart01Test031
     * @tc.desc Verify predicate index index 0 some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => i % 2 === 0 && e === 10);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_3200
     * @tc.name int8ArraySomePart01Test032
     * @tc.desc Verify predicate index index 1 some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => i % 2 === 1 && e === 20);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_3300
     * @tc.name int8ArraySomePart01Test033
     * @tc.desc Verify some predicate thisArg constructor name equals Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => a.name === 'Int8Array' && e === 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_3400
     * @tc.name int8ArraySomePart01Test034
     * @tc.desc Verify predicate true some false vacuous false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e >= -128 && e <= 127);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_3500
     * @tc.name int8ArraySomePart01Test035
     * @tc.desc Verify some on empty array skips callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array(0);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => {
        count = count + 1;
        return e === -128;
      });
      expect(result).assertFalse();
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_3600
     * @tc.name int8ArraySomePart01Test036
     * @tc.desc Verify [-128] predicate true some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e === -128);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_3700
     * @tc.name int8ArraySomePart01Test037
     * @tc.desc Verify [127] predicate false some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e === -128);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_3800
     * @tc.name int8ArraySomePart01Test038
     * @tc.desc Verify some([0]) calls callback once returning false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([0]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        count = count + 1;
        return false;
      });
      expect(result).assertFalse();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_3900
     * @tc.name int8ArraySomePart01Test039
     * @tc.desc Verify some predicate always true short circuits first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        count = count + 1;
        return true;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_4000
     * @tc.name int8ArraySomePart01Test040
     * @tc.desc Verify some predicate index one true short circuits second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        count = count + 1;
        return i === 1;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_4100
     * @tc.name int8ArraySomePart01Test041
     * @tc.desc Verify some(predicate) visits all 3 and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        count = count + 1;
        return i === 2;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_4200
     * @tc.name int8ArraySomePart01Test042
     * @tc.desc Verify some(predicate) visits all 3 and returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        count = count + 1;
        return false;
      });
      expect(result).assertFalse();
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_4300
     * @tc.name int8ArraySomePart01Test043
     * @tc.desc Verify some predicate greater than eight short circuits second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([5, 10, 15]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => {
        count = count + 1;
        return e > 8;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_4400
     * @tc.name int8ArraySomePart01Test044
     * @tc.desc Verify some predicate compares outer threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threshold: number = 10;
      let arr: Int8Array = new Int8Array([1, 5, 20]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e > threshold);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_4500
     * @tc.name int8ArraySomePart01Test045
     * @tc.desc Verify some predicate always false visits all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let visited: number[] = [];
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let resultVal1: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        visited.push(i);
        return false;
      });
      expect(resultVal1).assertFalse();
      let visitedLen: int = visited.length;
      let expectedLen: int = 3;
      expect(visitedLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_4600
     * @tc.name int8ArraySomePart01Test046
     * @tc.desc Verify predicate array some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let resultVal1: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => {
        a.$_set(i, 0);
        return e < 0;
      });
      expect(resultVal1).assertFalse();
      let actualVal: number = arr.$_get(2);
      let expectedVal: int = 0;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_4700
     * @tc.name int8ArraySomePart01Test047
     * @tc.desc Verify some predicate matches middle zero element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 0, 3]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_4800
     * @tc.name int8ArraySomePart01Test048
     * @tc.desc Verify predicate element < 0 some returns true with named function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, -1, 3]);
      let result: boolean = arr.some(isNegativePart01);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_4900
     * @tc.name int8ArraySomePart01Test049
     * @tc.desc Verify predicate element > 0 some returns true with named checker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, 0, 5]);
      let result: boolean = arr.some(PositiveCheckerPart01.check);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_5000
     * @tc.name int8ArraySomePart01Test050
     * @tc.desc Verify some(5) short-circuits after first match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([5, 5]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => {
        count = count + 1;
        return e === 5;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_5100
     * @tc.name int8ArraySomePart01Test051
     * @tc.desc Verify some(5) calls callback twice before match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([3, 5]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => {
        count = count + 1;
        return e === 5;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_5200
     * @tc.name int8ArraySomePart01Test052
     * @tc.desc Verify some false 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([3, 7]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => {
        count = count + 1;
        return e === 5;
      });
      expect(result).assertFalse();
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_5300
     * @tc.name int8ArraySomePart01Test053
     * @tc.desc Verify some predicate all fives match first only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([5, 5, 5]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => {
        count = count + 1;
        return e === 5;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_5400
     * @tc.name int8ArraySomePart01Test054
     * @tc.desc Verify some predicate six absent visits all three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([5, 5, 5]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => {
        count = count + 1;
        return e === 6;
      });
      expect(result).assertFalse();
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_5500
     * @tc.name int8ArraySomePart01Test055
     * @tc.desc Verify some predicate positive hit at last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([INT8_MIN, -1, 0, 1, INT8_MAX]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => {
        count = count + 1;
        return e > 0;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_5600
     * @tc.name int8ArraySomePart01Test056
     * @tc.desc Verify some predicate negative hit at last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([INT8_MAX, 1, 0, -1, INT8_MIN]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => {
        count = count + 1;
        return e < 0;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_5700
     * @tc.name int8ArraySomePart01Test057
     * @tc.desc Verify some predicate 127 length last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array(127);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        count = count + 1;
        return i === 126;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_5800
     * @tc.name int8ArraySomePart01Test058
     * @tc.desc Verify some predicate false 128 length visits all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array(128);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => {
        count = count + 1;
        return e !== 0;
      });
      expect(result).assertFalse();
      expect(count).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_5900
     * @tc.name int8ArraySomePart01Test059
     * @tc.desc Verify some predicate OR extremes passes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, INT8_MAX]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e === -128 || e === 127);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_6000
     * @tc.name int8ArraySomePart01Test060
     * @tc.desc Verify some predicate AND element index passes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, -1, 3]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e > 0 && i < 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_6100
     * @tc.name int8ArraySomePart01Test061
     * @tc.desc Verify some predicate element equals first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 3, 7]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e === a.$_get(0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_6200
     * @tc.name int8ArraySomePart01Test062
     * @tc.desc Verify some predicate bitwise AND nonzero passes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, -1]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => (e & 128) !== 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_6300
     * @tc.name int8ArraySomePart01Test063
     * @tc.desc Verify predicate e !== e Number.NaN int8 Number.NaN some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, 0, INT8_MAX]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => e !== e);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_6400
     * @tc.name int8ArraySomePart01Test064
     * @tc.desc Verify some predicate INT8_MIN match first call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([INT8_MIN, 0, INT8_MAX]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => {
        count = count + 1;
        return e === -128;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_6500
     * @tc.name int8ArraySomePart01Test065
     * @tc.desc Verify some predicate INT8_MAX match visits all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([INT8_MIN, 0, INT8_MAX]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => {
        count = count + 1;
        return e === 127;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SOME_PART01_TEST_6600
     * @tc.name int8ArraySomePart01Test066
     * @tc.desc Verify some predicate zero match second call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySomePart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      let arr: Int8Array = new Int8Array([INT8_MIN, 0, INT8_MAX]);
      let result: boolean = arr.some((e: number, i: int, a: Int8Array): boolean => {
        count = count + 1;
        return e === 0;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(2);
    });
  });
}
