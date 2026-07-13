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
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

export default function shortConstructorTest(): void {
  describe('ShortConstructorTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_0100
     * @tc.name testShortConstructor001
     * @tc.desc Verify constructor with no arguments creates a usable Short instance with default zero value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short();
      let result: short = value.toShort();
      expect(result).assertEqual(0 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_0200
     * @tc.name testShortConstructor002
     * @tc.desc Verify constructor returned instance supports toShort and toString with default zero value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short();
      let resultShort: short = value.toShort();
      let resultText: String = value.toString();
      expect(resultShort).assertEqual(0 as short);
      expect(resultText).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_0300
     * @tc.name testShortConstructor003
     * @tc.desc Verify constructor initializes internal short value to zero through numeric conversions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short();
      let resultShort: short = value.toShort();
      let resultInt: int = value.toInt();
      let resultLong: long = value.toLong();
      expect(resultShort).assertEqual(0 as short);
      expect(resultInt).assertEqual(0);
      expect(resultLong).assertEqual(Long.toLong(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_0400
     * @tc.name testShortConstructor004
     * @tc.desc Verify multiple constructor invocations produce consistent initial zero value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Short = new Short();
      let second: Short = new Short();
      let third: Short = new Short();
      expect(first.toShort()).assertEqual(0 as short);
      expect(second.toShort()).assertEqual(0 as short);
      expect(third.toShort()).assertEqual(0 as short);
      expect(first.toInt()).assertEqual(0);
      expect(second.toInt()).assertEqual(0);
      expect(third.toInt()).assertEqual(0);
      expect(first.toLong()).assertEqual(Long.toLong(0));
      expect(second.toLong()).assertEqual(Long.toLong(0));
      expect(third.toLong()).assertEqual(Long.toLong(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_0500
     * @tc.name testShortConstructor005
     * @tc.desc Verify constructor has no global side effects and later constructions do not mutate prior instance state
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let prior: Short = new Short();
      let priorShort: short = prior.toShort();
      let priorInt: int = prior.toInt();
      let priorLong: long = prior.toLong();
      let nextOne: Short = new Short();
      let nextTwo: Short = new Short();
      let nextThree: Short = new Short();
      expect(prior.toShort()).assertEqual(priorShort);
      expect(prior.toInt()).assertEqual(priorInt);
      expect(prior.toLong()).assertEqual(priorLong);
      expect(prior.toShort()).assertEqual(0 as short);
      expect(nextOne.toShort()).assertEqual(0 as short);
      expect(nextTwo.toShort()).assertEqual(0 as short);
      expect(nextThree.toShort()).assertEqual(0 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_0600
     * @tc.name testShortConstructor006
     * @tc.desc Verify constructor with positive short values preserves each internal short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveValues: short[] = [
        1 as short,
        100 as short,
        Short.MAX_VALUE
      ];
      let caseCount: int = 3;
      for (let i: int = 0; i < caseCount; i++) {
        let input: short = positiveValues[i];
        let value: Short = new Short(input);
        expect(value.toShort()).assertEqual(input);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_0700
     * @tc.name testShortConstructor007
     * @tc.desc Verify constructor with negative short values preserves each signed internal short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeValues: short[] = [
        (-1) as short,
        (-100) as short,
        Short.MIN_VALUE
      ];
      let caseCount: int = 3;
      for (let i: int = 0; i < caseCount; i++) {
        let input: short = negativeValues[i];
        let value: Short = new Short(input);
        expect(value.toShort()).assertEqual(input);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_0800
     * @tc.name testShortConstructor008
     * @tc.desc Verify constructor with mixed short values exposes matching toShort and toInt conversion results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputs: short[] = [
        0 as short,
        1 as short,
        (-1) as short,
        100 as short,
        (-100) as short
      ];
      let expectedInts: int[] = [
        0,
        1,
        -1,
        100,
        -100
      ];
      let caseCount: int = 5;
      for (let i: int = 0; i < caseCount; i++) {
        let value: Short = new Short(inputs[i]);
        expect(value.toShort()).assertEqual(inputs[i]);
        expect(value.toInt()).assertEqual(expectedInts[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_0900
     * @tc.name testShortConstructor009
     * @tc.desc Verify constructor with positive short values provides correct decimal string representation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let one: Short = new Short(1 as short);
      let hundred: Short = new Short(100 as short);
      let normal: Short = new Short(2048 as short);
      let nearMax: Short = new Short(32760 as short);
      let maxValue: Short = new Short(Short.MAX_VALUE);
      expect(one.toString()).assertEqual("1");
      expect(hundred.toString()).assertEqual("100");
      expect(normal.toString()).assertEqual("2048");
      expect(nearMax.toString()).assertEqual("32760");
      expect(maxValue.toString()).assertEqual("32767");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_1000
     * @tc.name testShortConstructor010
     * @tc.desc Verify constructor with negative short values provides correct signed decimal string representation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeOne: Short = new Short((-1) as short);
      let negativeHundred: Short = new Short((-100) as short);
      let minValue: Short = new Short(Short.MIN_VALUE);
      expect(negativeOne.toString()).assertEqual("-1");
      expect(negativeHundred.toString()).assertEqual("-100");
      expect(minValue.toString()).assertEqual("-32768");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_1100
     * @tc.name testShortConstructor011
     * @tc.desc Verify constructor with zero short value keeps zero across numeric and string conversion paths
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroValue: Short = new Short(0 as short);
      expect(zeroValue.toShort()).assertEqual(0 as short);
      expect(zeroValue.toInt()).assertEqual(0);
      expect(zeroValue.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_1200
     * @tc.name testShortConstructor012
     * @tc.desc Verify multiple Short instances constructed with different values keep isolated internal states
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Short = new Short(10 as short);
      let second: Short = new Short((-20) as short);
      let third: Short = new Short(0 as short);
      let firstBefore: short = first.toShort();
      let secondBefore: short = second.toShort();
      let thirdBefore: short = third.toShort();
      expect(firstBefore).assertEqual(10 as short);
      expect(secondBefore).assertEqual((-20) as short);
      expect(thirdBefore).assertEqual(0 as short);
      expect(first.toShort()).assertEqual(firstBefore);
      expect(second.toShort()).assertEqual(secondBefore);
      expect(third.toShort()).assertEqual(thirdBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_1300
     * @tc.name testShortConstructor013
     * @tc.desc Verify repeated constructor calls with identical positive and negative values produce consistent initial states
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveParam: short = 100 as short;
      let positiveOne: Short = new Short(positiveParam);
      let positiveTwo: Short = new Short(positiveParam);
      let positiveThree: Short = new Short(positiveParam);
      let negativeParam: short = (-50) as short;
      let negativeOne: Short = new Short(negativeParam);
      let negativeTwo: Short = new Short(negativeParam);
      let negativeThree: Short = new Short(negativeParam);
      expect(positiveOne.toShort()).assertEqual(100 as short);
      expect(positiveTwo.toShort()).assertEqual(100 as short);
      expect(positiveThree.toShort()).assertEqual(100 as short);
      expect(negativeOne.toShort()).assertEqual((-50) as short);
      expect(negativeTwo.toShort()).assertEqual((-50) as short);
      expect(negativeThree.toShort()).assertEqual((-50) as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_1400
     * @tc.name testShortConstructor014
     * @tc.desc Verify instances constructed with identical short parameter compare as equal while preserving their value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Short = new Short(42 as short);
      let second: Short = new Short(42 as short);
      let firstValue: short = first.toShort();
      let secondValue: short = second.toShort();
      expect(firstValue).assertEqual(42 as short);
      expect(secondValue).assertEqual(42 as short);
      expect(first.compareTo(second)).assertEqual(0);
      expect(second.compareTo(first)).assertEqual(0);
      expect(first.compareTo(first)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_1500
     * @tc.name testShortConstructor015
     * @tc.desc Verify constructor with Short.MIN_VALUE stores minimum short boundary and string representation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minValue: Short = new Short(Short.MIN_VALUE);
      expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
      expect(minValue.toInt()).assertEqual(-32768);
      expect(minValue.toString()).assertEqual("-32768");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_1600
     * @tc.name testShortConstructor016
     * @tc.desc Verify constructor with Short.MAX_VALUE stores maximum short boundary and string representation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: Short = new Short(Short.MAX_VALUE);
      expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
      expect(maxValue.toInt()).assertEqual(32767);
      expect(maxValue.toString()).assertEqual("32767");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_1700
     * @tc.name testShortConstructor017
     * @tc.desc Verify constructor with adjacent short boundaries stores MAX_VALUE minus one and MIN_VALUE plus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nearMax: Short = new Short(32766 as short);
      let nearMin: Short = new Short((-32767) as short);
      expect(nearMax.toShort()).assertEqual(32766 as short);
      expect(nearMax.toInt()).assertEqual(32766);
      expect(nearMin.toShort()).assertEqual((-32767) as short);
      expect(nearMin.toInt()).assertEqual(-32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_1800
     * @tc.name testShortConstructor018
     * @tc.desc Verify constructor accepts hexadecimal and octal literal forms that represent maximum short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hexMax: Short = new Short(0x7FFF as short);
      let octalMax: Short = new Short(0o77777 as short);
      expect(hexMax.toShort()).assertEqual(Short.MAX_VALUE);
      expect(hexMax.toString()).assertEqual("32767");
      expect(octalMax.toShort()).assertEqual(Short.MAX_VALUE);
      expect(octalMax.toString()).assertEqual("32767");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_1900
     * @tc.name testShortConstructor019
     * @tc.desc Verify min-value and max-value constructed instances participate in correct boundary comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minValue: Short = new Short(Short.MIN_VALUE);
      let maxValue: Short = new Short(Short.MAX_VALUE);
      expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
      expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
      expect(minValue.compareTo(maxValue)).assertEqual(-1);
      expect(maxValue.compareTo(minValue)).assertEqual(1);
      expect(minValue.compareTo(minValue)).assertEqual(0);
      expect(maxValue.compareTo(maxValue)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_2000
     * @tc.name testShortConstructor020
     * @tc.desc Verify later value constructions do not mutate the internal state of an earlier constructed instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let prior: Short = new Short(42 as short);
      let priorShort: short = prior.toShort();
      let priorInt: int = prior.toInt();
      let priorText: String = prior.toString();
      let nextMin: Short = new Short(Short.MIN_VALUE);
      let nextMax: Short = new Short(Short.MAX_VALUE);
      let nextNegative: Short = new Short((-1) as short);
      expect(prior.toShort()).assertEqual(priorShort);
      expect(prior.toInt()).assertEqual(priorInt);
      expect(prior.toString()).assertEqual(priorText);
      expect(prior.toShort()).assertEqual(42 as short);
      expect(nextMin.toShort()).assertEqual(Short.MIN_VALUE);
      expect(nextMax.toShort()).assertEqual(Short.MAX_VALUE);
      expect(nextNegative.toShort()).assertEqual((-1) as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_2100
     * @tc.name testShortConstructor021
     * @tc.desc Verify Short bit and byte size constants expose documented short storage width
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bitSize: byte = Short.BIT_SIZE;
      let byteSize: byte = Short.BYTE_SIZE;
      expect(bitSize).assertEqual(16 as byte);
      expect(byteSize).assertEqual(2 as byte);
    });
  });
}
