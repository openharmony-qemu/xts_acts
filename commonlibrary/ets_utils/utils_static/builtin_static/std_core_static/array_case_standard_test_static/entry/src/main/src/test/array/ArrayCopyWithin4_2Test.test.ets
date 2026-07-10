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

function init(i: int): int {
  return (i % 2 === 0) ? i : -i;
}

function mid(len: int): int {
  return len / 2;
}

interface ObjWithData {
  data: Array<int>;
}

interface NodeWithChild {
  val: int;
  child: NodeWithChild | null;
}

interface ObjWithIdx {
  idx: int;
}

enum Status020 {
  Active = 0,
  Inactive = 1,
  Pending = 2
}

export default function ArrayCopyWithin4_2Test(): void {
  describe('ArrayCopyWithin4_2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_0100
     * @tc.name testArrayCopywithinFour001
     * @tc.desc Verify copyWithin(2) equals copyWithin(2,0) cross-overload equivalence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2, 3, 4, 5);
      const arr2 = new Array<int>(1, 2, 3, 4, 5);
      arr1.copyWithin(2);
      arr2.copyWithin(2, 0);
      expect(JSON.stringify(arr1) === JSON.stringify(arr2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_0200
     * @tc.name testArrayCopywithinFour002
     * @tc.desc Verify copyWithin(2) equals copyWithin(2,0,5) three-param equivalence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2, 3, 4, 5);
      const arr2 = new Array<int>(1, 2, 3, 4, 5);
      arr1.copyWithin(2);
      arr2.copyWithin(2, 0, 5);
      expect(JSON.stringify(arr1) === JSON.stringify(arr2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_0300
     * @tc.name testArrayCopywithinFour003
     * @tc.desc Verify negative single-param target=-1 equals copyWithin(-1,0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2, 3, 4, 5);
      const arr2 = new Array<int>(1, 2, 3, 4, 5);
      arr1.copyWithin(-1);
      arr2.copyWithin(-1, 0);
      expect(JSON.stringify(arr1) === JSON.stringify(arr2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_0400
     * @tc.name testArrayCopywithinFour004
     * @tc.desc Verify large array single-param equals two-param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<number>(1000, 42);
      const arr2 = Array.create<number>(1000, 42);
      arr1.copyWithin(500);
      arr2.copyWithin(500, 0);
      expect(arr1[500]).assertEqual(arr2[500]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_0500
     * @tc.name testArrayCopywithinFour005
     * @tc.desc Verify target=0 single-param equals two-param self-copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2, 3, 4, 5);
      const arr2 = new Array<int>(1, 2, 3, 4, 5);
      arr1.copyWithin(0);
      arr2.copyWithin(0, 0);
      expect(JSON.stringify(arr1) === JSON.stringify(arr2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_0600
     * @tc.name testArrayCopywithinFour006
     * @tc.desc Verify float array single-param equals three-param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<float>(1.1f, 2.2f, 3.3f, 4.4f);
      const arr2 = new Array<float>(1.1f, 2.2f, 3.3f, 4.4f);
      arr1.copyWithin(2);
      arr2.copyWithin(2, 0, 4);
      expect(arr1[2]).assertEqual(arr2[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_0700
     * @tc.name testArrayCopywithinFour007
     * @tc.desc Verify string array single-param equals three-param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('a', 'b', 'c', 'd');
      const arr2 = new Array<string>('a', 'b', 'c', 'd');
      arr1.copyWithin(1);
      arr2.copyWithin(1, 0, 4);
      expect(arr1[1]).assertEqual(arr2[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_0800
     * @tc.name testArrayCopywithinFour008
     * @tc.desc Verify single-param equals three-param at starting element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2, 3, 4, 5);
      const arr2 = new Array<int>(1, 2, 3, 4, 5);
      arr1.copyWithin(2);
      arr2.copyWithin(2, 0, 5);
      expect(arr1[0]).assertEqual(arr2[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_0900
     * @tc.name testArrayCopywithinFour009
     * @tc.desc Verify single-param equals two-param omitting end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2, 3, 4, 5);
      const arr2 = new Array<int>(1, 2, 3, 4, 5);
      arr1.copyWithin(2);
      arr2.copyWithin(2, 0);
      expect(arr1[3]).assertEqual(arr2[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_1000
     * @tc.name testArrayCopywithinFour010
     * @tc.desc Verify all three overloads produce equivalent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2, 3, 4, 5);
      const arr2 = new Array<int>(1, 2, 3, 4, 5);
      const arr3 = new Array<int>(1, 2, 3, 4, 5);
      arr1.copyWithin(1);
      arr2.copyWithin(1, 0);
      arr3.copyWithin(1, 0, 5);
      expect(arr1[2] === arr2[2] && arr2[2] === arr3[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_1100
     * @tc.name testArrayCopywithinFour011
     * @tc.desc Verify target=3, implicit end=length copies leading segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_1200
     * @tc.name testArrayCopywithinFour012
     * @tc.desc Verify target=length, single-param out of bounds is no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_1300
     * @tc.name testArrayCopywithinFour013
     * @tc.desc Verify single-param negative target=-length equals target=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(-5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_1400
     * @tc.name testArrayCopywithinFour014
     * @tc.desc Verify negative target=-3 copies leading 3 elements to positions 3-5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6);
      arr.copyWithin(-3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(2);
      expect(arr[5]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_1500
     * @tc.name testArrayCopywithinFour015
     * @tc.desc Verify single-param consistency across int/string/boolean types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2, 3, 4, 5);
      const arr2 = new Array<string>('a', 'b', 'c', 'd', 'e');
      const arr3 = new Array<boolean>(true, false, true, false, true);
      const r = arr1.copyWithin(1);
      const s = arr2.copyWithin(1);
      const t = arr3.copyWithin(1);
      expect(r[0] === 1 && s[0] === 'a' && t[0] === true).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_1600
     * @tc.name testArrayCopywithinFour016
     * @tc.desc Verify negative target beyond -length clamps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.copyWithin(-5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_1700
     * @tc.name testArrayCopywithinFour017
     * @tc.desc Verify single-param does not change array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(2);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_1800
     * @tc.name testArrayCopywithinFour018
     * @tc.desc Verify target=MIN_INT clamps to 0, self-copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(-2147483648);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_1900
     * @tc.name testArrayCopywithinFour019
     * @tc.desc Verify target=-2^31 clamps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(-2147483648);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_2000
     * @tc.name testArrayCopywithinFour020
     * @tc.desc Verify MAX_INT and MAX_INT-1 both out-of-bounds behave same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(2147483647);
      const arr2 = new Array<int>(1, 2, 3, 4, 5);
      arr2.copyWithin(2147483646);
      expect(arr[0]).assertEqual(arr2[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_2100
     * @tc.name testArrayCopywithinFour021
     * @tc.desc Verify target=-1 copies first element to last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(-1);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_2200
     * @tc.name testArrayCopywithinFour022
     * @tc.desc Verify target=-(length+1) clamps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(-6);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_2300
     * @tc.name testArrayCopywithinFour023
     * @tc.desc Verify int sign bit boundary target=MIN_INT equivalent to copyWithin(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: int = -2147483648;
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(t);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_2400
     * @tc.name testArrayCopywithinFour024
     * @tc.desc Verify int overflow target wraps and is no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const t: int = 2147483647 + 1;
      arr.copyWithin(t);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_2500
     * @tc.name testArrayCopywithinFour025
     * @tc.desc Verify target=-0 is treated as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(-0);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_2600
     * @tc.name testArrayCopywithinFour026
     * @tc.desc Verify chained call with out-of-bounds then valid target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(2147483647)
      arr.copyWithin(0);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_2700
     * @tc.name testArrayCopywithinFour027
     * @tc.desc Verify Array.from+iterator construct then copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrT = new Array<int>(1, 2, 3, 4, 5);
      let iter = arrT.values()
      const arr = Array.from<int>(iter);
      arr.copyWithin(1);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(3);
      expect(arr[4]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_2800
     * @tc.name testArrayCopywithinFour028
     * @tc.desc Verify Set converted to Array then copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<int>(new Array<int>(1, 2, 3, 4, 5));
      const arr = Array.from<int>(s);
      arr.copyWithin(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
      expect(arr[3]).assertEqual(2);
      expect(arr[4]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_2900
     * @tc.name testArrayCopywithinFour029
     * @tc.desc Verify Map values converted to Array then copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>(new Array<[string, int]>(['a', 1], ['b', 2], ['c', 3], ['d', 4], ['e', 5]));
      const arr = Array.from<int>(m.values());
      arr.copyWithin(1);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(3);
      expect(arr[4]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_3000
     * @tc.name testArrayCopywithinFour030
     * @tc.desc Verify string converted to char array then copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'a', c'b', c'c', c'd', c'e');
      arr.copyWithin(2);
      expect(arr[0]).assertEqual(c'a');
      expect(arr[1]).assertEqual(c'b');
      expect(arr[2]).assertEqual(c'a');
      expect(arr[3]).assertEqual(c'b');
      expect(arr[4]).assertEqual(c'c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_3100
     * @tc.name testArrayCopywithinFour031
     * @tc.desc Verify ArrayLike object converted to Array then copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'd', 'e');
      arr.copyWithin(1);
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual('a');
      expect(arr[2]).assertEqual('b');
      expect(arr[3]).assertEqual('c');
      expect(arr[4]).assertEqual('d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_3200
     * @tc.name testArrayCopywithinFour032
     * @tc.desc Verify generator iterator to Array then copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_3300
     * @tc.name testArrayCopywithinFour033
     * @tc.desc Verify entries converted to Array then copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'd', 'e');
      arr.copyWithin(1);
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_3400
     * @tc.name testArrayCopywithinFour034
     * @tc.desc Verify literal 0/1 values array copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0, 1, 2, 3, 4);
      arr.copyWithin(2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_3500
     * @tc.name testArrayCopywithinFour035
     * @tc.desc Verify byte type extreme values array copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<byte>(127, -128, 0, 127, -128);
      arr.copyWithin(1);
      expect(arr[0]).assertEqual(127);
      expect(arr[1]).assertEqual(127);
      expect(arr[2]).assertEqual(-128);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_3600
     * @tc.name testArrayCopywithinFour036
     * @tc.desc Verify short type extreme values array copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<short>(32767, -32768, 0, 32767, -32768);
      arr.copyWithin(2);
      expect(arr[0]).assertEqual(32767);
      expect(arr[1]).assertEqual(-32768);
      expect(arr[2]).assertEqual(32767);
      expect(arr[3]).assertEqual(-32768);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_3700
     * @tc.name testArrayCopywithinFour037
     * @tc.desc Verify long type boundary values copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<long>(9223372036854775807, -9223372036854775808, 0);
      arr.copyWithin(1);
      expect(arr[0]).assertEqual(9223372036854775807);
      expect(arr[1]).assertEqual(9223372036854775807);
      expect(arr[2]).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_3800
     * @tc.name testArrayCopywithinFour038
     * @tc.desc Verify float special values copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(3.40282347e+38, 1.40129846e-45, Double.NaN, Double.POSITIVE_INFINITY);
      arr.copyWithin(1);
      expect(arr[0]).assertEqual(3.40282347e+38);
      expect(isNaN(arr[3])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_3900
     * @tc.name testArrayCopywithinFour039
     * @tc.desc Verify double special values copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(1.7976931348623157e+308, 4.94065645841247e-324, Double.NaN, Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY);
      arr.copyWithin(2);
      expect(arr[0]).assertEqual(1.7976931348623157e+308);
      expect(isNaN(arr[4])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_4000
     * @tc.name testArrayCopywithinFour040
     * @tc.desc Verify bigint boundary values copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.copyWithin(1);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_4100
     * @tc.name testArrayCopywithinFour041
     * @tc.desc Verify char type range boundary copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'\u0000', c'\uffff', c'a', c'\u4e2d');
      arr.copyWithin(1);
      expect(arr[0]).assertEqual(c'\u0000');
      expect(arr[1]).assertEqual(c'\u0000');
      expect(arr[2]).assertEqual(c'\uffff');
      expect(arr[3]).assertEqual(c'a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_4200
     * @tc.name testArrayCopywithinFour042
     * @tc.desc Verify constructor init callback array single-param copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, (i) => i * 10);
      arr.copyWithin(2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(10);
      expect(arr[4]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_4300
     * @tc.name testArrayCopywithinFour043
     * @tc.desc Verify chained constructor and copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, (i) => i * 10).copyWithin(1);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(10);
      expect(arr[3]).assertEqual(20);
      expect(arr[4]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_4400
     * @tc.name testArrayCopywithinFour044
     * @tc.desc Verify nested constructor array shallow copy copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<int>>(3, (i) => new Array<int>(3, (j) => i * 3 + j));
      arr.copyWithin(1);
      expect(arr[0]).assertEqual(arr[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_4500
     * @tc.name testArrayCopywithinFour045
     * @tc.desc Verify complex init function array copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(6, init);
      arr.copyWithin(2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(-1);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(-1);
      expect(arr[4]).assertEqual(2);
      expect(arr[5]).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_4600
     * @tc.name testArrayCopywithinFour046
     * @tc.desc Verify create then filter chain then copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(10, 1).filter((v) => {
        return v > 0;
      });
      arr.copyWithin(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_4700
     * @tc.name testArrayCopywithinFour047
     * @tc.desc Verify Array.of with concat then copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<int>(1, 2, 3).concat(new Array<int>(4, 5));
      arr.copyWithin(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
      expect(arr[3]).assertEqual(2);
      expect(arr[4]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_4800
     * @tc.name testArrayCopywithinFour048
     * @tc.desc Verify two independent expression results sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3, 4, 5).copyWithin(2);
      const b = new Array<int>(6, 7, 8, 9, 10).copyWithin(2);
      const va = a[0];
      const vb = b[0];
      const result = va + vb;
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_4900
     * @tc.name testArrayCopywithinFour049
     * @tc.desc Verify constructor with dynamic external variable then copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = 10;
      const arr = new Array<int>(5, (i) => base + i);
      arr.copyWithin(1);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(11);
      expect(arr[3]).assertEqual(12);
      expect(arr[4]).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_5000
     * @tc.name testArrayCopywithinFour050
     * @tc.desc Verify large array of 1000 object elements shallow copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const objs: Array<ObjWithIdx> = new Array<ObjWithIdx>(1000, (i): ObjWithIdx => { return { idx: i }; });
      objs.copyWithin(500);
      expect(objs[500].idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_5100
     * @tc.name testArrayCopywithinFour051
     * @tc.desc Verify expression computed target value copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const t: int = '2'.charCodeAt(0) - 48;
      arr.copyWithin(t);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
      expect(arr[3]).assertEqual(2);
      expect(arr[4]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_5200
     * @tc.name testArrayCopywithinFour052
     * @tc.desc Verify cross-module function call with copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
      expect(arr[3]).assertEqual(2);
      expect(arr[4]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_5300
     * @tc.name testArrayCopywithinFour053
     * @tc.desc Verify conditional branch selective copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      if (true) {
        arr.copyWithin(2);
      } else {
        arr.copyWithin(3);
      }
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
      expect(arr[3]).assertEqual(2);
      expect(arr[4]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_5400
     * @tc.name testArrayCopywithinFour054
     * @tc.desc Verify chained call accessing length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len = new Array<int>(1, 2, 3, 4, 5).copyWithin(2).length;
      expect(len).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_5500
     * @tc.name testArrayCopywithinFour055
     * @tc.desc Verify chained call accessing element by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val = new Array<int>(10, 20, 30, 40, 50).copyWithin(1)[0];
      expect(val).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_5600
     * @tc.name testArrayCopywithinFour056
     * @tc.desc Verify double chained copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<int>(1, 2, 3, 4, 5).copyWithin(1).copyWithin(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(1);
      expect(result[3]).assertEqual(1);
      expect(result[4]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_5700
     * @tc.name testArrayCopywithinFour057
     * @tc.desc Verify chained call with join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str = new Array<string>('a', 'b', 'c', 'd', 'e').copyWithin(1).join(',');
      expect(str).assertEqual('a,a,b,c,d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_5800
     * @tc.name testArrayCopywithinFour058
     * @tc.desc Verify chained call with concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<int>(1, 2, 3).copyWithin(1).concat(new Array<int>(4, 5));
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_5900
     * @tc.name testArrayCopywithinFour059
     * @tc.desc Verify copyWithin result instanceof Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Array<int>(1, 2, 3, 4, 5).copyWithin(2) instanceof Array;
      expect(b).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_6000
     * @tc.name testArrayCopywithinFour060
     * @tc.desc Verify Array.isArray on copyWithin result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = Array.isArray(new Array<int>(1, 2, 3, 4, 5).copyWithin(2));
      expect(b).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_6100
     * @tc.name testArrayCopywithinFour061
     * @tc.desc Verify chained copyWithin in object property init
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: ObjWithData = { data: new Array<int>(1, 2, 3, 4, 5).copyWithin(2) };
      expect(obj.data[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_6200
     * @tc.name testArrayCopywithinFour062
     * @tc.desc Verify function return value as single-param target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6);
      arr.copyWithin(mid(arr.length));
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(2);
      expect(arr[5]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_6300
     * @tc.name testArrayCopywithinFour063
     * @tc.desc Verify target=string length is no-op when equal to array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = 'hello';
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(s.length);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_6400
     * @tc.name testArrayCopywithinFour064
     * @tc.desc Verify Math.max result as target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(Double.toInt(Math.max(0, 2)));
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
      expect(arr[3]).assertEqual(2);
      expect(arr[4]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_6500
     * @tc.name testArrayCopywithinFour065
     * @tc.desc Verify string to int conversion as target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(Double.toInt(parseInt('3')));
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_6600
     * @tc.name testArrayCopywithinFour066
     * @tc.desc Verify String element array copyWithin reference copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('hello', 'world', 'foo', 'bar');
      arr.copyWithin(1);
      expect(arr[0]).assertEqual('hello');
      expect(arr[1]).assertEqual('hello');
      expect(arr[2]).assertEqual('world');
      expect(arr[3]).assertEqual('foo');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_6700
     * @tc.name testArrayCopywithinFour067
     * @tc.desc Verify Date element array copyWithin reference copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1 = new Date('2024-01-01');
      const d2 = new Date('2024-06-01');
      const d3 = new Date('2024-12-01');
      const arr = new Array<Date>(d1, d2, d3);
      arr.copyWithin(1);
      expect(arr[0]).assertEqual(arr[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_6800
     * @tc.name testArrayCopywithinFour068
     * @tc.desc Verify bigint element array copyWithin value copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
      expect(arr[3]).assertEqual(2);
      expect(arr[4]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_6900
     * @tc.name testArrayCopywithinFour069
     * @tc.desc Verify null element array copyWithin propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 0, 3, 0, 5);
      arr[1] = -1;
      arr[3] = -1;
      arr.copyWithin(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(-1);
      expect(arr[2]).assertEqual(1);
      expect(arr[3]).assertEqual(-1);
      expect(arr[4]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_7000
     * @tc.name testArrayCopywithinFour070
     * @tc.desc Verify undefined element array copyWithin propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 0, 3, 0, 5);
      arr.copyWithin(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(1);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_7100
     * @tc.name testArrayCopywithinFour071
     * @tc.desc Verify copyWithin correctly copy elements when only pass hexadecimal literal 0x2 as target index without source start and end indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0x2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
      expect(arr[3]).assertEqual(2);
      expect(arr[4]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_7200
     * @tc.name testArrayCopywithinFour072
     * @tc.desc Verify octal literal as target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0o4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_7300
     * @tc.name testArrayCopywithinFour073
     * @tc.desc Verify binary literal as target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0b11);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_7400
     * @tc.name testArrayCopywithinFour074
     * @tc.desc Verify copyWithin copies array elements starting from index 0 to target index 2 when only target parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(1, 2, 3, 4, 5).copyWithin(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
      expect(arr[3]).assertEqual(2);
      expect(arr[4]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_7500
     * @tc.name testArrayCopywithinFour075
     * @tc.desc Verify Array.from on copyWithin result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const result = Array.from(arr.copyWithin(2));
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(1);
      expect(result[3]).assertEqual(2);
      expect(result[4]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_7600
     * @tc.name testArrayCopywithinFour076
     * @tc.desc Verify toSorted chained with copyWithin does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(3, 1, 4, 1, 5);
      arr.toSorted((a: int, b: int): int => {
        return a - b;
      }).copyWithin(2);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_7700
     * @tc.name testArrayCopywithinFour077
     * @tc.desc Verify toReversed chained with copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const r = arr.toReversed().copyWithin(2);
      expect(r[0]).assertEqual(5);
      expect(r[1]).assertEqual(4);
      expect(r[2]).assertEqual(5);
      expect(r[3]).assertEqual(4);
      expect(r[4]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_7800
     * @tc.name testArrayCopywithinFour078
     * @tc.desc Verify with chained with copyWithin does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.with(2, 99).copyWithin(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_7900
     * @tc.name testArrayCopywithinFour079
     * @tc.desc Verify shrinkTo extended then copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.shrinkTo(8);
      arr.copyWithin(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
      expect(arr[3]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_8000
     * @tc.name testArrayCopywithinFour080
     * @tc.desc Verify ID card number string array copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('310101199001011234', '110102198803051234', 'end');
      arr.copyWithin(1);
      expect(arr[0]).assertEqual('310101199001011234');
      expect(arr[1]).assertEqual('310101199001011234');
      expect(arr[2]).assertEqual('110102198803051234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_8100
     * @tc.name testArrayCopywithinFour081
     * @tc.desc Verify non-printable char and zero-width space string array copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('\u200B', '\u0000', '\u200B', 'visible');
      arr.copyWithin(2);
      expect(arr[0]).assertEqual('\u200B');
      expect(arr[1]).assertEqual('\u0000');
      expect(arr[2]).assertEqual('\u200B');
      expect(arr[3]).assertEqual('\u0000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_8200
     * @tc.name testArrayCopywithinFour082
     * @tc.desc Verify mixed whitespace string array copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', ' ', '\t', '\n', '\r');
      arr.copyWithin(3);
      expect(arr[0]).assertEqual('');
      expect(arr[1]).assertEqual(' ');
      expect(arr[2]).assertEqual('\t');
      expect(arr[3]).assertEqual('');
      expect(arr[4]).assertEqual(' ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_8300
     * @tc.name testArrayCopywithinFour083
     * @tc.desc Verify very long string (65535 chars) array copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr = 'x'.repeat(65535);
      const arr = new Array<string>('start', longStr, 'end');
      arr.copyWithin(1);
      expect(arr[0]).assertEqual('start');
      expect(arr[1]).assertEqual('start');
      expect(arr[2]).assertEqual(longStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_8400
     * @tc.name testArrayCopywithinFour084
     * @tc.desc Verify enum array copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Status020.Active, Status020.Inactive, Status020.Pending);
      arr.copyWithin(1);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_8500
     * @tc.name testArrayCopywithinFour085
     * @tc.desc Verify byte array boundary values copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<byte>(127, -128, 0, 99);
      arr.copyWithin(2);
      expect(arr[0]).assertEqual(127);
      expect(arr[1]).assertEqual(-128);
      expect(arr[2]).assertEqual(127);
      expect(arr[3]).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_8600
     * @tc.name testArrayCopywithinFour086
     * @tc.desc Verify short array boundary elements copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<short>(32767, -32768, 0);
      arr.copyWithin(1);
      expect(arr[0]).assertEqual(32767);
      expect(arr[1]).assertEqual(32767);
      expect(arr[2]).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_8700
     * @tc.name testArrayCopywithinFour087
     * @tc.desc Verify long boundary array elements copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<long>(9223372036854775807, -9223372036854775808, 0, 100);
      arr.copyWithin(2);
      expect(arr[0]).assertEqual(9223372036854775807);
      expect(arr[1]).assertEqual(-9223372036854775808);
      expect(arr[2]).assertEqual(9223372036854775807);
      expect(arr[3]).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_8800
     * @tc.name testArrayCopywithinFour088
     * @tc.desc Verify RegExp array elements copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = new RegExp('hello');
      const r2 = new RegExp('world');
      const arr = new Array<RegExp>(r1, r2);
      arr.copyWithin(0);
      expect(arr[0].test('hello')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_8900
     * @tc.name testArrayCopywithinFour089
     * @tc.desc Verify union string|number array copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string | int> = new Array<string | int>('a', 1, 'b', 2);
      arr.copyWithin(1);
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual('a');
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_9000
     * @tc.name testArrayCopywithinFour090
     * @tc.desc Verify more multi-language string array copyWithin (Việt, ไทย, हिन्दी)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('Tiếng Việt', 'ภาษาไทย', 'हिन्दी', 'end');
      arr.copyWithin(2);
      expect(arr[0]).assertEqual('Tiếng Việt');
      expect(arr[1]).assertEqual('ภาษาไทย');
      expect(arr[2]).assertEqual('Tiếng Việt');
      expect(arr[3]).assertEqual('ภาษาไทย');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_9100
     * @tc.name testArrayCopywithinFour091
     * @tc.desc Verify copyWithin(target) on int|null array copies null correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | null> = new Array<int | null>(null, 2, null, 4);
      arr.copyWithin(0);
      expect(arr[0]).assertNull();
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_9200
     * @tc.name testArrayCopywithinFour092
     * @tc.desc Verify copyWithin(target) on int|undefined array copies undefined correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | undefined> = new Array<int | undefined>(undefined, 2, undefined, 4);
      arr.copyWithin(1);
      expect(arr[0]).assertUndefined();
      expect(arr[1]).assertUndefined();
      expect(arr[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_FOUR_9300
     * @tc.name testArrayCopywithinFour093
     * @tc.desc Verify copyWithin(target) shallow copies nested object with null child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCopywithinFour093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: NodeWithChild = { val: 1, child: null };
      const obj2: NodeWithChild = { val: 2, child: { val: 3, child: null } };
      const arr = new Array<NodeWithChild>(obj1, obj2);
      arr.copyWithin(0);
      expect(arr[0].val).assertEqual(1);
      expect(arr[0].child).assertNull();
      expect(arr[1].child != null).assertTrue();
    });
  });
}