'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function vmManagementTest(): void {

  describe("ActsVmManagementTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_TC_ANI_AC_0100
     * @tc.name      test_VmCreateVM_Normal
     * @tc.desc      Verify ANI_CreateVM with normal parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_VmCreateVM_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_VmCreateVM_Normal start');
      let cls = new Foo();
      let result = cls.test_VmCreateVM_Normal();
      expect(result).assertEqual(1);
      console.log('test_VmCreateVM_Normal done');
      done();
    });

    /**
     * @tc.number    SUB_TC_ANI_AC_0200
     * @tc.name      test_VmCreateVM_Abnormal
     * @tc.desc      Verify ANI_CreateVM with abnormal parameters (nullptr).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_VmCreateVM_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_VmCreateVM_Abnormal start');
      let cls = new Foo();
      let result = cls.test_VmCreateVM_Abnormal();
      expect(result).assertEqual(1);
      console.log('test_VmCreateVM_Abnormal done');
      done();
    });

    /**
     * @tc.number    SUB_TC_ANI_AG_0100
     * @tc.name      test_VmGetCreatedVMs_Normal
     * @tc.desc      Verify ANI_GetCreatedVMs with normal parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_VmGetCreatedVMs_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_VmGetCreatedVMs_Normal start');
      let cls = new Foo();
      let result = cls.test_VmGetCreatedVMs_Normal();
      expect(result).assertEqual(1);
      console.log('test_VmGetCreatedVMs_Normal done');
      done();
    });

    /**
     * @tc.number    SUB_TC_ANI_AG_0200
     * @tc.name      test_VmGetCreatedVMs_Abnormal
     * @tc.desc      Verify ANI_GetCreatedVMs with abnormal parameters (nullptr).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_VmGetCreatedVMs_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_VmGetCreatedVMs_Abnormal start');
      let cls = new Foo();
      let result = cls.test_VmGetCreatedVMs_Abnormal();
      expect(result).assertEqual(1);
      console.log('test_VmGetCreatedVMs_Abnormal done');
      done();
    });

    /**
     * @tc.number    SUB_TC_ANI_AC_0600
     * @tc.name      test_Vm_Constructor_Normal
     * @tc.desc      Verify ANI_Constructor with normal parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Vm_Constructor_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Vm_Constructor_Normal start');
      let cls = new Foo();
      let result = cls.test_Vm_Constructor_Normal();
      expect(result).assertEqual(1);
      console.log('test_Vm_Constructor_Normal done');
      done();
    });

    /**
     * @tc.number    SUB_TC_ANI_AD_0100
     * @tc.name      test_Vm_Destructor_Normal
     * @tc.desc      Verify ANI_Destructor with normal parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Vm_Destructor_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Vm_Destructor_Normal start');
      let cls = new Foo();
      let result = cls.test_Vm_Destructor_Normal();
      expect(result).assertEqual(1);
      console.log('test_Vm_Destructor_Normal done');
      done();
    });

    /**
     * @tc.number    SUB_TC_ANI_D_0100
     * @tc.name      test_VmDestroyVM_Normal
     * @tc.desc      Verify DestroyVM with normal parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_VmDestroyVM_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_VmDestroyVM_Normal start');
      let cls = new Foo();
      let result = cls.test_VmDestroyVM_Normal();
      expect(result).assertEqual(1);
      console.log('test_VmDestroyVM_Normal done');
      done();
    });

    /**
     * @tc.number    SUB_TC_ANI_D_0200
     * @tc.name      test_VmDestroyVM_Abnormal
     * @tc.desc      Verify DestroyVM with abnormal parameters (nullptr vm).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_VmDestroyVM_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_VmDestroyVM_Abnormal start');
      let cls = new Foo();
      let result = cls.test_VmDestroyVM_Abnormal();
      expect(result).assertEqual(1);
      console.log('test_VmDestroyVM_Abnormal done');
      done();
    });

    /**
     * @tc.number    SUB_TC_ANI_G_0100
     * @tc.name      test_VmGetEnv_Normal
     * @tc.desc      Verify GetEnv with normal parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_VmGetEnv_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_VmGetEnv_Normal start');
      let cls = new Foo();
      let result = cls.test_VmGetEnv_Normal();
      expect(result).assertEqual(1);
      console.log('test_VmGetEnv_Normal done');
      done();
    });

    /**
     * @tc.number    SUB_TC_ANI_G_0200
     * @tc.name      test_VmGetEnv_Abnormal
     * @tc.desc      Verify GetEnv with abnormal parameters (invalid version).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_VmGetEnv_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_VmGetEnv_Abnormal start');
      let cls = new Foo();
      let result = cls.test_VmGetEnv_Abnormal();
      expect(result).assertEqual(1);
      console.log('test_VmGetEnv_Abnormal done');
      done();
    });

    /**
     * @tc.number    SUB_TC_ANI_A_0100
     * @tc.name      test_VmAttachCurrentThread_Normal
     * @tc.desc      Verify AttachCurrentThread with normal parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_VmAttachCurrentThread_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_VmAttachCurrentThread_Normal start');
      let cls = new Foo();
      let result = cls.test_VmAttachCurrentThread_Normal();
      expect(result).assertEqual(1);
      console.log('test_VmAttachCurrentThread_Normal done');
      done();
    });

    /**
     * @tc.number    SUB_TC_ANI_A_0200
     * @tc.name      test_VmAttachCurrentThread_Abnormal
     * @tc.desc      Verify AttachCurrentThread with abnormal parameters (nullptr result).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_VmAttachCurrentThread_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_VmAttachCurrentThread_Abnormal start');
      let cls = new Foo();
      let result = cls.test_VmAttachCurrentThread_Abnormal();
      expect(result).assertEqual(1);
      console.log('test_VmAttachCurrentThread_Abnormal done');
      done();
    });

    /**
     * @tc.number    SUB_TC_ANI_D_0600
     * @tc.name      test_VmDetachCurrentThread_Normal
     * @tc.desc      Verify DetachCurrentThread with normal parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_VmDetachCurrentThread_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_VmDetachCurrentThread_Normal start');
      let cls = new Foo();
      let result = cls.test_VmDetachCurrentThread_Normal();
      expect(result).assertEqual(1);
      console.log('test_VmDetachCurrentThread_Normal done');
      done();
    });

    /**
     * @tc.number    SUB_TC_ANI_D_0700
     * @tc.name      test_VmDetachCurrentThread_Abnormal
     * @tc.desc      Verify DetachCurrentThread with abnormal parameters (without attach).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_VmDetachCurrentThread_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_VmDetachCurrentThread_Abnormal start');
      let cls = new Foo();
      let result = cls.test_VmDetachCurrentThread_Abnormal();
      expect(result).assertEqual(1);
      console.log('test_VmDetachCurrentThread_Abnormal done');
      done();
    });

    /**
     * @tc.number    SUB_TC_ANI_BV_GE_0100
     * @tc.name      test_VmGetEnv_VersionZero
     * @tc.desc      Verify GetEnv boundary value: version=0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_VmGetEnv_VersionZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_VmGetEnv_VersionZero start');
      let cls = new Foo();
      let result = cls.test_VmGetEnv_VersionZero();
      expect(result).assertEqual(1);
      console.log('test_VmGetEnv_VersionZero done');
      done();
    });

    /**
     * @tc.number    SUB_TC_ANI_BV_GE_0200
     * @tc.name      test_VmGetEnv_VersionMax
     * @tc.desc      Verify GetEnv boundary value: version=0xFFFF.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_VmGetEnv_VersionMax", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_VmGetEnv_VersionMax start');
      let cls = new Foo();
      let result = cls.test_VmGetEnv_VersionMax();
      expect(result).assertEqual(1);
      console.log('test_VmGetEnv_VersionMax done');
      done();
    });

    /**
     * @tc.number    SUB_TC_ANI_BV_ACT_0100
     * @tc.name      test_VmAttach_VersionZero
     * @tc.desc      Verify AttachCurrentThread boundary value: version=0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_VmAttach_VersionZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_VmAttach_VersionZero start');
      let cls = new Foo();
      let result = cls.test_VmAttach_VersionZero();
      expect(result).assertEqual(1);
      console.log('test_VmAttach_VersionZero done');
      done();
    });

    /**
     * @tc.number    SUB_TC_ANI_BV_ACT_0200
     * @tc.name      test_VmAttach_VersionMax
     * @tc.desc      Verify AttachCurrentThread boundary value: version=0xFFFF.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_VmAttach_VersionMax", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_VmAttach_VersionMax start');
      let cls = new Foo();
      let result = cls.test_VmAttach_VersionMax();
      expect(result).assertEqual(1);
      console.log('test_VmAttach_VersionMax done');
      done();
    });

    /**
     * @tc.number    SUB_TC_ANI_BV_AGCV_0100
     * @tc.name      test_VmGetCreatedVMs_BufferZero
     * @tc.desc      Verify ANI_GetCreatedVMs boundary value: buffer_length=0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_VmGetCreatedVMs_BufferZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_VmGetCreatedVMs_BufferZero start');
      let cls = new Foo();
      let result = cls.test_VmGetCreatedVMs_BufferZero();
      expect(result).assertEqual(1);
      console.log('test_VmGetCreatedVMs_BufferZero done');
      done();
    });

    /**
     * @tc.number    SUB_TC_ANI_BV_AGCV_0200
     * @tc.name      test_VmGetCreatedVMs_BufferSmall
     * @tc.desc      Verify ANI_GetCreatedVMs boundary value: buffer too small.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_VmGetCreatedVMs_BufferSmall", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_VmGetCreatedVMs_BufferSmall start');
      let cls = new Foo();
      let result = cls.test_VmGetCreatedVMs_BufferSmall();
      expect(result).assertEqual(1);
      console.log('test_VmGetCreatedVMs_BufferSmall done');
      done();
    });

    /**
     * @tc.number    SUB_TC_ANI_BV_DCT_0100
     * @tc.name      test_VmDetachWithoutAttach_BV
     * @tc.desc      Verify DetachCurrentThread boundary value: detach without attach.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_VmDetachWithoutAttach_BV", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_VmDetachWithoutAttach_BV start');
      let cls = new Foo();
      let result = cls.test_VmDetachWithoutAttach_BV();
      expect(result).assertEqual(1);
      console.log('test_VmDetachWithoutAttach_BV done');
      done();
    });

    /**
     * @tc.number    SUB_TC_ANI_BV_DCT_0200
     * @tc.name      test_VmRepeatDetach_BV
     * @tc.desc      Verify DetachCurrentThread boundary value: repeat detach.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_VmRepeatDetach_BV", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_VmRepeatDetach_BV start');
      let cls = new Foo();
      let result = cls.test_VmRepeatDetach_BV();
      expect(result).assertEqual(1);
      console.log('test_VmRepeatDetach_BV done');
      done();
    });

    /**
     * @tc.number    SUB_TC_ANI_BV_ACT_0300
     * @tc.name      test_VmRepeatAttach_BV
     * @tc.desc      Verify AttachCurrentThread boundary value: repeat attach.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_VmRepeatAttach_BV", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_VmRepeatAttach_BV start');
      let cls = new Foo();
      let result = cls.test_VmRepeatAttach_BV();
      expect(result).assertEqual(1);
      console.log('test_VmRepeatAttach_BV done');
      done();
    });

    /**
     * @tc.number    SUB_TC_ANI_BV_DVM_0100
     * @tc.name      test_VmDestroyVM_WithAttachedThread
     * @tc.desc      Verify DestroyVM boundary value: destroy VM with attached thread.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_VmDestroyVM_WithAttachedThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_VmDestroyVM_WithAttachedThread start');
      let cls = new Foo();
      let result = cls.test_VmDestroyVM_WithAttachedThread();
      expect(result).assertEqual(1);
      console.log('test_VmDestroyVM_WithAttachedThread done');
      done();
    });
  })
}
