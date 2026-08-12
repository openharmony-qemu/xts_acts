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
export default function int32ArrayCopyWithinPart03Test(): void {
  describe('Int32ArrayCopyWithinPart03Test', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_0100
         * @tc.name int32ArrayCopyWithinPart03Test001
         * @tc.desc Verify target equals length source covers full array no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(4, 0, 4);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_0200
         * @tc.name int32ArrayCopyWithinPart03Test002
         * @tc.desc Verify target length plus one non-empty source no write no throw
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          arr.copyWithin(4, 0, 2);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(20);
          expect(arr.$_get(2)).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_0300
         * @tc.name int32ArrayCopyWithinPart03Test003
         * @tc.desc Verify target far out of positive bounds behaves as no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.copyWithin(105, 0, 3);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_0400
         * @tc.name int32ArrayCopyWithinPart03Test004
         * @tc.desc Verify target negative one on two element array maps to last index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 8]);
          arr.copyWithin(-1, 0);
          expect(arr.$_get(0)).assertEqual(7);
          expect(arr.$_get(1)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_0500
         * @tc.name int32ArrayCopyWithinPart03Test005
         * @tc.desc Verify target minus length plus one clamps to zero
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          arr.copyWithin(-4, 1);
          expect(arr.$_get(0)).assertEqual(20);
          expect(arr.$_get(1)).assertEqual(30);
          expect(arr.$_get(2)).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_0600
         * @tc.name int32ArrayCopyWithinPart03Test006
         * @tc.desc Verify target far negative clamps to zero
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.copyWithin(-5, 1, 3);
          expect(arr.$_get(0)).assertEqual(2);
          expect(arr.$_get(1)).assertEqual(3);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_0700
         * @tc.name int32ArrayCopyWithinPart03Test007
         * @tc.desc Verify target INT32_MAX clamps to length and writes nothing
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(2147483647, 0);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_0800
         * @tc.name int32ArrayCopyWithinPart03Test008
         * @tc.desc Verify target INT32_MIN clamps to zero
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          arr.copyWithin(-2147483648, 2);
          expect(arr.$_get(0)).assertEqual(30);
          expect(arr.$_get(1)).assertEqual(40);
          expect(arr.$_get(2)).assertEqual(30);
          expect(arr.$_get(3)).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_0900
         * @tc.name int32ArrayCopyWithinPart03Test009
         * @tc.desc Verify start past length with explicit end clamps to empty range
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          arr.copyWithin(0, 5, 4);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(20);
          expect(arr.$_get(2)).assertEqual(30);
          expect(arr.$_get(3)).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_1000
         * @tc.name int32ArrayCopyWithinPart03Test010
         * @tc.desc Verify start far positive and end far positive clamp to length giving empty range
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 6, 7]);
          arr.copyWithin(0, 999999, 999999);
          expect(arr.$_get(0)).assertEqual(5);
          expect(arr.$_get(1)).assertEqual(6);
          expect(arr.$_get(2)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_1100
         * @tc.name int32ArrayCopyWithinPart03Test011
         * @tc.desc Verify start minus length plus one clamps to zero
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(2, -5, 2);
          expect(arr.$_get(2)).assertEqual(1);
          expect(arr.$_get(3)).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_1200
         * @tc.name int32ArrayCopyWithinPart03Test012
         * @tc.desc Verify start far negative clamps to zero
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          arr.copyWithin(1, -103, 2);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(10);
          expect(arr.$_get(2)).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_1300
         * @tc.name int32ArrayCopyWithinPart03Test013
         * @tc.desc Verify start INT32_MIN clamps to zero
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          arr.copyWithin(2, -2147483648, 2);
          expect(arr.$_get(2)).assertEqual(10);
          expect(arr.$_get(3)).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_1400
         * @tc.name int32ArrayCopyWithinPart03Test014
         * @tc.desc Verify end zero with start zero gives empty range no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.copyWithin(1, 0, 0);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_1500
         * @tc.name int32ArrayCopyWithinPart03Test015
         * @tc.desc Verify end negative one on two element array maps to index one
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 6]);
          arr.copyWithin(1, 0, -1);
          expect(arr.$_get(0)).assertEqual(5);
          expect(arr.$_get(1)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_1600
         * @tc.name int32ArrayCopyWithinPart03Test016
         * @tc.desc Verify end minus length plus one clamps to zero giving empty range
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          arr.copyWithin(0, 0, -4);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(20);
          expect(arr.$_get(2)).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_1700
         * @tc.name int32ArrayCopyWithinPart03Test017
         * @tc.desc Verify end far negative clamps to zero giving empty range
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.copyWithin(0, 2, -105);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_1800
         * @tc.name int32ArrayCopyWithinPart03Test018
         * @tc.desc Verify end INT32_MAX clamps to length equivalent to omitting end
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          arr.copyWithin(0, 2, 2147483647);
          expect(arr.$_get(0)).assertEqual(30);
          expect(arr.$_get(1)).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_1900
         * @tc.name int32ArrayCopyWithinPart03Test019
         * @tc.desc Verify end INT32_MIN clamps to zero giving empty range
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(0, 0, -2147483648);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_2000
         * @tc.name int32ArrayCopyWithinPart03Test020
         * @tc.desc Verify negative end greater than negative start clamps to empty range
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.copyWithin(0, -2, -3);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_2100
         * @tc.name int32ArrayCopyWithinPart03Test021
         * @tc.desc Verify all three args equal length gives empty range no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.copyWithin(3, 3, 3);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_2200
         * @tc.name int32ArrayCopyWithinPart03Test022
         * @tc.desc Verify target far positive start far negative end far positive clamp to no write
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(9999, -9999, 9999);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_2300
         * @tc.name int32ArrayCopyWithinPart03Test023
         * @tc.desc Verify target far negative clamp zero and start far positive clamp length gives empty
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          arr.copyWithin(-9999, 9999);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(20);
          expect(arr.$_get(2)).assertEqual(30);
          expect(arr.$_get(3)).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_2400
         * @tc.name int32ArrayCopyWithinPart03Test024
         * @tc.desc Verify target far negative and end far negative clamp to empty range
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.copyWithin(-999, 0, -999);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_2500
         * @tc.name int32ArrayCopyWithinPart03Test025
         * @tc.desc Verify target at length with normal source range writes nothing
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.copyWithin(5, 0, 3);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_2600
         * @tc.name int32ArrayCopyWithinPart03Test026
         * @tc.desc Verify normal target with start past length and normal end gives empty range
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          arr.copyWithin(0, 3, 2);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(20);
          expect(arr.$_get(2)).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_2700
         * @tc.name int32ArrayCopyWithinPart03Test027
         * @tc.desc Verify all three args zero gives empty range no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(0, 0, 0);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_2800
         * @tc.name int32ArrayCopyWithinPart03Test028
         * @tc.desc Verify target zero with start two copies elements from index two
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          arr.copyWithin(0, 2);
          expect(arr.$_get(0)).assertEqual(30);
          expect(arr.$_get(1)).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_2900
         * @tc.name int32ArrayCopyWithinPart03Test029
         * @tc.desc Verify target negative zero behaves as target zero for in-place copy
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(-0, 2);
          expect(arr.$_get(0)).assertEqual(3);
          expect(arr.$_get(1)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_3000
         * @tc.name int32ArrayCopyWithinPart03Test030
         * @tc.desc Verify start zero with target two copies elements from index zero
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          arr.copyWithin(2, 0);
          expect(arr.$_get(2)).assertEqual(10);
          expect(arr.$_get(3)).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_3100
         * @tc.name int32ArrayCopyWithinPart03Test031
         * @tc.desc Verify copyWithin with negative target copies from end offset
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(-2, 0, 2);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(1);
          expect(arr.$_get(3)).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_3200
         * @tc.name int32ArrayCopyWithinPart03Test032
         * @tc.desc Verify copyWithin positive target on empty array does not throw
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          arr.copyWithin(5, 0);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_3300
         * @tc.name int32ArrayCopyWithinPart03Test033
         * @tc.desc Verify copyWithin negative target on empty array does not throw
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          arr.copyWithin(-1, 0);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_3400
         * @tc.name int32ArrayCopyWithinPart03Test034
         * @tc.desc Verify copyWithin all infinity extremes on empty array does not throw
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          arr.copyWithin(2147483647, -2147483648, 2147483647);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_3500
         * @tc.name int32ArrayCopyWithinPart03Test035
         * @tc.desc Verify single element self copy with end omitted keeps value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([42]);
          arr.copyWithin(0, 0);
          expect(arr.$_get(0)).assertEqual(42);
          expect(arr.length).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_3600
         * @tc.name int32ArrayCopyWithinPart03Test036
         * @tc.desc Verify single element start past length copies nothing
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([42]);
          arr.copyWithin(0, 1);
          expect(arr.$_get(0)).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_3700
         * @tc.name int32ArrayCopyWithinPart03Test037
         * @tc.desc Verify single element target zero start negative one end omitted self copy
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([77]);
          arr.copyWithin(0, -1);
          expect(arr.$_get(0)).assertEqual(77);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_3800
         * @tc.name int32ArrayCopyWithinPart03Test038
         * @tc.desc Verify single element all negative out of bounds clamps to no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([42]);
          arr.copyWithin(-2, -2, -2);
          expect(arr.$_get(0)).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_3900
         * @tc.name int32ArrayCopyWithinPart03Test039
         * @tc.desc Verify all negative one array copyWithin keeps all negative one
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, -1, -1, -1]);
          arr.copyWithin(1, 0);
          for (let i: int = 0; i < arr.length; i++) {
          expect(arr.$_get(i)).assertEqual(-1);
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_4000
         * @tc.name int32ArrayCopyWithinPart03Test040
         * @tc.desc Verify all same values with out of bounds indices does not change array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 5, 5]);
          arr.copyWithin(100, -100, 100);
          expect(arr.$_get(0)).assertEqual(5);
          expect(arr.$_get(1)).assertEqual(5);
          expect(arr.$_get(2)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_4100
         * @tc.name int32ArrayCopyWithinPart03Test041
         * @tc.desc Verify two same elements copyWithin zero from one keeps both same
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([9, 9]);
          arr.copyWithin(0, 1);
          expect(arr.$_get(0)).assertEqual(9);
          expect(arr.$_get(1)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_4200
         * @tc.name int32ArrayCopyWithinPart03Test042
         * @tc.desc Verify target equals start no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.copyWithin(2, 2);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_4300
         * @tc.name int32ArrayCopyWithinPart03Test043
         * @tc.desc Verify backward overlap copy source before target memmove semantics
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
          arr.copyWithin(2, 0, 4);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(1);
          expect(arr.$_get(3)).assertEqual(2);
          expect(arr.$_get(4)).assertEqual(3);
          expect(arr.$_get(5)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_4400
         * @tc.name int32ArrayCopyWithinPart03Test044
         * @tc.desc Verify forward overlap copy target before source memmove semantics
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
          arr.copyWithin(0, 2, 6);
          expect(arr.$_get(0)).assertEqual(3);
          expect(arr.$_get(1)).assertEqual(4);
          expect(arr.$_get(2)).assertEqual(5);
          expect(arr.$_get(3)).assertEqual(6);
          expect(arr.$_get(4)).assertEqual(5);
          expect(arr.$_get(5)).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_4500
         * @tc.name int32ArrayCopyWithinPart03Test045
         * @tc.desc Verify single element overlap copy target equals start plus one
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          arr.copyWithin(1, 0, 1);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(10);
          expect(arr.$_get(2)).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_4600
         * @tc.name int32ArrayCopyWithinPart03Test046
         * @tc.desc Verify three element overlap backward target one start zero end three
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(1, 0, 3);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(1);
          expect(arr.$_get(2)).assertEqual(2);
          expect(arr.$_get(3)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_4700
         * @tc.name int32ArrayCopyWithinPart03Test047
         * @tc.desc Verify fully overlapped copy target one on five element array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.copyWithin(1, 0, 4);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(1);
          expect(arr.$_get(2)).assertEqual(2);
          expect(arr.$_get(3)).assertEqual(3);
          expect(arr.$_get(4)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_4800
         * @tc.name int32ArrayCopyWithinPart03Test048
         * @tc.desc Verify copyWithin on zero length subarray view returns same view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let sub: Int32Array = arr.subarray(2, 2);
          let r: Int32Array = sub.copyWithin(0, 0);
          expect(r.length).assertEqual(0);
          expect(r).assertEqual(sub);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_4900
         * @tc.name int32ArrayCopyWithinPart03Test049
         * @tc.desc Verify copyWithin self copy on single element subarray reflects to parent
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let sub: Int32Array = arr.subarray(1, 2);
          sub.copyWithin(0, 0);
          expect(sub.$_get(0)).assertEqual(20);
          expect(arr.$_get(1)).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_5000
         * @tc.name int32ArrayCopyWithinPart03Test050
         * @tc.desc Verify copyWithin on non-zero byteOffset child view writes back to parent buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(32);
          let parent: Int32Array = new Int32Array(buf);
          for (let i: int = 0; i < 8; i++) {
          parent.$_set(i, i + 1);
          }
          let child: Int32Array = new Int32Array(buf, 8, 4);
          child.copyWithin(2, 0, 2);
          expect(parent.$_get(2)).assertEqual(3);
          expect(parent.$_get(3)).assertEqual(4);
          expect(parent.$_get(4)).assertEqual(3);
          expect(parent.$_get(5)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_5100
         * @tc.name int32ArrayCopyWithinPart03Test051
         * @tc.desc Verify out of bounds target on child view does not modify buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(24);
          let parent: Int32Array = new Int32Array(buf);
          for (let i: int = 0; i < 6; i++) {
          parent.$_set(i, i);
          }
          let child: Int32Array = new Int32Array(buf, 8, 3);
          child.copyWithin(5, 0);
          expect(parent.$_get(2)).assertEqual(2);
          expect(parent.$_get(3)).assertEqual(3);
          expect(parent.$_get(4)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_5200
         * @tc.name int32ArrayCopyWithinPart03Test052
         * @tc.desc Verify overlapping views on same ArrayBuffer observe writes from copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let a: Int32Array = new Int32Array(buf);
          let b: Int32Array = new Int32Array(buf, 4, 3);
          a.$_set(0, 11);
          a.$_set(1, 22);
          a.$_set(2, 33);
          a.$_set(3, 44);
          b.copyWithin(0, 1);
          expect(a.$_get(1)).assertEqual(33);
          expect(a.$_get(2)).assertEqual(44);
          expect(a.$_get(3)).assertEqual(44);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_5300
         * @tc.name int32ArrayCopyWithinPart03Test053
         * @tc.desc Verify copyWithin on zero length subarray does not affect parent
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let sub: Int32Array = arr.subarray(3, 3);
          sub.copyWithin(0, 0, 0);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_5400
         * @tc.name int32ArrayCopyWithinPart03Test054
         * @tc.desc Verify extreme INT32 bounds combination does not throw
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(-2147483648, -2147483648, 2147483647);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_5500
         * @tc.name int32ArrayCopyWithinPart03Test055
         * @tc.desc Verify consecutive extreme index calls do not throw
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.copyWithin(999, 0);
          arr.copyWithin(-999, 999);
          arr.copyWithin(0, -999, 999);
          arr.copyWithin(0, 0, -999);
          expect(arr.length).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_5600
         * @tc.name int32ArrayCopyWithinPart03Test056
         * @tc.desc Verify INT32_MAX start and INT32_MIN end combination does not throw
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.copyWithin(0, 2147483647, -2147483648);
          expect(arr.length).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_5700
         * @tc.name int32ArrayCopyWithinPart03Test057
         * @tc.desc Verify copyWithin on array with boundary int values does not throw
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2147483647, -2147483648, 0, -1, 1]);
          arr.copyWithin(0, 1);
          expect(arr.$_get(0)).assertEqual(-2147483648);
          expect(arr.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_5800
         * @tc.name int32ArrayCopyWithinPart03Test058
         * @tc.desc Verify INT32_MAX element copied via single element overlap stays INT32_MAX
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          arr.$_set(0, 2147483647);
          arr.$_set(1, 0);
          arr.$_set(2, 0);
          arr.$_set(3, 0);
          arr.copyWithin(1, 0, 1);
          expect(arr.$_get(1)).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_5900
         * @tc.name int32ArrayCopyWithinPart03Test059
         * @tc.desc Verify INT32_MIN element copied via forward overlap stays INT32_MIN
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          arr.$_set(0, 0);
          arr.$_set(1, 0);
          arr.$_set(2, -2147483648);
          arr.$_set(3, 0);
          arr.copyWithin(0, 2, 3);
          expect(arr.$_get(0)).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_6000
         * @tc.name int32ArrayCopyWithinPart03Test060
         * @tc.desc Verify negative one element copied to target position stays negative one
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, -1, 0]);
          arr.copyWithin(2, 0, 1);
          expect(arr.$_get(2)).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_6100
         * @tc.name int32ArrayCopyWithinPart03Test061
         * @tc.desc Verify zero element copied over non-zero correctly overwrites to zero
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 5, 5]);
          arr.copyWithin(1, 0, 1);
          expect(arr.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_6200
         * @tc.name int32ArrayCopyWithinPart03Test062
         * @tc.desc Verify negative INT32_MIN minus one wraps to INT32_MAX after ToInt32
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.$_set(0, -2147483649);
          arr.$_set(1, 0);
          arr.$_set(2, 0);
          arr.copyWithin(2, 0, 1);
          expect(arr.$_get(2)).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_6300
         * @tc.name int32ArrayCopyWithinPart03Test063
         * @tc.desc Verify zero element retains zero after copyWithin transit
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.$_set(0, 0);
          arr.$_set(1, 1);
          arr.$_set(2, 2);
          arr.copyWithin(1, 0, 1);
          expect(arr.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_6400
         * @tc.name int32ArrayCopyWithinPart03Test064
         * @tc.desc Verify negative zero element stored as zero after copyWithin transit
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.$_set(0, -0);
          arr.$_set(1, 1);
          arr.$_set(2, 2);
          arr.copyWithin(2, 0, 1);
          expect(arr.$_get(2)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_6500
         * @tc.name int32ArrayCopyWithinPart03Test065
         * @tc.desc Verify INT32_MAX fractional truncates to INT32_MAX after copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.$_set(0, 2147483647.9);
          arr.$_set(1, 0);
          arr.$_set(2, 0);
          arr.copyWithin(1, 0, 1);
          expect(arr.$_get(1)).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_6600
         * @tc.name int32ArrayCopyWithinPart03Test066
         * @tc.desc Verify two to the 32nd power ToInt32 zero after copyWithin transit
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.$_set(0, 4294967296);
          arr.$_set(1, 1);
          arr.$_set(2, 2);
          arr.copyWithin(1, 0, 1);
          expect(arr.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_6700
         * @tc.name int32ArrayCopyWithinPart03Test067
         * @tc.desc Verify two to the 32nd plus one ToInt32 one after copyWithin transit
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.$_set(0, 4294967297);
          arr.$_set(1, 0);
          arr.$_set(2, 0);
          arr.copyWithin(2, 0, 1);
          expect(arr.$_get(2)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_6800
         * @tc.name int32ArrayCopyWithinPart03Test068
         * @tc.desc Verify idempotence of same copyWithin called twice equals once
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a1: Int32Array = new Int32Array([1, 2, 3, 4]);
          let a2: Int32Array = new Int32Array([1, 2, 3, 4]);
          a1.copyWithin(2, 0, 2);
          a2.copyWithin(2, 0, 2);
          a2.copyWithin(2, 0, 2);
          expect(a2.$_get(2)).assertEqual(a1.$_get(2));
          expect(a2.$_get(3)).assertEqual(a1.$_get(3));
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_6900
         * @tc.name int32ArrayCopyWithinPart03Test069
         * @tc.desc Verify for-of iteration observes copyWithin modified order
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          arr.copyWithin(0, 2);
          let seen: Array<number> = [];
          for (let v of arr) {
          seen.push(v);
          }
          expect(seen.length).assertEqual(4);
          expect(seen[0]).assertEqual(30);
          expect(seen[1]).assertEqual(40);
          expect(seen[2]).assertEqual(30);
          expect(seen[3]).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_7000
         * @tc.name int32ArrayCopyWithinPart03Test070
         * @tc.desc Verify forEach callback count equals length after no-op copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.copyWithin(100, 0);
          let count: number = 0;
          arr.forEach((_v: number, _i: int, _a: Int32Array): void => {
          count++;
        });
          expect(count).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_7100
         * @tc.name int32ArrayCopyWithinPart03Test071
         * @tc.desc Verify indexOf finds copied elements at new positions
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          arr.copyWithin(0, 2);
          expect(arr.indexOf(30)).assertEqual(0);
          expect(arr.indexOf(40)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_7200
         * @tc.name int32ArrayCopyWithinPart03Test072
         * @tc.desc Verify includes returns true for copied elements at new positions
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(2, 0, 2);
          let found1: boolean = arr.includes(1);
          let found2: boolean = arr.includes(2);
          expect(found1).assertTrue();
          expect(found2).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_7300
         * @tc.name int32ArrayCopyWithinPart03Test073
         * @tc.desc Verify join string reflects new order after copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(0, 2);
          expect(arr.join(',')).assertEqual('3,4,3,4');
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART03_7400
         * @tc.name int32ArrayCopyWithinPart03Test074
         * @tc.desc Verify copyWithin returns the same array instance
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let r: Int32Array = arr.copyWithin(1, 0, 2);
          expect(r).assertEqual(arr);
        });
  });
}
