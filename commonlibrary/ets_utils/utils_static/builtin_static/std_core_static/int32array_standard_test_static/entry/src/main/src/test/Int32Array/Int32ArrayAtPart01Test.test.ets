'use static'


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int32ArrayAtPart01TestMindmapTestTest(): void {
  describe('Int32ArrayAtPart01TestMindmapTestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayAtPart01TestMindmapTest001
     * @tc.desc Verify 1 at(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20, 30);
      const r: number | undefined = v.at(1);
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayAtPart01TestMindmapTest002
     * @tc.desc Verify 1 at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20, 30);
      const r: number | undefined = v.at(-1);
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayAtPart01TestMindmapTest003
     * @tc.desc Verify int at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(11, 22, 33);
      let idx: int = 2;
      const r: number | undefined = v.at(Double.toInt(idx));
      expect(r).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayAtPart01TestMindmapTest004
     * @tc.desc Verify const int at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(100, 200);
      const k: int = 0;
      const r: number | undefined = v.at(k);
      expect(r).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayAtPart01TestMindmapTest005
     * @tc.desc Verify 1+1=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20, 30);
      const r: number | undefined = v.at(1 + 1);
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayAtPart01TestMindmapTest006
     * @tc.desc Verify undefined for representative indices on an empty Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = new Int32Array(0);
      expect(v.at(0)).assertUndefined();
      expect(v.at(-1)).assertUndefined();
      expect(v.at(1)).assertUndefined();
      expect(v.at(-2)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayAtPart01TestMindmapTest007
     * @tc.desc Verify at(2147483647) INT_MAX undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = new Int32Array(0);
      const r: number | undefined = v.at(2147483647);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayAtPart01TestMindmapTest008
     * @tc.desc Verify at(-2147483648) INT_MIN undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = new Int32Array(0);
      const r: number | undefined = v.at(-2147483648);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayAtPart01TestMindmapTest009
     * @tc.desc Verify positive out-of-bounds indices on a one-element Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(77);
      expect(v.at(1)).assertUndefined();
      expect(v.at(2)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayAtPart01TestMindmapTest010
     * @tc.desc Verify at(2147483647) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(77);
      const r: number | undefined = v.at(2147483647);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArrayAtPart01TestMindmapTest011
     * @tc.desc Verify at(-1) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(77);
      const r: number | undefined = v.at(-1);
      expect(r).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArrayAtPart01TestMindmapTest012
     * @tc.desc Verify negative out-of-bounds indices on a one-element Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(77);
      expect(v.at(-2)).assertUndefined();
      expect(v.at(-3)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArrayAtPart01TestMindmapTest013
     * @tc.desc Verify at(-2147483648) INT_MIN undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(77);
      const r: number | undefined = v.at(-2147483648);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArrayAtPart01TestMindmapTest014
     * @tc.desc Verify at(1) length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20);
      const r: number | undefined = v.at(1);
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArrayAtPart01TestMindmapTest015
     * @tc.desc Verify positive out-of-bounds indices on a two-element Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20);
      expect(v.at(2)).assertUndefined();
      expect(v.at(3)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArrayAtPart01TestMindmapTest016
     * @tc.desc Verify at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20);
      const r: number | undefined = v.at(-1);
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArrayAtPart01TestMindmapTest017
     * @tc.desc Verify at(-2) -length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20);
      const r: number | undefined = v.at(-2);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArrayAtPart01TestMindmapTest018
     * @tc.desc Verify negative out-of-bounds indices on a two-element Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20);
      expect(v.at(-3)).assertUndefined();
      expect(v.at(-4)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArrayAtPart01TestMindmapTest019
     * @tc.desc Verify at(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      const r: number | undefined = v.at(1);
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArrayAtPart01TestMindmapTest020
     * @tc.desc Verify at(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      const r: number | undefined = v.at(2);
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArrayAtPart01TestMindmapTest021
     * @tc.desc Verify at(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      const r: number | undefined = v.at(3);
      expect(r).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArrayAtPart01TestMindmapTest022
     * @tc.desc Verify at(4) length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      const r: number | undefined = v.at(4);
      expect(r).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArrayAtPart01TestMindmapTest023
     * @tc.desc Verify positive out-of-bounds indices on a five-element Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      expect(v.at(5)).assertUndefined();
      expect(v.at(6)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArrayAtPart01TestMindmapTest024
     * @tc.desc Verify at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      const r: number | undefined = v.at(-1);
      expect(r).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArrayAtPart01TestMindmapTest025
     * @tc.desc Verify at(-2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      const r: number | undefined = v.at(-2);
      expect(r).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArrayAtPart01TestMindmapTest026
     * @tc.desc Verify at(-3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      const r: number | undefined = v.at(-3);
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArrayAtPart01TestMindmapTest027
     * @tc.desc Verify at(-4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      const r: number | undefined = v.at(-4);
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArrayAtPart01TestMindmapTest028
     * @tc.desc Verify at(-5) -length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      const r: number | undefined = v.at(-5);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArrayAtPart01TestMindmapTest029
     * @tc.desc Verify negative out-of-bounds indices on a five-element Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      expect(v.at(-6)).assertUndefined();
      expect(v.at(-7)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArrayAtPart01TestMindmapTest030
     * @tc.desc Verify index=2147483647 INT_MAX undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20, 30);
      const r: number | undefined = v.at(2147483647);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArrayAtPart01TestMindmapTest031
     * @tc.desc Verify index=-2147483648 INT_MIN undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20, 30);
      const r: number | undefined = v.at(-2147483648);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArrayAtPart01TestMindmapTest032
     * @tc.desc Verify index=2147483646 INT_MAX-1 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20, 30);
      const r: number | undefined = v.at(2147483646);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArrayAtPart01TestMindmapTest033
     * @tc.desc Verify index=-2147483647 INT_MIN+1 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20, 30);
      const r: number | undefined = v.at(-2147483647);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArrayAtPart01TestMindmapTest034
     * @tc.desc Verify INT_MAX (2147483647) at(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(-1, 2147483647, 3);
      const r: number | undefined = v.at(1);
      expect(r).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArrayAtPart01TestMindmapTest035
     * @tc.desc Verify INT_MIN (-2147483648) at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(-2147483648, 0, 1);
      const r: number | undefined = v.at(0);
      expect(r).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArrayAtPart01TestMindmapTest036
     * @tc.desc Verify INT_MIN at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(1, 0, -2147483648);
      const r: number | undefined = v.at(-1);
      expect(r).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArrayAtPart01TestMindmapTest037
     * @tc.desc Verify -1 at(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(100, -1, 200);
      const r: number | undefined = v.at(1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArrayAtPart01TestMindmapTest038
     * @tc.desc Verify -1 at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(100, 200, -1);
      const r: number | undefined = v.at(-1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArrayAtPart01TestMindmapTest039
     * @tc.desc Verify 0 at(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(5, 0, -5);
      const r: number | undefined = v.at(1);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArrayAtPart01TestMindmapTest040
     * @tc.desc Verify 1 at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(1, 2);
      const r: number | undefined = v.at(0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArrayAtPart01TestMindmapTest041
     * @tc.desc Verify INT_MAX at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(2147483647);
      const r: number | undefined = v.at(0);
      expect(r).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArrayAtPart01TestMindmapTest042
     * @tc.desc Verify INT_MIN at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(-2147483648);
      const r: number | undefined = v.at(-1);
      expect(r).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArrayAtPart01TestMindmapTest043
     * @tc.desc Verify 0 at(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(0);
      const r: number | undefined = v.at(0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArrayAtPart01TestMindmapTest044
     * @tc.desc Verify at(v.length-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(9, 8, 7);
      const r: number | undefined = v.at(v.length - 1);
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArrayAtPart01TestMindmapTest045
     * @tc.desc Verify at(-v.length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(9, 8, 7);
      const r: number | undefined = v.at(-v.length);
      expect(r).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArrayAtPart01TestMindmapTest046
     * @tc.desc Verify at(v.length) length undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(9, 8, 7);
      const r: number | undefined = v.at(v.length);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArrayAtPart01TestMindmapTest047
     * @tc.desc Verify at(-v.length-1) -(length+1) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(9, 8, 7);
      const r: number | undefined = v.at(-v.length - 1);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArrayAtPart01TestMindmapTest048
     * @tc.desc Verify 0x0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(111, 222, 333);
      const r: number | undefined = v.at(Double.toInt(0x0));
      expect(r).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArrayAtPart01TestMindmapTest049
     * @tc.desc Verify 0x2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(111, 222, 333);
      const r: number | undefined = v.at(Double.toInt(0x2));
      expect(r).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArrayAtPart01TestMindmapTest050
     * @tc.desc Verify 0o1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20);
      const r: number | undefined = v.at(Double.toInt(0o1));
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArrayAtPart01TestMindmapTest051
     * @tc.desc Verify 0b10 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(1, 2, 4);
      const r: number | undefined = v.at(Double.toInt(0b10));
      expect(r).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArrayAtPart01TestMindmapTest052
     * @tc.desc Verify -0x1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(8, 9, 10);
      const r: number | undefined = v.at(-0x1);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArrayAtPart01TestMindmapTest053
     * @tc.desc Verify -0x2 -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(8, 9, 10);
      const r: number | undefined = v.at(-0x2);
      expect(r).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArrayAtPart01TestMindmapTest054
     * @tc.desc Verify new Int32Array(buf,0,3) at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(12);
      const v: Int32Array = new Int32Array(buf, 0, 3);
      v.$_set(0, 100);
      v.$_set(1, 200);
      v.$_set(2, 300);
      const r: number | undefined = v.at(0);
      expect(r).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArrayAtPart01TestMindmapTest055
     * @tc.desc Verify new Int32Array(buf,4,2) byteOffset at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const v: Int32Array = new Int32Array(buf, 4, 2);
      v.$_set(0, 111);
      v.$_set(1, 222);
      const r: number | undefined = v.at(0);
      expect(r).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArrayAtPart01TestMindmapTest056
     * @tc.desc Verify new Int32Array(buf,4,2) byteOffset at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const v: Int32Array = new Int32Array(buf, 4, 2);
      v.$_set(0, 111);
      v.$_set(1, 222);
      const r: number | undefined = v.at(-1);
      expect(r).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArrayAtPart01TestMindmapTest057
     * @tc.desc Verify positive and negative out-of-bounds indices on an ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const v: Int32Array = new Int32Array(buf, 4, 2);
      expect(v.at(2)).assertUndefined();
      expect(v.at(-3)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArrayAtPart01TestMindmapTest058
     * @tc.desc Verify Int32Array.from([1,2,3,4,5]) at(0) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: int[] = [1, 2, 3, 4, 5];
      const v: Int32Array = Int32Array.from(src);
      const r: number | undefined = v.at(0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_5900
     * @tc.name int32ArrayAtPart01TestMindmapTest059
     * @tc.desc Verify Int32Array.from([1,2,3,4,5]) at(-1) 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: int[] = [1, 2, 3, 4, 5];
      const v: Int32Array = Int32Array.from(src);
      const r: number | undefined = v.at(-1);
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArrayAtPart01TestMindmapTest060
     * @tc.desc Verify new Int32Array(4) at(3) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = new Int32Array(4);
      const r: number | undefined = v.at(3);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_6100
     * @tc.name int32ArrayAtPart01TestMindmapTest061
     * @tc.desc Verify new Int32Array(4) $_set(3,999) at(3) 999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = new Int32Array(4);
      v.$_set(3, 999);
      const r: number | undefined = v.at(3);
      expect(r).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_6200
     * @tc.name int32ArrayAtPart01TestMindmapTest062
     * @tc.desc Verify representative endpoints on a four-element Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(5, 5, 5, 5);
      expect(v.at(0)).assertEqual(5);
      expect(v.at(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_6300
     * @tc.name int32ArrayAtPart01TestMindmapTest063
     * @tc.desc Verify at(0)/at(1)/at(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(101, 202, 303);
      expect(v.at(0)).assertEqual(101);
      expect(v.at(1)).assertEqual(202);
      expect(v.at(2)).assertEqual(303);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_6400
     * @tc.name int32ArrayAtPart01TestMindmapTest064
     * @tc.desc Verify at(-3)/at(-2)/at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(101, 202, 303);
      expect(v.at(-3)).assertEqual(101);
      expect(v.at(-2)).assertEqual(202);
      expect(v.at(-1)).assertEqual(303);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_6500
     * @tc.name int32ArrayAtPart01TestMindmapTest065
     * @tc.desc Verify at(0) equals at(-length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20, 30, 40);
      const r0: number | undefined = v.at(0);
      const negativeIndexResult: number | undefined = v.at(-v.length);
      expect(r0).assertEqual(negativeIndexResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_6600
     * @tc.name int32ArrayAtPart01TestMindmapTest066
     * @tc.desc Verify at(length-1) at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20, 30, 40);
      const rLast: number | undefined = v.at(v.length - 1);
      const rNeg1: number | undefined = v.at(-1);
      expect(rLast).assertEqual(rNeg1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_6700
     * @tc.name int32ArrayAtPart01TestMindmapTest067
     * @tc.desc Verify i>0?1:0 i=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(100, 200);
      let i: int = 1;
      const r: number | undefined = v.at(i > 0 ? 1 : 0);
      expect(r).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_6800
     * @tc.name int32ArrayAtPart01TestMindmapTest068
     * @tc.desc Verify i>0?1:0 i=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(100, 200);
      let i: int = 0;
      const r: number | undefined = v.at(i > 0 ? 1 : 0);
      expect(r).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_6900
     * @tc.name int32ArrayAtPart01TestMindmapTest069
     * @tc.desc Verify length=8 at(7) length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20, 30, 40, 50, 60, 70, 80);
      const r: number | undefined = v.at(7);
      expect(r).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_7000
     * @tc.name int32ArrayAtPart01TestMindmapTest070
     * @tc.desc Verify length=8 at(8) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20, 30, 40, 50, 60, 70, 80);
      const r: number | undefined = v.at(8);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_7100
     * @tc.name int32ArrayAtPart01TestMindmapTest071
     * @tc.desc Verify length=8 at(-8) -length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20, 30, 40, 50, 60, 70, 80);
      const r: number | undefined = v.at(-8);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_7200
     * @tc.name int32ArrayAtPart01TestMindmapTest072
     * @tc.desc Verify length=8 at(-9) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Int32Array = Int32Array.of(10, 20, 30, 40, 50, 60, 70, 80);
      const r: number | undefined = v.at(-9);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_7300
     * @tc.name int32ArrayAtPart01TestMindmapTest073
     * @tc.desc Verify subarray(1,4) at(0) 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      const sub: Int32Array = parent.subarray(1, 4);
      const r: number | undefined = sub.at(0);
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_7400
     * @tc.name int32ArrayAtPart01TestMindmapTest074
     * @tc.desc Verify subarray(1,4) at(-1) 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      const sub: Int32Array = parent.subarray(1, 4);
      const r: number | undefined = sub.at(-1);
      expect(r).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART01_TEST_MINDMAP_7500
     * @tc.name int32ArrayAtPart01TestMindmapTest075
     * @tc.desc Verify positive and negative out-of-bounds indices on a subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('int32ArrayAtPart01TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      const sub: Int32Array = parent.subarray(1, 4);
      expect(sub.at(3)).assertUndefined();
      expect(sub.at(-4)).assertUndefined();
    });

  });
}
