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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from "../Util.test";

class ConstantNumberBox {
  value: number;

  constructor(value: number) {
    this.value = value;
  }
}

interface ValObj { val: number }
interface StrNumObj { value: number }

export default function GlobalConstantPart_1Test(): void {
  describe("GlobalConstantPart_1Test", (): void => {
    beforeAll(() => {});

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {

    });

    afterAll(() => {

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0010
     * @tc.name testGlobalConstantTest001
     * @tc.desc evaluate Float.NaN === Float.NaN returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eq: boolean = Float.NaN === Float.NaN;
      expect(eq).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0020
     * @tc.name testGlobalConstantTest002
     * @tc.desc evaluate Float.POSITIVE_INFINITY === Float.POSITIVE_INFINITY returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eq: boolean = Float.POSITIVE_INFINITY === Float.POSITIVE_INFINITY;
      expect(eq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0030
     * @tc.name testGlobalConstantTest003
     * @tc.desc evaluate -Float.POSITIVE_INFINITY === -Float.POSITIVE_INFINITY returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eq: boolean = -Float.POSITIVE_INFINITY === -Float.POSITIVE_INFINITY;
      expect(eq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0040
     * @tc.name testGlobalConstantTest004
     * @tc.desc evaluate Float.POSITIVE_INFINITY !== -Float.POSITIVE_INFINITY returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const neq: boolean = Float.POSITIVE_INFINITY !== -Float.POSITIVE_INFINITY;
      expect(neq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0050
     * @tc.name testGlobalConstantTest005
     * @tc.desc indexOf(Float.NaN) in [Float.NaN] returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [Float.NaN];
      const idx: number = arr.indexOf(Float.NaN);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0060
     * @tc.name testGlobalConstantTest006
     * @tc.desc evaluate Float.POSITIVE_INFINITY + 1 returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.POSITIVE_INFINITY + 1;
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0070
     * @tc.name testGlobalConstantTest007
     * @tc.desc evaluate Float.POSITIVE_INFINITY - 1 returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.POSITIVE_INFINITY - 1;
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0080
     * @tc.name testGlobalConstantTest008
     * @tc.desc evaluate !Float.POSITIVE_INFINITY returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: boolean = !Float.POSITIVE_INFINITY;
      expect(val).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0090
     * @tc.name testGlobalConstantTest009
     * @tc.desc evaluate Float.NaN < 0 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.NaN < 0;
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0100
     * @tc.name testGlobalConstantTest010
     * @tc.desc evaluate Float.NaN returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const x: number = Float.NaN;
      expect(x).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0110
     * @tc.name testGlobalConstantTest011
     * @tc.desc evaluate [Float.NaN] returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [Float.NaN];
      expect(arr[0]).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0120
     * @tc.name testGlobalConstantTest012
     * @tc.desc evaluate 0.0 / 0.0 returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = 0.0 / 0.0;
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0130
     * @tc.name testGlobalConstantTest013
     * @tc.desc Float.NaN + 1 returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.NaN + 1;
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0140
     * @tc.name testGlobalConstantTest014
     * @tc.desc Float.NaN - 100 returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.NaN - 100;
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0150
     * @tc.name testGlobalConstantTest015
     * @tc.desc Float.NaN * 2 returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.NaN * 2;
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0160
     * @tc.name testGlobalConstantTest016
     * @tc.desc Float.NaN / 2 returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.NaN / 2;
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0170
     * @tc.name testGlobalConstantTest017
     * @tc.desc Float.NaN % 3 returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.NaN % 3;
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0180
     * @tc.name testGlobalConstantTest018
     * @tc.desc Float.NaN | 0 returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.NaN | 0;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0190
     * @tc.name testGlobalConstantTest019
     * @tc.desc Float.NaN & 0 returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.NaN & 0;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0200
     * @tc.name testGlobalConstantTest020
     * @tc.desc Float.NaN ^ 0 returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.NaN ^ 0;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0210
     * @tc.name testGlobalConstantTest021
     * @tc.desc Boolean(Float.NaN) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Boolean(Float.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0220
     * @tc.name testGlobalConstantTest022
     * @tc.desc Float.NaN.toString() returns "NaN"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.NaN.toString();
      expect(result).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0230
     * @tc.name testGlobalConstantTest023
     * @tc.desc String(Float.NaN) returns "NaN"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = String(Float.NaN);
      expect(result).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0240
     * @tc.name testGlobalConstantTest024
     * @tc.desc Float.NaN != Float.NaN returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.NaN != Float.NaN;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0250
     * @tc.name testGlobalConstantTest025
     * @tc.desc Float.NaN > 1 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.NaN > 1;
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0260
     * @tc.name testGlobalConstantTest026
     * @tc.desc Float.NaN >= 0 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.NaN >= 0;
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0270
     * @tc.name testGlobalConstantTest027
     * @tc.desc Float.NaN <= 0 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.NaN <= 0;
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0280
     * @tc.name testGlobalConstantTest028
     * @tc.desc Float.POSITIVE_INFINITY + Float.POSITIVE_INFINITY returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.POSITIVE_INFINITY + Float.POSITIVE_INFINITY;
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0290
     * @tc.name testGlobalConstantTest029
     * @tc.desc Float.POSITIVE_INFINITY - Float.POSITIVE_INFINITY returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.POSITIVE_INFINITY - Float.POSITIVE_INFINITY;
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0300
     * @tc.name testGlobalConstantTest030
     * @tc.desc Float.POSITIVE_INFINITY * 5 returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.POSITIVE_INFINITY * 5;
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0310
     * @tc.name testGlobalConstantTest031
     * @tc.desc Float.POSITIVE_INFINITY * -5 returns -Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.POSITIVE_INFINITY * -5;
      expect(result).assertEqual(-Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0320
     * @tc.name testGlobalConstantTest032
     * @tc.desc Float.POSITIVE_INFINITY * 0 returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.POSITIVE_INFINITY * 0;
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0330
     * @tc.name testGlobalConstantTest033
     * @tc.desc Float.POSITIVE_INFINITY / Float.POSITIVE_INFINITY returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.POSITIVE_INFINITY / Float.POSITIVE_INFINITY;
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0340
     * @tc.name testGlobalConstantTest034
     * @tc.desc Float.POSITIVE_INFINITY / 10 returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.POSITIVE_INFINITY / 10;
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0350
     * @tc.name testGlobalConstantTest035
     * @tc.desc Float.POSITIVE_INFINITY / -10 returns -Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.POSITIVE_INFINITY / -10;
      expect(result).assertEqual(-Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0360
     * @tc.name testGlobalConstantTest036
     * @tc.desc 100 / Float.POSITIVE_INFINITY returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = 100 / Float.POSITIVE_INFINITY;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0370
     * @tc.name testGlobalConstantTest037
     * @tc.desc Float.POSITIVE_INFINITY % 5 returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.POSITIVE_INFINITY % 5;
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0380
     * @tc.name testGlobalConstantTest038
     * @tc.desc 10 % Float.POSITIVE_INFINITY returns 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = 10 % Float.POSITIVE_INFINITY;
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0390
     * @tc.name testGlobalConstantTest039
     * @tc.desc Float.POSITIVE_INFINITY > Number.MAX_SAFE_INTEGER returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.POSITIVE_INFINITY > Number.MAX_SAFE_INTEGER;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0400
     * @tc.name testGlobalConstantTest040
     * @tc.desc Float.POSITIVE_INFINITY > -Float.POSITIVE_INFINITY returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.POSITIVE_INFINITY > -Float.POSITIVE_INFINITY;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0410
     * @tc.name testGlobalConstantTest041
     * @tc.desc Boolean(Float.POSITIVE_INFINITY) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Boolean(Float.POSITIVE_INFINITY);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0420
     * @tc.name testGlobalConstantTest042
     * @tc.desc Float.POSITIVE_INFINITY.toString() returns "Infinity"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.POSITIVE_INFINITY.toString();
      expect(result).assertEqual("Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0430
     * @tc.name testGlobalConstantTest043
     * @tc.desc String(Float.POSITIVE_INFINITY) returns "Infinity"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = String(Float.POSITIVE_INFINITY);
      expect(result).assertEqual("Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0440
     * @tc.name testGlobalConstantTest044
     * @tc.desc Float.POSITIVE_INFINITY in array element equals Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, Float.POSITIVE_INFINITY, 3];
      expect(arr[1]).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0450
     * @tc.name testGlobalConstantTest045
     * @tc.desc Float.POSITIVE_INFINITY - (-Float.POSITIVE_INFINITY) returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.POSITIVE_INFINITY - -Float.POSITIVE_INFINITY;
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0460
     * @tc.name testGlobalConstantTest046
     * @tc.desc -Float.POSITIVE_INFINITY < 0 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = -Float.POSITIVE_INFINITY < 0;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0470
     * @tc.name testGlobalConstantTest047
     * @tc.desc -Float.POSITIVE_INFINITY + 100 returns -Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = -Float.POSITIVE_INFINITY + 100;
      expect(result).assertEqual(-Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0480
     * @tc.name testGlobalConstantTest048
     * @tc.desc -Float.POSITIVE_INFINITY - (-Float.POSITIVE_INFINITY) returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = -Float.POSITIVE_INFINITY - -Float.POSITIVE_INFINITY;
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0490
     * @tc.name testGlobalConstantTest049
     * @tc.desc -Float.POSITIVE_INFINITY * 5 returns -Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = -Float.POSITIVE_INFINITY * 5;
      expect(result).assertEqual(-Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0500
     * @tc.name testGlobalConstantTest050
     * @tc.desc -Float.POSITIVE_INFINITY * -5 returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = -Float.POSITIVE_INFINITY * -5;
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0510
     * @tc.name testGlobalConstantTest051
     * @tc.desc -Float.POSITIVE_INFINITY.toString() returns "-Infinity"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = (-Float.POSITIVE_INFINITY).toString();
      expect(result).assertEqual("-Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0520
     * @tc.name testGlobalConstantTest052
     * @tc.desc String(-Float.POSITIVE_INFINITY) returns "-Infinity"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = String(-Float.POSITIVE_INFINITY);
      expect(result).assertEqual("-Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0530
     * @tc.name testGlobalConstantTest053
     * @tc.desc 1.0 / 0.0 returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = 1.0 / 0.0;
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0540
     * @tc.name testGlobalConstantTest054
     * @tc.desc -1.0 / 0.0 returns -Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = -1.0 / 0.0;
      expect(result).assertEqual(-Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0550
     * @tc.name testGlobalConstantTest055
     * @tc.desc 1e308 * 10 overflows to Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = 1e308 * 10;
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0560
     * @tc.name testGlobalConstantTest056
     * @tc.desc -1e308 * 10 overflows to -Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = -1e308 * 10;
      expect(result).assertEqual(-Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0570
     * @tc.name testGlobalConstantTest057
     * @tc.desc Float.NaN + Float.POSITIVE_INFINITY returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.NaN + Float.POSITIVE_INFINITY;
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0580
     * @tc.name testGlobalConstantTest058
     * @tc.desc Float.NaN * Float.POSITIVE_INFINITY returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.NaN * Float.POSITIVE_INFINITY;
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0590
     * @tc.name testGlobalConstantTest059
     * @tc.desc Float.NaN == Float.POSITIVE_INFINITY returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.NaN == Float.POSITIVE_INFINITY;
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0600
     * @tc.name testGlobalConstantTest060
     * @tc.desc Float.NaN < Float.POSITIVE_INFINITY returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.NaN < Float.POSITIVE_INFINITY;
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0610
     * @tc.name testGlobalConstantTest061
     * @tc.desc Float.NaN > Float.POSITIVE_INFINITY returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.NaN > Float.POSITIVE_INFINITY;
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0620
     * @tc.name testGlobalConstantTest062
     * @tc.desc Float.NaN < -Float.POSITIVE_INFINITY returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.NaN < -Float.POSITIVE_INFINITY;
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0630
     * @tc.name testGlobalConstantTest063
     * @tc.desc Float.NaN stored in object property value is Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: ConstantNumberBox = new ConstantNumberBox(Float.NaN);
      const val: number = obj.value;
      const r: boolean = isNaN(val);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0640
     * @tc.name testGlobalConstantTest064
     * @tc.desc Float.POSITIVE_INFINITY > Number.MAX_VALUE returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.POSITIVE_INFINITY > Number.MAX_VALUE;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0650
     * @tc.name testGlobalConstantTest065
     * @tc.desc -100 / Float.POSITIVE_INFINITY produces negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = -100 / Float.POSITIVE_INFINITY;
      expect(1 / result).assertEqual(-Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0660
     * @tc.name testGlobalConstantTest066
     * @tc.desc Float.POSITIVE_INFINITY / 0 returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.POSITIVE_INFINITY / 0;
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0670
     * @tc.name testGlobalConstantTest067
     * @tc.desc -Float.POSITIVE_INFINITY < -Number.MAX_VALUE returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = -Float.POSITIVE_INFINITY < -Number.MAX_VALUE;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0680
     * @tc.name testGlobalConstantTest068
     * @tc.desc -Float.POSITIVE_INFINITY - 42 returns -Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = -Float.POSITIVE_INFINITY - 42;
      expect(result).assertEqual(-Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0690
     * @tc.name testGlobalConstantTest069
     * @tc.desc Verify Float.NaN is not strictly equal to itself (Float.NaN !== Float.NaN)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.NaN !== Float.NaN;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0700
     * @tc.name testGlobalConstantTest070
     * @tc.desc custom Object.is-style comparison treats Float.NaN equal to itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const objectIs = (x: number, y: number): boolean => {
        if (x === y) {
          return x !== 0 || 1 / x === 1 / y;
        }
        return isNaN(x) && isNaN(y);
      }
      const result: boolean = objectIs(Float.NaN, Float.NaN);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0710
     * @tc.name testGlobalConstantTest071
     * @tc.desc Verify typeof Float.NaN does not return number
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = typeof Float.NaN === "number";
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0720
     * @tc.name testGlobalConstantTest072
     * @tc.desc Verify passing Float.NaN as a function argument works
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const checkNaN = (val: number): boolean => {
        return isNaN(val);
      }
      const result: boolean = checkNaN(Float.NaN);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0730
     * @tc.name testGlobalConstantTest073
     * @tc.desc Verify Float.NaN as an object property value is preserved
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: StrNumObj = { value: Float.toDouble(Float.NaN) };
      expect(obj.value).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0740
     * @tc.name testGlobalConstantTest074
     * @tc.desc Verify Float.POSITIVE_INFINITY is greater than any finite positive number
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.POSITIVE_INFINITY > 1e308;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0750
     * @tc.name testGlobalConstantTest075
     * @tc.desc Verify Float.POSITIVE_INFINITY is greater than any finite negative number
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.POSITIVE_INFINITY > -1e308;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0760
     * @tc.name testGlobalConstantTest076
     * @tc.desc !!Float.POSITIVE_INFINITY returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = !!Float.POSITIVE_INFINITY;
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0770
     * @tc.name testGlobalConstantTest077
     * @tc.desc Verify typeof Float.POSITIVE_INFINITY does not return number
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = typeof Float.POSITIVE_INFINITY === "number";
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0780
     * @tc.name testGlobalConstantTest078
     * @tc.desc Verify Float.POSITIVE_INFINITY > 0 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = Float.POSITIVE_INFINITY > 0;
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0790
     * @tc.name testGlobalConstantTest079
     * @tc.desc Verify Math.max(Float.POSITIVE_INFINITY, 100) returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.max(Float.POSITIVE_INFINITY, 100);
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0800
     * @tc.name testGlobalConstantTest080
     * @tc.desc Verify Math.min(Float.POSITIVE_INFINITY, 100) returns 100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Math.min(Float.POSITIVE_INFINITY, 100);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0810
     * @tc.name testGlobalConstantTest081
     * @tc.desc Verify assigning Float.POSITIVE_INFINITY to a variable works
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = Float.POSITIVE_INFINITY;
      expect(value).assertPosUnlimited();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0820
     * @tc.name testGlobalConstantTest082
     * @tc.desc Verify passing Float.POSITIVE_INFINITY as a function argument works
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const checkInfinity = (val: number): boolean => {
        return val === Float.POSITIVE_INFINITY;
      }
      const result: boolean = checkInfinity(Float.POSITIVE_INFINITY);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0830
     * @tc.name testGlobalConstantTest083
     * @tc.desc Verify Float.POSITIVE_INFINITY as an object property value is preserved
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: StrNumObj = { value: Float.toDouble(Float.POSITIVE_INFINITY) };
      expect(obj.value).assertPosUnlimited();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0840
     * @tc.name testGlobalConstantTest084
     * @tc.desc Verify Number.MIN_VALUE is positive and less than 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Number.MIN_VALUE;
      expect(v).assertLarger(0);
      expect(v).assertLess(1);
      expect(v).assertEqual(5e-324);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0850
     * @tc.name testGlobalConstantTest085
     * @tc.desc Verify Number.MIN_SAFE_INTEGER equals -9007199254740991
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = Number.MIN_SAFE_INTEGER;
      expect(r).assertEqual(-9007199254740991);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0860
     * @tc.name testGlobalConstantTest086
     * @tc.desc Verify Number.EPSILON is a small positive value > 0 and < 0.001
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = Number.EPSILON;
      expect(r).assertLarger(0);
      expect(r).assertLess(0.001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0870
     * @tc.name testGlobalConstantTest087
     * @tc.desc Verify Number.MAX_SAFE_INTEGER + 1 equals 9007199254740992
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = Number.MAX_SAFE_INTEGER + 1;
      expect(r).assertEqual(9007199254740992);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0880
     * @tc.name testGlobalConstantTest088
     * @tc.desc Verify Number.MIN_SAFE_INTEGER - 1 equals -9007199254740992
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = Number.MIN_SAFE_INTEGER - 1;
      expect(r).assertEqual(-9007199254740992);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0890
     * @tc.name testGlobalConstantTest089
     * @tc.desc Verify Number.MAX_SAFE_INTEGER > 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = Number.MAX_SAFE_INTEGER > 0;
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0900
     * @tc.name testGlobalConstantTest090
     * @tc.desc Verify -1.0 / -0 results in positive infinity (negative divided by negative zero gives +Inf)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = -1.0 / -0.0;
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0910
     * @tc.name testGlobalConstantTest091
     * @tc.desc Verify Float.NaN * 0 results in Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Float.NaN * 0;
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0920
     * @tc.name testGlobalConstantTest092
     * @tc.desc Verify Float.NaN - Float.NaN results in Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Float.NaN - Float.NaN;
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0930
     * @tc.name testGlobalConstantTest093
     * @tc.desc Verify -Float.POSITIVE_INFINITY + (-Float.POSITIVE_INFINITY) results in -Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = -Float.POSITIVE_INFINITY + -Float.POSITIVE_INFINITY;
      expect(result).assertEqual(-Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0940
     * @tc.name testGlobalConstantTest094
     * @tc.desc Verify Math.abs(Float.NaN) results in Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Math.abs(Float.NaN);
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0950
     * @tc.name testGlobalConstantTest095
     * @tc.desc Verify -Float.POSITIVE_INFINITY < Float.POSITIVE_INFINITY returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = -Float.POSITIVE_INFINITY < Float.POSITIVE_INFINITY;
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0960
     * @tc.name testGlobalConstantTest096
     * @tc.desc ~Float.NaN returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = ~Float.NaN;
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0970
     * @tc.name testGlobalConstantTest097
     * @tc.desc Float.NaN << 1 returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.NaN << 1;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0980
     * @tc.name testGlobalConstantTest098
     * @tc.desc Float.NaN >> 1 returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Float.NaN >> 1;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_0990
     * @tc.name testGlobalConstantTest099
     * @tc.desc Math.pow(Float.NaN, 0) returns 1 (IEEE 754: Number.NaN^0 = 1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.pow(Float.NaN, 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1000
     * @tc.name testGlobalConstantTest100
     * @tc.desc Math.floor(Float.NaN) returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.floor(Float.NaN);
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1010
     * @tc.name testGlobalConstantTest101
     * @tc.desc Math.sin(Float.NaN) returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sin(Float.NaN);
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1020
     * @tc.name testGlobalConstantTest102
     * @tc.desc Math.max(Float.NaN, 1) returns Float.NaN (Number.NaN propagation)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.max(Float.NaN, 1);
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1030
     * @tc.name testGlobalConstantTest103
     * @tc.desc Global Number.NaN strict equality with itself returns false per IEEE-754
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = Number.NaN === Number.NaN;
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1040
     * @tc.name testGlobalConstantTest104
     * @tc.desc Global Number.NaN strict inequality with itself returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = Number.NaN !== Number.NaN;
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1050
     * @tc.name testGlobalConstantTest105
     * @tc.desc Global Number.POSITIVE_INFINITY strict equality with itself returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = Number.POSITIVE_INFINITY === Number.POSITIVE_INFINITY;
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1060
     * @tc.name testGlobalConstantTest106
     * @tc.desc typeof global Number.NaN returns number
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: string = typeof Number.NaN;
      expect(t).assertEqual("number");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1070
     * @tc.name testGlobalConstantTest107
     * @tc.desc typeof global Number.POSITIVE_INFINITY returns number
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: string = typeof Number.POSITIVE_INFINITY;
      expect(t).assertEqual("number");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1080
     * @tc.name testGlobalConstantTest108
     * @tc.desc isNaN(global Number.NaN) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = isNaN(Number.NaN);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1090
     * @tc.name testGlobalConstantTest109
     * @tc.desc isFinite(global Number.NaN) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = isFinite(Number.NaN);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1100
     * @tc.name testGlobalConstantTest110
     * @tc.desc Global Number.NaN plus any number returns Number.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = Number.NaN + 5.0;
      const check: boolean = isNaN(r);
      expect(check).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1110
     * @tc.name testGlobalConstantTest111
     * @tc.desc Global Number.POSITIVE_INFINITY plus any finite number returns Number.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = Number.POSITIVE_INFINITY + 100.0;
      expect(r).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1120
     * @tc.name testGlobalConstantTest112
     * @tc.desc Global Number.POSITIVE_INFINITY minus Number.POSITIVE_INFINITY returns Number.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = Number.POSITIVE_INFINITY - Number.POSITIVE_INFINITY;
      const check: boolean = isNaN(r);
      expect(check).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1130
     * @tc.name testGlobalConstantTest113
     * @tc.desc Global Number.NaN times any number returns Number.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = Number.NaN * 3.0;
      const check: boolean = isNaN(r);
      expect(check).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1140
     * @tc.name testGlobalConstantTest114
     * @tc.desc Global Number.POSITIVE_INFINITY divided by Number.POSITIVE_INFINITY returns Number.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = Number.POSITIVE_INFINITY / Number.POSITIVE_INFINITY;
      const check: boolean = isNaN(r);
      expect(check).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1150
     * @tc.name testGlobalConstantTest115
     * @tc.desc Finite number divided by global Number.POSITIVE_INFINITY returns positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = 42.0 / Number.POSITIVE_INFINITY;
      expect(r).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1160
     * @tc.name testGlobalConstantTest116
     * @tc.desc Negative global Number.POSITIVE_INFINITY: -Number.POSITIVE_INFINITY is less than any finite number
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negInf: number = -Number.POSITIVE_INFINITY;
      const r: boolean = negInf < -999999.0;
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1170
     * @tc.name testGlobalConstantTest117
     * @tc.desc Global Number.POSITIVE_INFINITY is greater than any finite number
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = Number.POSITIVE_INFINITY > 1.7976931348623157e308;
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1180
     * @tc.name testGlobalConstantTest118
     * @tc.desc Global Number.NaN compared with any number using less than returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = Number.NaN < 0.0;
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1190
     * @tc.name testGlobalConstantTest119
     * @tc.desc Global Number.NaN compared with any number using greater than returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = Number.NaN > 0.0;
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1200
     * @tc.name testGlobalConstantTest120
     * @tc.desc Global Number.NaN loose equality with itself returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = Number.NaN == Number.NaN;
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1210
     * @tc.name testGlobalConstantTest121
     * @tc.desc Global Number.POSITIVE_INFINITY loose equality with itself returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = Number.POSITIVE_INFINITY == Number.POSITIVE_INFINITY;
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1220
     * @tc.name testGlobalConstantTest122
     * @tc.desc Global Number.NaN stored in array element returns Number.NaN when accessed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [Number.NaN, 1.0, 2.0];
      const check: boolean = isNaN(arr[0]);
      expect(check).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1230
     * @tc.name testGlobalConstantTest123
     * @tc.desc Global Number.POSITIVE_INFINITY stored in array element returns Number.POSITIVE_INFINITY when accessed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY, 0.0];
      expect(arr[0]).assertEqual(Number.POSITIVE_INFINITY);
      expect(arr[1]).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1240
     * @tc.name testGlobalConstantTest124
     * @tc.desc Global Number.NaN passed as function argument returns Number.NaN from function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn: (v: number) => number = (v: number): number => {
        return v;
      }
      const r: number = fn(Number.NaN);
      const check: boolean = isNaN(r);
      expect(check).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1250
     * @tc.name testGlobalConstantTest125
     * @tc.desc Global Number.NaN bitwise OR with zero returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = Number.NaN | 0;
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1260
     * @tc.name testGlobalConstantTest126
     * @tc.desc Global Number.POSITIVE_INFINITY converted to int via toInt returns Integer max value 2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: int = Number.POSITIVE_INFINITY.toInt();
      expect(r).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1270
     * @tc.name testGlobalConstantTest127
     * @tc.desc Global Number.NaN converted to string returns "NaN"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = String(Number.NaN);
      expect(s).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1280
     * @tc.name testGlobalConstantTest128
     * @tc.desc Global Number.POSITIVE_INFINITY converted to string returns "Infinity"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = String(Number.POSITIVE_INFINITY);
      expect(s).assertEqual("Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1290
     * @tc.name testGlobalConstantTest129
     * @tc.desc Global Number.NaN in object property value returns Number.NaN when accessed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: ValObj = { val: Number.NaN };
      const check: boolean = isNaN(obj.val);
      expect(check).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1300
     * @tc.name testGlobalConstantTest130
     * @tc.desc Global Number.POSITIVE_INFINITY in object property value returns Number.POSITIVE_INFINITY when accessed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: ValObj = { val: Number.POSITIVE_INFINITY };
      expect(obj.val).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1310
     * @tc.name testGlobalConstantTest131
     * @tc.desc Global Number.NaN equals Float.NaN in loose equality returns false (Number.NaN never equals Number.NaN)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = Number.NaN == Float.NaN;
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1320
     * @tc.name testGlobalConstantTest132
     * @tc.desc Global Number.POSITIVE_INFINITY equals Float.POSITIVE_INFINITY returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = Number.POSITIVE_INFINITY === Float.POSITIVE_INFINITY;
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1330
     * @tc.name testGlobalConstantTest133
     * @tc.desc Math.abs(global -Number.POSITIVE_INFINITY) returns Number.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = Math.abs(-Number.POSITIVE_INFINITY);
      expect(r).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1340
     * @tc.name testGlobalConstantTest134
     * @tc.desc Float.NEGATIVE_INFINITY toString returns "-Infinity"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = Float.NEGATIVE_INFINITY.toString();
      expect(s).assertEqual("-Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_TEST_1350
     * @tc.name testGlobalConstantTest135
     * @tc.desc Number.MAX_VALUE equals 1.7976931348623157e308
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalConstantTest135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Number.MAX_VALUE;
      expect(result).assertEqual(1.7976931348623157e308);
    });
  });
}
