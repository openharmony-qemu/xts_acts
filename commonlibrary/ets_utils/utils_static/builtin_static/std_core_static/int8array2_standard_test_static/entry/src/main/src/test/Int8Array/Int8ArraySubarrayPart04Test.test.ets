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

export default function int8ArraySubarrayPart04Test(): void {
  describe('Int8ArraySubarrayPart04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_0200
     * @tc.name int8ArraySubarrayPart04Test002
     * @tc.desc Verify fill on parent visible in subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      let view: Int8Array = arr.subarray(2, 5);
      arr.fill(7, 1, 4);
      let r1: number = view.$_get(0);
      let e1: int = 7;
      expect(r1).assertEqual(e1);
      let r2: number = view.$_get(1);
      let e2: int = 7;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_0300
     * @tc.name int8ArraySubarrayPart04Test003
     * @tc.desc Verify subarray full range view sees parent reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([11, 22, 33, 44, 55]);
      let view: Int8Array = arr.subarray(0, 5);
      arr.reverse();
      let r1: number = view.$_get(0);
      let e1: int = 55;
      expect(r1).assertEqual(e1);
      let r2: number = view.$_get(4);
      let e2: int = 11;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_0400
     * @tc.name int8ArraySubarrayPart04Test004
     * @tc.desc Verify copyWithin on parent visible in subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(2, 5);
      arr.copyWithin(0, 3, 5);
      let r1: number = view.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_0500
     * @tc.name int8ArraySubarrayPart04Test005
     * @tc.desc Verify set(src, 2) on parent visible in subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let view: Int8Array = arr.subarray(1, 4);
      let src: Int8Array = new Int8Array([5, 6]);
      arr.set(src, 2);
      let r1: number = view.$_get(1);
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = view.$_get(2);
      let e2: int = 6;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_0700
     * @tc.name int8ArraySubarrayPart04Test007
     * @tc.desc Verify fill on subarray view fills parent range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      let view: Int8Array = arr.subarray(2, 5);
      view.fill(9);
      let r1: number = arr.$_get(2);
      let e1: int = 9;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(4);
      let e2: int = 9;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(5);
      let e3: int = 6;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_0800
     * @tc.name int8ArraySubarrayPart04Test008
     * @tc.desc Verify reverse on subarray view reverses parent mid range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(1, 4);
      view.reverse();
      let r1: number = arr.$_get(1);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(3);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_0900
     * @tc.name int8ArraySubarrayPart04Test009
     * @tc.desc Verify subarray view copyWithin copies within parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      let view: Int8Array = arr.subarray(1, 5);
      view.copyWithin(0, 2, 4);
      let r1: number = arr.$_get(1);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(2);
      let e2: int = 5;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_1000
     * @tc.name int8ArraySubarrayPart04Test010
     * @tc.desc Verify subarray view set offset one writes parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let view: Int8Array = arr.subarray(1, 4);
      let src: Int8Array = new Int8Array([77, 88]);
      view.set(src, 1);
      let r1: number = arr.$_get(2);
      let e1: int = 77;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(3);
      let e2: int = 88;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_1400
     * @tc.name int8ArraySubarrayPart04Test014
     * @tc.desc Verify subarray() creates view sharing the same underlying ArrayBuffer with writes from both sides
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(1, 4);
      view.$_set(1, 50);
      arr.$_set(2, 60);
      let r1: number = arr.$_get(2);
      let e1: int = 60;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_1500
     * @tc.name int8ArraySubarrayPart04Test015
     * @tc.desc Verify subarray view after fill() mutates original array via shared buffer at edges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0, 0, 0, 0]);
      let viewLeft: Int8Array = arr.subarray(0, 2);
      let viewRight: Int8Array = arr.subarray(4, 6);
      viewLeft.fill(3);
      viewRight.fill(7);
      let r1: number = arr.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(4);
      let e2: int = 7;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_1600
     * @tc.name int8ArraySubarrayPart04Test016
     * @tc.desc Verify sort on subarray view sorts parent range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 1, 4, 2]);
      let view: Int8Array = arr.subarray(0, 5);
      view.sort((a: number, b: number) => {
        return (a - b).toInt();
      });
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(4);
      let e2: int = 5;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_1700
     * @tc.name int8ArraySubarrayPart04Test017
     * @tc.desc Verify subarray().subarray() inner write hits source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let inner: Int8Array = arr.subarray(1, 4).subarray(0, 2);
      inner.$_set(0, 44);
      let r1: number = arr.$_get(1);
      let e1: int = 44;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_1800
     * @tc.name int8ArraySubarrayPart04Test018
     * @tc.desc Verify triple subarray chain write hits index 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6, 7, 8]);
      let deep: Int8Array = arr.subarray(2, 7).subarray(1, 4).subarray(0, 2);
      deep.$_set(1, 77);
      let r1: number = arr.$_get(4);
      let e1: int = 77;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_2100
     * @tc.name int8ArraySubarrayPart04Test021
     * @tc.desc Verify subarray(0,3).subarray(1,2) view value 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let v: Int8Array = arr.subarray(0, 3).subarray(1, 2);
      let r1: int = v.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = v.$_get(0);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_2200
     * @tc.name int8ArraySubarrayPart04Test022
     * @tc.desc Verify sort on parent visible through subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([9, 7, 5, 3, 1]);
      let view: Int8Array = arr.subarray(0, 5);
      arr.sort((a: number, b: number) => {
        return (a - b).toInt();
      });
      let r1: number = view.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = view.$_get(4);
      let e2: int = 9;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_2300
     * @tc.name int8ArraySubarrayPart04Test023
     * @tc.desc Verify subarray parent set out of range throws leaves view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(1, 4);
      try {
        arr.$_set(10, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = view.$_get(0);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_2400
     * @tc.name int8ArraySubarrayPart04Test024
     * @tc.desc Verify subarray view sees parent partial fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6, 7]);
      let view: Int8Array = arr.subarray(3, 7);
      arr.fill(0, 2, 5);
      let r1: number = view.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = view.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = view.$_get(2);
      let e3: int = 6;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_2500
     * @tc.name int8ArraySubarrayPart04Test025
     * @tc.desc Verify reverse on parent visible through subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let view: Int8Array = arr.subarray(0, 5);
      arr.reverse();
      let r1: number = view.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
      let r2: number = view.$_get(4);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_2600
     * @tc.name int8ArraySubarrayPart04Test026
     * @tc.desc Verify reverse on subarray view flips 4 middle elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      let view: Int8Array = arr.subarray(1, 5);
      view.reverse();
      let r1: number = arr.$_get(1);
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(4);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(5);
      let e3: int = 6;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_2700
     * @tc.name int8ArraySubarrayPart04Test027
     * @tc.desc Verify subarray view sort keeps outside element intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([9, 5, 3, 1, 7, 2]);
      let view: Int8Array = arr.subarray(0, 5);
      view.sort((a: number, b: number) => {
        return (a - b).toInt();
      });
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(4);
      let e2: int = 9;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(5);
      let e3: int = 2;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_2800
     * @tc.name int8ArraySubarrayPart04Test028
     * @tc.desc Verify fill on view writes whole subarray range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      let view: Int8Array = arr.subarray(2, 5);
      view.fill(8);
      let r1: number = arr.$_get(2);
      let e1: int = 8;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(4);
      let e2: int = 8;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(5);
      let e3: int = 6;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_2900
     * @tc.name int8ArraySubarrayPart04Test029
     * @tc.desc Verify subarray view copyWithin shifts parent elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6, 7]);
      let view: Int8Array = arr.subarray(1, 6);
      view.copyWithin(0, 3, 5);
      let r1: number = arr.$_get(1);
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(2);
      let e2: int = 6;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_3000
     * @tc.name int8ArraySubarrayPart04Test030
     * @tc.desc Verify subarray view set at start writes parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let view: Int8Array = arr.subarray(1, 4);
      let src: Int8Array = new Int8Array([11, 22]);
      view.set(src, 0);
      let r1: number = arr.$_get(1);
      let e1: int = 11;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(2);
      let e2: int = 22;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_3100
     * @tc.name int8ArraySubarrayPart04Test031
     * @tc.desc Verify subarray view set 128 truncates both
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      let view: Int8Array = arr.subarray(0, 3);
      view.$_set(0, 128);
      let r1: number = view.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(0);
      let e2: number = INT8_MIN;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_4300
     * @tc.name int8ArraySubarrayPart04Test043
     * @tc.desc Verify subarray(subarray(x, 1, 5), 0, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let v: Int8Array = arr.subarray(1, 5).subarray(0, 2);
      let r1: int = v.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = v.$_get(0);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = v.$_get(1);
      let e3: int = 30;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_4400
     * @tc.name int8ArraySubarrayPart04Test044
     * @tc.desc Verify chained subarray calls produce view with correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6, 7, 8]);
      let v: Int8Array = arr.subarray(2, 8).subarray(1, 5).subarray(0, 2);
      let r1: int = v.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = v.$_get(0);
      let e2: int = 4;
      expect(r2).assertEqual(e2);
      let r3: number = v.$_get(1);
      let e3: int = 5;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_4500
     * @tc.name int8ArraySubarrayPart04Test045
     * @tc.desc Verify subarray(1, 6).subarray(0, 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6, 7]);
      let v: Int8Array = arr.subarray(1, 6).subarray(0, 0);
      let r1: int = v.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_4600
     * @tc.name int8ArraySubarrayPart04Test046
     * @tc.desc Verify subarray(0, 4).subarray(2, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let v: Int8Array = arr.subarray(0, 4).subarray(2, 2);
      let r1: int = v.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_4700
     * @tc.name int8ArraySubarrayPart04Test047
     * @tc.desc Verify $_set then $_get on same subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(1, 4);
      view.$_set(1, 42);
      let r1: number = view.$_get(1);
      let e1: int = 42;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_4800
     * @tc.name int8ArraySubarrayPart04Test048
     * @tc.desc Verify subarray view set read back through parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(1, 4);
      view.$_set(0, 55);
      let r1: number = arr.$_get(1);
      let e1: int = 55;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_4900
     * @tc.name int8ArraySubarrayPart04Test049
     * @tc.desc Verify subarray view set repeated calls overwrite final
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let view: Int8Array = arr.subarray(0, 3);
      view.$_set(1, 10);
      view.$_set(1, 20);
      view.$_set(1, 30);
      let r1: number = view.$_get(1);
      let e1: int = 30;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 30;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_5000
     * @tc.name int8ArraySubarrayPart04Test050
     * @tc.desc Verify subarray view set out of range throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(1, 4);
      try {
        view.$_set(5, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = view.$_get(0);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_5100
     * @tc.name int8ArraySubarrayPart04Test051
     * @tc.desc Verify subarray $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(1, 3);
      let v = view.at(5);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_5200
     * @tc.name int8ArraySubarrayPart04Test052
     * @tc.desc Verify subarray view forEach mutates parent array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(0, 5);
      let collected: number[] = [];
      view.forEach((v: number, i: int, a: Int8Array): void => {
        collected.push(v);
        arr.$_set(i, v * 10);
      });
      let r1: number = collected[0];
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(0);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_5300
     * @tc.name int8ArraySubarrayPart04Test053
     * @tc.desc Verify subarray view forEach visits all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(0, 5);
      let count: int = 0;
      view.forEach((v: number, i: int, a: Int8Array): void => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
        count = count + 1;
        if (i < 4) {
          view.$_set(i + 1, 0);
        }
      });
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_5400
     * @tc.name int8ArraySubarrayPart04Test054
     * @tc.desc Verify subarray view map callback writes into source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let view: Int8Array = arr.subarray(0, 3);
      let result: Int8Array = view.map((v: number, i: int, a: Int8Array) => {
        arr.$_set(i, 100);
        return v * 2;
      });
      let r1: number = result.$_get(0);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(2);
      let e2: int = 6;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_5500
     * @tc.name int8ArraySubarrayPart04Test055
     * @tc.desc Verify subarray view forEach keeps view length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(0, 5);
      let lenBefore: int = view.length;
      view.forEach((v: number, i: int, a: Int8Array): void => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
        arr.$_set(i, 0);
      });
      let r1: int = view.length;
      let e1: number = lenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_5600
     * @tc.name int8ArraySubarrayPart04Test056
     * @tc.desc Verify subarray + at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let view: Int8Array = arr.subarray(1, 4);
      let r1 = view.at(0);
      let e1: int = 20;
      expect(r1).assertEqual(e1);
      let r2 = view.at(-1);
      let e2: int = 40;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_5700
     * @tc.name int8ArraySubarrayPart04Test057
     * @tc.desc Verify subarray + with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(0, 3);
      let newArr: Int8Array = view.with(1, 50);
      let r1: number = newArr.$_get(1);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
      let r2: number = view.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_5800
     * @tc.name int8ArraySubarrayPart04Test058
     * @tc.desc Verify subarray + toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(0, 4);
      let rev: Int8Array = view.toReversed();
      let r1: number = rev.$_get(0);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = view.$_get(0);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_5900
     * @tc.name int8ArraySubarrayPart04Test059
     * @tc.desc Verify subarray + toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 1, 4, 2]);
      let view: Int8Array = arr.subarray(0, 5);
      let sorted: Int8Array = view.toSorted();
      let r1: number = sorted.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = view.$_get(0);
      let e2: int = 5;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_6000
     * @tc.name int8ArraySubarrayPart04Test060
     * @tc.desc Verify subarray + indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 20, 10]);
      let view: Int8Array = arr.subarray(1, 4);
      let r1: int = view.indexOf(20);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: int = view.indexOf(99);
      let e2: int = -1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_6100
     * @tc.name int8ArraySubarrayPart04Test061
     * @tc.desc Verify subarray + includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let view: Int8Array = arr.subarray(1, 4);
      let r1: boolean = view.includes(30);
      expect(r1).assertTrue();
      let r2: boolean = view.includes(50);
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_6200
     * @tc.name int8ArraySubarrayPart04Test062
     * @tc.desc Verify subarray + find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 10, 15, 20, 25]);
      let view: Int8Array = arr.subarray(0, 5);
      let found = view.find((v: number, i: int, a: Int8Array): boolean => {
        return v > 12;
      });
      expect(found).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_6300
     * @tc.name int8ArraySubarrayPart04Test063
     * @tc.desc Verify subarray + findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 10, 15, 20, 25]);
      let view: Int8Array = arr.subarray(0, 5);
      let idx: int = view.findIndex((v: number, i: int, a: Int8Array): boolean => {
        return v > 12;
      });
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_6400
     * @tc.name int8ArraySubarrayPart04Test064
     * @tc.desc Verify subarray + filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      let view: Int8Array = arr.subarray(0, 6);
      let filtered: Int8Array = view.filter((v: number, i: int, a: Int8Array): boolean => {
        return v % 2 === 0;
      });
      let r1: int = filtered.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = filtered.$_get(0);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_6500
     * @tc.name int8ArraySubarrayPart04Test065
     * @tc.desc Verify subarray + reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(0, 5);
      let sum: number = view.reduce((acc: number, v: number, i: int, a: Int8Array) => {
        return acc + v;
      }, 0);
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_6600
     * @tc.name int8ArraySubarrayPart04Test066
     * @tc.desc Verify subarray + join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(1, 4);
      let r1: string = view.join('-');
      let e1: string = '2-3-4';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_6700
     * @tc.name int8ArraySubarrayPart04Test067
     * @tc.desc Verify subarray + entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let view: Int8Array = arr.subarray(1, 3);
      let iter = view.entries();
      let r1 = iter.next();
      let r3 = iter.next();
      let done1: boolean = r1.done;
      expect(done1).assertFalse();
      let done2: boolean = r3.done;
      expect(done2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_6800
     * @tc.name int8ArraySubarrayPart04Test068
     * @tc.desc Verify subarray + keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let view: Int8Array = arr.subarray(1, 3);
      let iter = view.keys();
      let r1 = iter.next().value;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2 = iter.next().value;
      let e2: int = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_6900
     * @tc.name int8ArraySubarrayPart04Test069
     * @tc.desc Verify subarray + values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let view: Int8Array = arr.subarray(1, 3);
      let iter = view.values();
      let r1 = iter.next().value;
      let e1: int = 20;
      expect(r1).assertEqual(e1);
      let r2 = iter.next().value;
      let e2: int = 30;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_7000
     * @tc.name int8ArraySubarrayPart04Test070
     * @tc.desc Verify subarray leaves original elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let before0: number = arr.$_get(0);
      let before4: number = arr.$_get(4);
      arr.subarray(1, 4);
      let r1: number = arr.$_get(0);
      let e1: number = before0;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(4);
      let e2: number = before4;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_7100
     * @tc.name int8ArraySubarrayPart04Test071
     * @tc.desc Verify subarray view length three keeps source length six
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      let view: Int8Array = arr.subarray(1, 4);
      let r1: int = view.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: int = arr.length;
      let e2: int = 6;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_7200
     * @tc.name int8ArraySubarrayPart04Test072
     * @tc.desc Verify subarray view set keeps view length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(0, 3);
      let lenBefore: int = view.length;
      view.$_set(1, 99);
      let r1: int = view.length;
      let e1: number = lenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_7300
     * @tc.name int8ArraySubarrayPart04Test073
     * @tc.desc Verify subarray view set preserves byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(1, 4);
      let offBefore: int = view.byteOffset;
      view.$_set(0, 50);
      let r1: int = view.byteOffset;
      let e1: number = offBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_7400
     * @tc.name int8ArraySubarrayPart04Test074
     * @tc.desc Verify $_set on empty subarray throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(1, 1);
      try {
        view.$_set(0, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: int = view.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_7500
     * @tc.name int8ArraySubarrayPart04Test075
     * @tc.desc Verify subarray() creates view sharing the same underlying ArrayBuffer with equal length and elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(0, 5);
      let r1: int = view.length;
      let e1: int = arr.length;
      expect(r1).assertEqual(e1);
      let r2: number = view.$_get(0);
      let e2: number = arr.$_get(0);
      expect(r2).assertEqual(e2);
      let r3: number = view.$_get(4);
      let e3: number = arr.$_get(4);
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_7600
     * @tc.name int8ArraySubarrayPart04Test076
     * @tc.desc Verify subarray view after fill() mutates original array via shared buffer across halves
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0, 0, 0, 0]);
      let viewLeft: Int8Array = arr.subarray(0, 3);
      let viewRight: Int8Array = arr.subarray(3, 6);
      viewLeft.fill(1);
      viewRight.fill(2);
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(5);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_7700
     * @tc.name int8ArraySubarrayPart04Test077
     * @tc.desc Verify subarray() creates view sharing the same underlying ArrayBuffer on split ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      let viewLeft: Int8Array = arr.subarray(0, 3);
      let viewRight: Int8Array = arr.subarray(3, 6);
      viewLeft.$_set(2, 9);
      viewRight.$_set(0, 8);
      let r1: number = arr.$_get(2);
      let e1: int = 9;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(3);
      let e2: int = 8;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_7800
     * @tc.name int8ArraySubarrayPart04Test078
     * @tc.desc Verify subarray nested views share original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let child: Int8Array = arr.subarray(1, 4);
      let grand: Int8Array = child.subarray(0, 2);
      let r1: ArrayBuffer = grand.buffer;
      let e1: ArrayBuffer = arr.buffer;
      expect(r1).assertEqual(e1);
      let r2: ArrayBuffer = grand.buffer;
      let e2: ArrayBuffer = child.buffer;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_7900
     * @tc.name int8ArraySubarrayPart04Test079
     * @tc.desc Verify subarray + slice slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let view: Int8Array = arr.subarray(0, 5);
      let copy: Int8Array = view.slice(0, 3);
      copy.$_set(0, 99);
      let r1: number = view.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(0);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_8000
     * @tc.name int8ArraySubarrayPart04Test080
     * @tc.desc Verify subarray set Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0, 0, 0]);
      let view: Int8Array = arr.subarray(1, 4);
      let src: Int8Array = new Int8Array([7, 8, 9]);
      view.set(src, 0);
      let r1: number = arr.$_get(1);
      let e1: int = 7;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(3);
      let e2: int = 9;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_8100
     * @tc.name int8ArraySubarrayPart04Test081
     * @tc.desc Verify subarray view fill middle of parent range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6, 7]);
      let view: Int8Array = arr.subarray(1, 6);
      view.fill(0, 1, 3);
      let r1: number = arr.$_get(1);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(2);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(3);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
      let r4: number = arr.$_get(4);
      let e4: int = 5;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SUBARRAY_PART04_TEST_8200
     * @tc.name int8ArraySubarrayPart04Test082
     * @tc.desc Verify subarray view copyWithin duplicates head of range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySubarrayPart04Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      let view: Int8Array = arr.subarray(0, 5);
      view.copyWithin(2, 0, 2);
      let r1: number = arr.$_get(2);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(3);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });
  });
}
