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

export default function TcErrorCodeTest(): void {
  describe("TcErrorCodeTest", (): void => {
    try {
      loadLibrary("entry");
    } catch (e) {
      console.log('loadFailed', e.message);
      expect(false).assertTrue();
    }

    /**
     * @tc.number SUB_TC_ERRORCODE_TEST_0100
     * @tc.name testTcErrorCode0001
     * @tc.desc Verify that passing a null ani_env pointer returns ANI_INVALID_ARGS.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcErrorCode0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      expect(foo.test_ErrorCodeNullEnv()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ERRORCODE_TEST_0200
     * @tc.name testTcErrorCode0002
     * @tc.desc Verify that a pending error can be detected and described after a failing ANI call.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcErrorCode0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      expect(foo.test_ErrorCodePendingErrorInfo()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ERRORCODE_TEST_0300
     * @tc.name testTcErrorCode0003
     * @tc.desc Verify that subsequent ANI calls continue to fail while an error is pending.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcErrorCode0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      expect(foo.test_ErrorCodePendingErrorPropagation()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ERRORCODE_TEST_0400
     * @tc.name testTcErrorCode0004
     * @tc.desc Verify that normal ANI calls can execute after a previous error has been caught and cleared.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcErrorCode0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      expect(foo.test_ErrorCodeNormalAfterCatch()).assertEqual(100);
    });

    /**
     * @tc.number SUB_TC_ERRORCODE_TEST_0500
     * @tc.name testTcErrorCode0005
     * @tc.desc Verify that lookup failures return a not-found style status.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcErrorCode0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      expect(foo.test_ErrorCodeNotFound()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ERRORCODE_TEST_0600
     * @tc.name testTcErrorCode0006
     * @tc.desc Verify that a declaration descriptor mismatch causes method lookup failure.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcErrorCode0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      expect(foo.test_ErrorCodeDescriptorMismatch()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ERRORCODE_TEST_0700
     * @tc.name testTcErrorCode0007
     * @tc.desc Verify that using a null signature for overloaded methods reports ambiguity.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcErrorCode0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      expect(foo.test_ErrorCodeAmbiguousFindMethod()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ERRORCODE_TEST_0800
     * @tc.name testTcErrorCode0008
     * @tc.desc Verify that Array_Get with an out-of-range index reports an out-of-range style error.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcErrorCode0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      expect(foo.test_ErrorCodeArrayOutOfRange()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ERRORCODE_TEST_0900
     * @tc.name testTcErrorCode0009
     * @tc.desc Verify that String_GetUTF8 with a small buffer reports a buffer-too-small style error.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcErrorCode0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      expect(foo.test_ErrorCodeBufferTooSmall()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ERRORCODE_TEST_1200
     * @tc.name testTcErrorCode0012
     * @tc.desc Verify that GetEnv with an unsupported ANI version returns an invalid-version style status.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcErrorCode0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      expect(foo.test_ErrorCodeInvalidVersion()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ERRORCODE_TEST_1300
     * @tc.name testTcErrorCode0013
     * @tc.desc Verify that an invalid descriptor causes descriptor validation failure.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcErrorCode0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      expect(foo.test_ErrorCodeInvalidDescriptor()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ERRORCODE_TEST_1400
     * @tc.name testTcErrorCode0014
     * @tc.desc Verify that binding the same native function twice returns an already-bound style status.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcErrorCode0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let foo = new Foo();
      expect(foo.test_ErrorCodeAlreadyBinded()).assertTrue();
    });
  });
}
