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
import { Foo, MyError } from '../ets/Index';

export default function TcExceptionTest(): void {
  describe("TcExceptionTest", (): void => {
    try {
      loadLibrary("entry");
    } catch (e) {
      console.log('loadFailed', e.message);
      expect(false).assertTrue();
    }

    /**
     * @tc.number SUB_TC_EXCEPTION_TEST_0200
     * @tc.name testTcException0002
     * @tc.desc Verify that native code can construct and throw a custom MyError instance.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcException0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let caught: boolean = false;
      try {
        cls.test_ExceptionThrowMyError();
      } catch (e) {
        caught = true;
        console.log('caught MyError message:', e.message);
        expect(e instanceof MyError).assertTrue();
        expect(e.message).assertEqual("Native MyError message");
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_TC_EXCEPTION_TEST_0500
     * @tc.name testTcException0005
     * @tc.desc Verify that native code can clear a pending exception and return a default value.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcException0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_ExceptionClearPendingAndReturn();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_TC_EXCEPTION_TEST_0600
     * @tc.name testTcException0006
     * @tc.desc Verify that a native rejected Promise can be caught by ArkTS catch handler.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcException0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let promise = cls.test_ExceptionPromiseRejectWithCatch();
      expect(promise !== null).assertTrue();
      promise.catch((e: Error): void => {
        console.log('caught native promise rejection:', e.message);
        expect(e.message).assertEqual("Promise rejected from native");
      });
    });

    /**
     * @tc.number SUB_TC_EXCEPTION_TEST_0700
     * @tc.name testTcException0007
     * @tc.desc Verify behavior when a native rejected Promise is not caught by ArkTS.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcException0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let promise = cls.test_ExceptionPromiseRejectWithoutCatch();
      expect(promise !== null).assertTrue();
    });

    /**
     * @tc.number SUB_TC_EXCEPTION_TEST_1200
     * @tc.name testTcException0012
     * @tc.desc Verify BusinessError construction behavior in native code and document possible conflict.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcException0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_ExceptionBusinessErrorConflict();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_TC_EXCEPTION_TEST_1400
     * @tc.name testTcException0014
     * @tc.desc Verify that native ResetError clears a pending exception and allows later ANI operations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcException0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_ExceptionClearThenCreateString();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_TC_EXCEPTION_TEST_1500
     * @tc.name testTcException0015
     * @tc.desc Verify that native code can catch, inspect, clear, and analyze a thrown exception.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcException0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let message = cls.test_ExceptionNativeCatchAndAnalyze();
      expect(message).assertEqual("Native analyzed error");
    });
  });
}
