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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium-static/src/main/indexStatic';

import Utils from './../Util.test';

export default function Int16ArrayIncludesTest(): void {
  describe('Int16ArrayIncludesTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INCLUDES_0100
     * @tc.name testIncludesGeneral001
     * @tc.desc Verify includes returns correct results for normal search values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludesGeneral001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        let resultValue1: boolean = arr.includes(1);
        let expectedValue1: boolean = true;

        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        let resultValue1: boolean = arr.includes(20, 0);
        let expectedValue1: boolean = true;

        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let src: int[] = [10, 20, 30];
        let arr: Int16Array = Int16Array.from(src);
        let result: boolean = arr.includes(20);
        expect(result).assertTrue();

      }
      {
        let arr: Int16Array = new Int16Array([7, 8, 9]);
        let firstElementValue: number = arr.$_get(0);
        let secondElementValue: number = arr.$_get(1);
        let thirdElementValue: number = arr.$_get(2);
        arr.includes(99);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: number = firstElementValue;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: number = secondElementValue;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: number = thirdElementValue;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = new Int16Array([-1, 0, 1]);
        let resultValue1: boolean = arr.includes(0);
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = new Int16Array([-1, 0, 1]);
        let resultValue1: boolean = arr.includes(-1);
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        arr.fill(0, 2, 4);
        let resultValue1: boolean = arr.includes(1);
        expect(resultValue1).assertTrue();

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let view1: Int16Array = new Int16Array(buf, 0, 3);
        let view2: Int16Array = new Int16Array(buf, 2, 2);
        view1.fill(33);
        let resultValue1: boolean = view2.includes(33);
        expect(resultValue1).assertTrue();

      }
      {
        let parent: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        let child: Int16Array = parent.subarray(1, 4);
        child.fill(99);
        let resultValue1: boolean = parent.includes(99);
        expect(resultValue1).assertTrue();
        let resultValue2: boolean = child.includes(99);
        expect(resultValue2).assertTrue();

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(10);
        let view1: Int16Array = new Int16Array(buf, 0, 3);
        let view2: Int16Array = new Int16Array(buf, 6, 2);
        view1.fill(11);
        view2.fill(22);
        let resultValue1: boolean = view1.includes(11);
        expect(resultValue1).assertTrue();
        let resultValue2: boolean = view1.includes(22);
        expect(resultValue2).assertFalse();
        let resultValue3: boolean = view2.includes(22);
        expect(resultValue3).assertTrue();
        let resultValue4: boolean = view2.includes(11);
        expect(resultValue4).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INCLUDES_0200
     * @tc.name testIncludesBoundary001
     * @tc.desc Verify includes with Int16 boundary special and empty values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludesBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array([32767, 0, 1]);
        let resultValue1: boolean = arr.includes(32767);
        let expectedValue1: boolean = true;

        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([100, 200, 300]);
        let resultValue1: boolean = arr.includes(32767);
        let expectedValue1: boolean = false;

        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([-32768, 0, 1]);
        let resultValue1: boolean = arr.includes(-32768);
        let expectedValue1: boolean = true;

        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([-32768, -32768]);
        let resultValue1: boolean = arr.includes(0);
        let expectedValue1: boolean = false;

        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([32767, -32768, 0]);
        let resultValue1: boolean = arr.includes(32767);
        let expectedValue1: boolean = true;

        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([32767, -32768, 0]);
        let resultValue1: boolean = arr.includes(-32768);
        let expectedValue1: boolean = true;

        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([32767, -32768, 0]);
        let resultValue1: boolean = arr.includes(0);
        let expectedValue1: boolean = true;

        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([32767, 1, 2]);
        let resultValue1: boolean = arr.includes(32767, 0);
        let expectedValue1: boolean = true;

        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([-32768, 1, 2]);
        let resultValue1: boolean = arr.includes(-32768, 0);
        let expectedValue1: boolean = true;

        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([0, -32769, 32767]);
        let resultValue1: boolean = arr.includes(32767, 1);
        let expectedValue1: boolean = true;

        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INCLUDES_0300
     * @tc.name testIncludesBoundary002
     * @tc.desc Verify includes with Int16 boundary special and empty values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludesBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array([]);
        let result: boolean = arr.includes(1);
        expect(result).assertFalse();

      }
      {
        let arr: Int16Array = new Int16Array([0, 0, 0]);
        arr.$_set(1, Number.NaN);
        let result: boolean = arr.includes(Number.NaN);
        expect(result).assertFalse();

      }
      {
        let arr: Int16Array = new Int16Array([32767, 0, 1]);
        let result: boolean = arr.includes(32767);
        expect(result).assertTrue();

      }
      {
        let arr: Int16Array = new Int16Array([-32768, 0, 1]);
        let result: boolean = arr.includes(-32768);
        expect(result).assertTrue();

      }
      {
        let arr: Int16Array = new Int16Array([-32768, 0, 1]);
        let result: boolean = arr.includes(32767);
        expect(result).assertFalse();

      }
      {
        let arr: Int16Array = new Int16Array([32767, 0, 1]);
        let result: boolean = arr.includes(-32769);
        expect(result).assertFalse();

      }
      {
        let arr: Int16Array = new Int16Array([-32768, 0, 32767]);
        let resultValue1: boolean = arr.includes(-32768);
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = new Int16Array([-32768, 0, 32767]);
        let resultValue1: boolean = arr.includes(32767);
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let resultValue1: boolean = arr.includes(32767);
        expect(resultValue1).assertFalse();

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let resultValue1: boolean = arr.includes(-32768);
        expect(resultValue1).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INCLUDES_0400
     * @tc.name testIncludesBoundary003
     * @tc.desc Verify includes with Int16 boundary special and empty values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludesBoundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array([-32769, 0, 32767]);
        let resultValue1: boolean = arr.includes(32767, -1);
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = new Int16Array([32767, 0, -1]);
        let resultValue1: boolean = arr.includes(32767);
        expect(resultValue1).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INCLUDES_0500
     * @tc.name testIncludesFromIndex001
     * @tc.desc Verify includes fromIndex behavior including negative and clamped values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludesFromIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array([5, 10, 15]);
        let result: boolean = arr.includes(5, 0);
        expect(result).assertTrue();

      }
      {
        let arr: Int16Array = new Int16Array([5, 10, 15]);
        let result: boolean = arr.includes(15, -1);
        expect(result).assertTrue();

      }
      {
        let arr: Int16Array = new Int16Array([1, 2, 9]);
        let result: boolean = arr.includes(9, arr.length - 1);
        expect(result).assertTrue();

      }
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        let resultValue1: boolean = arr.includes(20);
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        let resultValue1: boolean = arr.includes(10, -4);
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        let resultValue1: boolean = arr.includes(99, -4);
        expect(resultValue1).assertFalse();

      }
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        let resultValue1: boolean = arr.includes(2, -6);
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = new Int16Array([42]);
        let resultValue1: boolean = arr.includes(42, -2);
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        let resultValue1: boolean = arr.includes(10, 2);
        expect(resultValue1).assertFalse();

      }
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        let resultValue1: boolean = arr.includes(20, 1);
        expect(resultValue1).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INCLUDES_0600
     * @tc.name testIncludesFromIndex002
     * @tc.desc Verify includes fromIndex behavior including negative and clamped values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludesFromIndex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array([32768, 0, 0]);
        let resultValue1: boolean = arr.includes(32768, 0);
        expect(resultValue1).assertFalse();

      }
      {
        let arr: Int16Array = new Int16Array([32768, 0, 0]);
        let resultValue1: boolean = arr.includes(-32768, 0);
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = new Int16Array([32768, 0, 0]);
        let resultValue1: boolean = arr.includes(-32768, 1);
        expect(resultValue1).assertFalse();

      }
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        let copy: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        arr.includes(3, 2);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: number = copy.$_get(0);
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: number = copy.$_get(1);
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: number = copy.$_get(2);
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = arr.$_get(3);
        let expectedValue4: number = copy.$_get(3);
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = arr.$_get(4);
        let expectedValue5: number = copy.$_get(4);
        expect(resultValue5).assertEqual(expectedValue5);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INCLUDES_0700
     * @tc.name testIncludesView001
     * @tc.desc Verify includes on ArrayBuffer views subarrays and shared buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludesView001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 100);
        let result: boolean = arr.includes(100);
        expect(result).assertTrue();

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let arr: Int16Array = new Int16Array(buf);
        let lenBefore: int = arr.length;
        arr.includes(0);
        let resultValue1: int = arr.length;
        let expectedValue1: number = lenBefore;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        let boBefore: int = arr.byteOffset;
        arr.includes(2);
        let resultValue1: int = arr.byteOffset;
        let expectedValue1: number = boBefore;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let arr: Int16Array = new Int16Array(buf, 0, 2);
        let boBefore: int = arr.byteOffset;
        arr.includes(1);
        let resultValue1: int = arr.byteOffset;
        let expectedValue1: number = boBefore;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let arr: Int16Array = new Int16Array(buf, 2, 2);
        let boBefore: int = arr.byteOffset;
        arr.includes(0);
        let resultValue1: int = arr.byteOffset;
        let expectedValue1: number = boBefore;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(10);
        let arr: Int16Array = new Int16Array(buf, 4, 2);
        let boBefore: int = arr.byteOffset;
        arr.includes(0);
        let resultValue1: int = arr.byteOffset;
        let expectedValue1: number = boBefore;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let arr: Int16Array = new Int16Array(buf, 2, 0);
        let boBefore: int = arr.byteOffset;
        arr.includes(1);
        let resultValue1: int = arr.byteOffset;
        let expectedValue1: number = boBefore;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let view1: Int16Array = new Int16Array(buf);
        let view2: Int16Array = new Int16Array(buf);
        view1.$_set(0, 123);
        let resultValue1: boolean = view2.includes(123);
        expect(resultValue1).assertTrue();

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let view1: Int16Array = new Int16Array(buf);
        let view2: Int16Array = new Int16Array(buf);
        view1.$_set(0, 77);
        let resultValue1: boolean = view1.includes(77);
        let expectedValue1: boolean = view2.includes(77);
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let view1: Int16Array = new Int16Array(buf);
        let view2: Int16Array = new Int16Array(buf);
        view1.$_set(0, 10);
        view1.$_set(1, 20);
        view1.$_set(2, 30);
        view1.reverse();
        let resultValue1: boolean = view2.includes(10);
        expect(resultValue1).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INCLUDES_0800
     * @tc.name testIncludesView002
     * @tc.desc Verify includes on ArrayBuffer views subarrays and shared buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludesView002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let view1: Int16Array = new Int16Array(buf);
        let view2: Int16Array = new Int16Array(buf);
        view1.$_set(0, 30);
        view1.$_set(1, 10);
        view1.$_set(2, 20);
        view1.sort();
        let resultValue1: boolean = view2.includes(10);
        expect(resultValue1).assertTrue();

      }
      {
        let parent: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        let child: Int16Array = parent.subarray(1, 4);
        parent.fill(0);
        let resultValue1: boolean = child.includes(0);
        expect(resultValue1).assertTrue();

      }
      {
        let parent: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6]);
        let sub1: Int16Array = parent.subarray(0, 3);
        let sub2: Int16Array = parent.subarray(2, 5);
        sub1.$_set(2, 77);
        let resultValue1: boolean = sub2.includes(77);
        expect(resultValue1).assertTrue();

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let view1: Int16Array = new Int16Array(buf, 0, 2);
        let view2: Int16Array = new Int16Array(buf, 4, 2);
        view1.$_set(0, 99);
        let resultValue1: boolean = view2.includes(99);
        expect(resultValue1).assertFalse();

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let view1: Int16Array = new Int16Array(buf, 0, 3);
        let view2: Int16Array = new Int16Array(buf, 2, 2);
        view1.$_set(1, 77);
        let resultValue1: boolean = view2.includes(77);
        expect(resultValue1).assertTrue();

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let view1: Int16Array = new Int16Array(buf);
        let view2: Int16Array = new Int16Array(buf);
        view1.$_set(0, 32768);
        let resultValue1: boolean = view2.includes(-32768);
        expect(resultValue1).assertTrue();

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let view1: Int16Array = new Int16Array(buf);
        let view2: Int16Array = new Int16Array(buf);
        view1.$_set(0, 32768);
        let resultValue1: boolean = view2.includes(32768);
        expect(resultValue1).assertFalse();

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let view1: Int16Array = new Int16Array(buf);
        let view2: Int16Array = new Int16Array(buf);
        view1.$_set(0, 3.7);
        let resultValue1: boolean = view2.includes(3);
        expect(resultValue1).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INCLUDES_0900
     * @tc.name testIncludesMutate001
     * @tc.desc Verify includes does not mutate array elements or view properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludesMutate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let arr: Int16Array = new Int16Array(buf, 2, 2);
        let boBefore: int = arr.byteOffset;
        arr.includes(0);
        arr.includes(1);
        let resultValue1: int = arr.byteOffset;
        let expectedValue1: number = boBefore;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([32767, 0, -1]);
        let vBefore: number = arr.$_get(0);
        arr.includes(0);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: number = vBefore;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([-32768, 0, 1]);
        let vBefore: number = arr.$_get(0);
        arr.includes(1);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: number = vBefore;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let view1: Int16Array = new Int16Array(buf, 0, 3);
        let view2: Int16Array = new Int16Array(buf, 0, 3);
        view1.$_set(0, 100);
        let vBefore: number = view2.$_get(0);
        view1.includes(100);
        let resultValue1: number = view2.$_get(0);
        let expectedValue1: number = vBefore;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 123);
        arr.includes(123);
        let verify: Int16Array = new Int16Array(buf);
        let resultValue1: number = verify.$_get(0);
        let expectedValue1: int = 123;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let baseView: Int16Array = new Int16Array(buf, 0, 4);
        let offsetView: Int16Array = new Int16Array(buf, 2, 2);
        baseView.$_set(1, 555);
        offsetView.includes(0);
        let resultValue1: number = baseView.$_get(1);
        let expectedValue1: int = 555;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        arr.includes(20);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = 30;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = new Int16Array([-5, 0, 5]);
        arr.includes(999);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = -5;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = 5;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        let resultValue1: boolean = arr.includes(10);
        expect(resultValue1).assertTrue();
        try {
          arr.$_set(5, 999);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        let resultValue2: boolean = arr.includes(999);
        expect(resultValue2).assertFalse();

      }
      {
        let arr: Int16Array = new Int16Array(3);
        arr.$_set(0, 32768);
        let resultValue1: boolean = arr.includes(-32768);
        expect(resultValue1).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INCLUDES_1000
     * @tc.name testIncludesMutate002
     * @tc.desc Verify includes does not mutate array elements or view properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludesMutate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array(3);
        arr.$_set(0, -32769);
        let resultValue1: boolean = arr.includes(32767);
        expect(resultValue1).assertTrue();

      }
    });

  });
}
