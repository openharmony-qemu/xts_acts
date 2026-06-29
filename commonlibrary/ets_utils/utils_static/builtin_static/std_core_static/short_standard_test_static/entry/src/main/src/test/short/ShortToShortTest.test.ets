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

function invokeShortToShortInFunction(inputValue: short): short {
  return Short.toShort(inputValue);
}

export default function shortToShortTest(): void {
  describe('ShortToShortTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_0100
     * @tc.name testShortToShort001
     * @tc.desc Verify static toShort preserves a positive short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInput: short = 100 as short;
      let actualResult: short = Short.toShort(positiveInput);
      expect(actualResult).assertEqual(positiveInput);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_0200
     * @tc.name testShortToShort002
     * @tc.desc Verify static toShort preserves zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroInput: short = 0 as short;
      let actualResult: short = Short.toShort(zeroInput);
      expect(actualResult).assertEqual(zeroInput);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_0300
     * @tc.name testShortToShort003
     * @tc.desc Verify static toShort preserves a negative short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeInput: short = (-1) as short;
      let actualResult: short = Short.toShort(negativeInput);
      expect(actualResult).assertEqual(negativeInput);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_0400
     * @tc.name testShortToShort004
     * @tc.desc Verify static toShort preserves Short.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minBoundaryInput: short = Short.MIN_VALUE;
      let actualResult: short = Short.toShort(minBoundaryInput);
      expect(actualResult).assertEqual(minBoundaryInput);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_0500
     * @tc.name testShortToShort005
     * @tc.desc Verify static toShort preserves Short.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxBoundaryInput: short = Short.MAX_VALUE;
      let actualResult: short = Short.toShort(maxBoundaryInput);
      expect(actualResult).assertEqual(maxBoundaryInput);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_0600
     * @tc.name testShortToShort006
     * @tc.desc Verify static toShort preserves the adjacent value below Short.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let adjacentMaxInput: short = 32766 as short;
      let actualResult: short = Short.toShort(adjacentMaxInput);
      expect(actualResult).assertEqual(adjacentMaxInput);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_0700
     * @tc.name testShortToShort007
     * @tc.desc Verify static toShort preserves the adjacent value above Short.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let adjacentMinInput: short = (-32767) as short;
      let actualResult: short = Short.toShort(adjacentMinInput);
      expect(actualResult).assertEqual(adjacentMinInput);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_0800
     * @tc.name testShortToShort008
     * @tc.desc Verify static toShort returns a short type while preserving value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = 42 as short;
      let actualResult: short = Short.toShort(inputValue);
      let actualType: string = typeof actualResult;
      expect(actualType).assertEqual('short');
      expect(actualResult).assertEqual(inputValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_0900
     * @tc.name testShortToShort009
     * @tc.desc Verify static toShort preserves a direct literal argument through the Short class name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let directLiteralResult: short = Short.toShort(99 as short);
      expect(directLiteralResult).assertEqual(99 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_1000
     * @tc.name testShortToShort010
     * @tc.desc Verify static toShort preserves value when invoked through a helper function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let helperInput: short = 42 as short;
      let directResult: short = Short.toShort(helperInput);
      let helperResult: short = invokeShortToShortInFunction(helperInput);
      expect(directResult).assertEqual(helperInput);
      expect(helperResult).assertEqual(helperInput);
      expect(helperResult).assertEqual(directResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_1100
     * @tc.name testShortToShort011
     * @tc.desc Verify repeated static toShort invocations preserve a negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let repeatedInput: short = (-1) as short;
      let firstCallResult: short = Short.toShort(repeatedInput);
      let secondCallResult: short = Short.toShort(repeatedInput);
      let thirdCallResult: short = Short.toShort(repeatedInput);
      expect(firstCallResult).assertEqual(repeatedInput);
      expect(secondCallResult).assertEqual(repeatedInput);
      expect(thirdCallResult).assertEqual(repeatedInput);
      expect(secondCallResult).assertEqual(firstCallResult);
      expect(thirdCallResult).assertEqual(secondCallResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_1200
     * @tc.name testShortToShort012
     * @tc.desc Verify static toShort returns identical results for equal values from independent variables
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let primaryInput: short = 256 as short;
      let secondaryInput: short = 256 as short;
      let primaryResult: short = Short.toShort(primaryInput);
      let secondaryResult: short = Short.toShort(secondaryInput);
      expect(primaryResult).assertEqual(primaryInput);
      expect(secondaryResult).assertEqual(secondaryInput);
      expect(primaryResult).assertEqual(secondaryResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_1300
     * @tc.name testShortToShort013
     * @tc.desc Verify instance toShort matches static toShort for a normal short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValue: short = 42 as short;
      let boxedValue: Short = new Short(sourceValue);
      let instanceResult: short = boxedValue.toShort();
      let staticResult: short = Short.toShort(sourceValue);
      expect(instanceResult).assertEqual(sourceValue);
      expect(staticResult).assertEqual(sourceValue);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_1400
     * @tc.name testShortToShort014
     * @tc.desc Verify instance toShort matches static toShort for Short.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValue: short = Short.MIN_VALUE;
      let boxedValue: Short = new Short(sourceValue);
      let instanceResult: short = boxedValue.toShort();
      let staticResult: short = Short.toShort(sourceValue);
      expect(instanceResult).assertEqual(sourceValue);
      expect(staticResult).assertEqual(sourceValue);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_1500
     * @tc.name testShortToShort015
     * @tc.desc Verify instance toShort matches static toShort for Short.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValue: short = Short.MAX_VALUE;
      let boxedValue: Short = new Short(sourceValue);
      let instanceResult: short = boxedValue.toShort();
      let staticResult: short = Short.toShort(sourceValue);
      expect(instanceResult).assertEqual(sourceValue);
      expect(staticResult).assertEqual(sourceValue);
      expect(instanceResult).assertEqual(staticResult);
    });
  });
}
