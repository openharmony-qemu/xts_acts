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
} from '../../../../hypium/index';

import Utils from './../Util.test';

export default function Int16ArraySetTest(): void {
  describe('Int16ArraySetTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SET_0100
     * @tc.name testSetGeneral001
     * @tc.desc Verify set writes expected values readable via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetGeneral001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let target = new Int16Array(4);
        target.$_set(0, 10);
        target.$_set(2, 30);
        let val: short = 99;
        target.set(1, val);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(2);
        let expectedValue2: int = 30;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target = new Int16Array(5);
        let source: Array<number> = [10, 20];
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target = new Int16Array(3);
        target.$_set(0, 5);
        target.$_set(1, 10);
        target.$_set(2, 15);
        let source: Array<number> = [];
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 5;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 10;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 15;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target = new Int16Array(5);
        let source: Array<number> = [1, 2, 3];
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 3;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target = new Int16Array(3);
        let source: Array<number> = [32767, -32768];
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -32768;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target = new Int16Array(2);
        let source: Array<number> = [32768];
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let target = new Int16Array(2);
        let source: Array<number> = [-32769];
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let target = new Int16Array(3);
        let source: Array<number> = [3.7, -3.7];
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -3;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target = new Int16Array(4);
        let source: Array<number> = [10, 20, 30, 40];
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(3);
        let expectedValue2: int = 40;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target = new Int16Array(3);
        let source: Array<number> = [1, 2, 3, 4];
        try {
          target.set(source, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SET_0200
     * @tc.name testSetGeneral002
     * @tc.desc Verify set writes expected values readable via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetGeneral002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let target = new Int16Array(3);
        target.$_set(0, 99);
        target.$_set(1, 99);
        target.$_set(2, 99);
        let source: Array<number> = [0, 0, 0];
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target = new Int16Array(6);
        let source: Array<number> = [32767, -32768, 0, -1, 1, 100];
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -32768;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = -1;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 1;
        expect(resultValue5).assertEqual(expectedValue5);
        let resultValue6: number = target.$_get(5);
        let expectedValue6: int = 100;
        expect(resultValue6).assertEqual(expectedValue6);

      }
      {
        let target = new Int16Array(3);
        let source: Array<number> = [32767, 32767, 32767];
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 32767;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 32767;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target = new Int16Array(3);
        let source: Array<number> = [-32768, -32768, -32768];
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -32768;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = -32768;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target = new Int16Array(4);
        let source: Array<number> = [32768, -32769, 65536, -65537];
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 32767;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = -1;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target = new Int16Array(4);
        let source: Array<number> = [100, 200];
        target.set(source, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 100;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 200;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target = new Int16Array(4);
        target.$_set(0, -1);
        let source: Array<number> = [50, 60];
        target.set(source, 1);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 50;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 60;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target = new Int16Array(5);
        target.$_set(0, 100);
        target.$_set(4, 400);
        let source: Array<number> = [1, 2, 3];
        target.set(source, 1);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 100;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(4);
        let expectedValue2: int = 400;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target = new Int16Array(2);
        let source: Array<number> = [1, 2, 3];
        try {
          target.set(source, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }

      }
      {
        let target = new Int16Array(2);
        let val: short = Int.toShort(32768);
        target.set(0, val);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SET_0300
     * @tc.name testSetGeneral003
     * @tc.desc Verify set writes expected values readable via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetGeneral003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let target = new Int16Array(2);
        let val: short = Int.toShort(-32769);
        target.set(0, val);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let target = new Int16Array(2);
        let val: short = Int.toShort((32767 + 1));
        target.set(0, val);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let target = new Int16Array(2);
        let val: short = Int.toShort((-32768 - 1));
        target.set(0, val);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let target = new Int16Array(4);
        let source: Array<number> = [32768, -32769, 65536, 98304];
        target.set(source, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 32767;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = -32768;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let arr = new Int16Array(3);
        arr.set(0, 100);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 100;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr = new Int16Array(3);
        arr.set(0, 32767.9);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr = new Int16Array(3);
        arr.set(0, -32768.1);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr = Int16Array.of(10, 20, 30);
        arr.set(1, 5);
        arr.sort();
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 5;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr = new Int16Array(4);
        arr.set(0, 32767);
        arr.fill(-1);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = -1;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array(3);
        arr.$_set(0, 99);
        let src: FixedArray<short> = [];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 99;
        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SET_0400
     * @tc.name testSetGeneral004
     * @tc.desc Verify set writes expected values readable via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetGeneral004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array(0);
        let src: FixedArray<short> = [];
        arr.set(src);
        let resultValue1: int = arr.length;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array(3);
        let src: FixedArray<short> = [0];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array(3);
        let src: FixedArray<number> = [-32768];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array(3);
        let src: FixedArray<number> = [Double.NEGATIVE_INFINITY];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array(3);
        let src: FixedArray<number> = [32767.9];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array(2);
        arr.$_set(1, 99);
        let src: FixedArray<short> = [7];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 7;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 99;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = new Int16Array(3);
        let src: FixedArray<short> = [-1, -2, -3];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = -1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = -2;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = -3;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let src: FixedArray<short> = [0, 0, 0];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = new Int16Array(3);
        let src: FixedArray<short> = [1, -1, 0];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = -1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = new Int16Array(3);
        let src: FixedArray<number> = [32767, -32768, 0];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = -32768;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SET_0500
     * @tc.name testSetGeneral005
     * @tc.desc Verify set writes expected values readable via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetGeneral005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array(3);
        let src: FixedArray<number> = [-32768, -32768, -32768];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = -32768;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = -32768;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = new Int16Array(5);
        let src: FixedArray<short> = [1, 2, 3, 4, 5];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(4);
        let expectedValue2: int = 5;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = new Int16Array(5);
        let src: FixedArray<short> = [-100, -1, 0, 1, 100];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = -100;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(4);
        let expectedValue2: int = 100;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = new Int16Array(5);
        let src: FixedArray<number> = [0, 32767, -32768, 0, 32767];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 32767;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = -32768;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = arr.$_get(3);
        let expectedValue4: int = 0;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = arr.$_get(4);
        let expectedValue5: int = 32767;
        expect(resultValue5).assertEqual(expectedValue5);

      }
      {
        let arr: Int16Array = new Int16Array(10);
        let src: FixedArray<short> = [
          0, 1, 2, 3, 4,
          5, 6, 7, 8, 9
        ];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(5);
        let expectedValue2: int = 5;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(9);
        let expectedValue3: int = 9;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = new Int16Array(5);
        let src: FixedArray<short> = [-5, -4, -3, -2, -1];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = -5;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(4);
        let expectedValue2: int = -1;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(99, 99, 99, 99, 99);
        let src: FixedArray<short> = [1, 2];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = 99;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = arr.$_get(4);
        let expectedValue4: int = 99;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let arr: Int16Array = Int16Array.of(-1, -1, -1, -1, -1);
        let src: FixedArray<short> = [0];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(4);
        let expectedValue2: int = -1;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(100, 100, 100, 100);
        let src: FixedArray<short> = [1, 2];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = 100;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = arr.$_get(3);
        let expectedValue4: int = 100;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let arr: Int16Array = Int16Array.of(50, 50, 50, 50, 50);
        let src: FixedArray<short> = [-1, 0, 1];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = -1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(2);
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(3);
        let expectedValue3: int = 50;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = arr.$_get(4);
        let expectedValue4: int = 50;
        expect(resultValue4).assertEqual(expectedValue4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SET_0600
     * @tc.name testSetGeneral006
     * @tc.desc Verify set writes expected values readable via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetGeneral006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(0, 0);
        let src: FixedArray<number> = [32767, -32768];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = -32768;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = new Int16Array(2);
        let src: FixedArray<short> = [1, 2];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = new Int16Array(3);
        let src1: FixedArray<short> = [1, 1, 1];
        let src2: FixedArray<short> = [2, 2, 2];
        arr.set(src1);
        arr.set(src2);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 2;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(2);
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = new Int16Array(3);
        let src: FixedArray<short> = [7, 8, 9];
        arr.set(src);
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 7;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(2);
        let expectedValue2: int = 9;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = new Int16Array(4);
        let src: FixedArray<short> = [10, 20, 30, 40];
        arr.set(src);
        src[0] = 0;
        src[1] = 0;
        src[2] = 0;
        src[3] = 0;
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = 30;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = arr.$_get(3);
        let expectedValue4: int = 40;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let arr: Int16Array = Int16Array.of(32767, 32767, 32767);
        let src: FixedArray<short> = [0, 0];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = 32767;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = Int16Array.of(-32768, -32768, -32768);
        let src: FixedArray<short> = [1, 2];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = -32768;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = new Int16Array(4);
        let src: FixedArray<number> = [1, -1, 32767, -32768];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = -1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = 32767;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = arr.$_get(3);
        let expectedValue4: int = -32768;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let arr: Int16Array = Int16Array.of(-5, -5, -5, -5);
        let src: FixedArray<short> = [1, 2];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = -5;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = arr.$_get(3);
        let expectedValue4: int = -5;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        const target = new Int16Array(3);
        const src: FixedArray<number> = [42.0];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 42;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SET_0700
     * @tc.name testSetGeneral007
     * @tc.desc Verify set writes expected values readable via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetGeneral007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const target = new Int16Array(2);
        const src: FixedArray<number> = [0.0];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        const target = new Int16Array(2);
        const src: FixedArray<number> = [-1.0];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -1;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        const target = new Int16Array(3);
        const src: FixedArray<number> = [10.0, 20.0, 30.0];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 30;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        const target = Int16Array.of(1, 2, 3);
        const src: FixedArray<number> = [0.0, 0.0, 0.0];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        const target = new Int16Array(3);
        const src: FixedArray<number> = [-1.0, -2.0, -3.0];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -2;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = -3;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        const target = new Int16Array(5);
        const src: FixedArray<number> = [1.0, 2.0, 3.0];
        target.set(src, 2);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 1;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 2;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 3;
        expect(resultValue5).assertEqual(expectedValue5);

      }
      {
        const target = Int16Array.of(9, 9, 9, 9, 9);
        const src: FixedArray<number> = [1.0, 2.0];
        target.set(src, 2);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 9;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 9;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 1;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 2;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 9;
        expect(resultValue5).assertEqual(expectedValue5);

      }
      {
        const target = Int16Array.of(1, 2, 3, 4);
        const src: FixedArray<number> = [99.0];
        target.set(src, 2);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 99;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        const target = Int16Array.of(1, 2, 3, 4);
        const src: FixedArray<number> = [88.0];
        target.set(src, 1);
        let resultValue1: number = target.$_get(2);
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(3);
        let expectedValue2: int = 4;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        const target = new Int16Array(10);
        const src: FixedArray<number> = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(4);
        let expectedValue2: int = 5;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(9);
        let expectedValue3: int = 10;
        expect(resultValue3).assertEqual(expectedValue3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SET_0800
     * @tc.name testSetGeneral008
     * @tc.desc Verify set writes expected values readable via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetGeneral008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const target = new Int16Array(4);
        const src: FixedArray<number> = [10.0, -20.0, 30.0, -40.0];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -20;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 30;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = -40;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        const target = Int16Array.of(0, 0, 0, 0, 0);
        const src: FixedArray<number> = [7.0, -7.0];
        target.set(src, 1);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 7;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = -7;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 0;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        const target = Int16Array.of(1, 2, 3);
        const src: FixedArray<number> = [99.0];
        target.set(src, 2);
        let resultValue1: number = target.$_get(2);
        let expectedValue1: int = 99;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(0);
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(1);
        let expectedValue3: int = 2;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        const target = Int16Array.of(1, 2, 3, 4, 5, 6);
        const src: FixedArray<number> = [99.0];
        target.set(src, 2);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 99;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 4;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 5;
        expect(resultValue5).assertEqual(expectedValue5);
        let resultValue6: number = target.$_get(5);
        let expectedValue6: int = 6;
        expect(resultValue6).assertEqual(expectedValue6);

      }
      {
        const target = Int16Array.of(9, 9, 9);
        const src: FixedArray<number> = [1.0, 2.0];
        target.set(src, 1);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 9;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 2;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        const target = new Int16Array(5);
        const src: FixedArray<number> = [1.0, 2.0, 3.0];
        target.set(src, 2);
        let resultValue1: number = target.$_get(2);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(3);
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(4);
        let expectedValue3: int = 3;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        const target = Int16Array.of(1, 2, 3, 4, 5);
        const src: FixedArray<number> = [99.0];
        target.set(src, 2);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 99;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 4;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 5;
        expect(resultValue5).assertEqual(expectedValue5);

      }
      {
        const target = new Int16Array(3);
        const bufBefore = target.buffer;
        const src: FixedArray<number> = [1.0];
        target.set(src, 0);
        let resultValue1: boolean = target.buffer === bufBefore;
        expect(resultValue1).assertTrue();

      }
      {
        const target = new Int16Array(2);
        const src: FixedArray<number> = [1.0];
        target.set(src, 0);
        let resultValue1: int = target.byteOffset;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        const target = new Int16Array(2);
        const src: FixedArray<number> = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0];
        try {
          target.set(src, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SET_0900
     * @tc.name testSetGeneral009
     * @tc.desc Verify set writes expected values readable via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetGeneral009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const target = new Int16Array(3);
        const src: FixedArray<number> = [1.0, 2.0];
        target.set(src, 1);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 2;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        const target = new Int16Array(1);
        const src: FixedArray<number> = [32767.0];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        const target = new Int16Array(1);
        const src: FixedArray<number> = [-32768.0];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        const target = new Int16Array(1);
        const src: FixedArray<number> = [-32769.0];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        const target = new Int16Array(1);
        const src: FixedArray<number> = [32768.0];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        const target = new Int16Array(1);
        const src: FixedArray<number> = [Double.NEGATIVE_INFINITY];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        const target = new Int16Array(2);
        const src: FixedArray<number> = [32768.0, 65535.0];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -1;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        const target = new Int16Array(2);
        const src: FixedArray<number> = [3.7, -3.7];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -3;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        const target = new Int16Array(3);
        const src: FixedArray<number> = [100.0, 32768.0, -32769.0];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 100;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -32768;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 32767;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        const target = new Int16Array(2);
        const src: FixedArray<number> = [Double.NaN, 42.0];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 42;
        expect(resultValue2).assertEqual(expectedValue2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SET_1000
     * @tc.name testSetGeneral010
     * @tc.desc Verify set writes expected values readable via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetGeneral010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const target = new Int16Array(2);
        const src: FixedArray<number> = [Double.POSITIVE_INFINITY, 42.0];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 42;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        const target = new Int16Array(4);
        const src: FixedArray<number> = [32767.0, 3.7, -32768.0, -3.7];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 3;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = -32768;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = -3;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target = new Int16Array([0, 0, 0]);
        let source = Int16Array.of(10, 20, 30);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 30;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target = new Int16Array([0, 0]);
        let src: Int16Array = Int16Array.of(42, 99);
        target.set(src);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 42;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 99;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target = new Int16Array(0);
        let source = new Int16Array(0);
        target.set(source);
        let resultValue1: int = target.length;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let target = Int16Array.of(5, 10, 15);
        let source = new Int16Array(0);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 5;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 10;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 15;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target = Int16Array.of(99);
        let source = new Int16Array(0);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 99;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let target = new Int16Array([88, 88]);
        let source = Int16Array.of(7);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 7;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 88;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target = Int16Array.of(99, 99, 99, 99, 99);
        let source = Int16Array.of(1);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 99;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 99;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 99;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 99;
        expect(resultValue5).assertEqual(expectedValue5);

      }
      {
        let target = Int16Array.of(77, 77, 77, 77, 77);
        let source = Int16Array.of(11, 22);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 11;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 22;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 77;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 77;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 77;
        expect(resultValue5).assertEqual(expectedValue5);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SET_1100
     * @tc.name testSetGeneral011
     * @tc.desc Verify set writes expected values readable via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetGeneral011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let target = new Int16Array([0]);
        let source = Int16Array.of(32767);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let target = new Int16Array([0, 0, 0, 0, 0]);
        let source = Int16Array.of(1, 2, 4, 8, 16);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 4;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 8;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 16;
        expect(resultValue5).assertEqual(expectedValue5);

      }
      {
        let target = new Int16Array([0, 0]);
        let source = Int16Array.of(32767, 0);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target = new Int16Array([0, 0]);
        let source = Int16Array.of(-32768, 0);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target = new Int16Array([0, 0]);
        let source = Int16Array.of(32767, -32768);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -32768;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target = new Int16Array([0, 0]);
        let source = Int16Array.of(-32768, 32767);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 32767;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target = new Int16Array([0, 0, 0]);
        let source = Int16Array.of(-1, 0, 1);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 1;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target = new Int16Array([0, 0, 0]);
        let source = Int16Array.of(32767, 32767, 32767);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 32767;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 32767;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target = new Int16Array([0, 0, 0]);
        let source = Int16Array.of(-32768, -32768, -32768);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -32768;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = -32768;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target = new Int16Array([99, 99, 99, 99, 99]);
        let source = Int16Array.of(0, 0, 0, 0, 0);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 0;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 0;
        expect(resultValue5).assertEqual(expectedValue5);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SET_1200
     * @tc.name testSetGeneral012
     * @tc.desc Verify set writes expected values readable via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetGeneral012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let target = new Int16Array([0, 0, 0, 0]);
        let source = Int16Array.of(100, -100, 100, -100);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 100;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -100;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 100;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = -100;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target = new Int16Array([0, 0, 0, 0, 0]);
        let source = Int16Array.of(-100, -50, 0, 50, 100);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -100;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -50;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 50;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 100;
        expect(resultValue5).assertEqual(expectedValue5);

      }
      {
        let target = new Int16Array([0, 0, 0, 0, 0]);
        let source = Int16Array.of(100, 50, 0, -50, -100);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 100;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 50;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = -50;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = -100;
        expect(resultValue5).assertEqual(expectedValue5);

      }
      {
        let target = new Int16Array([0, 0, 0, 0]);
        let source = Int16Array.of(0, 32767, 0, -32768);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 32767;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = -32768;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target = new Int16Array([0, 0]);
        let source = Int16Array.of(1, 32767);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 32767;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr = Int16Array.of(100, 200, 300);
        arr.set(arr);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 100;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 200;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = 300;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target = new Int16Array(4);
        let source = Int16Array.of(3, 6, 9, 12);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 6;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 9;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 12;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target = Int16Array.of(99, 99, 99);
        let source = Int16Array.of(11, 22, 33);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 11;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 22;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 33;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target = Int16Array.of(32767, 32767);
        let source = Int16Array.of(-32768, -32768);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -32768;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(10);
        let base = new Int16Array(buf);
        base.$_set(0, 0);
        base.$_set(1, 0);
        base.$_set(2, 0);
        base.$_set(3, 0);
        base.$_set(4, 0);
        let target = new Int16Array(buf, 2, 3);
        let source = Int16Array.of(10, 20, 30);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 30;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = base.$_get(1);
        let expectedValue4: int = 10;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = base.$_get(2);
        let expectedValue5: int = 20;
        expect(resultValue5).assertEqual(expectedValue5);
        let resultValue6: number = base.$_get(3);
        let expectedValue6: int = 30;
        expect(resultValue6).assertEqual(expectedValue6);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SET_1300
     * @tc.name testSetGeneral013
     * @tc.desc Verify set writes expected values readable via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetGeneral013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let source = new Int16Array(50);
        for (let i = 0; i < 50; i++) {
          source.$_set(i, i);
        }
        let target = new Int16Array(60);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(49);
        let expectedValue2: int = 49;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(50);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target = new Int16Array([0, 0, 0, 0, 0, 0]);
        let source = Int16Array.of(0, 1, 2, 0, 1, 2);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 2;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 0;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 1;
        expect(resultValue5).assertEqual(expectedValue5);
        let resultValue6: number = target.$_get(5);
        let expectedValue6: int = 2;
        expect(resultValue6).assertEqual(expectedValue6);

      }
      {
        let target = new Int16Array([0, 0, 0, 0]);
        let source = Int16Array.of(40, 30, 20, 10);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 40;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 30;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 20;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 10;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target = new Int16Array([0, 0, 0, 0]);
        let source = Int16Array.of(-1, -1, -1, -1);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = -1;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = -1;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target = new Int16Array(10);
        for (let i = 0; i < 10; i++) {
          target.$_set(i, 8);
        }
        let source = Int16Array.of(1, 2, 3);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(2);
        let expectedValue2: int = 3;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(3);
        let expectedValue3: int = 8;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(9);
        let expectedValue4: int = 8;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target = new Int16Array([0]);
        let source = Int16Array.of(1, 2);
        try {
          target.set(source);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }

      }
      {
        let target = new Int16Array([0, 0]);
        let source = Int16Array.of(1, 2, 3);
        try {
          target.set(source);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }

      }
      {
        let target = new Int16Array(0);
        let source = Int16Array.of(1);
        try {
          target.set(source);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }

      }
      {
        let target = new Int16Array([0, 0, 0]);
        let source = Int16Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        try {
          target.set(source);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }

      }
      {
        let target = Int16Array.of(42, 42);
        let source = Int16Array.of(1, 2, 3);
        try {
          target.set(source);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 42;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 42;
        expect(resultValue2).assertEqual(expectedValue2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SET_1400
     * @tc.name testSetGeneral014
     * @tc.desc Verify set writes expected values readable via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetGeneral014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let target = Int16Array.of(10, 20, 30);
        let source = new Int16Array(0);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(2);
        let expectedValue2: int = 30;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target = new Int16Array([0, 0, 0]);
        let source = Int16Array.of(1, 2, 3);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(2);
        let expectedValue2: int = 3;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target = new Int16Array([0, 0, 0, 0]);
        let source = Int16Array.of(32767, 32767, 32767, 32767);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 32767;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 32767;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 32767;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target = new Int16Array([0, 0, 0, 0]);
        let source = Int16Array.of(-32768, -32768, -32768, -32768);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -32768;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = -32768;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = -32768;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target = new Int16Array([0, 0]);
        let source = Int16Array.of(10, 20);
        target.set(source);
        source.$_set(0, 99);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target = new Int16Array([0, 0, 0]);
        let src1 = Int16Array.of(1, 2, 3);
        let src2 = Int16Array.of(4, 5, 6);
        target.set(src1);
        target.set(src2);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 4;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 5;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 6;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let source = Int16Array.of(11, 22);
        let target1 = new Int16Array([0, 0]);
        let target2 = new Int16Array([0, 0]);
        target1.set(source);
        target2.set(source);
        target1.$_set(0, 99);
        let resultValue1: number = target2.$_get(0);
        let expectedValue1: int = 11;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target2.$_get(1);
        let expectedValue2: int = 22;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target = new Int16Array([100, 200, 300]);
        let source = new Int16Array([0]);
        target.set(source, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 200;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 300;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target = new Int16Array([100, 200, 300]);
        let source = new Int16Array([1]);
        target.set(source, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 200;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 300;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target = new Int16Array([100, 200, 300]);
        let source = new Int16Array([-1]);
        target.set(source, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 200;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 300;
        expect(resultValue3).assertEqual(expectedValue3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SET_1500
     * @tc.name testSetGeneral015
     * @tc.desc Verify set writes expected values readable via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetGeneral015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let target = new Int16Array([10, 20, 30]);
        let source = new Int16Array([0]);
        target.set(source, 2);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target = new Int16Array([0, 0, 0, 0, 0]);
        let source = new Int16Array([1, 2, 3]);
        target.set(source, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 3;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 0;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 0;
        expect(resultValue5).assertEqual(expectedValue5);

      }
      {
        let target = new Int16Array([0, 0, 0, 0, 0]);
        let source = new Int16Array([-1, -2, -3]);
        target.set(source, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -2;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = -3;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 0;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 0;
        expect(resultValue5).assertEqual(expectedValue5);

      }
      {
        let target = new Int16Array([0, 0, 0, 0]);
        let source = new Int16Array([1, -1, 0]);
        target.set(source, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 0;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target = new Int16Array([100, 200, 300]);
        let source = new Int16Array([10, 20, 30]);
        target.set(source, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 30;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target = new Int16Array([100, 200, 300, 400]);
        let source = new Int16Array([10, 20, 30]);
        target.set(source, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 30;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 400;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target = new Int16Array([0, 0, 0, 0]);
        let source = new Int16Array([7, 8]);
        target.set(source, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 7;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 8;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 0;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target = new Int16Array([100, 0, 0, 100]);
        let source = new Int16Array([50, 60]);
        target.set(source, 1);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 100;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 50;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 60;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 100;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target = new Int16Array([1, 2, 3, 4, 5]);
        let source = new Int16Array([10, 20]);
        target.set(source, 3);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 3;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 10;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 20;
        expect(resultValue5).assertEqual(expectedValue5);

      }
      {
        let target = new Int16Array([5, 5, 5]);
        let source = new Int16Array([99]);
        target.set(source, 2);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 5;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 5;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 99;
        expect(resultValue3).assertEqual(expectedValue3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SET_1600
     * @tc.name testSetGeneral016
     * @tc.desc Verify set writes expected values readable via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetGeneral016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let target = new Int16Array(100);
        for (let i = 0; i < 100; i++) {
          target.$_set(i, 0);
        }
        let source = new Int16Array([77, 88]);
        target.set(source, 97);
        let resultValue1: number = target.$_get(96);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(97);
        let expectedValue2: int = 77;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(98);
        let expectedValue3: int = 88;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(99);
        let expectedValue4: int = 0;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target = new Int16Array([0, 0, 0, 0, 0]);
        let source = new Int16Array([0, 1, 2, 3, 4]);
        target.set(source, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 2;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 3;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 4;
        expect(resultValue5).assertEqual(expectedValue5);

      }
      {
        let target = new Int16Array([0, 0, 0, 0, 0]);
        let source = new Int16Array([4, 3, 2, 1, 0]);
        target.set(source, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 4;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 3;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 2;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 1;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 0;
        expect(resultValue5).assertEqual(expectedValue5);

      }
      {
        let target = new Int16Array([0, 0, 0, 0, 0, 0]);
        let source = new Int16Array([32767, -32768, 1, -1, 0, 100]);
        target.set(source, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -32768;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 1;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = -1;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 0;
        expect(resultValue5).assertEqual(expectedValue5);
        let resultValue6: number = target.$_get(5);
        let expectedValue6: int = 100;
        expect(resultValue6).assertEqual(expectedValue6);

      }
      {
        let arr: Int16Array = new Int16Array(3);
        let sv: short = 10;
        arr.set(0, sv);
        arr.set(1, 20);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SET_1700
     * @tc.name testSetSource001
     * @tc.desc Verify set copies values from different source types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetSource001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let target = new Int16Array(3);
        let source: Array<number> = [];
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let target = new Int16Array(3);
        let source: Array<number> = [42];
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 42;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let target = new Int16Array(3);
        let val: short = 10;
        target.set(0, val);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let target = new Int16Array(3);
        let source: Array<number> = [1];
        target.set(source, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let target = new Int16Array(3);
        let source: Array<number> = [3.99, -3.99];
        target.set(source, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -3;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let src = Int16Array.of(5, 6, 7);
        let arr = new Int16Array(src);
        arr.set(0, 99);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 99;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = src.$_get(0);
        let expectedValue2: int = 5;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr = new Int16Array(5);
        arr.set(4, 32767);
        let resultValue1: number = arr.$_get(4);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(0);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = new Int16Array(3);
        let src: FixedArray<short> = [1, 2, 3];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = 3;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = new Int16Array(10);
        arr.$_set(9, 88);
        let src: FixedArray<short> = [5];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 5;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(9);
        let expectedValue2: int = 88;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        let src: FixedArray<short> = [10, 20, 30];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(2);
        let expectedValue2: int = 30;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(3);
        let expectedValue3: int = 4;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = arr.$_get(4);
        let expectedValue4: int = 5;
        expect(resultValue4).assertEqual(expectedValue4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SET_1800
     * @tc.name testSetSource002
     * @tc.desc Verify set copies values from different source types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetSource002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array(5);
        let src: FixedArray<short> = [1, -1, 1, -1, 1];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = -1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(4);
        let expectedValue3: int = 1;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = new Int16Array(4);
        let src: FixedArray<short> = [7, 7, 7, 7];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 7;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(3);
        let expectedValue2: int = 7;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = new Int16Array(4);
        let src: FixedArray<short> = [-7, -7, -7, -7];
        arr.set(src);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = -7;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(3);
        let expectedValue2: int = -7;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target: Int16Array = new Int16Array(3);
        let src: FixedArray<short> = [];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target: Int16Array = new Int16Array(3);
        let src: FixedArray<short> = [0];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let target: Int16Array = new Int16Array(3);
        let src: FixedArray<short> = [-1];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -1;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let target: Int16Array = new Int16Array(5);
        let src: FixedArray<short> = [0, 0];
        target.set(src, 1);
        let resultValue1: number = target.$_get(1);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(2);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target: Int16Array = new Int16Array(4);
        let src: FixedArray<short> = [-1, 0];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target: Int16Array = new Int16Array(4);
        let src: FixedArray<short> = [100, 100];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 100;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 100;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target: Int16Array = new Int16Array(4);
        let src: FixedArray<short> = [-100, -100];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -100;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -100;
        expect(resultValue2).assertEqual(expectedValue2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SET_1900
     * @tc.name testSetSource003
     * @tc.desc Verify set copies values from different source types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetSource003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let target: Int16Array = new Int16Array(4);
        let src: FixedArray<short> = [42, -42];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 42;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -42;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target: Int16Array = new Int16Array(5);
        let src: FixedArray<short> = [-1, 0, 1];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 1;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target: Int16Array = new Int16Array(5);
        let src: FixedArray<short> = [-32768, -32768, -32768];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -32768;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = -32768;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target: Int16Array = new Int16Array(8);
        let src: FixedArray<short> = [-2, -1, 0, 1, 2];
        target.set(src, 1);
        let resultValue1: number = target.$_get(1);
        let expectedValue1: int = -2;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(2);
        let expectedValue2: int = -1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(3);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(4);
        let expectedValue4: int = 1;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(5);
        let expectedValue5: int = 2;
        expect(resultValue5).assertEqual(expectedValue5);

      }
      {
        let target: Int16Array = new Int16Array(8);
        let src: FixedArray<short> = [2, 1, 0, -1, -2];
        target.set(src, 1);
        let resultValue1: number = target.$_get(1);
        let expectedValue1: int = 2;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(2);
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(3);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(4);
        let expectedValue4: int = -1;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(5);
        let expectedValue5: int = -2;
        expect(resultValue5).assertEqual(expectedValue5);

      }
      {
        let target: Int16Array = new Int16Array(12);
        let src: FixedArray<short> = [0, 1, -1, 32767, -32768, 100, -100, 200, -200, 300];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = -1;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 32767;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = -32768;
        expect(resultValue5).assertEqual(expectedValue5);
        let resultValue6: number = target.$_get(5);
        let expectedValue6: int = 100;
        expect(resultValue6).assertEqual(expectedValue6);
        let resultValue7: number = target.$_get(9);
        let expectedValue7: int = 300;
        expect(resultValue7).assertEqual(expectedValue7);

      }
      {
        let target: Int16Array = new Int16Array(110);
        let src: FixedArray<short> = new FixedArray<short>(100, 0);
        for (let i = 0; i < 100; i++) {
          src[i] = 0 as short;
        }
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(50);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(99);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target: Int16Array = new Int16Array(5);
        let src: FixedArray<short> = [10, 20];
        target.set(src, 1);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 10;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 20;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target: Int16Array = new Int16Array(6);
        let src: FixedArray<short> = [10, 20];
        target.set(src, 3);
        let resultValue1: number = target.$_get(2);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(3);
        let expectedValue2: int = 10;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(4);
        let expectedValue3: int = 20;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(5);
        let expectedValue4: int = 0;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target: Int16Array = new Int16Array(6);
        let src: FixedArray<short> = [10, 20];
        target.set(src, 2);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 10;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 20;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 0;
        expect(resultValue5).assertEqual(expectedValue5);
        let resultValue6: number = target.$_get(5);
        let expectedValue6: int = 0;
        expect(resultValue6).assertEqual(expectedValue6);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SET_2000
     * @tc.name testSetSource004
     * @tc.desc Verify set copies values from different source types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetSource004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let target: Int16Array = new Int16Array(3);
        let src: FixedArray<short> = [99];
        target.set(src, 2);
        let resultValue1: number = target.$_get(2);
        let expectedValue1: int = 99;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(0);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(1);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target: Int16Array = new Int16Array(1);
        let src: FixedArray<short> = [42];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 42;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let target: Int16Array = new Int16Array(2);
        let src: FixedArray<short> = [10, 20];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target: Int16Array = new Int16Array(10);
        let src: FixedArray<short> = [100, 200, 300];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 100;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 200;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 300;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 0;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target: Int16Array = new Int16Array(5);
        let src: FixedArray<short> = [10, 20, 30];
        target.set(src, 0);
        let resultValue1: number = src[0];
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = src[1];
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = src[2];
        let expectedValue3: int = 30;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target: Int16Array = new Int16Array(6);
        let src: FixedArray<short> = [10, 20];
        target.set(src, 2);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(4);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(5);
        let expectedValue4: int = 0;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target: Int16Array = new Int16Array(3);
        let src: FixedArray<short> = [10, 20];
        target.set(src, 0);
        src[0] = 99;
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target: Int16Array = new Int16Array(3);
        let src: FixedArray<short> = [10, 20];
        target.set(src, 0);
        target.$_set(0, 99);
        let resultValue1: number = src[0];
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = src[1];
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target: Int16Array = new Int16Array(3);
        let src: FixedArray<short> = [];
        target.set(src, 0);
        target.set(src, 1);
        target.set(src, 2);
        target.set(src, 3);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let target: Int16Array = new Int16Array(5);
        let src1: FixedArray<short> = [10, 20];
        target.set(src1, 0);
        let src2: FixedArray<short> = [30, 40, 50];
        try {
          target.set(src2, 3);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        let resultValue2: number = target.$_get(0);
        let expectedValue2: int = 10;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(1);
        let expectedValue3: int = 20;
        expect(resultValue3).assertEqual(expectedValue3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SET_2100
     * @tc.name testSetSource005
     * @tc.desc Verify set copies values from different source types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetSource005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let target: Int16Array = new Int16Array(4);
        let src1: FixedArray<short> = [10, 20, 30, 40];
        target.set(src1, 0);
        let src2: FixedArray<short> = [99, 88];
        target.set(src2, 1);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 99;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 88;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 40;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target: Int16Array = new Int16Array(5);
        let src: FixedArray<short> = [-32768, -1, 0, 1, 32767];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 1;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 32767;
        expect(resultValue5).assertEqual(expectedValue5);

      }
      {
        let target: Int16Array = new Int16Array(6);
        let src: FixedArray<short> = [10, 20, 30, 40, 50];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 30;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 40;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 50;
        expect(resultValue5).assertEqual(expectedValue5);

      }
      {
        let target: Int16Array = new Int16Array(6);
        let src: FixedArray<short> = [50, 40, 30, 20, 10];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 50;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 40;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 30;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 20;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 10;
        expect(resultValue5).assertEqual(expectedValue5);

      }
      {
        let target: Int16Array = new Int16Array(5);
        let src: FixedArray<short> = [100, -100, 200, -200];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 100;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -100;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 200;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = -200;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target: Int16Array = new Int16Array(6);
        let src: FixedArray<short> = [32767, -32768];
        target.set(src, 1);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(3);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(4);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(5);
        let expectedValue4: int = 0;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target: Int16Array = new Int16Array(4);
        target.$_set(0, 999);
        target.$_set(1, 888);
        target.$_set(2, 777);
        target.$_set(3, 666);
        let src: FixedArray<short> = [-1, 0];
        target.set(src, 1);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 999;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 666;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target: Int16Array = new Int16Array(6);
        let src1: FixedArray<short> = [10, 20];
        target.set(src1, 0);
        let src2: FixedArray<short> = [30, 40];
        target.set(src2, 3);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 30;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 40;
        expect(resultValue5).assertEqual(expectedValue5);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(10);
        let target: Int16Array = new Int16Array(buf, 2, 4);
        let src: FixedArray<short> = [100, 200];
        target.set(src, 1);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 100;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 200;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 0;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target: Int16Array = new Int16Array(5);
        target.$_set(0, 99);
        target.$_set(1, 88);
        target.$_set(2, 77);
        target.$_set(3, 66);
        target.$_set(4, 55);
        let src: FixedArray<short> = [0, 0, 0];
        target.set(src, 1);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 99;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 0;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 55;
        expect(resultValue5).assertEqual(expectedValue5);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SET_2200
     * @tc.name testSetSource006
     * @tc.desc Verify set copies values from different source types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetSource006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let target: Int16Array = new Int16Array([0, 0, 0]);
        let src: FixedArray<short> = [32767];
        target.set(src, 1);
        let resultValue1: number = target.$_get(1);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(0);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target: Int16Array = new Int16Array([0, 0, 0]);
        let src: FixedArray<short> = [-32768];
        target.set(src, 1);
        let resultValue1: number = target.$_get(1);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(0);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target: Int16Array = new Int16Array(6);
        let src: FixedArray<short> = [-32768, -100, 0, 100, 32767];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -32768;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -100;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 100;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 32767;
        expect(resultValue5).assertEqual(expectedValue5);

      }
      {
        let target: Int16Array = new Int16Array(4);
        let src: FixedArray<short> = [-32768, 32767];
        target.set(src, 2);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = -32768;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 32767;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target = new Int16Array(3);
        let src: FixedArray<number> = [1.0, 2.0, 3.0];
        target.set(src);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 3;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target = new Int16Array(0);
        let src: FixedArray<number> = [];
        target.set(src);
        let resultValue1: int = target.length;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let target = new Int16Array(3);
        target.$_set(0, 99);
        target.$_set(1, 99);
        target.$_set(2, 99);
        let src: FixedArray<number> = [10.0, 20.0, 30.0];
        target.set(src);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 30;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target = new Int16Array(3);
        let src: FixedArray<number> = [-1.0, -2.0, -3.0];
        target.set(src);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -2;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = -3;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target = new Int16Array(5);
        let src: FixedArray<number> = [1.0, -2.0, 0.0, -4.0, 5.0];
        target.set(src);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -2;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = -4;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 5;
        expect(resultValue5).assertEqual(expectedValue5);

      }
      {
        let target = new Int16Array(4);
        let src: FixedArray<number> = [32767.0, -32768.0, 0.0, -1.0];
        target.set(src);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 32767;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -32768;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = -1;
        expect(resultValue4).assertEqual(expectedValue4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SET_2300
     * @tc.name testSetSource007
     * @tc.desc Verify set copies values from different source types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetSource007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let target = new Int16Array(3);
        let src: FixedArray<number> = [-1.0, -1.0, -1.0];
        target.set(src);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = -1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = -1;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target = new Int16Array(5);
        let src: FixedArray<number> = [0.0, 1.0, 2.0, 3.0, 4.0];
        target.set(src);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 2;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 3;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 4;
        expect(resultValue5).assertEqual(expectedValue5);

      }
      {
        let target = new Int16Array(5);
        let src: FixedArray<number> = [4.0, 3.0, 2.0, 1.0, 0.0];
        target.set(src);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 4;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 3;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 2;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 1;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = target.$_get(4);
        let expectedValue5: int = 0;
        expect(resultValue5).assertEqual(expectedValue5);

      }
      {
        let target = new Int16Array(4);
        let src: FixedArray<number> = [1.0, 32768.0, -1.0, -32769.0];
        target.set(src);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = -32768;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = -1;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = target.$_get(3);
        let expectedValue4: int = 32767;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let target = new Int16Array(2);
        let src: FixedArray<number> = [1.0, 2.0];
        target.set(src);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target = new Int16Array(2);
        let src1: FixedArray<number> = [10.0, 20.0];
        let src2: FixedArray<number> = [30.0, 40.0];
        target.set(src1);
        target.set(src2);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 30;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 40;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target = new Int16Array(3);
        let src: FixedArray<number> = [111.0, 222.0, 333.0];
        target.set(src);
        let result: number[] = [0, 0, 0];
        for (let i = 0; i < target.length; i++) {
          result[i] = target.$_get(i);
        }
        let resultValue1: number = result[0];
        let expectedValue1: int = 111;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result[1];
        let expectedValue2: int = 222;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = result[2];
        let expectedValue3: int = 333;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        const target = new Int16Array(3);
        const src: FixedArray<number> = [10.0, 20.0];
        target.set(src, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        const target = new Int16Array(2);
        const src: FixedArray<number> = [10.0, 20.0];
        target.set(src, 0);
        let resultValue1: number = src[0];
        let expectedValue1: number = 10.0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = src[1];
        let expectedValue2: number = 20.0;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target = new Int16Array([0, 0, 0]);
        let source = new Int16Array(3);
        source.$_set(0, 5);
        source.$_set(1, 15);
        source.$_set(2, 25);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 5;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 15;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 25;
        expect(resultValue3).assertEqual(expectedValue3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SET_2400
     * @tc.name testSetSource008
     * @tc.desc Verify set copies values from different source types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetSource008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let target = new Int16Array([0, 0]);
        let source = Int16Array.of(8, 9);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 8;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 9;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let buf = new ArrayBuffer(6);
        let source = new Int16Array(buf);
        source.$_set(0, 77);
        source.$_set(1, 88);
        source.$_set(2, 99);
        let target = new Int16Array([0, 0, 0]);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 77;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 88;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 99;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let buf = new ArrayBuffer(6);
        let target = new Int16Array(buf);
        let source = Int16Array.of(12, 34, 56);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 12;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 34;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 56;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target = new Int16Array([0, 0]);
        let source = Int16Array.of(1, 2);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target = new Int16Array([1, 2]);
        let source = new Int16Array(0);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let base = Int16Array.of(5, 10, 15, 20);
        let target = new Int16Array([0, 0]);
        let source = Int16Array.of(5, 10);
        target.set(source);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 5;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 10;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let buf1 = new ArrayBuffer(4);
        let buf2 = new ArrayBuffer(4);
        let target = new Int16Array(buf1);
        let source = new Int16Array(buf2);
        source.$_set(0, 33);
        source.$_set(1, 66);
        target.set(source);
        source.$_set(0, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 33;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 66;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let target = new Int16Array([0, 0, 0]);
        let source = Int16Array.of(5, 10, 15);
        target.set(source, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 5;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 10;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 15;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let target = new Int16Array([0, 0, 0]);
        let source = Int16Array.from([7, 14, 21]);
        target.set(source, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 7;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 14;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 21;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let base = new Int16Array([100, 200, 300, 400, 500]);
        let source = base.subarray(1, 4);
        let target = new Int16Array([0, 0, 0]);
        target.set(source, 0);
        let resultValue1: number = target.$_get(0);
        let expectedValue1: int = 200;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = target.$_get(1);
        let expectedValue2: int = 300;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = target.$_get(2);
        let expectedValue3: int = 400;
        expect(resultValue3).assertEqual(expectedValue3);

      }
    });
