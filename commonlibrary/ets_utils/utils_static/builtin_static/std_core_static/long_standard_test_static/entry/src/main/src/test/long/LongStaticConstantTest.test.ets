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
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function LongStaticConstantTest(): void {
  describe('LongStaticConstantTest', () => {
    const SC_NEG_1: long = -1;
    const SC_0: long = 0;
    const SC_8: long = 8;
    const SC_30: int = 30;
    const SC_64: long = 64;
    const SC_STR_MIN: string = "-9223372036854775808";
    const SC_STR_MAX: string = "9223372036854775807";

    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(SC_30);
    });

    afterEach(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_STATIC_CONSTANT_0100
     * @tc.name testLongStaticConstant001
     * @tc.desc Verify Long.MIN_VALUE is less than 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongStaticConstant001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minValue: long = Long.MIN_VALUE;
      expect(minValue < SC_0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_STATIC_CONSTANT_0200
     * @tc.name testLongStaticConstant002
     * @tc.desc Verify Long.MIN_VALUE.toString() returns expected string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongStaticConstant002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.MIN_VALUE.toString()).assertEqual(SC_STR_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_STATIC_CONSTANT_0300
     * @tc.name testLongStaticConstant003
     * @tc.desc Verify Long.MAX_VALUE is greater than 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongStaticConstant003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxValue: long = Long.MAX_VALUE;
      expect(maxValue > SC_0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_STATIC_CONSTANT_0400
     * @tc.name testLongStaticConstant004
     * @tc.desc Verify Long.MAX_VALUE.toString() returns expected string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongStaticConstant004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.MAX_VALUE.toString()).assertEqual(SC_STR_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_STATIC_CONSTANT_0500
     * @tc.name testLongStaticConstant005
     * @tc.desc Verify Long.BIT_SIZE equals 64
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongStaticConstant005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.BIT_SIZE).assertEqual(SC_64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_STATIC_CONSTANT_0600
     * @tc.name testLongStaticConstant006
     * @tc.desc Verify Long.BYTE_SIZE equals 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongStaticConstant006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.BYTE_SIZE).assertEqual(SC_8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_STATIC_CONSTANT_0700
     * @tc.name testLongStaticConstant007
     * @tc.desc Verify Long.BIT_SIZE equals Long.BYTE_SIZE * 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongStaticConstant007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.BIT_SIZE).assertEqual(Long.BYTE_SIZE * SC_8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_STATIC_CONSTANT_0800
     * @tc.name testLongStaticConstant008
     * @tc.desc Verify Long.MIN_VALUE + Long.MAX_VALUE equals -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongStaticConstant008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min: long = Long.MIN_VALUE;
      const max: long = Long.MAX_VALUE;
      expect(min + max).assertEqual(SC_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_STATIC_CONSTANT_0900
     * @tc.name testLongStaticConstant009
     * @tc.desc Verify two Long.MIN_VALUE instances have same toString()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongStaticConstant009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min1: long = Long.MIN_VALUE;
      const min2: long = Long.MIN_VALUE;
      expect(min1.toString()).assertEqual(min2.toString());
    });
  });
}
