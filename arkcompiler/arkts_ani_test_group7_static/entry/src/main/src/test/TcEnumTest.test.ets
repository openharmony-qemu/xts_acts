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
import { Foo, COLORINT } from '../ets/Index';

export default function TcEnumTest(): void {
  describe("TcEnumTest", (): void => {
    try {
      loadLibrary("entry");
    } catch (e) {
      console.log('loadFailed', e.message);
      expect(false).assertTrue();
    }

    /**
     * @tc.number SUB_TC_ENUM_TEST_0100
     * @tc.name testTcEnum0001
     * @tc.desc Verify that FindEnum and Enum_GetEnumItemByName can get an integer enum item value.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcEnum0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_EnumGetGreenIntByName()).assertEqual(77);
    });

    /**
     * @tc.number SUB_TC_ENUM_TEST_0200
     * @tc.name testTcEnum0002
     * @tc.desc Verify that Enum_GetEnumItemByIndex returns the same enum item as lookup by name.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcEnum0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_EnumGetGreenIntByIndexCompare()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ENUM_TEST_0300
     * @tc.name testTcEnum0003
     * @tc.desc Verify that EnumItem_GetIndex returns the index of an enum item.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcEnum0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_EnumGetBlueIntIndex()).assertEqual(2);
    });

    /**
     * @tc.number SUB_TC_ENUM_TEST_0400
     * @tc.name testTcEnum0004
     * @tc.desc Verify that EnumItem_GetName returns the enum item name.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcEnum0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_EnumGetGreenIntName()).assertEqual("GREENINT");
    });

    /**
     * @tc.number SUB_TC_ENUM_TEST_0500
     * @tc.name testTcEnum0005
     * @tc.desc Verify that EnumItem_GetEnum returns the enum type that owns the enum item.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcEnum0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_EnumGetEnumFromItem()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ENUM_TEST_0600
     * @tc.name testTcEnum0006
     * @tc.desc Verify that EnumItem_GetValue_String gets the value of a string enum item.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcEnum0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_EnumGetColorStringValue()).assertEqual("str_green");
    });

    /**
     * @tc.number SUB_TC_ENUM_TEST_0800
     * @tc.name testTcEnum0008
     * @tc.desc Verify that a module-level enum can be found and its item value can be read.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcEnum0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_EnumFindModuleEnum()).assertEqual(77);
    });

    /**
     * @tc.number SUB_TC_ENUM_TEST_0900
     * @tc.name testTcEnum0009
     * @tc.desc Verify that a namespace enum can be found and its item value can be read.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcEnum0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_EnumFindNamespaceEnum()).assertEqual(22);
    });

    /**
     * @tc.number SUB_TC_ENUM_TEST_1000
     * @tc.name testTcEnum0010
     * @tc.desc Verify that an enum item can be passed to native and another enum item can be returned.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcEnum0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_EnumProcessIntNext(COLORINT.GREENINT)).assertEqual(COLORINT.BLUEINT);
    });

    /**
     * @tc.number SUB_TC_ENUM_TEST_1100
     * @tc.name testTcEnum0011
     * @tc.desc Verify that native can return an enum item to ArkTS.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcEnum0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_EnumReturnBlueInt()).assertEqual(COLORINT.BLUEINT);
    });

    /**
     * @tc.number SUB_TC_ENUM_TEST_1200
     * @tc.name testTcEnum0012
     * @tc.desc Verify that FindEnum returns an error for a missing enum.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcEnum0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_EnumFindMissingEnum()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ENUM_TEST_1300
     * @tc.name testTcEnum0013
     * @tc.desc Verify that Enum_GetEnumItemByName returns an error for a missing enum item.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcEnum0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_EnumFindMissingItem()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ENUM_TEST_1400
     * @tc.name testTcEnum0014
     * @tc.desc Verify that Enum_GetEnumItemByIndex returns an error for an out-of-range index.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcEnum0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_EnumGetItemByOutOfRangeIndex()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ENUM_TEST_1500
     * @tc.name testTcEnum0015
     * @tc.desc Verify that a large integer enum value is read without precision loss.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcEnum0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_EnumGetLargeIntValue()).assertEqual(9999);
    });

    /**
     * @tc.number SUB_TC_ENUM_TEST_1600
     * @tc.name testTcEnum0016
     * @tc.desc Verify that a string enum value containing Unicode characters can be read.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcEnum0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_EnumGetUnicodeStringValue()).assertEqual("中文测试😀");
    });

    /**
     * @tc.number SUB_TC_ENUM_TEST_1700
     * @tc.name testTcEnum0017
     * @tc.desc Verify that native can get the enum type from an input enum item and return another item.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcEnum0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_EnumGetOtherItemFromInput(COLORINT.REDINT)).assertEqual(COLORINT.BLUEINT);
    });

    /**
     * @tc.number SUB_TC_ENUM_TEST_1800
     * @tc.name testTcEnum0018
     * @tc.desc Verify that native can find an enum after the native library is loaded.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcEnum0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_EnumFindAfterLoadLibrary()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ENUM_TEST_1900
     * @tc.name testTcEnum0019
     * @tc.desc Verify that native can read an enum item value and compute a new integer value without mutating the enum item.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcEnum0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_EnumComputeValue(COLORINT.GREENINT)).assertEqual(177);
      expect(COLORINT.GREENINT).assertEqual(77);
    });

    /**
     * @tc.number SUB_TC_ENUM_TEST_2000
     * @tc.name testTcEnum0020
     * @tc.desc Verify that the correct enum descriptor can be found and an incorrect descriptor fails.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcEnum0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_EnumFindByDescriptorFormats()).assertTrue();
    });
  });
}
