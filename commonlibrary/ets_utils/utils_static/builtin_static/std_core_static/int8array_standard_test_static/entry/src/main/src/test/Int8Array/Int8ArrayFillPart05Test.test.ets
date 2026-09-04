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

export default function int8ArrayFillPart05Test(): void {
  describe('Int8ArrayFillPart05Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_0100
     * @tc.name Int8ArrayFillPart05Test001
     * @tc.desc Verify fill with byte value 50 writes 50 to all elements, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 50;
      const arr = new Int8Array(3);
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(50);
      expect(arr.$_get(1)).assertEqual(50);
      expect(arr.$_get(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_0200
     * @tc.name Int8ArrayFillPart05Test002
     * @tc.desc Verify fill with number value 50 writes 50 to all elements, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = 50;
      const arr = new Int8Array(3);
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(50);
      expect(arr.$_get(1)).assertEqual(50);
      expect(arr.$_get(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_0300
     * @tc.name Int8ArrayFillPart05Test003
     * @tc.desc Verify fill byte and number types agree for value 0, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vb: byte = 0;
      const vn: number = 0;
      const arr1 = new Int8Array(3);
      const arr2 = new Int8Array(3);
      arr1.fill(vb);
      arr2.fill(vn);
      let r1: number = arr1.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = arr1.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = arr1.$_get(2);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_0400
     * @tc.name Int8ArrayFillPart05Test004
     * @tc.desc Verify fill byte and number types agree for INT8_MAX, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vb: byte = INT8_MAX;
      const vn: number = INT8_MAX;
      const arr1 = new Int8Array(3);
      const arr2 = new Int8Array(3);
      arr1.fill(vb);
      arr2.fill(vn);
      let r1: number = arr1.$_get(0);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
      let r2: number = arr1.$_get(1);
      let e2: number = INT8_MAX;
      expect(r2).assertEqual(e2);
      let r3: number = arr1.$_get(2);
      let e3: number = INT8_MAX;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_0500
     * @tc.name Int8ArrayFillPart05Test005
     * @tc.desc Verify fill byte and number types agree for -128, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vb: byte = -128;
      const vn: number = -128;
      const arr1 = new Int8Array(3);
      const arr2 = new Int8Array(3);
      arr1.fill(vb);
      arr2.fill(vn);
      let r1: number = arr1.$_get(0);
      let e1: int = -128;
      expect(r1).assertEqual(e1);
      let r2: number = arr1.$_get(1);
      let e2: int = -128;
      expect(r2).assertEqual(e2);
      let r3: number = arr1.$_get(2);
      let e3: int = -128;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_0600
     * @tc.name Int8ArrayFillPart05Test006
     * @tc.desc Verify fill byte and number types agree for 1, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vb: byte = 1;
      const vn: number = 1;
      const arr1 = new Int8Array(3);
      const arr2 = new Int8Array(3);
      arr1.fill(vb);
      arr2.fill(vn);
      let r1: number = arr1.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr1.$_get(1);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = arr1.$_get(2);
      let e3: int = 1;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_0700
     * @tc.name Int8ArrayFillPart05Test007
     * @tc.desc Verify fill byte and number types agree for -1, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vb: byte = -1;
      const vn: number = -1;
      const arr1 = new Int8Array(3);
      const arr2 = new Int8Array(3);
      arr1.fill(vb);
      arr2.fill(vn);
      let r1: number = arr1.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      let r2: number = arr1.$_get(1);
      let e2: int = -1;
      expect(r2).assertEqual(e2);
      let r3: number = arr1.$_get(2);
      let e3: int = -1;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_0800
     * @tc.name Int8ArrayFillPart05Test008
     * @tc.desc Verify fill(byte) then fill(number) with same value produces consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const vb: byte = 60;
      arr.fill(vb);
      const vn: number = 60;
      arr.fill(vn);
      let r1: number = arr.$_get(0);
      let e1: int = 60;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_0900
     * @tc.name Int8ArrayFillPart05Test009
     * @tc.desc Verify second fill(vn) 60 overwrites first byte fill 50 on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const vb: byte = 50;
      arr.fill(vb);
      const vn: number = 60;
      arr.fill(vn);
      expect(arr.$_get(0)).assertEqual(60);
      let r1: number = arr.$_get(1);
      let e1: int = 60;
      expect(r1).assertEqual(e1);
      expect(arr.$_get(2)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_1000
     * @tc.name Int8ArrayFillPart05Test010
     * @tc.desc Verify fill(vn) no-range fill then fill(vb) overwrites all elements to 80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const vn: number = 70;
      arr.fill(vn);
      const vb: byte = 80;
      arr.fill(vb);
      expect(arr.$_get(0)).assertEqual(80);
      let r1: number = arr.$_get(1);
      let e1: int = 80;
      expect(r1).assertEqual(e1);
      expect(arr.$_get(2)).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_1100
     * @tc.name Int8ArrayFillPart05Test011
     * @tc.desc Verify fill(vb, 0, 2) then fill(vn, 2, 4) writes 50 then 60 to disjoint ranges on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const vb: byte = 50;
      arr.fill(vb, 0, 2);
      const vn: number = 60;
      arr.fill(vn, 2, 4);
      expect(arr.$_get(0)).assertEqual(50);
      expect(arr.$_get(1)).assertEqual(50);
      expect(arr.$_get(2)).assertEqual(60);
      expect(arr.$_get(3)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_1200
     * @tc.name Int8ArrayFillPart05Test012
     * @tc.desc Verify fill(vb, 1, 3) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int8Array(4);
      const arr2 = new Int8Array(4);
      const vb: byte = 50;
      arr1.fill(vb, 1, 3);
      const vn: number = 50;
      arr2.fill(vn, 1, 3);
      let r1: number = arr1.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = arr1.$_get(1);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
      let r3: number = arr1.$_get(2);
      let e3: int = 50;
      expect(r3).assertEqual(e3);
      let r4: number = arr1.$_get(3);
      let e4: int = 0;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_1300
     * @tc.name Int8ArrayFillPart05Test013
     * @tc.desc Verify fill(vb, 1, 4) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int8Array(5);
      const arr2 = new Int8Array(5);
      const vb: byte = 100;
      arr1.fill(vb, 1, 4);
      const vn: number = 100;
      arr2.fill(vn, 1, 4);
      let r1: number = arr1.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = arr1.$_get(1);
      let e2: int = 100;
      expect(r2).assertEqual(e2);
      let r3: number = arr1.$_get(2);
      let e3: int = 100;
      expect(r3).assertEqual(e3);
      let r4: number = arr1.$_get(3);
      let e4: int = 100;
      expect(r4).assertEqual(e4);
      let r5: number = arr1.$_get(4);
      let e5: int = 0;
      expect(r5).assertEqual(e5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_1400
     * @tc.name Int8ArrayFillPart05Test014
     * @tc.desc Verify range-based fill on different arrays: filled positions hold value, unfilled hold default 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int8Array(5);
      const arr2 = new Int8Array(5);
      const vb: byte = 50;
      arr1.fill(vb, 0, 2);
      const vn: number = 60;
      arr2.fill(vn, 3, 5);
      expect(arr1.$_get(0)).assertEqual(50);
      expect(arr2.$_get(0)).assertEqual(0);
      expect(arr1.$_get(3)).assertEqual(0);
      expect(arr2.$_get(3)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_1500
     * @tc.name Int8ArrayFillPart05Test015
     * @tc.desc Verify fill on empty Int8Array(0) keeps length 0, both byte and number forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int8Array(0);
      const arr2 = new Int8Array(0);
      const vb: byte = 50;
      arr1.fill(vb);
      const vn: number = 50;
      arr2.fill(vn);
      expect(arr1.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_1600
     * @tc.name Int8ArrayFillPart05Test016
     * @tc.desc Verify fill with byte value 50 writes 50 at both ends, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 50;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(50);
      expect(arr.$_get(3)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_1700
     * @tc.name Int8ArrayFillPart05Test017
     * @tc.desc Verify fill with number value 50 writes 50 at both ends, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: number = 50;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(50);
      expect(arr.$_get(3)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_1800
     * @tc.name Int8ArrayFillPart05Test018
     * @tc.desc Verify fill(50, undefined, 2) with byte value fills first two elements leaving tail 0 on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 50;
      arr.fill(v, undefined, 2);
      expect(arr.$_get(0)).assertEqual(50);
      expect(arr.$_get(1)).assertEqual(50);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_1900
     * @tc.name Int8ArrayFillPart05Test019
     * @tc.desc Verify fill(50, undefined, 2) leaves tail 0 (number type), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: number = 50;
      arr.fill(v, undefined, 2);
      expect(arr.$_get(0)).assertEqual(50);
      expect(arr.$_get(1)).assertEqual(50);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_2000
     * @tc.name Int8ArrayFillPart05Test020
     * @tc.desc Verify fill(50, 2, undefined) keeps head 0 and fills tail with 50, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 50;
      arr.fill(v, 2, undefined);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(50);
      expect(arr.$_get(3)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_2100
     * @tc.name Int8ArrayFillPart05Test021
     * @tc.desc Verify fill(50, 2, undefined) with number value keeps head 0 and fills tail, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: number = 50;
      arr.fill(v, 2, undefined);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(50);
      expect(arr.$_get(3)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_2200
     * @tc.name Int8ArrayFillPart05Test022
     * @tc.desc Verify fill byte and number values agree, both write 70 to all elements, on new Int8Array(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int8Array(5);
      const arr2 = new Int8Array(5);
      const vb: byte = 70;
      arr1.fill(vb);
      const vn: number = 70;
      arr2.fill(vn);
      let r1: number = arr1.$_get(0);
      let e1: int = 70;
      expect(r1).assertEqual(e1);
      let r2: number = arr1.$_get(1);
      let e2: int = 70;
      expect(r2).assertEqual(e2);
      let r3: number = arr1.$_get(2);
      let e3: int = 70;
      expect(r3).assertEqual(e3);
      let r4: number = arr1.$_get(3);
      let e4: int = 70;
      expect(r4).assertEqual(e4);
      let r5: number = arr1.$_get(4);
      let e5: int = 70;
      expect(r5).assertEqual(e5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_2300
     * @tc.name Int8ArrayFillPart05Test023
     * @tc.desc Verify fill(v) and fill(v, 0) write 50 to all elements, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int8Array(3);
      const arr2 = new Int8Array(3);
      const v: byte = 50;
      arr1.fill(v);
      arr2.fill(v, 0);
      let r1: number = arr1.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
      let r2: number = arr1.$_get(1);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
      let r3: number = arr1.$_get(2);
      let e3: int = 50;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_2400
     * @tc.name Int8ArrayFillPart05Test024
     * @tc.desc Verify fill(v) and fill(v, 0) with number value write 50 to all elements, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int8Array(3);
      const arr2 = new Int8Array(3);
      const v: number = 50;
      arr1.fill(v);
      arr2.fill(v, 0);
      let r1: number = arr1.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
      let r2: number = arr1.$_get(1);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
      let r3: number = arr1.$_get(2);
      let e3: int = 50;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_2500
     * @tc.name Int8ArrayFillPart05Test025
     * @tc.desc Verify fill byte with (v, 0, 3) matches full fill, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int8Array(3);
      const arr2 = new Int8Array(3);
      const v: byte = 50;
      arr1.fill(v);
      arr2.fill(v, 0, 3);
      let r1: number = arr1.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
      let r2: number = arr1.$_get(1);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
      let r3: number = arr1.$_get(2);
      let e3: int = 50;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_2600
     * @tc.name Int8ArrayFillPart05Test026
     * @tc.desc Verify fill number with (v, 0, 3) matches full fill, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int8Array(3);
      const arr2 = new Int8Array(3);
      const v: number = 50;
      arr1.fill(v);
      arr2.fill(v, 0, 3);
      let r1: number = arr1.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
      let r2: number = arr1.$_get(1);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
      let r3: number = arr1.$_get(2);
      let e3: int = 50;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_2700
     * @tc.name Int8ArrayFillPart05Test027
     * @tc.desc Verify fill(vb, undefined, undefined) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int8Array(3);
      const arr2 = new Int8Array(3);
      const vb: byte = 80;
      arr1.fill(vb, undefined, undefined);
      const vn: number = 80;
      arr2.fill(vn, undefined, undefined);
      let r1: number = arr1.$_get(0);
      let e1: int = 80;
      expect(r1).assertEqual(e1);
      let r2: number = arr1.$_get(1);
      let e2: int = 80;
      expect(r2).assertEqual(e2);
      let r3: number = arr1.$_get(2);
      let e3: int = 80;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_2800
     * @tc.name Int8ArrayFillPart05Test028
     * @tc.desc Verify fill(v) with byte 50 fills all elements to 50, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = 50;
      const ret = arr.fill(v);
      let r1: number = ret.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
      let r2: int = ret.length;
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_2900
     * @tc.name Int8ArrayFillPart05Test029
     * @tc.desc Verify fill(v) with number 50 fills all elements to 50, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: number = 50;
      const ret = arr.fill(v);
      let r1: number = ret.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
      let r2: int = ret.length;
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_3000
     * @tc.name Int8ArrayFillPart05Test030
     * @tc.desc Verify fill with byte value 50 writes 50 to element 0 on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = 50;
      arr.fill(v);
      let r1: number = arr.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_3100
     * @tc.name Int8ArrayFillPart05Test031
     * @tc.desc Verify fill with number value 50 writes 50 to element 0 on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: number = 50;
      arr.fill(v);
      let r1: number = arr.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_3200
     * @tc.name Int8ArrayFillPart05Test032
     * @tc.desc Verify byteOffset of view remains unchanged after fill, elements filled with 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int8Array(buf, 2, 3);
      const v: byte = 50;
      arr.fill(v);
      expect(arr.byteOffset).assertEqual(2);
      let r1: number = arr.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_3300
     * @tc.name Int8ArrayFillPart05Test033
     * @tc.desc Verify byteOffset of view remains unchanged after fill with number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int8Array(buf, 2, 3);
      const v: number = 50;
      arr.fill(v);
      expect(arr.byteOffset).assertEqual(2);
      let r1: number = arr.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_3400
     * @tc.name Int8ArrayFillPart05Test034
     * @tc.desc Verify arr.set(src, 0) with 4-element source on 3-element target throws RangeError, then fill(v) works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      try {
        const src = new Int8Array([1, 2, 3, 4]);
        arr.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const v: byte = 50;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_3500
     * @tc.name Int8ArrayFillPart05Test035
     * @tc.desc Verify fill then arr.set(src, 0) with source longer than target throws RangeError, length stays 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = 50;
      arr.fill(v);
      try {
        const src = new Int8Array([1, 2, 3, 4]);
        arr.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(3);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_3600
     * @tc.name Int8ArrayFillPart05Test036
     * @tc.desc Verify fill returns original array and writes 50, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int8Array(3);
      const arr2 = new Int8Array(3);
      const vb: byte = 50;
      const ret1 = arr1.fill(vb);
      const vn: number = 50;
      const ret2 = arr2.fill(vn);
      let r1: number = ret1.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
      let r2: number = ret2.$_get(0);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_3700
     * @tc.name Int8ArrayFillPart05Test037
     * @tc.desc Verify fill keeps length 5 and writes 50, on new Int8Array(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int8Array(5);
      const arr2 = new Int8Array(5);
      const vb: byte = 50;
      arr1.fill(vb);
      const vn: number = 50;
      arr2.fill(vn);
      expect(arr1.length).assertEqual(5);
      let r1: number = arr1.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_3800
     * @tc.name Int8ArrayFillPart05Test038
     * @tc.desc Verify fill(v) with byte 50 fills all elements to 50 and returns this, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = 50;
      const ret = arr.fill(v);
      let r1: number = ret.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_3900
     * @tc.name Int8ArrayFillPart05Test039
     * @tc.desc Verify fill(v) with number 50 fills all elements to 50 and returns this, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: number = 50;
      const ret = arr.fill(v);
      let r1: number = ret.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_4000
     * @tc.name Int8ArrayFillPart05Test040
     * @tc.desc Verify byte fill 50 makes toString '50,50,50' on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int8Array(3);
      const arr2 = new Int8Array(3);
      const vb: byte = 50;
      arr1.fill(vb);
      const vn: number = 50;
      arr2.fill(vn);
      let r1: string = arr1.toString();
      let e1: string = '50,50,50';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_4100
     * @tc.name Int8ArrayFillPart05Test041
     * @tc.desc Verify fill keeps length 4, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 50;
      const ret = arr.fill(v);
      let r1: int = ret.length;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      expect(ret.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_4200
     * @tc.name Int8ArrayFillPart05Test042
     * @tc.desc Verify fill with number value keeps length 4, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: number = 50;
      const ret = arr.fill(v);
      let r1: int = ret.length;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = ret.$_get(0);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_4300
     * @tc.name Int8ArrayFillPart05Test043
     * @tc.desc Verify fill keeps byteLength 4, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 50;
      const ret = arr.fill(v);
      let r1: int = ret.byteLength;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = ret.$_get(0);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_4400
     * @tc.name Int8ArrayFillPart05Test044
     * @tc.desc Verify fill with number value keeps byteLength 4, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: number = 50;
      const ret = arr.fill(v);
      let r1: int = ret.byteLength;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = ret.$_get(0);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_4500
     * @tc.name Int8ArrayFillPart05Test045
     * @tc.desc Verify fill with byte value 100 writes 100 to all elements, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = 100;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(100);
      expect(arr.$_get(1)).assertEqual(100);
      expect(arr.$_get(2)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_4600
     * @tc.name Int8ArrayFillPart05Test046
     * @tc.desc Verify fill with number value 100 writes 100 to all elements, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: number = 100;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(100);
      expect(arr.$_get(1)).assertEqual(100);
      expect(arr.$_get(2)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_4700
     * @tc.name Int8ArrayFillPart05Test047
     * @tc.desc Verify chained fill(vb).fill(vn) writes 60 to all elements on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const vb: byte = 50;
      const vn: number = 60;
      arr.fill(vb).fill(vn);
      expect(arr.$_get(0)).assertEqual(60);
      let r1: number = arr.$_get(1);
      let e1: int = 60;
      expect(r1).assertEqual(e1);
      expect(arr.$_get(2)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_4800
     * @tc.name Int8ArrayFillPart05Test048
     * @tc.desc Verify fill with byte value 70 makes at(-1) return 70, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = 70;
      arr.fill(v);
      expect(arr.at(-1)).assertEqual(70);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_4900
     * @tc.name Int8ArrayFillPart05Test049
     * @tc.desc Verify fill with number value 70 makes at(-1) return 70, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: number = 70;
      arr.fill(v);
      expect(arr.at(-1)).assertEqual(70);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_5000
     * @tc.name Int8ArrayFillPart05Test050
     * @tc.desc Verify fill byte and number values agree, at(0) returns 90
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int8Array(3);
      const arr2 = new Int8Array(3);
      const vb: byte = 90;
      arr1.fill(vb);
      const vn: number = 90;
      arr2.fill(vn);
      expect(arr1.at(0)).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_5100
     * @tc.name Int8ArrayFillPart05Test051
     * @tc.desc Verify fill keeps buffer byteLength 3 and writes 50, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = 50;
      arr.fill(v);
      let r1: int = arr.byteLength;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(0);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_5200
     * @tc.name Int8ArrayFillPart05Test052
     * @tc.desc Verify fill with number value keeps buffer byteLength 3 and writes 50, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: number = 50;
      arr.fill(v);
      let r1: int = arr.byteLength;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(0);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_5300
     * @tc.name Int8ArrayFillPart05Test053
     * @tc.desc Verify byte fill 50 on new Int8Array(4) reflected in subarray(0, 2) view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const view = arr.subarray(0, 2);
      const v: byte = 50;
      arr.fill(v);
      expect(view.$_get(0)).assertEqual(50);
      expect(view.$_get(1)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_5400
     * @tc.name Int8ArrayFillPart05Test054
     * @tc.desc Verify fill(50 number type) on new Int8Array(4) reflected in subarray(0, 2) view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const view = arr.subarray(0, 2);
      const v: number = 50;
      arr.fill(v);
      expect(view.$_get(0)).assertEqual(50);
      expect(view.$_get(1)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_5500
     * @tc.name Int8ArrayFillPart05Test055
     * @tc.desc Verify byte fill 80 on new Int8Array(4) reflected in subarray(1, 3) view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const view = arr.subarray(1, 3);
      const v: byte = 80;
      arr.fill(v);
      expect(view.$_get(0)).assertEqual(80);
      expect(view.$_get(1)).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_5600
     * @tc.name Int8ArrayFillPart05Test056
     * @tc.desc Verify fill(50, 1, 3) keeps 10 at 0 and 40 at 3, fills middle with 50, on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([10, 20, 30, 40]);
      const v: byte = 50;
      arr.fill(v, 1, 3);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(50);
      expect(arr.$_get(2)).assertEqual(50);
      expect(arr.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_5700
     * @tc.name Int8ArrayFillPart05Test057
     * @tc.desc Verify fill(50, 1, 3) with number value keeps ends and fills middle, on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([10, 20, 30, 40]);
      const v: number = 50;
      arr.fill(v, 1, 3);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(50);
      expect(arr.$_get(2)).assertEqual(50);
      expect(arr.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_5800
     * @tc.name Int8ArrayFillPart05Test058
     * @tc.desc Verify fill(99, 1, 3) fills middle with 99, keeps 10, 40, 50, on new Int8Array([10, 20, 30, 40, 50])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([10, 20, 30, 40, 50]);
      const v: byte = 99;
      arr.fill(v, 1, 3);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(3)).assertEqual(40);
      expect(arr.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_5900
     * @tc.name Int8ArrayFillPart05Test059
     * @tc.desc Verify fill(99, 1, 3) with number value fills middle, keeps ends, on new Int8Array([10, 20, 30, 40, 50])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([10, 20, 30, 40, 50]);
      const v: number = 99;
      arr.fill(v, 1, 3);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(3)).assertEqual(40);
      expect(arr.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_6000
     * @tc.name Int8ArrayFillPart05Test060
     * @tc.desc Verify fill on first half of shared ArrayBuffer keeps second half 0, then fills it with 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const arr1 = new Int8Array(buf, 0, 3);
      const arr2 = new Int8Array(buf, 3, 3);
      const v: byte = 50;
      arr1.fill(v);
      expect(arr2.$_get(0)).assertEqual(0);
      const vn: number = 60;
      arr2.fill(vn);
      expect(arr2.$_get(0)).assertEqual(60);
      expect(arr1.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_6100
     * @tc.name Int8ArrayFillPart05Test061
     * @tc.desc Verify fill byte 50 and number 60 on separate arrays, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int8Array(3);
      const arr2 = new Int8Array(3);
      const vb: byte = 50;
      arr1.fill(vb);
      const vn: number = 60;
      arr2.fill(vn);
      expect(arr1.$_get(0)).assertEqual(50);
      expect(arr2.$_get(0)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_6200
     * @tc.name Int8ArrayFillPart05Test062
     * @tc.desc Verify slice(0, 3) of fill(50) result stays 50 after original refilled with 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = 50;
      arr.fill(v);
      const copy = arr.slice(0, 3);
      const vn: number = 60;
      arr.fill(vn);
      expect(copy.$_get(0)).assertEqual(50);
      expect(arr.$_get(0)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_6300
     * @tc.name Int8ArrayFillPart05Test063
     * @tc.desc Verify fill(70) on new Int8Array(6) reflected in both subarray views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(6);
      const view1 = arr.subarray(0, 2);
      const view2 = arr.subarray(2, 4);
      const v: byte = 70;
      arr.fill(v);
      expect(view1.$_get(0)).assertEqual(70);
      let r1: number = view1.$_get(1);
      let e1: int = 70;
      expect(r1).assertEqual(e1);
      expect(view2.$_get(0)).assertEqual(70);
      let r2: number = view2.$_get(1);
      let e2: int = 70;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_6400
     * @tc.name Int8ArrayFillPart05Test064
     * @tc.desc Verify slice(0, 3) of fill(50) result matches original elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = 50;
      arr.fill(v);
      const copy = arr.slice(0, 3);
      let r1: number = copy.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
      let r2: number = copy.$_get(2);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_6500
     * @tc.name Int8ArrayFillPart05Test065
     * @tc.desc Verify slice(0, 3) creates independent copy, $_set on copy does not affect original filled with 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = 50;
      arr.fill(v);
      const copy = arr.slice(0, 3);
      copy.$_set(0, 99);
      expect(arr.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_6600
     * @tc.name Int8ArrayFillPart05Test066
     * @tc.desc Verify fill(128) truncates to -128, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      const v: number = 128;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(1)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_6700
     * @tc.name Int8ArrayFillPart05Test067
     * @tc.desc Verify fill(-129) truncates to INT8_MAX, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      const v: number = -129;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
      expect(arr.$_get(1)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_6800
     * @tc.name Int8ArrayFillPart05Test068
     * @tc.desc Verify fill(200) truncates to -56, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      const v: number = 200;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(-56);
      expect(arr.$_get(1)).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_6900
     * @tc.name Int8ArrayFillPart05Test069
     * @tc.desc Verify fill(255) clamps to -1, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      const v: number = 255;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_7000
     * @tc.name Int8ArrayFillPart05Test070
     * @tc.desc Verify fill(Number.NaN) converts to 0, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      const v: number = Number.NaN;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_7100
     * @tc.name Int8ArrayFillPart05Test071
     * @tc.desc Verify fill(1.9) truncates to 1, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      const v: number = 1.9;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_7200
     * @tc.name Int8ArrayFillPart05Test072
     * @tc.desc Verify fill(-1.9) truncates to -1, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      const v: number = -1.9;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_7300
     * @tc.name Int8ArrayFillPart05Test073
     * @tc.desc Verify fill(256) wraps to 0, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      const v: number = 256;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_7400
     * @tc.name Int8ArrayFillPart05Test074
     * @tc.desc Verify fill byte and number values agree for INT8_MAX, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int8Array(2);
      const arr2 = new Int8Array(2);
      const vb: byte = INT8_MAX;
      arr1.fill(vb);
      const vn: number = INT8_MAX;
      arr2.fill(vn);
      let r1: number = arr1.$_get(0);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
      let r2: number = arr1.$_get(1);
      let e2: number = INT8_MAX;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_7500
     * @tc.name Int8ArrayFillPart05Test075
     * @tc.desc Verify fill byte and number values agree for -128, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int8Array(2);
      const arr2 = new Int8Array(2);
      const vb: byte = -128;
      arr1.fill(vb);
      const vn: number = -128;
      arr2.fill(vn);
      let r1: number = arr1.$_get(0);
      let e1: int = -128;
      expect(r1).assertEqual(e1);
      let r2: number = arr1.$_get(1);
      let e2: int = -128;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_7600
     * @tc.name Int8ArrayFillPart05Test076
     * @tc.desc Verify fill ranges 50 then 60 on same array, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const vb: byte = 50;
      arr.fill(vb, 0, 2);
      const vn: number = 60;
      arr.fill(vn, 1, 3);
      expect(arr.$_get(0)).assertEqual(50);
      expect(arr.$_get(1)).assertEqual(60);
      expect(arr.$_get(2)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_7700
     * @tc.name Int8ArrayFillPart05Test077
     * @tc.desc Verify fill(vn, 0, 2) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const vn: number = 60;
      arr.fill(vn, 0, 2);
      const vb: byte = 50;
      arr.fill(vb, 1, 3);
      expect(arr.$_get(0)).assertEqual(60);
      expect(arr.$_get(1)).assertEqual(50);
      expect(arr.$_get(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_7800
     * @tc.name Int8ArrayFillPart05Test078
     * @tc.desc Verify fill(vb, 0, 1) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const vb: byte = 10;
      arr.fill(vb, 0, 1);
      const vn: number = 20;
      arr.fill(vn, 1, 2);
      const vb2: byte = 30;
      arr.fill(vb2, 2, 3);
      const vn2: number = 40;
      arr.fill(vn2, 3, 4);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
      expect(arr.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_7900
     * @tc.name Int8ArrayFillPart05Test079
     * @tc.desc Verify fill(vb, -2) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int8Array([10, 20, 30, 40]);
      const arr2 = new Int8Array([10, 20, 30, 40]);
      const vb: byte = 99;
      arr1.fill(vb, -2);
      const vn: number = 99;
      arr2.fill(vn, -2);
      let r1: number = arr1.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = arr1.$_get(1);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      expect(arr1.$_get(2)).assertEqual(99);
      let r3: number = arr1.$_get(3);
      let e3: int = 99;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_8000
     * @tc.name Int8ArrayFillPart05Test080
     * @tc.desc Verify fill(vb, 1, -1) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int8Array([10, 20, 30, 40]);
      const arr2 = new Int8Array([10, 20, 30, 40]);
      const vb: byte = 99;
      arr1.fill(vb, 1, -1);
      const vn: number = 99;
      arr2.fill(vn, 1, -1);
      let r1: number = arr1.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = arr1.$_get(1);
      let e2: int = 99;
      expect(r2).assertEqual(e2);
      expect(arr1.$_get(2)).assertEqual(99);
      expect(arr1.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_8100
     * @tc.name Int8ArrayFillPart05Test081
     * @tc.desc Verify fill(Number.POSITIVE_INFINITY) converts to 0, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      const v: number = Number.POSITIVE_INFINITY;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_05_8200
     * @tc.name Int8ArrayFillPart05Test082
     * @tc.desc Verify fill(Number.NEGATIVE_INFINITY) converts to 0, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('Int8ArrayFillPart05Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      const v: number = Number.NEGATIVE_INFINITY;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });
  });
}
