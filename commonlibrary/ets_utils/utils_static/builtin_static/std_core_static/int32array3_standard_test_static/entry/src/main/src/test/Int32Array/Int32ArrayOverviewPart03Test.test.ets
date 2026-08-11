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

export default function int32ArrayOverviewPart03TestMindmapTestTest(): void {
  describe('Int32ArrayOverviewPart03TestMindmapTestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_0100
     * @tc.name int32ArrayOverviewPart03TestMindmapTest001
     * @tc.desc Verify length=0 byteOffset=4 buffer>=8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf, 4, 0);
      expect(a.length).assertEqual(0);
      expect(a.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_0200
     * @tc.name int32ArrayOverviewPart03TestMindmapTest002
     * @tc.desc Verify byteOffset=-8 0 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Int32Array(buf, -8);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_0300
     * @tc.name int32ArrayOverviewPart03TestMindmapTest003
     * @tc.desc Verify length=0 byteOffset=1 RangeError length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        new Int32Array(buf, 1, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_0400
     * @tc.name int32ArrayOverviewPart03TestMindmapTest004
     * @tc.desc Verify $_get -2 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([42]);
      try {
        a.$_get(-2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_0500
     * @tc.name int32ArrayOverviewPart03TestMindmapTest005
     * @tc.desc Verify $_set 1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([42]);
      try {
        a.$_set(1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_0600
     * @tc.name int32ArrayOverviewPart03TestMindmapTest006
     * @tc.desc Verify $_set far negative index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20]);
      try {
        a.$_set(-100000, 77);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_0700
     * @tc.name int32ArrayOverviewPart03TestMindmapTest007
     * @tc.desc Verify $_set length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      try {
        a.$_set(5, 100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_0800
     * @tc.name int32ArrayOverviewPart03TestMindmapTest008
     * @tc.desc Verify at 1 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([42]);
      let v: number | undefined = a.at(1);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_0900
     * @tc.name int32ArrayOverviewPart03TestMindmapTest009
     * @tc.desc Verify at(length+100) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let v: number | undefined = a.at(103);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_1000
     * @tc.name int32ArrayOverviewPart03TestMindmapTest010
     * @tc.desc Verify with 1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([42]);
      try {
        a.with(1, 7);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_1100
     * @tc.name int32ArrayOverviewPart03TestMindmapTest011
     * @tc.desc Verify with -2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([42]);
      try {
        a.with(-2, 7);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_1200
     * @tc.name int32ArrayOverviewPart03TestMindmapTest012
     * @tc.desc Verify set length=1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let src: Int32Array = new Int32Array([1]);
      try {
        a.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_1300
     * @tc.name int32ArrayOverviewPart03TestMindmapTest013
     * @tc.desc Verify set offset length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let src: Int32Array = new Int32Array(0);
      a.set(src, 3);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_1400
     * @tc.name int32ArrayOverviewPart03TestMindmapTest014
     * @tc.desc Verify set number[] RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      let src: number[] = [1, 2, 3];
      try {
        a.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_1500
     * @tc.name int32ArrayOverviewPart03TestMindmapTest015
     * @tc.desc Verify set(TypedArray , offset=0) < RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      let src: Int32Array = new Int32Array([10, 20, 30]);
      try {
        a.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_1600
     * @tc.name int32ArrayOverviewPart03TestMindmapTest016
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let seen: number[] = [];
      try {
        a.forEach((v: number, _i: int, _arr: Int32Array): void => {
          seen.push(v);
          if (v === 20) {
            throw new Error('stop');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(seen.length).assertEqual(2);
      expect(seen[0]).assertEqual(10);
      expect(seen[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_1700
     * @tc.name int32ArrayOverviewPart03TestMindmapTest017
     * @tc.desc Verify map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      try {
        a.map((v: number, _i: int, _arr: Int32Array): number => {
          if (v === 3) {
            throw new Error('last');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_1800
     * @tc.name int32ArrayOverviewPart03TestMindmapTest018
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let called: int = 0;
      try {
        a.filter((_v: number, _i: int, _arr: Int32Array): boolean => {
          called++;
          throw new Error('first');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(called).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_1900
     * @tc.name int32ArrayOverviewPart03TestMindmapTest019
     * @tc.desc Verify find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      try {
        a.find((v: number, _i: int, _arr: Int32Array): boolean => {
          if (v === 2) {
            throw new Error('mid');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_2000
     * @tc.name int32ArrayOverviewPart03TestMindmapTest020
     * @tc.desc Verify findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let visited: int = 0;
      try {
        a.findLast((_v: number, _i: int, _arr: Int32Array): boolean => {
          visited++;
          throw new Error('lastFirst');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(visited).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_2100
     * @tc.name int32ArrayOverviewPart03TestMindmapTest021
     * @tc.desc Verify findIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([5, 10, 15]);
      try {
        a.findIndex((v: number, _i: int, _arr: Int32Array): boolean => {
          throw new Error('idx');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_2200
     * @tc.name int32ArrayOverviewPart03TestMindmapTest022
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([5, 10, 15]);
      try {
        a.findLastIndex((v: number, _i: int, _arr: Int32Array): boolean => {
          throw new Error('lastIdx');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_2300
     * @tc.name int32ArrayOverviewPart03TestMindmapTest023
     * @tc.desc Verify some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      try {
        a.some((v: number, _i: int, _arr: Int32Array): boolean => {
          if (v === 2) {
            throw new Error('some mid');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_2400
     * @tc.name int32ArrayOverviewPart03TestMindmapTest024
     * @tc.desc Verify every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      try {
        a.every((v: number, _i: int, _arr: Int32Array): boolean => {
          if (v === 3) {
            throw new Error('every last');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_2500
     * @tc.name int32ArrayOverviewPart03TestMindmapTest025
     * @tc.desc Verify reduce initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let steps: int = 0;
      try {
        a.reduce((_acc: number, _v: number, _i: int, _arr: Int32Array): number => {
          steps++;
          if (steps === 2) {
            throw new Error('reduce step2');
          }
          return 0;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(steps).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_2600
     * @tc.name int32ArrayOverviewPart03TestMindmapTest026
     * @tc.desc Verify reduceRight initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      try {
        a.reduceRight((acc: number, v: number, _i: int, _arr: Int32Array): number => {
          throw new Error('rr first');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_2700
     * @tc.name int32ArrayOverviewPart03TestMindmapTest027
     * @tc.desc Verify sort compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([3, 1, 2]);
      try {
        a.sort((_x: number, _y: number): int => {
          throw new Error('cmp err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_2800
     * @tc.name int32ArrayOverviewPart03TestMindmapTest028
     * @tc.desc Verify Int32Array.from mapfn mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2, 3];
      try {
        Int32Array.from(src, (v: number): number => {
          throw new Error('mapfn');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_2900
     * @tc.name int32ArrayOverviewPart03TestMindmapTest029
     * @tc.desc Verify reduceRight initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([99]);
      let called: int = 0;
      let r: number = a.reduceRight((acc: number, v: number, _i: int, _arr: Int32Array): number => {
        called++;
        return acc + v;
      }, 0);
      expect(r).assertEqual(99);
      expect(called).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_3000
     * @tc.name int32ArrayOverviewPart03TestMindmapTest030
     * @tc.desc Verify reduce initialValue initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let r: number = a.reduce((_acc: number, v: number, _i: int, _arr: Int32Array): number => v, 123);
      expect(r).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_3100
     * @tc.name int32ArrayOverviewPart03TestMindmapTest031
     * @tc.desc Verify map length=0 Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let b: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v * 2);
      expect(b.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_3200
     * @tc.name int32ArrayOverviewPart03TestMindmapTest032
     * @tc.desc Verify some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      expect(a.some((_v: number, _i: int, _arr: Int32Array): boolean => true)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_3300
     * @tc.name int32ArrayOverviewPart03TestMindmapTest033
     * @tc.desc Verify every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      expect(a.every((_v: number, _i: int, _arr: Int32Array): boolean => false)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_3400
     * @tc.name int32ArrayOverviewPart03TestMindmapTest034
     * @tc.desc Verify find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let r: number | undefined = a.find((_v: number, _i: int, _arr: Int32Array): boolean => true);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_3500
     * @tc.name int32ArrayOverviewPart03TestMindmapTest035
     * @tc.desc Verify findIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      expect(a.findIndex((_v: number, _i: int, _arr: Int32Array): boolean => true)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_3600
     * @tc.name int32ArrayOverviewPart03TestMindmapTest036
     * @tc.desc Verify findLastIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      expect(a.findLastIndex((_v: number, _i: int, _arr: Int32Array): boolean => true)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_3700
     * @tc.name int32ArrayOverviewPart03TestMindmapTest037
     * @tc.desc Verify lastIndexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      expect(a.lastIndexOf(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_3800
     * @tc.name int32ArrayOverviewPart03TestMindmapTest038
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      expect(a.join(',')).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_3900
     * @tc.name int32ArrayOverviewPart03TestMindmapTest039
     * @tc.desc Verify fill length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      a.fill(9);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_4000
     * @tc.name int32ArrayOverviewPart03TestMindmapTest040
     * @tc.desc Verify copyWithin length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      a.copyWithin(0, 0, 0);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_4100
     * @tc.name int32ArrayOverviewPart03TestMindmapTest041
     * @tc.desc Verify map 1 length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([7]);
      let c: int = 0;
      let b: Int32Array = a.map((_v: number, _i: int, _arr: Int32Array): number => {
        c++;
        return _v + 1;
      });
      expect(c).assertEqual(1);
      expect(b.length).assertEqual(1);
      expect(b.$_get(0)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_4200
     * @tc.name int32ArrayOverviewPart03TestMindmapTest042
     * @tc.desc Verify filter length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([5]);
      let b: Int32Array = a.filter((v: number, _i: int, _arr: Int32Array): boolean => true);
      expect(b.length).assertEqual(1);
      expect(b.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_4300
     * @tc.name int32ArrayOverviewPart03TestMindmapTest043
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([5]);
      let b: Int32Array = a.filter((v: number, _i: int, _arr: Int32Array): boolean => false);
      expect(b.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_4400
     * @tc.name int32ArrayOverviewPart03TestMindmapTest044
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([5]);
      a.fill(9);
      expect(a.$_get(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_4500
     * @tc.name int32ArrayOverviewPart03TestMindmapTest045
     * @tc.desc Verify slice(0,1) length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([42]);
      let b: Int32Array = a.slice(0, 1);
      expect(b.length).assertEqual(1);
      expect(b.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_4600
     * @tc.name int32ArrayOverviewPart03TestMindmapTest046
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([7, 7, 7]);
      a.reverse();
      expect(a.$_get(0)).assertEqual(7);
      expect(a.$_get(1)).assertEqual(7);
      expect(a.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_4700
     * @tc.name int32ArrayOverviewPart03TestMindmapTest047
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([5, 5, 5]);
      a.fill(5);
      expect(a.$_get(0)).assertEqual(5);
      expect(a.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_4800
     * @tc.name int32ArrayOverviewPart03TestMindmapTest048
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([3, 3, 3, 3]);
      let b: Int32Array = a.filter((v: number, _i: int, _arr: Int32Array): boolean => v === 3);
      expect(b.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_4900
     * @tc.name int32ArrayOverviewPart03TestMindmapTest049
     * @tc.desc Verify indexOf 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([9, 9, 9]);
      expect(a.indexOf(9)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_5000
     * @tc.name int32ArrayOverviewPart03TestMindmapTest050
     * @tc.desc Verify lastIndexOf fromIndex=1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([9, 9, 9]);
      expect(a.lastIndexOf(9, 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_5100
     * @tc.name int32ArrayOverviewPart03TestMindmapTest051
     * @tc.desc Verify some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([4, 4, 4, 4]);
      let c: int = 0;
      let r: boolean = a.some((_v: number, _i: int, _arr: Int32Array): boolean => {
        c++;
        return _v === 4;
      });
      expect(r).assertTrue();
      expect(c).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_5200
     * @tc.name int32ArrayOverviewPart03TestMindmapTest052
     * @tc.desc Verify every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([4, 4, 4]);
      let c: int = 0;
      let r: boolean = a.every((_v: number, _i: int, _arr: Int32Array): boolean => {
        c++;
        return _v === 4;
      });
      expect(r).assertTrue();
      expect(c).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_5300
     * @tc.name int32ArrayOverviewPart03TestMindmapTest053
     * @tc.desc Verify fill NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.fill(Number.NaN);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_5400
     * @tc.name int32ArrayOverviewPart03TestMindmapTest054
     * @tc.desc Verify of NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(Number.NaN, 1);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_5500
     * @tc.name int32ArrayOverviewPart03TestMindmapTest055
     * @tc.desc Verify from NaN ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [Number.NaN];
      let a: Int32Array = Int32Array.from(src);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_5600
     * @tc.name int32ArrayOverviewPart03TestMindmapTest056
     * @tc.desc Verify includes NaN 0 NaN ToInt32 0 false NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0, 1, 2]);
      expect(a.includes(Number.NaN)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_5700
     * @tc.name int32ArrayOverviewPart03TestMindmapTest057
     * @tc.desc Verify indexOf NaN -1 NaN !== NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0, 0, 0]);
      expect(a.indexOf(Number.NaN)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_5800
     * @tc.name int32ArrayOverviewPart03TestMindmapTest058
     * @tc.desc Verify indexOf fromIndex=-length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      expect(a.indexOf(10, -3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_5900
     * @tc.name int32ArrayOverviewPart03TestMindmapTest059
     * @tc.desc Verify indexOf fromIndex=-(length+1) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      expect(a.indexOf(10, -4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_6000
     * @tc.name int32ArrayOverviewPart03TestMindmapTest060
     * @tc.desc Verify indexOf fromIndex=length -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      expect(a.indexOf(30, 3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_6100
     * @tc.name int32ArrayOverviewPart03TestMindmapTest061
     * @tc.desc Verify lastIndexOf fromIndex=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 2]);
      expect(a.lastIndexOf(2, -1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_6200
     * @tc.name int32ArrayOverviewPart03TestMindmapTest062
     * @tc.desc Verify lastIndexOf fromIndex=-length 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([5, 6, 7]);
      expect(a.lastIndexOf(5, -3)).assertEqual(0);
      expect(a.lastIndexOf(7, -3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_6300
     * @tc.name int32ArrayOverviewPart03TestMindmapTest063
     * @tc.desc Verify includes fromIndex=length false 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      expect(a.includes(10, 3)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_6400
     * @tc.name int32ArrayOverviewPart03TestMindmapTest064
     * @tc.desc Verify includes fromIndex=-length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      expect(a.includes(10, -3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_6500
     * @tc.name int32ArrayOverviewPart03TestMindmapTest065
     * @tc.desc Verify slice begin=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let b: Int32Array = a.slice(-1);
      expect(b.length).assertEqual(1);
      expect(b.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_6600
     * @tc.name int32ArrayOverviewPart03TestMindmapTest066
     * @tc.desc Verify slice begin>=end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let b: Int32Array = a.slice(2, 1);
      expect(b.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_6700
     * @tc.name int32ArrayOverviewPart03TestMindmapTest067
     * @tc.desc Verify subarray begin>=end length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let b: Int32Array = a.subarray(2, 2);
      expect(b.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_6800
     * @tc.name int32ArrayOverviewPart03TestMindmapTest068
     * @tc.desc Verify subarray begin=-2 end 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40]);
      let b: Int32Array = a.subarray(-2);
      expect(b.length).assertEqual(2);
      expect(b.$_get(0)).assertEqual(30);
      expect(b.$_get(1)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_6900
     * @tc.name int32ArrayOverviewPart03TestMindmapTest069
     * @tc.desc Verify fill start=1 end=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      a.fill(9, 1, -1);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(9);
      expect(a.$_get(2)).assertEqual(9);
      expect(a.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_7000
     * @tc.name int32ArrayOverviewPart03TestMindmapTest070
     * @tc.desc Verify copyWithin target=-1 start=0 end=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40]);
      a.copyWithin(-1, 0, 1);
      expect(a.$_get(3)).assertEqual(10);
      expect(a.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART03_TEST_MINDMAP_7100
     * @tc.name int32ArrayOverviewPart03TestMindmapTest071
     * @tc.desc Verify copyWithin target=0 start=10 start length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart03TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      a.copyWithin(0, 10);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(2)).assertEqual(3);
    });
  });
}
