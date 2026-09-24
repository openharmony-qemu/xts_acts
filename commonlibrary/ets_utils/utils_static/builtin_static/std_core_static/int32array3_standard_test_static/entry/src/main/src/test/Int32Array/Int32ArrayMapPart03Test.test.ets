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

export default function int32ArrayMapPart03TestMindmapTestTest(): void {
  describe('Int32ArrayMapPart03TestMindmapTestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_0100
     * @tc.name int32ArrayMapPart03TestMindmapTest001
     * @tc.desc Verify map rejects an undefined callback with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      try {
        a.map(undefined as (v: number, i: int, arr: Int32Array) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_0200
     * @tc.name int32ArrayMapPart03TestMindmapTest002
     * @tc.desc Verify map(undefined) throws exception for fn undefined illegal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      try {
        a.map(undefined as Object as (v: number, i: int, arr: Int32Array) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_0300
     * @tc.name int32ArrayMapPart03TestMindmapTest003
     * @tc.desc Verify map(42) throws exception for fn number illegal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      try {
        a.map(42 as Object as (v: number, i: int, arr: Int32Array) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_0400
     * @tc.name int32ArrayMapPart03TestMindmapTest004
     * @tc.desc Verify map(0) throws exception for fn number 0 illegal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1]);
      try {
        a.map(0 as Object as (v: number, i: int, arr: Int32Array) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_0500
     * @tc.name int32ArrayMapPart03TestMindmapTest005
     * @tc.desc Verify map(NaN) throws exception for fn NaN illegal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      try {
        a.map(Number.NaN as Object as (v: number, i: int, arr: Int32Array) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_0600
     * @tc.name int32ArrayMapPart03TestMindmapTest006
     * @tc.desc Verify map("not a function") throws exception for fn string illegal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      try {
        a.map('not a function' as Object as (v: number, i: int, arr: Int32Array) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_0700
     * @tc.name int32ArrayMapPart03TestMindmapTest007
     * @tc.desc Verify map("") throws exception for fn empty string illegal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      try {
        a.map('' as Object as (v: number, i: int, arr: Int32Array) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_0800
     * @tc.name int32ArrayMapPart03TestMindmapTest008
     * @tc.desc Verify map(true) throws exception for fn boolean true illegal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1]);
      try {
        a.map(true as Object as (v: number, i: int, arr: Int32Array) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_0900
     * @tc.name int32ArrayMapPart03TestMindmapTest009
     * @tc.desc Verify map({}) throws exception for fn Object illegal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let obj: Object = new Object();
      try {
        a.map(obj as Object as (v: number, i: int, arr: Int32Array) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_1000
     * @tc.name int32ArrayMapPart03TestMindmapTest010
     * @tc.desc Verify map([1,2]) throws exception for fn array illegal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let arr: number[] = [1, 2];
      try {
        a.map(arr as Object as (v: number, i: int, arr: Int32Array) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_1100
     * @tc.name int32ArrayMapPart03TestMindmapTest011
     * @tc.desc Verify callback throws Error at first element, exception propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      try {
        a.map((v: number, _i: int, _arr: Int32Array): number => {
          expect(v).assertEqual(1);
          throw new Error('first element throw');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_1200
     * @tc.name int32ArrayMapPart03TestMindmapTest012
     * @tc.desc Verify callback throws Error at middle element, exception propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let count: int = 0;
      try {
        a.map((v: number, _i: int, _arr: Int32Array): number => {
          count = count + 1;
          if (count === 3) {
            throw new Error('middle element throw');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_1300
     * @tc.name int32ArrayMapPart03TestMindmapTest013
     * @tc.desc Verify callback throws Error at last element, exception propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let calls: int = 0;
      try {
        a.map((v: number, _i: int, _arr: Int32Array): number => {
          calls = calls + 1;
          if (calls === 3) {
            throw new Error('last element throw');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_1400
     * @tc.name int32ArrayMapPart03TestMindmapTest014
     * @tc.desc Verify callback throws RangeError, propagated with name RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      try {
        a.map((v: number, _i: int, _arr: Int32Array): number => {
          expect(v).assertEqual(1);
          throw new RangeError('range error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_1500
     * @tc.name int32ArrayMapPart03TestMindmapTest015
     * @tc.desc Verify callback throws TypeError, propagated with name TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1]);
      try {
        a.map((v: number, _i: int, _arr: Int32Array): number => {
          expect(v).assertEqual(1);
          throw new TypeError('type error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_1600
     * @tc.name int32ArrayMapPart03TestMindmapTest016
     * @tc.desc Verify empty array map with throwing callback never throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => {
        throw new Error('should not be called');
      });
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_1700
     * @tc.name int32ArrayMapPart03TestMindmapTest017
     * @tc.desc Verify source array unchanged after callback throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([5, 6, 7, 8]);
      let snapshot0: number = a.$_get(0);
      let snapshot1: number = a.$_get(1);
      let snapshot2: number = a.$_get(2);
      let snapshot3: number = a.$_get(3);
      try {
        a.map((v: number, _i: int, _arr: Int32Array): number => {
          if (v === 7) {
            throw new Error('boom');
          }
          return v * 2;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(a.$_get(0)).assertEqual(snapshot0);
      expect(a.$_get(1)).assertEqual(snapshot1);
      expect(a.$_get(2)).assertEqual(snapshot2);
      expect(a.$_get(3)).assertEqual(snapshot3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_1800
     * @tc.name int32ArrayMapPart03TestMindmapTest018
     * @tc.desc Verify single element array callback throws at first (only) element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([42]);
      try {
        a.map((v: number, _i: int, _arr: Int32Array): number => {
          expect(v).assertEqual(42);
          throw new Error('single element throw');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_1900
     * @tc.name int32ArrayMapPart03TestMindmapTest019
     * @tc.desc Verify callback throw preserves message property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let errMsg: string = '';
      try {
        a.map((v: number, _i: int, _arr: Int32Array): number => {
          expect(v).assertEqual(1);
          throw new Error('unique-marker-xyz');
        });
      } catch (e) {
        errMsg = e.message;
        expect(e.name).assertEqual('Error');
      }
      expect(errMsg).assertEqual('unique-marker-xyz');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_2000
     * @tc.name int32ArrayMapPart03TestMindmapTest020
     * @tc.desc Verify callback throws at int32 minimum value element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-2147483648, 1]);
      try {
        a.map((v: number, _i: int, _arr: Int32Array): number => {
          if (v === -2147483648) {
            throw new Error('min int32 throw');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_2100
     * @tc.name int32ArrayMapPart03TestMindmapTest021
     * @tc.desc Verify callback without return writes 0 via ToInt32(undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => {
        let x: number = v + 1;
        return x;
      });
      expect(r.$_get(0)).assertEqual(2);
      expect(r.$_get(1)).assertEqual(3);
      expect(r.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_2200
     * @tc.name int32ArrayMapPart03TestMindmapTest022
     * @tc.desc Verify callback explicitly returns undefined, ToInt32 gives 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => 0);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_2300
     * @tc.name int32ArrayMapPart03TestMindmapTest023
     * @tc.desc Verify mixed return/undefined callback, even indices return val*10 odd return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = a.map((v: number, i: int, _arr: Int32Array): number => {
        if (i % 2 === 0) {
          return v * 10;
        }
        return 0;
      });
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(30);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_2400
     * @tc.name int32ArrayMapPart03TestMindmapTest024
     * @tc.desc Verify callback returns NaN, ToInt32 gives 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => Number.NaN);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_2500
     * @tc.name int32ArrayMapPart03TestMindmapTest025
     * @tc.desc Verify empty array map returns length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v + 1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_2600
     * @tc.name int32ArrayMapPart03TestMindmapTest026
     * @tc.desc Verify empty array map callback is never called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let callCount: int = 0;
      a.map((_v: number, _i: int, _arr: Int32Array): number => { callCount++; return 0; });
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_2700
     * @tc.name int32ArrayMapPart03TestMindmapTest027
     * @tc.desc Verify empty array map result BYTES_PER_ELEMENT still 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_2800
     * @tc.name int32ArrayMapPart03TestMindmapTest028
     * @tc.desc Verify single element array map callback val equals element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([77]);
      let seenVal: number = 0;
      a.map((v: number, _i: int, _arr: Int32Array): number => { seenVal = v; return v; });
      expect(seenVal).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_2900
     * @tc.name int32ArrayMapPart03TestMindmapTest029
     * @tc.desc Verify single element array map callback index is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-5]);
      let seenIdx: int = -99;
      a.map((_v: number, i: int, _arr: Int32Array): number => { seenIdx = i; return 0; });
      expect(seenIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_3000
     * @tc.name int32ArrayMapPart03TestMindmapTest030
     * @tc.desc Verify single element array map callback array param points to source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([99]);
      let sameRef: boolean = false;
      a.map((v: number, _i: int, arr: Int32Array): number => {
        sameRef = arr === a;
        return v;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_3100
     * @tc.name int32ArrayMapPart03TestMindmapTest031
     * @tc.desc Verify single element array map result first element equals callback return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([8]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v + 100);
      expect(r.$_get(0)).assertEqual(108);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_3200
     * @tc.name int32ArrayMapPart03TestMindmapTest032
     * @tc.desc Verify single element array map does not mutate source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([13]);
      a.map((v: number, _i: int, _arr: Int32Array): number => v * 3);
      expect(a.$_get(0)).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_3300
     * @tc.name int32ArrayMapPart03TestMindmapTest033
     * @tc.desc Verify all-zero array map callback called for each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0, 0, 0, 0]);
      let calls: int = 0;
      a.map((_v: number, _i: int, _arr: Int32Array): number => { calls++; return 0; });
      expect(calls).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_3400
     * @tc.name int32ArrayMapPart03TestMindmapTest034
     * @tc.desc Verify all-same-value array map each val equals the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([42, 42, 42]);
      let allMatch: boolean = true;
      a.map((v: number, _i: int, _arr: Int32Array): number => {
        if (v !== 42) {
          allMatch = false;
        }
        return v;
      });
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_3500
     * @tc.name int32ArrayMapPart03TestMindmapTest035
     * @tc.desc Verify all-same array identity map preserves each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([7, 7, 7, 7, 7]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(1)).assertEqual(7);
      expect(r.$_get(2)).assertEqual(7);
      expect(r.$_get(3)).assertEqual(7);
      expect(r.$_get(4)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_3600
     * @tc.name int32ArrayMapPart03TestMindmapTest036
     * @tc.desc Verify all-same array map val*2 transforms each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([5, 5, 5]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v * 2);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(1)).assertEqual(10);
      expect(r.$_get(2)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_3700
     * @tc.name int32ArrayMapPart03TestMindmapTest037
     * @tc.desc Verify all-same array map indices are strictly increasing 0,1,2,...,n-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0, 0, 0, 0]);
      let indices: int[] = [0, 0, 0, 0];
      let pos: int = 0;
      a.map((v: number, i: int, _arr: Int32Array): number => {
        indices[pos] = i;
        pos = pos + 1;
        return v;
      });
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
      expect(indices[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_3800
     * @tc.name int32ArrayMapPart03TestMindmapTest038
     * @tc.desc Verify all--1 array map callback sees val as -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-1, -1, -1]);
      let ok: boolean = true;
      a.map((v: number, _i: int, _arr: Int32Array): number => {
        if (v !== -1) {
          ok = false;
        }
        return v;
      });
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_3900
     * @tc.name int32ArrayMapPart03TestMindmapTest039
     * @tc.desc Verify 3-element array map callback val sequence [10,20,30] correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let vals: number[] = [0, 0, 0];
      let pos: int = 0;
      a.map((v: number, _i: int, _arr: Int32Array): number => {
        vals[pos] = v;
        pos = pos + 1;
        return v;
      });
      expect(vals[0]).assertEqual(10);
      expect(vals[1]).assertEqual(20);
      expect(vals[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_4000
     * @tc.name int32ArrayMapPart03TestMindmapTest040
     * @tc.desc Verify 3-element array map callback index sequence [0,1,2] correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let idxs: int[] = [0, 0, 0];
      let pos: int = 0;
      a.map((_v: number, i: int, _arr: Int32Array): number => {
        idxs[pos] = i;
        pos = pos + 1;
        return _v;
      });
      expect(idxs[0]).assertEqual(0);
      expect(idxs[1]).assertEqual(1);
      expect(idxs[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_4100
     * @tc.name int32ArrayMapPart03TestMindmapTest041
     * @tc.desc Verify map callback array param length equals source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      let seenLen: int = 0;
      a.map((v: number, _i: int, arr: Int32Array): number => {
        seenLen = arr.length;
        return v;
      });
      expect(seenLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_4200
     * @tc.name int32ArrayMapPart03TestMindmapTest042
     * @tc.desc Verify map callback array param BYTES_PER_ELEMENT is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let bpe: int = 0;
      a.map((v: number, _i: int, arr: Int32Array): number => {
        bpe = arr.BYTES_PER_ELEMENT;
        return v;
      });
      expect(bpe).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_4300
     * @tc.name int32ArrayMapPart03TestMindmapTest043
     * @tc.desc Verify map callback reads first element via array param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([100, 200, 300]);
      let firstSeen: number = 0;
      a.map((v: number, _i: int, arr: Int32Array): number => {
        firstSeen = arr.$_get(0);
        return v;
      });
      expect(firstSeen).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_4400
     * @tc.name int32ArrayMapPart03TestMindmapTest044
     * @tc.desc Verify map callback reads last element via array param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([100, 200, 300]);
      let lastSeen: number = 0;
      a.map((v: number, _i: int, arr: Int32Array): number => {
        lastSeen = arr.$_get(arr.length - 1);
        return v;
      });
      expect(lastSeen).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_4500
     * @tc.name int32ArrayMapPart03TestMindmapTest045
     * @tc.desc Verify map callback array param is strictly equal to external a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let isSame: boolean = true;
      a.map((v: number, _i: int, arr: Int32Array): number => {
        if (arr !== a) {
          isSame = false;
        }
        return v;
      });
      expect(isSame).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_4600
     * @tc.name int32ArrayMapPart03TestMindmapTest046
     * @tc.desc Verify map does not mutate source array elements [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      a.map((v: number, _i: int, _arr: Int32Array): number => v * 10);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_4700
     * @tc.name int32ArrayMapPart03TestMindmapTest047
     * @tc.desc Verify map does not change source array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      let origLen: int = a.length;
      a.map((v: number, _i: int, _arr: Int32Array): number => v + 1);
      expect(a.length).assertEqual(origLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_4800
     * @tc.name int32ArrayMapPart03TestMindmapTest048
     * @tc.desc Verify modifying result array does not affect source; Also verify verify modifying source after map does not affect result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      r.$_set(0, 999);
      expect(a.$_get(0)).assertEqual(1);

      {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v * 2);
      a.$_set(0, 999);
      expect(r.$_get(0)).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_4900
     * @tc.name int32ArrayMapPart03TestMindmapTest049
     * @tc.desc Verify map result byteOffset is 0 for new allocation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_5000
     * @tc.name int32ArrayMapPart03TestMindmapTest050
     * @tc.desc Verify map result byteLength equals length * 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v);
      expect(r.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_5100
     * @tc.name int32ArrayMapPart03TestMindmapTest051
     * @tc.desc Verify callback accessing at(-100) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let sawUndefined: boolean = false;
      a.map((v: number, i: int, arr: Int32Array): number => {
        if (i === 0) {
          let probeVal: number | undefined = arr.at(-100);
          if (probeVal === undefined) {
            sawUndefined = true;
          }
        }
        return v;
      });
      expect(sawUndefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_5200
     * @tc.name int32ArrayMapPart03TestMindmapTest052
     * @tc.desc Verify callback accessing at(length) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20]);
      let sawUndefined: boolean = false;
      a.map((v: number, i: int, arr: Int32Array): number => {
        if (i === 0) {
          let probeVal: number | undefined = arr.at(arr.length);
          if (probeVal === undefined) {
            sawUndefined = true;
          }
        }
        return v;
      });
      expect(sawUndefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_5300
     * @tc.name int32ArrayMapPart03TestMindmapTest053
     * @tc.desc Verify callback using negative index set throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let threw: boolean = false;
      a.map((v: number, i: int, arr: Int32Array): number => {
        if (i === 0) {
          try {
            arr.$_set(-1, 999);
          } catch (e) {
            threw = true;
            expect(e.name).assertEqual('RangeError');
          }
        }
        return v;
      });
      expect(threw).assertTrue();
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_5400
     * @tc.name int32ArrayMapPart03TestMindmapTest054
     * @tc.desc Verify callback returns NaN, ToInt32 writes 0 to result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => Number.NaN);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_5500
     * @tc.name int32ArrayMapPart03TestMindmapTest055
     * @tc.desc Verify callback returns +Infinity, ToInt32 writes 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => Number.POSITIVE_INFINITY);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_5600
     * @tc.name int32ArrayMapPart03TestMindmapTest056
     * @tc.desc Verify callback returns -Infinity, ToInt32 writes 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => Number.NEGATIVE_INFINITY);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_5700
     * @tc.name int32ArrayMapPart03TestMindmapTest057
     * @tc.desc Verify callback returns 3.7 truncated to 3 via ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => 3.7);
      expect(r.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_5800
     * @tc.name int32ArrayMapPart03TestMindmapTest058
     * @tc.desc Verify callback returns -3.7 truncated to -3 via ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => -3.7);
      expect(r.$_get(0)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_5900
     * @tc.name int32ArrayMapPart03TestMindmapTest059
     * @tc.desc Verify callback returns 2147483648 wraps to -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => 2147483648);
      expect(r.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_6000
     * @tc.name int32ArrayMapPart03TestMindmapTest060
     * @tc.desc Verify callback returns -2147483649 wraps to 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => -2147483649);
      expect(r.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_6100
     * @tc.name int32ArrayMapPart03TestMindmapTest061
     * @tc.desc Verify callback returns 4294967295 (0xFFFFFFFF) wraps to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1]);
      let r: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => 4294967295);
      expect(r.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_6200
     * @tc.name int32ArrayMapPart03TestMindmapTest062
     * @tc.desc Verify callback accumulates external counter sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let sum: number = 0;
      a.map((v: number, _i: int, _arr: Int32Array): number => { sum = sum + v; return v; });
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_6300
     * @tc.name int32ArrayMapPart03TestMindmapTest063
     * @tc.desc Verify callback closure increments external counter, result sequence correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0, 0, 0]);
      let counter: number = 10;
      let r: Int32Array = a.map((v: number, i: int, _arr: Int32Array): number => {
        counter = counter + 1;
        return counter;
      });
      expect(r.$_get(0)).assertEqual(11);
      expect(r.$_get(1)).assertEqual(12);
      expect(r.$_get(2)).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_6400
     * @tc.name int32ArrayMapPart03TestMindmapTest064
     * @tc.desc Verify callback returns index, result sequence [0,1,2,...,n-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40]);
      let r: Int32Array = a.map((v: number, i: int, _arr: Int32Array): number => i);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(2);
      expect(r.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART03_TEST_MINDMAP_6500
     * @tc.name int32ArrayMapPart03TestMindmapTest065
     * @tc.desc Verify callback returns index*val, result sequence index-weighted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart03TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = a.map((v: number, i: int, _arr: Int32Array): number => v * i);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(20);
      expect(r.$_get(2)).assertEqual(60);
    });
  });
}
