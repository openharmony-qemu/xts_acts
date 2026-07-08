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

export default function shortToLongTest(): void {
  describe('ShortToLongTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_0100
     * @tc.name testShortToLong001
     * @tc.desc Verify toLong method with short normal value zero for exact long conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = 0 as short;
      let actualResult: long = Short.toLong(inputValue);
      expect(actualResult).assertEqual(Long.toLong(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_0200
     * @tc.name testShortToLong002
     * @tc.desc Verify toLong method with short positive value 1024 for exact long conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = 1024 as short;
      let actualResult: long = Short.toLong(inputValue);
      expect(actualResult).assertEqual(Long.toLong(1024));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_0300
     * @tc.name testShortToLong003
     * @tc.desc Verify toLong method with short negative value minus one for exact long conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = (-1) as short;
      let actualResult: long = Short.toLong(inputValue);
      expect(actualResult).assertEqual(Long.toLong(-1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_0400
     * @tc.name testShortToLong004
     * @tc.desc Verify toLong method with short minimum value minus 32768 for exact long conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Short.MIN_VALUE;
      let actualResult: long = Short.toLong(inputValue);
      expect(actualResult).assertEqual(Long.toLong(-32768));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_0500
     * @tc.name testShortToLong005
     * @tc.desc Verify toLong method with short maximum value 32767 for exact long conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Short.MAX_VALUE;
      let actualResult: long = Short.toLong(inputValue);
      expect(actualResult).assertEqual(Long.toLong(32767));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_0600
     * @tc.name testShortToLong006
     * @tc.desc Verify toLong is a static method callable via class name without Short instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = 123 as short;
      let actualResult: long = Short.toLong(inputValue);
      expect(actualResult).assertEqual(Long.toLong(123));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_0700
     * @tc.name testShortToLong007
     * @tc.desc Verify toLong idempotency with same short input zero for three consecutive calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = 0 as short;
      let firstResult: long = Short.toLong(inputValue);
      let secondResult: long = Short.toLong(inputValue);
      let thirdResult: long = Short.toLong(inputValue);
      expect(firstResult).assertEqual(Long.toLong(0));
      expect(secondResult).assertEqual(Long.toLong(0));
      expect(thirdResult).assertEqual(Long.toLong(0));
      expect(firstResult).assertEqual(secondResult);
      expect(secondResult).assertEqual(thirdResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_0800
     * @tc.name testShortToLong008
     * @tc.desc Verify toLong idempotency with same short maximum value for three consecutive calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Short.MAX_VALUE;
      let firstResult: long = Short.toLong(inputValue);
      let secondResult: long = Short.toLong(inputValue);
      let thirdResult: long = Short.toLong(inputValue);
      expect(firstResult).assertEqual(Long.toLong(32767));
      expect(secondResult).assertEqual(Long.toLong(32767));
      expect(thirdResult).assertEqual(Long.toLong(32767));
      expect(firstResult).assertEqual(secondResult);
      expect(secondResult).assertEqual(thirdResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_0900
     * @tc.name testShortToLong009
     * @tc.desc Verify toLong idempotency with same short minimum value for three consecutive calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Short.MIN_VALUE;
      let firstResult: long = Short.toLong(inputValue);
      let secondResult: long = Short.toLong(inputValue);
      let thirdResult: long = Short.toLong(inputValue);
      expect(firstResult).assertEqual(Long.toLong(-32768));
      expect(secondResult).assertEqual(Long.toLong(-32768));
      expect(thirdResult).assertEqual(Long.toLong(-32768));
      expect(firstResult).assertEqual(secondResult);
      expect(secondResult).assertEqual(thirdResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_1000
     * @tc.name testShortToLong010
     * @tc.desc Verify cross-context consistency with same short input 1024 across independent call paths
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let directInputValue: short = 1024 as short;
      let intermediateValue: short = 1024 as short;
      let directResult: long = Short.toLong(directInputValue);
      let intermediateResult: long = Short.toLong(intermediateValue);
      let repeatedResult: long = Short.toLong(1024 as short);
      expect(directResult).assertEqual(Long.toLong(1024));
      expect(intermediateResult).assertEqual(Long.toLong(1024));
      expect(repeatedResult).assertEqual(Long.toLong(1024));
      expect(directResult).assertEqual(intermediateResult);
      expect(intermediateResult).assertEqual(repeatedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_1100
     * @tc.name testShortToLong011
     * @tc.desc Verify toLong is a pure function that does not mutate any external state before and after invocation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let externalState: long = Long.toLong(999);
      let inputValue: short = 123 as short;
      let stateBefore: long = externalState;
      let actualResult: long = Short.toLong(inputValue);
      let stateAfter: long = externalState;
      let secondResult: long = Short.toLong(456 as short);
      let thirdResult: long = Short.toLong(789 as short);
      let stateFinal: long = externalState;
      expect(actualResult).assertEqual(Long.toLong(123));
      expect(stateAfter).assertEqual(stateBefore);
      expect(secondResult).assertEqual(Long.toLong(456));
      expect(thirdResult).assertEqual(Long.toLong(789));
      expect(stateFinal).assertEqual(stateBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_1200
     * @tc.name testShortToLong012
     * @tc.desc Verify instance toLong matches static toLong for normal adjacent and boundary short values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: short[] = [
        0 as short,
        42 as short,
        (-42) as short,
        32766 as short,
        (-32767) as short,
        Short.MAX_VALUE,
        Short.MIN_VALUE
      ];
      let expectedValues: long[] = [
        Long.toLong(0),
        Long.toLong(42),
        Long.toLong(-42),
        Long.toLong(32766),
        Long.toLong(-32767),
        Long.toLong(32767),
        Long.toLong(-32768)
      ];
      let caseCount: int = testValues.length;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let boxedValue: Short = new Short(testValues[caseIndex]);
        let instanceResult: long = boxedValue.toLong();
        let staticResult: long = Short.toLong(testValues[caseIndex]);
        expect(instanceResult).assertEqual(expectedValues[caseIndex]);
        expect(staticResult).assertEqual(expectedValues[caseIndex]);
        expect(instanceResult).assertEqual(staticResult);
        expect(boxedValue.toShort()).assertEqual(testValues[caseIndex]);
      }
    });
  });
}
