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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArrayCopyWithinTest2(): void {
  describe('Uint32ArrayCopyWithinTest2', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_0100
     * @tc.name testUint32ArrayCopyWithinPartTwo001
     * @tc.desc Verify copyWithin(0,2,4) result[0] 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.copyWithin(0, 2, 4);
      expect(result[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_0200
     * @tc.name testUint32ArrayCopyWithinPartTwo002
     * @tc.desc Verify copyWithin(0,0,1) result[0] 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(7);
      const result = src.copyWithin(0, 0, 1);
      expect(result[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_0300
     * @tc.name testUint32ArrayCopyWithinPartTwo003
     * @tc.desc Verify copyWithin(0,0,0) result.length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(0);
      const result = src.copyWithin(0, 0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_0400
     * @tc.name testUint32ArrayCopyWithinPartTwo004
     * @tc.desc Verify copyWithin(0,3,1) no-op result[0] 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.copyWithin(0, 3, 1);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_0500
     * @tc.name testUint32ArrayCopyWithinPartTwo005
     * @tc.desc Verify copyWithin(-1,0,1) result[3] 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.copyWithin(-1, 0, 1);
      expect(result[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_0600
     * @tc.name testUint32ArrayCopyWithinPartTwo006
     * @tc.desc Verify copyWithin(0,1,-1) result[0] 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.copyWithin(0, 1, -1);
      expect(result[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_0700
     * @tc.name testUint32ArrayCopyWithinPartTwo007
     * @tc.desc Verify chained copyWithin result[0] 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.copyWithin(0, 2, 4).copyWithin(0, 1, 3);
      expect(result[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_0800
     * @tc.name testUint32ArrayCopyWithinPartTwo008
     * @tc.desc Verify copyWithin(1,1,3) result[1] 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.copyWithin(1, 1, 3);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_0900
     * @tc.name testUint32ArrayCopyWithinPartTwo009
     * @tc.desc Verify copyWithin typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.copyWithin(0, 2, 4);
      expect(result).assertEqual(src);
      expect(src.join(',')).assertEqual('3,4,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_1000
     * @tc.name testUint32ArrayCopyWithinPartTwo010
     * @tc.desc Verify copyWithin returns same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.copyWithin(0, 2, 4);
      expect(result.buffer).assertEqual(src.buffer);
      expect(src.join(',')).assertEqual('3,4,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_1100
     * @tc.name testUint32ArrayCopyWithinPartTwo011
     * @tc.desc Verify copyWithin length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.copyWithin(0, 2, 4);
      expect(result.length).assertEqual(4);
      expect(src.join(',')).assertEqual('3,4,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_1200
     * @tc.name testUint32ArrayCopyWithinPartTwo012
     * @tc.desc Verify copyWithin byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.copyWithin(0, 2, 4);
      expect(result.byteLength).assertEqual(16);
      expect(src.join(',')).assertEqual('3,4,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_1300
     * @tc.name testUint32ArrayCopyWithinPartTwo013
     * @tc.desc Verify copyWithin byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.copyWithin(0, 2, 4);
      expect(result.byteOffset).assertEqual(0);
      expect(src.join(',')).assertEqual('3,4,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_1400
     * @tc.name testUint32ArrayCopyWithinPartTwo014
     * @tc.desc Verify copyWithin BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.copyWithin(0, 2, 4);
      expect(result.BYTES_PER_ELEMENT).assertEqual(4);
      expect(src.join(',')).assertEqual('3,4,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_1500
     * @tc.name testUint32ArrayCopyWithinPartTwo015
     * @tc.desc Verify copyWithin valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.copyWithin(0, 2, 4);
      expect(result.valueOf()).assertEqual(src);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_1600
     * @tc.name testUint32ArrayCopyWithinPartTwo016
     * @tc.desc Verify copyWithin valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.copyWithin(0, 2, 4);
      expect(result.valueOf()).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_1700
     * @tc.name testUint32ArrayCopyWithinPartTwo017
     * @tc.desc Verify copyWithin (=== this)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.copyWithin(0, 2, 4).copyWithin(0, 1, 3);
      expect(result).assertEqual(src);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_1800
     * @tc.name testUint32ArrayCopyWithinPartTwo018
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      src.copyWithin(0, 2, 4);
      expect(src.$_get(0)).assertEqual(3);
      expect(src.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_1900
     * @tc.name testUint32ArrayCopyWithinPartTwo019
     * @tc.desc Verify copyWithin target start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      src.copyWithin(0, 3, 5);
      expect(src.$_get(0)).assertEqual(4);
      expect(src.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_2000
     * @tc.name testUint32ArrayCopyWithinPartTwo020
     * @tc.desc Verify copyWithin target start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      src.copyWithin(2, 0, 3);
      expect(src.$_get(2)).assertEqual(1);
      expect(src.$_get(3)).assertEqual(2);
      expect(src.$_get(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_2100
     * @tc.name testUint32ArrayCopyWithinPartTwo021
     * @tc.desc Verify copyWithin target start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      src.copyWithin(1, 1, 3);
      expect(src.$_get(0)).assertEqual(1);
      expect(src.$_get(1)).assertEqual(2);
      expect(src.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_2200
     * @tc.name testUint32ArrayCopyWithinPartTwo022
     * @tc.desc Verify copyWithin target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      src.copyWithin(-1, 0, 1);
      expect(src.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_2300
     * @tc.name testUint32ArrayCopyWithinPartTwo023
     * @tc.desc Verify copyWithin start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      src.copyWithin(0, -2, 4);
      expect(src.$_get(0)).assertEqual(3);
      expect(src.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_2400
     * @tc.name testUint32ArrayCopyWithinPartTwo024
     * @tc.desc Verify copyWithin end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      src.copyWithin(0, 1, -1);
      expect(src.$_get(0)).assertEqual(2);
      expect(src.$_get(1)).assertEqual(3);
      expect(src.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_2500
     * @tc.name testUint32ArrayCopyWithinPartTwo025
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      src.copyWithin(-2, -3, -1);
      expect(src.$_get(3)).assertEqual(3);
      expect(src.$_get(4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_2600
     * @tc.name testUint32ArrayCopyWithinPartTwo026
     * @tc.desc Verify copyWithin end length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      src.copyWithin(0, 2, 100);
      expect(src.$_get(0)).assertEqual(3);
      expect(src.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_2700
     * @tc.name testUint32ArrayCopyWithinPartTwo027
     * @tc.desc Verify copyWithin start length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      src.copyWithin(0, 100, 200);
      expect(src.$_get(0)).assertEqual(1);
      expect(src.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_2800
     * @tc.name testUint32ArrayCopyWithinPartTwo028
     * @tc.desc Verify copyWithin start end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      src.copyWithin(0, 3, 1);
      expect(src.$_get(0)).assertEqual(1);
      expect(src.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_2900
     * @tc.name testUint32ArrayCopyWithinPartTwo029
     * @tc.desc Verify copyWithin target length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      src.copyWithin(10, 0, 2);
      expect(src.$_get(0)).assertEqual(1);
      expect(src.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_3000
     * @tc.name testUint32ArrayCopyWithinPartTwo030
     * @tc.desc Verify copyWithin target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      src.copyWithin(3, 0, 2);
      expect(src.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_3100
     * @tc.name testUint32ArrayCopyWithinPartTwo031
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      src.copyWithin(0, 2, 3);
      expect(src.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_3200
     * @tc.name testUint32ArrayCopyWithinPartTwo032
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      src.copyWithin(0, 0, 4);
      expect(src.$_get(0)).assertEqual(1);
      expect(src.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_3300
     * @tc.name testUint32ArrayCopyWithinPartTwo033
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      src.copyWithin(2, 0, 4);
      expect(src.$_get(2)).assertEqual(1);
      expect(src.$_get(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_3400
     * @tc.name testUint32ArrayCopyWithinPartTwo034
     * @tc.desc Verify copyWithin target start 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      src.copyWithin(0, 0, 2);
      expect(src.$_get(0)).assertEqual(1);
      expect(src.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_3500
     * @tc.name testUint32ArrayCopyWithinPartTwo035
     * @tc.desc Verify copyWithin end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      src.copyWithin(0, 2);
      expect(src.$_get(0)).assertEqual(3);
      expect(src.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_3600
     * @tc.name testUint32ArrayCopyWithinPartTwo036
     * @tc.desc Verify copyWithin (target start)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      src.copyWithin(0, 1, 5);
      expect(src.$_get(0)).assertEqual(2);
      expect(src.$_get(3)).assertEqual(5);
      expect(src.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_3700
     * @tc.name testUint32ArrayCopyWithinPartTwo037
     * @tc.desc Verify copyWithin target 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      src.copyWithin(-10, 2, 4);
      expect(src.$_get(0)).assertEqual(3);
      expect(src.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_3800
     * @tc.name testUint32ArrayCopyWithinPartTwo038
     * @tc.desc Verify copyWithin length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.copyWithin(0, 2, 4);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_3900
     * @tc.name testUint32ArrayCopyWithinPartTwo039
     * @tc.desc Verify copyWithin byteLength 16 (4 4 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.copyWithin(0, 2, 4);
      expect(result.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_4000
     * @tc.name testUint32ArrayCopyWithinPartTwo040
     * @tc.desc Verify copyWithin byteOffset 0 (of )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.copyWithin(0, 2, 4);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_4100
     * @tc.name testUint32ArrayCopyWithinPartTwo041
     * @tc.desc Verify copyWithin byteOffset ArrayBuffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Uint32Array(buf, 8, 4);
      const result = view.copyWithin(0, 2, 4);
      expect(result.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_4200
     * @tc.name testUint32ArrayCopyWithinPartTwo042
     * @tc.desc Verify copyWithin target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      src.copyWithin(2, 3, 5);
      expect(src.$_get(0)).assertEqual(1);
      expect(src.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_4300
     * @tc.name testUint32ArrayCopyWithinPartTwo043
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      src.copyWithin(0, 1, 3);
      expect(src.$_get(3)).assertEqual(4);
      expect(src.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_4400
     * @tc.name testUint32ArrayCopyWithinPartTwo044
     * @tc.desc Verify copyWithin start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      src.copyWithin(1, 2, 4);
      expect(src.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_4500
     * @tc.name testUint32ArrayCopyWithinPartTwo045
     * @tc.desc Verify copyWithin end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      src.copyWithin(0, 1, 2);
      expect(src.$_get(2)).assertEqual(3);
      expect(src.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_4600
     * @tc.name testUint32ArrayCopyWithinPartTwo046
     * @tc.desc Verify copyWithin buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.copyWithin(0, 2, 4);
      expect(result.buffer).assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_4700
     * @tc.name testUint32ArrayCopyWithinPartTwo047
     * @tc.desc Verify copyWithin target length ( ) no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      src.copyWithin(4, 0, 2);
      expect(src.$_get(0)).assertEqual(1);
      expect(src.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_4800
     * @tc.name testUint32ArrayCopyWithinPartTwo048
     * @tc.desc Verify copyWithin start end ( ) no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      src.copyWithin(0, 4, 1);
      expect(src.$_get(0)).assertEqual(1);
      expect(src.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_4900
     * @tc.name testUint32ArrayCopyWithinPartTwo049
     * @tc.desc Verify copyWithin target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      src.copyWithin(0, 3, 5);
      expect(src.$_get(0)).assertEqual(4);
      expect(src.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_5000
     * @tc.name testUint32ArrayCopyWithinPartTwo050
     * @tc.desc Verify copyWithin ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5, 6);
      src.copyWithin(1, 3, 5);
      expect(src.$_get(0)).assertEqual(1);
      expect(src.$_get(5)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_5100
     * @tc.name testUint32ArrayCopyWithinPartTwo051
     * @tc.desc Verify copyWithin ArrayBuffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Uint32Array(buf, 8, 4);
      view.copyWithin(0, 2, 4);
      view.copyWithin(0, 1, 3);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_5200
     * @tc.name testUint32ArrayCopyWithinPartTwo052
     * @tc.desc Verify copyWithin ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Uint32Array(buf, 8, 4);
      const result = view.copyWithin(0, 2, 4);
      expect(result.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_5300
     * @tc.name testUint32ArrayCopyWithinPartTwo053
     * @tc.desc Verify copyWithin ( result src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.copyWithin(0, 2, 4);
      result.$_set(0, 99);
      expect(src.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_5400
     * @tc.name testUint32ArrayCopyWithinPartTwo054
     * @tc.desc Verify copyWithin subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Uint32Array.of(1, 2, 3, 4, 5, 6);
      const sub = parent.subarray(2, 5);
      const result = sub.copyWithin(0, 1, 3);
      expect(result.buffer).assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_5500
     * @tc.name testUint32ArrayCopyWithinPartTwo055
     * @tc.desc Verify copyWithin subarray byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Uint32Array.of(1, 2, 3, 4, 5, 6);
      const sub = parent.subarray(1, 4);
      const result = sub.copyWithin(0, 1, 3);
      expect(result.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_5600
     * @tc.name testUint32ArrayCopyWithinPartTwo056
     * @tc.desc Verify copyWithin src result ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.copyWithin(0, 2, 4);
      src.$_set(2, 77);
      expect(result.$_get(2)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_5700
     * @tc.name testUint32ArrayCopyWithinPartTwo057
     * @tc.desc Verify copyWithin buffer byteLength buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.copyWithin(0, 2, 4);
      expect(result.buffer.byteLength).assertEqual(src.buffer.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_5800
     * @tc.name testUint32ArrayCopyWithinPartTwo058
     * @tc.desc Verify copyWithin ArrayBuffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const view = new Uint32Array(buf, 0, 6);
      const result = view.copyWithin(0, 3, 6);
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_5900
     * @tc.name testUint32ArrayCopyWithinPartTwo059
     * @tc.desc Verify copyWithin ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const view = new Uint32Array(buf, 0, 6);
      const result = view.copyWithin(0, 3, 6).copyWithin(0, 1, 4);
      expect(result.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_6000
     * @tc.name testUint32ArrayCopyWithinPartTwo060
     * @tc.desc Verify copyWithin buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const buf = src.buffer;
      src.copyWithin(0, 2, 4);
      const view = new Uint32Array(buf, 0, 4);
      expect(view.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_6100
     * @tc.name testUint32ArrayCopyWithinPartTwo061
     * @tc.desc Verify copyWithin uint32 MAX ( 4294967295)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 1, 4294967295, 3);
      src.copyWithin(0, 2, 3);
      expect(src.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_6200
     * @tc.name testUint32ArrayCopyWithinPartTwo062
     * @tc.desc Verify copyWithin uint32 MAX ( 0xFFFFFFFF)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 1, 0xFFFFFFFF, 3);
      src.copyWithin(0, 2, 3);
      expect(src.$_get(0)).assertEqual(0xFFFFFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_6300
     * @tc.name testUint32ArrayCopyWithinPartTwo063
     * @tc.desc Verify copyWithin uint32 MIN (0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 0, 4);
      src.copyWithin(0, 2, 3);
      expect(src.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_6400
     * @tc.name testUint32ArrayCopyWithinPartTwo064
     * @tc.desc Verify copyWithin 0x80000000 (2147483648)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 0x80000000, 4);
      src.copyWithin(0, 2, 3);
      expect(src.$_get(0)).assertEqual(0x80000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_6500
     * @tc.name testUint32ArrayCopyWithinPartTwo065
     * @tc.desc Verify copyWithin int32 MAX (2147483647)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 2147483647, 4);
      src.copyWithin(0, 2, 3);
      expect(src.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_6600
     * @tc.name testUint32ArrayCopyWithinPartTwo066
     * @tc.desc Verify copyWithin 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 0, 1, 0);
      src.copyWithin(0, 2, 3);
      expect(src.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_6700
     * @tc.name testUint32ArrayCopyWithinPartTwo067
     * @tc.desc Verify copyWithin MAX 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4294967295, 0, 0, 0);
      src.copyWithin(1, 0, 1);
      expect(src.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_6800
     * @tc.name testUint32ArrayCopyWithinPartTwo068
     * @tc.desc Verify copyWithin 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4294967295, 4294967295, 4294967295, 0);
      src.copyWithin(0, 3, 4);
      expect(src.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_6900
     * @tc.name testUint32ArrayCopyWithinPartTwo069
     * @tc.desc Verify copyWithin -1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(4);
      src.$_set(0, 0);
      src.$_set(1, 0);
      src.$_set(2, -1);
      src.$_set(3, 0);
      src.copyWithin(0, 2, 3);
      expect(src.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_7000
     * @tc.name testUint32ArrayCopyWithinPartTwo070
     * @tc.desc Verify copyWithin NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(4);
      src.$_set(0, 1);
      src.$_set(1, 0);
      src.$_set(2, Number.NaN);
      src.$_set(3, 0);
      src.copyWithin(0, 2, 3);
      expect(src.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_7100
     * @tc.name testUint32ArrayCopyWithinPartTwo071
     * @tc.desc Verify copyWithin Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(4);
      src.$_set(0, 1);
      src.$_set(1, 0);
      src.$_set(2, Number.POSITIVE_INFINITY);
      src.$_set(3, 0);
      src.copyWithin(0, 2, 3);
      expect(src.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_7200
     * @tc.name testUint32ArrayCopyWithinPartTwo072
     * @tc.desc Verify copyWithin 4294967296 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(4);
      src.$_set(0, 1);
      src.$_set(1, 0);
      src.$_set(2, 4294967296);
      src.$_set(3, 0);
      src.copyWithin(0, 2, 3);
      expect(src.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_7300
     * @tc.name testUint32ArrayCopyWithinPartTwo073
     * @tc.desc Verify copyWithin MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4294967295, 1, 2, 3, 4);
      src.copyWithin(2, 0, 3);
      expect(src.$_get(2)).assertEqual(4294967295);
      expect(src.$_get(4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_7400
     * @tc.name testUint32ArrayCopyWithinPartTwo074
     * @tc.desc Verify copyWithin MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 1, 4294967295, 3);
      src.copyWithin(0, 2);
      expect(src.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_7500
     * @tc.name testUint32ArrayCopyWithinPartTwo075
     * @tc.desc Verify copyWithin target MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 1, 2, 4294967295);
      src.copyWithin(-1, 3, 4);
      expect(src.$_get(3)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_7600
     * @tc.name testUint32ArrayCopyWithinPartTwo076
     * @tc.desc Verify copyWithin start MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 1, 2, 4294967295);
      src.copyWithin(0, -1, 4);
      expect(src.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_7700
     * @tc.name testUint32ArrayCopyWithinPartTwo077
     * @tc.desc Verify copyWithin end MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 1, 4294967295, 3, 4);
      src.copyWithin(0, 2, -1);
      expect(src.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_7800
     * @tc.name testUint32ArrayCopyWithinPartTwo078
     * @tc.desc Verify copyWithin [MAX, 0, MAX, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4294967295, 0, 4294967295, 0);
      src.copyWithin(0, 2, 4);
      expect(src.$_get(0)).assertEqual(4294967295);
      expect(src.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_7900
     * @tc.name testUint32ArrayCopyWithinPartTwo079
     * @tc.desc Verify copyWithin MAX (target start)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4294967295, 1, 2, 3);
      src.copyWithin(0, 0, 1);
      expect(src.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_8000
     * @tc.name testUint32ArrayCopyWithinPartTwo080
     * @tc.desc Verify copyWithin 0 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4294967295, 4294967295, 0, 4294967295);
      src.copyWithin(0, 2, 3);
      expect(src.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTWO_8100
     * @tc.name testUint32ArrayCopyWithinPartTwo081
     * @tc.desc Verify copyWithin [MAX, 0, mid, MAX]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4294967295, 0, 2147483648, 4294967295);
      src.copyWithin(0, 1, 4);
      expect(src.$_get(0)).assertEqual(0);
      expect(src.$_get(2)).assertEqual(4294967295);
    });

  });
}
