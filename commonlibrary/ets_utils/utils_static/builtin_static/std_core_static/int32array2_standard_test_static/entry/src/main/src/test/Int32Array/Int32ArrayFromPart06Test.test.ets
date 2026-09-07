'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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

export default function int32ArrayFromPart06Test(): void {
  describe('Int32ArrayFromPart06Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_0100
     * @tc.name int32ArrayFromPart06TestMindmapTest001
     * @tc.desc Verify from() applies mapfn and returns the mapped element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Int32Array = Int32Array.from([7] as number[], (v: number, k: number): number => {
        return v + k;
      });
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_0200
     * @tc.name int32ArrayFromPart06TestMindmapTest002
     * @tc.desc Verify from() ArrayLike<number> ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let plain: Array<number> = [1, 2];
      let r: Int32Array = Int32Array.from(plain as ArrayLike<number>);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_0300
     * @tc.name int32ArrayFromPart06TestMindmapTest003
     * @tc.desc Verify from() returns an empty Int32Array from an empty number source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Int32Array = Int32Array.from([] as number[]);
      expect(r.length).assertEqual(0);
      expect(r.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_0400
     * @tc.name int32ArrayFromPart06TestMindmapTest004
     * @tc.desc Verify from() maps the number 9 to 18
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Int32Array = Int32Array.from([9] as number[], (v: number, k: number): number => {
        return v * 2;
      });
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_0500
     * @tc.name int32ArrayFromPart06TestMindmapTest005
     * @tc.desc Verify from() maps three numbers by adding 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Int32Array = Int32Array.from([1, 2, 3] as number[], (v: number, k: number): number => {
        return v + 10;
      });
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(11);
      expect(r.$_get(1)).assertEqual(12);
      expect(r.$_get(2)).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_0600
     * @tc.name int32ArrayFromPart06TestMindmapTest006
     * @tc.desc Verify from() empty source length 0, mapfn is not called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: number = 0;
      let r: Int32Array = Int32Array.from([] as number[]);
      expect(r.length).assertEqual(0);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_0700
     * @tc.name int32ArrayFromPart06TestMindmapTest007
     * @tc.desc Verify from() two-element source length 2, mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cc: number = 0;
      let r: Int32Array = Int32Array.from(['a', 'b'] as string[], (v: string, k: number): number => {
        cc = cc + 1;
        expect(v.length).assertEqual(1);
        return k;
      });
      expect(r.length).assertEqual(2);
      expect(cc).assertEqual(2);
      expect(r.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_0800
     * @tc.name int32ArrayFromPart06TestMindmapTest008
     * @tc.desc Verify from() U boolean,mapfn true/false 1/0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Int32Array = Int32Array.from([true, false] as boolean[], (v: boolean, k: number): number => {
        return v ? 1 : 0;
      });
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_0900
     * @tc.name int32ArrayFromPart06TestMindmapTest009
     * @tc.desc Verify from() U number,mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3, 4];
      let r: Int32Array = Int32Array.from<number>(src as ArrayLike<number>, (v: number, k: number): number => {
        return v * v;
      });
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(9);
      expect(r.$_get(3)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_1000
     * @tc.name int32ArrayFromPart06TestMindmapTest010
     * @tc.desc Verify from() U Item,mapfn val
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Int32Array = Int32Array.from([5, -3] as number[], (v: number, k: number): number => {
        return v;
      });
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(5);
      expect(r.$_get(1)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_1100
     * @tc.name int32ArrayFromPart06TestMindmapTest011
     * @tc.desc Verify from() Array<string> ArrayLike<string> ,mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['10', '20', '30'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        return Number(v) + k;
      });
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(1)).assertEqual(21);
      expect(r.$_get(2)).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_1200
     * @tc.name int32ArrayFromPart06TestMindmapTest012
     * @tc.desc Verify from maps string elements to 1 and -99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Int32Array = Int32Array.from(['a', 'b', 'c'] as string[], (v: string, k: number): number => {
        return v === 'a' ? 1 : -99;
      });
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(-99);
      expect(r.$_get(2)).assertEqual(-99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_1300
     * @tc.name int32ArrayFromPart06TestMindmapTest013
     * @tc.desc Verify from preserves 100 with an identity mapping function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Int32Array = Int32Array.from([100] as number[], (v: number, k: number): number => {
        return v;
      });
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_1400
     * @tc.name int32ArrayFromPart06TestMindmapTest014
     * @tc.desc Verify from() k 0 ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['a', 'b', 'c', 'd'];
      let ks: Array<number> = [];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v.length).assertEqual(1);
        ks.push(k);
        return k;
      });
      expect(ks.length).assertEqual(4);
      expect(ks[0]).assertEqual(0);
      expect(ks[1]).assertEqual(1);
      expect(ks[2]).assertEqual(2);
      expect(ks[3]).assertEqual(3);
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_1500
     * @tc.name int32ArrayFromPart06TestMindmapTest015
     * @tc.desc Verify from() mapfn k ,v+k
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [10, 20];
      let r: Int32Array = Int32Array.from<number>(src as ArrayLike<number>, (v: number, k: number): number => {
        return v + k;
      });
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(1)).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_1600
     * @tc.name int32ArrayFromPart06TestMindmapTest016
     * @tc.desc Verify from() ArrayLike mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cc: number = 0;
      let r: Int32Array = Int32Array.from([] as number[]);
      expect(cc).assertEqual(0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_1700
     * @tc.name int32ArrayFromPart06TestMindmapTest017
     * @tc.desc Verify from() ArrayLike mapfn k=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ks: Array<number> = [];
      let r: Int32Array = Int32Array.from(['x'] as string[], (v: string, k: number): number => {
        expect(v).assertEqual('x');
        ks.push(k);
        return 0;
      });
      expect(ks.length).assertEqual(1);
      expect(ks[0]).assertEqual(0);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_1800
     * @tc.name int32ArrayFromPart06TestMindmapTest018
     * @tc.desc Verify from() v ArrayLike
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['hello', 'world'];
      let vs: Array<string> = [];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        vs.push(v);
        return v.length;
      });
      expect(vs[0]).assertEqual('hello');
      expect(vs[1]).assertEqual('world');
      expect(r.$_get(0)).assertEqual(5);
      expect(r.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_1900
     * @tc.name int32ArrayFromPart06TestMindmapTest019
     * @tc.desc Verify from() v number , ToInt32 mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [3.14, 2.71];
      let r: Int32Array = Int32Array.from<number>(src as ArrayLike<number>, (v: number, k: number): number => {
        return v;
      });
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_2000
     * @tc.name int32ArrayFromPart06TestMindmapTest020
     * @tc.desc Verify from() v boolean ,mapfn true/false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Int32Array = Int32Array.from([true, false] as boolean[], (v: boolean, k: number): number => {
        return v ? 77 : -77;
      });
      expect(r.$_get(0)).assertEqual(77);
      expect(r.$_get(1)).assertEqual(-77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_2100
     * @tc.name int32ArrayFromPart06TestMindmapTest021
     * @tc.desc Verify from maps 1 and 0 to 1 and -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Int32Array = Int32Array.from([1, 0] as number[], (v: number, k: number): number => {
        return v === 1 ? 1 : -1;
      });
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_2200
     * @tc.name int32ArrayFromPart06TestMindmapTest022
     * @tc.desc Verify from() mapfn Number.NaN ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['x'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v).assertEqual('x');
        return Number.NaN;
      });
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_2300
     * @tc.name int32ArrayFromPart06TestMindmapTest023
     * @tc.desc Verify from() mapfn +Number.POSITIVE_INFINITY ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['x'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v).assertEqual('x');
        return Number.POSITIVE_INFINITY;
      });
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_2400
     * @tc.name int32ArrayFromPart06TestMindmapTest024
     * @tc.desc Verify from() mapfn -Number.POSITIVE_INFINITY ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['x'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v).assertEqual('x');
        return -Number.POSITIVE_INFINITY;
      });
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_2500
     * @tc.name int32ArrayFromPart06TestMindmapTest025
     * @tc.desc Verify from() mapfn 0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['x'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v).assertEqual('x');
        return 0.5;
      });
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_2600
     * @tc.name int32ArrayFromPart06TestMindmapTest026
     * @tc.desc Verify from() mapfn -0.9 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['x'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v).assertEqual('x');
        return -0.9;
      });
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_2700
     * @tc.name int32ArrayFromPart06TestMindmapTest027
     * @tc.desc Verify from() mapfn INT_MAX 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['x'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v).assertEqual('x');
        return 2147483647;
      });
      expect(r.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_2800
     * @tc.name int32ArrayFromPart06TestMindmapTest028
     * @tc.desc Verify from() mapfn INT_MIN -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['x'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v).assertEqual('x');
        return -2147483648;
      });
      expect(r.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_2900
     * @tc.name int32ArrayFromPart06TestMindmapTest029
     * @tc.desc Verify from() mapfn 2147483647.9 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['x'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v).assertEqual('x');
        return 2147483647.9;
      });
      expect(r.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_3000
     * @tc.name int32ArrayFromPart06TestMindmapTest030
     * @tc.desc Verify from() mapfn 2147483648 INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['x'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v).assertEqual('x');
        return 2147483648;
      });
      expect(r.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_3100
     * @tc.name int32ArrayFromPart06TestMindmapTest031
     * @tc.desc Verify from() mapfn 2147483649 -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['x'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v).assertEqual('x');
        return 2147483649;
      });
      expect(r.$_get(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_3200
     * @tc.name int32ArrayFromPart06TestMindmapTest032
     * @tc.desc Verify from() mapfn -2147483649 INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['x'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v).assertEqual('x');
        return -2147483649;
      });
      expect(r.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_3300
     * @tc.name int32ArrayFromPart06TestMindmapTest033
     * @tc.desc Verify from() mapfn 4294967296(2^32) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['x'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v).assertEqual('x');
        return 4294967296;
      });
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_3400
     * @tc.name int32ArrayFromPart06TestMindmapTest034
     * @tc.desc Verify from() mapfn -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['x'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v).assertEqual('x');
        return -1;
      });
      expect(r.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_3500
     * @tc.name int32ArrayFromPart06TestMindmapTest035
     * @tc.desc Verify from() mapfn 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['x'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v).assertEqual('x');
        return 0;
      });
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_3600
     * @tc.name int32ArrayFromPart06TestMindmapTest036
     * @tc.desc Verify from() mapfn 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['x'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v).assertEqual('x');
        return 42;
      });
      expect(r.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_3700
     * @tc.name int32ArrayFromPart06TestMindmapTest037
     * @tc.desc Verify from() mapfn -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['x'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v).assertEqual('x');
        return -100;
      });
      expect(r.$_get(0)).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_3800
     * @tc.name int32ArrayFromPart06TestMindmapTest038
     * @tc.desc Verify from() mapfn 0xFF 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['x'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v).assertEqual('x');
        return 0xFF;
      });
      expect(r.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_3900
     * @tc.name int32ArrayFromPart06TestMindmapTest039
     * @tc.desc Verify from() mapfn 0b1010 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['x'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v).assertEqual('x');
        return 0b1010;
      });
      expect(r.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_4000
     * @tc.name int32ArrayFromPart06TestMindmapTest040
     * @tc.desc Verify from() mapfn 1.0e2 100, 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['x'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v).assertEqual('x');
        return 1.0e2;
      });
      expect(r.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_4100
     * @tc.name int32ArrayFromPart06TestMindmapTest041
     * @tc.desc Verify from() mapfn base
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: number = 100;
      let src: Array<string> = ['a', 'b'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v.length).assertEqual(1);
        return base + k;
      });
      expect(r.$_get(0)).assertEqual(100);
      expect(r.$_get(1)).assertEqual(101);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_4200
     * @tc.name int32ArrayFromPart06TestMindmapTest042
     * @tc.desc Verify from() mapfn sum, length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['a', 'b', 'c'];
      let sum: number = 0;
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v.length).assertEqual(1);
        sum = sum + 1;
        return k;
      });
      expect(sum).assertEqual(3);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_4300
     * @tc.name int32ArrayFromPart06TestMindmapTest043
     * @tc.desc Verify from() mapfn (v, k) (k, v)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['x'];
      let gotV: string = '';
      let gotK: number = -1;
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        gotV = v;
        gotK = k;
        return 0;
      });
      expect(gotV).assertEqual('x');
      expect(gotK).assertEqual(0);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_4400
     * @tc.name int32ArrayFromPart06TestMindmapTest044
     * @tc.desc Verify from() mapfn 0 ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Int32Array.from(['a', 'b', 'c'] as string[], (v: string, k: number): number => {
          expect(v.length).assertEqual(1);
          throw new Error('mapfn-err-0');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_4500
     * @tc.name int32ArrayFromPart06TestMindmapTest045
     * @tc.desc Verify from() mapfn (k=2) ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cc: number = 0;
      try {
        Int32Array.from(['a', 'b', 'c', 'd', 'e'] as string[], (v: string, k: number): number => {
          cc = cc + 1;
          expect(v.length).assertEqual(1);
          if (k === 2) {
            throw new Error('mid-err');
          }
          return k;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(cc).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_4600
     * @tc.name int32ArrayFromPart06TestMindmapTest046
     * @tc.desc Verify from() mapfn (k=3) ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cc: number = 0;
      try {
        Int32Array.from(['a', 'b', 'c', 'd'] as string[], (v: string, k: number): number => {
          cc = cc + 1;
          expect(v.length).assertEqual(1);
          if (k === 3) {
            throw new Error('last-err');
          }
          return k;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(cc).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_4700
     * @tc.name int32ArrayFromPart06TestMindmapTest047
     * @tc.desc Verify from() mapfn name RangeError e.name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Int32Array.from(['a'] as string[], (v: string, k: number): number => {
          expect(v).assertEqual('a');
          let err: Error = new Error('range');
          err.name = 'RangeError';
          throw err;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_4800
     * @tc.name int32ArrayFromPart06TestMindmapTest048
     * @tc.desc Verify from maps a string element to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Int32Array = Int32Array.from(['a'] as string[], (v: string, k: number): number => {
        expect(v).assertEqual('a');
        return 0;
      });
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_4900
     * @tc.name int32ArrayFromPart06TestMindmapTest049
     * @tc.desc Verify from() with string source and mapfn that converts to number preserves element and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['1'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        return Number(v);
      });
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_5000
     * @tc.name int32ArrayFromPart06TestMindmapTest050
     * @tc.desc Verify from() BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['1'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        return Number(v);
      });
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_5100
     * @tc.name int32ArrayFromPart06TestMindmapTest051
     * @tc.desc Verify from() byteLength length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['a', 'b', 'c'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v.length).assertEqual(1);
        return k;
      });
      expect(r.byteLength).assertEqual(12);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_5200
     * @tc.name int32ArrayFromPart06TestMindmapTest052
     * @tc.desc Verify from() byteOffset 0( buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['a', 'b'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v.length).assertEqual(1);
        return k;
      });
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_5300
     * @tc.name int32ArrayFromPart06TestMindmapTest053
     * @tc.desc Verify from() ArrayBuffer ,byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['a', 'b'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v.length).assertEqual(1);
        return k;
      });
      expect(r.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_5400
     * @tc.name int32ArrayFromPart06TestMindmapTest054
     * @tc.desc Verify from() with string array and mapfn returning element length produces correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Int32Array = Int32Array.from(['a', 'b'] as string[], (v: string, k: number): number => {
        return v.length;
      });
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_5500
     * @tc.name int32ArrayFromPart06TestMindmapTest055
     * @tc.desc Verify from() ArrayLike Int32Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Int32Array = Int32Array.from([] as number[]);
      expect(r.length).assertEqual(0);
      expect(r.byteLength).assertEqual(0);
      expect(r.byteOffset).assertEqual(0);
      expect(r.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_5600
     * @tc.name int32ArrayFromPart06TestMindmapTest056
     * @tc.desc Verify from() mapfn (k*10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['a', 'b', 'c', 'd', 'e'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v.length).assertEqual(1);
        return k * 10;
      });
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(10);
      expect(r.$_get(2)).assertEqual(20);
      expect(r.$_get(3)).assertEqual(30);
      expect(r.$_get(4)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_5700
     * @tc.name int32ArrayFromPart06TestMindmapTest057
     * @tc.desc Verify chained from() with type-parameterized mapfns transforms elements through each stage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['1', '2', '3'];
      let r1: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        return Number(v);
      });
      let r2: Int32Array = Int32Array.from<number>(r1 as ArrayLike<number>, (v: number, k: number): number => {
        return v * 2;
      });
      expect(r2.length).assertEqual(3);
      expect(r2.$_get(0)).assertEqual(2);
      expect(r2.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_5800
     * @tc.name int32ArrayFromPart06TestMindmapTest058
     * @tc.desc Verify from() mapfn -0 +0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['a', 'b'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v.length).assertEqual(1);
        return k === 0 ? -0 : 0;
      });
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_5900
     * @tc.name int32ArrayFromPart06TestMindmapTest059
     * @tc.desc Verify from() with Int32Array source and mapfn creates result with independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = Int32Array.from<number>(src as ArrayLike<number>, (v: number, k: number): number => {
        return v + 1;
      });
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(11);
      expect(r.$_get(2)).assertEqual(31);
      expect(r.buffer).not().assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_6000
     * @tc.name int32ArrayFromPart06TestMindmapTest060
     * @tc.desc Verify mapfn sees source mutations made during iteration by earlier calls to mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2, 3]);
      let seen: Array<number> = [];
      let r: Int32Array = Int32Array.from<number>(src as ArrayLike<number>, (v: number, k: number): number => {
        seen.push(v);
        if (k === 0) {
          src.$_set(1, 99);
        }
        return v;
      });
      expect(seen[0]).assertEqual(1);
      expect(seen[1]).assertEqual(99);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(99);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_6100
     * @tc.name int32ArrayFromPart06TestMindmapTest061
     * @tc.desc Verify from() with number array and identity mapfn preserves all element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Int32Array = Int32Array.from([10, 20, 30] as number[], (v: number, k: number): number => {
        return v;
      });
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(1)).assertEqual(20);
      expect(r.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_6200
     * @tc.name int32ArrayFromPart06TestMindmapTest062
     * @tc.desc Verify from() mapfn Number('') 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['a'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v).assertEqual('a');
        return Number('');
      });
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_6300
     * @tc.name int32ArrayFromPart06TestMindmapTest063
     * @tc.desc Verify from() mapfn -1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['a'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v).assertEqual('a');
        return -1000000;
      });
      expect(r.$_get(0)).assertEqual(-1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_6400
     * @tc.name int32ArrayFromPart06TestMindmapTest064
     * @tc.desc Verify from() mapfn 0o777 511
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['a'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v).assertEqual('a');
        return 0o777;
      });
      expect(r.$_get(0)).assertEqual(511);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_6500
     * @tc.name int32ArrayFromPart06TestMindmapTest065
     * @tc.desc Verify from() INT_MAX/INT_MIN/2147483648/-2147483649
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['a', 'b', 'c', 'd'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v.length).assertEqual(1);
        if (k === 0) {
          return 2147483647;
        }
        if (k === 1) {
          return -2147483648;
        }
        if (k === 2) {
          return 2147483648;
        }
        return -2147483649;
      });
      expect(r.$_get(0)).assertEqual(2147483647);
      expect(r.$_get(1)).assertEqual(-2147483648);
      expect(r.$_get(2)).assertEqual(-2147483648);
      expect(r.$_get(3)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_6600
     * @tc.name int32ArrayFromPart06TestMindmapTest066
     * @tc.desc Verify from() Number.NaN/Number.POSITIVE_INFINITY/-Number.POSITIVE_INFINITY/0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['a', 'b', 'c', 'd'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v.length).assertEqual(1);
        if (k === 0) {
          return Number.NaN;
        }
        if (k === 1) {
          return Number.POSITIVE_INFINITY;
        }
        if (k === 2) {
          return -Number.POSITIVE_INFINITY;
        }
        return 0.5;
      });
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_6700
     * @tc.name int32ArrayFromPart06TestMindmapTest067
     * @tc.desc Verify from() mapfn 4294967297(2^32+1) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['a'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v).assertEqual('a');
        return 4294967297;
      });
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_6800
     * @tc.name int32ArrayFromPart06TestMindmapTest068
     * @tc.desc Verify from() mapfn 0,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['a', 'b', 'c', 'd', 'e'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v.length).assertEqual(1);
        return 0;
      });
      for (let i: int = 0; i < r.length; i = i + 1) {
        expect(r.$_get(i)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_6900
     * @tc.name int32ArrayFromPart06TestMindmapTest069
     * @tc.desc Verify mutating the from() result does not affect the source ArrayLike elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['1', '2'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        return Number(v);
      });
      r.$_set(0, 999);
      expect(src[0]).assertEqual('1');
      expect(r.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_7000
     * @tc.name int32ArrayFromPart06TestMindmapTest070
     * @tc.desc Verify from() with mapfn that throws an error propagates the error without leaking the result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Int32Array.from(['a', 'b'] as string[], (v: string, k: number): number => {
          expect(v.length).assertEqual(1);
          if (k === 1) {
            throw new Error('boom');
          }
          return k;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_7100
     * @tc.name int32ArrayFromPart06TestMindmapTest071
     * @tc.desc Verify from() mapfn '123' ToNumber 123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['a'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v).assertEqual('a');
        return Number('123');
      });
      expect(r.$_get(0)).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART06_TEST_MINDMAP_7200
     * @tc.name int32ArrayFromPart06TestMindmapTest072
     * @tc.desc Verify from() U string mapfn v k , 0..n-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart06TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<string> = ['a', 'b', 'c', 'd'];
      let r: Int32Array = Int32Array.from<string>(src as ArrayLike<string>, (v: string, k: number): number => {
        expect(v.length).assertEqual(1);
        return k;
      });
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(3);
    });
  });
}
