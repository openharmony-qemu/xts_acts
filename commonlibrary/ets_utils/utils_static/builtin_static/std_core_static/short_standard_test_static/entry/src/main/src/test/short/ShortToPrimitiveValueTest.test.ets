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
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function shortToPrimitiveValueTest(): void {
  describe('ShortToPrimitiveValueTest', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_0100
     * @tc.name testShortToPrimitiveValue001
     * @tc.desc Verify instance primitive conversion methods return exact values for a zero Short input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroInstance: Short = new Short(0 as short);
      expect(zeroInstance.toByte()).assertEqual(0 as byte);
      expect(zeroInstance.toShort()).assertEqual(0 as short);
      expect(zeroInstance.toInt()).assertEqual(0);
      expect(zeroInstance.toLong()).assertEqual(Long.toLong(0));
      expect(zeroInstance.toFloat()).assertEqual(0.0f);
      expect(zeroInstance.toDouble()).assertEqual(0.0);
      expect(zeroInstance.toChar()).assertEqual(c'\u0000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_0200
     * @tc.name testShortToPrimitiveValue002
     * @tc.desc Verify toByte method returns exact byte values for byte-range Short instances
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: short[] = [
        0 as short,
        42 as short,
        (-1) as short,
        127 as short,
        (-128) as short
      ];
      let expectedValues: byte[] = [
        0 as byte,
        42 as byte,
        (-1) as byte,
        127 as byte,
        (-128) as byte
      ];
      let caseCount: int = 5;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let boxedValue: Short = new Short(testValues[caseIndex]);
        let actualResult: byte = boxedValue.toByte();
        expect(actualResult).assertEqual(expectedValues[caseIndex]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_0300
     * @tc.name testShortToPrimitiveValue003
     * @tc.desc Verify toShort method returns stored short values including full short boundaries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: short[] = [
        0 as short,
        42 as short,
        (-15) as short,
        Short.MAX_VALUE,
        Short.MIN_VALUE
      ];
      let caseCount: int = 5;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let boxedValue: Short = new Short(testValues[caseIndex]);
        let actualResult: short = boxedValue.toShort();
        expect(actualResult).assertEqual(testValues[caseIndex]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_0400
     * @tc.name testShortToPrimitiveValue004
     * @tc.desc Verify toInt method sign extends short values to exact int results for normal and boundary inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: short[] = [
        0 as short,
        1 as short,
        (-1) as short,
        Short.MAX_VALUE,
        Short.MIN_VALUE
      ];
      let expectedValues: int[] = [
        0,
        1,
        -1,
        32767,
        -32768
      ];
      let caseCount: int = 5;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let boxedValue: Short = new Short(testValues[caseIndex]);
        let actualResult: int = boxedValue.toInt();
        expect(actualResult).assertEqual(expectedValues[caseIndex]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_0500
     * @tc.name testShortToPrimitiveValue005
     * @tc.desc Verify toLong method sign extends short values to exact long results for normal and boundary inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: short[] = [
        0 as short,
        42 as short,
        (-15) as short,
        Short.MAX_VALUE,
        Short.MIN_VALUE
      ];
      let expectedValues: long[] = [
        Long.toLong(0),
        Long.toLong(42),
        Long.toLong(-15),
        Long.toLong(32767),
        Long.toLong(-32768)
      ];
      let caseCount: int = 5;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let boxedValue: Short = new Short(testValues[caseIndex]);
        let actualResult: long = boxedValue.toLong();
        expect(actualResult).assertEqual(expectedValues[caseIndex]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_0600
     * @tc.name testShortToPrimitiveValue006
     * @tc.desc Verify toFloat method converts short integer values to exact float results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: short[] = [
        0 as short,
        42 as short,
        (-15) as short,
        100 as short,
        Short.MAX_VALUE
      ];
      let expectedValues: float[] = [
        0.0f,
        42.0f,
        (-15.0f),
        100.0f,
        32767.0f
      ];
      let caseCount: int = 5;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let boxedValue: Short = new Short(testValues[caseIndex]);
        let actualResult: float = boxedValue.toFloat();
        expect(actualResult).assertEqual(expectedValues[caseIndex]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_0700
     * @tc.name testShortToPrimitiveValue007
     * @tc.desc Verify toDouble method converts short integer values to exact double results across full short range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: short[] = [
        0 as short,
        42 as short,
        (-15) as short,
        100 as short,
        Short.MAX_VALUE,
        Short.MIN_VALUE
      ];
      let expectedValues: double[] = [
        0.0,
        42.0,
        (-15.0),
        100.0,
        32767.0,
        (-32768.0)
      ];
      let caseCount: int = 6;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let boxedValue: Short = new Short(testValues[caseIndex]);
        let actualResult: double = boxedValue.toDouble();
        expect(actualResult).assertEqual(expectedValues[caseIndex]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_0800
     * @tc.name testShortToPrimitiveValue008
     * @tc.desc Verify toChar method converts short code points to expected char values for digits letters and symbols
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValues: short[] = [
        65 as short,
        97 as short,
        48 as short,
        32 as short,
        33 as short
      ];
      let expectedValues: char[] = [
        c'A',
        c'a',
        c'0',
        c' ',
        c'!'
      ];
      let caseCount: int = 5;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let boxedValue: Short = new Short(inputValues[caseIndex]);
        let actualResult: char = boxedValue.toChar();
        expect(actualResult).assertEqual(expectedValues[caseIndex]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_0900
     * @tc.name testShortToPrimitiveValue009
     * @tc.desc Verify repeated primitive conversions on the same Short instance return stable idempotent values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxedValue: Short = new Short(42 as short);
      let firstByteResult: byte = boxedValue.toByte();
      let secondByteResult: byte = boxedValue.toByte();
      let thirdByteResult: byte = boxedValue.toByte();
      let firstShortResult: short = boxedValue.toShort();
      let secondShortResult: short = boxedValue.toShort();
      let thirdShortResult: short = boxedValue.toShort();
      let firstIntResult: int = boxedValue.toInt();
      let secondIntResult: int = boxedValue.toInt();
      let thirdIntResult: int = boxedValue.toInt();
      let firstLongResult: long = boxedValue.toLong();
      let secondLongResult: long = boxedValue.toLong();
      let thirdLongResult: long = boxedValue.toLong();
      let firstFloatResult: float = boxedValue.toFloat();
      let secondFloatResult: float = boxedValue.toFloat();
      let thirdFloatResult: float = boxedValue.toFloat();
      let firstDoubleResult: double = boxedValue.toDouble();
      let secondDoubleResult: double = boxedValue.toDouble();
      let thirdDoubleResult: double = boxedValue.toDouble();
      let firstCharResult: char = boxedValue.toChar();
      let secondCharResult: char = boxedValue.toChar();
      let thirdCharResult: char = boxedValue.toChar();
      expect(firstByteResult).assertEqual(42 as byte);
      expect(secondByteResult).assertEqual(firstByteResult);
      expect(thirdByteResult).assertEqual(secondByteResult);
      expect(firstShortResult).assertEqual(42 as short);
      expect(secondShortResult).assertEqual(firstShortResult);
      expect(thirdShortResult).assertEqual(secondShortResult);
      expect(firstIntResult).assertEqual(42);
      expect(secondIntResult).assertEqual(firstIntResult);
      expect(thirdIntResult).assertEqual(secondIntResult);
      expect(firstLongResult).assertEqual(Long.toLong(42));
      expect(secondLongResult).assertEqual(firstLongResult);
      expect(thirdLongResult).assertEqual(secondLongResult);
      expect(firstFloatResult).assertEqual(42.0f);
      expect(secondFloatResult).assertEqual(firstFloatResult);
      expect(thirdFloatResult).assertEqual(secondFloatResult);
      expect(firstDoubleResult).assertEqual(42.0);
      expect(secondDoubleResult).assertEqual(firstDoubleResult);
      expect(thirdDoubleResult).assertEqual(secondDoubleResult);
      expect(firstCharResult).assertEqual(c'*');
      expect(secondCharResult).assertEqual(firstCharResult);
      expect(thirdCharResult).assertEqual(secondCharResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_1000
     * @tc.name testShortToPrimitiveValue010
     * @tc.desc Verify independent Short instances storing the same value return identical primitive conversion results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBoxedValue: Short = new Short(100 as short);
      let secondBoxedValue: Short = new Short(100 as short);
      expect(firstBoxedValue.toByte()).assertEqual(secondBoxedValue.toByte());
      expect(firstBoxedValue.toShort()).assertEqual(secondBoxedValue.toShort());
      expect(firstBoxedValue.toInt()).assertEqual(secondBoxedValue.toInt());
      expect(firstBoxedValue.toLong()).assertEqual(secondBoxedValue.toLong());
      expect(firstBoxedValue.toFloat()).assertEqual(secondBoxedValue.toFloat());
      expect(firstBoxedValue.toDouble()).assertEqual(secondBoxedValue.toDouble());
      expect(firstBoxedValue.toChar()).assertEqual(secondBoxedValue.toChar());
      expect(firstBoxedValue.toByte()).assertEqual(100 as byte);
      expect(firstBoxedValue.toChar()).assertEqual(c'd');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_1100
     * @tc.name testShortToPrimitiveValue011
     * @tc.desc Verify primitive conversion methods do not mutate the stored Short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxedValue: Short = new Short(42 as short);
      let initialShortValue: short = boxedValue.toShort();
      let initialIntValue: int = boxedValue.toInt();
      let initialLongValue: long = boxedValue.toLong();
      let byteResult: byte = boxedValue.toByte();
      let intResult: int = boxedValue.toInt();
      let longResult: long = boxedValue.toLong();
      let floatResult: float = boxedValue.toFloat();
      let doubleResult: double = boxedValue.toDouble();
      let charResult: char = boxedValue.toChar();
      let finalShortValue: short = boxedValue.toShort();
      expect(byteResult).assertEqual(42 as byte);
      expect(intResult).assertEqual(initialIntValue);
      expect(longResult).assertEqual(initialLongValue);
      expect(floatResult).assertEqual(42.0f);
      expect(doubleResult).assertEqual(42.0);
      expect(charResult).assertEqual(c'*');
      expect(finalShortValue).assertEqual(initialShortValue);
      expect(boxedValue.toShort()).assertEqual(42 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_1200
     * @tc.name testShortToPrimitiveValue012
     * @tc.desc Verify toByte preserves sign for byte-range positive negative and zero Short values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInstance: Short = new Short(50 as short);
      let negativeInstance: Short = new Short((-50) as short);
      let zeroInstance: Short = new Short(0 as short);
      let positiveByteResult: byte = positiveInstance.toByte();
      let negativeByteResult: byte = negativeInstance.toByte();
      let zeroByteResult: byte = zeroInstance.toByte();
      expect(positiveByteResult).assertEqual(50 as byte);
      expect(negativeByteResult).assertEqual((-50) as byte);
      expect(zeroByteResult).assertEqual(0 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_1300
     * @tc.name testShortToPrimitiveValue013
     * @tc.desc Verify integer and floating primitive conversions keep cross-type mathematical consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxedValue: Short = new Short(42 as short);
      let shortResult: short = boxedValue.toShort();
      let intResult: int = boxedValue.toInt();
      let longResult: long = boxedValue.toLong();
      let floatResult: float = boxedValue.toFloat();
      let doubleResult: double = boxedValue.toDouble();
      expect(shortResult).assertEqual(42 as short);
      expect(intResult).assertEqual(42);
      expect(longResult).assertEqual(Long.toLong(42));
      expect(floatResult).assertEqual(42.0f);
      expect(doubleResult).assertEqual(42.0);
      expect(intResult).assertEqual(42);
      expect(longResult).assertEqual(Long.toLong(intResult));
      expect(floatResult).assertEqual(42.0f);
      expect(doubleResult).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_1400
     * @tc.name testShortToPrimitiveValue014
     * @tc.desc Verify numeric primitive conversions preserve consistency for multiple Short values including boundaries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: short[] = [
        0 as short,
        1 as short,
        (-1) as short,
        100 as short,
        (-128) as short,
        Short.MAX_VALUE,
        Short.MIN_VALUE,
        32766 as short,
        (-32767) as short
      ];
      let expectedIntValues: int[] = [
        0,
        1,
        -1,
        100,
        -128,
        32767,
        -32768,
        32766,
        -32767
      ];
      let expectedLongValues: long[] = [
        Long.toLong(0),
        Long.toLong(1),
        Long.toLong(-1),
        Long.toLong(100),
        Long.toLong(-128),
        Long.toLong(32767),
        Long.toLong(-32768),
        Long.toLong(32766),
        Long.toLong(-32767)
      ];
      let expectedFloatValues: float[] = [
        0.0f,
        1.0f,
        (-1.0f),
        100.0f,
        (-128.0f),
        32767.0f,
        (-32768.0f),
        32766.0f,
        (-32767.0f)
      ];
      let expectedDoubleValues: double[] = [
        0.0,
        1.0,
        (-1.0),
        100.0,
        (-128.0),
        32767.0,
        (-32768.0),
        32766.0,
        (-32767.0)
      ];
      let caseCount: int = 9;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let boxedValue: Short = new Short(testValues[caseIndex]);
        let shortResult: short = boxedValue.toShort();
        let intResult: int = boxedValue.toInt();
        let longResult: long = boxedValue.toLong();
        let floatResult: float = boxedValue.toFloat();
        let doubleResult: double = boxedValue.toDouble();
        expect(shortResult).assertEqual(testValues[caseIndex]);
        expect(intResult).assertEqual(expectedIntValues[caseIndex]);
        expect(longResult).assertEqual(expectedLongValues[caseIndex]);
        expect(floatResult).assertEqual(expectedFloatValues[caseIndex]);
        expect(doubleResult).assertEqual(expectedDoubleValues[caseIndex]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_1500
     * @tc.name testShortToPrimitiveValue015
     * @tc.desc Verify direct toByte result matches indirect conversion chain for byte-range Short values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteRangeValues: short[] = [
        0 as short,
        42 as short,
        (-1) as short,
        127 as short,
        (-128) as short
      ];
      let caseCount: int = 5;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let boxedValue: Short = new Short(byteRangeValues[caseIndex]);
        let directByteResult: byte = boxedValue.toByte();
        let intermediateShortResult: short = boxedValue.toShort();
        let intermediateIntResult: int = intermediateShortResult;
        let indirectByteResult: byte = Int.toByte(intermediateIntResult);
        expect(directByteResult).assertEqual(indirectByteResult);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_1600
     * @tc.name testShortToPrimitiveValue016
     * @tc.desc Verify every primitive conversion method on one positive Short instance returns its expected concrete result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxedValue: Short = new Short(42 as short);
      let byteResult: byte = boxedValue.toByte();
      let shortResult: short = boxedValue.toShort();
      let intResult: int = boxedValue.toInt();
      let longResult: long = boxedValue.toLong();
      let floatResult: float = boxedValue.toFloat();
      let doubleResult: double = boxedValue.toDouble();
      let charResult: char = boxedValue.toChar();
      expect(byteResult).assertEqual(42 as byte);
      expect(shortResult).assertEqual(42 as short);
      expect(intResult).assertEqual(42);
      expect(longResult).assertEqual(Long.toLong(42));
      expect(floatResult).assertEqual(42.0f);
      expect(doubleResult).assertEqual(42.0);
      expect(charResult).assertEqual(c'*');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_1700
     * @tc.name testShortToPrimitiveValue017
     * @tc.desc Verify every primitive conversion method on one negative Short instance returns its expected concrete result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxedValue: Short = new Short((-1) as short);
      let byteResult: byte = boxedValue.toByte();
      let shortResult: short = boxedValue.toShort();
      let intResult: int = boxedValue.toInt();
      let longResult: long = boxedValue.toLong();
      let floatResult: float = boxedValue.toFloat();
      let doubleResult: double = boxedValue.toDouble();
      let charResult: char = boxedValue.toChar();
      expect(byteResult).assertEqual((-1) as byte);
      expect(shortResult).assertEqual((-1) as short);
      expect(intResult).assertEqual(-1);
      expect(longResult).assertEqual(Long.toLong(-1));
      expect(floatResult).assertEqual((-1.0f));
      expect(doubleResult).assertEqual((-1.0));
      expect(charResult).assertEqual(c'\uFFFF');
    });
  });
}
