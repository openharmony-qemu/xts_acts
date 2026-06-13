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

export default function LongMulTest(): void {
  describe('LongMulTest', () => {
    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });
    const MUL_NEG_6: long = -6;
    const MUL_NEG_5: long = -5;
    const MUL_NEG_4: long = -4;
    const MUL_NEG_1: long = -1;
    const MUL_0: long = 0;
    const MUL_1: long = 1;
    const MUL_2: long = 2;
    const MUL_3: long = 3;
    const MUL_4: long = 4;
    const MUL_6: long = 6;
    const MUL_10: long = 10;
    const MUL_100: long = 100;
    const MUL_7890: long = 7890;
    const MUL_123456: long = 123456;
    const MUL_STR_NEG_100: string = "-100";
    const MUL_STR_NEG_50: string = "-50";
    const MUL_STR_NEG_2: string = "-2";
    const MUL_STR_0: string = "0";
    const MUL_STR_10: string = "10";
    const MUL_STR_24: string = "24";
    const MUL_STR_100: string = "100";
    const MUL_STR_300: string = "300";
    const MUL_STR_974067840: string = "974067840";

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_MUL_0100
     * @tc.name testLongMul001
     * @tc.desc Verify basic multiplication of two positive Long values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongMul001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(MUL_6).mul(new Long(MUL_4));
      expect(result.toString()).assertEqual(MUL_STR_24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_MUL_0200
     * @tc.name testLongMul002
     * @tc.desc Verify positive times positive Long values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongMul002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(MUL_100).mul(new Long(MUL_3));
      expect(result.toString()).assertEqual(MUL_STR_300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_MUL_0300
     * @tc.name testLongMul003
     * @tc.desc Verify positive times negative Long values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongMul003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(MUL_10).mul(new Long(MUL_NEG_5));
      expect(result.toString()).assertEqual(MUL_STR_NEG_50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_MUL_0400
     * @tc.name testLongMul004
     * @tc.desc Verify negative times negative Long values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongMul004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(MUL_NEG_6).mul(new Long(MUL_NEG_4));
      expect(result.toString()).assertEqual(MUL_STR_24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_MUL_0500
     * @tc.name testLongMul005
     * @tc.desc Verify multiply by zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongMul005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(MUL_100).mul(new Long(MUL_0));
      expect(result.toString()).assertEqual(MUL_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_MUL_0600
     * @tc.name testLongMul006
     * @tc.desc Verify multiply by one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongMul006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(MUL_100).mul(new Long(MUL_1));
      expect(result.toString()).assertEqual(MUL_STR_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_MUL_0700
     * @tc.name testLongMul007
     * @tc.desc Verify multiply by negative one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongMul007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(MUL_100).mul(new Long(MUL_NEG_1));
      expect(result.toString()).assertEqual(MUL_STR_NEG_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_MUL_0800
     * @tc.name testLongMul008
     * @tc.desc Verify MAX_VALUE times 2 overflow behavior
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongMul008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MAX_VALUE).mul(new Long(MUL_2));
      expect(result.toString()).assertEqual(MUL_STR_NEG_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_MUL_0900
     * @tc.name testLongMul009
     * @tc.desc Verify MIN_VALUE times -1 overflow behavior
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongMul009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MIN_VALUE).mul(new Long(MUL_NEG_1));
      expect(result.toString()).assertEqual(Long.MIN_VALUE.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_MUL_1000
     * @tc.name testLongMul010
     * @tc.desc Verify multiplication of large numbers within range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongMul010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(MUL_123456).mul(new Long(MUL_7890));
      expect(result.toString()).assertEqual(MUL_STR_974067840);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_MUL_1100
     * @tc.name testLongMul011
     * @tc.desc Verify mul result toLong: 6 * 4 = 24
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongMul011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(MUL_6).mul(new Long(MUL_4));
      expect(result.toLong()).assertEqual(MUL_6 * MUL_4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_MUL_1200
     * @tc.name testLongMul012
     * @tc.desc Verify mul returns a new instance, not the same object
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongMul012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: Long = new Long(MUL_6);
      const result: Long = original.mul(new Long(MUL_4));
      expect(result !== original).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_MUL_1300
     * @tc.name testLongMul013
     * @tc.desc Verify chained mul operations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongMul013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(MUL_2).mul(new Long(MUL_3)).mul(new Long(MUL_4));
      expect(result.toString()).assertEqual(MUL_STR_24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_MUL_1400
     * @tc.name testLongMul014
     * @tc.desc Verify zero times zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongMul014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(MUL_0).mul(new Long(MUL_0));
      expect(result.toString()).assertEqual(MUL_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_MUL_1500
     * @tc.name testLongMul015
     * @tc.desc Verify mul then add chained operations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongMul015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(MUL_2).mul(new Long(MUL_3)).add(new Long(MUL_4));
      expect(result.toString()).assertEqual(MUL_STR_10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_MUL_1600
     * @tc.name testLongMul016
     * @tc.desc Verify mul commutativity: a.mul(b) equals b.mul(a)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongMul016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(MUL_2);
      const b: Long = new Long(MUL_3);
      const ab: Long = a.mul(b);
      const ba: Long = b.mul(a);
      expect(ab.toString()).assertEqual(ba.toString());
    });
  });
}
