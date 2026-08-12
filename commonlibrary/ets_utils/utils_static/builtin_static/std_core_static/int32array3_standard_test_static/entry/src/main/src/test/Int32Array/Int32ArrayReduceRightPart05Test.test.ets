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

class Accumulator {
  total: number = 0;
}

class ValueBox {
  total: number = 0;
}

export default function int32ArrayReduceRightPart05Test(): void {
  describe('Int32ArrayReduceRightPart05Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_0100
     * @tc.name int32ArrayReduceRightPart05Test001
     * @tc.desc Verify initialValue number, number; Also verify verify init toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let res: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int32Array): number => prev + cur);
      expect(res).assertEqual(60);

      {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r.toString()).assertEqual('60');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_0200
     * @tc.name int32ArrayReduceRightPart05Test002
     * @tc.desc Verify 0 initialValue, number init ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r1: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      let r2: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r1).assertEqual(10);
      expect(r2).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_0300
     * @tc.name int32ArrayReduceRightPart05Test003
     * @tc.desc Verify initialValue , string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4, 5, 6);
      let joined: string =
        arr.reduceRight((p: string, c: number, _i: int, _a: Int32Array): string => p + c.toString(), '');
      expect(joined).assertEqual('654');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_0400
     * @tc.name int32ArrayReduceRightPart05Test004
     * @tc.desc Verify boolean initialValue=true, boolean,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 4, 6);
      let ok: boolean =
        arr.reduceRight((p: boolean, c: number, _i: int, _a: Int32Array): boolean => p && (c % 2 === 0), true);
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_0500
     * @tc.name int32ArrayReduceRightPart05Test005
     * @tc.desc Verify [42] initialValue, 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let calls: int = 0;
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
        calls++;
        return p + c;
      });
      expect(calls).assertEqual(0);
      expect(r).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_0600
     * @tc.name int32ArrayReduceRightPart05Test006
     * @tc.desc Verify [42] initialValue=100, 1 index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let calls: int = 0;
      let idxSeen: int = -1;
      let r: number = arr.reduceRight((p: number, c: number, i: int, _a: Int32Array): number => {
        calls++;
        idxSeen = i;
        return p + c;
      }, 100);
      expect(calls).assertEqual(1);
      expect(idxSeen).assertEqual(0);
      expect(r).assertEqual(142);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_0700
     * @tc.name int32ArrayReduceRightPart05Test007
     * @tc.desc Verify init 1 index=0(prev= ,curr= )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8);
      let pSeen: number = 0;
      let cSeen: number = 0;
      let iSeen: int = -1;
      let calls: int = 0;
      arr.reduceRight((p: number, c: number, i: int, _a: Int32Array): number => {
        calls++;
        pSeen = p;
        cSeen = c;
        iSeen = i;
        return p + c;
      });
      expect(calls).assertEqual(1);
      expect(pSeen).assertEqual(8);
      expect(cSeen).assertEqual(7);
      expect(iSeen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_0800
     * @tc.name int32ArrayReduceRightPart05Test008
     * @tc.desc Verify init=0 2 index 1,0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8);
      let idxs: string = '';
      arr.reduceRight((p: number, c: number, i: int, _a: Int32Array): number => {
        idxs = idxs + i.toString() + ',';
        return p + c;
      }, 0);
      expect(idxs).assertEqual('1,0,');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_0900
     * @tc.name int32ArrayReduceRightPart05Test009
     * @tc.desc Verify init 2 index 1,0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let idxs: string = '';
      arr.reduceRight((p: number, c: number, i: int, _a: Int32Array): number => {
        idxs = idxs + i.toString() + ',';
        return p + c;
      });
      expect(idxs).assertEqual('1,0,');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_1000
     * @tc.name int32ArrayReduceRightPart05Test010
     * @tc.desc Verify init 3 index 2,1,0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let idxs: string = '';
      arr.reduceRight((p: number, c: number, i: int, _a: Int32Array): number => {
        idxs = idxs + i.toString() + ',';
        return p + c;
      }, 0);
      expect(idxs).assertEqual('2,1,0,');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_1100
     * @tc.name int32ArrayReduceRightPart05Test011
     * @tc.desc Verify 1(4 vs 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 1, 1, 1, 1);
      let c1: int = 0;
      let c2: int = 0;
      arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
        c1++;
        return p + c;
      });
      arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
        c2++;
        return p + c;
      }, 0);
      expect(c1).assertEqual(4);
      expect(c2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_1200
     * @tc.name int32ArrayReduceRightPart05Test012
     * @tc.desc Verify init prev arr.$_get(length-1) index=length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let fp: number = 0;
      let fi: int = -1;
      let hit: boolean = false;
      arr.reduceRight((p: number, c: number, i: int, _a: Int32Array): number => {
        if (!hit) {
          fp = p;
          fi = i;
          hit = true;
        }
        return p + c;
      });
      expect(fp).assertEqual(40);
      expect(fi).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_1300
     * @tc.name int32ArrayReduceRightPart05Test013
     * @tc.desc Verify init prev initialValue index=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let fp: number = 0;
      let fi: int = -1;
      let hit: boolean = false;
      arr.reduceRight((p: number, c: number, i: int, _a: Int32Array): number => {
        if (!hit) {
          fp = p;
          fi = i;
          hit = true;
        }
        return p + c;
      }, 77);
      expect(fp).assertEqual(77);
      expect(fi).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_1400
     * @tc.name int32ArrayReduceRightPart05Test014
     * @tc.desc Verify U=string init ='S' 'S321'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string = arr.reduceRight((p: string, c: number, _i: int, _a: Int32Array): string => p + c.toString(), 'S');
      expect(r).assertEqual('S321');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_1500
     * @tc.name int32ArrayReduceRightPart05Test015
     * @tc.desc Verify reduceRight applies left-associative subtraction and returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p - c);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_1600
     * @tc.name int32ArrayReduceRightPart05Test016
     * @tc.desc Verify init initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let calls: int = 0;
      let r: string = arr.reduceRight((p: string, c: number, _i: int, _a: Int32Array): string => {
        calls++;
        return p;
      }, 'default-val');
      expect(calls).assertEqual(0);
      expect(r).assertEqual('default-val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_1700
     * @tc.name int32ArrayReduceRightPart05Test017
     * @tc.desc Verify init=boolean false false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: boolean = arr.reduceRight((p: boolean, c: number, _i: int, _a: Int32Array): boolean => p || c > 0, false);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_1800
     * @tc.name int32ArrayReduceRightPart05Test018
     * @tc.desc Verify [-2147483648] init -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648);
      let calls: int = 0;
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
        calls++;
        return p + c;
      });
      expect(calls).assertEqual(0);
      expect(r).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_1900
     * @tc.name int32ArrayReduceRightPart05Test019
     * @tc.desc Verify initialValue INT_MIN-2147483648 number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, -2147483648);
      expect(r).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_2000
     * @tc.name int32ArrayReduceRightPart05Test020
     * @tc.desc Verify initialValue INT_MAX+1(2147483648,number )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 2147483648);
      expect(r).assertEqual(2147483650);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_2100
     * @tc.name int32ArrayReduceRightPart05Test021
     * @tc.desc Verify initialValue 1.5 ( ToInt32)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 1.5);
      expect(r).assertEqual(4.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_2200
     * @tc.name int32ArrayReduceRightPart05Test022
     * @tc.desc Verify initialValue=NaN NaN(NaN )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, Number.NaN);
      expect(isNaN(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_2300
     * @tc.name int32ArrayReduceRightPart05Test023
     * @tc.desc Verify initialValue=-Infinity max,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 7, 2, 9);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p > c ? p : c,
        -Number.POSITIVE_INFINITY);
      expect(r).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_2400
     * @tc.name int32ArrayReduceRightPart05Test024
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let origin: int = arr.length;
      try {
        arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
          throw new Error('x');
        }, 0);
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.length).assertEqual(origin);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_2500
     * @tc.name int32ArrayReduceRightPart05Test025
     * @tc.desc Verify reduceRight propagates callback error without mutating the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let s0: number = arr.$_get(0);
      let s1: number = arr.$_get(1);
      let s2: number = arr.$_get(2);
      let s3: number = arr.$_get(3);
      try {
        arr.reduceRight((p: number, c: number, i: int, _a: Int32Array): number => {
          if (i === 1) {
            throw new Error('mid');
          }
          return p + c;
        }, 0);
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.$_get(0)).assertEqual(s0);
      expect(arr.$_get(1)).assertEqual(s1);
      expect(arr.$_get(2)).assertEqual(s2);
      expect(arr.$_get(3)).assertEqual(s3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_2600
     * @tc.name int32ArrayReduceRightPart05Test026
     * @tc.desc Verify buffer buffer ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      arr.$_set(3, 4);
      let origBuf: ArrayBuffer = arr.buffer;
      try {
        arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
          throw new Error('b');
        }, 0);
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.buffer).assertEqual(origBuf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_2700
     * @tc.name int32ArrayReduceRightPart05Test027
     * @tc.desc Verify byteOffset ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let arr: Int32Array = new Int32Array(buf, 8, 3);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      try {
        arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
          throw new Error('y');
        }, 0);
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_2800
     * @tc.name int32ArrayReduceRightPart05Test028
     * @tc.desc Verify byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      try {
        arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
          throw new Error('z');
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_2900
     * @tc.name int32ArrayReduceRightPart05Test029
     * @tc.desc Verify reduceRight ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      try {
        arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
          throw new Error('e1');
        }, 0);
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      let sum: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_3000
     * @tc.name int32ArrayReduceRightPart05Test030
     * @tc.desc Verify init
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33);
      try {
        arr.reduceRight((p: number, c: number, i: int, _a: Int32Array): number => {
          if (i === 0) {
            throw new Error('first-elem');
          }
          return p + c;
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.$_get(0)).assertEqual(11);
      expect(arr.$_get(1)).assertEqual(22);
      expect(arr.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_3100
     * @tc.name int32ArrayReduceRightPart05Test031
     * @tc.desc Verify Error RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let errName: string = '';
      try {
        arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
          throw new RangeError('oor');
        }, 0);
      } catch (e) {
        errName = e.name;
        expect(e.name).assertEqual('RangeError');
      }
      expect(errName).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_3200
     * @tc.name int32ArrayReduceRightPart05Test032
     * @tc.desc Verify reduceRight propagates callback error message and type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let msg: string = '';
      try {
        arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
          throw new Error('marker-xyz');
        }, 0);
      } catch (e) {
        msg = e.message;
        expect(e.name).assertEqual('Error');
      }
      expect(msg).assertEqual('marker-xyz');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_3300
     * @tc.name int32ArrayReduceRightPart05Test033
     * @tc.desc Verify init (i=length-1) ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7, 8);
      try {
        arr.reduceRight((p: number, c: number, i: int, _a: Int32Array): number => {
          if (i === 3) {
            throw new Error('first');
          }
          return p + c;
        }, 0);
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_3400
     * @tc.name int32ArrayReduceRightPart05Test034
     * @tc.desc Verify throw ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let seed: ValueBox = new ValueBox();
      try {
        arr.reduceRight((p: ValueBox, c: number, i: int, _a: Int32Array): ValueBox => {
          p.total += c;
          if (i === 1) {
            throw new Error('stop');
          }
          return p;
        }, seed);
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(seed.total).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_3500
     * @tc.name int32ArrayReduceRightPart05Test035
     * @tc.desc Verify reduceRight ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer: Int32Array = Int32Array.of(10, 20);
      let inner: Int32Array = Int32Array.of(1, 2);
      let s0: number = outer.$_get(0);
      let s1: number = outer.$_get(1);
      try {
        outer.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
          inner.reduceRight((pp: number, cc: number, ii: int, aa: Int32Array): number => {
            if (ii === 0) {
              throw new Error('inner');
            }
            return pp + cc;
          });
          return p + c;
        }, 0);
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(outer.$_get(0)).assertEqual(s0);
      expect(outer.$_get(1)).assertEqual(s1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_3600
     * @tc.name int32ArrayReduceRightPart05Test036
     * @tc.desc Verify reduceRight without initialValue returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 4);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_3700
     * @tc.name int32ArrayReduceRightPart05Test037
     * @tc.desc Verify number initialValue 0 returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 4);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_3800
     * @tc.name int32ArrayReduceRightPart05Test038
     * @tc.desc Verify string initialValue '' returns '65'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6);
      let r: string = arr.reduceRight((p: string, c: number, _i: int, _a: Int32Array): string => p + c.toString(), '');
      expect(r).assertEqual('65');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_3900
     * @tc.name int32ArrayReduceRightPart05Test039
     * @tc.desc Verify boolean initialValue true returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 4);
      let r: boolean =
        arr.reduceRight((p: boolean, c: number, _i: int, _a: Int32Array): boolean => p && c % 2 === 0, true);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_4000
     * @tc.name int32ArrayReduceRightPart05Test040
     * @tc.desc Verify init=number int32 number( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, 3);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(2147483650);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_4100
     * @tc.name int32ArrayReduceRightPart05Test041
     * @tc.desc Verify reduceRight maximum value with and without initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 7, 2, 9, 5);
      let mn: number = arr.reduceRight((a: number, b: number, _i: int, _x: Int32Array): number => a > b ? a : b);
      let mg: number = arr.reduceRight((a: number, b: number, _i: int, _x: Int32Array): number => a > b ? a : b,
        -Number.POSITIVE_INFINITY);
      expect(mn).assertEqual(9);
      expect(mg).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_4200
     * @tc.name int32ArrayReduceRightPart05Test042
     * @tc.desc Verify init=1 init ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 3, 12);
      let rNo: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p / c);
      let rWith: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p / c, 1);
      expect(rNo).assertEqual(2);
      expect(rWith).assertEqual(1.0 / 2 / 3 / 12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_4300
     * @tc.name int32ArrayReduceRightPart05Test043
     * @tc.desc Verify U=string '-' '-c-b-a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: string =
        arr.reduceRight((p: string, c: number, _i: int, _a: Int32Array): string => p + '-' + c.toString(), '');
      expect(r).assertEqual('-3-2-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_4400
     * @tc.name int32ArrayReduceRightPart05Test044
     * @tc.desc Verify reduceRight number Int32Array.$_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(4, 5, 6);
      let dst: Int32Array = new Int32Array(1);
      let sum: number = src.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      dst.$_set(0, Double.toInt(sum));
      expect(dst.$_get(0)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_4500
     * @tc.name int32ArrayReduceRightPart05Test045
     * @tc.desc Verify reduceRight sums number elements and returns a number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_4600
     * @tc.name int32ArrayReduceRightPart05Test046
     * @tc.desc Verify ( i=0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let lastRet: number = 0;
      let r: number = arr.reduceRight((p: number, c: number, i: int, _a: Int32Array): number => {
        let nxt: number = p + c + i;
        if (i === 0) {
          lastRet = nxt;
        }
        return nxt;
      }, 0);
      expect(r).assertEqual(lastRet);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_4700
     * @tc.name int32ArrayReduceRightPart05Test047
     * @tc.desc Verify sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22);
      let r: Accumulator = arr.reduceRight((p: Accumulator, c: number, _i: int, _a: Int32Array): Accumulator => {
        p.total += c;
        return p;
      }, new Accumulator());
      expect(r.total).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_4800
     * @tc.name int32ArrayReduceRightPart05Test048
     * @tc.desc Verify INT_MIN init toString() "-2147483648"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c);
      expect(r.toString()).assertEqual('-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_4900
     * @tc.name int32ArrayReduceRightPart05Test049
     * @tc.desc Verify array ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let same: boolean = false;
      arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => {
        if (i === 1) {
          same = (a === arr);
        }
        return p + c;
      }, 0);
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_5000
     * @tc.name int32ArrayReduceRightPart05Test050
     * @tc.desc Verify init array ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7);
      let same: boolean = false;
      arr.reduceRight((p: number, c: number, _i: int, a: Int32Array): number => {
        same = (a === arr);
        return p + c;
      });
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_5100
     * @tc.name int32ArrayReduceRightPart05Test051
     * @tc.desc Verify array ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let first: Int32Array | undefined = undefined;
      let allSame: boolean = true;
      arr.reduceRight((p: number, c: number, _i: int, a: Int32Array): number => {
        if (first === undefined) {
          first = a;
        } else {
          if (a !== first) {
            allSame = false;
          }
        }
        return p + c;
      }, 0);
      expect(allSame).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_5200
     * @tc.name int32ArrayReduceRightPart05Test052
     * @tc.desc Verify a.$_set , ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0, 5);
      let lastSeen: number = 0;
      arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => {
        if (i === 0) {
          lastSeen = c;
        }
        if (i > 0) {
          a.$_set(i - 1, c + 1);
        }
        return p + c;
      }, 0);
      expect(lastSeen).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_5300
     * @tc.name int32ArrayReduceRightPart05Test053
     * @tc.desc Verify buffer, reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a1: Int32Array = new Int32Array(buf, 0, 4);
      let a2: Int32Array = new Int32Array(buf, 0, 4);
      a1.$_set(0, 0);
      a1.$_set(1, 0);
      a1.$_set(2, 0);
      a1.$_set(3, 0);
      a1.reduceRight((p: number, c: number, i: int, _a: Int32Array): number => {
        a2.$_set(i, c + 100);
        return p + c;
      }, 0);
      expect(a1.$_get(0)).assertEqual(100);
      expect(a1.$_get(1)).assertEqual(100);
      expect(a1.$_get(2)).assertEqual(100);
      expect(a1.$_get(3)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_5400
     * @tc.name int32ArrayReduceRightPart05Test054
     * @tc.desc Verify subarray reduceRight,array===sub
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let sub: Int32Array = parent.subarray(1, 4);
      let sameAsSub: boolean = false;
      let seenLen: int = -1;
      sub.reduceRight((p: number, c: number, _i: int, a: Int32Array): number => {
        if (seenLen === -1) {
          seenLen = a.length;
          sameAsSub = (a === sub);
        }
        return p + c;
      }, 0);
      expect(seenLen).assertEqual(3);
      expect(sameAsSub).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_5500
     * @tc.name int32ArrayReduceRightPart05Test055
     * @tc.desc Verify subarray buffer buffer ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub: Int32Array = parent.subarray(1, 3);
      let bufSame: boolean = false;
      sub.reduceRight((p: number, c: number, _i: int, a: Int32Array): number => {
        if (bufSame === false) {
          bufSame = (a.buffer === parent.buffer);
        }
        return p + c;
      }, 0);
      expect(bufSame).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_5600
     * @tc.name int32ArrayReduceRightPart05Test056
     * @tc.desc Verify subarray reduceRight ( buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let sub: Int32Array = parent.subarray(1, 4);
      sub.reduceRight((p: number, c: number, i: int, a: Int32Array): number => {
        a.$_set(i, c * 10);
        return p + c;
      }, 0);
      expect(parent.$_get(0)).assertEqual(1);
      expect(parent.$_get(1)).assertEqual(20);
      expect(parent.$_get(2)).assertEqual(30);
      expect(parent.$_get(3)).assertEqual(40);
      expect(parent.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_5700
     * @tc.name int32ArrayReduceRightPart05Test057
     * @tc.desc Verify byteOffset array.byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let view: Int32Array = new Int32Array(buf, 4, 3);
      view.$_set(0, 11);
      view.$_set(1, 22);
      view.$_set(2, 33);
      let off: int = -1;
      view.reduceRight((p: number, c: number, _i: int, a: Int32Array): number => {
        if (off === -1) {
          off = a.byteOffset;
        }
        return p + c;
      }, 0);
      expect(off).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_5800
     * @tc.name int32ArrayReduceRightPart05Test058
     * @tc.desc Verify slice subarray reduceRight buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let s1: Int32Array = arr.subarray(1, 4);
      let s2: Int32Array = arr.slice(1, 4);
      let r1: number = s1.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      let r2: number = s2.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r1).assertEqual(r2);
      expect(s1.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_5900
     * @tc.name int32ArrayReduceRightPart05Test059
     * @tc.desc Verify ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let seed: Accumulator = new Accumulator();
      let first: Accumulator | undefined = undefined;
      let allSame: boolean = true;
      arr.reduceRight((p: Accumulator, c: number, _i: int, _a: Int32Array): Accumulator => {
        if (first === undefined) {
          first = p;
        } else {
          if (p !== first) {
            allSame = false;
          }
        }
        p.total++;
        return p;
      }, seed);
      expect(allSame).assertTrue();
      expect(seed.total).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_6000
     * @tc.name int32ArrayReduceRightPart05Test060
     * @tc.desc Verify initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20);
      let seed: Accumulator = new Accumulator();
      let out: Accumulator = arr.reduceRight((p: Accumulator, c: number, _i: int, _a: Int32Array): Accumulator => {
        p.total += c;
        return p;
      }, seed);
      expect(out).assertEqual(seed);
      expect(seed.total).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_6100
     * @tc.name int32ArrayReduceRightPart05Test061
     * @tc.desc Verify initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let seed: Accumulator = new Accumulator();
      let calls: int = 0;
      let out: Accumulator = arr.reduceRight((p: Accumulator, c: number, _i: int, _a: Int32Array): Accumulator => {
        calls++;
        return p;
      }, seed);
      expect(out).assertEqual(seed);
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_6200
     * @tc.name int32ArrayReduceRightPart05Test062
     * @tc.desc Verify reduceRight ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let seed: Accumulator = new Accumulator();
      arr.reduceRight((p: Accumulator, c: number, _i: int, _a: Int32Array): Accumulator => {
        p.total += c;
        return p;
      }, seed);
      expect(seed.total).assertEqual(3);
      arr.reduceRight((p: Accumulator, c: number, _i: int, _a: Int32Array): Accumulator => {
        p.total += c;
        return p;
      }, seed);
      expect(seed.total).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_6300
     * @tc.name int32ArrayReduceRightPart05Test063
     * @tc.desc Verify ArrayBuffer Int32Array ,reduceRight 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_6400
     * @tc.name int32ArrayReduceRightPart05Test064
     * @tc.desc Verify reentrant: reduceRight,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let innerSum: number = -1;
      let outerSum: number = 0;
      arr.reduceRight((p: number, c: number, i: int, a: Int32Array): number => {
        if (i === 1 && innerSum === -1) {
          innerSum = a.reduceRight((pp: number, cc: number, _ii: int, _aa: Int32Array): number => pp + cc, 0);
        }
        outerSum += c;
        return p + c;
      }, 0);
      expect(innerSum).assertEqual(6);
      expect(outerSum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_6500
     * @tc.name int32ArrayReduceRightPart05Test065
     * @tc.desc Verify reduceRight initialValue,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 5, 7);
      let cb = (p: number, c: number, _i: int, _a: Int32Array): number => p + c;
      let r1: number = arr.reduceRight(cb, 0);
      let r2: number = arr.reduceRight(cb, 0);
      expect(r1).assertEqual(15);
      expect(r2).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_6600
     * @tc.name int32ArrayReduceRightPart05Test066
     * @tc.desc Verify set reduceRight ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      let src: Int32Array = Int32Array.of(9, 9, 9);
      arr.set(src);
      let r: number = arr.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => p + c, 0);
      expect(r).assertEqual(27);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REDUCE_RIGHT_PART05_TEST_MINDMAP_6700
     * @tc.name int32ArrayReduceRightPart05Test067
     * @tc.desc Verify reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReduceRightPart05Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer: Int32Array = Int32Array.of(1, 2);
      let inner: Int32Array = Int32Array.of(10, 20);
      let r: number = outer.reduceRight((p: number, c: number, _i: int, _a: Int32Array): number => {
        let s: number = inner.reduceRight((pp: number, cc: number, _ii: int, _aa: Int32Array): number => pp + cc);
        return p + c + s;
      }, 0);
      expect(r).assertEqual(1 + 30 + 2 + 30);
    });



  });
}
