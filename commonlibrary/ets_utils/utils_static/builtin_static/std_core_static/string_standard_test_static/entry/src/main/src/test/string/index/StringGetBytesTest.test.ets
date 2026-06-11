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
} from '../../../../../hypium/index';
import Utils from './../../Util.test';

export default function StringGetBytesTest(): void {
  describe('StringGetBytesTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_0100
     * @tc.name testGetBytes001
     * @tc.desc Verify getBytes(0, length) on 5 ASCII chars returns 5 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_0200
     * @tc.name testGetBytes002
     * @tc.desc Verify getBytes(0, 0) on empty string returns empty byte array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let bytes: byte[] = text.getBytes(0, 0);
      expect(bytes.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_0300
     * @tc.name testGetBytes003
     * @tc.desc Verify getBytes(0, length) on 2 CJK chars returns byte count equal to code unit count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("你好");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_0400
     * @tc.name testGetBytes004
     * @tc.desc Verify getBytes(0, 2) partial range on "ABCD" returns 2 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCD");
      let bytes: byte[] = text.getBytes(0, 2);
      expect(bytes.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_0500
     * @tc.name testGetBytes005
     * @tc.desc Verify getBytes(0, length) on single ASCII char returns 1 byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Z");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_0600
     * @tc.name testGetBytes006
     * @tc.desc Verify getBytes(0, length) on emoji returns 2 bytes as surrogate pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_0700
     * @tc.name testGetBytes007
     * @tc.desc Verify getBytes(0, length) on 3 pure ASCII chars returns exactly 3 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_0800
     * @tc.name testGetBytes008
     * @tc.desc Verify getBytes(0, length) on ISO 8859-1 Latin precomposed é returns 1 byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("é");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_0900
     * @tc.name testGetBytes009
     * @tc.desc Verify getBytes(0, length) mixed ASCII plus CJK plus emoji returns 4 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A中😀");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_1000
     * @tc.name testGetBytes010
     * @tc.desc Verify getBytes(0, length) on C0 control characters newline and tab returns 2 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\n\t");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_1100
     * @tc.name testGetBytes011
     * @tc.desc Verify getBytes(0, length) on GBK Chinese text returns 2 bytes for 2 chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_1200
     * @tc.name testGetBytes012
     * @tc.desc Verify getBytes(0, length) on combining character sequence returns 2 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("é");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_1300
     * @tc.name testGetBytes013
     * @tc.desc Verify getBytes(2, 2) on non-empty string returns empty byte array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let bytes: byte[] = text.getBytes(2, 2);
      expect(bytes.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_1400
     * @tc.name testGetBytes014
     * @tc.desc Verify getBytes(0, length) with dynamic variables returns correct byte count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Node");
      let start: int = 0;
      let end: int = text.length;
      let bytes: byte[] = text.getBytes(start, end);
      expect(bytes.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_1500
     * @tc.name testGetBytes015
     * @tc.desc Verify getBytes() with negative begin throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      try {
        let bytes: byte[] = text.getBytes(-1, 2);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("StringIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_1600
     * @tc.name testGetBytes016
     * @tc.desc Verify getBytes() with end beyond length throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      try {
        let bytes: byte[] = text.getBytes(0, 10);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("StringIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_1700
     * @tc.name testGetBytes017
     * @tc.desc Verify getBytes() with begin greater than end throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      try {
        let bytes: byte[] = text.getBytes(3, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("StringIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_1800
     * @tc.name testGetBytes018
     * @tc.desc Verify getBytes(1, length) returns bytes after first ASCII character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let bytes: byte[] = text.getBytes(1, text.length);
      expect(bytes.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_1900
     * @tc.name testGetBytes019
     * @tc.desc Verify getBytes(length, length) returns empty array at end boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let bytes: byte[] = text.getBytes(text.length, text.length);
      expect(bytes.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_2000
     * @tc.name testGetBytes020
     * @tc.desc Verify getBytes(0, 1) on emoji returns high-surrogate byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("馃榾");
      let bytes: byte[] = text.getBytes(0, 1);
      expect(bytes.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_2100
     * @tc.name testGetBytes021
     * @tc.desc Verify getBytes() range includes C0 control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\n\t");
      let bytes: byte[] = text.getBytes(1, text.length);
      expect(bytes.length).assertEqual(2);
    });
  });
}
