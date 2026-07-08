'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-binary/src/main/indexStatic";
import { Foo } from '../ets/Index';

export default function TcStringTest(): void {
  describe("TcStringTest", (): void => {
    try {
      loadLibrary("entry");
    } catch (e) {
      console.log('loadFailed', e.message);
      expect(false).assertTrue();
    }

    /**
     * @tc.number SUB_TC_STRING_TEST_0100
     * @tc.name testTcString0001
     * @tc.desc Verify that String_NewUTF8 and String_GetUTF8 can round-trip an ASCII string.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcString0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_StringAsciiRoundTrip();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_TC_STRING_TEST_0200
     * @tc.name testTcString0002
     * @tc.desc Verify that an empty string can be converted to ani_string and back.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcString0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_StringEmptyRoundTrip();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_TC_STRING_TEST_0300
     * @tc.name testTcString0003
     * @tc.desc Verify that non-ASCII UTF-8 characters can be converted without corruption.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcString0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_StringUtf8RoundTrip();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_TC_STRING_TEST_0400
     * @tc.name testTcString0004
     * @tc.desc Verify that String_GetUTF8Size returns the expected UTF-8 byte length.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcString0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_StringUtf8Size();
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_TC_STRING_TEST_0500
     * @tc.name testTcString0005
     * @tc.desc Verify that invalid UTF-8 input does not crash String_NewUTF8 and following string APIs.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcString0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_StringInvalidUtf8NoCrash();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_TC_STRING_TEST_0600
     * @tc.name testTcString0006
     * @tc.desc Verify that a long UTF-8 string can be created and read back without data loss.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcString0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_StringLongStringRoundTrip(10485760);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_TC_STRING_TEST_0700
     * @tc.name testTcString0007
     * @tc.desc Verify that an ani_string parameter can be safely read multiple times in native code.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcString0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let source = "This is a long string passed from ArkTS to native. 你好 😀";
      let result = cls.test_StringReadTwice(source);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_TC_STRING_TEST_0800
     * @tc.name testTcString0008
     * @tc.desc Verify String_GetUTF8 behavior when the provided output buffer is too small.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcString0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_StringSmallBuffer();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_TC_STRING_TEST_0900
     * @tc.name testTcString0009
     * @tc.desc Verify that local string references created in a local scope are released after the scope is destroyed.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcString0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_StringLocalScopeRecycle(10000);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_TC_STRING_TEST_1000
     * @tc.name testTcString0010
     * @tc.desc Verify that ani_string can be stored as a global reference and reused across native calls.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcString0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let saved = cls.test_StringSaveGlobalRef();
      expect(saved).assertTrue();

      let value = cls.test_StringUseGlobalRef();
      expect(value).assertEqual("Persistent ANI string");

      let deleted = cls.test_StringDeleteGlobalRef();
      expect(deleted).assertTrue();
    });
  });
}
