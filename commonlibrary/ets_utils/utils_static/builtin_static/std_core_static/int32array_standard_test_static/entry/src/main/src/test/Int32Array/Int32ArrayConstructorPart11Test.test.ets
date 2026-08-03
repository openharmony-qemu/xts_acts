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
class Gen_077 {
  values: Iterable<number> = [5, 0, 7];
}
export default function int32ArrayConstructorPart11TestMindmapTestTest(): void {
  describe('Int32ArrayConstructorPart11TestMindmapTestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_0100
     * @tc.name int32ArrayConstructorPart11TestMindmapTest001
     * @tc.desc Verify 0 length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int32Array();
      const b = new Int32Array(0);
      expect(a.length).assertEqual(0);
      expect(b.length).assertEqual(0);
      expect(a.byteLength).assertEqual(0);
      expect(b.byteLength).assertEqual(0);
      expect(a.buffer.byteLength).assertEqual(0);
      expect(b.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_0200
     * @tc.name int32ArrayConstructorPart11TestMindmapTest002
     * @tc.desc Verify buffer 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int32Array();
      expect(a.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_0300
     * @tc.name int32ArrayConstructorPart11TestMindmapTest003
     * @tc.desc Verify 1(int) length:int length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int32Array(1);
      expect(a.length).assertEqual(1);
      expect(a.BYTES_PER_ELEMENT).assertEqual(4);
      expect(a.byteLength).assertEqual(4);
      expect(a.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_0400
     * @tc.name int32ArrayConstructorPart11TestMindmapTest004
     * @tc.desc Verify 2 length:number length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 2;
      const a = new Int32Array(off);
      expect(a.length).assertEqual(2);
      expect(a.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_0500
     * @tc.name int32ArrayConstructorPart11TestMindmapTest005
     * @tc.desc Verify 2.9 length:number ToInteger 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 2.9;
      const a = new Int32Array(off);
      expect(a.length).assertEqual(2);
      expect(a.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_0600
     * @tc.name int32ArrayConstructorPart11TestMindmapTest006
     * @tc.desc Verify -0 length:number -0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = -0;
      const a = new Int32Array(off);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_0700
     * @tc.name int32ArrayConstructorPart11TestMindmapTest007
     * @tc.desc Verify FixedArray<int> FixedArray<E> Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [10, 20, 30];
      const a = new Int32Array(fa);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_0800
     * @tc.name int32ArrayConstructorPart11TestMindmapTest008
     * @tc.desc Verify FixedArray<number> FixedArray<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn: FixedArray<number> = [1, 2.7, 3];
      const a = new Int32Array(fn);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_0900
     * @tc.name int32ArrayConstructorPart11TestMindmapTest009
     * @tc.desc Verify Array<int> Array<int> ToNumber
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ai: Array<int> = [100, 200, -300];
      const a = new Int32Array(ai);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(100);
      expect(a.$_get(1)).assertEqual(200);
      expect(a.$_get(2)).assertEqual(-300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_1000
     * @tc.name int32ArrayConstructorPart11TestMindmapTest010
     * @tc.desc Verify Set<Number> Iterable<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Number>();
      s.add(1);
      s.add(2);
      s.add(3);
      const a = new Int32Array(s);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_1100
     * @tc.name int32ArrayConstructorPart11TestMindmapTest011
     * @tc.desc Verify ArrayBuffer buf:ArrayLike<Number>|ArrayBuffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const a = new Int32Array(buf);
      expect(a.length).assertEqual(3);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_1200
     * @tc.name int32ArrayConstructorPart11TestMindmapTest012
     * @tc.desc Verify ArrayBuffer+int (buf,byteOffset:int) length /4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Int32Array(buf, 4);
      expect(a.byteOffset).assertEqual(4);
      expect(a.length).assertEqual(3);
      expect(a.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_1300
     * @tc.name int32ArrayConstructorPart11TestMindmapTest013
     * @tc.desc Verify ArrayBuffer+number (buf,byteOffset:number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const off: number = 4;
      const a = new Int32Array(buf, off);
      expect(a.byteOffset).assertEqual(4);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_1400
     * @tc.name int32ArrayConstructorPart11TestMindmapTest014
     * @tc.desc Verify ArrayBuffer+int +int (buf,byteOffset:int,length:int)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const a = new Int32Array(buf, 4, 2);
      expect(a.byteOffset).assertEqual(4);
      expect(a.length).assertEqual(2);
      expect(a.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_1500
     * @tc.name int32ArrayConstructorPart11TestMindmapTest015
     * @tc.desc Verify ArrayBuffer+undefined+undefined (buf, byteOffset?:number|undefined, length?:number|undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const a = new Int32Array(buf, undefined, undefined);
      expect(a.byteOffset).assertEqual(0);
      expect(a.length).assertEqual(3);
      expect(a.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_1600
     * @tc.name int32ArrayConstructorPart11TestMindmapTest016
     * @tc.desc Verify ArrayBuffer+int +undefined length /4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const a = new Int32Array(buf, 8, undefined);
      expect(a.byteOffset).assertEqual(8);
      expect(a.length).assertEqual(3);
      expect(a.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_1700
     * @tc.name int32ArrayConstructorPart11TestMindmapTest017
     * @tc.desc Verify ArrayBuffer+undefined +int byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const a = new Int32Array(buf, undefined, 3);
      expect(a.byteOffset).assertEqual(0);
      expect(a.length).assertEqual(3);
      expect(a.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_1800
     * @tc.name int32ArrayConstructorPart11TestMindmapTest018
     * @tc.desc Verify BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int32Array();
      const b = new Int32Array(3);
      const c = new Int32Array(new ArrayBuffer(12));
      const fa: FixedArray<int> = [1, 2];
      const d = new Int32Array(fa);
      expect(a.BYTES_PER_ELEMENT).assertEqual(4);
      expect(b.BYTES_PER_ELEMENT).assertEqual(4);
      expect(c.BYTES_PER_ELEMENT).assertEqual(4);
      expect(d.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_1900
     * @tc.name int32ArrayConstructorPart11TestMindmapTest019
     * @tc.desc Verify buf byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int32Array();
      const b = new Int32Array(4);
      const fa: FixedArray<int> = [1];
      const c = new Int32Array(fa);
      const ai: Array<int> = [1, 2];
      const d = new Int32Array(ai);
      expect(a.byteOffset).assertEqual(0);
      expect(b.byteOffset).assertEqual(0);
      expect(c.byteOffset).assertEqual(0);
      expect(d.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_2000
     * @tc.name int32ArrayConstructorPart11TestMindmapTest020
     * @tc.desc Verify length(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Int32Array(2);
      expect(b.$_get(0)).assertEqual(0);
      expect(b.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_2100
     * @tc.name int32ArrayConstructorPart11TestMindmapTest021
     * @tc.desc Verify new Int32Array(-2) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Int32Array(-2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_2200
     * @tc.name int32ArrayConstructorPart11TestMindmapTest022
     * @tc.desc Verify length:number -1 -1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const v: number = -1;
        new Int32Array(v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_2300
     * @tc.name int32ArrayConstructorPart11TestMindmapTest023
     * @tc.desc Verify (buf, byteOffset:int) 1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Int32Array(new ArrayBuffer(8), 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_2400
     * @tc.name int32ArrayConstructorPart11TestMindmapTest024
     * @tc.desc Verify (buf, byteOffset:int) 2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Int32Array(new ArrayBuffer(8), 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_2500
     * @tc.name int32ArrayConstructorPart11TestMindmapTest025
     * @tc.desc Verify (buf, byteOffset:int) 3 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Int32Array(new ArrayBuffer(8), 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_2600
     * @tc.name int32ArrayConstructorPart11TestMindmapTest026
     * @tc.desc Verify (buf, byteOffset:int) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Int32Array(new ArrayBuffer(8), -4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_2700
     * @tc.name int32ArrayConstructorPart11TestMindmapTest027
     * @tc.desc Verify (buf, byteOffset:number) 1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const v: number = 1;
        new Int32Array(new ArrayBuffer(8), v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_2800
     * @tc.name int32ArrayConstructorPart11TestMindmapTest028
     * @tc.desc Verify constructing Int32Array from ArrayBuffer with invalid byteOffset throws RangeError and source array is unaffected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [10, 20, 30];
      try {
        new Int32Array(new ArrayBuffer(4), 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(src.length).assertEqual(3);
      expect(src[0]).assertEqual(10);
      expect(src[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_2900
     * @tc.name int32ArrayConstructorPart11TestMindmapTest029
     * @tc.desc Verify instanceof Int32Array true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int32Array();
      const b = new Int32Array(1);
      const v: number = 1;
      const c = new Int32Array(v);
      const fa: FixedArray<int> = [1];
      const d = new Int32Array(fa);
      const fn: FixedArray<number> = [1];
      const e = new Int32Array(fn);
      const ai: Array<int> = [1];
      const f = new Int32Array(ai);
      const g = new Int32Array(new ArrayBuffer(4));
      expect(a.length).assertEqual(0);
      expect(b.length).assertEqual(1);
      expect(b.$_get(0)).assertEqual(0);
      expect(c.length).assertEqual(1);
      expect(c.$_get(0)).assertEqual(0);
      expect(d.length).assertEqual(1);
      expect(d.$_get(0)).assertEqual(1);
      expect(e.length).assertEqual(1);
      expect(e.$_get(0)).assertEqual(1);
      expect(f.length).assertEqual(1);
      expect(f.$_get(0)).assertEqual(1);
      expect(g.length).assertEqual(1);
      expect(g.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_3000
     * @tc.name int32ArrayConstructorPart11TestMindmapTest030
     * @tc.desc Verify toString "0" 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int32Array();
      expect(a.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_3100
     * @tc.name int32ArrayConstructorPart11TestMindmapTest031
     * @tc.desc Verify toString length=3 "0,0,0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int32Array(3);
      expect(a.toString()).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_3200
     * @tc.name int32ArrayConstructorPart11TestMindmapTest032
     * @tc.desc Verify FixedArray<int> toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [1, -2, 3];
      const a = new Int32Array(fa);
      expect(a.toString()).assertEqual('1,-2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_3300
     * @tc.name int32ArrayConstructorPart11TestMindmapTest033
     * @tc.desc Verify ArrayBuffer toString 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const w = new Int32Array(buf);
      w.$_set(0, 42);
      w.$_set(1, -7);
      const r = new Int32Array(buf);
      expect(r.toString()).assertEqual('42,-7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_3400
     * @tc.name int32ArrayConstructorPart11TestMindmapTest034
     * @tc.desc Verify length:int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int32Array(2);
      a.$_set(0, 100);
      a.$_set(1, -200);
      expect(a.$_get(0)).assertEqual(100);
      expect(a.$_get(1)).assertEqual(-200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_3500
     * @tc.name int32ArrayConstructorPart11TestMindmapTest035
     * @tc.desc Verify FixedArray FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [10, 20];
      const a = new Int32Array(fa);
      a.$_set(0, 999);
      expect(fa[0]).assertEqual(10);
      expect(a.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_3600
     * @tc.name int32ArrayConstructorPart11TestMindmapTest036
     * @tc.desc Verify Array<int> Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ai: Array<int> = [10, 20];
      const a = new Int32Array(ai);
      a.$_set(0, 888);
      expect(ai[0]).assertEqual(10);
      expect(a.$_get(0)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_3700
     * @tc.name int32ArrayConstructorPart11TestMindmapTest037
     * @tc.desc Verify Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int32Array(2);
      src.$_set(0, 55);
      src.$_set(1, 66);
      const cp = new Int32Array(src);
      cp.$_set(0, 777);
      expect(src.$_get(0)).assertEqual(55);
      expect(cp.$_get(0)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_3800
     * @tc.name int32ArrayConstructorPart11TestMindmapTest038
     * @tc.desc Verify ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const valFirst = new Int32Array(buf, 0, 3);
      const valSecond = new Int32Array(buf, 0, 3);
      valFirst.$_set(1, 12345);
      expect(valSecond.$_get(1)).assertEqual(12345);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_3900
     * @tc.name int32ArrayConstructorPart11TestMindmapTest039
     * @tc.desc Verify offset=4 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const valFirst = new Int32Array(buf, 0, 4);
      const valSecond = new Int32Array(buf, 4, 3);
      valSecond.$_set(0, 777);
      expect(valFirst.$_get(1)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_4000
     * @tc.name int32ArrayConstructorPart11TestMindmapTest040
     * @tc.desc Verify v1[0] v2 offset=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const valFirst = new Int32Array(buf, 0, 4);
      const valSecond = new Int32Array(buf, 4, 3);
      valFirst.$_set(0, 999);
      expect(valSecond.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_4100
     * @tc.name int32ArrayConstructorPart11TestMindmapTest041
     * @tc.desc Verify ArrayBuffer DataView-like
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const full = new Int32Array(buf);
      const half = new Int32Array(buf, 4);
      full.$_set(1, -55);
      expect(half.$_get(0)).assertEqual(-55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_4200
     * @tc.name int32ArrayConstructorPart11TestMindmapTest042
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const valFirst = new Int32Array(buf, 0, 2);
      const valSecond = new Int32Array(buf, 8, 2);
      valFirst.$_set(0, 11);
      valFirst.$_set(1, 22);
      valSecond.$_set(0, 33);
      valSecond.$_set(1, 44);
      expect(valFirst.$_get(0)).assertEqual(11);
      expect(valFirst.$_get(1)).assertEqual(22);
      expect(valSecond.$_get(0)).assertEqual(33);
      expect(valSecond.$_get(1)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_4300
     * @tc.name int32ArrayConstructorPart11TestMindmapTest043
     * @tc.desc Verify byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const v = new Int32Array(buf, 8);
      expect(v.byteOffset).assertEqual(8);
      expect(v.byteLength).assertEqual(12);
      expect(v.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_4400
     * @tc.name int32ArrayConstructorPart11TestMindmapTest044
     * @tc.desc Verify Int32Array(other) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int32Array(2);
      src.$_set(0, 1);
      src.$_set(1, 2);
      const cp = new Int32Array(src);
      cp.$_set(0, 99);
      expect(src.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_4500
     * @tc.name int32ArrayConstructorPart11TestMindmapTest045
     * @tc.desc Verify FixedArray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [5];
      const a = new Int32Array(fa);
      const b = new Int32Array(fa);
      a.$_set(0, 99);
      expect(b.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_4600
     * @tc.name int32ArrayConstructorPart11TestMindmapTest046
     * @tc.desc Verify Iterable<number> buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Number>();
      s.add(1);
      const a = new Int32Array(s);
      const b = new Int32Array(s);
      a.$_set(0, 999);
      expect(b.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_4700
     * @tc.name int32ArrayConstructorPart11TestMindmapTest047
     * @tc.desc Verify Array<int> buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ai: Array<int> = [7];
      const a = new Int32Array(ai);
      const b = new Int32Array(ai);
      a.$_set(0, 111);
      expect(b.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_4800
     * @tc.name int32ArrayConstructorPart11TestMindmapTest048
     * @tc.desc Verify undefined / ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const v = new Int32Array(buf, undefined, undefined);
      v.$_set(0, 100);
      v.$_set(2, 300);
      const valFirst = new Int32Array(buf);
      expect(valFirst.$_get(0)).assertEqual(100);
      expect(valFirst.$_get(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_4900
     * @tc.name int32ArrayConstructorPart11TestMindmapTest049
     * @tc.desc Verify length(0) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int32Array();
      const b = new Int32Array(0);
      expect(a.length).assertEqual(0);
      expect(b.length).assertEqual(0);
      expect(a.byteLength).assertEqual(0);
      expect(b.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_5000
     * @tc.name int32ArrayConstructorPart11TestMindmapTest050
     * @tc.desc Verify ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const valFirst = new Int32Array(buf, 0, 2);
      const valSecond = new Int32Array(buf, 8, 2);
      expect(valFirst.buffer).assertEqual(valSecond.buffer);
      expect(valFirst.buffer).assertEqual(buf);
      expect(valSecond.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_5100
     * @tc.name int32ArrayConstructorPart11TestMindmapTest051
     * @tc.desc Verify (buf,byteOffset:number) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const off: number = 4;
      const v = new Int32Array(buf, off);
      expect(v.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_5200
     * @tc.name int32ArrayConstructorPart11TestMindmapTest052
     * @tc.desc Verify buffer buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const v = new Int32Array(buf, 4, 2);
      expect(v.buffer).assertEqual(buf);
      expect(v.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_5300
     * @tc.name int32ArrayConstructorPart11TestMindmapTest053
     * @tc.desc Verify length(0) FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int32Array(0);
      const fe: FixedArray<int> = [];
      const b = new Int32Array(fe);
      expect(a.length).assertEqual(0);
      expect(b.length).assertEqual(0);
      expect(a.byteLength).assertEqual(0);
      expect(b.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_5400
     * @tc.name int32ArrayConstructorPart11TestMindmapTest054
     * @tc.desc Verify FixedArray<number> Number.NaN ToInt32(Number.NaN)=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn: FixedArray<number> = [Double.NaN];
      const a = new Int32Array(fn);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_5500
     * @tc.name int32ArrayConstructorPart11TestMindmapTest055
     * @tc.desc Verify FixedArray<number> +Number.POSITIVE_INFINITY ToInt32=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn: FixedArray<number> = [Double.POSITIVE_INFINITY];
      const a = new Int32Array(fn);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_5600
     * @tc.name int32ArrayConstructorPart11TestMindmapTest056
     * @tc.desc Verify FixedArray<number> Double.NEGATIVE_INFINITY ToInt32=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn: FixedArray<number> = [Double.NEGATIVE_INFINITY];
      const a = new Int32Array(fn);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_5700
     * @tc.name int32ArrayConstructorPart11TestMindmapTest057
     * @tc.desc Verify FixedArray<number> 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn: FixedArray<number> = [0];
      const a = new Int32Array(fn);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_5800
     * @tc.name int32ArrayConstructorPart11TestMindmapTest058
     * @tc.desc Verify FixedArray<number> -0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn: FixedArray<number> = [-0];
      const a = new Int32Array(fn);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_5900
     * @tc.name int32ArrayConstructorPart11TestMindmapTest059
     * @tc.desc Verify FixedArray<number> 2147483647.9 INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn: FixedArray<number> = [2147483647.9];
      const a = new Int32Array(fn);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_6000
     * @tc.name int32ArrayConstructorPart11TestMindmapTest060
     * @tc.desc Verify FixedArray<number> 2147483648 INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn: FixedArray<number> = [2147483648.0];
      const a = new Int32Array(fn);
      expect(a.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_6100
     * @tc.name int32ArrayConstructorPart11TestMindmapTest061
     * @tc.desc Verify FixedArray<number> 2147483649 -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn: FixedArray<number> = [2147483649.0];
      const a = new Int32Array(fn);
      expect(a.$_get(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_6200
     * @tc.name int32ArrayConstructorPart11TestMindmapTest062
     * @tc.desc Verify FixedArray<number> -2147483649 INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn: FixedArray<number> = [-2147483649.0];
      const a = new Int32Array(fn);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_6300
     * @tc.name int32ArrayConstructorPart11TestMindmapTest063
     * @tc.desc Verify FixedArray<number> 4294967296(2^32) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn: FixedArray<number> = [4294967296.0];
      const a = new Int32Array(fn);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_6400
     * @tc.name int32ArrayConstructorPart11TestMindmapTest064
     * @tc.desc Verify Iterable<number> Set Number.NaN ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Number>();
      s.add(Double.NaN);
      s.add(2147483648.0);
      const a = new Int32Array(s);
      expect(a.length).assertEqual(2);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_6500
     * @tc.name int32ArrayConstructorPart11TestMindmapTest065
     * @tc.desc Verify Array<int> INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ai: Array<int> = [-2147483648, 2147483647];
      const a = new Int32Array(ai);
      expect(a.$_get(0)).assertEqual(-2147483648);
      expect(a.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_6600
     * @tc.name int32ArrayConstructorPart11TestMindmapTest066
     * @tc.desc Verify ArrayLike<Number> {length,0,1}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [10, 20];
      const a = new Int32Array(src);
      expect(a.length).assertEqual(2);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_6700
     * @tc.name int32ArrayConstructorPart11TestMindmapTest067
     * @tc.desc Verify Iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int32Array(new Gen_077().values);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(5);
      expect(a.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_6800
     * @tc.name int32ArrayConstructorPart11TestMindmapTest068
     * @tc.desc Verify (buf,0,length) (buf)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const w = new Int32Array(buf, 0, 4);
      w.$_set(0, 1);
      w.$_set(1, 2);
      w.$_set(2, 3);
      w.$_set(3, 4);
      const r = new Int32Array(buf);
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_6900
     * @tc.name int32ArrayConstructorPart11TestMindmapTest069
     * @tc.desc Verify (buf,byteOffset:number)4 (buf,byteOffset:int)4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const wOff: number = 4;
      const w = new Int32Array(buf, wOff);
      w.$_set(0, 77);
      const r = new Int32Array(buf, 4, 1);
      expect(r.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_7000
     * @tc.name int32ArrayConstructorPart11TestMindmapTest070
     * @tc.desc Verify Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const w = new Int32Array(buf);
      w.$_set(0, 2147483647);
      w.$_set(1, -2147483648);
      const r = new Int32Array(buf);
      expect(r.$_get(0)).assertEqual(2147483647);
      expect(r.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_7100
     * @tc.name int32ArrayConstructorPart11TestMindmapTest071
     * @tc.desc Verify byteLength === length * 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int32Array();
      const b = new Int32Array(5);
      const fa: FixedArray<int> = [1, 2, 3];
      const c = new Int32Array(fa);
      const ai: Array<int> = [1, 2, 3, 4];
      const d = new Int32Array(ai);
      const fn: FixedArray<number> = [1];
      const e = new Int32Array(fn);
      const s = new Set<Number>();
      s.add(1);
      s.add(2);
      const f = new Int32Array(s);
      const g = new Int32Array(new ArrayBuffer(24));
      const h = new Int32Array(new ArrayBuffer(24), 4);
      const i = new Int32Array(new ArrayBuffer(24), 8, 2);
      expect(a.byteLength).assertEqual(a.length * 4);
      expect(b.byteLength).assertEqual(b.length * 4);
      expect(c.byteLength).assertEqual(c.length * 4);
      expect(d.byteLength).assertEqual(d.length * 4);
      expect(e.byteLength).assertEqual(e.length * 4);
      expect(f.byteLength).assertEqual(f.length * 4);
      expect(g.byteLength).assertEqual(g.length * 4);
      expect(h.byteLength).assertEqual(h.length * 4);
      expect(i.byteLength).assertEqual(i.length * 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_7200
     * @tc.name int32ArrayConstructorPart11TestMindmapTest072
     * @tc.desc Verify buf byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int32Array(new ArrayBuffer(12));
      const b = new Int32Array(new ArrayBuffer(12), 4);
      const c = new Int32Array(new ArrayBuffer(20), 8, 2);
      const d = new Int32Array(new ArrayBuffer(16), 0, 3);
      expect(a.byteOffset % 4).assertEqual(0);
      expect(b.byteOffset % 4).assertEqual(0);
      expect(c.byteOffset % 4).assertEqual(0);
      expect(d.byteOffset % 4).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART11_TEST_MINDMAP_7300
     * @tc.name int32ArrayConstructorPart11TestMindmapTest073
     * @tc.desc Verify buf byteLength length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart11TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int32Array(3);
      const fa: FixedArray<int> = [1, 2];
      const b = new Int32Array(fa);
      expect(a.buffer.byteLength).assertEqual(12);
      expect(b.buffer.byteLength).assertEqual(8);
    });
  });
}
