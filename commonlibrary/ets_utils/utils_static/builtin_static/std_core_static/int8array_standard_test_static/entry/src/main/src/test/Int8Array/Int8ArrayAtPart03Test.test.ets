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

export default function testsuite(): void {
  describe('Int8ArrayAtPart03Test', (): void => {
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
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_0100
   * @tc.name int8ArrayAtPart03Test001
   * @tc.desc Verify at(length) returns undefined on 3-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10, 20, 30]);
    let r = arr.at(3);
    expect(r).assertUndefined();
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_0200
   * @tc.name int8ArrayAtPart03Test002
   * @tc.desc Verify at(length+1) returns undefined on 3-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10, 20, 30]);
    let r = arr.at(4);
    expect(r).assertUndefined();
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_0300
   * @tc.name int8ArrayAtPart03Test003
   * @tc.desc Verify at(2147483647) int max out-of-bounds returns undefined on 3-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10, 20, 30]);
    let r = arr.at(2147483647);
    expect(r).assertUndefined();
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_0400
   * @tc.name int8ArrayAtPart03Test004
   * @tc.desc Verify at(1000000) large positive out-of-bounds returns undefined on 3-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10, 20, 30]);
    let r = arr.at(1000000);
    expect(r).assertUndefined();
  });


  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_0500
   * @tc.name int8ArrayAtPart03Test005
   * @tc.desc Verify at(length) returns undefined on single-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10]);
    let r = arr.at(1);
    expect(r).assertUndefined();
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_0600
   * @tc.name int8ArrayAtPart03Test006
   * @tc.desc Verify at(length+1) returns undefined on single-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10]);
    let r = arr.at(2);
    expect(r).assertUndefined();
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_0700
   * @tc.name int8ArrayAtPart03Test007
   * @tc.desc Verify at(2147483647) int max out-of-bounds returns undefined on single-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10]);
    let r = arr.at(2147483647);
    expect(r).assertUndefined();
  });


  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_0800
   * @tc.name int8ArrayAtPart03Test008
   * @tc.desc Verify at(0) returns undefined on empty Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array(0);
    let r = arr.at(0);
    expect(r).assertUndefined();
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_0900
   * @tc.name int8ArrayAtPart03Test009
   * @tc.desc Verify at(1) smallest positive out-of-bounds returns undefined on empty Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array(0);
    let r = arr.at(1);
    expect(r).assertUndefined();
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_1000
   * @tc.name int8ArrayAtPart03Test010
   * @tc.desc Verify at(100) large out-of-bounds returns undefined on empty Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array(0);
    let r = arr.at(100);
    expect(r).assertUndefined();
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_1100
   * @tc.name int8ArrayAtPart03Test011
   * @tc.desc Verify at(2147483647) int max out-of-bounds returns undefined on empty Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array(0);
    let r = arr.at(2147483647);
    expect(r).assertUndefined();
  });


  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_1200
   * @tc.name int8ArrayAtPart03Test012
   * @tc.desc Verify at(-length-1) negative out-of-bounds returns undefined on 3-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10, 20, 30]);
    let r = arr.at(-4);
    expect(r).assertUndefined();
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_1300
   * @tc.name int8ArrayAtPart03Test013
   * @tc.desc Verify at(-length-2) negative out-of-bounds+1 returns undefined on 3-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10, 20, 30]);
    let r = arr.at(-5);
    expect(r).assertUndefined();
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_1400
   * @tc.name int8ArrayAtPart03Test014
   * @tc.desc Verify at(-1000000) large negative out-of-bounds returns undefined on 3-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10, 20, 30]);
    let r = arr.at(-1000000);
    expect(r).assertUndefined();
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_1500
   * @tc.name int8ArrayAtPart03Test015
   * @tc.desc Verify at(-2147483648) int min out-of-bounds returns undefined on 3-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10, 20, 30]);
    let r = arr.at(-2147483648);
    expect(r).assertUndefined();
  });


  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_1600
   * @tc.name int8ArrayAtPart03Test016
   * @tc.desc Verify at(-length-1) negative out-of-bounds returns undefined on single-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10]);
    let r = arr.at(-2);
    expect(r).assertUndefined();
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_1700
   * @tc.name int8ArrayAtPart03Test017
   * @tc.desc Verify at(-3) negative out-of-bounds+1 returns undefined on single-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10]);
    let r = arr.at(-3);
    expect(r).assertUndefined();
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_1800
   * @tc.name int8ArrayAtPart03Test018
   * @tc.desc Verify at(-2147483648) int min out-of-bounds returns undefined on single-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10]);
    let r = arr.at(-2147483648);
    expect(r).assertUndefined();
  });


  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_1900
   * @tc.name int8ArrayAtPart03Test019
   * @tc.desc Verify at(-1) negative first index out-of-bounds returns undefined on empty Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array(0);
    let r = arr.at(-1);
    expect(r).assertUndefined();
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_2000
   * @tc.name int8ArrayAtPart03Test020
   * @tc.desc Verify at(-100) large negative out-of-bounds returns undefined on empty Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array(0);
    let r = arr.at(-100);
    expect(r).assertUndefined();
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_2100
   * @tc.name int8ArrayAtPart03Test021
   * @tc.desc Verify at(-2147483648) int min out-of-bounds returns undefined on empty Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array(0);
    let r = arr.at(-2147483648);
    expect(r).assertUndefined();
  });


  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_2200
   * @tc.name int8ArrayAtPart03Test022
   * @tc.desc Verify at(0) returns first element 10 on 3-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10, 20, 30]);
    let r = arr.at(0);
    expect(r).assertEqual(10);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_2300
   * @tc.name int8ArrayAtPart03Test023
   * @tc.desc Verify at(length-1) returns last element 30 on 3-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10, 20, 30]);
    let r = arr.at(2);
    expect(r).assertEqual(30);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_2400
   * @tc.name int8ArrayAtPart03Test024
   * @tc.desc Verify at(-1) negative index returns last element 30 on 3-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10, 20, 30]);
    let r = arr.at(-1);
    expect(r).assertEqual(30);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_2500
   * @tc.name int8ArrayAtPart03Test025
   * @tc.desc Verify at(-length) negative index returns first element 10 on 3-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10, 20, 30]);
    let r = arr.at(-3);
    expect(r).assertEqual(10);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_2600
   * @tc.name int8ArrayAtPart03Test026
   * @tc.desc Verify at(1) returns middle element 20 on 3-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10, 20, 30]);
    let r = arr.at(1);
    expect(r).assertEqual(20);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_2700
   * @tc.name int8ArrayAtPart03Test027
   * @tc.desc Verify at(-2) negative index returns middle element 20 on 3-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10, 20, 30]);
    let r = arr.at(-2);
    expect(r).assertEqual(20);
  });


  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_2800
   * @tc.name int8ArrayAtPart03Test028
   * @tc.desc Verify at(0) returns the only element 10 on single-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10]);
    let r = arr.at(0);
    expect(r).assertEqual(10);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_2900
   * @tc.name int8ArrayAtPart03Test029
   * @tc.desc Verify at(-1) negative index returns the only element 10 on single-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10]);
    let r = arr.at(-1);
    expect(r).assertEqual(10);
  });


  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_3000
   * @tc.name int8ArrayAtPart03Test030
   * @tc.desc Verify at(0) returns 0 on all-zero 5-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([0, 0, 0, 0, 0]);
    let r = arr.at(0);
    expect(r).assertEqual(0);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_3100
   * @tc.name int8ArrayAtPart03Test031
   * @tc.desc Verify at(-1) returns 0 on all-zero 5-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([0, 0, 0, 0, 0]);
    let r = arr.at(-1);
    expect(r).assertEqual(0);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_3200
   * @tc.name int8ArrayAtPart03Test032
   * @tc.desc Verify at(length-1) returns 0 on all-zero 5-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([0, 0, 0, 0, 0]);
    let r = arr.at(4);
    expect(r).assertEqual(0);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_3300
   * @tc.name int8ArrayAtPart03Test033
   * @tc.desc Verify at(length) out-of-bounds returns undefined not 0 on all-zero Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([0, 0, 0, 0, 0]);
    let r = arr.at(5);
    expect(r).assertUndefined();
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_3400
   * @tc.name int8ArrayAtPart03Test034
   * @tc.desc Verify at(-length-1) negative out-of-bounds returns undefined not 0 on all-zero Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([0, 0, 0, 0, 0]);
    let r = arr.at(-6);
    expect(r).assertUndefined();
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_3500
   * @tc.name int8ArrayAtPart03Test035
   * @tc.desc Verify at(0) returns 127 on all-127 5-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MAX, INT8_MAX, INT8_MAX, INT8_MAX]);
    let r = arr.at(0);
    expect(r).assertEqual(INT8_MAX);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_3600
   * @tc.name int8ArrayAtPart03Test036
   * @tc.desc Verify at(-1) returns 127 on all-127 5-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MAX, INT8_MAX, INT8_MAX, INT8_MAX]);
    let r = arr.at(-1);
    expect(r).assertEqual(INT8_MAX);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_3700
   * @tc.name int8ArrayAtPart03Test037
   * @tc.desc Verify at(length) out-of-bounds returns undefined not 127 on all-127 Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MAX, INT8_MAX, INT8_MAX, INT8_MAX]);
    let r = arr.at(5);
    expect(r).assertUndefined();
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_3800
   * @tc.name int8ArrayAtPart03Test038
   * @tc.desc Verify at(0) returns -128 on all-minus128 5-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([-128, -128, -128, -128, -128]);
    let r = arr.at(0);
    expect(r).assertEqual(-128);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_3900
   * @tc.name int8ArrayAtPart03Test039
   * @tc.desc Verify at(-1) returns -128 on all-minus128 5-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([-128, -128, -128, -128, -128]);
    let r = arr.at(-1);
    expect(r).assertEqual(-128);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_4000
   * @tc.name int8ArrayAtPart03Test040
   * @tc.desc Verify at(length-1) returns -128 on all-minus128 5-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([-128, -128, -128, -128, -128]);
    let r = arr.at(4);
    expect(r).assertEqual(-128);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_4100
   * @tc.name int8ArrayAtPart03Test041
   * @tc.desc Verify at(0) returns -1 on all-minus1 5-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([-1, -1, -1, -1, -1]);
    let r = arr.at(0);
    expect(r).assertEqual(-1);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_4200
   * @tc.name int8ArrayAtPart03Test042
   * @tc.desc Verify at(-length) negative index returns first element -1 on all-minus1 Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([-1, -1, -1, -1, -1]);
    let r = arr.at(-5);
    expect(r).assertEqual(-1);
  });


  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_4300
   * @tc.name int8ArrayAtPart03Test043
   * @tc.desc Verify at(0) reads int8 min value -128 and returns -128
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([-128]);
    let r = arr.at(0);
    expect(r).assertEqual(-128);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_4400
   * @tc.name int8ArrayAtPart03Test044
   * @tc.desc Verify at(0) reads int8 max value 127 and returns 127
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([INT8_MAX]);
    let r = arr.at(0);
    expect(r).assertEqual(INT8_MAX);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_4500
   * @tc.name int8ArrayAtPart03Test045
   * @tc.desc Verify $_set Number.NaN truncated to 0 then at(0) returns 0
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array(1);
    arr.$_set(0, Number.NaN);
    let r = arr.at(0);
    expect(r).assertEqual(0);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_4600
   * @tc.name int8ArrayAtPart03Test046
   * @tc.desc Verify $_set 200 truncated wraps to -56 then at(0) returns -56
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array(1);
    arr.$_set(0, 200);
    let r = arr.at(0);
    expect(r).assertEqual(-56);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_4700
   * @tc.name int8ArrayAtPart03Test047
   * @tc.desc Verify $_set 0x80 truncated wraps to -128 then at(0) returns -128
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array(1);
    arr.$_set(0, 0x80);
    let r = arr.at(0);
    expect(r).assertEqual(-128);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_4800
   * @tc.name int8ArrayAtPart03Test048
   * @tc.desc Verify $_set 0xFF truncated wraps to -1 then at(0) returns -1
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array(1);
    arr.$_set(0, 0xFF);
    let r = arr.at(0);
    expect(r).assertEqual(-1);
  });


  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_4900
   * @tc.name int8ArrayAtPart03Test049
   * @tc.desc Verify at(0) returns 0 while at(10) returns undefined to distinguish valid 0 from undefined on all-zero Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([0, 0, 0]);
    let rIn = arr.at(0);
    let rOut = arr.at(10);
    expect(rIn).assertEqual(0);
    expect(rOut).assertUndefined();
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_5000
   * @tc.name int8ArrayAtPart03Test050
   * @tc.desc Verify at(0) returns -1 while at(10) returns undefined to distinguish valid -1 from undefined on all-minus1 Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([-1, -1, -1]);
    let rIn = arr.at(0);
    let rOut = arr.at(10);
    expect(rIn).assertEqual(-1);
    expect(rOut).assertUndefined();
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_5100
   * @tc.name int8ArrayAtPart03Test051
   * @tc.desc Verify at(0) returns 127 while at(10) returns undefined to distinguish valid 127 from undefined on all-127 Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MAX, INT8_MAX]);
    let rIn = arr.at(0);
    let rOut = arr.at(10);
    expect(rIn).assertEqual(INT8_MAX);
    expect(rOut).assertUndefined();
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_5200
   * @tc.name int8ArrayAtPart03Test052
   * @tc.desc Verify at(0) returns -128 while at(10) returns undefined to distinguish valid -128 from undefined on all-minus128 Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([-128, -128, -128]);
    let rIn = arr.at(0);
    let rOut = arr.at(10);
    expect(rIn).assertEqual(-128);
    expect(rOut).assertUndefined();
  });


  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_5300
   * @tc.name int8ArrayAtPart03Test053
   * @tc.desc Verify at() call does not change original array length
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10, 20, 30]);
    let before: number = arr.length;
    let r = arr.at(1);
    let after: number = arr.length;
    expect(after).assertEqual(before);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_5400
   * @tc.name int8ArrayAtPart03Test054
   * @tc.desc Verify at() call does not change original array element values
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10, 20, 30]);
    let r = arr.at(1);
    expect(arr.$_get(0)).assertEqual(10);
    expect(arr.$_get(1)).assertEqual(20);
    expect(arr.$_get(2)).assertEqual(30);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_5500
   * @tc.name int8ArrayAtPart03Test055
   * @tc.desc Verify at() call does not change original array byteLength
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10, 20, 30]);
    let before: number = arr.byteLength;
    let r = arr.at(1);
    let after: number = arr.byteLength;
    expect(after).assertEqual(before);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_5600
   * @tc.name int8ArrayAtPart03Test056
   * @tc.desc Verify multiple at() calls on same index return consistent results
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10, 20, 30]);
    let r1 = arr.at(1);
    let r2 = arr.at(1);
    expect(r1).assertEqual(r2);
  });


  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_5700
   * @tc.name int8ArrayAtPart03Test057
   * @tc.desc Verify subarray view at(0) returns first element of the view
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
    let view: Int8Array = arr.subarray(1, 3);
    let r = view.at(0);
    expect(r).assertEqual(20);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_5800
   * @tc.name int8ArrayAtPart03Test058
   * @tc.desc Verify slice copy at(0) returns first element of the copy
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
    let copy: Int8Array = arr.slice(1, 3);
    let r = copy.at(0);
    expect(r).assertEqual(20);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_5900
   * @tc.name int8ArrayAtPart03Test059
   * @tc.desc Verify subarray view reflects new value when shared buffer is modified via $_set
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10, 20, 30]);
    let view: Int8Array = arr.subarray(0, 3);
    arr.$_set(1, 99);
    let r = view.at(1);
    expect(r).assertEqual(99);
  });


  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_6000
   * @tc.name int8ArrayAtPart03Test060
   * @tc.desc Verify at(0) and at(-length) return same value on 5-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
    let r1 = arr.at(0);
    let r2 = arr.at(-5);
    expect(r1).assertEqual(r2);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_6100
   * @tc.name int8ArrayAtPart03Test061
   * @tc.desc Verify at(-1) and at(length-1) return same value on 4-element Int8Array
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
    let r1 = arr.at(-1);
    let r2 = arr.at(3);
    expect(r1).assertEqual(r2);
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_6200
   * @tc.name int8ArrayAtPart03Test062
   * @tc.desc Verify at(length) positive out-of-bounds and at(-length-1) negative out-of-bounds both return undefined
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10, 20, 30]);
    let r1 = arr.at(3);
    let r2 = arr.at(-4);
    expect(r1).assertUndefined();
    expect(r2).assertUndefined();
  });


  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_6300
   * @tc.name int8ArrayAtPart03Test063
   * @tc.desc Verify at(out-of-bounds) returns undefined on Int8Array created via Int8Array.of
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = Int8Array.of(1, 2, 3);
    let r = arr.at(5);
    expect(r).assertUndefined();
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_6400
   * @tc.name int8ArrayAtPart03Test064
   * @tc.desc Verify at(out-of-bounds) returns undefined on Int8Array created via Int8Array.from
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let src: Array<number> = [1, 2, 3];
    let arr: Int8Array = Int8Array.from(src);
    let r = arr.at(5);
    expect(r).assertUndefined();
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_6500
   * @tc.name int8ArrayAtPart03Test065
   * @tc.desc Verify at(out-of-bounds) returns undefined on Int8Array created from ArrayBuffer view
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let buf: ArrayBuffer = new ArrayBuffer(3);
    let arr: Int8Array = new Int8Array(buf);
    let r = arr.at(5);
    expect(r).assertUndefined();
  });

  /**
   * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART03_6600
   * @tc.name int8ArrayAtPart03Test066
   * @tc.desc Verify at(view.length) relative out-of-bounds returns undefined on subarray view
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level LEVEL2
   */
  it('int8ArrayAtPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
    let view: Int8Array = arr.subarray(1, 3);
    let r = view.at(2);
    expect(r).assertUndefined();
  });
});
}
