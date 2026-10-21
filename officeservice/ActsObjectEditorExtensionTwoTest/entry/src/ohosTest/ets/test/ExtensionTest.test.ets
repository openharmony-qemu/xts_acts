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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libentry.so';

const CE_ERR_OK: number = 0;
const CE_ERR_PARAM_INVALID: number = 401;
const CE_ERR_DEVICE_NOT_SUPPORTED: number = 801;
const CE_ERR_NULL_POINTER: number = 35300001;
const CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED: number = 35300002;
const CE_ERR_EXTENSION_ERROR: number = 35300003;
const CE_ERR_SYSTEM_ABNORMAL: number = 35300004;
const CE_ERR_STORAGE_OPERATION_FAILED: number = 35300005;
const CE_ERR_STREAM_OPERATION_FAILED: number = 35300006;
const CE_ERR_FILE_OPERATION_FAILED: number = 35300007;
const CE_ERR_IN_DLP_SANDBOX: number = 35300008;
const CE_ERR_IMAGE_PACKER_OPERATION_FAILED: number = 35300009;
const CE_ERR_CLIENT_CALLBACK_FAILED: number = 35300010;
const CE_ERR_EXTENSION_ABNORMAL_EXIT: number = 35300011;
const CE_ERR_INVALID_LINKING_PATH: number = 35300012;
const CE_ERR_CONNECT_LIMIT_EXCEED: number = 35300013;
const CE_ERR_FILE_NOT_GRANT: number = 35300014;
const CE_ERR_DISK_FULL: number = 35300015;
const CE_ERR_EXTENSION_NOT_SUPPORT: number = 35300016;

export default function extensionTest() {
  describe('ActsCapiExtensionTwoTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnCreateFunc_0100
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnCreateFunc_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnCreateFunc with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnCreateFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnCreateFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnCreateFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result === CE_ERR_OK).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnDestroyFunc_0100
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnDestroyFunc_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnDestroyFunc with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnDestroyFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnDestroyFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnDestroyFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result === CE_ERR_OK).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnObjectAttachFunc_0100
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnObjectAttachFunc_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnObjectAttachFunc with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnObjectAttachFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnObjectAttachFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnObjectAttachFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result === CE_ERR_OK).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionUnRegisterOnObjectAttachFunc_0100
     * @tc.number SUB_Object_Editor_ExtensionUnRegisterOnObjectAttachFunc_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_UnRegisterOnObjectAttachFunc with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionUnRegisterOnObjectAttachFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionUnRegisterOnObjectAttachFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionUnRegisterOnObjectAttachFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result === CE_ERR_OK).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnObjectDetachFunc_0100
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnObjectDetachFunc_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnObjectDetachFunc with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnObjectDetachFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnObjectDetachFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnObjectDetachFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result === CE_ERR_OK).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionUnRegisterOnObjectDetachFunc_0100
     * @tc.number SUB_Object_Editor_ExtensionUnRegisterOnObjectDetachFunc_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_UnRegisterOnObjectDetachFunc with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionUnRegisterOnObjectDetachFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionUnRegisterOnObjectDetachFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionUnRegisterOnObjectDetachFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result === CE_ERR_OK).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnWriteToDataStreamFunc_0100
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnWriteToDataStreamFunc_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnWriteToDataStreamFunc with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnWriteToDataStreamFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnWriteToDataStreamFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnWriteToDataStreamFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result === CE_ERR_OK).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnGetSnapshotFunc_0100
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnGetSnapshotFunc_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnGetSnapshotFunc with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnGetSnapshotFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnGetSnapshotFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnGetSnapshotFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result === CE_ERR_OK).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnDoEditFunc_0100
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnDoEditFunc_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnDoEditFunc with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnDoEditFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnDoEditFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnDoEditFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result === CE_ERR_OK).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnGetEditStatusFunc_0100
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnGetEditStatusFunc_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnGetEditStatusFunc with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnGetEditStatusFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnGetEditStatusFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnGetEditStatusFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result === CE_ERR_OK).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionRegisterOnGetCapabilityFunc_0100
     * @tc.number SUB_Object_Editor_ExtensionRegisterOnGetCapabilityFunc_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnGetCapabilityFunc with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionRegisterOnGetCapabilityFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionRegisterOnGetCapabilityFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnGetCapabilityFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result === CE_ERR_OK).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionGetContext_0100
     * @tc.number SUB_Object_Editor_ExtensionGetContext_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_GetContext with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionGetContext_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionGetContext_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionGetContext_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result === CE_ERR_OK).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionGetExtensionInstance_0100
     * @tc.number SUB_Object_Editor_ExtensionGetExtensionInstance_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_GetExtensionInstance with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionGetExtensionInstance_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionGetExtensionInstance_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionGetExtensionInstance_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result === CE_ERR_OK).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionGetContentEmbedDocument_0100
     * @tc.number SUB_Object_Editor_ExtensionGetContentEmbedDocument_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_GetContentEmbedDocument with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionGetContentEmbedDocument_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionGetContentEmbedDocument_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionGetContentEmbedDocument_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result === CE_ERR_OK).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionCallbackToOnUpdate_0100
     * @tc.number SUB_Object_Editor_ExtensionCallbackToOnUpdate_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_CallbackToOnUpdate with client callback not registered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionCallbackToOnUpdate_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionCallbackToOnUpdate_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionCallbackToOnUpdate_CallbackNotRegistered();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result === CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionCallbackToOnError_0100
     * @tc.number SUB_Object_Editor_ExtensionCallbackToOnError_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_CallbackToOnError with client callback not registered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionCallbackToOnError_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionCallbackToOnError_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionCallbackToOnError_CallbackNotRegistered();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result === CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionCallbackToOnEditingFinished_0100
     * @tc.number SUB_Object_Editor_ExtensionCallbackToOnEditingFinished_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_CallbackToOnEditingFinished with client callback not registered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionCallbackToOnEditingFinished_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionCallbackToOnEditingFinished_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionCallbackToOnEditingFinished_CallbackNotRegistered();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result === CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_ExtensionCallbackToOnExtensionStopped_0100
     * @tc.number SUB_Object_Editor_ExtensionCallbackToOnExtensionStopped_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_CallbackToOnExtensionStopped with empty objects map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_ExtensionCallbackToOnExtensionStopped_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_ExtensionCallbackToOnExtensionStopped_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionCallbackToOnExtensionStopped_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result === CE_ERR_OK).assertTrue();
    })

  })
}
