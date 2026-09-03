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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function longParseInt1Test(): void {
  describe('LongParseInt1Test', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSEINT1_0100
     * @tc.name testLongParseInt1_001
     * @tc.desc Verify Long.parseInt('000FF', 16) returns 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongParseInt1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ret: long = Long.parseInt('000FF', 16);
      expect(ret).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSEINT1_0200
     * @tc.name testLongParseInt1_002
     * @tc.desc Verify Long.parseInt('00001111', 2) returns 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongParseInt1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ret: long = Long.parseInt('00001111', 2);
      expect(ret).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSEINT1_0300
     * @tc.name testLongParseInt1_003
     * @tc.desc Verify Long.parseInt with invalid radix -1 throws ArgumentOutOfRangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongParseInt1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Long.parseInt("FF", -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArgumentOutOfRangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSEINT1_0400
     * @tc.name testLongParseInt1_004
     * @tc.desc Verify Long.parseInt parses string with radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongParseInt1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: long = Long.parseInt("36", 10);
      const base36: long = Long.parseInt("100", 36);
      expect(dec).assertEqual(36);
      expect(base36).assertEqual(1296);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSEINT1_0500
     * @tc.name testLongParseInt1_005
     * @tc.desc Verify Long.parseInt decimal and binary forms yield equal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongParseInt1_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: long = Long.parseInt("2", 10);
      const bin: long = Long.parseInt("10", 2);
      expect(dec).assertEqual(bin);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSEINT1_0600
     * @tc.name testLongParseInt1_006
     * @tc.desc Verify Long.parseInt("y", 35) equals "34" parsed in decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongParseInt1_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val35: long = Long.parseInt("y", 35);
      const val10: long = Long.parseInt("34", 10);
      expect(val35).assertEqual(val10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSEINT1_0700
     * @tc.name testLongParseInt1_007
     * @tc.desc Verify Long.parseInt radix-34 and decimal forms yield equal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongParseInt1_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val34: long = Long.parseInt("x", 34);
      const val10: long = Long.parseInt("33", 10);
      expect(val34).assertEqual(val10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSEINT1_0800
     * @tc.name testLongParseInt1_008
     * @tc.desc Verify Long.parseInt with radix 0 parses string as decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongParseInt1_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt('123', 0);
      expect(result).assertEqual(123);
    });

  });
}
