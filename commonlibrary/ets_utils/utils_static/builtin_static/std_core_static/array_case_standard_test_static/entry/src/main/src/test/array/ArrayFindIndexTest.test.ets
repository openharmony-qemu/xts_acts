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
} from '../../../../hypium/index';
import Utils from '../Util.test';

class FindIndexPerson007 {
  id: int = 0;
  name: string = '';
}

export default function ArrayFindIndexTest(): void {
  describe('ArrayFindIndexTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_0100
     * @tc.name testArrayFindIndex001
     * @tc.desc Verify findIndex accepts a predicate function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.findIndex((v: number): boolean => v > 15);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_0200
     * @tc.name testArrayFindIndex002
     * @tc.desc Verify findIndex predicate can use the index argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindIndex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.findIndex((v: number, i: int): boolean => i > 1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_0300
     * @tc.name testArrayFindIndex003
     * @tc.desc Verify findIndex returns the first matching index and minus one otherwise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindIndex003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 20, 40);
      expect(arr.findIndex((v: number): boolean => v == 20)).assertEqual(1);
      expect(arr.findIndex((v: number): boolean => v > 100)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_0400
     * @tc.name testArrayFindIndex004
     * @tc.desc Verify empty arrays return minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindIndex004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      expect(arr.findIndex((v: number): boolean => true)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_0500
     * @tc.name testArrayFindIndex005
     * @tc.desc Verify findIndex can match the first and last elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindIndex005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      expect(arr.findIndex((v: number): boolean => v > 5)).assertEqual(0);
      expect(arr.findIndex((v: number): boolean => v > 25)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_0600
     * @tc.name testArrayFindIndex006
     * @tc.desc Verify findIndex works with object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindIndex006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1 = new FindIndexPerson007();
      p1.id = 1;
      p1.name = 'Alice';
      const p2 = new FindIndexPerson007();
      p2.id = 2;
      p2.name = 'Bob';
      const arr = new Array<FindIndexPerson007>(p1, p2);
      const result = arr.findIndex((p: FindIndexPerson007): boolean => p.id == 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_0700
     * @tc.name testArrayFindIndex007
     * @tc.desc Verify findIndex can be used to check existence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindIndex007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const exists = arr.findIndex((v: number): boolean => v > 25) != -1;
      expect(exists).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_0800
     * @tc.name testArrayFindIndex008
     * @tc.desc Verify findIndex can match indexOf for equivalent lookups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindIndex008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result1 = arr.findIndex((v: number): boolean => v > 15);
      const result2 = arr.indexOf(20);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_0900
     * @tc.name testArrayFindIndex009
     * @tc.desc Verify findIndex returns an int typed index value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindIndex009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const result = arr.findIndex(v => v > 25 && v < 35);
      expect(result).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_1000
     * @tc.name testArrayFindIndex010
     * @tc.desc Verify documented scenario 5.2 检查元素存在
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindIndex010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const exists = arr.findIndex(v => v > 25) !== -1;
      expect(exists).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_1100
     * @tc.name testArrayFindIndex011
     * @tc.desc Verify documented scenario 6.1 findIndex vs indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindIndex011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result1 = arr.findIndex(v => v > 15);
      const result2 = arr.indexOf(20);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_INDEX_1200
     * @tc.name testArrayFindIndex012
     * @tc.desc Verify documented scenario 7.1 int类型
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindIndex012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result: int = arr.findIndex(v => v === 2);
      expect(result).assertEqual(1);
    });

  });
}
