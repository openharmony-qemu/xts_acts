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
      expect(result != undefined).assertTrue();
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
