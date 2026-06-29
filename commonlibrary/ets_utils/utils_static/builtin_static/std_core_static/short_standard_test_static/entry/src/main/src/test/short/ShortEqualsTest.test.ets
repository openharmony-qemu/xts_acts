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

export default function shortEqualsTest(): void {
  describe('ShortEqualsTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_0100
     * @tc.name testShortEquals001
     * @tc.desc Verify equals method with identical boxed Short values for true return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftValue: Short = new Short(42 as short);
      let rightValue: Short = new Short(42 as short);
      let isEqual: boolean = leftValue.equals(rightValue);
      expect(isEqual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_0200
     * @tc.name testShortEquals002
     * @tc.desc Verify equals method with different boxed Short values for false return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftValue: Short = new Short(10 as short);
      let rightValue: Short = new Short(20 as short);
      let isEqual: boolean = leftValue.equals(rightValue);
      expect(isEqual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_0300
     * @tc.name testShortEquals003
     * @tc.desc Verify equals method with null argument for false return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxedValue: Short = new Short(100 as short);
      let isEqual: boolean = boxedValue.equals(null);
      expect(isEqual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_0400
     * @tc.name testShortEquals004
     * @tc.desc Verify equals method with undefined argument for false return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxedValue: Short = new Short(100 as short);
      let isEqual: boolean = boxedValue.equals(undefined);
      expect(isEqual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_0500
     * @tc.name testShortEquals005
     * @tc.desc Verify equals method with same numeric number argument for true return by value comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxedValue: Short = new Short(42 as short);
      let sameNumberArgument: number = 42;
      let isEqual: boolean = boxedValue.equals(sameNumberArgument);
      expect(isEqual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_0600
     * @tc.name testShortEquals006
     * @tc.desc Verify equals method with different numeric number argument for false return by value comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxedValue: Short = new Short(42 as short);
      let differentNumberArgument: number = 43;
      let isEqual: boolean = boxedValue.equals(differentNumberArgument);
      expect(isEqual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_0700
     * @tc.name testShortEquals007
     * @tc.desc Verify equals method with same primitive short argument for true return by value comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxedValue: Short = new Short(256 as short);
      let sameShortArgument: short = 256 as short;
      let isEqual: boolean = boxedValue.equals(sameShortArgument);
      expect(isEqual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_0800
     * @tc.name testShortEquals008
     * @tc.desc Verify equals method with different primitive short argument for false return by value comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxedValue: Short = new Short(256 as short);
      let differentShortArgument: short = 257 as short;
      let isEqual: boolean = boxedValue.equals(differentShortArgument);
      expect(isEqual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_0900
     * @tc.name testShortEquals009
     * @tc.desc Verify equals method with string argument for false return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxedValue: Short = new Short(99 as short);
      let stringArgument: string = '99';
      let isEqual: boolean = boxedValue.equals(stringArgument);
      expect(isEqual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_1000
     * @tc.name testShortEquals010
     * @tc.desc Verify equals method with boolean argument for false return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxedValue: Short = new Short(1 as short);
      let booleanArgument: boolean = true;
      let isEqual: boolean = boxedValue.equals(booleanArgument);
      expect(isEqual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_1100
     * @tc.name testShortEquals011
     * @tc.desc Verify equals method with plain object argument for false return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxedValue: Short = new Short(50 as short);
      let plainObjectArgument: Object = new Object();
      let isEqual: boolean = boxedValue.equals(plainObjectArgument);
      expect(isEqual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_1200
     * @tc.name testShortEquals012
     * @tc.desc Verify equals method with self instance argument for reflexive true return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxedValue: Short = new Short(30 as short);
      let isEqual: boolean = boxedValue.equals(boxedValue);
      expect(isEqual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_1300
     * @tc.name testShortEquals013
     * @tc.desc Verify equals method with MIN_VALUE Short instance and same numeric number argument for true return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boundaryValue: Short = new Short(Short.MIN_VALUE);
      let sameNumberArgument: number = -32768;
      let isEqual: boolean = boundaryValue.equals(sameNumberArgument);
      expect(isEqual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_EQUALS_1400
     * @tc.name testShortEquals014
     * @tc.desc Verify equals method with MAX_VALUE and adjacent boxed Short value for false return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortEquals014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxBoundaryValue: Short = new Short(Short.MAX_VALUE);
      let adjacentBoundaryValue: Short = new Short(32766 as short);
      let isEqual: boolean = maxBoundaryValue.equals(adjacentBoundaryValue);
      expect(isEqual).assertFalse();
    });
  });
}
