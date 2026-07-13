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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function LongToLong2Test(): void {
  describe('LongToLong2Test', () => {

    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    const TL2_LARGE_NEG: long = -922337203685477580;
    const TL2_NEG_500: long = -500;
    const TL2_NEG_1: long = -1;
    const TL2_0: long = 0;
    const TL2_1: long = 1;
    const TL2_256: long = 256;
    const TL2_500: long = 500;
    const TL2_LARGE_POS: long = 922337203685477580;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG2_0100
     * @tc.name testLongToLong2001
     * @tc.desc Verify Long.toLong(TL2_256) basic → 256
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLong2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.toLong(TL2_256);
      expect(result).assertEqual(TL2_256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG2_0200
     * @tc.name testLongToLong2002
     * @tc.desc Verify Long.toLong(TL2_0) → 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLong2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.toLong(TL2_0);
      expect(result).assertEqual(TL2_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG2_0300
     * @tc.name testLongToLong2003
     * @tc.desc Verify Long.toLong(TL2_500) positive → 500
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLong2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.toLong(TL2_500);
      expect(result).assertEqual(TL2_500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG2_0400
     * @tc.name testLongToLong2004
     * @tc.desc Verify Long.toLong(TL2_NEG_500) negative → -500
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLong2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.toLong(TL2_NEG_500);
      expect(result).assertEqual(TL2_NEG_500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG2_0500
     * @tc.name testLongToLong2005
     * @tc.desc Verify Long.toLong(TL2_1) → 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLong2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.toLong(TL2_1);
      expect(result).assertEqual(TL2_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG2_0600
     * @tc.name testLongToLong2006
     * @tc.desc Verify Long.toLong(TL2_NEG_1) → -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLong2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.toLong(TL2_NEG_1);
      expect(result).assertEqual(TL2_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG2_0700
     * @tc.name testLongToLong2007
     * @tc.desc Verify Long.toLong(TL2_LARGE_POS) large positive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLong2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.toLong(TL2_LARGE_POS);
      expect(result).assertEqual(TL2_LARGE_POS);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG2_0800
     * @tc.name testLongToLong2008
     * @tc.desc Verify Long.toLong(TL2_LARGE_NEG) large negative
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLong2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.toLong(TL2_LARGE_NEG);
      expect(result).assertEqual(TL2_LARGE_NEG);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG2_0900
     * @tc.name testLongToLong2009
     * @tc.desc Verify Long.toLong(Long.MAX_VALUE) returns MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLong2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.toLong(Long.MAX_VALUE);
      expect(result).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG2_1000
     * @tc.name testLongToLong2010
     * @tc.desc Verify Long.toLong(Long.MIN_VALUE) returns MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLong2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.toLong(Long.MIN_VALUE);
      expect(result).assertEqual(Long.MIN_VALUE);
    });
  });
}
