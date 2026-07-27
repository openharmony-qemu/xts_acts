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
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

interface ObjWithData {
  data: Array<int>;
}

export default function ArrayCopyWithin1_2Test(): void {
  describe('ArrayCopyWithin1_2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_0100
     * @tc.name testArrayCopywithinOne001
     * @tc.desc Verify target=MAX_INT clamped to length, no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(2147483647, 0, 2);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_0200
     * @tc.name testArrayCopywithinOne002
     * @tc.desc Verify target=MIN_INT clamped to 0, copies from start
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(-2147483648, 0, 2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_0300
     * @tc.name testArrayCopywithinOne003
     * @tc.desc Verify start=MAX_INT out of range, no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 2147483647, arr.length);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_0400
     * @tc.name testArrayCopywithinOne004
     * @tc.desc Verify start=MIN_INT clamped to 0, end=0, no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, -2147483648, 0);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_0500
     * @tc.name testArrayCopywithinOne005
     * @tc.desc Verify end=MAX_VALUE clamped to length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(2, -1, arr.length);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_0600
     * @tc.name testArrayCopywithinOne006
     * @tc.desc Verify target float truncated to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(Double.toInt(0.5), 1, 3);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_0700
     * @tc.name testArrayCopywithinOne007
     * @tc.desc Verify start and end floats are truncated
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, Double.toInt(1.7), Double.toInt(4.2));
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_0800
     * @tc.name testArrayCopywithinOne008
     * @tc.desc Verify target=NaN treated as 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(Double.toInt(Double.NaN), 1, 3);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_0900
     * @tc.name testArrayCopywithinOne009
     * @tc.desc Verify target=Infinity clamped to length, no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(arr.length, 0, 2);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_1000
     * @tc.name testArrayCopywithinOne010
     * @tc.desc Verify end=-Infinity clamped to 0, no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 0, 0);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_1100
     * @tc.name testArrayCopywithinOne011
     * @tc.desc Verify target and start both MIN_INT clamped to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const minInt = 0 - 2147483647 - 1;
      arr.copyWithin(minInt, minInt, 2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_1200
     * @tc.name testArrayCopywithinOne012
     * @tc.desc Verify float type target truncated
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const t: float = 2.5f;
      arr.copyWithin(Float.toInt(t), 0, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_1300
     * @tc.name testArrayCopywithinOne013
     * @tc.desc Verify double type start truncated
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const s: double = 1.9;
      arr.copyWithin(0, Double.toInt(s), 4);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_1400
     * @tc.name testArrayCopywithinOne014
     * @tc.desc Verify float type end truncated
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const e: float = 3.1f;
      arr.copyWithin(0, 1, Float.toInt(e));
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_1500
     * @tc.name testArrayCopywithinOne015
     * @tc.desc Verify large number as target clamped to length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(arr.length, 0, 2);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_1600
     * @tc.name testArrayCopywithinOne016
     * @tc.desc Verify all float params truncated
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(Double.toInt(1.2), Double.toInt(0.6), Double.toInt(3.9));
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_1700
     * @tc.name testArrayCopywithinOne017
     * @tc.desc Verify end omitted with float start
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, Double.toInt(2.8));
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_1800
     * @tc.name testArrayCopywithinOne018
     * @tc.desc Verify byte value as target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const t: byte = 2;
      arr.copyWithin(t, 0, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_1900
     * @tc.name testArrayCopywithinOne019
     * @tc.desc Verify short negative value as start
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const s: short = -2;
      arr.copyWithin(0, s, 4);
      expect(arr[0]).assertEqual(4);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_2000
     * @tc.name testArrayCopywithinOne020
     * @tc.desc Verify modifying source after copyWithin does not affect copied values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 1, 4);
      arr[1] = 99;
      const v1 = arr[0];
      const v2 = arr[1];
      const result = v1 + v2;
      expect(result).assertEqual(101);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_2100
     * @tc.name testArrayCopywithinOne021
     * @tc.desc Verify push after copyWithin preserves copied result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.copyWithin(1, 0, 2);
      arr.push(99);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_2200
     * @tc.name testArrayCopywithinOne022
     * @tc.desc Verify pop after copyWithin returns correct value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 2, 5);
      const popped = arr.pop();
      expect(popped).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_2300
     * @tc.name testArrayCopywithinOne023
     * @tc.desc Verify sort after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(3, 1, 4, 1, 5);
      arr.copyWithin(1, 0, 2);
      arr.sort((a: int, b: int): int => {
        return a - b;
      });
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_2400
     * @tc.name testArrayCopywithinOne024
     * @tc.desc Verify reverse after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 2, 5);
      arr.reverse();
      expect(arr[0]).assertEqual(5);
      expect(arr[4]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_2500
     * @tc.name testArrayCopywithinOne025
     * @tc.desc Verify fill after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 1, 4);
      arr.fill(0, 3, 5);
      expect(arr[0]).assertEqual(2);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_2600
     * @tc.name testArrayCopywithinOne026
     * @tc.desc Verify splice delete after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 2, 5);
      arr.splice(0, 2);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_2700
     * @tc.name testArrayCopywithinOne027
     * @tc.desc Verify splice insert after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 2, 4);
      arr.splice(1, 0, 99);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_2800
     * @tc.name testArrayCopywithinOne028
     * @tc.desc Verify two copyWithin operations in sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6);
      arr.copyWithin(0, 3, 6);
      arr.copyWithin(2, 0, 3);
      expect(arr[0]).assertEqual(4);
      expect(arr[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_2900
     * @tc.name testArrayCopywithinOne029
     * @tc.desc Verify length truncation after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 2, 5);
      arr.length = 3;
      expect(arr[0]).assertEqual(3);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_3000
     * @tc.name testArrayCopywithinOne030
     * @tc.desc Verify sparse array copies holes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(5, (): int | undefined => undefined);
      arr[0] = 1;
      arr[2] = 3;
      arr[4] = 5;
      arr.copyWithin(0, 1, 4);
      expect(arr[0]).assertUndefined();
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertUndefined();
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_3100
     * @tc.name testArrayCopywithinOne031
     * @tc.desc Verify sparse array copies holes preserving them at target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(6, (): int | undefined => undefined);
      arr[0] = 10;
      arr[3] = 40;
      arr[5] = 60;
      arr.copyWithin(2, 0, 5);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(10);
      expect(arr[3]).assertUndefined();
      expect(arr[4]).assertUndefined();
      expect(arr[5]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_3200
     * @tc.name testArrayCopywithinOne032
     * @tc.desc Verify uninitialized array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int | undefined>(1, 5);
      arr.copyWithin(0, 1, 4);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_3300
     * @tc.name testArrayCopywithinOne033
     * @tc.desc Verify partially initialized array copying holes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(6, (): int | undefined => undefined);
      arr[0] = 10;
      arr[3] = 40;
      arr[5] = 60;
      arr.copyWithin(2, 0, 5);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(10);
      expect(arr[3]).assertUndefined();
      expect(arr[4]).assertUndefined();
      expect(arr[5]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_3400
     * @tc.name testArrayCopywithinOne034
     * @tc.desc Verify sparse array copy between holes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(6,(): int | undefined => undefined);
      arr[0] = 1;
      arr[2] = 3;
      arr[4] = 5;
      arr.copyWithin(0, 2, 5);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertUndefined();
      expect(arr[2]).assertEqual(5);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_3500
     * @tc.name testArrayCopywithinOne035
     * @tc.desc Verify copy values into hole positions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(5,(): int | undefined => undefined);
      arr[0] = 1;
      arr[1] = 2;
      arr[3] = 4;
      arr.copyWithin(3, 0, 2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertUndefined();
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_3600
     * @tc.name testArrayCopywithinOne036
     * @tc.desc Verify sparse array with negative target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(5,(): int | undefined => undefined);
      arr[1] = 10;
      arr[3] = 30;
      arr.copyWithin(-2, 0, 4);
      expect(arr[0]).assertUndefined();
      expect(arr[3]).assertUndefined();
      expect(arr[4]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_3700
     * @tc.name testArrayCopywithinOne037
     * @tc.desc Verify copyWithin in conditional expression
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const result = arr.copyWithin(0, 2, 5)[0] > 2 ? 'gt' : 'lte';
      expect(result).assertEqual('gt');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_3800
     * @tc.name testArrayCopywithinOne038
     * @tc.desc Verify multiple assignment chain with copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const b = arr.copyWithin(0, 2, 5);
      const c = b;
      expect(b).assertEqual(arr);
      expect(c).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_3900
     * @tc.name testArrayCopywithinOne039
     * @tc.desc Verify copyWithin result as array literal element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3).copyWithin(1, 0, 2);
      const b = new Array<int>(4, 5, 6).copyWithin(1, 0, 2);
      expect(a[0]).assertEqual(1);
      expect(b[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_4000
     * @tc.name testArrayCopywithinOne040
     * @tc.desc Verify forEach after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 2, 5).forEach((v: int, i: int): void => {
        arr[i] = v + 1;
      });
      expect(arr[0]).assertEqual(4);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_4100
     * @tc.name testArrayCopywithinOne041
     * @tc.desc Verify reduceRight after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const sum = arr.copyWithin(0, 2, 5).reduceRight((acc: int, v: int): int => acc + v, 0);
      expect(sum).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_4200
     * @tc.name testArrayCopywithinOne042
     * @tc.desc Verify copyWithin result stored as object property
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const obj: ObjWithData = { data: arr.copyWithin(0, 2, 5) };
      expect(obj.data[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_4300
     * @tc.name testArrayCopywithinOne043
     * @tc.desc Verify two copyWithin calls in one expression
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const a1 = arr.copyWithin(0, 2, 5).length
      const a2 = arr.copyWithin(1, 0, 3).length;
      const total = a1 + a2;
      expect(total).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_4400
     * @tc.name testArrayCopywithinOne044
     * @tc.desc Verify copyWithin in template string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const result = `${arr.copyWithin(0, 3, 5)[0]}`;
      expect(result).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_4500
     * @tc.name testArrayCopywithinOne045
     * @tc.desc Verify copyWithin then fill in chain
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 1, 4).fill(0, 3, 5);
      expect(arr[0]).assertEqual(2);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_4600
     * @tc.name testArrayCopywithinOne046
     * @tc.desc Verify fill then copyWithin in chain
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.fill(9, 0, 2).copyWithin(2, 0, 4);
      expect(arr[0]).assertEqual(9);
      expect(arr[2]).assertEqual(9);
      expect(arr[4]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_4700
     * @tc.name testArrayCopywithinOne047
     * @tc.desc Verify copyWithin then sort in chain
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(3, 1, 4, 1, 5, 9, 2, 6);
      arr.copyWithin(2, 0, 4).sort((a: int, b: int): int => {
        return a - b;
      });
      expect(arr[0]).assertEqual(1);
      expect(arr[5]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_4800
     * @tc.name testArrayCopywithinOne048
     * @tc.desc Verify sort then copyWithin in chain
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(3, 1, 4, 1, 5);
      arr.sort((a: int, b: int): int => {
        return a - b;
      }).copyWithin(1, 0, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_4900
     * @tc.name testArrayCopywithinOne049
     * @tc.desc Verify copyWithin then reverse in chain
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6);
      arr.copyWithin(0, 2, 6).reverse();
      expect(arr[0]).assertEqual(6);
      expect(arr[5]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_5000
     * @tc.name testArrayCopywithinOne050
     * @tc.desc Verify reverse then copyWithin in chain
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6);
      arr.reverse().copyWithin(1, 0, 3);
      expect(arr[0]).assertEqual(6);
      expect(arr[1]).assertEqual(6);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_5100
     * @tc.name testArrayCopywithinOne051
     * @tc.desc Verify splice after copyWithin in chain
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 2, 5).splice(1, 2);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_5200
     * @tc.name testArrayCopywithinOne052
     * @tc.desc Verify map after copyWithin in chain
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 2, 5).map((v: int): int => {
        return v * 10;
      });
      expect(arr[0]).assertEqual(3);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_5300
     * @tc.name testArrayCopywithinOne053
     * @tc.desc Verify filter after copyWithin in chain
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6);
      arr.copyWithin(0, 2, 6).filter((v: int): boolean => v > 3);
      expect(arr[0]).assertEqual(3);
      expect(arr[5]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_5400
     * @tc.name testArrayCopywithinOne054
     * @tc.desc Verify find after copyWithin in chain
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const result = arr.copyWithin(0, 2, 5).find((v: int): boolean => v > 4);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_5500
     * @tc.name testArrayCopywithinOne055
     * @tc.desc Verify forEach side effect chain after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6);
      let sum = 0;
      arr.copyWithin(0, 2, 6).forEach((v: int): void => {
        sum += v;
      });
      expect(sum).assertEqual(29);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_5600
     * @tc.name testArrayCopywithinOne056
     * @tc.desc Verify large 10000-element array copy first half
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(10000, 5);
      arr.copyWithin(0, 0, 5000);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_5700
     * @tc.name testArrayCopywithinOne057
     * @tc.desc Verify large array copy last 1000 to start
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(10000, 5);
      for (let i = 0; i < 10000; i++) {
        arr[i] = 5;
      }
      arr.copyWithin(0, 9000, 10000);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_5800
     * @tc.name testArrayCopywithinOne058
     * @tc.desc Verify large array copy first 500 to near end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(10000, 5);
      for (let i = 0; i < 10000; i++) {
        arr[i] = 5;
      }
      arr.copyWithin(9500, 0, 500);
      expect(arr[9500]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_5900
     * @tc.name testArrayCopywithinOne059
     * @tc.desc Verify large array mid-copy preserves specific value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(10000, 5);
      for (let i = 0; i < 10000; i++) {
        arr[i] = 0;
      }
      arr[2500] = 1;
      arr.copyWithin(5000, 2500, 7500);
      expect(arr[5000]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_6000
     * @tc.name testArrayCopywithinOne060
     * @tc.desc Verify large array negative target copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(10000, 5);
      for (let i = 0; i < 10000; i++) {
        arr[i] = 5;
      }
      arr.copyWithin(-500, 0, 1000);
      expect(arr[9500]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_6100
     * @tc.name testArrayCopywithinOne061
     * @tc.desc Verify large array overlapping copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(10000, 5);
      for (let i = 0; i < 10000; i++) {
        arr[i] = 0;
      }
      arr[0] = 1;
      arr[1] = 2;
      arr.copyWithin(1, 0, 9999);
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_6200
     * @tc.name testArrayCopywithinOne062
     * @tc.desc Verify 50000-element array full copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(50000, 5);
      for (let i = 0; i < 50000; i++) {
        arr[i] = 42;
      }
      arr.copyWithin(0, 0, 50000);
      expect(arr[49999]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_6300
     * @tc.name testArrayCopywithinOne063
     * @tc.desc Verify 100000-element array partial copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(100000, 5);
      for (let i = 0; i < 100000; i++) {
        arr[i] = 7;
      }
      arr.copyWithin(50000, 0, 50000);
      expect(arr[50000]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_6400
     * @tc.name testArrayCopywithinOne064
     * @tc.desc Verify binary literal as start
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 0b10, 4);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_6500
     * @tc.name testArrayCopywithinOne065
     * @tc.desc Verify byte element array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<byte>();
      arr.push((1).toByte());
      arr.push((2).toByte());
      arr.push((3).toByte());
      arr.push((4).toByte());
      arr.push((5).toByte());
      arr.copyWithin(0, 2, 5);
      expect(arr[0]).assertEqual(3);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_6600
     * @tc.name testArrayCopywithinOne066
     * @tc.desc Verify short element array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<short>();
      arr.push((10).toShort());
      arr.push((20).toShort());
      arr.push((30).toShort());
      arr.push((40).toShort());
      arr.push((50).toShort());
      arr.copyWithin(0, 1, 4);
      expect(arr[0]).assertEqual(20);
      expect(arr[2]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_6700
     * @tc.name testArrayCopywithinOne067
     * @tc.desc Verify boolean element array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true, false, true);
      arr.copyWithin(0, 1, 4);
      expect(arr[0]).assertFalse();
      expect(arr[1]).assertTrue();
      expect(arr[2]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_6800
     * @tc.name testArrayCopywithinOne068
     * @tc.desc Verify long element array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<long>();
      arr.push(1);
      arr.push(2);
      arr.push(3);
      arr.copyWithin(0, 1, 3);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_6900
     * @tc.name testArrayCopywithinOne069
     * @tc.desc Verify bigint element array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>();
      arr.push(1n);
      arr.push(2n);
      arr.push(3n);
      arr.push(4n);
      arr.push(5n);
      arr.copyWithin(0, 2, 5);
      expect(arr[0]).assertEqual(3n);
      expect(arr[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_7000
     * @tc.name testArrayCopywithinOne070
     * @tc.desc Verify copyWithin copies elements from start index 2 to end index 5 to target index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5).copyWithin(0, 2, 5);
      expect(arr[0]).assertEqual(3);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_7100
     * @tc.name testArrayCopywithinOne071
     * @tc.desc Verify uninitialized array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = Array.create<int | undefined>(1, 5);
        arr.copyWithin(0, 1, 4);
        arr[4];
        expect().assertFail();
      }catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_7200
     * @tc.name testArrayCopywithinOne072
     * @tc.desc Verify empty array copyWithin returns empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      arr.copyWithin(0, 0, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_7300
     * @tc.name testArrayCopywithinOne073
     * @tc.desc Verify start > end results in no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 4, 2);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_7400
     * @tc.name testArrayCopywithinOne074
     * @tc.desc Verify target only (no start/end) on empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      arr.copyWithin(2);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_7500
     * @tc.name testArrayCopywithinOne075
     * @tc.desc Verify business format string array copyWithin with byte param
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: byte = 1;
      const arr = new Array<string>('13800138000', 'test@example.com', '2026-03-05');
      arr.copyWithin(t, 0);
      expect(arr[0]).assertEqual('13800138000');
      expect(arr[1]).assertEqual('13800138000');
      expect(arr[2]).assertEqual('test@example.com');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_7600
     * @tc.name testArrayCopywithinOne076
     * @tc.desc Verify multi-language string array copyWithin with short param
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: short = 2;
      const arr = new Array<string>('テスト', '테스트', 'АБВГД', 'الاختبار');
      arr.copyWithin(0, s);
      expect(arr[0]).assertEqual('АБВГД');
      expect(arr[1]).assertEqual('الاختبار');
      expect(arr[2]).assertEqual('АБВГД');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_7700
     * @tc.name testArrayCopywithinOne077
     * @tc.desc Verify very long string (100 chars) array copyWithin with long param
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr = 'x'.repeat(100);
      const t: int = 1;
      const arr = new Array<string>('short', longStr, 'end');
      arr.copyWithin(t, 0);
      expect(arr[0]).assertEqual('short');
      expect(arr[1]).assertEqual('short');
      expect(arr[2]).assertEqual(longStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_7800
     * @tc.name testArrayCopywithinOne078
     * @tc.desc Verify ID card and bank card string array copyWithin with float param
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const start: float = 1.0f;
      const arr = new Array<string>('310101199001011234', '622202********1234', 'end');
      arr.copyWithin(0, Float.toInt(start), 3);
      expect(arr[0]).assertEqual('622202********1234');
      expect(arr[1]).assertEqual('end');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_7900
     * @tc.name testArrayCopywithinOne079
     * @tc.desc Verify mixed Chinese-English string array copyWithin with double param
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: double = 1.0;
      const arr = new Array<string>('Test 測試', 'hello', 'mixed');
      arr.copyWithin(Double.toInt(t), 0);
      expect(arr[0]).assertEqual('Test 測試');
      expect(arr[1]).assertEqual('Test 測試');
      expect(arr[2]).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_8000
     * @tc.name testArrayCopywithinOne080
     * @tc.desc Verify float array elements copyWithin with byte param
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: byte = 1;
      const arr = new Array<float>(1.5f, 2.5f, 3.5f, 4.5f);
      arr.copyWithin(t, 0, 3);
      expect(arr[0]).assertEqual(1.5);
      expect(arr[1]).assertEqual(1.5);
      expect(arr[2]).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_8100
     * @tc.name testArrayCopywithinOne081
     * @tc.desc Verify double boundary values (MAX_VALUE, MIN_VALUE) array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(Double.MAX_VALUE, Double.MIN_VALUE, 1.0);
      arr.copyWithin(0, 1, 3);
      expect(arr[0]).assertEqual(Double.MIN_VALUE);
      expect(arr[1]).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_8200
     * @tc.name testArrayCopywithinOne082
     * @tc.desc Verify Date array elements copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1 = new Date(2026, 0, 1);
      const d2 = new Date(2026, 5, 1);
      const d3 = new Date(2026, 11, 1);
      const arr = new Array<Date>(d1, d2, d3);
      arr.copyWithin(0, 1, 3);
      expect(arr[0].getTime()).assertEqual(d2.getTime());
      expect(arr[1].getTime()).assertEqual(d3.getTime());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_8300
     * @tc.name testArrayCopywithinOne083
     * @tc.desc Verify short array elements copyWithin with byte param
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: byte = 1;
      const arr = new Array<short>(100, 2048, 32760, -32768);
      arr.copyWithin(t, 0, 3);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(100);
      expect(arr[2]).assertEqual(2048);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_8400
     * @tc.name testArrayCopywithinOne084
     * @tc.desc Verify long boundary array elements copyWithin with float param
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: float = 1.0f;
      const arr = new Array<long>(9223372036854775807, -9223372036854775808, 0);
      arr.copyWithin(Float.toInt(s), 0, 3);
      expect(arr[0]).assertEqual(9223372036854775807);
      expect(arr[1]).assertEqual(9223372036854775807);
      expect(arr[2]).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_8500
     * @tc.name testArrayCopywithinOne085
     * @tc.desc Verify char boundary array copyWithin with short param
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: short = 1;
      const arr = new Array<string>('\u0000', '\uffff', 'a');
      arr.copyWithin(t, 0, 2);
      expect(arr[0]).assertEqual('\u0000');
      expect(arr[1]).assertEqual('\u0000');
      expect(arr[2]).assertEqual('\uffff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_8600
     * @tc.name testArrayCopywithinOne086
     * @tc.desc Verify boolean array copyWithin with double param
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: double = 1.0;
      const arr = new Array<boolean>(true, false, true, false);
      arr.copyWithin(Double.toInt(t), 0, 3);
      expect(arr[0]).assertEqual(true);
      expect(arr[1]).assertEqual(true);
      expect(arr[2]).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_8700
     * @tc.name testArrayCopywithinOne087
     * @tc.desc Verify Map object array copyWithin with byte param
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: byte = 1;
      const m1 = new Map<string, int>();
      m1.set('a', 1);
      const m2 = new Map<string, int>();
      m2.set('b', 2);
      const m3 = new Map<string, int>();
      m3.set('c', 3);
      const arr = new Array<Map<string, int>>(m1, m2, m3);
      arr.copyWithin(t, 0, 3);
      expect(arr[0].get('a')).assertEqual(1);
      expect(arr[1].get('a')).assertEqual(1);
      expect(arr[2].get('b')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_8800
     * @tc.name testArrayCopywithinOne088
     * @tc.desc Verify string array with escaped unicode text and separators copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: byte = 1;
      const arr = new Array<string>('测试 \\ 转义符', '测试 分割符', 'end');
      arr.copyWithin(t, 0);
      expect(arr[0]).assertEqual('测试 \\ 转义符');
      expect(arr[1]).assertEqual('测试 \\ 转义符');
      expect(arr[2]).assertEqual('测试 分割符');
    });

  });
}
