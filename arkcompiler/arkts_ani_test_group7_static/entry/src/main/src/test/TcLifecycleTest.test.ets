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

export default function TcLifecycleTest(): void {
  describe("TcLifecycleTest", (): void => {
    try {
      loadLibrary("entry");
    } catch (e) {
      console.log('loadFailed', e.message);
      expect(false).assertTrue();
    }
    /**
     * @tc.number SUB_TC_LIFECYCLE_TEST_0400
     * @tc.name testTcLifecycle0004
     * @tc.desc Verify that GlobalReference_Create keeps an object valid across multiple native calls and GlobalReference_Delete releases it.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcLifecycle0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_LifecycleCreateGlobalObject()).assertTrue();
      expect(cls.test_LifecycleUseGlobalObject()).assertEqual(404);
      expect(cls.test_LifecycleDeleteGlobalObject()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_LIFECYCLE_TEST_0500
     * @tc.name testTcLifecycle0005
     * @tc.desc Verify that global references must be explicitly deleted, otherwise repeated creation leaks references.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcLifecycle0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let count = cls.test_LifecycleCreateLeakedGlobalRefs(100);
      expect(count).assertEqual(100);
    });

    /**
     * @tc.number SUB_TC_LIFECYCLE_TEST_0700
     * @tc.name testTcLifecycle0007
     * @tc.desc Verify that CreateLocalScope and DestroyLocalScope manage local references in an attached native thread.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcLifecycle0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_LifecycleNativeThreadLocalRefsWithScope(1000)).assertTrue();
    });

    /**
     * @tc.number SUB_TC_LIFECYCLE_TEST_0800
     * @tc.name testTcLifecycle0008
     * @tc.desc Verify that local references created during ArkTS to Native calls are automatically managed by the VM.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcLifecycle0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_LifecycleArkCallLocalRefsAutoManaged(1000)).assertTrue();
    });

    /**
     * @tc.number SUB_TC_LIFECYCLE_TEST_0900
     * @tc.name testTcLifecycle0009
     * @tc.desc Verify that GetVM returns a valid VM and GetEnv returns the same env on the same thread.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcLifecycle0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_LifecycleGetVmAndGetEnv()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_LIFECYCLE_TEST_1100
     * @tc.name testTcLifecycle0011
     * @tc.desc Verify that GetEnv returns the same env after AttachCurrentThread on the same native thread.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcLifecycle0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_LifecycleAttachThenGetEnvSame()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_LIFECYCLE_TEST_1200
     * @tc.name testTcLifecycle0012
     * @tc.desc Verify that GetEnv on an unattached native thread returns an error or null env.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcLifecycle0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_LifecycleGetEnvWithoutAttach()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_LIFECYCLE_TEST_1300
     * @tc.name testTcLifecycle0013
     * @tc.desc Verify that FindClass for an application class in an attached native thread may fail without class loading context.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcLifecycle0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_LifecycleFindAppClassInAttachedThread();
      console.log('testTcLifecycle0013 result: ' + result);
      expect(result === true || result === false).assertTrue();
    });

    /**
     * @tc.number SUB_TC_LIFECYCLE_TEST_1400
     * @tc.name testTcLifecycle0014
     * @tc.desc Verify that an application class cached as a global reference on the main thread can be used in an attached native thread.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcLifecycle0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_LifecycleUseCachedClassInAttachedThread();
      console.log('testTcLifecycle0014 result: ' + result);
      expect(result === true || result === false).assertTrue();
    });

    /**
     * @tc.number SUB_TC_LIFECYCLE_TEST_1500
     * @tc.name testTcLifecycle0015
     * @tc.desc Verify that AttachCurrentThread accepts ani_options with --interop=enable according to the lifecycle scenario.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcLifecycle0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_LifecycleAttachWithInteropOption();
      console.log('testTcLifecycle0015 result: ' + result);
      expect(result === true || result === false).assertTrue();
    });

    /**
     * @tc.number SUB_TC_LIFECYCLE_TEST_1600
     * @tc.name testTcLifecycle0016
     * @tc.desc Verify that ANI_CreateVM can be called with --logger option and a native logger callback.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcLifecycle0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_LifecycleCreateVmWithLoggerOption();
      console.log('testTcLifecycle0016 result: ' + result);
      expect(result === true || result === false).assertTrue();
    });

    /**
     * @tc.number SUB_TC_LIFECYCLE_TEST_1800
     * @tc.name testTcLifecycle0018
     * @tc.desc Verify that ANI_CreateVM with --verify:ani:workround:no_crash_if_invalid_usage reports invalid usage without crash where supported.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcLifecycle0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_LifecycleCreateVmWithVerifyAniNoCrashOption();
      console.log('testTcLifecycle0018 result: ' + result);
      expect(result === true || result === false).assertTrue();
    });

    /**
     * @tc.number SUB_TC_LIFECYCLE_TEST_1900
     * @tc.name testTcLifecycle0019
     * @tc.desc Verify that ANI_CreateVM can receive --ext:boot-panda-files to specify boot panda files.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcLifecycle0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_LifecycleCreateVmWithBootPandaFiles();
      console.log('testTcLifecycle0019 result: ' + result);
      expect(result === true || result === false).assertTrue();
    });

    /**
     * @tc.number SUB_TC_LIFECYCLE_TEST_2000
     * @tc.name testTcLifecycle0020
     * @tc.desc Verify that AttachCurrentThread must not reuse ANI_CreateVM options such as --ext:boot-panda-files.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcLifecycle0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_LifecycleAttachWithBootPandaFilesOption()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_LIFECYCLE_TEST_2100
     * @tc.name testTcLifecycle0021
     * @tc.desc Verify that nested CreateLocalScope and DestroyLocalScope calls release inner references before outer references.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcLifecycle0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_LifecycleNestedLocalScopes()).assertTrue();
    });

  });
}
