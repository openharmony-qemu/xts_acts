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

interface ObjWithVal {
  val: int;
}

interface ObjWithA {
  a: int;
}

interface NodeWithChild {
  val: int;
  child: NodeWithChild | null;
}

export default function ArrayCopyWithin3_2Test(): void {
  describe('ArrayCopyWithin3_2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_0100
     * @tc.name testArrayCopywithinThree001
     * @tc.desc Verify initializer constructor array then copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, (i: int): int => i * 10);
      arr.copyWithin(1, 3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(30);
      expect(arr[2]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_0200
     * @tc.name testArrayCopywithinThree002
     * @tc.desc Verify Array.from created array then copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Array<int>(1, 2, 3, 4, 5);
      const arr = Array.from<int>(src);
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_0300
     * @tc.name testArrayCopywithinThree003
     * @tc.desc Verify Array.of created array then copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<int>(10, 20, 30, 40, 50);
      arr.copyWithin(1, 3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(40);
      expect(arr[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_0400
     * @tc.name testArrayCopywithinThree004
     * @tc.desc Verify literal array direct copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(1, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_0500
     * @tc.name testArrayCopywithinThree005
     * @tc.desc Verify manually filled array then copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, (): int => 0);
      for (let i = 0; i < 5; i++) {
        arr[i] = i + 1;
      }
      arr.copyWithin(2, 0);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(1);
      expect(arr[3]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_0600
     * @tc.name testArrayCopywithinThree006
     * @tc.desc Verify Array.create reference array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sub = new Array<int>(1, 2);
      const arr = Array.create<Array<int>>(3, sub);
      arr.copyWithin(1, 0);
      expect(arr[0]).assertEqual(arr[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_0700
     * @tc.name testArrayCopywithinThree007
     * @tc.desc Verify nested initializer 2D array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<int>>(3, (i: int): Array<int> => new Array<int>(2, (j: int): int => i * 10 + j));
      arr.copyWithin(1, 0);
      expect(arr[0]).assertEqual(arr[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_0800
     * @tc.name testArrayCopywithinThree008
     * @tc.desc Verify NaN/Infinity elements copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(5, (): double => 0);
      arr[0] = Double.NaN;
      arr[1] = Double.POSITIVE_INFINITY;
      arr[2] = Double.NEGATIVE_INFINITY;
      arr.copyWithin(1, 0);
      expect(isNaN(arr[1])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_0900
     * @tc.name testArrayCopywithinThree009
     * @tc.desc Verify length=0 empty array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0, (): int => 0);
      arr.copyWithin(0, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_1000
     * @tc.name testArrayCopywithinThree010
     * @tc.desc Verify Array.create zero length copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(0, 0);
      arr.copyWithin(0, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_1100
     * @tc.name testArrayCopywithinThree011
     * @tc.desc Verify length=0 then copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.length = 0;
      arr.copyWithin(0, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_1200
     * @tc.name testArrayCopywithinThree012
     * @tc.desc Verify length=1 then copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.length = 1;
      arr.copyWithin(0, 0);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_1300
     * @tc.name testArrayCopywithinThree013
     * @tc.desc Verify large array concat then copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big = Array.create<number>(10000, 1);
      const small = new Array<int>(1, 2, 3);
      small.copyWithin(0, 1);
      expect(small[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_1400
     * @tc.name testArrayCopywithinThree014
     * @tc.desc Verify empty array push then copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      arr.copyWithin(0, 0);
      arr.push(1);
      arr.copyWithin(0, 0);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_1500
     * @tc.name testArrayCopywithinThree015
     * @tc.desc Verify destructuring copyWithin result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      const arr2 = arr.copyWithin(1, 3);
      const a = arr2[0];
      const b = arr2[1];
      const rest = arr2.slice(2);
      const result = a + b + rest.length;
      expect(result).assertEqual(53);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_1600
     * @tc.name testArrayCopywithinThree016
     * @tc.desc Verify target=0, start=length-1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 4);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_1700
     * @tc.name testArrayCopywithinThree017
     * @tc.desc Verify target=length-1, start=0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(4, 0);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_1800
     * @tc.name testArrayCopywithinThree018
     * @tc.desc Verify target=0, start=length/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6, 7, 8);
      arr.copyWithin(0, 4);
      expect(arr[0]).assertEqual(5);
      expect(arr[3]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_1900
     * @tc.name testArrayCopywithinThree019
     * @tc.desc Verify large span from start=1 to target=length-2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      arr.copyWithin(8, 1);
      expect(arr[8]).assertEqual(2);
      expect(arr[9]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_2000
     * @tc.name testArrayCopywithinThree020
     * @tc.desc Verify target+span truncated at length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(3, 0);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_2100
     * @tc.name testArrayCopywithinThree021
     * @tc.desc Verify large array single element copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(10000, 0);
      arr[0] = 99;
      arr.copyWithin(1, 0);
      expect(arr[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_2200
     * @tc.name testArrayCopywithinThree022
     * @tc.desc Verify step-by-step right shift
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6, 7, 8);
      arr.copyWithin(1, 0);
      arr.copyWithin(2, 1);
      arr.copyWithin(3, 2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(1);
      expect(arr[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_2300
     * @tc.name testArrayCopywithinThree023
     * @tc.desc Verify step-by-step left shift
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6, 7, 8);
      arr.copyWithin(0, 1);
      arr.copyWithin(1, 2);
      arr.copyWithin(2, 3);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(4);
      expect(arr[6]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_2400
     * @tc.name testArrayCopywithinThree024
     * @tc.desc Verify byte element array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<byte>();
      arr.push((10).toByte());
      arr.push((20).toByte());
      arr.push((30).toByte());
      arr.push((40).toByte());
      arr.push((50).toByte());
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(30);
      expect(arr[1]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_2500
     * @tc.name testArrayCopywithinThree025
     * @tc.desc Verify short element array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<short>();
      arr.push((100).toShort());
      arr.push((200).toShort());
      arr.push((300).toShort());
      arr.push((400).toShort());
      arr.copyWithin(1, 2);
      expect(arr[1]).assertEqual(300);
      expect(arr[2]).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_2600
     * @tc.name testArrayCopywithinThree026
     * @tc.desc Verify long element array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<long>();
      arr.push(10000000000);
      arr.push(20000000000);
      arr.push(30000000000);
      arr.copyWithin(0, 1);
      expect(arr[0]).assertEqual(20000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_2700
     * @tc.name testArrayCopywithinThree027
     * @tc.desc Verify float element array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<float>();
      arr.push((1.5).toFloat());
      arr.push((2.5).toFloat());
      arr.push((3.5).toFloat());
      arr.push((4.5).toFloat());
      arr.push((5.5).toFloat());
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(3.5);
      expect(arr[1]).assertEqual(4.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_2800
     * @tc.name testArrayCopywithinThree028
     * @tc.desc Verify double element array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(1.1, 2.2, 3.3, 4.4, 5.5);
      arr.copyWithin(2, 0);
      expect(arr[2]).assertEqual(1.1);
      expect(arr[3]).assertEqual(2.2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_2900
     * @tc.name testArrayCopywithinThree029
     * @tc.desc Verify char element array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'a', c'b', c'c', c'd', c'e');
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(c'c');
      expect(arr[1]).assertEqual(c'd');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_3000
     * @tc.name testArrayCopywithinThree030
     * @tc.desc Verify string element array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('hello', 'world', 'foo', 'bar');
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual('foo');
      expect(arr[1]).assertEqual('bar');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_3100
     * @tc.name testArrayCopywithinThree031
     * @tc.desc Verify boolean element array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true, false);
      arr.copyWithin(1, 2);
      expect(arr[0]).assertTrue();
      expect(arr[1]).assertTrue();
      expect(arr[2]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_3200
     * @tc.name testArrayCopywithinThree032
     * @tc.desc Verify Date object array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Date>(new Date('2024-01-01'), new Date('2024-06-01'), new Date('2024-12-01'));
      arr.copyWithin(0, 1);
      expect(arr[1]).assertEqual(arr[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_3300
     * @tc.name testArrayCopywithinThree033
     * @tc.desc Verify bigint element array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<long>();
      arr.push(1);
      arr.push(2);
      arr.push(3);
      arr.push(4);
      arr.push(5);
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_3400
     * @tc.name testArrayCopywithinThree034
     * @tc.desc Verify null element array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, null, 3, null, 5);
      arr.copyWithin(1, 2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_3500
     * @tc.name testArrayCopywithinThree035
     * @tc.desc Verify undefined element array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, undefined, 3, undefined, 5);
      arr.copyWithin(1, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(undefined);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_3600
     * @tc.name testArrayCopywithinThree036
     * @tc.desc Verify copyWithin correctly copy elements when target index uses hexadecimal literal 0x2, only specify source start index 1 and omit source end index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0x2, 1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_3700
     * @tc.name testArrayCopywithinThree037
     * @tc.desc Verify octal literal as start
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6);
      arr.copyWithin(0, 0o4);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_3800
     * @tc.name testArrayCopywithinThree038
     * @tc.desc Verify binary literal as target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0b10, 0);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_3900
     * @tc.name testArrayCopywithinThree039
     * @tc.desc Verify copyWithin copies elements starting from index 2 without specifying end index to target index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(1, 2, 3, 4, 5).copyWithin(0, 2);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_4000
     * @tc.name testArrayCopywithinThree040
     * @tc.desc Verify Array.from with copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Array<int>(1, 2, 3, 4, 5);
      const result = Array.from(src.copyWithin(2, 0));
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_4100
     * @tc.name testArrayCopywithinThree041
     * @tc.desc Verify toSorted then copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(3, 1, 4, 1, 5);
      arr.toSorted((a: int, b: int): int => {
        return a - b;
      }).copyWithin(1, 2);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_4200
     * @tc.name testArrayCopywithinThree042
     * @tc.desc Verify toReversed then copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const r = arr.toReversed().copyWithin(0, 2);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_4300
     * @tc.name testArrayCopywithinThree043
     * @tc.desc Verify with then copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.with(2, 99).copyWithin(0, 2);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_4400
     * @tc.name testArrayCopywithinThree044
     * @tc.desc Verify shrinkTo then copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.shrinkTo(8);
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_4500
     * @tc.name testArrayCopywithinThree045
     * @tc.desc Verify getter setter object array shallow copy propagation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ObjWithVal = { val: 1 };
      const obj2: ObjWithVal = { val: 2 };
      const arr = new Array<ObjWithVal>(obj1, obj2);
      arr.copyWithin(0, 1);
      arr[0].val = 99;
      expect(arr[1].val).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_4600
     * @tc.name testArrayCopywithinThree046
     * @tc.desc Verify frozen object element not modified after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const frozen: ObjWithA = { a: 1 };
      const mutable: ObjWithA = { a: 2 };
      const arr = new Array<ObjWithA>(frozen, mutable);
      arr.copyWithin(0, 1);
      expect(arr[0].a).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_4700
     * @tc.name testArrayCopywithinThree047
     * @tc.desc Verify sealed object property modifiable after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sealed: ObjWithA = { a: 1 };
      const obj2: ObjWithA = { a: 2 };
      const arr = new Array<ObjWithA>(sealed, obj2);
      arr.copyWithin(0, 1);
      arr[0].a = 99;
      expect(arr[0].a).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_4800
     * @tc.name testArrayCopywithinThree048
     * @tc.desc Verify length getter interaction with copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 1);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_4900
     * @tc.name testArrayCopywithinThree049
     * @tc.desc Verify negative target index copies from start to end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(-2, 0);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_5000
     * @tc.name testArrayCopywithinThree050
     * @tc.desc Verify negative start index counts from end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, -3);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_5100
     * @tc.name testArrayCopywithinThree051
     * @tc.desc Verify copyWithin performs no operation when target index exceeds array length, only source start index provided and source end index omitted
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(10, 0);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_5200
     * @tc.name testArrayCopywithinThree052
     * @tc.desc Verify start out of range clamped to length (no-op)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 10);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_5300
     * @tc.name testArrayCopywithinThree053
     * @tc.desc Verify NaN converted via Double.toInt as target treated as 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const nanTarget: int = Double.toInt(Double.NaN);
      arr.copyWithin(nanTarget, 0);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_5400
     * @tc.name testArrayCopywithinThree054
     * @tc.desc Verify Infinity converted via Double.toInt as target clamped to length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const infTarget: int = Double.toInt(Double.POSITIVE_INFINITY);
      arr.copyWithin(infTarget, 0);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_5500
     * @tc.name testArrayCopywithinThree055
     * @tc.desc Verify single element array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(42);
      arr.copyWithin(0, 0);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_5600
     * @tc.name testArrayCopywithinThree056
     * @tc.desc Verify Unicode string array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('\u4e2d', '\u6587', '\u0061');
      arr.copyWithin(0, 1);
      expect(arr[0]).assertEqual('\u6587');
      expect(arr[1]).assertEqual('\u0061');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_5700
     * @tc.name testArrayCopywithinThree057
     * @tc.desc Verify empty string array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', 'a', 'b');
      arr.copyWithin(0, 1);
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_5800
     * @tc.name testArrayCopywithinThree058
     * @tc.desc Verify special character string array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('!@#$', '%^&*', 'test');
      arr.copyWithin(0, 1);
      expect(arr[0]).assertEqual('%^&*');
      expect(arr[1]).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_5900
     * @tc.name testArrayCopywithinThree059
     * @tc.desc Verify XSS string array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('<script>alert(1)</script>', 'safe', 'test');
      arr.copyWithin(0, 1);
      expect(arr[0]).assertEqual('safe');
      expect(arr[1]).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_6000
     * @tc.name testArrayCopywithinThree060
     * @tc.desc Verify emoji string array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('\uD83D\uDE00', '\uD83C\uDF89', 'test');
      arr.copyWithin(0, 1);
      expect(arr[0]).assertEqual('\uD83C\uDF89');
      expect(arr[1]).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_6100
     * @tc.name testArrayCopywithinThree061
     * @tc.desc Verify string|null mixed array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string | null> = new Array<string | null>('a', null, 'b', null, 'c');
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual('b');
      expect(arr[1]).assertNull();
      expect(arr[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_6200
     * @tc.name testArrayCopywithinThree062
     * @tc.desc Verify escape char string array copyWithin (\b, \f, \\)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('\b', '\f', '\\', 'end');
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual('\\');
      expect(arr[1]).assertEqual('end');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_6300
     * @tc.name testArrayCopywithinThree063
     * @tc.desc Verify scientific notation string array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('123.45e6', '1e-10', '3.14E+5', 'end');
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual('3.14E+5');
      expect(arr[1]).assertEqual('end');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_6400
     * @tc.name testArrayCopywithinThree064
     * @tc.desc Verify bigint array elements copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>();
      arr.push(10n);
      arr.push(20n);
      arr.push(30n);
      arr.push(40n);
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(30n);
      expect(arr[1]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_6500
     * @tc.name testArrayCopywithinThree065
     * @tc.desc Verify double special value array copyWithin with NaN, POSITIVE_INFINITY and NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(5, (): double => 0);
      arr[0] = Double.NaN;
      arr[1] = Double.POSITIVE_INFINITY;
      arr[2] = Double.NEGATIVE_INFINITY;
      arr[3] = 1.0;
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(Double.NEGATIVE_INFINITY);
      expect(arr[1]).assertEqual(1.0);
      expect(arr[2]).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_6600
     * @tc.name testArrayCopywithinThree066
     * @tc.desc Verify template literal string array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tpl = 'hello ${name}';
      const arr = new Array<string>(tpl, 'world', 'end');
      arr.copyWithin(0, 1);
      expect(arr[0]).assertEqual('world');
      expect(arr[1]).assertEqual('end');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_6700
     * @tc.name testArrayCopywithinThree067
     * @tc.desc Verify long max/min array elements copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<long>(9223372036854775807, -9223372036854775808, 0);
      arr.copyWithin(1, 0);
      expect(arr[0]).assertEqual(9223372036854775807);
      expect(arr[1]).assertEqual(9223372036854775807);
      expect(arr[2]).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_6800
     * @tc.name testArrayCopywithinThree068
     * @tc.desc Verify short array elements copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<short>(100, 2048, 32760, -32768);
      arr.copyWithin(1, 2);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(32760);
      expect(arr[2]).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_6900
     * @tc.name testArrayCopywithinThree069
     * @tc.desc Verify char range array copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'a', c'8', c'中', c'\u4e2d');
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(c'中');
      expect(arr[1]).assertEqual(c'\u4e2d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_7000
     * @tc.name testArrayCopywithinThree070
     * @tc.desc Verify Set<int> array elements copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s1 = new Set<int>();
      s1.add(10);
      const s2 = new Set<int>();
      s2.add(20);
      const s3 = new Set<int>();
      s3.add(30);
      const arr = new Array<Set<int>>(s1, s2, s3);
      arr.copyWithin(1, 0);
      expect(arr[0].has(10)).assertTrue();
      expect(arr[1].has(10)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_7100
     * @tc.name testArrayCopywithinThree071
     * @tc.desc Verify RegExp array elements copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = new RegExp('ab+c');
      const r2 = new RegExp('^test$');
      const arr = new Array<RegExp>(r1, r2);
      arr.copyWithin(0, 1);
      expect(arr[0].test('test')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_7200
     * @tc.name testArrayCopywithinThree072
     * @tc.desc Verify copyWithin copies null elements correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | null> = new Array<int | null>(1, null, 3, null, 5);
      arr.copyWithin(0, 1);
      expect(arr[0]).assertNull();
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_7300
     * @tc.name testArrayCopywithinThree073
     * @tc.desc Verify copyWithin copies undefined elements correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | undefined> = new Array<int | undefined>(1, undefined, 3, undefined);
      arr.copyWithin(0, 1);
      expect(arr[0]).assertUndefined();
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_7400
     * @tc.name testArrayCopywithinThree074
     * @tc.desc Verify copyWithin shallow copies nested object with null child
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayCopywithinThree074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: NodeWithChild = { val: 1, child: null };
      const obj2: NodeWithChild = { val: 2, child: { val: 3, child: null } };
      const arr = new Array<NodeWithChild>(obj1, obj2);
      arr.copyWithin(0, 1);
      expect(arr[0].val).assertEqual(2);
      expect(arr[0].child != null).assertTrue();
      expect(arr[1].child != null).assertTrue();
    });

  });
}
