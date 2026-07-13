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

export default function shortToStringTest(): void {
  describe('ShortToStringTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_0100
     * @tc.name testShortToString001
     * @tc.desc Verify static toString method with positive short value for correct decimal string conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = 123 as short;
      let actualResult: string = Short.toString(inputValue);
      expect(actualResult).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_0200
     * @tc.name testShortToString002
     * @tc.desc Verify static toString method with zero short value for returning decimal string 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroValue: short = 0 as short;
      let actualResult: string = Short.toString(zeroValue);
      expect(actualResult).assertEqual('0');
      expect(actualResult.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_0300
     * @tc.name testShortToString003
     * @tc.desc Verify static toString method with negative short value for correct signed decimal string conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeValue: short = (-100) as short;
      let actualResult: string = Short.toString(negativeValue);
      expect(actualResult).assertEqual('-100');
      expect(actualResult.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_0400
     * @tc.name testShortToString004
     * @tc.desc Verify static toString method with Short.MIN_VALUE for correct boundary signed string conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minBoundaryValue: short = Short.MIN_VALUE;
      let actualResult: string = Short.toString(minBoundaryValue);
      expect(actualResult).assertEqual('-32768');
      expect(actualResult.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_0500
     * @tc.name testShortToString005
     * @tc.desc Verify static toString method with Short.MAX_VALUE for correct boundary decimal string conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxBoundaryValue: short = Short.MAX_VALUE;
      let actualResult: string = Short.toString(maxBoundaryValue);
      expect(actualResult).assertEqual('32767');
      expect(actualResult.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_0600
     * @tc.name testShortToString006
     * @tc.desc Verify static toString method sign handling with positive negative and zero short values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInputValue: short = 50 as short;
      let negativeInputValue: short = (-50) as short;
      let zeroInputValue: short = 0 as short;
      let positiveResult: string = Short.toString(positiveInputValue);
      let negativeResult: string = Short.toString(negativeInputValue);
      let zeroResult: string = Short.toString(zeroInputValue);
      expect(positiveResult).assertEqual('50');
      expect(negativeResult).assertEqual('-50');
      expect(zeroResult).assertEqual('0');
      expect(positiveResult.length).assertEqual(2);
      expect(negativeResult.length).assertEqual(3);
      expect(zeroResult.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_0700
     * @tc.name testShortToString007
     * @tc.desc Verify static toString method across multiple digit lengths for correct string content and length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let singleDigitValue: short = 5 as short;
      let doubleDigitValue: short = 42 as short;
      let tripleDigitValue: short = 999 as short;
      let quadrupleDigitValue: short = 1234 as short;
      let quintupleDigitValue: short = Short.MAX_VALUE;
      let singleDigitResult: string = Short.toString(singleDigitValue);
      let doubleDigitResult: string = Short.toString(doubleDigitValue);
      let tripleDigitResult: string = Short.toString(tripleDigitValue);
      let quadrupleDigitResult: string = Short.toString(quadrupleDigitValue);
      let quintupleDigitResult: string = Short.toString(quintupleDigitValue);
      expect(singleDigitResult).assertEqual('5');
      expect(singleDigitResult.length).assertEqual(1);
      expect(doubleDigitResult).assertEqual('42');
      expect(doubleDigitResult.length).assertEqual(2);
      expect(tripleDigitResult).assertEqual('999');
      expect(tripleDigitResult.length).assertEqual(3);
      expect(quadrupleDigitResult).assertEqual('1234');
      expect(quadrupleDigitResult.length).assertEqual(4);
      expect(quintupleDigitResult).assertEqual('32767');
      expect(quintupleDigitResult.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_0800
     * @tc.name testShortToString008
     * @tc.desc Verify static toString method idempotency with repeated identical positive short input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = 123 as short;
      let firstCallResult: string = Short.toString(inputValue);
      let secondCallResult: string = Short.toString(inputValue);
      let thirdCallResult: string = Short.toString(inputValue);
      expect(firstCallResult).assertEqual('123');
      expect(secondCallResult).assertEqual('123');
      expect(thirdCallResult).assertEqual('123');
      expect(secondCallResult).assertEqual(firstCallResult);
      expect(thirdCallResult).assertEqual(secondCallResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_0900
     * @tc.name testShortToString009
     * @tc.desc Verify static toString method idempotency with repeated identical negative short input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = (-256) as short;
      let firstCallResult: string = Short.toString(inputValue);
      let secondCallResult: string = Short.toString(inputValue);
      let thirdCallResult: string = Short.toString(inputValue);
      expect(firstCallResult).assertEqual('-256');
      expect(secondCallResult).assertEqual('-256');
      expect(thirdCallResult).assertEqual('-256');
      expect(secondCallResult).assertEqual(firstCallResult);
      expect(thirdCallResult).assertEqual(secondCallResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_1000
     * @tc.name testShortToString010
     * @tc.desc Verify static toString method idempotency with repeated zero short input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroValue: short = 0 as short;
      let firstCallResult: string = Short.toString(zeroValue);
      let secondCallResult: string = Short.toString(zeroValue);
      let thirdCallResult: string = Short.toString(zeroValue);
      expect(firstCallResult).assertEqual('0');
      expect(secondCallResult).assertEqual('0');
      expect(thirdCallResult).assertEqual('0');
      expect(secondCallResult).assertEqual(firstCallResult);
      expect(thirdCallResult).assertEqual(secondCallResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_1100
     * @tc.name testShortToString011
     * @tc.desc Verify static toString method idempotency with repeated Short.MAX_VALUE input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxBoundaryValue: short = Short.MAX_VALUE;
      let firstCallResult: string = Short.toString(maxBoundaryValue);
      let secondCallResult: string = Short.toString(maxBoundaryValue);
      let thirdCallResult: string = Short.toString(maxBoundaryValue);
      expect(firstCallResult).assertEqual('32767');
      expect(secondCallResult).assertEqual('32767');
      expect(thirdCallResult).assertEqual('32767');
      expect(secondCallResult).assertEqual(firstCallResult);
      expect(thirdCallResult).assertEqual(secondCallResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_1200
     * @tc.name testShortToString012
     * @tc.desc Verify static toString method idempotency with repeated Short.MIN_VALUE input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minBoundaryValue: short = Short.MIN_VALUE;
      let firstCallResult: string = Short.toString(minBoundaryValue);
      let secondCallResult: string = Short.toString(minBoundaryValue);
      let thirdCallResult: string = Short.toString(minBoundaryValue);
      expect(firstCallResult).assertEqual('-32768');
      expect(secondCallResult).assertEqual('-32768');
      expect(thirdCallResult).assertEqual('-32768');
      expect(secondCallResult).assertEqual(firstCallResult);
      expect(thirdCallResult).assertEqual(secondCallResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_1300
     * @tc.name testShortToString013
     * @tc.desc Verify static toString method has no side effects across multiple consecutive invocations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = 999 as short;
      let beforeLoopResult: string = Short.toString(inputValue);
      expect(beforeLoopResult).assertEqual('999');
      let maxIterations: int = 5;
      for (let iterationIndex: int = 0; iterationIndex < maxIterations; iterationIndex++) {
        let currentLoopResult: string = Short.toString(inputValue);
        expect(currentLoopResult).assertEqual('999');
        expect(currentLoopResult).assertEqual(beforeLoopResult);
      }
      let afterLoopResult: string = Short.toString(inputValue);
      expect(afterLoopResult).assertEqual('999');
      expect(afterLoopResult).assertEqual(beforeLoopResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_1400
     * @tc.name testShortToString014
     * @tc.desc Verify instance toString method with multiple Short instances for independent decimal strings
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInstance: Short = new Short(10 as short);
      let negativeInstance: Short = new Short((-20) as short);
      let zeroInstance: Short = new Short(0 as short);
      let positiveResult: String = positiveInstance.toString();
      let negativeResult: String = negativeInstance.toString();
      let zeroResult: String = zeroInstance.toString();
      expect(positiveResult).assertEqual('10');
      expect(negativeResult).assertEqual('-20');
      expect(zeroResult).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_1500
     * @tc.name testShortToString015
     * @tc.desc Verify instance toString method with positive internal value for correct decimal string content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInstance: Short = new Short(123 as short);
      let actualResult: String = positiveInstance.toString();
      expect(actualResult).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_1600
     * @tc.name testShortToString016
     * @tc.desc Verify instance toString method with zero internal value returns decimal string 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroInstance: Short = new Short(0 as short);
      let actualResult: String = zeroInstance.toString();
      expect(actualResult).assertEqual('0');
      expect(actualResult.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_1700
     * @tc.name testShortToString017
     * @tc.desc Verify instance toString method with negative internal value returns signed decimal string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeInstance: Short = new Short((-100) as short);
      let actualResult: String = negativeInstance.toString();
      expect(actualResult).assertEqual('-100');
      expect(actualResult.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_1800
     * @tc.name testShortToString018
     * @tc.desc Verify instance toString method with Short.MIN_VALUE for correct boundary decimal string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minBoundaryInstance: Short = new Short(Short.MIN_VALUE);
      let actualResult: String = minBoundaryInstance.toString();
      expect(actualResult).assertEqual('-32768');
      expect(actualResult.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_1900
     * @tc.name testShortToString019
     * @tc.desc Verify instance toString method with Short.MAX_VALUE for correct boundary decimal string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxBoundaryInstance: Short = new Short(Short.MAX_VALUE);
      let actualResult: String = maxBoundaryInstance.toString();
      expect(actualResult).assertEqual('32767');
      expect(actualResult.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_2000
     * @tc.name testShortToString020
     * @tc.desc Verify instance toString method with five digit positive value for exact decimal string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fiveDigitInstance: Short = new Short(12345 as short);
      let actualResult: String = fiveDigitInstance.toString();
      expect(actualResult).assertEqual('12345');
      expect(actualResult.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_2100
     * @tc.name testShortToString021
     * @tc.desc Verify instance toString method with single digit positive value for decimal string without leading zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let singleDigitInstance: Short = new Short(5 as short);
      let actualResult: String = singleDigitInstance.toString();
      expect(actualResult).assertEqual('5');
      expect(actualResult.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_2200
     * @tc.name testShortToString022
     * @tc.desc Verify instance toString method idempotency with positive Short instance across consecutive calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInstance: Short = new Short(456 as short);
      let firstResult: String = positiveInstance.toString();
      let secondResult: String = positiveInstance.toString();
      let thirdResult: String = positiveInstance.toString();
      expect(firstResult).assertEqual('456');
      expect(secondResult).assertEqual('456');
      expect(thirdResult).assertEqual('456');
      expect(secondResult).assertEqual(firstResult);
      expect(thirdResult).assertEqual(secondResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_2300
     * @tc.name testShortToString023
     * @tc.desc Verify instance toString method idempotency with negative Short instance across consecutive calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeInstance: Short = new Short((-789) as short);
      let firstResult: String = negativeInstance.toString();
      let secondResult: String = negativeInstance.toString();
      let thirdResult: String = negativeInstance.toString();
      expect(firstResult).assertEqual('-789');
      expect(secondResult).assertEqual('-789');
      expect(thirdResult).assertEqual('-789');
      expect(secondResult).assertEqual(firstResult);
      expect(thirdResult).assertEqual(secondResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_2400
     * @tc.name testShortToString024
     * @tc.desc Verify instance toString method idempotency with zero Short instance across consecutive calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroInstance: Short = new Short(0 as short);
      let firstResult: String = zeroInstance.toString();
      let secondResult: String = zeroInstance.toString();
      let thirdResult: String = zeroInstance.toString();
      expect(firstResult).assertEqual('0');
      expect(secondResult).assertEqual('0');
      expect(thirdResult).assertEqual('0');
      expect(secondResult).assertEqual(firstResult);
      expect(thirdResult).assertEqual(secondResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_2500
     * @tc.name testShortToString025
     * @tc.desc Verify instance toString method idempotency with Short.MAX_VALUE across consecutive calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxBoundaryInstance: Short = new Short(Short.MAX_VALUE);
      let firstResult: String = maxBoundaryInstance.toString();
      let secondResult: String = maxBoundaryInstance.toString();
      let thirdResult: String = maxBoundaryInstance.toString();
      expect(firstResult).assertEqual('32767');
      expect(secondResult).assertEqual('32767');
      expect(thirdResult).assertEqual('32767');
      expect(secondResult).assertEqual(firstResult);
      expect(thirdResult).assertEqual(secondResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_2600
     * @tc.name testShortToString026
     * @tc.desc Verify instance toString method idempotency with Short.MIN_VALUE across consecutive calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minBoundaryInstance: Short = new Short(Short.MIN_VALUE);
      let firstResult: String = minBoundaryInstance.toString();
      let secondResult: String = minBoundaryInstance.toString();
      let thirdResult: String = minBoundaryInstance.toString();
      expect(firstResult).assertEqual('-32768');
      expect(secondResult).assertEqual('-32768');
      expect(thirdResult).assertEqual('-32768');
      expect(secondResult).assertEqual(firstResult);
      expect(thirdResult).assertEqual(secondResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_2700
     * @tc.name testShortToString027
     * @tc.desc Verify instance toString method is read only and repeated calls do not mutate stored short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: Short = new Short(999 as short);
      let initialStoredValue: short = instance.toShort();
      let beforeLoopResult: String = instance.toString();
      expect(beforeLoopResult).assertEqual('999');
      let maxIterations: int = 5;
      for (let iterationIndex: int = 0; iterationIndex < maxIterations; iterationIndex++) {
        let currentResult: String = instance.toString();
        expect(currentResult).assertEqual('999');
      }
      let afterLoopResult: String = instance.toString();
      let storedValueAfterCalls: short = instance.toShort();
      expect(afterLoopResult).assertEqual('999');
      expect(afterLoopResult).assertEqual(beforeLoopResult);
      expect(storedValueAfterCalls).assertEqual(initialStoredValue);
      expect(storedValueAfterCalls).assertEqual(999 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_2800
     * @tc.name testShortToString028
     * @tc.desc Verify instance toString method with multiple Short instances for independent idempotent returns
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInstance: Short = new Short(100 as short);
      let negativeInstance: Short = new Short((-200) as short);
      let positiveFirstResult: String = positiveInstance.toString();
      let positiveSecondResult: String = positiveInstance.toString();
      let positiveThirdResult: String = positiveInstance.toString();
      let negativeFirstResult: String = negativeInstance.toString();
      let negativeSecondResult: String = negativeInstance.toString();
      let negativeThirdResult: String = negativeInstance.toString();
      expect(positiveFirstResult).assertEqual('100');
      expect(positiveSecondResult).assertEqual('100');
      expect(positiveThirdResult).assertEqual('100');
      expect(negativeFirstResult).assertEqual('-200');
      expect(negativeSecondResult).assertEqual('-200');
      expect(negativeThirdResult).assertEqual('-200');
      expect(positiveSecondResult).assertEqual(positiveFirstResult);
      expect(positiveThirdResult).assertEqual(positiveSecondResult);
      expect(negativeSecondResult).assertEqual(negativeFirstResult);
      expect(negativeThirdResult).assertEqual(negativeSecondResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_2900
     * @tc.name testShortToString029
     * @tc.desc Verify instance toString result is consistent with static Short.toString for same short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = 12345 as short;
      let instance: Short = new Short(inputValue);
      let instanceResult: String = instance.toString();
      let staticResult: string = Short.toString(inputValue);
      expect(instanceResult).assertEqual('12345');
      expect(staticResult).assertEqual('12345');
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_3000
     * @tc.name testShortToString030
     * @tc.desc Verify toString symmetry for same value Short instances and reflexivity across repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstInstance: Short = new Short(321 as short);
      let secondInstance: Short = new Short(321 as short);
      let firstInitialResult: String = firstInstance.toString();
      let firstRepeatedResult: String = firstInstance.toString();
      let secondResult: String = secondInstance.toString();
      expect(firstInitialResult).assertEqual('321');
      expect(firstRepeatedResult).assertEqual('321');
      expect(secondResult).assertEqual('321');
      expect(firstRepeatedResult).assertEqual(firstInitialResult);
      expect(secondResult).assertEqual(firstInitialResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_3100
     * @tc.name testShortToString031
     * @tc.desc Verify instance toString method with valid radix values 2 8 10 16 and 36 for short value 255
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let radixSourceValue: short = 255 as short;
      let radixInstance: Short = new Short(radixSourceValue);
      let binaryResult: string = radixInstance.toString(2);
      let octalResult: string = radixInstance.toString(8);
      let decimalResult: string = radixInstance.toString(10);
      let hexResult: string = radixInstance.toString(16);
      let base36Result: string = radixInstance.toString(36);
      expect(binaryResult).assertEqual('11111111');
      expect(octalResult).assertEqual('377');
      expect(decimalResult).assertEqual('255');
      expect(hexResult).assertEqual('ff');
      expect(base36Result).assertEqual('73');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_3200
     * @tc.name testShortToString032
     * @tc.desc Verify instance toString method with positive zero and negative short values across decimal and hex radices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInstance: Short = new Short(42 as short);
      let zeroInstance: Short = new Short(0 as short);
      let negativeInstance: Short = new Short((-1) as short);
      let positiveDecimalResult: string = positiveInstance.toString(10);
      let positiveHexResult: string = positiveInstance.toString(16);
      let zeroDecimalResult: string = zeroInstance.toString(10);
      let zeroBinaryResult: string = zeroInstance.toString(2);
      let negativeDecimalResult: string = negativeInstance.toString(10);
      let negativeHexResult: string = negativeInstance.toString(16);
      expect(positiveDecimalResult).assertEqual('42');
      expect(positiveHexResult).assertEqual('2a');
      expect(zeroDecimalResult).assertEqual('0');
      expect(zeroBinaryResult).assertEqual('0');
      expect(negativeDecimalResult).assertEqual('-1');
      expect(negativeHexResult).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_3300
     * @tc.name testShortToString033
     * @tc.desc Verify instance toString method with typical and boundary short values across hex octal and decimal radices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let typicalInstance: Short = new Short(100 as short);
      let minBoundaryInstance: Short = new Short(Short.MIN_VALUE);
      let maxBoundaryInstance: Short = new Short(Short.MAX_VALUE);
      let typicalHexResult: string = typicalInstance.toString(16);
      let typicalOctalResult: string = typicalInstance.toString(8);
      let minDecimalResult: string = minBoundaryInstance.toString(10);
      let minHexResult: string = minBoundaryInstance.toString(16);
      let maxDecimalResult: string = maxBoundaryInstance.toString(10);
      let maxHexResult: string = maxBoundaryInstance.toString(16);
      expect(typicalHexResult).assertEqual('64');
      expect(typicalOctalResult).assertEqual('144');
      expect(minDecimalResult).assertEqual('-32768');
      expect(minHexResult).assertEqual('-8000');
      expect(maxDecimalResult).assertEqual('32767');
      expect(maxHexResult).assertEqual('7fff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_3400
     * @tc.name testShortToString034
     * @tc.desc Verify instance toString method with radix 36 for max and min boundary short values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxBoundaryInstance: Short = new Short(Short.MAX_VALUE);
      let minBoundaryInstance: Short = new Short(Short.MIN_VALUE);
      let maxBase36Result: string = maxBoundaryInstance.toString(36);
      let minBase36Result: string = minBoundaryInstance.toString(36);
      expect(maxBase36Result).assertEqual('pa7');
      expect(minBase36Result).assertEqual('-pa8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_3500
     * @tc.name testShortToString035
     * @tc.desc Verify instance toString method throws RangeError when radix is below the minimum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let radixInstance: Short = new Short(100 as short);
      try {
        radixInstance.toString(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_3600
     * @tc.name testShortToString036
     * @tc.desc Verify instance toString method throws RangeError when radix exceeds the maximum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let radixInstance: Short = new Short(100 as short);
      try {
        radixInstance.toString(37);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_3700
     * @tc.name testShortToString037
     * @tc.desc Verify instance toString method throws RangeError when radix is zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let radixInstance: Short = new Short(100 as short);
      try {
        radixInstance.toString(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_3800
     * @tc.name testShortToString038
     * @tc.desc Verify instance toString method throws RangeError when radix is negative
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let radixInstance: Short = new Short(100 as short);
      try {
        radixInstance.toString(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_3900
     * @tc.name testShortToString039
     * @tc.desc Verify instance toString method throws RangeError when radix is Short.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let radixInstance: Short = new Short(100 as short);
      try {
        radixInstance.toString(-32768);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_4000
     * @tc.name testShortToString040
     * @tc.desc Verify instance toString method throws RangeError when radix is Short.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let radixInstance: Short = new Short(100 as short);
      try {
        radixInstance.toString(32767);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_4100
     * @tc.name testShortToString041
     * @tc.desc Verify instance toString method throws RangeError when radix is a large invalid value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let radixInstance: Short = new Short(100 as short);
      try {
        radixInstance.toString(100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_4200
     * @tc.name testShortToString042
     * @tc.desc Verify instance toString method is idempotent for repeated binary conversion of the same short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let radixInstance: Short = new Short(42 as short);
      let firstBinaryResult: string = radixInstance.toString(2);
      let secondBinaryResult: string = radixInstance.toString(2);
      let thirdBinaryResult: string = radixInstance.toString(2);
      expect(firstBinaryResult).assertEqual('101010');
      expect(secondBinaryResult).assertEqual('101010');
      expect(thirdBinaryResult).assertEqual('101010');
      expect(secondBinaryResult).assertEqual(firstBinaryResult);
      expect(thirdBinaryResult).assertEqual(secondBinaryResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_4300
     * @tc.name testShortToString043
     * @tc.desc Verify instance toString method returns consistent decimal strings for independent instances with the same value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstInstance: Short = new Short(100 as short);
      let secondInstance: Short = new Short(100 as short);
      let thirdInstance: Short = new Short(100 as short);
      let firstDecimalResult: string = firstInstance.toString(10);
      let secondDecimalResult: string = secondInstance.toString(10);
      let thirdDecimalResult: string = thirdInstance.toString(10);
      expect(firstDecimalResult).assertEqual('100');
      expect(secondDecimalResult).assertEqual('100');
      expect(thirdDecimalResult).assertEqual('100');
      expect(secondDecimalResult).assertEqual(firstDecimalResult);
      expect(thirdDecimalResult).assertEqual(secondDecimalResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_4400
     * @tc.name testShortToString044
     * @tc.desc Verify instance toString method has no side effect after multiple valid radix conversions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let radixInstance: Short = new Short(42 as short);
      let storedValueBeforeCalls: short = radixInstance.toShort();
      let decimalResult: string = radixInstance.toString(10);
      let hexResult: string = radixInstance.toString(16);
      let binaryResult: string = radixInstance.toString(2);
      let octalResult: string = radixInstance.toString(8);
      let base36Result: string = radixInstance.toString(36);
      let storedValueAfterCalls: short = radixInstance.toShort();
      expect(decimalResult).assertEqual('42');
      expect(hexResult).assertEqual('2a');
      expect(binaryResult).assertEqual('101010');
      expect(octalResult).assertEqual('52');
      expect(base36Result).assertEqual('16');
      expect(storedValueBeforeCalls).assertEqual(storedValueAfterCalls);
      expect(storedValueAfterCalls).assertEqual(42 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_4500
     * @tc.name testShortToString045
     * @tc.desc Verify instance toString method with radix 10 returns the same result as no argument toString
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInstance: Short = new Short(123 as short);
      let zeroInstance: Short = new Short(0 as short);
      let negativeInstance: Short = new Short((-1) as short);
      let positiveNoRadixResult: String = positiveInstance.toString();
      let positiveRadixResult: string = positiveInstance.toString(10);
      let zeroNoRadixResult: String = zeroInstance.toString();
      let zeroRadixResult: string = zeroInstance.toString(10);
      let negativeNoRadixResult: String = negativeInstance.toString();
      let negativeRadixResult: string = negativeInstance.toString(10);
      expect(positiveRadixResult).assertEqual(positiveNoRadixResult);
      expect(zeroRadixResult).assertEqual(zeroNoRadixResult);
      expect(negativeRadixResult).assertEqual(negativeNoRadixResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_4600
     * @tc.name testShortToString046
     * @tc.desc Verify instance toString method with minimum valid radix 2 for zero positive negative and boundary short values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroInstance: Short = new Short(0 as short);
      let oneInstance: Short = new Short(1 as short);
      let byteMaxInstance: Short = new Short(255 as short);
      let negativeOneInstance: Short = new Short((-1) as short);
      let maxBoundaryInstance: Short = new Short(Short.MAX_VALUE);
      let minBoundaryInstance: Short = new Short(Short.MIN_VALUE);
      let zeroBinaryResult: string = zeroInstance.toString(2);
      let oneBinaryResult: string = oneInstance.toString(2);
      let byteMaxBinaryResult: string = byteMaxInstance.toString(2);
      let negativeOneBinaryResult: string = negativeOneInstance.toString(2);
      let maxBinaryResult: string = maxBoundaryInstance.toString(2);
      let minBinaryResult: string = minBoundaryInstance.toString(2);
      expect(zeroBinaryResult).assertEqual('0');
      expect(oneBinaryResult).assertEqual('1');
      expect(byteMaxBinaryResult).assertEqual('11111111');
      expect(negativeOneBinaryResult).assertEqual('-1');
      expect(maxBinaryResult).assertEqual('111111111111111');
      expect(minBinaryResult).assertEqual('-1000000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_4700
     * @tc.name testShortToString047
     * @tc.desc Verify instance toString method with maximum valid radix 36 for digit and boundary short values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroInstance: Short = new Short(0 as short);
      let maxSingleDigitInstance: Short = new Short(35 as short);
      let firstTwoDigitInstance: Short = new Short(36 as short);
      let maxBoundaryInstance: Short = new Short(Short.MAX_VALUE);
      let minBoundaryInstance: Short = new Short(Short.MIN_VALUE);
      let zeroBase36Result: string = zeroInstance.toString(36);
      let maxSingleDigitResult: string = maxSingleDigitInstance.toString(36);
      let firstTwoDigitResult: string = firstTwoDigitInstance.toString(36);
      let maxBase36Result: string = maxBoundaryInstance.toString(36);
      let minBase36Result: string = minBoundaryInstance.toString(36);
      expect(zeroBase36Result).assertEqual('0');
      expect(maxSingleDigitResult).assertEqual('z');
      expect(firstTwoDigitResult).assertEqual('10');
      expect(maxBase36Result).assertEqual('pa7');
      expect(minBase36Result).assertEqual('-pa8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSTRING_4800
     * @tc.name testShortToString048
     * @tc.desc Verify instance toString method has no side effect after valid and invalid radix boundary calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToString048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let radixInstance: Short = new Short(255 as short);
      let storedValueBeforeCalls: short = radixInstance.toShort();
      let minRadixResult: string = radixInstance.toString(2);
      let maxRadixResult: string = radixInstance.toString(36);
      try {
        radixInstance.toString(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        radixInstance.toString(37);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let storedValueAfterCalls: short = radixInstance.toShort();
      expect(minRadixResult).assertEqual('11111111');
      expect(maxRadixResult).assertEqual('73');
      expect(storedValueBeforeCalls).assertEqual(storedValueAfterCalls);
      expect(storedValueAfterCalls).assertEqual(255 as short);
    });
  });
}
