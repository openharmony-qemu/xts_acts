'use static';
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
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../hypium/index';
import Utils from './../../Util.test';

function getString(): String {
  return new String("FuncReturn");
}

export default function StringToString2Test(): void {
  describe('StringToString2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING2_0100
     * @tc.name testToString001
     * @tc.desc Verify toString() on string literal returns string primitive type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let literal: string = "ArkTS";
      let result: string = literal.toString();
      expect(result.toString()).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING2_0200
     * @tc.name testToString002
     * @tc.desc Verify toString() on new String() returns string type with instanceof String true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strObj: String = new String("ArkTS");
      let result: String = strObj.toString();
      expect(result.toString()).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING2_0300
     * @tc.name testToString003
     * @tc.desc Verify toString() on function-returned String object returns correct content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: String = getString().toString();
      expect(result.toString()).assertEqual("FuncReturn");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING2_0400
     * @tc.name testToString004
     * @tc.desc Verify chained toString().charAt() correctly accesses each character position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ArkTS");
      expect(str.toString().charAt(0)).assertEqual(c'A');
      expect(str.toString().charAt(1)).assertEqual(c'r');
      expect(str.toString().charAt(4)).assertEqual(c'S');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING2_0500
     * @tc.name testToString005
     * @tc.desc Verify chained toString().getLength() returns correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ArkTS");
      expect(str.toString().getLength()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING2_0600
     * @tc.name testToString006
     * @tc.desc Verify triple toString() chain returns correct content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("DoubleToString");
      expect(str.toString().toString().toString()).assertEqual("DoubleToString");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING2_0700
     * @tc.name testToString007
     * @tc.desc Verify multiple toString() and valueOf() calls produce consistent results and same typeof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ArkTS");
      let ts1: String = str.toString();
      let vo1: String = str.valueOf();
      let ts2: String = str.toString();
      let vo2: String = str.valueOf();
      expect(ts1.toString()).assertEqual(vo1.toString());
      expect(ts2.toString()).assertEqual(vo2.toString());
      expect(ts1.toString()).assertEqual(ts2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING2_0800
     * @tc.name testToString008
     * @tc.desc Verify toString idempotence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "test";
      expect(str.toString().toString()).assertEqual(str.toString());
    });
    });
}