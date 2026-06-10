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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function LongEqualsTest(): void {
  describe('LongEqualsTest', () => {
    beforeEach(async () => { await Utils.msSleep(30); });

    const EQ_NEG_100: long = -100;
    const EQ_NEG_10: long = -10;
    const EQ_0: long = 0;
    const EQ_10: long = 10;
    const EQ_20: long = 20;
    const EQ_42: long = 42;
    const EQ_999999: long = 999999;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS_0100
     * @tc.name testLongEquals001
     * @tc.desc Verify equals returns true when comparing two Long instances with the same value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongEquals001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Long(EQ_10);
      const right = new Long(EQ_10);
      const result: boolean = left.equals(right);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS_0200
     * @tc.name testLongEquals002
     * @tc.desc Verify equals returns false when comparing two Long instances with different values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongEquals002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Long(EQ_10);
      const right = new Long(EQ_20);
      const result: boolean = left.equals(right);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS_0300
     * @tc.name testLongEquals003
     * @tc.desc Verify equals returns true when both Long instances are zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongEquals003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Long(EQ_0);
      const right = new Long(EQ_0);
      const result: boolean = left.equals(right);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS_0400
     * @tc.name testLongEquals004
     * @tc.desc Verify equals returns true when both Long instances have the same negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongEquals004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Long(EQ_NEG_100);
      const right = new Long(EQ_NEG_100);
      const result: boolean = left.equals(right);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS_0500
     * @tc.name testLongEquals005
     * @tc.desc Verify equals returns false when comparing negative Long with positive Long
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongEquals005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Long(EQ_NEG_10);
      const right = new Long(EQ_10);
      const result: boolean = left.equals(right);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS_0600
     * @tc.name testLongEquals006
     * @tc.desc Verify equals returns true when comparing two Long instances with the same large positive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongEquals006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Long(EQ_999999);
      const right = new Long(EQ_999999);
      const result: boolean = left.equals(right);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS_0700
     * @tc.name testLongEquals007
     * @tc.desc Verify equals returns false when comparing Long with an Object instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongEquals007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(EQ_10);
      const obj: Object = new Object();
      const result: boolean = value.equals(obj);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS_0800
     * @tc.name testLongEquals008
     * @tc.desc Verify equals returns false when comparing Long with an array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongEquals008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(EQ_10);
      const arr: Object = [EQ_10];
      const result: boolean = value.equals(arr);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS_0900
     * @tc.name testLongEquals009
     * @tc.desc Verify equals returns true when comparing a Long instance with itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongEquals009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(EQ_42);
      const result: boolean = value.equals(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS_1000
     * @tc.name testLongEquals010
     * @tc.desc Verify equals returns true when comparing two default-constructed Long instances
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongEquals010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Long();
      const right = new Long();
      const result: boolean = left.equals(right);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS_1100
     * @tc.name testLongEquals011
     * @tc.desc Verify equals returns true when comparing new Long(0) with new Long()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongEquals011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Long(EQ_0);
      const right = new Long();
      const result: boolean = left.equals(right);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS_1200
     * @tc.name testLongEquals012
     * @tc.desc Verify equals returns false for long value argument via Any
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongEquals012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(EQ_10);
      const obj: long = EQ_42;
      const result: boolean = value.equals(obj);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS_1300
     * @tc.name testLongEquals013
     * @tc.desc Verify equals returns false for string argument via Any
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongEquals013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(EQ_10);
      const obj: string = "test";
      const result: boolean = value.equals(obj);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS_1400
     * @tc.name testLongEquals014
     * @tc.desc Verify equals returns false for boolean argument via Any
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongEquals014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(EQ_10);
      const obj: boolean = true;
      const result: boolean = value.equals(obj);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS_1500
     * @tc.name testLongEquals015
     * @tc.desc Verify equals returns false for null argument via Any
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongEquals015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(EQ_10);
      const obj: Long | null = null;
      const result: boolean = value.equals(obj);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS_1600
     * @tc.name testLongEquals016
     * @tc.desc Verify equals returns false for undefined argument via Any
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongEquals016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(EQ_10);
      const obj: Long | undefined = undefined;
      const result: boolean = value.equals(obj);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS_1700
     * @tc.name testLongEquals017
     * @tc.desc Verify equals returns true when comparing two MAX_VALUE Long instances
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongEquals017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Long(Long.MAX_VALUE);
      const right = new Long(Long.MAX_VALUE);
      const result: boolean = left.equals(right);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS_1800
     * @tc.name testLongEquals018
     * @tc.desc Verify equals returns true when comparing two MIN_VALUE Long instances
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongEquals018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Long(Long.MIN_VALUE);
      const right = new Long(Long.MIN_VALUE);
      const result: boolean = left.equals(right);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS_1900
     * @tc.name testLongEquals019
     * @tc.desc Verify equals returns false when comparing MAX_VALUE with MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongEquals019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Long(Long.MAX_VALUE);
      const right = new Long(Long.MIN_VALUE);
      const result: boolean = left.equals(right);
      expect(result).assertFalse();
    });

  });
}
