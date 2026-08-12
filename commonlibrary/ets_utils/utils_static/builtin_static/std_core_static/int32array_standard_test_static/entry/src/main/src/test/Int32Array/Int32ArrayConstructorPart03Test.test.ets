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
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';
export default function int32ArrayConstructorPart03TestMindmapTestTest(): void {
  describe('Int32ArrayConstructorPart03TestMindmapTestTest', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_0100
         * @tc.name int32ArrayConstructorPart03TestMindmapTest001
         * @tc.desc Verify number number length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          expect(arr.length).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_0200
         * @tc.name int32ArrayConstructorPart03TestMindmapTest002
         * @tc.desc Verify length 0 Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_0300
         * @tc.name int32ArrayConstructorPart03TestMindmapTest003
         * @tc.desc Verify length -0 +0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(-0);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_0400
         * @tc.name int32ArrayConstructorPart03TestMindmapTest004
         * @tc.desc Verify length 2.9 2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2.9);
          expect(arr.length).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_0500
         * @tc.name int32ArrayConstructorPart03TestMindmapTest005
         * @tc.desc Verify length Number.NaN ToIndex(Number.NaN)=0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(Double.NaN);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_0600
         * @tc.name int32ArrayConstructorPart03TestMindmapTest006
         * @tc.desc Verify length 7.0 7 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(7.0);
          expect(arr.length).assertEqual(7);
          expect(arr[3]).assertEqual(0);
          expect(arr[6]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_0700
         * @tc.name int32ArrayConstructorPart03TestMindmapTest007
         * @tc.desc Verify length +Number.POSITIVE_INFINITY RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          try {
            new Int32Array(Double.POSITIVE_INFINITY);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_0800
         * @tc.name int32ArrayConstructorPart03TestMindmapTest008
         * @tc.desc Verify length Double.NEGATIVE_INFINITY RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          try {
            new Int32Array(Double.NEGATIVE_INFINITY);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_0900
         * @tc.name int32ArrayConstructorPart03TestMindmapTest009
         * @tc.desc Verify length -2.3 RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          try {
            new Int32Array(-2.3);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_1000
         * @tc.name int32ArrayConstructorPart03TestMindmapTest010
         * @tc.desc Verify number length=4 byteLength 16
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          expect(arr.byteLength).assertEqual(16);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_1100
         * @tc.name int32ArrayConstructorPart03TestMindmapTest011
         * @tc.desc Verify number byteOffset 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(6.0);
          expect(arr.byteOffset).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_1200
         * @tc.name int32ArrayConstructorPart03TestMindmapTest012
         * @tc.desc Verify number ArrayBuffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(3);
          let b: Int32Array = new Int32Array(3);
          a.$_set(0, 55);
          expect(b.$_get(0)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_1300
         * @tc.name int32ArrayConstructorPart03TestMindmapTest013
         * @tc.desc Verify number 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(5);
          for (let i: int = 0; i < arr.length; i++) {
          expect(arr[i]).assertEqual(0);
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_1400
         * @tc.name int32ArrayConstructorPart03TestMindmapTest014
         * @tc.desc Verify number buffer.byteLength length*4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          expect(arr.buffer.byteLength).assertEqual(12);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_1500
         * @tc.name int32ArrayConstructorPart03TestMindmapTest015
         * @tc.desc Verify number
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr[0] = 42;
          arr[1] = -7;
          expect(arr[0]).assertEqual(42);
          expect(arr[1]).assertEqual(-7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_1600
         * @tc.name int32ArrayConstructorPart03TestMindmapTest016
         * @tc.desc Verify number buffer.byteLength 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          expect(arr.buffer.byteLength).assertEqual(0);
          expect(arr.byteLength).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_1700
         * @tc.name int32ArrayConstructorPart03TestMindmapTest017
         * @tc.desc Verify length Math.PI(3.14159) 3 3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3.14159);
          expect(arr.length).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_1800
         * @tc.name int32ArrayConstructorPart03TestMindmapTest018
         * @tc.desc Verify length 4294967296.0 RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          try {
            new Int32Array(4294967296.0);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_1900
         * @tc.name int32ArrayConstructorPart03TestMindmapTest019
         * @tc.desc Verify ArrayBuffer ArrayBuffer /4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let ab: ArrayBuffer = new ArrayBuffer(8);
          let arr: Int32Array = new Int32Array(ab);
          expect(arr.length).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_2000
         * @tc.name int32ArrayConstructorPart03TestMindmapTest020
         * @tc.desc Verify ArrayLike<Number> ArrayLike
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20] as Array<int>);
          expect(arr.length).assertEqual(2);
          expect(arr[0]).assertEqual(10);
          expect(arr[1]).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_2100
         * @tc.name int32ArrayConstructorPart03TestMindmapTest021
         * @tc.desc Verify 0 ArrayBuffer length=0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let ab: ArrayBuffer = new ArrayBuffer(0);
          let arr: Int32Array = new Int32Array(ab);
          expect(arr.length).assertEqual(0);
          expect(arr.byteLength).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_2200
         * @tc.name int32ArrayConstructorPart03TestMindmapTest022
         * @tc.desc Verify 4 ArrayBuffer length=1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let ab: ArrayBuffer = new ArrayBuffer(4);
          let arr: Int32Array = new Int32Array(ab);
          expect(arr.length).assertEqual(1);
          expect(arr.byteOffset).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_2300
         * @tc.name int32ArrayConstructorPart03TestMindmapTest023
         * @tc.desc Verify 12 ArrayBuffer length=3 byteLength=12
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let ab: ArrayBuffer = new ArrayBuffer(12);
          let arr: Int32Array = new Int32Array(ab);
          expect(arr.length).assertEqual(3);
          expect(arr.byteLength).assertEqual(12);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_2400
         * @tc.name int32ArrayConstructorPart03TestMindmapTest024
         * @tc.desc Verify 40 ArrayBuffer length=10
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let ab: ArrayBuffer = new ArrayBuffer(40);
          let arr: Int32Array = new Int32Array(ab);
          expect(arr.length).assertEqual(10);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_2500
         * @tc.name int32ArrayConstructorPart03TestMindmapTest025
         * @tc.desc Verify 5 4 ArrayBuffer RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          try {
            let ab: ArrayBuffer = new ArrayBuffer(5);
            new Int32Array(ab);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_2600
         * @tc.name int32ArrayConstructorPart03TestMindmapTest026
         * @tc.desc Verify 7 4 ArrayBuffer RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          try {
            let ab: ArrayBuffer = new ArrayBuffer(7);
            new Int32Array(ab);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_2700
         * @tc.name int32ArrayConstructorPart03TestMindmapTest027
         * @tc.desc Verify 1 ArrayBuffer RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          try {
            let ab: ArrayBuffer = new ArrayBuffer(1);
            new Int32Array(ab);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_2800
         * @tc.name int32ArrayConstructorPart03TestMindmapTest028
         * @tc.desc Verify 3 4 ArrayBuffer RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          try {
            let ab: ArrayBuffer = new ArrayBuffer(3);
            new Int32Array(ab);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_2900
         * @tc.name int32ArrayConstructorPart03TestMindmapTest029
         * @tc.desc Verify ArrayBuffer byteOffset 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let ab: ArrayBuffer = new ArrayBuffer(16);
          let arr: Int32Array = new Int32Array(ab);
          expect(arr.byteOffset).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_3000
         * @tc.name int32ArrayConstructorPart03TestMindmapTest030
         * @tc.desc Verify ArrayBuffer byteLength buffer byteLength
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let ab: ArrayBuffer = new ArrayBuffer(16);
          let arr: Int32Array = new Int32Array(ab);
          expect(arr.byteLength).assertEqual(ab.byteLength);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_3100
         * @tc.name int32ArrayConstructorPart03TestMindmapTest031
         * @tc.desc Verify 20 5 ArrayBuffer length=5
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let ab: ArrayBuffer = new ArrayBuffer(20);
          let arr: Int32Array = new Int32Array(ab);
          expect(arr.length).assertEqual(5);
          expect(arr.byteLength).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_3200
         * @tc.name int32ArrayConstructorPart03TestMindmapTest032
         * @tc.desc Verify buffer ArrayBuffer ===
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let ab: ArrayBuffer = new ArrayBuffer(8);
          let arr: Int32Array = new Int32Array(ab);
          expect(arr.buffer).assertEqual(ab);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_3300
         * @tc.name int32ArrayConstructorPart03TestMindmapTest033
         * @tc.desc Verify int32 buffer DataView
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let ab: ArrayBuffer = new ArrayBuffer(8);
          let arr: Int32Array = new Int32Array(ab);
          arr[0] = 1;
          let view: DataView = new DataView(ab);
          expect(view.getInt32(0, true)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_3400
         * @tc.name int32ArrayConstructorPart03TestMindmapTest034
         * @tc.desc Verify buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let ab: ArrayBuffer = new ArrayBuffer(8);
          let a: Int32Array = new Int32Array(ab);
          let b: Int32Array = new Int32Array(ab);
          a[1] = -99;
          expect(b[1]).assertEqual(-99);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_3500
         * @tc.name int32ArrayConstructorPart03TestMindmapTest035
         * @tc.desc Verify DataView Int32 Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let ab: ArrayBuffer = new ArrayBuffer(4);
          let dv: DataView = new DataView(ab);
          dv.setInt32(0, 1234567, true);
          let arr: Int32Array = new Int32Array(ab);
          expect(arr[0]).assertEqual(1234567);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_3600
         * @tc.name int32ArrayConstructorPart03TestMindmapTest036
         * @tc.desc Verify ArrayBuffer 0 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let ab: ArrayBuffer = new ArrayBuffer(12);
          let arr: Int32Array = new Int32Array(ab);
          expect(arr[0]).assertEqual(0);
          expect(arr[1]).assertEqual(0);
          expect(arr[2]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_3700
         * @tc.name int32ArrayConstructorPart03TestMindmapTest037
         * @tc.desc Verify INT_MAX buffer INT_MAX
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let ab: ArrayBuffer = new ArrayBuffer(4);
          let a: Int32Array = new Int32Array(ab);
          let b: Int32Array = new Int32Array(ab);
          a[0] = 2147483647;
          expect(b[0]).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_3800
         * @tc.name int32ArrayConstructorPart03TestMindmapTest038
         * @tc.desc Verify INT_MIN DataView unsigned 0x80000000
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let ab: ArrayBuffer = new ArrayBuffer(4);
          let arr: Int32Array = new Int32Array(ab);
          arr[0] = -2147483648;
          let dv: DataView = new DataView(ab);
          expect(dv.getUint32(0, true)).assertEqual(2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_3900
         * @tc.name int32ArrayConstructorPart03TestMindmapTest039
         * @tc.desc Verify ArrayBuffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let ab: ArrayBuffer = new ArrayBuffer(16);
          let a: Int32Array = new Int32Array(ab);
          let b: Int32Array = new Int32Array(ab);
          a[0] = 11;
          a[3] = 44;
          expect(b[0]).assertEqual(11);
          expect(b[3]).assertEqual(44);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_4000
         * @tc.name int32ArrayConstructorPart03TestMindmapTest040
         * @tc.desc Verify $_set []
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let ab: ArrayBuffer = new ArrayBuffer(8);
          let a: Int32Array = new Int32Array(ab);
          let b: Int32Array = new Int32Array(ab);
          a.$_set(0, 777);
          expect(b[0]).assertEqual(777);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_4100
         * @tc.name int32ArrayConstructorPart03TestMindmapTest041
         * @tc.desc Verify ArrayBuffer fill fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let ab: ArrayBuffer = new ArrayBuffer(12);
          let a: Int32Array = new Int32Array(ab);
          let b: Int32Array = new Int32Array(ab);
          a.fill(9);
          expect(b[0]).assertEqual(9);
          expect(b[1]).assertEqual(9);
          expect(b[2]).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_4200
         * @tc.name int32ArrayConstructorPart03TestMindmapTest042
         * @tc.desc Verify ArrayLike length=1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([99] as Array<int>);
          expect(arr.length).assertEqual(1);
          expect(arr[0]).assertEqual(99);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_4300
         * @tc.name int32ArrayConstructorPart03TestMindmapTest043
         * @tc.desc Verify ArrayLike length=0 Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([] as Array<int>);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_4400
         * @tc.name int32ArrayConstructorPart03TestMindmapTest044
         * @tc.desc Verify ArrayLike 0..length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 10, 20, 30] as Array<int>);
          expect(arr[0]).assertEqual(0);
          expect(arr[1]).assertEqual(10);
          expect(arr[2]).assertEqual(20);
          expect(arr[3]).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_4500
         * @tc.name int32ArrayConstructorPart03TestMindmapTest045
         * @tc.desc Verify ArrayLike get 0..length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 1, 2] as Array<int>);
          expect(arr.length).assertEqual(3);
          expect(arr[0]).assertEqual(0);
          expect(arr[1]).assertEqual(1);
          expect(arr[2]).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_4600
         * @tc.name int32ArrayConstructorPart03TestMindmapTest046
         * @tc.desc Verify ArrayLike length=6 index*2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 2, 4, 6, 8, 10] as Array<int>);
          expect(arr.length).assertEqual(6);
          expect(arr[5]).assertEqual(10);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_4700
         * @tc.name int32ArrayConstructorPart03TestMindmapTest047
         * @tc.desc Verify ArrayLike single element 2147483647 (INT_MAX)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2147483647] as Array<int>);
          expect(arr[0]).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_4800
         * @tc.name int32ArrayConstructorPart03TestMindmapTest048
         * @tc.desc Verify ArrayLike single element -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1] as Array<int>);
          expect(arr[0]).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_4900
         * @tc.name int32ArrayConstructorPart03TestMindmapTest049
         * @tc.desc Verify ArrayLike single element -2147483648 (INT_MIN)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-2147483648] as Array<int>);
          expect(arr[0]).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_5000
         * @tc.name int32ArrayConstructorPart03TestMindmapTest050
         * @tc.desc Verify ArrayLike three elements [0, 7, 0]
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 7, 0] as Array<int>);
          expect(arr[0]).assertEqual(0);
          expect(arr[1]).assertEqual(7);
          expect(arr[2]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_5100
         * @tc.name int32ArrayConstructorPart03TestMindmapTest051
         * @tc.desc Verify ArrayLike length 3 ToLength 3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 1, 2] as Array<int>);
          expect(arr.length).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_5200
         * @tc.name int32ArrayConstructorPart03TestMindmapTest052
         * @tc.desc Verify ArrayLike get length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5] as Array<int>);
          expect(arr.length).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_5300
         * @tc.name int32ArrayConstructorPart03TestMindmapTest053
         * @tc.desc Verify ArrayLike buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([1, 2] as Array<int>);
          let b: Int32Array = new Int32Array([1, 2] as Array<int>);
          a.$_set(0, 99);
          expect(b.$_get(0)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_5400
         * @tc.name int32ArrayConstructorPart03TestMindmapTest054
         * @tc.desc Verify ArrayLike byteOffset 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0] as Array<int>);
          expect(arr.byteOffset).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_5500
         * @tc.name int32ArrayConstructorPart03TestMindmapTest055
         * @tc.desc Verify ArrayLike byteLength length*4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0, 0] as Array<int>);
          expect(arr.byteLength).assertEqual(16);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_5600
         * @tc.name int32ArrayConstructorPart03TestMindmapTest056
         * @tc.desc Verify ArrayLike
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 5] as Array<int>);
          arr[0] = 999;
          expect(arr[0]).assertEqual(999);
          expect(arr[1]).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_5700
         * @tc.name int32ArrayConstructorPart03TestMindmapTest057
         * @tc.desc Verify ArrayLike -1 -100
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, -100] as Array<int>);
          expect(arr[0]).assertEqual(-1);
          expect(arr[1]).assertEqual(-100);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_5800
         * @tc.name int32ArrayConstructorPart03TestMindmapTest058
         * @tc.desc Verify ArrayLike / / / / ToInt32
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, -55, 2147483647, 2] as Array<int>);
          expect(arr[0]).assertEqual(0);
          expect(arr[1]).assertEqual(-55);
          expect(arr[2]).assertEqual(2147483647);
          expect(arr[3]).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_5900
         * @tc.name int32ArrayConstructorPart03TestMindmapTest059
         * @tc.desc Verify ArrayBuffer-backed Int32Array $_get(length) throws RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let ab: ArrayBuffer = new ArrayBuffer(8);
          let arr: Int32Array = new Int32Array(ab);
          try {
              arr.$_get(2);
              expect().assertFail();
          } catch (e) {
              expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART03_TEST_MINDMAP_6000
         * @tc.name int32ArrayConstructorPart03TestMindmapTest060
         * @tc.desc Verify constructing Int32Array from Array<int> with 1000 elements throws RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart03TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          try {
            let values: Array<int> = new Array<int>();
            for (let i = 0; i < 1000; i++) {
              values[i] = i % 7;
            }
            let arr: Int32Array = new Int32Array(values);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

  });
}
