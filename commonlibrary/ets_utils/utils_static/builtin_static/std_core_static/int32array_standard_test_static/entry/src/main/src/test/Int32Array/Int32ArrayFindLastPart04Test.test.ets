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
export default function int32ArrayFindLastPart04TestMindmapTestTest(): void {
  describe('Int32ArrayFindLastPart04TestMindmapTestTest', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_0100
         * @tc.name int32ArrayFindLastPart04TestMindmapTest001
         * @tc.desc Verify predicate findLast length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
          arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 3; });
          expect(arr.length).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_0200
         * @tc.name int32ArrayFindLastPart04TestMindmapTest002
         * @tc.desc Verify predicate findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => { return false; });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(20);
          expect(arr.$_get(2)).assertEqual(30);
          expect(arr.$_get(3)).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_0300
         * @tc.name int32ArrayFindLastPart04TestMindmapTest003
         * @tc.desc Verify predicate findLast ArrayBuffer byteLength
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let arr: Int32Array = new Int32Array(buf);
          arr.$_set(0, 1); arr.$_set(1, 2); arr.$_set(2, 3); arr.$_set(3, 4);
          arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v > 0; });
          expect(arr.buffer.byteLength).assertEqual(16);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_0400
         * @tc.name int32ArrayFindLastPart04TestMindmapTest004
         * @tc.desc Verify findLast number
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(7, 8, 9);
          let res: number | undefined = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 9; });
          res = 999;
          expect(arr.$_get(2)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_0500
         * @tc.name int32ArrayFindLastPart04TestMindmapTest005
         * @tc.desc Verify findLast undefined
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(11, 22, 33);
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 999; });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(arr.$_get(0)).assertEqual(11);
          expect(arr.$_get(2)).assertEqual(33);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_0600
         * @tc.name int32ArrayFindLastPart04TestMindmapTest006
         * @tc.desc Verify findLast byteOffset
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(32);
          let arr: Int32Array = new Int32Array(buf, 8, 4);
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => { return false; });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(arr.byteOffset).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_0700
         * @tc.name int32ArrayFindLastPart04TestMindmapTest007
         * @tc.desc Verify predicate length predicate false
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
          let cnt: int = 0;
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => { cnt++; return false; });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(cnt).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_0800
         * @tc.name int32ArrayFindLastPart04TestMindmapTest008
         * @tc.desc Verify predicate index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
          let idxs: Array<int> = new Array<int>();
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => { idxs.push(i); return false; });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(idxs.length).assertEqual(4);
          expect(idxs[0]).assertEqual(3);
          expect(idxs[1]).assertEqual(2);
          expect(idxs[2]).assertEqual(1);
          expect(idxs[3]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_0900
         * @tc.name int32ArrayFindLastPart04TestMindmapTest009
         * @tc.desc Verify predicate value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
          let vals: Array<number> = new Array<number>();
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => { vals.push(v); return false; });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(vals[0]).assertEqual(40);
          expect(vals[vals.length - 1]).assertEqual(10);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_1000
         * @tc.name int32ArrayFindLastPart04TestMindmapTest010
         * @tc.desc Verify predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
          let cnt: int = 0;
          let r: number | undefined = arr.findLast((v: number, i: int, a: Int32Array): boolean => { cnt++; return v === 3; });
          expect(r).assertEqual(3);
          expect(cnt).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_1100
         * @tc.name int32ArrayFindLastPart04TestMindmapTest011
         * @tc.desc Verify predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          let cnt: int = 0;
          let r: number | undefined = arr.findLast((v: number, i: int, a: Int32Array): boolean => { cnt++; return v === 4; });
          expect(r).assertEqual(4);
          expect(cnt).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_1200
         * @tc.name int32ArrayFindLastPart04TestMindmapTest012
         * @tc.desc Verify predicate length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          let cnt: int = 0;
          let r: number | undefined = arr.findLast((v: number, i: int, a: Int32Array): boolean => { cnt++; return v === 1; });
          expect(r).assertEqual(1);
          expect(cnt).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_1300
         * @tc.name int32ArrayFindLastPart04TestMindmapTest013
         * @tc.desc Verify predicate predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3);
          let sum: number = 0;
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => { sum = sum + v; return false; });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(sum).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_1400
         * @tc.name int32ArrayFindLastPart04TestMindmapTest014
         * @tc.desc Verify predicate boolean " "
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(5);
          let called: boolean = false;
          arr.findLast((v: number, i: int, a: Int32Array): boolean => { called = true; return true; });
          expect(called).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_1500
         * @tc.name int32ArrayFindLastPart04TestMindmapTest015
         * @tc.desc Verify predicate array findLast Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3);
          let same: boolean = false;
          arr.findLast((v: number, i: int, a: Int32Array): boolean => { same = (a === arr); return true; });
          expect(same).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_1600
         * @tc.name int32ArrayFindLastPart04TestMindmapTest016
         * @tc.desc Verify predicate array length length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
          let alen: int = -1;
          arr.findLast((v: number, i: int, a: Int32Array): boolean => { alen = a.length; return true; });
          expect(alen).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_1700
         * @tc.name int32ArrayFindLastPart04TestMindmapTest017
         * @tc.desc Verify predicate array value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(7, 14, 21);
          let ok: boolean = true;
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => { if (a.$_get(i) !== v) { ok = false; } return false; });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(ok).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_1800
         * @tc.name int32ArrayFindLastPart04TestMindmapTest018
         * @tc.desc Verify index [0, length-1]
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6);
          let allInRange: boolean = true;
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => {
            if (i < 0 || i >= a.length) { allInRange = false; }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(allInRange).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_1900
         * @tc.name int32ArrayFindLastPart04TestMindmapTest019
         * @tc.desc Verify predicate $_set
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, 0, 0, 0);
          let sawNew: boolean = false;
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => {
            if (i === 3) { a.$_set(0, 777); return false; }
            if (i === 0 && v === 777) { sawNew = true; }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(sawNew).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_2000
         * @tc.name int32ArrayFindLastPart04TestMindmapTest020
         * @tc.desc Verify predicate findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => {
            if (i === 3) { a.$_set(3, 99); return false; }
            return v === 4;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_2100
         * @tc.name int32ArrayFindLastPart04TestMindmapTest021
         * @tc.desc Verify predicate findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, 0, 0, 0);
          let r: number | undefined = arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          if (i === 3) { a.$_set(1, 55); return false; }
          return v === 55;
        });
          expect(r).assertEqual(55);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_2200
         * @tc.name int32ArrayFindLastPart04TestMindmapTest022
         * @tc.desc Verify predicate findLast undefined
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => {
            if (i === 3) { a.$_set(0, 99); return false; }
            return v === 1;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_2300
         * @tc.name int32ArrayFindLastPart04TestMindmapTest023
         * @tc.desc Verify predicate value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30);
          let snapshotOk: boolean = true;
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => {
            let snap: number = v;
            a.$_set(i, 999);
            if (snap !== (i === 2 ? 30 : (i === 1 ? 20 : 10))) { snapshotOk = false; }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(snapshotOk).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_2400
         * @tc.name int32ArrayFindLastPart04TestMindmapTest024
         * @tc.desc Verify predicate array fill fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
          let cntFilled: int = 0;
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => {
            if (i === 4) { a.fill(88); return false; }
            if (v === 88) { cntFilled++; }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(cntFilled).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_2500
         * @tc.name int32ArrayFindLastPart04TestMindmapTest025
         * @tc.desc Verify findLast predicate findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
          let innerRes: number = -999;
          let outerRes: number | undefined = arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          if (i === 4) {
          let ir: number | undefined = a.findLast((vv: number, ii: int, aa: Int32Array): boolean => { return vv === 2; });
          if (ir !== undefined) { innerRes = ir; }
          }
          return v === 3;
        });
          expect(innerRes).assertEqual(2);
          expect(outerRes).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_2600
         * @tc.name int32ArrayFindLastPart04TestMindmapTest026
         * @tc.desc Verify findLast predicate catch
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3);
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => {
            a.findLast((vv: number, ii: int, aa: Int32Array): boolean => { throw new Error('inner'); });
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('inner');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_2700
         * @tc.name int32ArrayFindLastPart04TestMindmapTest027
         * @tc.desc Verify subarray findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
          let sub: Int32Array = arr.subarray(1, 4);
          let r1: number | undefined = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 50; });
          let r2: number | undefined = sub.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 20; });
          expect(r1).assertEqual(50);
          expect(r2).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_2800
         * @tc.name int32ArrayFindLastPart04TestMindmapTest028
         * @tc.desc Verify findLast predicate Int32Array findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a1: Int32Array = Int32Array.of(1, 2, 3);
          let a2: Int32Array = Int32Array.of(100, 200, 300);
          let r: number | undefined = a1.findLast((v: number, i: int, a: Int32Array): boolean => {
          if (i === 2) {
          a2.findLast((vv: number, ii: int, aa: Int32Array): boolean => { return vv === 200; });
          }
          return v === 1;
        });
          expect(r).assertEqual(1);
          expect(a2.$_get(1)).assertEqual(200);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_2900
         * @tc.name int32ArrayFindLastPart04TestMindmapTest029
         * @tc.desc Verify findLast predicate -1 2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          let recFind: (a: Int32Array, depth: int) => number | undefined;
          recFind = (a: Int32Array, depth: int): number | undefined => {
          if (depth <= 0 || a.length === 0) { return undefined; }
          return a.findLast((v: number, i: int, aa: Int32Array): boolean => {
          if (v === 4) { return true; }
          let sub: Int32Array = aa.subarray(0, aa.length - 1);
          let inner: number | undefined = recFind(sub, depth - 1);
          return inner !== undefined;
        });
          };
          let r: number | undefined = recFind(arr, 2);
          expect(r).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_3000
         * @tc.name int32ArrayFindLastPart04TestMindmapTest030
         * @tc.desc Verify $_set findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          arr.$_set(2, 42);
          let r: number | undefined = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 42; });
          expect(r).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_3100
         * @tc.name int32ArrayFindLastPart04TestMindmapTest031
         * @tc.desc Verify set(array, offset) findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(6);
          let src: Int32Array = Int32Array.of(7, 8, 9);
          arr.set(src, 3);
          let r: number | undefined = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 8; });
          expect(r).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_3200
         * @tc.name int32ArrayFindLastPart04TestMindmapTest032
         * @tc.desc Verify fill findLast fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(5);
          arr.fill(111);
          let r: number | undefined = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 111; });
          expect(r).assertEqual(111);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_3300
         * @tc.name int32ArrayFindLastPart04TestMindmapTest033
         * @tc.desc Verify copyWithin findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 0, 0);
          arr.copyWithin(4, 0, 2);
          let r: number | undefined = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 2; });
          expect(r).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_3400
         * @tc.name int32ArrayFindLastPart04TestMindmapTest034
         * @tc.desc Verify reverse findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          arr.reverse();
          let r: number | undefined = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 1; });
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_3500
         * @tc.name int32ArrayFindLastPart04TestMindmapTest035
         * @tc.desc Verify sort findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(3, 1, 4, 2);
          arr.sort();
          let r: number | undefined = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return true; });
          expect(r).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_3600
         * @tc.name int32ArrayFindLastPart04TestMindmapTest036
         * @tc.desc Verify ArrayBuffer findLast predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let parent: Int32Array = new Int32Array(buf);
          let child: Int32Array = new Int32Array(buf);
          parent.$_set(0, 1); parent.$_set(1, 2); parent.$_set(2, 3); parent.$_set(3, 4);
          let sawChildWrite: boolean = false;
          try {
            parent.findLast((v: number, i: int, a: Int32Array): boolean => {
            if (i === 3) { child.$_set(0, 77); return false; }
            if (i === 0 && v === 77) { sawChildWrite = true; }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(sawChildWrite).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_3700
         * @tc.name int32ArrayFindLastPart04TestMindmapTest037
         * @tc.desc Verify byteOffset $_set findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(24);
          let parent: Int32Array = new Int32Array(buf);
          let child: Int32Array = new Int32Array(buf, 8, 3);
          for (let i: int = 0; i < parent.length; i++) { parent.$_set(i, 0); }
          child.$_set(0, 111);
          let r: number | undefined = parent.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 111; });
          expect(r).assertEqual(111);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_3800
         * @tc.name int32ArrayFindLastPart04TestMindmapTest038
         * @tc.desc Verify predicate buffer $_get
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let parent: Int32Array = new Int32Array(buf);
          let child: Int32Array = new Int32Array(buf, 4, 3);
          let observed: number = -1;
          parent.findLast((v: number, i: int, a: Int32Array): boolean => {
          if (i === 3) {
          parent.$_set(1, 222);
          observed = child.$_get(0);
          return true;
          }
          return false;
        });
          expect(observed).assertEqual(222);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_3900
         * @tc.name int32ArrayFindLastPart04TestMindmapTest039
         * @tc.desc Verify buffer INT_MAX findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(8);
          let a: Int32Array = new Int32Array(buf);
          let b: Int32Array = new Int32Array(buf, 0, 1);
          a.$_set(0, 0); a.$_set(1, 0);
          b.$_set(0, 2147483647);
          let r: number | undefined = a.findLast((v: number, i: int, a2: Int32Array): boolean => { return v === 2147483647; });
          expect(r).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_4000
         * @tc.name int32ArrayFindLastPart04TestMindmapTest040
         * @tc.desc Verify subarray buffer findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
          let child: Int32Array = parent.subarray(1, 4);
          let saw: boolean = false;
          try {
            child.findLast((v: number, i: int, a: Int32Array): boolean => {
            if (i === 2) { parent.$_set(1, 999); return false; }
            if (v === 999) { saw = true; }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(saw).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_4100
         * @tc.name int32ArrayFindLastPart04TestMindmapTest041
         * @tc.desc Verify subarray v1 findLast v2 v1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, 0, 0, 0, 0);
          let valFirst: Int32Array = arr.subarray(0, 4);
          let valSecond: Int32Array = arr.subarray(2, 5);
          let hitMutated: boolean = false;
          valFirst.findLast((v: number, i: int, a: Int32Array): boolean => {
          if (i === 3) { valSecond.$_set(0, 333); return false; }
          if (i === 2 && v === 333) { hitMutated = true; return true; }
          return false;
        });
          expect(hitMutated).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_4200
         * @tc.name int32ArrayFindLastPart04TestMindmapTest042
         * @tc.desc Verify length findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(32);
          let parent: Int32Array = new Int32Array(buf);
          let child: Int32Array = new Int32Array(buf, 0, 3);
          parent.$_set(5, 123);
          let cnt: int = 0;
          try {
            child.findLast((v: number, i: int, a: Int32Array): boolean => { cnt++; return v === 123; });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(cnt).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_4300
         * @tc.name int32ArrayFindLastPart04TestMindmapTest043
         * @tc.desc Verify predicate $_set Number.NaN ToInt32=0 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          let sawZero: boolean = false;
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => {
            if (i === 3) { a.$_set(0, Number.NaN); return false; }
            if (i === 0 && v === 0) { sawZero = true; }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(sawZero).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_4400
         * @tc.name int32ArrayFindLastPart04TestMindmapTest044
         * @tc.desc Verify predicate $_set Number.POSITIVE_INFINITY ToInt32=0 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(5, 5, 5, 5);
          let sawZero: boolean = false;
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => {
            if (i === 3) { a.$_set(1, Number.POSITIVE_INFINITY as number); return false; }
            if (i === 1 && v === 0) { sawZero = true; }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(sawZero).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_4500
         * @tc.name int32ArrayFindLastPart04TestMindmapTest045
         * @tc.desc Verify predicate $_set 2147483648 -2147483648 INT_MIN
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, 0, 0);
          let sawMin: boolean = false;
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => {
            if (i === 2) { a.$_set(0, 2147483648 as number); return false; }
            if (i === 0 && v === -2147483648) { sawMin = true; }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(sawMin).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_4600
         * @tc.name int32ArrayFindLastPart04TestMindmapTest046
         * @tc.desc Verify predicate $_set -2147483649 2147483647 INT_MAX
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, 0, 0);
          let sawMax: boolean = false;
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => {
            if (i === 2) { a.$_set(0, -2147483649 as number); return false; }
            if (i === 0 && v === 2147483647) { sawMax = true; }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(sawMax).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_4700
         * @tc.name int32ArrayFindLastPart04TestMindmapTest047
         * @tc.desc Verify predicate $_set 2147483647.9 2147483647 INT_MAX
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, 0, 0);
          let sawMax: boolean = false;
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => {
            if (i === 2) { a.$_set(0, 2147483647.9 as number); return false; }
            if (i === 0 && v === 2147483647) { sawMax = true; }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(sawMax).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_4800
         * @tc.name int32ArrayFindLastPart04TestMindmapTest048
         * @tc.desc Verify predicate fill -0 ToInt32(-0)=0 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(5, 5, 5);
          let sawZero: boolean = true;
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => {
            if (i === 2) { a.fill(-0 as number); return false; }
            if (v !== 0) { sawZero = false; }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(sawZero).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_4900
         * @tc.name int32ArrayFindLastPart04TestMindmapTest049
         * @tc.desc Verify predicate $_set 4294967297 2^32+1 1 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, 0, 0);
          let sawOne: boolean = false;
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => {
            if (i === 2) { a.$_set(0, 4294967297 as number); return false; }
            if (i === 0 && v === 1) { sawOne = true; }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(sawOne).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_5000
         * @tc.name int32ArrayFindLastPart04TestMindmapTest050
         * @tc.desc Verify predicate length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => { throw new Error('x'); });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('x');
          }
          expect(arr.length).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_5100
         * @tc.name int32ArrayFindLastPart04TestMindmapTest051
         * @tc.desc Verify predicate predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, 0, 0, 0);
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => {
            if (i === 3) { a.$_set(0, 77); throw new Error('stop'); }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('stop');
          }
          expect(arr.$_get(0)).assertEqual(77);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_5200
         * @tc.name int32ArrayFindLastPart04TestMindmapTest052
         * @tc.desc Verify predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
          let cnt: int = 0;
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => {
            cnt++;
            if (i === 2) { throw new Error('mid'); }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('mid');
          }
          expect(cnt).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_5300
         * @tc.name int32ArrayFindLastPart04TestMindmapTest053
         * @tc.desc Verify predicate number 1 truthy
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3);
          let r: number | undefined = arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          return !!1;
        });
          expect(r).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_5400
         * @tc.name int32ArrayFindLastPart04TestMindmapTest054
         * @tc.desc Verify predicate 0 falsy cnt length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let cnt: int = 0;
          let arr: Int32Array = Int32Array.of(5, 6, 7);
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => {
            cnt++;
            return !!0;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(cnt).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_5500
         * @tc.name int32ArrayFindLastPart04TestMindmapTest055
         * @tc.desc Verify predicate '' falsy cnt length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2);
          let cnt: int = 0;
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => {
            cnt++;
            return !!'';
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(cnt).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_5600
         * @tc.name int32ArrayFindLastPart04TestMindmapTest056
         * @tc.desc Verify predicate 'x' truthy
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30);
          let r: number | undefined = arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          return !!'x';
        });
          expect(r).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_5700
         * @tc.name int32ArrayFindLastPart04TestMindmapTest057
         * @tc.desc Verify findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(5, 3, 7, 3, 8);
          let r1: number | undefined = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 3; });
          let r2: number | undefined = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 3; });
          expect(r1).assertEqual(r2);
          expect(r1).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_5800
         * @tc.name int32ArrayFindLastPart04TestMindmapTest058
         * @tc.desc Verify forEach findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          arr.forEach((v: number, i: int, a: Int32Array): void => { if (v === 2) { a.$_set(i, 99); } });
          let r: number | undefined = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 99; });
          expect(r).assertEqual(99);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_5900
         * @tc.name int32ArrayFindLastPart04TestMindmapTest059
         * @tc.desc Verify map findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3);
          let mapped: Int32Array = arr.map((v: number, i: int, a: Int32Array): number => { return v * 10; });
          let r: number | undefined = mapped.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 20; });
          expect(r).assertEqual(20);
          expect(arr.$_get(1)).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_6000
         * @tc.name int32ArrayFindLastPart04TestMindmapTest060
         * @tc.desc Verify filter findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6);
          let evens: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => { return v % 2 === 0; });
          let r: number | undefined = evens.findLast((v: number, i: int, a: Int32Array): boolean => { return v > 3; });
          expect(r).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_6100
         * @tc.name int32ArrayFindLastPart04TestMindmapTest061
         * @tc.desc Verify findLast $_get(length-1)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 20);
          let r: number | undefined = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 20; });
          expect(r).assertEqual(20);
          expect(arr.$_get(3)).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_6200
         * @tc.name int32ArrayFindLastPart04TestMindmapTest062
         * @tc.desc Verify findLast includes true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 4; });
          expect(arr.includes(4)).assertTrue();
          expect(arr.includes(99)).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_6300
         * @tc.name int32ArrayFindLastPart04TestMindmapTest063
         * @tc.desc Verify some findLast some
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, 0, 0);
          arr.some((v: number, i: int, a: Int32Array): boolean => { a.$_set(i, 7); return i === 2; });
          let r: number | undefined = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 7; });
          expect(r).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_6400
         * @tc.name int32ArrayFindLastPart04TestMindmapTest064
         * @tc.desc Verify every findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3);
          arr.every((v: number, i: int, a: Int32Array): boolean => { a.$_set(i, v + 100); return true; });
          let r: number | undefined = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 103; });
          expect(r).assertEqual(103);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_6500
         * @tc.name int32ArrayFindLastPart04TestMindmapTest065
         * @tc.desc Verify findLast new Int32Array length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3);
          let capLen: int = -1;
          arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          new Int32Array(10);
          capLen = a.length;
          return true;
        });
          expect(capLen).assertEqual(3);
          expect(arr.length).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_6600
         * @tc.name int32ArrayFindLastPart04TestMindmapTest066
         * @tc.desc Verify predicate INT_MIN true INT_MIN
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3);
          let r: number | undefined = arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, -2147483648);
          return i === 2;
        });
          expect(r).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_6700
         * @tc.name int32ArrayFindLastPart04TestMindmapTest067
         * @tc.desc Verify predicate INT_MAX i=1 true INT_MAX
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, 0, 0, 0);
          let r: number | undefined = arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, 2147483647);
          return i === 1;
        });
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_6800
         * @tc.name int32ArrayFindLastPart04TestMindmapTest068
         * @tc.desc Verify predicate ArrayBuffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let a: Int32Array = new Int32Array(buf);
          let b: Int32Array = new Int32Array(buf);
          for (let i: int = 0; i < 4; i++) { a.$_set(i, 0); }
          try {
            a.findLast((v: number, i: int, arr2: Int32Array): boolean => {
            if (i === 3) { arr2.$_set(0, 555); throw new Error('abort'); }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('abort');
          }
          expect(b.$_get(0)).assertEqual(555);
          expect(b.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_6900
         * @tc.name int32ArrayFindLastPart04TestMindmapTest069
         * @tc.desc Verify predicate byteOffset/byteLength/length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(32);
          let a: Int32Array = new Int32Array(buf, 12, 3);
          try {
            a.findLast((v: number, i: int, arr2: Int32Array): boolean => { throw new Error('x'); });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('x');
          }
          expect(a.byteOffset).assertEqual(12);
          expect(a.length).assertEqual(3);
          expect(a.byteLength).assertEqual(12);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_7000
         * @tc.name int32ArrayFindLastPart04TestMindmapTest070
         * @tc.desc Verify predicate fill true fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          let r: number | undefined = arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          a.fill(777);
          return i === 3;
        });
          expect(r).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART04_TEST_MINDMAP_7100
         * @tc.name int32ArrayFindLastPart04TestMindmapTest071
         * @tc.desc Verify predicate sort value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart04TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(4, 3, 2, 1);
          let sawOne: boolean = false;
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => {
            if (i === 3) { a.sort(); return false; }
            if (i === 0 && v === 1) { sawOne = true; }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(sawOne).assertTrue();
        });
  });
}
