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

function returnIndex3(): int {
  return 3;
}

class ObjWithX {
  x: int = 0;
}

class NodeWithNext {
  val: int = 0;
  next: NodeWithNext | null = null;
}

export default function ArrayAt1Test2(): void {
  describe('ArrayAt1Test2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0010
     * @tc.name testArrayAt001
     * @tc.desc Verify bitwise AND index (5&3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6, 7, 8);
      const result = arr.at(5 & 3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0020
     * @tc.name testArrayAt002
     * @tc.desc Verify left shift index (1<<2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6, 7, 8);
      const result = arr.at(1 << 2);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0030
     * @tc.name testArrayAt003
     * @tc.desc Verify function return value as index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const result = arr.at(returnIndex3());
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0040
     * @tc.name testArrayAt004
     * @tc.desc Verify ternary expression index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40);
      const flag = true;
      const result = arr.at(flag ? 3 : 0);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0050
     * @tc.name testArrayAt005
     * @tc.desc Verify hex literal index (0xF)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);
      const result = arr.at(0xF);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0060
     * @tc.name testArrayAt006
     * @tc.desc Verify octal literal index (0o10-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50, 60, 70, 80);
      const result = arr.at(0o7);
      expect(result).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0070
     * @tc.name testArrayAt007
     * @tc.desc Verify binary literal index (0b101)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6, 7, 8);
      const result = arr.at(0b101);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0080
     * @tc.name testArrayAt008
     * @tc.desc Verify float index 2.0 converted via toInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const result = arr.at((2.0).toInt());
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0090
     * @tc.name testArrayAt009
     * @tc.desc Verify float index 1.9 truncated via toInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const result = arr.at((1.9).toInt());
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0100
     * @tc.name testArrayAt010
     * @tc.desc Verify float index 0.1 truncated via toInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const result = arr.at((0.1).toInt());
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0110
     * @tc.name testArrayAt011
     * @tc.desc Verify negative float index -1.0 via toInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const result = arr.at((-1.0).toInt());
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0120
     * @tc.name testArrayAt012
     * @tc.desc Verify negative float index -1.9 truncated via toInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const result = arr.at((-1.9).toInt());
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0130
     * @tc.name testArrayAt013
     * @tc.desc Verify tiny positive float index via toInt (near zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const result = arr.at((1e-10).toInt());
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0140
     * @tc.name testArrayAt014
     * @tc.desc Verify huge positive float index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      try {
        arr.at((1e10).toInt());
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0150
     * @tc.name testArrayAt015
     * @tc.desc Verify huge negative float index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      try {
        arr.at((-1e10).toInt());
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0160
     * @tc.name testArrayAt016
     * @tc.desc Verify Number.MAX_VALUE.toInt() index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      try {
        arr.at(Number.MAX_VALUE.toInt());
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0170
     * @tc.name testArrayAt017
     * @tc.desc Verify Number.MIN_VALUE.toInt() via toInt returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const result = arr.at(Number.MIN_VALUE.toInt());
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0180
     * @tc.name testArrayAt018
     * @tc.desc Verify POSITIVE_INFINITY index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      try {
        arr.at(Double.POSITIVE_INFINITY.toInt());
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0190
     * @tc.name testArrayAt019
     * @tc.desc Verify NEGATIVE_INFINITY index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      try {
        arr.at(Double.NEGATIVE_INFINITY.toInt());
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0200
     * @tc.name testArrayAt020
     * @tc.desc Verify NaN via toInt equals first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const result = arr.at(Double.NaN.toInt());
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0210
     * @tc.name testArrayAt021
     * @tc.desc Verify scientific notation index 1e1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110);
      const result = arr.at((1e1).toInt());
      expect(result).assertEqual(110);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0220
     * @tc.name testArrayAt022
     * @tc.desc Verify scientific notation negative index -1e0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const result = arr.at((-1e0).toInt());
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0230
     * @tc.name testArrayAt023
     * @tc.desc Verify byte type array at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<byte>(10, 20, 30);
      const result = arr.at(1);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0240
     * @tc.name testArrayAt024
     * @tc.desc Verify short type array negative at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<short>(100, 200, 300);
      const result = arr.at(-2);
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0250
     * @tc.name testArrayAt025
     * @tc.desc Verify char type array out-of-bounds at throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'a', c'b', c'c');
      try {
        arr.at(5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0260
     * @tc.name testArrayAt026
     * @tc.desc Verify bigint array elements accessed via at and summed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(100n, 200n, 300n);
      const v1 = arr.at(0);
      const v2 = arr.at(1);
      const sum = v1 + v2;
      expect(sum).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0270
     * @tc.name testArrayAt027
     * @tc.desc Verify long max value access via at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<long>(9223372036854775807, -9223372036854775808);
      const result = arr.at(0);
      expect(result).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0280
     * @tc.name testArrayAt028
     * @tc.desc Verify float scientific notation element via at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<float>(1.5e3f, 2.5e-3f, 3.0f);
      const result = arr.at(1);
      expect(result).assertEqual(2.5e-3f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0290
     * @tc.name testArrayAt029
     * @tc.desc Verify double minimum positive value via at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(5e-324, 1.0, 2.0);
      const result = arr.at(0);
      expect(result).assertEqual(5e-324);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0300
     * @tc.name testArrayAt030
     * @tc.desc Verify hex element value accessed via at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0xFF, 0x1A, 0x00);
      const result = arr.at(1);
      expect(result).assertEqual(26);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0310
     * @tc.name testArrayAt031
     * @tc.desc Verify octal element value accessed via at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0o77, 0o10, 0o0);
      const result = arr.at(0);
      expect(result).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0320
     * @tc.name testArrayAt032
     * @tc.desc Verify binary element value accessed via at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<byte>(0b1010, 0b1111);
      const result = arr.at(1);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0330
     * @tc.name testArrayAt033
     * @tc.desc Verify mixed int and float array at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | float> = new Array<int | float>(1, 2.5f, 3);
      const result = arr.at(1);
      expect(result).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0340
     * @tc.name testArrayAt034
     * @tc.desc Verify object union type array at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new ObjWithX();
      obj.x = 1;
      const arr: Array<ObjWithX | string> = new Array<ObjWithX | string>("hello", obj);
      const result = arr.at(1);
      expect(result).assertEqual(obj);
      if (result instanceof ObjWithX) {
        expect(result.x).assertEqual(1);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0350
     * @tc.name testArrayAt035
     * @tc.desc Verify at result toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const result = arr.at(0).toString();
      expect(result).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0360
     * @tc.name testArrayAt036
     * @tc.desc Verify at result used in filter condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, 10, 15, 20);
      const filtered = arr.filter((v: int): boolean => v > arr.at(1));
      expect(filtered.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0370
     * @tc.name testArrayAt037
     * @tc.desc Verify at result used in map computation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(2, 4, 6, 8);
      const mapped = arr.map((v: int): int => v + arr.at(0));
      expect(mapped[0]).assertEqual(4);
      expect(mapped[1]).assertEqual(6);
      expect(mapped[2]).assertEqual(8);
      expect(mapped[3]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0380
     * @tc.name testArrayAt038
     * @tc.desc Verify at result used as reduce initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const sum = arr.reduce((a: int, b: int): int => {
        return a + b;
      }, arr.at(0));
      expect(sum).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0390
     * @tc.name testArrayAt039
     * @tc.desc Verify at result used in find condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40);
      const hasMatch = arr.some((v: int): boolean => v > arr.at(-1));
      expect(hasMatch).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0400
     * @tc.name testArrayAt040
     * @tc.desc Verify at result used as slice parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const sliced = arr.slice(arr.at(0), arr.at(3));
      expect(sliced.length).assertEqual(3);
      expect(sliced[0]).assertEqual(2);
      expect(sliced[1]).assertEqual(3);
      expect(sliced[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0410
     * @tc.name testArrayAt041
     * @tc.desc Verify at result used in includes check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const result = arr.includes(arr.at(2));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0420
     * @tc.name testArrayAt042
     * @tc.desc Verify at result used in indexOf lookup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 2, 1);
      const result = arr.indexOf(arr.at(1));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0430
     * @tc.name testArrayAt043
     * @tc.desc Verify at result with every assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, 5, 5, 5);
      const result = arr.every((v: int): boolean => v === arr.at(0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0440
     * @tc.name testArrayAt044
     * @tc.desc Verify at result used in sort comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(3, 1, 4, 2);
      arr.sort((a: int, b: int): int => {
        return a - b;
      });
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(2);
      expect(arr.at(2)).assertEqual(3);
      expect(arr.at(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0450
     * @tc.name testArrayAt045
     * @tc.desc Verify if branch based on at result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20);
      let r = '';
      if (arr.at(0) < 15) {
        r = 'low';
      } else {
        r = 'high';
      }
      expect(r).assertEqual('low');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0460
     * @tc.name testArrayAt046
     * @tc.desc Verify switch-like condition based on at result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      let r = '';
      if (arr.at(1) === 'b') {
        r = 'ok';
      }
      expect(r).assertEqual('ok');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0470
     * @tc.name testArrayAt047
     * @tc.desc Verify short-circuit OR with at result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0, 1, 2);
      const r = arr.at(0) || arr.at(1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0480
     * @tc.name testArrayAt048
     * @tc.desc Verify short-circuit AND with at result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false);
      const r = arr.at(0) && arr.at(1);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0490
     * @tc.name testArrayAt049
     * @tc.desc Verify nested if conditions with at results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, 10);
      let r = '';
      if (arr.at(0) > 0) {
        if (arr.at(1) > 5) {
          r = 'both';
        } else {
          r = 'first';
        }
      } else {
        r = 'none';
      }
      expect(r).assertEqual('both');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0500
     * @tc.name testArrayAt050
     * @tc.desc Verify at result assigned to variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(42, 99);
      const g = arr.at(0);
      expect(g).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0510
     * @tc.name testArrayAt051
     * @tc.desc Verify at result used as loop upper bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(3, 10);
      let s = 0;
      for (let i = 0; i < arr.at(0); i++) {
        s += i;
      }
      expect(s).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0520
     * @tc.name testArrayAt052
     * @tc.desc Verify at result used as loop step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5, 6);
      let s = '';
      for (let i = 0; i < arr.length; i += arr.at(0)) {
        s += arr.at(i);
      }
      expect(s).assertEqual('123456');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0530
     * @tc.name testArrayAt053
     * @tc.desc Verify 2D array at chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<int>(1, 2, 3);
      const inner2 = new Array<int>(4, 5, 6);
      const inner3 = new Array<int>(7, 8, 9);
      const arr = new Array<Array<int>>(inner1, inner2, inner3);
      const row = arr.at(1);
      if (row != undefined) {
        expect(row.at(2)).assertEqual(6);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0540
     * @tc.name testArrayAt054
     * @tc.desc Verify 3D array at chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<Array<int>>(new Array<int>(1));
      const inner2 = new Array<Array<int>>(new Array<int>(2));
      const arr = new Array<Array<Array<int>>>(inner1, inner2);
      const first = arr.at(0);
      if (first != undefined) {
        const second = first.at(0);
        if (second != undefined) {
          expect(second.at(0)).assertEqual(1);
        }else {
          expect().assertFail();
        }
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0550
     * @tc.name testArrayAt055
     * @tc.desc Verify 2D array negative at chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<int>(1, 2);
      const inner2 = new Array<int>(3, 4);
      const inner3 = new Array<int>(5, 6);
      const arr = new Array<Array<int>>(inner1, inner2, inner3);
      const row = arr.at(-1);
      if (row != undefined) {
        expect(row.at(-1)).assertEqual(6);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0560
     * @tc.name testArrayAt056
     * @tc.desc Verify 2D array mixed positive and negative at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<int>(1, 2);
      const inner2 = new Array<int>(3, 4);
      const inner3 = new Array<int>(5, 6);
      const arr = new Array<Array<int>>(inner1, inner2, inner3);
      const row = arr.at(0);
      if (row != undefined) {
        expect(row.at(-1)).assertEqual(2);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0570
     * @tc.name testArrayAt057
     * @tc.desc Verify 2D at result operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<int>(1, 2, 3);
      const inner2 = new Array<int>(4, 5, 6);
      const arr = new Array<Array<int>>(inner1, inner2);
      const val1 = arr.at(0);
      const val2 = arr.at(1);
      if (val1 != undefined && val2 != undefined) {
        const sum = val1.at(1) + val2.at(0);
        expect(sum).assertEqual(6);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0580
     * @tc.name testArrayAt058
     * @tc.desc Verify 3D array mixed positive and negative at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<Array<int>>(new Array<int>(10, 20));
      const inner2 = new Array<Array<int>>(new Array<int>(30, 40));
      const arr = new Array<Array<Array<int>>>(inner1, inner2);
      const first = arr.at(1);
      if (first != undefined) {
        const second = first.at(0);
        if (second != undefined) {
          expect(second.at(-1)).assertEqual(40);
        }else {
          expect().assertFail();
        }
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0590
     * @tc.name testArrayAt059
     * @tc.desc Verify irregular nested array at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<int>(1, 2);
      const inner2 = new Array<int>(3, 4, 5, 6);
      const arr = new Array<Array<int>>(inner1, inner2);
      const row = arr.at(1);
      if (row != undefined) {
        expect(row.at(3)).assertEqual(6);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0600
     * @tc.name testArrayAt060
     * @tc.desc Verify empty subarray at throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<int>();
      const inner2 = new Array<int>(1, 2);
      const arr = new Array<Array<int>>(inner1, inner2);
      const row = arr.at(0);
      if (row != undefined) {
        try {
          row.at(0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0610
     * @tc.name testArrayAt061
     * @tc.desc Verify push then at new element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.push(3);
      const result = arr.at(2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0620
     * @tc.name testArrayAt062
     * @tc.desc Verify pop then at reflects change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.pop();
      const result = arr.at(1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0630
     * @tc.name testArrayAt063
     * @tc.desc Verify unshift then at first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.unshift(0);
      const result = arr.at(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0640
     * @tc.name testArrayAt064
     * @tc.desc Verify shift then at first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.shift();
      const result = arr.at(0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0650
     * @tc.name testArrayAt065
     * @tc.desc Verify splice delete then at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40);
      arr.splice(1, 2);
      const result = arr.at(1);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0660
     * @tc.name testArrayAt066
     * @tc.desc Verify splice insert then at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.splice(1, 0, 99);
      const result = arr.at(1);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0670
     * @tc.name testArrayAt067
     * @tc.desc Verify sort then at first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(3, 1, 4, 2);
      arr.sort();
      const result = arr.at(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0680
     * @tc.name testArrayAt068
     * @tc.desc Verify reverse then at first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      arr.reverse();
      const result = arr.at(0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0690
     * @tc.name testArrayAt069
     * @tc.desc Verify fill then at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      arr.fill(99, 1, 3);
      const result = arr.at(2);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0700
     * @tc.name testArrayAt070
     * @tc.desc Verify copyWithin then at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      arr.copyWithin(0, 2);
      const result = arr.at(1);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0710
     * @tc.name testArrayAt071
     * @tc.desc Verify 5000-element array at middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(5000, 42);
      const result = arr.at(2499);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0720
     * @tc.name testArrayAt072
     * @tc.desc Verify 10000-element array at last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(10000, 7);
      const result = arr.at(9999);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0730
     * @tc.name testArrayAt073
     * @tc.desc Verify large array random index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1000, 5);
      const v1 = arr.at(0);
      const v2 = arr.at(500);
      const v3 = arr.at(999);
      const sum = v1 + v2 + v3;
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0740
     * @tc.name testArrayAt074
     * @tc.desc Verify large array negative at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(10000, 3);
      const result = arr.at(-5000);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0750
     * @tc.name testArrayAt075
     * @tc.desc Verify large array at result conditional filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1000, 1);
      arr.fill(0, 500, 1000);
      const filtered = arr.filter((v: int): boolean => v === arr.at(0));
      expect(filtered.length).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0760
     * @tc.name testArrayAt076
     * @tc.desc Verify forEach with nested at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      let r = 0;
      arr.forEach((v: int, i: int): void => {
        if (i > 0) {
          r += arr.at(i - 1);
        }
      });
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0770
     * @tc.name testArrayAt077
     * @tc.desc Verify map with at computation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      const mapped: Array<int> = arr.map((v: int, i: int): int => {
        const prevIdx = Math.max(0, i - 1).toInt();
        return v - arr.at(prevIdx);
      });
      expect(mapped.at(0)).assertEqual(0);
      expect(mapped.at(1)).assertEqual(1);
      expect(mapped.at(2)).assertEqual(1);
      expect(mapped.at(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0780
     * @tc.name testArrayAt078
     * @tc.desc Verify reduce with at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const sum = arr.reduce((acc: int, v: int, i: int): int => {
        return acc + (i > 0 ? arr.at(i - 1) : 0);
      }, 0);
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0790
     * @tc.name testArrayAt079
     * @tc.desc Verify some with at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      const result = arr.some((v: int, i: int): boolean => arr.at(i) !== v);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0800
     * @tc.name testArrayAt080
     * @tc.desc Verify while loop iteration with at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(2, 4, 6, 8);
      let i = 0;
      let r = 0;
      while (i < arr.length) {
        r += arr.at(i);
        i++;
      }
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0810
     * @tc.name testArrayAt081
     * @tc.desc Verify for-of iteration then at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      let last = 0;
      for (let v of arr) {
        last = v;
      }
      const v1 = arr.at(0);
      const v2 = last;
      const sum = v1 + v2;
      expect(sum).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0820
     * @tc.name testArrayAt082
     * @tc.desc Verify that constructing an array with length exceeding the maximum value of int type throws NegativeArraySizeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Array.create<int>(Number.MAX_SAFE_INTEGER.toInt() + 1, 1);
        expect().assertFail();
      }catch(e) {
        expect(e.name).assertEqual('NegativeArraySizeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0830
     * @tc.name testArrayAt083
     * @tc.desc Verify alternating positive and negative at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const v1 = arr.at(0);
      const v2 = arr.at(-1);
      const v3 = arr.at(2);
      const v4 = arr.at(-3);
      const sum = v1 + v2 + v3 + v4;
      expect(sum).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0840
     * @tc.name testArrayAt084
     * @tc.desc Verify primitive type isolation when modifying at result copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      let v = arr.at(0);
      v = 99;
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0850
     * @tc.name testArrayAt085
     * @tc.desc Verify string array at comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('hello', 'world');
      const result = arr.at(0) === 'hello';
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0860
     * @tc.name testArrayAt086
     * @tc.desc Verify boolean array at negation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false);
      const result = !arr.at(0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0870
     * @tc.name testArrayAt087
     * @tc.desc Verify char array at equality comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'a', c'b', c'c');
      const result = arr.at(0) === c'a';
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0880
     * @tc.name testArrayAt088
     * @tc.desc Verify large array at result batch accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(100, 2);
      let s = 0;
      for (let i = 0; i < 100; i++) {
        s += arr.at(i);
      }
      expect(s).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0890
     * @tc.name testArrayAt089
     * @tc.desc Verify union type string|int array at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | int>('abc', 42);
      const first = arr.at(0);
      const second = arr.at(1);
      expect(first).assertEqual('abc');
      expect(second).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0900
     * @tc.name testArrayAt090
     * @tc.desc Verify nullable int|undefined array at access returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(1, undefined, 3);
      const result = arr.at(1);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0910
     * @tc.name testArrayAt091
     * @tc.desc Verify nullable int|null array at access returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | null>(null, 2, 3);
      const result = arr.at(0);
      expect(result).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0920
     * @tc.name testArrayAt092
     * @tc.desc Verify large array positive out-of-bounds at throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1000, 1);
      try {
        arr.at(1000);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0930
     * @tc.name testArrayAt093
     * @tc.desc Verify large array negative out-of-bounds at throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1000, 1);
      try {
        arr.at(-1001);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0940
     * @tc.name testArrayAt094
     * @tc.desc Verify index equal to negative array length minus one throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      try {
        arr.at(-(arr.length + 1));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0950
     * @tc.name testArrayAt095
     * @tc.desc Verify reference type array at modification propagates to original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<ObjWithX>();
      const obj = new ObjWithX();
      obj.x = 1;
      arr.pushOne(obj);
      const first = arr.at(0);
      if (first != undefined) {
        first.x = 99;
      }
      const updated = arr.at(0);
      if (updated != undefined) {
        expect(updated.x).assertEqual(99);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0960
     * @tc.name testArrayAt096
     * @tc.desc Verify byte array at() returns correct element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<byte>(0, 12, 99);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(12);
      expect(arr.at(2)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0970
     * @tc.name testArrayAt097
     * @tc.desc Verify byte array at() with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<byte>(-128, 127);
      expect(arr.at(0)).assertEqual(-128);
      expect(arr.at(1)).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0980
     * @tc.name testArrayAt098
     * @tc.desc Verify short array at() returns correct element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<short>(100, 2048, 32760);
      expect(arr.at(0)).assertEqual(100);
      expect(arr.at(1)).assertEqual(2048);
      expect(arr.at(2)).assertEqual(32760);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0990
     * @tc.name testArrayAt099
     * @tc.desc Verify short array at() with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<short>(-32768, 32767);
      expect(arr.at(0)).assertEqual(-32768);
      expect(arr.at(1)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1000
     * @tc.name testArrayAt100
     * @tc.desc Verify long array at() returns correct element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<long>(100, 9223372036854775806);
      expect(arr.at(0)).assertEqual(100);
      expect(arr.at(1)).assertEqual(9223372036854775806);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1010
     * @tc.name testArrayAt101
     * @tc.desc Verify long array at() with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<long>(-9223372036854775808, 9223372036854775807);
      expect(arr.at(0)).assertEqual(-9223372036854775808);
      expect(arr.at(1)).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1020
     * @tc.name testArrayAt102
     * @tc.desc Verify float array at() returns correct element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<float>(0.0f, 3.14f, -99.99f);
      expect(arr.at(0)).assertEqual(0.0);
      expect(arr.at(1)).assertEqual(3.14f);
      expect(arr.at(2)).assertEqual(-99.99f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1030
     * @tc.name testArrayAt103
     * @tc.desc Verify float array at() with special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<float>(Float.NaN, Float.POSITIVE_INFINITY);
      expect(isNaN(Float.toDouble(arr.at(0)))).assertTrue();
      expect(arr.at(1)).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1040
     * @tc.name testArrayAt104
     * @tc.desc Verify double array at() returns correct element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(0.0, 123.456, -888.88);
      expect(arr.at(0)).assertEqual(0.0);
      expect(arr.at(1)).assertEqual(123.456);
      expect(arr.at(2)).assertEqual(-888.88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1050
     * @tc.name testArrayAt105
     * @tc.desc Verify double array at() with special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(Double.NaN, Double.POSITIVE_INFINITY);
      expect(isNaN(arr.at(0))).assertTrue();
      expect(arr.at(1)).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1060
     * @tc.name testArrayAt106
     * @tc.desc Verify string array at() returns correct element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', '8', '中');
      expect(arr.at(0)).assertEqual('a');
      expect(arr.at(1)).assertEqual('8');
      expect(arr.at(2)).assertEqual('中');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1070
     * @tc.name testArrayAt107
     * @tc.desc Verify string array at() with Unicode and boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('\u4e2d', '\u0000', '\uffff');
      expect(arr.at(0)).assertEqual('中');
      expect(arr.at(1)).assertEqual('\u0000');
      expect(arr.at(2)).assertEqual('\uffff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1080
     * @tc.name testArrayAt108
     * @tc.desc Verify boolean array at() returns correct element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false);
      expect(arr.at(0)).assertTrue();
      expect(arr.at(1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1090
     * @tc.name testArrayAt109
     * @tc.desc Verify string array at() with normal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('test', '测试工程师', '123456', 'Test123 测试');
      expect(arr.at(0)).assertEqual('test');
      expect(arr.at(1)).assertEqual('测试工程师');
      expect(arr.at(2)).assertEqual('123456');
      expect(arr.at(3)).assertEqual('Test123 测试');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1100
     * @tc.name testArrayAt110
     * @tc.desc Verify string array at() with Unicode escape sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('\u0061', '\u6d4b\u8bd5', '\uD83D\uDE00', '\u0000', '\uFFFE');
      expect(arr.at(0)).assertEqual('a');
      expect(arr.at(1)).assertEqual('测试');
      expect(arr.at(3)).assertEqual('\u0000');
      expect(arr.at(4)).assertEqual('\uFFFE');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1110
     * @tc.name testArrayAt111
     * @tc.desc Verify string array at() with empty and whitespace values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', ' ', '\t', '\n', '\r', '\u200B');
      expect(arr.at(0)).assertEqual('');
      expect(arr.at(1)).assertEqual(' ');
      expect(arr.at(2)).assertEqual('\t');
      expect(arr.at(3)).assertEqual('\n');
      expect(arr.at(4)).assertEqual('\r');
      expect(arr.at(5)).assertEqual('\u200B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1120
     * @tc.name testArrayAt112
     * @tc.desc Verify string array at() with special characters and XSS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('!@#$%^&*()', '<script>alert(1)</script>', '0x123', '0o123', '0b1010');
      expect(arr.at(0)).assertEqual('!@#$%^&*()');
      expect(arr.at(1)).assertEqual('<script>alert(1)</script>');
      expect(arr.at(2)).assertEqual('0x123');
      expect(arr.at(3)).assertEqual('0o123');
      expect(arr.at(4)).assertEqual('0b1010');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1130
     * @tc.name testArrayAt113
     * @tc.desc Verify string array at() with business format values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('13800138000', 'test@example.com', '2026-03-05', 'a', '\uFFFD', '\udc04');
      expect(arr.at(0)).assertEqual('13800138000');
      expect(arr.at(1)).assertEqual('test@example.com');
      expect(arr.at(2)).assertEqual('2026-03-05');
      expect(arr.at(3)).assertEqual('a');
      expect(arr.at(4)).assertEqual('\uFFFD');
      expect(arr.at(5)).assertEqual('\udc04');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1140
     * @tc.name testArrayAt114
     * @tc.desc Verify string array at() with emoji and multi-language
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('\uD83D\uDE00测试', '\uD83D\uDD25\uD83D\uDD25', 'テスト', '테스트', 'АБВГД');
      expect(arr.at(2)).assertEqual('テスト');
      expect(arr.at(3)).assertEqual('테스트');
      expect(arr.at(4)).assertEqual('АБВГД');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1150
     * @tc.name testArrayAt115
     * @tc.desc Verify int array at() with hex, octal, binary literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0x1234, 0o123, 0b1010);
      expect(arr.at(0)).assertEqual(4660);
      expect(arr.at(1)).assertEqual(83);
      expect(arr.at(2)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1160
     * @tc.name testArrayAt116
     * @tc.desc Verify int array at() with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(-2147483648, 2147483647, 10000);
      expect(arr.at(0)).assertEqual(-2147483648);
      expect(arr.at(1)).assertEqual(2147483647);
      expect(arr.at(2)).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1170
     * @tc.name testArrayAt117
     * @tc.desc Verify array at() with int array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Array<int>(1, 2, 3);
      const a2 = new Array<int>(4, 5);
      const arr = new Array<Array<int>>(a1, a2);
      const inner = arr.at(0);
      if (inner != undefined) {
        expect(inner.length).assertEqual(3);
        expect(inner.at(0)).assertEqual(1);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1180
     * @tc.name testArrayAt118
     * @tc.desc Verify array at() with String array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1 = new Array<string>('a', 'b')
      let a2 = new Array<string>('', ' ')
      const arr = new Array<Array<string>>(a1,a2);
      const inner = arr.at(0);
      if (inner != undefined) {
        expect(inner.length).assertEqual(2);
        expect(inner.at(0)).assertEqual('a');
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1190
     * @tc.name testArrayAt119
     * @tc.desc Verify array at() with nested 2D array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Array<int>(1, 2);
      const a2 = new Array<int>(3, 4);
      const inner1 = new Array<Array<int>>(a1, a2);
      const arr = new Array<Array<Array<int>>>(inner1);
      const inner = arr.at(0);
      if (inner != undefined) {
        expect(inner.length).assertEqual(2);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1200
     * @tc.name testArrayAt120
     * @tc.desc Verify byte array at() with hex literal 0x0A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<byte>(0x0A, 12, 99);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(12);
      expect(arr.at(2)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1210
     * @tc.name testArrayAt121
     * @tc.desc Verify byte array at() with octal literal 0o14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<byte>(0o14, 0, 99);
      expect(arr.at(0)).assertEqual(12);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1220
     * @tc.name testArrayAt122
     * @tc.desc Verify short array at() with hex literal 0x7FF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<short>(0x7FF, 100);
      expect(arr.at(0)).assertEqual(2047);
      expect(arr.at(1)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1230
     * @tc.name testArrayAt123
     * @tc.desc Verify long array at() with hex literal 0x1234
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<long>(0x1234, 100);
      expect(arr.at(0)).assertEqual(4660);
      expect(arr.at(1)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1240
     * @tc.name testArrayAt124
     * @tc.desc Verify array at() with empty int array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Array<int>();
      const a2 = new Array<int>(1, 2);
      const arr = new Array<Array<int>>(a1, a2);
      const inner = arr.at(0);
      if (inner != undefined) {
        expect(inner.length).assertEqual(0);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1250
     * @tc.name testArrayAt125
     * @tc.desc Verify union type array at() with mixed types (int, string, boolean)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | string | boolean> = new Array<int | string | boolean>(1, 'test', true);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual('test');
      expect(arr.at(2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1260
     * @tc.name testArrayAt126
     * @tc.desc Verify array at() with Date element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Date(2026, 0, 1);
      const arr = new Array<Date>(d, new Date());
      const val = arr.at(0);
      if (val != undefined) {
        expect(val.getFullYear()).assertEqual(2026);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1270
     * @tc.name testArrayAt127
     * @tc.desc Verify at() with Map element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>(new Array<[string, int]>(['k', 1]));
      const arr = new Array<Map<string, int>>(m);
      const result = arr.at(0);
      if (result != undefined) {
        expect(result.get('k')).assertEqual(1);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1280
     * @tc.name testArrayAt128
     * @tc.desc Verify at() with Set element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<int>(new Array<int>(1, 2, 3));
      const arr = new Array<Set<int>>(s);
      const result = arr.at(0);
      if (result != undefined) {
        expect(result.has(2)).assertTrue();
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1290
     * @tc.name testArrayAt129
     * @tc.desc Verify at() with positive float index directly (no toInt), should truncate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40);
      const result = arr.at(Double.toInt(1.9).toInt());
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1300
     * @tc.name testArrayAt130
     * @tc.desc Verify at() with negative float index directly (no toInt), should truncate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40);
      const result = arr.at(Double.toInt(-1.3));
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1310
     * @tc.name testArrayAt131
     * @tc.desc Verify at() with Double.NaN.toInt() directly (no toInt), should return first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const result = arr.at(Double.toInt(Double.NaN.toInt()));
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1320
     * @tc.name testArrayAt132
     * @tc.desc Verify at() with Number.MAX_VALUE.toInt() directly (no toInt), should throw RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      try {
        arr.at(Double.toInt(Number.MAX_VALUE.toInt()));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1330
     * @tc.name testArrayAt133
     * @tc.desc Verify at() with Double.POSITIVE_INFINITY.toInt() directly (no toInt), should throw RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      try {
        arr.at(Double.toInt(Double.POSITIVE_INFINITY.toInt()));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1340
     * @tc.name testArrayAt134
     * @tc.desc Verify at result has nested null property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const node = new NodeWithNext();
      node.val = 1;
      node.next = null;
      const arr = new Array<NodeWithNext>(node);
      const result = arr.at(0);
      if (result != undefined) {
        expect(result.next).assertNull();
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1350
     * @tc.name testArrayAt135
     * @tc.desc Verify at returns null for Array<Array<int> | null> element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<int>(1, 2);
      const arr: Array<Array<int> | null> = new Array<Array<int> | null>(inner1, null, inner1);
      const result = arr.at(1);
      expect(result).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1360
     * @tc.name testArrayAt136
     * @tc.desc Verify at chain with Array<Array<int | undefined>> where inner has undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayAt136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<int | undefined>(undefined, 2);
      const inner2 = new Array<int | undefined>(3, 4);
      const arr = new Array<Array<int | undefined>>(inner1, inner2);
      const row = arr.at(0);
      if (row != undefined) {
        const val = row.at(0);
        expect(val).assertUndefined();
      }else {
        expect().assertFail();
      }
    });

});
}