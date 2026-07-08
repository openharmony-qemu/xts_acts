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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

class FindLastIndexItem006 {
  value: int = 0;
}

export default function ArrayFindLastIndexTest(): void {
  describe('ArrayFindLastIndexTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_0100
     * @tc.name testArrayFindLastIndex001
     * @tc.desc Verify findLastIndex accepts a predicate function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindLastIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 20, 10);
      const result = arr.findLastIndex((v: number): boolean => v == 20);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_0200
     * @tc.name testArrayFindLastIndex002
     * @tc.desc Verify findLastIndex searches from the tail of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindLastIndex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const result = arr.findLastIndex((v: number): boolean => v < 40);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_0300
     * @tc.name testArrayFindLastIndex003
     * @tc.desc Verify findLastIndex returns minus one when nothing matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindLastIndex003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      expect(arr.findLastIndex((v: number): boolean => v > 100)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_0400
     * @tc.name testArrayFindLastIndex004
     * @tc.desc Verify empty arrays return minus one for findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindLastIndex004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      expect(arr.findLastIndex((v: number): boolean => true)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_0500
     * @tc.name testArrayFindLastIndex005
     * @tc.desc Verify findLastIndex can match the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindLastIndex005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.findLastIndex((v: number): boolean => v > 25);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_0600
     * @tc.name testArrayFindLastIndex006
     * @tc.desc Verify findLastIndex works with object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindLastIndex006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i1 = new FindLastIndexItem006();
      i1.value = 10;
      const i2 = new FindLastIndexItem006();
      i2.value = 20;
      const i3 = new FindLastIndexItem006();
      i3.value = 10;
      const arr = new Array<FindLastIndexItem006>(i1, i2, i3);
      const result = arr.findLastIndex((item: FindLastIndexItem006): boolean => item.value == 10);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_0700
     * @tc.name testArrayFindLastIndex007
     * @tc.desc Verify findLastIndex can locate the final modulo match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindLastIndex007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const result = arr.findLastIndex((v: number): boolean => v % 3 == 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_0800
     * @tc.name testArrayFindLastIndex008
     * @tc.desc Verify findIndex and findLastIndex can differ on repeated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindLastIndex008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 20, 10);
      const first = arr.findIndex((v: number): boolean => v == 20);
      const last = arr.findLastIndex((v: number): boolean => v == 20);
      expect(first).assertEqual(1);
      expect(last).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_INDEX_0900
     * @tc.name testArrayFindLastIndex009
     * @tc.desc Verify documented scenario 5.2 与findIndex对比
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindLastIndex009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 20, 10);
      const first = arr.findIndex(v => v === 20);
      const last = arr.findLastIndex(v => v === 20);
      expect(first).assertEqual(1);
      expect(last).assertEqual(3);
    });

  });
}
