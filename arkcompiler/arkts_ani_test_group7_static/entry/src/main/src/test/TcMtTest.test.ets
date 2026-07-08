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

export default function TcMtTest(): void {
  describe("TcMtTest", (): void => {
    try {
      loadLibrary("entry");
    } catch (e) {
      console.log('loadFailed', e.message);
      expect(false).assertTrue();
    }

    /**
     * @tc.number SUB_TC_MT_TEST_0100
     * @tc.name testTcMt0001
     * @tc.desc Verify that native Promise_New can create a promise and resolve it.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMt0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let promise = cls.test_MtCreateAndResolvePromise();
      expect(promise !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_TC_MT_TEST_0200
     * @tc.name testTcMt0002
     * @tc.desc Verify that native Promise_New can create a promise and reject it.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMt0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let promise = cls.test_MtCreateAndRejectPromise();
      expect(promise !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_TC_MT_TEST_0300
     * @tc.name testTcMt0003
     * @tc.desc Verify that a native thread can attach to VM and create or resolve a promise.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMt0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let promise = cls.test_MtAsyncWorkInThread();
      expect(promise !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_TC_MT_TEST_0400
     * @tc.name testTcMt0004
     * @tc.desc Verify that taskpool style native synchronous compute function returns the expected result.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMt0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_MtCompute(21)).assertEqual(42);
    });

    /**
     * @tc.number SUB_TC_MT_TEST_0600
     * @tc.name testTcMt0006
     * @tc.desc Verify that AttachCurrentThread followed by GetEnv returns the same ani_env in the same thread.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMt0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_MtAttachGetEnvSame()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_MT_TEST_0700
     * @tc.name testTcMt0007
     * @tc.desc Verify that attaching native threads without detaching may leak resources.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMt0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_MtAttachWithoutDetach(2)).assertTrue();
    });

    /**
     * @tc.number SUB_TC_MT_TEST_0800
     * @tc.name testTcMt0008
     * @tc.desc Verify local reference accumulation without local scope and stable behavior with local scope.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMt0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_MtLocalRefWithoutScope(10)).assertTrue();
      expect(cls.test_MtLocalRefWithScope(10)).assertTrue();
    });

    /**
     * @tc.number SUB_TC_MT_TEST_0900
     * @tc.name testTcMt0009
     * @tc.desc Verify that multiple native threads attach to the same VM and update an atomic counter correctly.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMt0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_MtConcurrentAttachCounter(4, 25)).assertEqual(100);
    });

    /**
     * @tc.number SUB_TC_MT_TEST_1000
     * @tc.name testTcMt0010
     * @tc.desc Verify whether PromiseResolver_Resolve can be called from a different attached native thread.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMt0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let promise = cls.test_MtResolvePromiseOnOtherThread();
      expect(promise !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_TC_MT_TEST_1100
     * @tc.name testTcMt0011
     * @tc.desc Verify that a native function used by taskpool can safely update shared data with a lock.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMt0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let value = cls.test_MtTaskpoolSafeAdd(5);
      expect(value >= 5).assertTrue();
    });

    /**
     * @tc.number SUB_TC_MT_TEST_1200
     * @tc.name testTcMt0012
     * @tc.desc Verify class lookup behavior in a native attached thread for system and application classes.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcMt0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_MtFindClassInNativeThread();
      expect(result >= 0).assertTrue();
    });
  });
}
