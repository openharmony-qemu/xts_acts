/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';

export default function CharIsInBasicMultilingualPlaneStaticCharTest(): void {
  describe('CharIsInBasicMultilingualPlaneStaticCharTest' as string, () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISINBMPSTATIC_CHAR_0100
     * @tc.name testCharIsInBMPStaticChar0001
     * @tc.desc Verify static isInBasicMultilingualPlane with standard ASCII char A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticChar0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isInBasicMultilingualPlane(c'A');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISINBMPSTATIC_CHAR_0200
     * @tc.name testCharIsInBMPStaticChar0003
     * @tc.desc Verify static isInBasicMultilingualPlane with range of alphanumeric ASCII chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticChar0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isInBasicMultilingualPlane(c'A')).assertTrue();
      expect(Char.isInBasicMultilingualPlane(c'Z')).assertTrue();
      expect(Char.isInBasicMultilingualPlane(c'a')).assertTrue();
      expect(Char.isInBasicMultilingualPlane(c'z')).assertTrue();
      expect(Char.isInBasicMultilingualPlane(c'0')).assertTrue();
      expect(Char.isInBasicMultilingualPlane(c'9')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISINBMPSTATIC_CHAR_0300
     * @tc.name testCharIsInBMPStaticChar0004
     * @tc.desc Verify static isInBasicMultilingualPlane returns false for high and low surrogate boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticChar0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isInBasicMultilingualPlane(Char.HIGH_SURROGATE_MIN)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(Char.HIGH_SURROGATE_MAX)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(Char.LOW_SURROGATE_MIN)).assertFalse();
      expect(Char.isInBasicMultilingualPlane(Char.LOW_SURROGATE_MAX)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISINBMPSTATIC_CHAR_0400
     * @tc.name testCharIsInBMPStaticChar0005
     * @tc.desc Verify static isInBasicMultilingualPlane with standard Chinese, Japanese, and Korean chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticChar0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isInBasicMultilingualPlane(c'中')).assertTrue();
      expect(Char.isInBasicMultilingualPlane(c'国')).assertTrue();
      expect(Char.isInBasicMultilingualPlane(c'あ')).assertTrue();
      expect(Char.isInBasicMultilingualPlane(c'가')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISINBMPSTATIC_CHAR_0500
     * @tc.name testCharIsInBMPStaticChar0007
     * @tc.desc Verify static isInBasicMultilingualPlane with Char MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticChar0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isInBasicMultilingualPlane(Char.MIN_VALUE);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISINBMPSTATIC_CHAR_0600
     * @tc.name testCharIsInBMPStaticChar0008
     * @tc.desc Verify static isInBasicMultilingualPlane with Char MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticChar0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isInBasicMultilingualPlane(Char.MAX_VALUE);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISINBMPSTATIC_CHAR_0700
     * @tc.name testCharIsInBMPStaticChar0010
     * @tc.desc Verify static isInBasicMultilingualPlane return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticChar0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isInBasicMultilingualPlane(c'A');
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISINBMPSTATIC_CHAR_0800
     * @tc.name testCharIsInBMPStaticChar0013
     * @tc.desc Verify static isInBasicMultilingualPlane with null-character escape sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticChar0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isInBasicMultilingualPlane(c'\u0000');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISINBMPSTATIC_CHAR_0900
     * @tc.name testCharIsInBMPStaticChar0014
     * @tc.desc Verify static isInBasicMultilingualPlane with whitespace escape characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticChar0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isInBasicMultilingualPlane(c'\n')).assertTrue();
      expect(Char.isInBasicMultilingualPlane(c'\t')).assertTrue();
      expect(Char.isInBasicMultilingualPlane(c'\r')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISINBMPSTATIC_CHAR_1000
     * @tc.name testCharIsInBMPStaticChar0016
     * @tc.desc Verify static isInBasicMultilingualPlane returns a valid boolean value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticChar0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isInBasicMultilingualPlane(c'A');
      expect(typeof result).assertEqual("boolean");
      expect(result === true || result === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISINBMPSTATIC_CHAR_1100
     * @tc.name testCharIsInBMPStaticChar0017
     * @tc.desc Verify static isInBasicMultilingualPlane returns correct truth values for ASCII and surrogates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticChar0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trueResult = Char.isInBasicMultilingualPlane(c'A');
      const falseResult = Char.isInBasicMultilingualPlane(Char.HIGH_SURROGATE_MIN);
      expect(trueResult === true).assertTrue();
      expect(falseResult === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISINBMPSTATIC_CHAR_1200
     * @tc.name testCharIsInBMPStaticChar0026
     * @tc.desc Verify static isInBasicMultilingualPlane performance/synchronous behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticChar0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      const result = Char.isInBasicMultilingualPlane(c'A');
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISINBMPSTATIC_CHAR_1300
     * @tc.name testCharIsInBMPStaticChar0027
     * @tc.desc Verify consistency of static isInBasicMultilingualPlane with its instance counterpart
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticChar0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const staticResult = Char.isInBasicMultilingualPlane(c'A');
      const instanceResult = c.isInBasicMultilingualPlane();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISINBMPSTATIC_CHAR_1400
     * @tc.name testCharIsInBMPStaticChar0029
     * @tc.desc Verify static isInBasicMultilingualPlane returns false for high and low surrogate minima
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticChar0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = Char.HIGH_SURROGATE_MIN;
      expect(Char.isInBasicMultilingualPlane(highSurrogate)).assertFalse();
      expect(Char.isHighSurrogate(highSurrogate)).assertTrue();
      const lowSurrogate = Char.LOW_SURROGATE_MIN;
      expect(Char.isInBasicMultilingualPlane(lowSurrogate)).assertFalse();
      expect(Char.isLowSurrogate(lowSurrogate)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISINBMPSTATIC_CHAR_1500
     * @tc.name testCharIsInBMPStaticChar0030
     * @tc.desc Verify static isInBasicMultilingualPlane and isPartOfSurrogatePair relationships
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticChar0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = Char.HIGH_SURROGATE_MIN;
      expect(Char.isInBasicMultilingualPlane(highSurrogate)).assertFalse();
      expect(Char.isPartOfSurrogatePair(highSurrogate)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISINBMPSTATIC_CHAR_1600
     * @tc.name testCharIsInBMPStaticChar0037
     * @tc.desc Verify static isInBasicMultilingualPlane with full high/low surrogate range endpoints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticChar0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highMin = Char.isInBasicMultilingualPlane(Char.HIGH_SURROGATE_MIN);
      const highMax = Char.isInBasicMultilingualPlane(Char.HIGH_SURROGATE_MAX);
      const lowMin = Char.isInBasicMultilingualPlane(Char.LOW_SURROGATE_MIN);
      const lowMax = Char.isInBasicMultilingualPlane(Char.LOW_SURROGATE_MAX);
      expect(highMin).assertFalse();
      expect(highMax).assertFalse();
      expect(lowMin).assertFalse();
      expect(lowMax).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISINBMPSTATIC_CHAR_1700
     * @tc.name testCharIsInBMPStaticChar0038
     * @tc.desc Verify static isInBasicMultilingualPlane repeatedly on same character yields consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticChar0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.isInBasicMultilingualPlane(c'A');
      const result2 = Char.isInBasicMultilingualPlane(c'A');
      const result3 = Char.isInBasicMultilingualPlane(c'A');
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISINBMPSTATIC_CHAR_1800
     * @tc.name testCharIsInBMPStaticChar0039
     * @tc.desc Verify static isInBasicMultilingualPlane loop execution correctness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticChar0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        expect(Char.isInBasicMultilingualPlane(c'A')).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISINBMPSTATIC_CHAR_1900
     * @tc.name testCharIsInBMPStaticChar0043
     * @tc.desc Verify surrogate properties are mutually consistent for high/low surrogates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBMPStaticChar0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = Char.HIGH_SURROGATE_MIN;
      expect(Char.isInBasicMultilingualPlane(highSurrogate)).assertFalse();
      expect(Char.isHighSurrogate(highSurrogate)).assertTrue();
      expect(Char.isPartOfSurrogatePair(highSurrogate)).assertTrue();
      const lowSurrogate = Char.LOW_SURROGATE_MIN;
      expect(Char.isInBasicMultilingualPlane(lowSurrogate)).assertFalse();
      expect(Char.isLowSurrogate(lowSurrogate)).assertTrue();
      expect(Char.isPartOfSurrogatePair(lowSurrogate)).assertTrue();
    });
  });
}
