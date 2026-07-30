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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { Foo } from '../ets/Index';

export default function TcCreateTest(): void {
  describe("TcCreateTest", (): void => {
    try {
      loadLibrary("entry");
    } catch (e) {
      console.log('loadFailed', e.message);
      expect(false).assertTrue();
    }

    /**
     * @tc.number SUB_TC_CREATE_TEST_0100
     * @tc.name testTcCreate0001
     * @tc.desc Verify that ArrayBuffer.isView can be found with the correct mangling and called.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcCreate0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let buffer = new ArrayBuffer(8);
      let view = new Uint8Array(buffer);
      expect(cls.test_CreateArrayBufferIsView(view)).assertTrue();
      expect(cls.test_CreateArrayBufferIsView({})).assertFalse();
    });

    /**
     * @tc.number SUB_TC_CREATE_TEST_0200
     * @tc.name testTcCreate0002
     * @tc.desc Verify that ArrayBuffer constructors can be distinguished by mangling and byteLength can be read.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcCreate0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_CreateArrayBufferByLength(16)).assertEqual(16);
    });

    /**
     * @tc.number SUB_TC_CREATE_TEST_0500
     * @tc.name testTcCreate0005
     * @tc.desc Verify that std.core.Double can be created by Object_New and unboxed.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcCreate0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(Math.abs(cls.test_CreateDoubleObject(3.14159) - 3.14159) < 0.000001).assertTrue();
    });

    /**
     * @tc.number SUB_TC_CREATE_TEST_0600
     * @tc.name testTcCreate0006
     * @tc.desc Verify that Object_New on an interface type follows the failure path.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcCreate0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let caught: boolean = false;
      try {
        cls.test_CreateInterfaceFail();
      } catch (e) {
        caught = true;
        console.log('test_CreateInterfaceFail unexpected exception:', e.message);
      }
      expect(caught).assertFalse();
    });

    /**
     * @tc.number SUB_TC_CREATE_TEST_0700
     * @tc.name testTcCreate0007
     * @tc.desc Verify that Object_New on an abstract class follows the failure path.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcCreate0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let caught: boolean = false;
      try {
        cls.test_CreateAbstractFail();
      } catch (e) {
        caught = true;
        console.log('test_CreateAbstractFail unexpected exception:', e.message);
      }
      expect(caught).assertFalse();
    });

    /**
     * @tc.number SUB_TC_CREATE_TEST_0800
     * @tc.name testTcCreate0008
     * @tc.desc Verify that String Object_New path is exercised and String_NewUTF8 path succeeds.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcCreate0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      cls.test_CreateStringByObjectNew();
      expect(cls.test_CreateStringByUtf8("hello")).assertEqual("hello");
    });

    /**
     * @tc.number SUB_TC_CREATE_TEST_0900
     * @tc.name testTcCreate0009
     * @tc.desc Verify that FixedArray Object_New path is exercised and the special FixedArray API succeeds.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcCreate0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      cls.test_CreateFixedArrayByObjectNew();
      expect(cls.test_CreateFixedArrayBySpecialApi()).assertEqual(6);
    });

    /**
     * @tc.number SUB_TC_CREATE_TEST_1000
     * @tc.name testTcCreate0010
     * @tc.desc Verify that Enum_GetEnumItemByName safely obtains an enum item name.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcCreate0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_CreateEnumItemByName()).assertEqual("GREEN");
    });

    /**
     * @tc.number SUB_TC_CREATE_TEST_1100
     * @tc.name testTcCreate0011
     * @tc.desc Verify that EnumItem_GetValue_Int can read an initialized enum integer value.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcCreate0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_CreateEnumItemIntValue()).assertEqual(404);
    });

    /**
     * @tc.number SUB_TC_CREATE_TEST_1200
     * @tc.name testTcCreate0012
     * @tc.desc Verify that byteLength can be obtained as a property after ArrayBuffer creation.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcCreate0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_CreateGetByteLength(32)).assertEqual(32);
    });

    /**
     * @tc.number SUB_TC_CREATE_TEST_1300
     * @tc.name testTcCreate0013
     * @tc.desc Verify that missing class and missing constructor lookup paths are exercised.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcCreate0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let caught: boolean = false;
      try {
        cls.test_CreateFindMissing();
      } catch (e) {
        caught = true;
        console.log('test_CreateFindMissing unexpected exception:', e.message);
      }
      expect(caught).assertFalse();
    });

    /**
     * @tc.number SUB_TC_CREATE_TEST_1500
     * @tc.name testTcCreate0015
     * @tc.desc Verify that Class_FindMethod can find and call a static method.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcCreate0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let view = new Uint8Array(new ArrayBuffer(8));
      expect(cls.test_CreateFindStaticMethod(view)).assertTrue();
    });

    /**
     * @tc.number SUB_TC_CREATE_TEST_1600
     * @tc.name testTcCreate0016
     * @tc.desc Verify that Class_FindMethod can find and call an ArrayBuffer instance method.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcCreate0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_CreateFindInstanceMethod(8);
      expect(result >= 0).assertTrue();
    });

  });
}
