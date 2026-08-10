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
export default function int32ArrayConstructorPart01TestMindmapTestTest(): void {
  describe('Int32ArrayConstructorPart01TestMindmapTestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayConstructorPart01TestMindmapTest001
     * @tc.desc Verify arity=0 null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int32Array = new Int32Array();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayConstructorPart01TestMindmapTest002
     * @tc.desc Verify new Int32Array(5) length is 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int32Array = new Int32Array(5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayConstructorPart01TestMindmapTest003
     * @tc.desc Verify buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int32Array = new Int32Array();
      expect(arr.buffer.byteLength).assertEqual(0);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayConstructorPart01TestMindmapTest004
     * @tc.desc Verify for-of 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int32Array = new Int32Array();
      let count: int = 0;
      for (const v of arr) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayConstructorPart01TestMindmapTest005
     * @tc.desc Verify at(0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int32Array = new Int32Array();
      const v: number | undefined = arr.at(0);
      expect(v).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayConstructorPart01TestMindmapTest006
     * @tc.desc Verify $_get(0) throws RangeError on empty Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int32Array = new Int32Array();
      try {
        arr.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayConstructorPart01TestMindmapTest007
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int32Array = new Int32Array();
      expect(arr.join(',')).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayConstructorPart01TestMindmapTest008
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int32Array = new Int32Array();
      expect(arr.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayConstructorPart01TestMindmapTest009
     * @tc.desc Verify some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int32Array = new Int32Array();
      const r: boolean = arr.some((v, _i, _a) => { return true; });
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayConstructorPart01TestMindmapTest010
     * @tc.desc Verify every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int32Array = new Int32Array();
      const r: boolean = arr.every((v, _i, _a) => { return false; });
      expect(r).assertTrue();
    });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_1100
         * @tc.name int32ArrayConstructorPart01TestMindmapTest011
         * @tc.desc Verify indexOf -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const arr: Int32Array = new Int32Array();
          expect(arr.indexOf(0)).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_1200
         * @tc.name int32ArrayConstructorPart01TestMindmapTest012
         * @tc.desc Verify reduce initialValue TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const arr: Int32Array = new Int32Array();
          try {
            arr.reduce((acc, v, _i, _a) => { return acc + v; });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('TypeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_1300
         * @tc.name int32ArrayConstructorPart01TestMindmapTest013
         * @tc.desc Verify reduce with initialValue returns initialValue on empty Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const arr: Int32Array = new Int32Array();
          const result: number = arr.reduce((acc: number, v: number, _i: int, _a: Int32Array): number => { return acc + v; }, 99);
          expect(result).assertEqual(99);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_1400
         * @tc.name int32ArrayConstructorPart01TestMindmapTest014
         * @tc.desc Verify forEach
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const arr: Int32Array = new Int32Array();
          let count: int = 0;
          arr.forEach((_v: number, _i: int, _a: Int32Array): void => { count++; });
          expect(count).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_1500
         * @tc.name int32ArrayConstructorPart01TestMindmapTest015
         * @tc.desc Verify map Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const arr: Int32Array = new Int32Array();
          const r: Int32Array = arr.map((v: number, _i: int, _a: Int32Array): number => { return v + 1; });
          expect(r.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_1600
         * @tc.name int32ArrayConstructorPart01TestMindmapTest016
         * @tc.desc Verify filter Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const arr: Int32Array = new Int32Array();
          const r: Int32Array = arr.filter((_v: number, _i: int, _a: Int32Array): boolean => { return true; });
          expect(r.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_1700
         * @tc.name int32ArrayConstructorPart01TestMindmapTest017
         * @tc.desc Verify $_set(0,1) throws RangeError on empty Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const arr: Int32Array = new Int32Array();
          try {
            arr.$_set(0, 1);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_1800
         * @tc.name int32ArrayConstructorPart01TestMindmapTest018
         * @tc.desc Verify fill no-op length 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const arr: Int32Array = new Int32Array();
          arr.fill(99);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_1900
         * @tc.name int32ArrayConstructorPart01TestMindmapTest019
         * @tc.desc Verify slice() returns empty Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const arr: Int32Array = new Int32Array();
          const s: Int32Array = arr.slice();
          expect(s.length).assertEqual(0);
          expect(s.byteLength).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_2000
         * @tc.name int32ArrayConstructorPart01TestMindmapTest020
         * @tc.desc Verify subarray() buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const arr: Int32Array = new Int32Array();
          const s: Int32Array = arr.subarray();
          expect(s.length).assertEqual(0);
          expect(s.buffer).assertEqual(arr.buffer);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_2100
         * @tc.name int32ArrayConstructorPart01TestMindmapTest021
         * @tc.desc Verify includes false
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const arr: Int32Array = new Int32Array();
          expect(arr.includes(0)).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_2200
         * @tc.name int32ArrayConstructorPart01TestMindmapTest022
         * @tc.desc Verify (buf,0,0) null
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(0);
          const arr: Int32Array = new Int32Array(buf, 0, 0);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_2300
         * @tc.name int32ArrayConstructorPart01TestMindmapTest023
         * @tc.desc Verify Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(8);
          const arr: Int32Array = new Int32Array(buf, 0, 2);
          expect(arr.length).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_2400
         * @tc.name int32ArrayConstructorPart01TestMindmapTest024
         * @tc.desc Verify buf 4 ArrayBuffer length=1 length 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(4);
          const arr: Int32Array = new Int32Array(buf, 0, 1);
          expect(arr.length).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_2500
         * @tc.name int32ArrayConstructorPart01TestMindmapTest025
         * @tc.desc Verify buf 12 ArrayBuffer length=3 length 3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(12);
          const arr: Int32Array = new Int32Array(buf, 0, 3);
          expect(arr.length).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_2600
         * @tc.name int32ArrayConstructorPart01TestMindmapTest026
         * @tc.desc Verify 4 (5 ) length=0 byteOffset=0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(5);
          const arr: Int32Array = new Int32Array(buf, 0, 0);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_2700
         * @tc.name int32ArrayConstructorPart01TestMindmapTest027
         * @tc.desc Verify 4 (7 ) byteOffset=4 length=0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(7);
          const arr: Int32Array = new Int32Array(buf, 4, 0);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_2800
         * @tc.name int32ArrayConstructorPart01TestMindmapTest028
         * @tc.desc Verify byteOffset=0 length=1 byteOffset 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(4);
          const arr: Int32Array = new Int32Array(buf, 0, 1);
          expect(arr.byteOffset).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_2900
         * @tc.name int32ArrayConstructorPart01TestMindmapTest029
     * @tc.desc Verify byteOffset and BYTES_PER_ELEMENT for an offset buffer view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(8);
          const arr: Int32Array = new Int32Array(buf, 4, 1);
          expect(arr.byteOffset).assertEqual(4);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_3000
         * @tc.name int32ArrayConstructorPart01TestMindmapTest030
         * @tc.desc Verify byteOffset=8 length=1 buf=12 9
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(12);
          const arr: Int32Array = new Int32Array(buf, 8, 1);
          expect(arr.byteOffset).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_3100
         * @tc.name int32ArrayConstructorPart01TestMindmapTest031
         * @tc.desc Verify byteOffset=4 length=2 buf=12 5 2 8
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(12);
          const arr: Int32Array = new Int32Array(buf, 4, 2);
          expect(arr.byteOffset).assertEqual(4);
          expect(arr.length).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_3200
         * @tc.name int32ArrayConstructorPart01TestMindmapTest032
         * @tc.desc Verify byteOffset=1 4 RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(8);
          try {
            new Int32Array(buf, 1, 1);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_3300
         * @tc.name int32ArrayConstructorPart01TestMindmapTest033
         * @tc.desc Verify byteOffset=2 4 RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(8);
          try {
            new Int32Array(buf, 2, 1);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_3400
         * @tc.name int32ArrayConstructorPart01TestMindmapTest034
         * @tc.desc Verify byteOffset=3 4 RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(8);
          try {
            new Int32Array(buf, 3, 1);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_3500
         * @tc.name int32ArrayConstructorPart01TestMindmapTest035
         * @tc.desc Verify byteOffset=5 4 4 RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(12);
          try {
            new Int32Array(buf, 5, 1);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_3600
         * @tc.name int32ArrayConstructorPart01TestMindmapTest036
         * @tc.desc Verify byteOffset=-4 RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(8);
          try {
            new Int32Array(buf, -4, 1);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_3700
         * @tc.name int32ArrayConstructorPart01TestMindmapTest037
         * @tc.desc Verify byteOffset=-1 RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(8);
          try {
            new Int32Array(buf, -1, 1);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_3800
         * @tc.name int32ArrayConstructorPart01TestMindmapTest038
         * @tc.desc Verify byteOffset buf.byteLength length=0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(8);
          const arr: Int32Array = new Int32Array(buf, 8, 0);
          expect(arr.length).assertEqual(0);
          expect(arr.byteOffset).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_3900
         * @tc.name int32ArrayConstructorPart01TestMindmapTest039
         * @tc.desc Verify byteOffset=4 buf 4 length=0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(4);
          const arr: Int32Array = new Int32Array(buf, 4, 0);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_4000
         * @tc.name int32ArrayConstructorPart01TestMindmapTest040
         * @tc.desc Verify byteOffset buf.byteLength buf=8 offset=12 RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(8);
          try {
            new Int32Array(buf, 12, 0);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_4100
         * @tc.name int32ArrayConstructorPart01TestMindmapTest041
         * @tc.desc Verify byteOffset=4 buf=4 length=1 offset+4=8>4 RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(4);
          try {
            new Int32Array(buf, 4, 1);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_4200
         * @tc.name int32ArrayConstructorPart01TestMindmapTest042
         * @tc.desc Verify length=0 byteOffset=0 buf 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(8);
          const arr: Int32Array = new Int32Array(buf, 0, 0);
          expect(arr.length).assertEqual(0);
          expect(arr.byteLength).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_4300
         * @tc.name int32ArrayConstructorPart01TestMindmapTest043
         * @tc.desc Verify length=1 byteLength=4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(4);
          const arr: Int32Array = new Int32Array(buf, 0, 1);
          expect(arr.length).assertEqual(1);
          expect(arr.byteLength).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_4400
         * @tc.name int32ArrayConstructorPart01TestMindmapTest044
         * @tc.desc Verify length=2 byteLength=8
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(8);
          const arr: Int32Array = new Int32Array(buf, 0, 2);
          expect(arr.length).assertEqual(2);
          expect(arr.byteLength).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_4500
         * @tc.name int32ArrayConstructorPart01TestMindmapTest045
         * @tc.desc Verify length buffer buf=12 offset=4 length=2 8
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(12);
          const arr: Int32Array = new Int32Array(buf, 4, 2);
          expect(arr.length).assertEqual(2);
          expect(arr.byteLength).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_4600
         * @tc.name int32ArrayConstructorPart01TestMindmapTest046
         * @tc.desc Verify length=1 buf=8 offset=4 length=1 4 =1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(8);
          const arr: Int32Array = new Int32Array(buf, 4, 1);
          expect(arr.length).assertEqual(1);
          expect(arr.byteLength).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_4700
         * @tc.name int32ArrayConstructorPart01TestMindmapTest047
         * @tc.desc Verify length=-1 RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(8);
          try {
            new Int32Array(buf, 0, -1);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_4800
         * @tc.name int32ArrayConstructorPart01TestMindmapTest048
         * @tc.desc Verify length=-4 4 RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(16);
          try {
            new Int32Array(buf, 0, -4);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_4900
         * @tc.name int32ArrayConstructorPart01TestMindmapTest049
         * @tc.desc Verify buf=4 byteOffset=0 length=2 8 4 RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(4);
          try {
            new Int32Array(buf, 0, 2);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_5000
         * @tc.name int32ArrayConstructorPart01TestMindmapTest050
         * @tc.desc Verify buf=8 byteOffset=4 length=2 offset+8=12>8 RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(8);
          try {
            new Int32Array(buf, 4, 2);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_5100
         * @tc.name int32ArrayConstructorPart01TestMindmapTest051
         * @tc.desc Verify buf=12 byteOffset=8 length=2 offset+8=16>12 RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(12);
          try {
            new Int32Array(buf, 8, 2);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_5200
         * @tc.name int32ArrayConstructorPart01TestMindmapTest052
         * @tc.desc Verify byteOffset=0 length=0 buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(0);
          const arr: Int32Array = new Int32Array(buf, 0, 0);
          expect(arr.length).assertEqual(0);
          expect(arr.byteOffset).assertEqual(0);
          expect(arr.byteLength).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_5300
         * @tc.name int32ArrayConstructorPart01TestMindmapTest053
         * @tc.desc Verify byteOffset=8 length=1 12 buffer offset=8 4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(12);
          const arr: Int32Array = new Int32Array(buf, 8, 1);
          expect(arr.length).assertEqual(1);
          expect(arr.byteOffset).assertEqual(8);
          expect(arr.byteLength).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_5400
         * @tc.name int32ArrayConstructorPart01TestMindmapTest054
         * @tc.desc Verify byteOffset=4 buf=7 3 length=1 4 RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(7);
          try {
            new Int32Array(buf, 4, 1);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_5500
         * @tc.name int32ArrayConstructorPart01TestMindmapTest055
         * @tc.desc Verify byteOffset=0 buf=5 4 length=2 8 RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(5);
          try {
            new Int32Array(buf, 0, 2);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_5600
         * @tc.name int32ArrayConstructorPart01TestMindmapTest056
         * @tc.desc Verify byteOffset=4 length=0 buf=5 buf 4 offset=4 buf
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(5);
          const arr: Int32Array = new Int32Array(buf, 4, 0);
          expect(arr.length).assertEqual(0);
          expect(arr.byteOffset).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_5700
         * @tc.name int32ArrayConstructorPart01TestMindmapTest057
         * @tc.desc Verify buffer buf
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(8);
          const arr: Int32Array = new Int32Array(buf, 0, 2);
          expect(arr.buffer).assertEqual(buf);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_5800
         * @tc.name int32ArrayConstructorPart01TestMindmapTest058
         * @tc.desc Verify byteOffset buffer buf
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(12);
          const arr: Int32Array = new Int32Array(buf, 4, 2);
          expect(arr.buffer).assertEqual(buf);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_5900
         * @tc.name int32ArrayConstructorPart01TestMindmapTest059
         * @tc.desc Verify byteLength length*4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
    it('int32ArrayConstructorPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(24);
          const arr: Int32Array = new Int32Array(buf, 4, 3);
          expect(arr.byteLength).assertEqual(12);
          expect(arr.byteLength).assertEqual(arr.length * 4);
        });

        /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArrayConstructorPart01TestMindmapTest060
         * @tc.desc Verify buffer.byteLength buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
    it('int32ArrayConstructorPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(12);
          const arr: Int32Array = new Int32Array(buf, 4, 1);
          expect(arr.buffer.byteLength).assertEqual(12);
        });

        /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_6100
     * @tc.name int32ArrayConstructorPart01TestMindmapTest061
         * @tc.desc Verify 0 buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
    it('int32ArrayConstructorPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(8);
          const arr: Int32Array = new Int32Array(buf, 0, 2);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
        });

        /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_6200
     * @tc.name int32ArrayConstructorPart01TestMindmapTest062
         * @tc.desc Verify $_set(0,1) buffer offset
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
    it('int32ArrayConstructorPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(8);
          const a: Int32Array = new Int32Array(buf, 0, 2);
          const b: Int32Array = new Int32Array(buf, 0, 2);
          a.$_set(0, 1);
          expect(b.$_get(0)).assertEqual(1);
        });

        /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_6300
     * @tc.name int32ArrayConstructorPart01TestMindmapTest063
         * @tc.desc Verify offset=4 offset
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
    it('int32ArrayConstructorPart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(12);
          const a: Int32Array = new Int32Array(buf, 4, 2);
          const b: Int32Array = new Int32Array(buf, 4, 2);
          a.$_set(0, 77);
          expect(b.$_get(0)).assertEqual(77);
        });

        /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_6400
     * @tc.name int32ArrayConstructorPart01TestMindmapTest064
         * @tc.desc Verify (offset=0,len=2) 1 (offset=4,len=1) 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
    it('int32ArrayConstructorPart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(8);
          const parent: Int32Array = new Int32Array(buf, 0, 2);
          const child: Int32Array = new Int32Array(buf, 4, 1);
          parent.$_set(1, 333);
          expect(child.$_get(0)).assertEqual(333);
        });

        /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_6500
     * @tc.name int32ArrayConstructorPart01TestMindmapTest065
         * @tc.desc Verify (offset=4,len=1) (offset=0,len=2) 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
    it('int32ArrayConstructorPart01TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(8);
          const parent: Int32Array = new Int32Array(buf, 0, 2);
          const child: Int32Array = new Int32Array(buf, 4, 1);
          child.$_set(0, 555);
          expect(parent.$_get(1)).assertEqual(555);
        });

        /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_6600
     * @tc.name int32ArrayConstructorPart01TestMindmapTest066
         * @tc.desc Verify buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
    it('int32ArrayConstructorPart01TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(12);
          const a: Int32Array = new Int32Array(buf, 0, 1);
          const b: Int32Array = new Int32Array(buf, 4, 1);
          const c: Int32Array = new Int32Array(buf, 8, 1);
          a.$_set(0, 11);
          b.$_set(0, 22);
          c.$_set(0, 33);
          expect(a.$_get(0)).assertEqual(11);
          expect(b.$_get(0)).assertEqual(22);
          expect(c.$_get(0)).assertEqual(33);
        });

        /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_6700
     * @tc.name int32ArrayConstructorPart01TestMindmapTest067
         * @tc.desc Verify buffer buffer length=0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
    it('int32ArrayConstructorPart01TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(8);
          const full: Int32Array = new Int32Array(buf, 0, 2);
          const empty: Int32Array = new Int32Array(buf, 8, 0);
          full.$_set(0, 9);
          expect(empty.buffer).assertEqual(buf);
          expect(empty.length).assertEqual(0);
          expect(full.$_get(0)).assertEqual(9);
        });

        /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_6800
     * @tc.name int32ArrayConstructorPart01TestMindmapTest068
         * @tc.desc Verify INT_MAX(2147483647) buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
    it('int32ArrayConstructorPart01TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(4);
          const a: Int32Array = new Int32Array(buf, 0, 1);
          const b: Int32Array = new Int32Array(buf, 0, 1);
          a.$_set(0, 2147483647);
          expect(b.$_get(0)).assertEqual(2147483647);
        });

        /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_6900
     * @tc.name int32ArrayConstructorPart01TestMindmapTest069
         * @tc.desc Verify INT_MIN(-2147483648) buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
    it('int32ArrayConstructorPart01TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(4);
          const a: Int32Array = new Int32Array(buf, 0, 1);
          const b: Int32Array = new Int32Array(buf, 0, 1);
          a.$_set(0, -2147483648);
          expect(b.$_get(0)).assertEqual(-2147483648);
        });

        /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_7000
     * @tc.name int32ArrayConstructorPart01TestMindmapTest070
         * @tc.desc Verify fill(7) buffer 7
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
    it('int32ArrayConstructorPart01TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(8);
          const a: Int32Array = new Int32Array(buf, 0, 2);
          const b: Int32Array = new Int32Array(buf, 0, 2);
          a.fill(7);
          expect(b.$_get(0)).assertEqual(7);
          expect(b.$_get(1)).assertEqual(7);
        });

        /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_7100
     * @tc.name int32ArrayConstructorPart01TestMindmapTest071
         * @tc.desc Verify set(Int32Array ) buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
    it('int32ArrayConstructorPart01TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(8);
          const src: Int32Array = Int32Array.of(42, 43);
          const dst: Int32Array = new Int32Array(buf, 0, 2);
          const mirror: Int32Array = new Int32Array(buf, 0, 2);
          dst.set(src);
          expect(mirror.$_get(0)).assertEqual(42);
          expect(mirror.$_get(1)).assertEqual(43);
        });

        /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_7200
     * @tc.name int32ArrayConstructorPart01TestMindmapTest072
         * @tc.desc Verify reverse buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
    it('int32ArrayConstructorPart01TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(8);
          const a: Int32Array = new Int32Array(buf, 0, 2);
          a.$_set(0, 1);
          a.$_set(1, 2);
          const b: Int32Array = new Int32Array(buf, 0, 2);
          b.reverse();
          expect(a.$_get(0)).assertEqual(2);
          expect(a.$_get(1)).assertEqual(1);
        });

        /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_7300
     * @tc.name int32ArrayConstructorPart01TestMindmapTest073
         * @tc.desc Verify ArrayBuffer buf buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
    it('int32ArrayConstructorPart01TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(8);
          const arr: Int32Array = new Int32Array(buf, 0, 2);
          const origBuf: ArrayBuffer = buf;
          buf = new ArrayBuffer(16);
          expect(arr.buffer).assertEqual(origBuf);
          expect(arr.buffer.byteLength).assertEqual(8);
        });

        /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_7400
     * @tc.name int32ArrayConstructorPart01TestMindmapTest074
         * @tc.desc Verify (offset=4)fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
    it('int32ArrayConstructorPart01TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(8);
          const parent: Int32Array = new Int32Array(buf, 0, 2);
          const child: Int32Array = new Int32Array(buf, 4, 1);
          parent.$_set(0, 100);
          child.fill(200);
          expect(parent.$_get(0)).assertEqual(100);
          expect(parent.$_get(1)).assertEqual(200);
        });

        /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_7500
     * @tc.name int32ArrayConstructorPart01TestMindmapTest075
         * @tc.desc Verify buffer(1024 ) offset=0 length=256 length=256
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
    it('int32ArrayConstructorPart01TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const buf: ArrayBuffer = new ArrayBuffer(1024);
          const arr: Int32Array = new Int32Array(buf, 0, 256);
          expect(arr.length).assertEqual(256);
          expect(arr.byteLength).assertEqual(1024);
        });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART01_TEST_MINDMAP_7600
     * @tc.name int32ArrayConstructorPart01TestMindmapTest076
     * @tc.desc Verify buffer(1024 )offset=1020 length=1 int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart01TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(1024);
      const arr: Int32Array = new Int32Array(buf, 1020, 1);
      expect(arr.length).assertEqual(1);
      expect(arr.byteOffset).assertEqual(1020);
    });

  });
}
