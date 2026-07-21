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

export default function uint32ArrayCopyWithinTest(): void {
  describe('Uint32ArrayCopyWithinTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_0100
     * @tc.name testUint32ArrayCopyWithinPartOne001
     * @tc.desc Verify 2 end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      values.copyWithin(0, 1);
      expect(values.join(',')).assertEqual('20,30,30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_0200
     * @tc.name testUint32ArrayCopyWithinPartOne002
     * @tc.desc Verify 3 end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      values.copyWithin(0, 1, 3);
      expect(values.join(',')).assertEqual('20,30,30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_0300
     * @tc.name testUint32ArrayCopyWithinPartOne003
     * @tc.desc Verify end end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint32Array.of(10, 20, 30);
      const b = Uint32Array.of(10, 20, 30);
      a.copyWithin(0, 1);
      b.copyWithin(0, 1, 3);
      expect(a.join(',')).assertEqual(b.join(','));
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_0400
     * @tc.name testUint32ArrayCopyWithinPartOne004
     * @tc.desc Verify 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const ret = values.copyWithin(0, 1);
      ret[0] = 999;
      expect(values[0]).assertEqual(999);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_0500
     * @tc.name testUint32ArrayCopyWithinPartOne005
     * @tc.desc Verify target=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(0, 0, 2);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_0600
     * @tc.name testUint32ArrayCopyWithinPartOne006
     * @tc.desc Verify target=1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(1, 0, 2);
      expect(values.join(',')).assertEqual('1,1,2,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_0700
     * @tc.name testUint32ArrayCopyWithinPartOne007
     * @tc.desc Verify target=2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(2, 0, 2);
      expect(values.join(',')).assertEqual('1,2,1,2');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_0800
     * @tc.name testUint32ArrayCopyWithinPartOne008
     * @tc.desc Verify target=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(3, 0, 2);
      expect(values.join(',')).assertEqual('1,2,3,1');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_0900
     * @tc.name testUint32ArrayCopyWithinPartOne009
     * @tc.desc Verify target=4 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(4, 0, 2);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_1000
     * @tc.name testUint32ArrayCopyWithinPartOne010
     * @tc.desc Verify target=5 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(5, 0, 2);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_1100
     * @tc.name testUint32ArrayCopyWithinPartOne011
     * @tc.desc Verify target=100 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(100, 0, 2);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_1200
     * @tc.name testUint32ArrayCopyWithinPartOne012
     * @tc.desc Verify target=2147483647 int32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(2147483647, 0, 2);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_1300
     * @tc.name testUint32ArrayCopyWithinPartOne013
     * @tc.desc Verify target=-2147483648 int32.MIN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(-2147483648, 0, 2);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_1400
     * @tc.name testUint32ArrayCopyWithinPartOne014
     * @tc.desc Verify target=0o17 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(0o17, 0, 2);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_1500
     * @tc.name testUint32ArrayCopyWithinPartOne015
     * @tc.desc Verify target=0b1010 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(0b1010, 0, 2);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_1600
     * @tc.name testUint32ArrayCopyWithinPartOne016
     * @tc.desc Verify target=-1 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(-1, 0, 2);
      expect(values.join(',')).assertEqual('1,2,3,1');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_1700
     * @tc.name testUint32ArrayCopyWithinPartOne017
     * @tc.desc Verify target=-2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(-2, 0, 2);
      expect(values.join(',')).assertEqual('1,2,1,2');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_1800
     * @tc.name testUint32ArrayCopyWithinPartOne018
     * @tc.desc Verify target=-3 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(-3, 0, 2);
      expect(values.join(',')).assertEqual('1,1,2,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_1900
     * @tc.name testUint32ArrayCopyWithinPartOne019
     * @tc.desc Verify target=-4 resolves to 0, identity copy no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(-4, 0, 2);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_2000
     * @tc.name testUint32ArrayCopyWithinPartOne020
     * @tc.desc Verify target=-5 resolves to 0, identity copy no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(-5, 0, 2);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_2100
     * @tc.name testUint32ArrayCopyWithinPartOne021
     * @tc.desc Verify target=-100 resolves to 0, identity copy no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(-100, 0, 2);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_2200
     * @tc.name testUint32ArrayCopyWithinPartOne022
     * @tc.desc Verify start=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(1, 0, 4);
      expect(values.join(',')).assertEqual('1,1,2,3');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_2300
     * @tc.name testUint32ArrayCopyWithinPartOne023
     * @tc.desc Verify start=1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(1, 1, 4);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_2400
     * @tc.name testUint32ArrayCopyWithinPartOne024
     * @tc.desc Verify start=2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(1, 2, 4);
      expect(values.join(',')).assertEqual('1,3,4,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_2500
     * @tc.name testUint32ArrayCopyWithinPartOne025
     * @tc.desc Verify start=3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(1, 3, 4);
      expect(values.join(',')).assertEqual('1,4,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_2600
     * @tc.name testUint32ArrayCopyWithinPartOne026
     * @tc.desc Verify start=4 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(1, 4, 4);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_2700
     * @tc.name testUint32ArrayCopyWithinPartOne027
     * @tc.desc Verify start=5 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(1, 5, 4);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_2800
     * @tc.name testUint32ArrayCopyWithinPartOne028
     * @tc.desc Verify start=100 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(1, 100, 4);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_2900
     * @tc.name testUint32ArrayCopyWithinPartOne029
     * @tc.desc Verify start=2147483647 int32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(1, 2147483647, 4);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_3000
     * @tc.name testUint32ArrayCopyWithinPartOne030
     * @tc.desc Verify start=-2147483648 int32.MIN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(1, -2147483648, 4);
      expect(values.join(',')).assertEqual('1,1,2,3');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_3100
     * @tc.name testUint32ArrayCopyWithinPartOne031
     * @tc.desc Verify start=0o17 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(1, 0o17, 4);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_3200
     * @tc.name testUint32ArrayCopyWithinPartOne032
     * @tc.desc Verify start=0b1010 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(1, 0b1010, 4);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_3300
     * @tc.name testUint32ArrayCopyWithinPartOne033
     * @tc.desc Verify start=-1 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(1, -1, 4);
      expect(values.join(',')).assertEqual('1,4,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_3400
     * @tc.name testUint32ArrayCopyWithinPartOne034
     * @tc.desc Verify start=-2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(1, -2, 4);
      expect(values.join(',')).assertEqual('1,3,4,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_3500
     * @tc.name testUint32ArrayCopyWithinPartOne035
     * @tc.desc Verify start=-3 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(1, -3, 4);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_3600
     * @tc.name testUint32ArrayCopyWithinPartOne036
     * @tc.desc Verify start=-4 resolves to 0, copies [0,4) to [1,5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(1, -4, 4);
      expect(values.join(',')).assertEqual('1,1,2,3');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_3700
     * @tc.name testUint32ArrayCopyWithinPartOne037
     * @tc.desc Verify start=-5 resolves to 0, copies [0,4) to [1,5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(1, -5, 4);
      expect(values.join(',')).assertEqual('1,1,2,3');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_3800
     * @tc.name testUint32ArrayCopyWithinPartOne038
     * @tc.desc Verify start=-100 resolves to 0, copies [0,4) to [1,5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(1, -100, 4);
      expect(values.join(',')).assertEqual('1,1,2,3');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_3900
     * @tc.name testUint32ArrayCopyWithinPartOne039
     * @tc.desc Verify end=0 start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(2, 1, 0);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_4000
     * @tc.name testUint32ArrayCopyWithinPartOne040
     * @tc.desc Verify end=1 start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(2, 1, 1);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_4100
     * @tc.name testUint32ArrayCopyWithinPartOne041
     * @tc.desc Verify end=2 2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(2, 1, 2);
      expect(values.join(',')).assertEqual('1,2,2,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_4200
     * @tc.name testUint32ArrayCopyWithinPartOne042
     * @tc.desc Verify end=3 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(2, 1, 3);
      expect(values.join(',')).assertEqual('1,2,2,3');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_4300
     * @tc.name testUint32ArrayCopyWithinPartOne043
     * @tc.desc Verify end=4 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(2, 1, 4);
      expect(values.join(',')).assertEqual('1,2,2,3');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_4400
     * @tc.name testUint32ArrayCopyWithinPartOne044
     * @tc.desc Verify end=5 length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(2, 1, 5);
      expect(values.join(',')).assertEqual('1,2,2,3');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_4500
     * @tc.name testUint32ArrayCopyWithinPartOne045
     * @tc.desc Verify end=100 length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(2, 1, 100);
      expect(values.join(',')).assertEqual('1,2,2,3');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_4600
     * @tc.name testUint32ArrayCopyWithinPartOne046
     * @tc.desc Verify end=2147483647 int32.MAX length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(2, 1, 2147483647);
      expect(values.join(',')).assertEqual('1,2,2,3');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_4700
     * @tc.name testUint32ArrayCopyWithinPartOne047
     * @tc.desc Verify end=-2147483648 int32.MIN 0 start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(2, 1, -2147483648);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_4800
     * @tc.name testUint32ArrayCopyWithinPartOne048
     * @tc.desc Verify end=0o17 15 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(2, 1, 0o17);
      expect(values.join(',')).assertEqual('1,2,2,3');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_4900
     * @tc.name testUint32ArrayCopyWithinPartOne049
     * @tc.desc Verify end=0b1010 10 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(2, 1, 0b1010);
      expect(values.join(',')).assertEqual('1,2,2,3');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_5000
     * @tc.name testUint32ArrayCopyWithinPartOne050
     * @tc.desc Verify end=-1 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(2, 1, -1);
      expect(values.join(',')).assertEqual('1,2,2,3');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_5100
     * @tc.name testUint32ArrayCopyWithinPartOne051
     * @tc.desc Verify end=-2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(2, 1, -2);
      expect(values.join(',')).assertEqual('1,2,2,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_5200
     * @tc.name testUint32ArrayCopyWithinPartOne052
     * @tc.desc Verify end=-3 1 start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(2, 1, -3);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_5300
     * @tc.name testUint32ArrayCopyWithinPartOne053
     * @tc.desc Verify end=-4 length 0 start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(2, 1, -4);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_5400
     * @tc.name testUint32ArrayCopyWithinPartOne054
     * @tc.desc Verify end=-5 length 0 start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(2, 1, -5);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_5500
     * @tc.name testUint32ArrayCopyWithinPartOne055
     * @tc.desc Verify end=-100 length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(2, 1, -100);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_5600
     * @tc.name testUint32ArrayCopyWithinPartOne056
     * @tc.desc Verify MAX 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values[0] = 4294967295;
      values[1] = 0;
      values[2] = 0;
      values.copyWithin(2, 0, 1);
      expect(values[2]).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_5700
     * @tc.name testUint32ArrayCopyWithinPartOne057
     * @tc.desc Verify MIN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values[0] = 0;
      values[1] = 0;
      values[2] = 0;
      values.copyWithin(2, 0, 1);
      expect(values[2]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_5800
     * @tc.name testUint32ArrayCopyWithinPartOne058
     * @tc.desc Verify int32.MAX 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values[0] = 2147483647;
      values[1] = 0;
      values[2] = 0;
      values.copyWithin(2, 0, 1);
      expect(values[2]).assertEqual(2147483647);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_5900
     * @tc.name testUint32ArrayCopyWithinPartOne059
     * @tc.desc Verify 3.14 3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values[0] = 3.14;
      values[1] = 0;
      values[2] = 0;
      values.copyWithin(2, 0, 1);
      expect(values[2]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_COPYWITHIN_PARTONE_6000
     * @tc.name testUint32ArrayCopyWithinPartOne060
     * @tc.desc Verify MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayCopyWithinPartOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(4);
      values[0] = 4294967295;
      values[1] = 0;
      values[2] = 4294967295;
      values[3] = 0;
      values.copyWithin(0, 2, 4);
      expect(values[0]).assertEqual(4294967295);
      expect(values[1]).assertEqual(0);
    });

  });
}
