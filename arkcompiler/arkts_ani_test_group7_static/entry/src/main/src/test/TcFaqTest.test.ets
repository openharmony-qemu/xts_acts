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

export default function TcFaqTest(): void {
  describe("TcFaqTest", (): void => {
    try {
      loadLibrary("entry");
    } catch (e) {
      console.log('loadFailed', e.message);
      expect(false).assertTrue();
    }

    /**
     * @tc.number SUB_TC_FAQ_TEST_0100
     * @tc.name testTcFaq0001
     * @tc.desc Verify that BusinessError may be unavailable or conflicting while escompat.Error can be used.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFaq0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      expect(foo.test_FaqBusinessErrorConflict()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FAQ_TEST_0300
     * @tc.name testTcFaq0003
     * @tc.desc Verify that declaration mismatch causes method lookup failure.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFaq0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      expect(foo.test_FaqDeclarationMismatch()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FAQ_TEST_0400
     * @tc.name testTcFaq0004
     * @tc.desc Verify that ani_boolean should be converted to int when printed.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFaq0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      expect(foo.test_FaqBooleanPrint()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FAQ_TEST_0500
     * @tc.name testTcFaq0005
     * @tc.desc Verify that primitive values must be boxed before they are used as ani_ref.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFaq0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      expect(foo.test_FaqBoxPrimitiveToRef(42)).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FAQ_TEST_0600
     * @tc.name testTcFaq0006
     * @tc.desc Verify native function address logging for different ETS functions.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFaq0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      expect(foo.test_FaqNativeFunctionAddressReuse()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FAQ_TEST_0700
     * @tc.name testTcFaq0007
     * @tc.desc Verify that function object equality should be checked through Reference_StrictEquals.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFaq0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      let callback = (): void => {};
      expect(foo.test_FaqCompareFunctions(callback, callback)).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FAQ_TEST_0800
     * @tc.name testTcFaq0008
     * @tc.desc Verify Reference_StrictEquals behavior for strings and custom objects.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFaq0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      expect(foo.test_FaqReferenceStrictEquals()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FAQ_TEST_0900
     * @tc.name testTcFaq0009
     * @tc.desc Verify String_GetUTF8SubString behavior when a UTF-8 character is truncated.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFaq0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      expect(foo.test_FaqUtf8SubStringTruncate()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FAQ_TEST_1100
     * @tc.name testTcFaq0011
     * @tc.desc Verify resolving a Promise with undefined for the Promise<void> style FAQ case.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFaq0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      let promise = foo.test_FaqPromiseVoidResolve();
      expect(promise !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FAQ_TEST_1300
     * @tc.name testTcFaq0013
     * @tc.desc Verify that a namespace-style native function with optional parameters must not receive an extra object parameter.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFaq0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      expect(foo.test_FaqNamespaceOptionalParam()).assertTrue();
      expect(foo.test_FaqNamespaceOptionalParam(100)).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FAQ_TEST_1400
     * @tc.name testTcFaq0014
     * @tc.desc Verify that a namespace-style native function with a union parameter must not receive an extra object parameter.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFaq0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      expect(foo.test_FaqNamespaceUnionParam("hello")).assertTrue();
      expect(foo.test_FaqNamespaceUnionParam(123)).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FAQ_TEST_1500
     * @tc.name testTcFaq0015
     * @tc.desc Verify that calling a declared but unbound native function throws an error.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFaq0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      let caught = false;
      try {
        foo.test_FaqUnboundNative();
      } catch (e) {
        caught = true;
        console.log('Caught expected unbound native error: ' + e.message);
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FAQ_TEST_1600
     * @tc.name testTcFaq0016
     * @tc.desc Verify that Record.keys lookup with a null signature may be ambiguous and exact signature lookup is required.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFaq0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      expect(foo.test_FaqRecordKeysAmbiguous()).assertTrue();
    });
  });
}
