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

export default function int8ArrayCopyWithinPart04Test(): void {
  describe('Int8ArrayCopyWithinPart04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_0100
     * @tc.name int8ArrayCopyWithinPart04Test001
     * @tc.desc Verify $_set(0, 99) after copyWithin(0, 2, 4) writes through to arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let ret: Int8Array = arr.copyWithin(0, 2, 4);
      ret.$_set(0, 99);
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_0200
     * @tc.name int8ArrayCopyWithinPart04Test002
     * @tc.desc Verify copyWithin(0, 2, 4) copies [3,4] to head making toString '3,4,3,4' on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 2, 4);
      expect(arr.length).assertEqual(4);
      let r1: int = arr.byteLength;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: string = arr.toString();
      let e2: string = '3,4,3,4';
      expect(r2).assertEqual(e2);
      let r3: string = arr.join('-');
      let e3: string = '3-4-3-4';
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_0300
     * @tc.name int8ArrayCopyWithinPart04Test003
     * @tc.desc Verify copyWithin(0, 2, 4) keeps arr.buffer equal to bufBefore on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let bufBefore: ArrayBuffer = arr.buffer;
      arr.copyWithin(0, 2, 4);
      let r1: ArrayBuffer = arr.buffer;
      let e1: ArrayBuffer = bufBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_0400
     * @tc.name int8ArrayCopyWithinPart04Test004
     * @tc.desc Verify copyWithin(0, 2, 4) on ArrayBuffer offset view keeps byteOffset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(new ArrayBuffer(8), 2, 4);
      arr.copyWithin(0, 2, 4);
      let r1: int = arr.byteOffset;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_0500
     * @tc.name int8ArrayCopyWithinPart04Test005
     * @tc.desc Verify copyWithin target=3 start=0 end=2 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(3, 0, 2);
      let r1: number = arr.$_get(3);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(4);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_0600
     * @tc.name int8ArrayCopyWithinPart04Test006
     * @tc.desc Verify copyWithin(0, 3, 5) on [1,2,3,4,5] copies [4,5] to head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3, 5);
      let r1: number = arr.$_get(0);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 5;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_0700
     * @tc.name int8ArrayCopyWithinPart04Test007
     * @tc.desc Verify copyWithin target=1 start=0 end=3 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(1, 0, 3);
      let r1: number = arr.$_get(1);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(2);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(3);
      let e3: int = 3;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_0800
     * @tc.name int8ArrayCopyWithinPart04Test008
     * @tc.desc Verify copyWithin target=1 start=3 end=5 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      arr.copyWithin(1, 3, 5);
      let r1: number = arr.$_get(1);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(2);
      let e2: int = 5;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_0900
     * @tc.name int8ArrayCopyWithinPart04Test009
     * @tc.desc Verify copyWithin(4, 0, 2) expects 1, with $_get(0), on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(4, 0, 2);
      expect(arr.$_get(0)).assertEqual(1);
      let r1: number = arr.$_get(3);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_1000
     * @tc.name int8ArrayCopyWithinPart04Test010
     * @tc.desc Verify copyWithin target=0 start=3 end=2 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 3, 2);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_1100
     * @tc.name int8ArrayCopyWithinPart04Test011
     * @tc.desc Verify copyWithin(0, 4, 4) with empty source range is a no-op keeping $_get(0) 1 on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 4, 4);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_1200
     * @tc.name int8ArrayCopyWithinPart04Test012
     * @tc.desc Verify copyWithin expects 3 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let watcher: Int8Array = new Int8Array(arr.buffer);
      arr.copyWithin(0, 2, 4);
      expect(watcher.$_get(0)).assertEqual(3);
      expect(watcher.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_1300
     * @tc.name int8ArrayCopyWithinPart04Test013
     * @tc.desc Verify copyWithin(0,3,5) on [1,2,3,4,5] turns toString from '1,2,3,4,5' to '4,5,3,4,5'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let before: string = arr.toString();
      arr.copyWithin(0, 3, 5);
      let after: string = arr.toString();
      expect(before).assertEqual('1,2,3,4,5');
      expect(after).assertEqual('4,5,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_1400
     * @tc.name int8ArrayCopyWithinPart04Test014
     * @tc.desc Verify copyWithin(0,2,4) on [10,20,30,40] copies [30,40] to head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      arr.copyWithin(0, 2, 4);
      expect(arr.$_get(0)).assertEqual(30);
      expect(arr.$_get(1)).assertEqual(40);
      expect(arr.at(0)).assertEqual(30);
      expect(arr.at(1)).assertEqual(40);
      expect(arr.indexOf(30)).assertEqual(0);
      expect(arr.includes(40)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_1500
     * @tc.name int8ArrayCopyWithinPart04Test015
     * @tc.desc Verify copyWithin expects 4, with $_get(0), on new Int8Array([1, 2, 3, 4, 5, 6]), returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      arr.copyWithin(0, 3, 6);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(6);
      let r1: number = arr.$_get(3);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      expect(arr.lastIndexOf(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_1600
     * @tc.name int8ArrayCopyWithinPart04Test016
     * @tc.desc Verify copyWithin target=2 start=0 end=10 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(2, 0, 10);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_1700
     * @tc.name int8ArrayCopyWithinPart04Test017
     * @tc.desc Verify copyWithin expects 14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 2, 4);
      let sum: number = 0;
      for (let i = 0; i < arr.length; i++) {
        sum = sum + arr.$_get(i);
      }
      expect(sum).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_1800
     * @tc.name int8ArrayCopyWithinPart04Test018
     * @tc.desc Verify copyWithin(0, 2, 4) copies [7,8] to head making indexOf(7) 0 on new Int8Array([5, 6, 7, 8])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 6, 7, 8]);
      arr.copyWithin(0, 2, 4);
      expect(arr.indexOf(7)).assertEqual(0);
      expect(arr.indexOf(8)).assertEqual(1);
      expect(arr.indexOf(7, 1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_1900
     * @tc.name int8ArrayCopyWithinPart04Test019
     * @tc.desc Verify copyWithin(0, 3, 6) on [1,2,3,4,5,6] copies [4,5,6] to head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      arr.copyWithin(0, 3, 6);
      let r1: number = arr.$_get(0);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 5;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 6;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_2000
     * @tc.name int8ArrayCopyWithinPart04Test020
     * @tc.desc Verify copyWithin(0,3,6) on [1,2,3,4,5,6] then slice(0,3) returns [4,5,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      arr.copyWithin(0, 3, 6);
      let sub: Int8Array = arr.slice(0, 3);
      expect(sub.$_get(0)).assertEqual(4);
      expect(sub.$_get(1)).assertEqual(5);
      expect(sub.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_2100
     * @tc.name int8ArrayCopyWithinPart04Test021
     * @tc.desc Verify copyWithin(0,2,4).reverse() on [1,2,3,4] turns head to [4,3,4,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 2, 4).reverse();
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_2200
     * @tc.name int8ArrayCopyWithinPart04Test022
     * @tc.desc Verify copyWithin(0,2,4).fill(0) on [1,2,3,4] fills all elements to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 2, 4).fill(0);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_2300
     * @tc.name int8ArrayCopyWithinPart04Test023
     * @tc.desc Verify copyWithin(0,2,5).sort() on [3,1,4,1,5] sorts copied head to [1,1,4,5,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 4, 1, 5]);
      arr.copyWithin(0, 2, 5).sort();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_2400
     * @tc.name int8ArrayCopyWithinPart04Test024
     * @tc.desc Verify copyWithin(0,2,4).subarray(0,2).fill(9) then $_get(0)=9 and $_get(2)=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 2, 4).subarray(0, 2).fill(9);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_2500
     * @tc.name int8ArrayCopyWithinPart04Test025
     * @tc.desc Verify copyWithin expects 3, with $_get(0), on new Int8Array([1, 2, 3, 4, 5, 6])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      arr.copyWithin(0, 2, 4).copyWithin(4, 0, 2);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(4)).assertEqual(3);
      expect(arr.$_get(5)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_2600
     * @tc.name int8ArrayCopyWithinPart04Test026
     * @tc.desc Verify copyWithin expects 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 2, 4);
      arr.set(new Int8Array([7, 8]), 0);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_2700
     * @tc.name int8ArrayCopyWithinPart04Test027
     * @tc.desc Verify copyWithin expects 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 1, 2);
      arr.copyWithin(2, 3, 5);
      arr.copyWithin(4, 0, 1);
      expect(arr.$_get(4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_2800
     * @tc.name int8ArrayCopyWithinPart04Test028
     * @tc.desc Verify copyWithin chained toReversed expects 3, with $_get(0), on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let rev: Int8Array = arr.copyWithin(0, 2, 4).toReversed();
      expect(arr.$_get(0)).assertEqual(3);
      expect(rev.$_get(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_2900
     * @tc.name int8ArrayCopyWithinPart04Test029
     * @tc.desc Verify copyWithin(0,2,4).toSorted() on [3,1,4,1] yields sorted [1,1,4,4] while arr head stays 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 4, 1]);
      let sorted: Int8Array = arr.copyWithin(0, 2, 4).toSorted();
      expect(arr.$_get(0)).assertEqual(4);
      expect(sorted.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_3000
     * @tc.name int8ArrayCopyWithinPart04Test030
     * @tc.desc Verify copyWithin(0,2,4).with(0, 99) on [1,2,3,4] yields modified head 99 while arr head stays 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let modified: Int8Array = arr.copyWithin(0, 2, 4).with(0, 99);
      expect(arr.$_get(0)).assertEqual(3);
      expect(modified.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_3100
     * @tc.name int8ArrayCopyWithinPart04Test031
     * @tc.desc Verify copyWithin target=2 start=0 end=4 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(2, 0, 4);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(2);
      expect(arr.$_get(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_3200
     * @tc.name int8ArrayCopyWithinPart04Test032
     * @tc.desc Verify copyWithin target=1 start=1 end=3 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(1, 1, 3);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_3300
     * @tc.name int8ArrayCopyWithinPart04Test033
     * @tc.desc Verify copyWithin(0, 2, 5) on [1,2,3,4,5] copies [3,4,5] to head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2, 5);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(4);
      expect(arr.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_3400
     * @tc.name int8ArrayCopyWithinPart04Test034
     * @tc.desc Verify copyWithin(0, 0, 4) on [1,2,3,4] is a no-op keeping [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 0, 4);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_3500
     * @tc.name int8ArrayCopyWithinPart04Test035
     * @tc.desc Verify copyWithin target=2 start=1 end=4 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(2, 1, 4);
      expect(arr.$_get(2)).assertEqual(2);
      expect(arr.$_get(3)).assertEqual(3);
      expect(arr.$_get(4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_3600
     * @tc.name int8ArrayCopyWithinPart04Test036
     * @tc.desc Verify copyWithin target=2 start=0 end=6 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      arr.copyWithin(2, 0, 6);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(5)).assertEqual(4);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_3700
     * @tc.name int8ArrayCopyWithinPart04Test037
     * @tc.desc Verify copyWithin target=2 start=0 end=1 copies INT8_MIN to result[2], on new Int8Array([-128, 0, 0, 0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, 0, 0, 0]);
      arr.copyWithin(2, 0, 1);
      let r1: number = arr.$_get(2);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_3800
     * @tc.name int8ArrayCopyWithinPart04Test038
     * @tc.desc Verify copyWithin target=2 start=0 end=1 copies INT8_MAX to result[2], on new Int8Array([INT8_MAX, 0, 0, 0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, 0, 0, 0]);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_3900
     * @tc.name int8ArrayCopyWithinPart04Test039
     * @tc.desc Verify copyWithin target=2 start=0 end=1 copies 0 to result[2], on new Int8Array([0, 9, 9, 9])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 9, 9, 9]);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_4000
     * @tc.name int8ArrayCopyWithinPart04Test040
     * @tc.desc Verify 0xFF 255 -1 copyWithin -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(0, 0xff);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_4100
     * @tc.name int8ArrayCopyWithinPart04Test041
     * @tc.desc Verify 0x80 128 -128 copyWithin -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(0, 0x80);
      arr.copyWithin(2, 0, 1);
      let r1: number = arr.$_get(2);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_4200
     * @tc.name int8ArrayCopyWithinPart04Test042
     * @tc.desc Verify 0x81 129 -127 copyWithin -127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(0, 0x81);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(-INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_4300
     * @tc.name int8ArrayCopyWithinPart04Test043
     * @tc.desc Verify 0x100 256 0 copyWithin 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(0, 0x100);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_4400
     * @tc.name int8ArrayCopyWithinPart04Test044
     * @tc.desc Verify copyWithin target=2 start=0 end=1 copies truncated -129 as INT8_MAX to result[2] on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(0, -129);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_4500
     * @tc.name int8ArrayCopyWithinPart04Test045
     * @tc.desc Verify copyWithin target=2 start=0 end=1 copies Number.NaN as 0 to result[2] on new Int8Array([Number.NaN, 9.0, 9.0, 9.0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [Number.NaN, 9.0, 9.0, 9.0];
      let arr: Int8Array = new Int8Array(src);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_4600
     * @tc.name int8ArrayCopyWithinPart04Test046
     * @tc.desc Verify copyWithin target=2 start=0 end=1 copies truncated 1.9 to 1 at result[2], on new Int8Array(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.9, 0.0, 0.0, 0.0];
      let arr: Int8Array = new Int8Array(src);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_4700
     * @tc.name int8ArrayCopyWithinPart04Test047
     * @tc.desc Verify copyWithin expects -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-1.9, 0.0, 0.0, 0.0];
      let arr: Int8Array = new Int8Array(src);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_4800
     * @tc.name int8ArrayCopyWithinPart04Test048
     * @tc.desc Verify copyWithin target=2 start=0 end=1 copies -0.0 truncated to 0 at result[2], on new Int8Array(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-0.0, 9.0, 9.0, 9.0];
      let arr: Int8Array = new Int8Array(src);
      expect(arr.$_get(0)).assertEqual(0);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_4900
     * @tc.name int8ArrayCopyWithinPart04Test049
     * @tc.desc Verify copyWithin(4, 0, 2) on new Int8Array([-128, INT8_MAX, 0, -1, 0, 0]) copies first two elements to tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, INT8_MAX, 0, -1, 0, 0]);
      arr.copyWithin(4, 0, 2);
      expect(arr.$_get(4)).assertEqual(-128);
      expect(arr.$_get(5)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_5000
     * @tc.name int8ArrayCopyWithinPart04Test050
     * @tc.desc Verify copyWithin target=2 start=0 end=1 copies truncated 200 to -56 at result[2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(0, 200);
      arr.copyWithin(2, 0, 1);
      let r1: number = arr.$_get(2);
      let e1: int = -56;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_5100
     * @tc.name int8ArrayCopyWithinPart04Test051
     * @tc.desc Verify copyWithin target=10 start=0 end=2 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(10, 0, 2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_5200
     * @tc.name int8ArrayCopyWithinPart04Test052
     * @tc.desc Verify copyWithin target=0 start=10 end=12 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 10, 12);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_5300
     * @tc.name int8ArrayCopyWithinPart04Test053
     * @tc.desc Verify copyWithin target=0 start=2 end=100 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 2, 100);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_5400
     * @tc.name int8ArrayCopyWithinPart04Test054
     * @tc.desc Verify copyWithin target=-1 start=0 end=2 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(-1, 0, 2);
      expect(arr.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_5500
     * @tc.name int8ArrayCopyWithinPart04Test055
     * @tc.desc Verify copyWithin target=0 start=-2 end=5 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, -2, 5);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_5600
     * @tc.name int8ArrayCopyWithinPart04Test056
     * @tc.desc Verify copyWithin target=0 start=0 end=-1 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 0, -1);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_5700
     * @tc.name int8ArrayCopyWithinPart04Test057
     * @tc.desc Verify copyWithin target=-3 start=-5 end=-1 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(-3, -5, -1);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_5800
     * @tc.name int8ArrayCopyWithinPart04Test058
     * @tc.desc Verify copyWithin(0, 2, 4) on view Int8Array(buf, 0, 4) writes 9,10 to head, byte 4 stays 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int8Array = new Int8Array(buf, 0, 4);
      arr.$_set(0, 7);
      arr.$_set(1, 8);
      arr.$_set(2, 9);
      arr.$_set(3, 10);
      arr.copyWithin(0, 2, 4);
      let direct: Int8Array = new Int8Array(buf);
      expect(direct.$_get(0)).assertEqual(9);
      expect(direct.$_get(1)).assertEqual(10);
      expect(direct.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_5900
     * @tc.name int8ArrayCopyWithinPart04Test059
     * @tc.desc Verify copyWithin(0, 3, 6) on child view updates parent $_get(0) to 4, $_get(2) to 6 on new Int8Array(buf)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let parent: Int8Array = new Int8Array(buf);
      parent.$_set(0, 1);
      parent.$_set(1, 2);
      parent.$_set(2, 3);
      parent.$_set(3, 4);
      parent.$_set(4, 5);
      parent.$_set(5, 6);
      let child: Int8Array = new Int8Array(buf, 0, 6);
      child.copyWithin(0, 3, 6);
      expect(parent.$_get(0)).assertEqual(4);
      expect(parent.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_6000
     * @tc.name int8ArrayCopyWithinPart04Test060
     * @tc.desc Verify subarray(2,6).copyWithin(0,2,4) on [1,2,3,4,5,6] propagates to parent arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      let sub: Int8Array = arr.subarray(2, 6);
      sub.copyWithin(0, 2, 4);
      expect(arr.$_get(2)).assertEqual(5);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_6100
     * @tc.name int8ArrayCopyWithinPart04Test061
     * @tc.desc Verify copyWithin(0,2,4) on parent then subarray(0,4) view reflects updated elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      let sub: Int8Array = arr.subarray(0, 4);
      arr.copyWithin(0, 2, 4);
      expect(sub.$_get(0)).assertEqual(3);
      expect(sub.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_6200
     * @tc.name int8ArrayCopyWithinPart04Test062
     * @tc.desc Verify view2.copyWithin(0, 1, 2) leaves sibling views $_get(0) 50 on view4, 10 on view0, sharing buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let view0: Int8Array = new Int8Array(buf, 0, 2);
      let view2: Int8Array = new Int8Array(buf, 2, 2);
      let view4: Int8Array = new Int8Array(buf, 4, 2);
      view0.$_set(0, 10);
      view0.$_set(1, 20);
      view2.$_set(0, 30);
      view2.$_set(1, 40);
      view4.$_set(0, 50);
      view4.$_set(1, 60);
      view2.copyWithin(0, 1, 2);
      expect(view4.$_get(0)).assertEqual(50);
      expect(view0.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_6300
     * @tc.name int8ArrayCopyWithinPart04Test063
     * @tc.desc Verify copyWithin(0, 2, 4) on offset view Int8Array(buf, 2, 4) writes 3,4 to head, buf elsewhere stays 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 4);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      arr.$_set(3, 4);
      arr.copyWithin(0, 2, 4);
      let full: Int8Array = new Int8Array(buf);
      expect(full.$_get(2)).assertEqual(3);
      expect(full.$_get(5)).assertEqual(4);
      expect(full.$_get(0)).assertEqual(0);
      expect(full.$_get(6)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_6400
     * @tc.name int8ArrayCopyWithinPart04Test064
     * @tc.desc Verify copyWithin(0, 0, 4) on subarray(1, 5) does not modify original array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      let sub: Int8Array = arr.subarray(1, 5);
      sub.copyWithin(0, 0, 4);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(5)).assertEqual(6);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_6500
     * @tc.name int8ArrayCopyWithinPart04Test065
     * @tc.desc Verify slice snapshot unchanged after copyWithin(0,2,4) on [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let snapshot: Int8Array = arr.slice();
      arr.copyWithin(0, 2, 4);
      expect(snapshot.$_get(0)).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_6600
     * @tc.name int8ArrayCopyWithinPart04Test066
     * @tc.desc Verify copyWithin updates sibling view on shared buffer, expects 4, on new Int8Array(buf)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let a: Int8Array = new Int8Array(buf);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      a.$_set(3, 4);
      a.$_set(4, 5);
      a.$_set(5, 6);
      a.copyWithin(0, 3, 6);
      let b: Int8Array = new Int8Array(buf, 3, 3);
      expect(b.$_get(0)).assertEqual(4);
      expect(b.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_6700
     * @tc.name int8ArrayCopyWithinPart04Test067
     * @tc.desc Verify copyWithin(0, 1, 3) on subarray(2, 5) writes 4 to arr[2], bounds stay 1 and 6 on new Int8Array([1, 2, 3, 4, 5, 6])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      let sub: Int8Array = arr.subarray(2, 5);
      sub.copyWithin(0, 1, 3);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(5)).assertEqual(6);
      expect(arr.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_6800
     * @tc.name int8ArrayCopyWithinPart04Test068
     * @tc.desc Verify copyWithin target=0 start=0 end=1 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      arr.copyWithin(0, 0, 1);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_6900
     * @tc.name int8ArrayCopyWithinPart04Test069
     * @tc.desc Verify copyWithin target=0 start=2 end=4 copies [3,4] to head of [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 2, 4);
      let r1: number = arr.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 4;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_7000
     * @tc.name int8ArrayCopyWithinPart04Test070
     * @tc.desc Verify copyWithin target=0 start=2 copies elements from start to end of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_7100
     * @tc.name int8ArrayCopyWithinPart04Test071
     * @tc.desc Verify copyWithin expects 0, with $_get(2), on new Int8Array([Number.POSITIVE_INFINITY, 0.0, 0.0, 0.0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [Number.POSITIVE_INFINITY, 0.0, 0.0, 0.0];
      let arr: Int8Array = new Int8Array(src);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART04_TEST_7200
     * @tc.name int8ArrayCopyWithinPart04Test072
     * @tc.desc Verify copyWithin expects 0, with $_get(2), on new Int8Array([-Number.POSITIVE_INFINITY, 0.0, 0.0, 0.0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart04Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-Number.POSITIVE_INFINITY, 0.0, 0.0, 0.0];
      let arr: Int8Array = new Int8Array(src);
      arr.copyWithin(2, 0, 1);
      expect(arr.$_get(2)).assertEqual(0);
    });
  });
}
