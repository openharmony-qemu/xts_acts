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

export default function uint32ArrayCopyWithinTest3(): void {
  describe('Uint32ArrayCopyWithinTest3', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_0100
     * @tc.name testUint32ArrayCopyWithinPartThree001
     * @tc.desc Verifyret=values target -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(-1, 0, 1);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_0200
     * @tc.name testUint32ArrayCopyWithinPartThree002
     * @tc.desc Verifyret=values target -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(-2, 0, 1);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,1,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_0300
     * @tc.name testUint32ArrayCopyWithinPartThree003
     * @tc.desc Verifyret=values target -length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(-4, 2, 4);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('3,4,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_0400
     * @tc.name testUint32ArrayCopyWithinPartThree004
     * @tc.desc Verifyret=values target -length-1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(-5, 0, 1);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_0500
     * @tc.name testUint32ArrayCopyWithinPartThree005
     * @tc.desc Verifyret=values target -length-2 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(-6, 0, 1);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_0600
     * @tc.name testUint32ArrayCopyWithinPartThree006
     * @tc.desc Verifyret=values target -2147483648 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(-2147483648, 0, 1);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_0700
     * @tc.name testUint32ArrayCopyWithinPartThree007
     * @tc.desc Verifyret=values target length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(4, 0, 2);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_0800
     * @tc.name testUint32ArrayCopyWithinPartThree008
     * @tc.desc Verifyret=values target length+1 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(5, 0, 2);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_0900
     * @tc.name testUint32ArrayCopyWithinPartThree009
     * @tc.desc Verifyret=values target length+10 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(14, 0, 2);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_1000
     * @tc.name testUint32ArrayCopyWithinPartThree010
     * @tc.desc Verifyret=values target 2147483647 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(2147483647, 0, 2);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_1100
     * @tc.name testUint32ArrayCopyWithinPartThree011
     * @tc.desc Verifyret=values target 2147483646 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(2147483646, 0, 2);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_1200
     * @tc.name testUint32ArrayCopyWithinPartThree012
     * @tc.desc Verifyret=values target 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 2, 4);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('3,4,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_1300
     * @tc.name testUint32ArrayCopyWithinPartThree013
     * @tc.desc Verifyret=values target length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(3, 0, 1);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_1400
     * @tc.name testUint32ArrayCopyWithinPartThree014
     * @tc.desc Verifyret=values target 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(1, 2, 4);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,3,4,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_1500
     * @tc.name testUint32ArrayCopyWithinPartThree015
     * @tc.desc Verifyret=values target -1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7);
      const ret = values.copyWithin(-1, 0, 1);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_1600
     * @tc.name testUint32ArrayCopyWithinPartThree016
     * @tc.desc Verifyret=values start -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, -1, 4);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('4,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_1700
     * @tc.name testUint32ArrayCopyWithinPartThree017
     * @tc.desc Verifyret=values start -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, -2, 4);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('3,4,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_1800
     * @tc.name testUint32ArrayCopyWithinPartThree018
     * @tc.desc Verifyret=values start -length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, -4, 2);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_1900
     * @tc.name testUint32ArrayCopyWithinPartThree019
     * @tc.desc Verifyret=values start -length-1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, -5, 2);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_2000
     * @tc.name testUint32ArrayCopyWithinPartThree020
     * @tc.desc Verifyret=values start -length-5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, -9, 2);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_2100
     * @tc.name testUint32ArrayCopyWithinPartThree021
     * @tc.desc Verifyret=values start -2147483648 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, -2147483648, 2);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_2200
     * @tc.name testUint32ArrayCopyWithinPartThree022
     * @tc.desc Verifyret=values start length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 4, 4);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_2300
     * @tc.name testUint32ArrayCopyWithinPartThree023
     * @tc.desc Verifyret=values start length+1 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 5, 4);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_2400
     * @tc.name testUint32ArrayCopyWithinPartThree024
     * @tc.desc Verifyret=values start length+10 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 14, 4);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_2500
     * @tc.name testUint32ArrayCopyWithinPartThree025
     * @tc.desc Verifyret=values start 2147483647 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 2147483647, 4);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_2600
     * @tc.name testUint32ArrayCopyWithinPartThree026
     * @tc.desc Verifyret=values start 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(2, 0, 2);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_2700
     * @tc.name testUint32ArrayCopyWithinPartThree027
     * @tc.desc Verifyret=values start length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 3, 4);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('4,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_2800
     * @tc.name testUint32ArrayCopyWithinPartThree028
     * @tc.desc Verifyret=values start 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 1, 3);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('2,3,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_2900
     * @tc.name testUint32ArrayCopyWithinPartThree029
     * @tc.desc Verifyret=values start -1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7);
      const ret = values.copyWithin(0, -1, 1);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_3000
     * @tc.name testUint32ArrayCopyWithinPartThree030
     * @tc.desc Verifyret=values start length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const ret = values.copyWithin(0, 0, 0);
      expect(ret).assertEqual(values);
      expect(values.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_3100
     * @tc.name testUint32ArrayCopyWithinPartThree031
     * @tc.desc Verifyret=values end -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 0, -1);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_3200
     * @tc.name testUint32ArrayCopyWithinPartThree032
     * @tc.desc Verifyret=values end -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 1, -2);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('2,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_3300
     * @tc.name testUint32ArrayCopyWithinPartThree033
     * @tc.desc Verifyret=values end -length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 0, -4);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_3400
     * @tc.name testUint32ArrayCopyWithinPartThree034
     * @tc.desc Verifyret=values end -length-1 0 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 1, -5);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_3500
     * @tc.name testUint32ArrayCopyWithinPartThree035
     * @tc.desc Verifyret=values end -length-5 0 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 1, -9);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_3600
     * @tc.name testUint32ArrayCopyWithinPartThree036
     * @tc.desc Verifyret=values end -2147483648 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 1, -2147483648);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_3700
     * @tc.name testUint32ArrayCopyWithinPartThree037
     * @tc.desc Verifyret=values end 0 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 0, 0);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_3800
     * @tc.name testUint32ArrayCopyWithinPartThree038
     * @tc.desc Verifyret=values end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 6, 7, 8);
      const ret = values.copyWithin(0, 2, 4);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('7,8,7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_3900
     * @tc.name testUint32ArrayCopyWithinPartThree039
     * @tc.desc Verifyret=values end length+1 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 2, 5);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('3,4,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_4000
     * @tc.name testUint32ArrayCopyWithinPartThree040
     * @tc.desc Verifyret=values end length+10 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 2, 14);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('3,4,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_4100
     * @tc.name testUint32ArrayCopyWithinPartThree041
     * @tc.desc Verifyret=values end 2147483647 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 2, 2147483647);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('3,4,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_4200
     * @tc.name testUint32ArrayCopyWithinPartThree042
     * @tc.desc Verifyret=values end 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(2, 0, 1);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,1,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_4300
     * @tc.name testUint32ArrayCopyWithinPartThree043
     * @tc.desc Verifyret=values end -1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7);
      const ret = values.copyWithin(0, 0, -1);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_4400
     * @tc.name testUint32ArrayCopyWithinPartThree044
     * @tc.desc Verifyret=values end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 2);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('3,4,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_4500
     * @tc.name testUint32ArrayCopyWithinPartThree045
     * @tc.desc Verifyret=values end 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const ret = values.copyWithin(0, 0, 0);
      expect(ret).assertEqual(values);
      expect(values.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_4600
     * @tc.name testUint32ArrayCopyWithinPartThree046
     * @tc.desc Verifyret=values start end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 2, 1);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_4700
     * @tc.name testUint32ArrayCopyWithinPartThree047
     * @tc.desc Verifyret=values start end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 1, 1);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_4800
     * @tc.name testUint32ArrayCopyWithinPartThree048
     * @tc.desc Verifyret=values start end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, -1, -2);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_4900
     * @tc.name testUint32ArrayCopyWithinPartThree049
     * @tc.desc Verifyret=values start end start end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 1, -3);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_5000
     * @tc.name testUint32ArrayCopyWithinPartThree050
     * @tc.desc Verifyret=values start end length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(1, 4, 4);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_5100
     * @tc.name testUint32ArrayCopyWithinPartThree051
     * @tc.desc Verifyret=values start end 0 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(2, 0, 0);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_5200
     * @tc.name testUint32ArrayCopyWithinPartThree052
     * @tc.desc Verifyret=values start end start end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 5, 3);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_5300
     * @tc.name testUint32ArrayCopyWithinPartThree053
     * @tc.desc Verifyret=values target start end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(1, 0, 3);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_5400
     * @tc.name testUint32ArrayCopyWithinPartThree054
     * @tc.desc Verifyret=values target start end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(3, 0, 2);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_5500
     * @tc.name testUint32ArrayCopyWithinPartThree055
     * @tc.desc Verifyret=values target start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 0, 2);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_5600
     * @tc.name testUint32ArrayCopyWithinPartThree056
     * @tc.desc Verifyret=values copyWithin no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const ret = values.copyWithin(0, 0);
      expect(ret).assertEqual(values);
      expect(values.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_5700
     * @tc.name testUint32ArrayCopyWithinPartThree057
     * @tc.desc Verifyret=values copyWithin no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const ret = values.copyWithin(0, 0, 0);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_5800
     * @tc.name testUint32ArrayCopyWithinPartThree058
     * @tc.desc Verifyret=values copyWithin no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const ret = values.copyWithin(-1, -1, -1);
      expect(ret).assertEqual(values);
      expect(values.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_5900
     * @tc.name testUint32ArrayCopyWithinPartThree059
     * @tc.desc Verifyret=values copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7);
      const ret = values.copyWithin(0, 0);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_6000
     * @tc.name testUint32ArrayCopyWithinPartThree060
     * @tc.desc Verifyret=values copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7);
      const ret = values.copyWithin(0, 0, 1);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_6100
     * @tc.name testUint32ArrayCopyWithinPartThree061
     * @tc.desc Verifyret=values copyWithin start end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7);
      const ret = values.copyWithin(0, -1, -1);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_6200
     * @tc.name testUint32ArrayCopyWithinPartThree062
     * @tc.desc Verifyret=values copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 5, 5, 5);
      const ret = values.copyWithin(0, 1, 3);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('5,5,5,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_6300
     * @tc.name testUint32ArrayCopyWithinPartThree063
     * @tc.desc Verifyret=values copyWithin(1, 0, 1) ret=values copyWithin 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 0, 0, 0);
      const ret = values.copyWithin(0, 1, 3);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('0,0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_6400
     * @tc.name testUint32ArrayCopyWithinPartThree064
     * @tc.desc Verifyret=values MAX copyWithin MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4294967295, 4294967295, 4294967295);
      const ret = values.copyWithin(0, 1, 2);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('4294967295,4294967295,4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_6500
     * @tc.name testUint32ArrayCopyWithinPartThree065
     * @tc.desc Verifyret=values target no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7);
      const ret = values.copyWithin(5, 0, 1);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_6600
     * @tc.name testUint32ArrayCopyWithinPartThree066
     * @tc.desc Verifyret=values uint32 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4294967295, 2, 3, 4);
      const ret = values.copyWithin(1, 0, 1);
      expect(ret).assertEqual(values);
      expect(values.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_6700
     * @tc.name testUint32ArrayCopyWithinPartThree067
     * @tc.desc Verifyret=values copyWithin(1, 0, 1) ret=valuesx100000000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.$_set(0, 4294967296);
      const ret = values.copyWithin(2, 0, 1);
      expect(ret).assertEqual(values);
      expect(values.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_6800
     * @tc.name testUint32ArrayCopyWithinPartThree068
     * @tc.desc Verifyret=values -1 2 32 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.$_set(0, -1);
      const ret = values.copyWithin(2, 0, 1);
      expect(ret).assertEqual(values);
      expect(values.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_6900
     * @tc.name testUint32ArrayCopyWithinPartThree069
     * @tc.desc Verifyret=values int32 -2147483648 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.$_set(0, -2147483648);
      const ret = values.copyWithin(2, 0, 1);
      expect(ret).assertEqual(values);
      expect(values.$_get(2)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_7000
     * @tc.name testUint32ArrayCopyWithinPartThree070
     * @tc.desc Verifyret=values NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.$_set(0, Number.NaN);
      const ret = values.copyWithin(2, 0, 1);
      expect(ret).assertEqual(values);
      expect(values.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_7100
     * @tc.name testUint32ArrayCopyWithinPartThree071
     * @tc.desc Verifyret=values Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.$_set(0, Number.POSITIVE_INFINITY);
      const ret = values.copyWithin(2, 0, 1);
      expect(ret).assertEqual(values);
      expect(values.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_7200
     * @tc.name testUint32ArrayCopyWithinPartThree072
     * @tc.desc Verifyret=values -Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.$_set(0, -Number.POSITIVE_INFINITY);
      const ret = values.copyWithin(2, 0, 1);
      expect(ret).assertEqual(values);
      expect(values.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_7300
     * @tc.name testUint32ArrayCopyWithinPartThree073
     * @tc.desc Verifyret=values 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.$_set(0, 3.14);
      const ret = values.copyWithin(2, 0, 1);
      expect(ret).assertEqual(values);
      expect(values.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_7400
     * @tc.name testUint32ArrayCopyWithinPartThree074
     * @tc.desc Verifyret=values copyWithin(1, 0, 1) ret=values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 2, 3, 4);
      const ret = values.copyWithin(1, 0, 1);
      expect(ret).assertEqual(values);
      expect(values.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_7500
     * @tc.name testUint32ArrayCopyWithinPartThree075
     * @tc.desc Verifyret=values copyWithin(1, 0, 1) ret=valueso37777777777
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.$_set(0, 0o37777777777);
      const ret = values.copyWithin(2, 0, 1);
      expect(ret).assertEqual(values);
      expect(values.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_7600
     * @tc.name testUint32ArrayCopyWithinPartThree076
     * @tc.desc Verifyret=values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.$_set(0, 0b11111111111111111111111111111111);
      const ret = values.copyWithin(2, 0, 1);
      expect(ret).assertEqual(values);
      expect(values.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_7700
     * @tc.name testUint32ArrayCopyWithinPartThree077
     * @tc.desc Verifyret=values -0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.$_set(0, -0);
      const ret = values.copyWithin(2, 0, 1);
      expect(ret).assertEqual(values);
      expect(values.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_7800
     * @tc.name testUint32ArrayCopyWithinPartThree078
     * @tc.desc Verify $_set(0, 1e0) then $_get returns ret=values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.$_set(0, 1e0);
      const ret = values.copyWithin(2, 0, 1);
      expect(ret).assertEqual(values);
      expect(values.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_7900
     * @tc.name testUint32ArrayCopyWithinPartThree079
     * @tc.desc Verifyret=values 1.5 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.$_set(0, 1.5);
      const ret = values.copyWithin(2, 0, 1);
      expect(ret).assertEqual(values);
      expect(values.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_8000
     * @tc.name testUint32ArrayCopyWithinPartThree080
     * @tc.desc Verifyret=values target start no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(10, 10, 4);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_8100
     * @tc.name testUint32ArrayCopyWithinPartThree081
     * @tc.desc Verifyret=values target end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(10, 0, 10);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_8200
     * @tc.name testUint32ArrayCopyWithinPartThree082
     * @tc.desc Verifyret=values start end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 10, 20);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_8300
     * @tc.name testUint32ArrayCopyWithinPartThree083
     * @tc.desc Verify copyWithin(100, 200, 300) ret=values, values unchanged no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(100, 200, 300);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_8400
     * @tc.name testUint32ArrayCopyWithinPartThree084
     * @tc.desc Verifyret=values target start end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(1, 3, 2);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_8500
     * @tc.name testUint32ArrayCopyWithinPartThree085
     * @tc.desc Verifyret=values target end start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(-1, 1, -1);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_8600
     * @tc.name testUint32ArrayCopyWithinPartThree086
     * @tc.desc Verifyret=values target start end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(2, 2, 2);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_8700
     * @tc.name testUint32ArrayCopyWithinPartThree087
     * @tc.desc Verifyret=values -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(-1, -1, -1);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_8800
     * @tc.name testUint32ArrayCopyWithinPartThree088
     * @tc.desc Verifyret=values target length 1start 0end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(3, 0, 4);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_8900
     * @tc.name testUint32ArrayCopyWithinPartThree089
     * @tc.desc Verify copyWithin(100, 200, 300) ret=values, values.length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const ret = values.copyWithin(100, 200, 300);
      expect(ret).assertEqual(values);
      expect(values.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_9000
     * @tc.name testUint32ArrayCopyWithinPartThree090
     * @tc.desc Verifyret=values 65535 copyWithin target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big = new Uint32Array(65535);
      big.$_set(65534, 99);
      const ret = big.copyWithin(-1, 65534, 65535);
      expect(ret).assertEqual(big);
      expect(big.$_get(65534)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_9100
     * @tc.name testUint32ArrayCopyWithinPartThree091
     * @tc.desc Verifyret=values target start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4, 5);
      const ret = values.copyWithin(1, 3, 5);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,4,5,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_9200
     * @tc.name testUint32ArrayCopyWithinPartThree092
     * @tc.desc Verifyret=values target start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4, 5);
      const ret = values.copyWithin(3, 1, 3);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_9300
     * @tc.name testUint32ArrayCopyWithinPartThree093
     * @tc.desc Verifyret=values target start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4, 5);
      const ret = values.copyWithin(1, 1, 4);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_9400
     * @tc.name testUint32ArrayCopyWithinPartThree094
     * @tc.desc Verifyret=values target 0start 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4, 5);
      const ret = values.copyWithin(0, 0, 5);
      expect(ret).assertEqual(values);
      expect(values.join(',')).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_9500
     * @tc.name testUint32ArrayCopyWithinPartThree095
     * @tc.desc Verifyret=values copyWithin length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 2, 4);
      expect(ret.length).assertEqual(values.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_9600
     * @tc.name testUint32ArrayCopyWithinPartThree096
     * @tc.desc Verifyret=values copyWithin byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 2, 4);
      expect(ret.byteLength).assertEqual(values.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTTHREE_9700
     * @tc.name testUint32ArrayCopyWithinPartThree097
     * @tc.desc Verifyret=values copyWithin buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartThree097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const ret = values.copyWithin(0, 2, 4);
      expect(ret.buffer).assertEqual(values.buffer);
      expect(values.join(',')).assertEqual('3,4,3,4');
    });
  });
}