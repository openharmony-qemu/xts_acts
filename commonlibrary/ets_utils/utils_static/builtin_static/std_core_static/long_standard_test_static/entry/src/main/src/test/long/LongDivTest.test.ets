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

export default function LongDivTest(): void {
  describe('LongDivTest', () => {

    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    const DIV_NEG_100: long = -100;
    const DIV_NEG_7: long = -7;
    const DIV_NEG_5: long = -5;
    const DIV_NEG_1: long = -1;
    const DIV_0: long = 0;
    const DIV_1: long = 1;
    const DIV_2: long = 2;
    const DIV_4: long = 4;
    const DIV_5: long = 5;
    const DIV_7: long = 7;
    const DIV_8: long = 8;
    const DIV_10: long = 10;
    const DIV_100: long = 100;
    const DIV_STR_NEG_100: string = "-100";
    const DIV_STR_NEG_20: string = "-20";
    const DIV_STR_NEG_3: string = "-3";
    const DIV_STR_0: string = "0";
    const DIV_STR_1: string = "1";
    const DIV_STR_2: string = "2";
    const DIV_STR_3: string = "3";
    const DIV_STR_20: string = "20";
    const DIV_STR_100: string = "100";

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV_0100
     * @tc.name testLongDiv001
     * @tc.desc Verify basic division of two positive Long values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongDiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(DIV_8).div(new Long(DIV_4));
      expect(result.toString()).assertEqual(DIV_STR_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV_0200
     * @tc.name testLongDiv002
     * @tc.desc Verify positive divided by positive Long values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongDiv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(DIV_100).div(new Long(DIV_5));
      expect(result.toString()).assertEqual(DIV_STR_20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV_0300
     * @tc.name testLongDiv003
     * @tc.desc Verify positive divided by negative Long values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongDiv003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(DIV_100).div(new Long(DIV_NEG_5));
      expect(result.toString()).assertEqual(DIV_STR_NEG_20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV_0400
     * @tc.name testLongDiv004
     * @tc.desc Verify negative divided by positive Long values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongDiv004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(DIV_NEG_100).div(new Long(DIV_5));
      expect(result.toString()).assertEqual(DIV_STR_NEG_20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV_0500
     * @tc.name testLongDiv005
     * @tc.desc Verify negative divided by negative Long values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongDiv005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(DIV_NEG_100).div(new Long(DIV_NEG_5));
      expect(result.toString()).assertEqual(DIV_STR_20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV_0600
     * @tc.name testLongDiv006
     * @tc.desc Verify divide by 1 returns the original value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongDiv006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(DIV_100).div(new Long(DIV_1));
      expect(result.toString()).assertEqual(DIV_STR_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV_0700
     * @tc.name testLongDiv007
     * @tc.desc Verify divide by -1 returns the negated value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongDiv007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(DIV_100).div(new Long(DIV_NEG_1));
      expect(result.toString()).assertEqual(DIV_STR_NEG_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV_0800
     * @tc.name testLongDiv008
     * @tc.desc Verify dividing by itself returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongDiv008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(DIV_10).div(new Long(DIV_10));
      expect(result.toString()).assertEqual(DIV_STR_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV_0900
     * @tc.name testLongDiv009
     * @tc.desc Verify zero divided by positive value returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongDiv009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(DIV_0).div(new Long(DIV_5));
      expect(result.toString()).assertEqual(DIV_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV_1000
     * @tc.name testLongDiv010
     * @tc.desc Verify integer division truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongDiv010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(DIV_7).div(new Long(DIV_2));
      expect(result.toString()).assertEqual(DIV_STR_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV_1100
     * @tc.name testLongDiv011
     * @tc.desc Verify division by zero throws an error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongDiv011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Long(DIV_1).div(new Long(DIV_0));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArithmeticError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV_1200
     * @tc.name testLongDiv012
     * @tc.desc Verify div result toLong: 8 / 4 = 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongDiv012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(DIV_8).div(new Long(DIV_4));
      expect(result.toLong()).assertEqual(DIV_8 / DIV_4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV_1300
     * @tc.name testLongDiv013
     * @tc.desc Verify div returns a new instance, not the same object
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongDiv013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Long(DIV_8);
      const result = original.div(new Long(DIV_4));
      expect(result !== original).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV_1400
     * @tc.name testLongDiv014
     * @tc.desc Verify negative integer division truncates toward zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongDiv014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(DIV_NEG_7).div(new Long(DIV_2));
      expect(result.toString()).assertEqual(DIV_STR_NEG_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV_1500
     * @tc.name testLongDiv015
     * @tc.desc Verify division by zero with dividend 0 throws an error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongDiv015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Long(DIV_0).div(new Long(DIV_0));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArithmeticError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV_1600
     * @tc.name testLongDiv016
     * @tc.desc Verify division by zero with dividend -1 throws an error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongDiv016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Long(DIV_NEG_1).div(new Long(DIV_0));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArithmeticError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV_1700
     * @tc.name testLongDiv017
     * @tc.desc Verify division by zero with dividend Long.MIN_VALUE throws an error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongDiv017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Long(Long.MIN_VALUE).div(new Long(DIV_0));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArithmeticError");
      }
    });
  });
}
